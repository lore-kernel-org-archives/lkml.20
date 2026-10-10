Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6E2D7DD7;
	Sat, 10 Oct 2026 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599384; cv=none; b=ptr3Sh/4E9hmatFIZsYqV/zRscNrUj3x8782txpbQQH0DcROVJ+NOQE80+3b5ivwj0zP3WjDN6VEEI+CcxkaGpY3aSPRZyATkJjBB33EcWQDV/6+BMANM3fbf6doElLqqCNwl1Ef65g33Neyfg8N3oTHz5LJbhLVQsGVF0ZZHlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599384; c=relaxed/simple;
	bh=p/AACk+gvq0IVBEua9PtwypAEskG9ILUkXZdByX+c3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pIqzBLp2USPjtJ2+FohhUPC0lJbCqoM3SR+aCZXuyKUbXN7Eux9raETwww3uPSgt1bObKLA5fUAU0krsPpI8dHC8mfwnxHvRz76MPdn2xhRqCGAhJ/5CvrqOgmtkyw2Tx92yGn8dFgEL/rxlaBDZGMdvbIyZDjg2mkt+8+tPvWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6f2b81acc45211f19a56ed5b684f684d-20261010
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:637b99c3-5277-4ab6-8873-d785297fa820,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:4f0640e5a45d1dd99c8abd0177fe9ff1,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50|9
	9,EDM:-19|2|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6f2b81acc45211f19a56ed5b684f684d-20261010
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 103726592; Sat, 10 Oct 2026 10:29:35 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH v2] ALSA: hda: Reset response counter when a verb times out
Date: Sat, 10 Oct 2026 10:29:32 +0800
Message-Id: <20261010022932.407742-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009034040.379171-1-songxiebing@kylinos.cn>
References: <20261009034040.379171-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

On some controllers the HDA link reports a verb timeout and the driver
falls back to polling mode.  After that, every subsequent verb sent to
that codec address keeps timing out (roughly one second per verb), while
the hardware itself looks perfectly healthy: the RIRB write pointer keeps
advancing, interrupts are still delivered, and verbs that carry no reply
payload -- notably writes -- still take effect on the codec.

The reason is that bus->rirb.cmds[addr] is incremented for every verb and
only decremented in snd_hdac_bus_update_rirb() when a matching RIRB
response is read, without any rollback for a response that never arrives.
A controller that cannot fall back to the single-command mode
(chip->fallback_to_single_cmd == 0, e.g. the ACPI platform, Tegra and CIX
controllers) returns an error right away and never performs the bus reset
that would reinitialize CORB/RIRB and clear the counter, so a single lost
response leaves bus->rirb.cmds[addr] non-zero forever.  Each following
verb then still gets one response that only brings the count back to the
stale baseline of 1, and snd_hdac_bus_get_response() keeps timing out even
though the codec answers normally.

Handle it in the core helper snd_hdac_bus_exec_verb_unlocked(): whenever
get_response() reports an error, reset the pending counter for the codec
address, so a late response is simply treated as a spurious response and
the following verbs recover.  Doing it here covers all HD-audio
controllers instead of relying on each controller's fallback setting.

Add a small helper snd_hdac_bus_reset_response_counter() for this.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
Changes in v2:
- Move the fix from azx_rirb_get_response() in the HDA controller helper
  into the HD-audio core (snd_hdac_bus_exec_verb_unlocked()), as suggested
  by Takashi Iwai, so that it covers all HD-audio controllers and not only
  the ones using the shared azx helper.
- Add the snd_hdac_bus_reset_response_counter() helper instead of
  open-coding the counter reset.

 include/sound/hdaudio.h     |  2 ++
 sound/hda/core/bus.c        |  6 +++++-
 sound/hda/core/controller.c | 20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index aa994d6e6d35..b0fbb61fa093 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -398,6 +398,8 @@ void snd_hdac_codec_link_down(struct hdac_device *codec);
 int snd_hdac_bus_send_cmd(struct hdac_bus *bus, unsigned int val);
 int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 			      unsigned int *res);
+void snd_hdac_bus_reset_response_counter(struct hdac_bus *bus,
+					 unsigned int addr);
 int snd_hdac_bus_parse_capabilities(struct hdac_bus *bus);
 
 bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset);
diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 81498f1e413e..ecc4b7a780a4 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -121,11 +121,15 @@ int snd_hdac_bus_exec_verb_unlocked(struct hdac_bus *bus, unsigned int addr,
 			break;
 		/* process pending verbs */
 		err = bus->ops->get_response(bus, addr, &tmp);
-		if (err)
+		if (err) {
+			snd_hdac_bus_reset_response_counter(bus, addr);
 			break;
+		}
 	}
 	if (!err && res) {
 		err = bus->ops->get_response(bus, addr, res);
+		if (err)
+			snd_hdac_bus_reset_response_counter(bus, addr);
 		trace_hda_get_response(bus, addr, *res);
 	}
 	return err;
diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index 78855ac357c6..1babc5109049 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -396,6 +396,26 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_get_response);
 
+/**
+ * snd_hdac_bus_reset_response_counter - reset the pending response count
+ * @bus: HD-audio core bus
+ * @addr: codec address
+ *
+ * Drop the number of commands that are still waiting for a response from
+ * the given codec address.  This is called when a verb is known to be dead,
+ * e.g. after a response timeout, so that a lost response won't leave the
+ * counter non-zero forever and block all later verbs to the same codec.
+ */
+void snd_hdac_bus_reset_response_counter(struct hdac_bus *bus, unsigned int addr)
+{
+	if (addr >= HDA_MAX_CODECS)
+		return;
+
+	guard(spinlock_irq)(&bus->reg_lock);
+	bus->rirb.cmds[addr] = 0;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_bus_reset_response_counter);
+
 #define HDAC_MAX_CAPS 10
 /**
  * snd_hdac_bus_parse_capabilities - parse capability structure
-- 
2.25.1

