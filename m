Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B683A784A;
	Fri,  9 Oct 2026 03:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517260; cv=none; b=edLLBEpONwrN6loWG1G5/HwxYkYmF30CTUCizNiawPd9sQRnMNUxefsp/Ow6KE4+lAq5mB67ViV7rw+sBZ/JlHP2SBciSF28FjmPTSOfVVGiVXeBlo1YiEuahpzMo3bsDXZWW8gGdY6hQyKhqkyCDPqUR8tDz/DZbv7fG5msNx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517260; c=relaxed/simple;
	bh=vBg4IJ0ANSVfTx952HtfRlSrYRG8dQ15VMHN8QIx5pY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=anhRyfvWwLkZuOtTNgicIa5wUaX77smOCkPEto5O8NOuBLoV7pgMpSiRdzEoPJMNxeGYG2I/oOxwTU0Dlo6CaKERgzs7nY+SxIcg9ZNVo0CCbbb+obZ26MkJUyR8iUK24CnwBbkrWeJ5TUIig0Qi6mKkNQq0b3cohFCd0O69DL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 34fbfb8ec39311f19a56ed5b684f684d-20261009
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:482f0e14-3d5e-4ffb-b8a1-38ad8a1b2d2a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:8a3e05b673b29173b2e36d3eb571cb83,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 34fbfb8ec39311f19a56ed5b684f684d-20261009
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1459016241; Fri, 09 Oct 2026 11:40:44 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH] ALSA: hda: Reset pending verb count on response timeout
Date: Fri,  9 Oct 2026 11:40:40 +0800
Message-Id: <20261009034040.379171-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

The reason is that snd_hdac_bus_send_cmd() increments
bus->rirb.cmds[addr] for every verb, but the counter is only decremented
by snd_hdac_bus_update_rirb() when a matching RIRB response is read, with
no rollback if the response never arrives.

When a controller cannot fall back to single-command mode, i.e.
chip->fallback_to_single_cmd is zero, azx_rirb_get_response() bails out
with -EIO immediately and never reaches the bus-reset / single_cmd
recovery that reinitializes CORB/RIRB and clears the counters (that path
is guarded by the same flag).  The ACPI platform, Tegra and CIX
controllers never set that flag, so they are all exposed to this.

A single lost response therefore poisons bus->rirb.cmds[addr]
permanently: each later verb still gets one response that only brings the
count back down to the stale baseline of 1, so
snd_hdac_bus_get_response() keeps timing out even though the codec
answers normally.

Fix this by dropping the pending count for the codec address once the
verb is known to be dead.  A late response is then handled as a spurious
response exactly as before, and the following verbs recover.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/hda/common/controller.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index afec5c5546ec..7a0b641fba14 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -773,7 +773,7 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 		return 0;
 
 	if (hbus->no_response_fallback)
-		return -EIO;
+		goto error;
 
 	if (!bus->polling_mode) {
 		dev_warn(chip->card->dev,
@@ -789,7 +789,7 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 			 bus->last_cmd[addr]);
 		if (chip->ops->disable_msi_reset_irq &&
 		    chip->ops->disable_msi_reset_irq(chip) < 0)
-			return -EIO;
+			goto error;
 		goto again;
 	}
 
@@ -798,12 +798,12 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 		 * phase, this is likely an access to a non-existing codec
 		 * slot.  Better to return an error and reset the system.
 		 */
-		return -EIO;
+		goto error;
 	}
 
 	/* no fallback mechanism? */
 	if (!chip->fallback_to_single_cmd)
-		return -EIO;
+		goto error;
 
 	/* a fatal communication error; need either to reset or to fallback
 	 * to the single_cmd mode
@@ -823,6 +823,18 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 	hbus->response_reset = 0;
 	snd_hdac_bus_stop_cmd_io(bus);
 	return -EIO;
+
+ error:
+	/*
+	 * The command will not get any response.  Drop its pending count,
+	 * otherwise bus->rirb.cmds[addr] stays non-zero forever and every
+	 * later verb to this codec address keeps timing out, even though its
+	 * own response is delivered normally.
+	 */
+	scoped_guard(spinlock_irq, &bus->reg_lock) {
+		bus->rirb.cmds[addr] = 0;
+	}
+	return -EIO;
 }
 
 /*
-- 
2.25.1

