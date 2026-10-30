Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394856;
	b=MVwMx5RzSxeIZgyfdfJTVFi3LZsNju57mK2PcVRjY6bi4pESM10cTgpGQ1ml5I75fwh2
	 imSE1IWI/UOHq4f8mj8/CScTBPAlW8La50+f5ZSulzm8gYsqhBmHmMLbazhJM2LyX1J60
	 vRept8TlYAsAEYIE0eGicZwox/U1YVECj07LbeMQ5EuvKQ61fRz3AhpmydtAJcda3sBnv
	 L7/zPX7gkKm9e9KveKjS77JSUW7sWpW+IyJQl+/QNW0CmvtmGw+MdPmNm8zac0d3FFw6i
	 M64a9Zz5Yspsei5YI15drAn3h8S2x/lmu+5qE+N9NRDfHKUOw3lgRSlzaBJdlxivEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394856;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=5pFLRxCJ/yA1VIBBqBPBGRLvkDsq4oo9CE4KjMa/p5I=;
	b=yy5D+1LZdj8x5uPEKCqttLggGSB51s2/ALVoLe4ullkUAZrav1LlRpKVp8y1NlPO2zK8
	 pKAsdxt/Q9DC/DrYn7a2pz4ieI8fd+i4buHiYPOoZYUTXPXmFCUVOVQnBKGNoYVpKMsTo
	 HOqqfZ96s916TAT220qGV0lKncXUhm4qbyMd5edGE98fkMOhAWCm7EFgUEfdxeJypQCnt
	 BaBuzlpeWGr4Hl6IoVyKLAKULek2ZFMjTZR73OflCIeN6PV8KAjF/JKqXqm/QFq/6BQzs
	 q1ENK3ZCuHIs59ItSDOPgAJqUlmwmsNil5q/Z1J0FjYvkCzTsoIjW3FS4+YfaR70qQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T6+QOxcq;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764EB60A2629
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764EB60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T6+QOxcq
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93e63ee7b4cso109057185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394855; x=1793999655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pFLRxCJ/yA1VIBBqBPBGRLvkDsq4oo9CE4KjMa/p5I=;
        b=ptt2duQn4jxyUGycTPX2mNLtzLUrRCuwhZth+dUoDeUkHvy09rX/EcCahPUaArByWQ
         brB6icY3hQoPDxU7afuwuccZI7eI0iCHPjkEwwcKAwCzXMlEAc0bLXCe3oivGANNPo6B
         CJC3qPVrt/VZPdQGA79UhgZm1sWxFetk+WbJT7HuDJQiqCxzA1g17TkWBcVKZH7XOXU0
         4IcgQxxbiAt8kP5oRLqxHIfjrSJlsoeUvW3mWuy2SvXhtxRcVXqh/ZKC8qVCrk34KbyD
         roaeKW84lbTZJ1wik6/Q7IKDTkL3NmGnbt/o2fR+box67eeVDmPvYcUltVZy5DRUF14Z
         ywQA==
X-Forwarded-Encrypted: i=1; AKwUvBzArXgI3HDOBuUXg0liwkjDLMyKeDUE88dOhpC9q/shrQFIRKoaEJWZLKdDewkwuOSkPVuJ3Vy2R0qYAw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW/k6X2PpQsKGm69LbWjK/2q1F5JVSWYkALUVlx4s5GxFBiVij
	GsEJ9J21tbh8g5jK8P9NRkdWylau42WbX2Lml78TV4BoytenL3kdw0GOFtQU1bA6gN4hihq0jZv
	+KzJK7yT2XzD8ygGt2XUkWpk0a8D3ue2HnMWg8NwZYkILbneHB6lssrVu4YeDTxmXrDV+/N110/
	R8xJJ6+Ge+yRSXfd5Skw7kqJ9+0qPTUL8u/l3vSJQwyxi7kQ5+UymloEHq53ZIdRwXUI+HRdS+a
	/rYhwEWuN8m0sC0dkA/BZosEgI=
X-Gm-Gg: AYBFou0tObsdV8XLvH+v96fDD+FAJkOVBL0KktH5nFrTUjw2m0YOqyODg9RO+q9VcUi
	RLV7i/U++WcmYWGn1kvt+BeOfEeQvG70O7PagqVFGYGX5gPLZww8UjePfRj2llUBG1U7UjBawKl
	MvAEQNWjWeYlZByAKv4YR8Oc8RoOlI38RvJDcFPfyMupWk33468m+ybfqszhwhTeiGl2rxsaj1L
	xlS21DRK96P5Un043OTT6ipcOOFFqPaoqPQSUzIdY/lAhpo961cyhHjPhtVqsTqqaOFe40yVkIW
	eL73xm7YWFTY7+SpENAmagwcsqHMPCoU8lhnaaEXJHtLMgRuuLbH7GJASAfeNFdLBV5JuuDbPpZ
	ymOHYvfs9AmA6EvocNyXK/jE4dCy948TcylyaQtx2nihstZfna97ktCKLM5B4MgzbLNYQvqjp/L
	3MmXnBgwUgqUIte2isNGasgCSSYXYITh+MOx0KSU1P
X-Received: by 2002:a05:620a:4408:b0:93e:cd74:33b with SMTP id af79cd13be357-9442171b97dmr639075985a.27.1793394855412;
        Fri, 30 Oct 2026 14:14:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-944255e42fesm27202685a.8.2026.10.30.14.14.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:14:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a223755e4so4492097eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394853; x=1793999653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pFLRxCJ/yA1VIBBqBPBGRLvkDsq4oo9CE4KjMa/p5I=;
        b=T6+QOxcqcK/sNi4H2QB2z00jszeTSLcgTce1u1cVupIjLf8NtflKNmhy1bYtiA16Js
         d/KHIqRiAa+aEGhGtFBg4VAKFPm4QOp+tYoL91GlSk6QtnoE5oDs2Ul+WQ0SRSlPeHIG
         zymhgJ19rQOf7cVxTpLlXjrIYbNvm8NbEo4O4=
X-Forwarded-Encrypted: i=1; AKwUvBwLyKE2TgXU7o4gWS9VEypGUDsMLLjefAl/tzNR1g2XMLpIChqFFuaOdV7icAIh8iCwJtVPHYWgSs1D6TI=@vger.kernel.org
X-Received: by 2002:a05:693c:88c9:20b0:36a:18e2:64c with SMTP id 5a478bee46e88-36a4232bf0fmr5036674eec.11.1793394853323;
        Fri, 30 Oct 2026 14:14:13 -0700 (PDT)
X-Received: by 2002:a05:693c:88c9:20b0:36a:18e2:64c with SMTP id 5a478bee46e88-36a4232bf0fmr5036630eec.11.1793394852487;
        Fri, 30 Oct 2026 14:14:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm10574595eec.3.2026.10.30.14.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:14:11 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netde@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	netdev@vger.kernel.org (open list:BROADCOM B53/SF2 ETHERNET SWITCH DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 8/8] net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
Date: Fri, 30 Oct 2026 14:13:50 -0700
Message-ID: <20261030211350.287566-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211350.287566-1-florian.fainelli@broadcom.com>
References: <20261030211350.287566-1-florian.fainelli@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

BCM5325 and BCM5365 use an 11-bit bitmap for the mirror capture port,
whereas newer switches use a four-bit port ID. Programming the port
number directly can select no destination or the wrong destination, and
can select multiple destinations. For example, port 2 requires BIT(2),
but writing 2 selects port 1 instead.

Use the bitmap encoding on BCM5325 and BCM5365, including translating
logical CPU port 5 to hardware bit 8. Apply the corresponding field mask
when checking for a conflicting destination, replacing the destination,
and clearing it after the last mirror source is removed. Keep the port ID
encoding for newer switches.

The ingress and egress mirror source masks use the same layout on these
switches, with the CPU port at bit 8 and bits 5-7 reserved, so apply the
same translation when setting and clearing a source port bit.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 40 +++++++++++++++++++++++++++-----
 drivers/net/dsa/b53/b53_regs.h   |  1 +
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index c2706c2e643f..c320f53b41cd 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2544,6 +2544,31 @@ enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL(b53_get_tag_protocol);
 
+static u16 b53_mirror_capture_port_mask(struct b53_device *dev)
+{
+	if (is5325(dev) || is5365(dev))
+		return CAP_PORT_MASK_25;
+
+	return CAP_PORT_MASK;
+}
+
+static u16 b53_mirror_port_mask(struct b53_device *dev, int port)
+{
+	/* These switches use a bitmap with the CPU port at bit 8. */
+	if ((is5325(dev) || is5365(dev)) && port == B53_CPU_PORT_25)
+		port = B53_CPU_PORT;
+
+	return BIT(port);
+}
+
+static u16 b53_mirror_capture_port(struct b53_device *dev, int port)
+{
+	if (is5325(dev) || is5365(dev))
+		return b53_mirror_port_mask(dev, port);
+
+	return port;
+}
+
 int b53_mirror_init(struct dsa_switch *ds)
 {
 	struct b53_device *dev = ds->priv;
@@ -2569,6 +2594,8 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
 	u16 reg, other_reg, loc, other_loc, cap_ctl;
+	u16 cap_mask = b53_mirror_capture_port_mask(dev);
+	u16 cap_port = b53_mirror_capture_port(dev, mirror->to_local_port);
 	int ret;
 
 	loc = ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
@@ -2587,7 +2614,7 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		return ret;
 
 	if (((reg | other_reg) & MIRROR_MASK) &&
-	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
+	    (cap_ctl & cap_mask) != cap_port) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Only one mirroring destination is supported");
 		return -EOPNOTSUPP;
@@ -2599,14 +2626,15 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	}
 
 	/* Select the destination before enabling the new source. */
-	cap_ctl &= ~CAP_PORT_MASK;
-	cap_ctl |= mirror->to_local_port;
+	cap_ctl &= ~cap_mask;
+	cap_ctl |= cap_port;
 	cap_ctl |= MIRROR_EN;
 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 	if (ret)
 		return ret;
 
-	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg | BIT(port));
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc,
+			  reg | b53_mirror_port_mask(dev, port));
 	if (ret)
 		return ret;
 
@@ -2639,7 +2667,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	if (ret)
 		goto err;
 
-	reg &= ~BIT(port);
+	reg &= ~b53_mirror_port_mask(dev, port);
 	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 	if (ret)
 		goto err;
@@ -2658,7 +2686,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	if (ret)
 		goto err;
 
-	reg &= ~(MIRROR_EN | CAP_PORT_MASK);
+	reg &= ~(MIRROR_EN | b53_mirror_capture_port_mask(dev));
 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 	if (ret)
 		goto err;
diff --git a/drivers/net/dsa/b53/b53_regs.h b/drivers/net/dsa/b53/b53_regs.h
index 54a278db67c9..821ac74777f2 100644
--- a/drivers/net/dsa/b53/b53_regs.h
+++ b/drivers/net/dsa/b53/b53_regs.h
@@ -239,6 +239,7 @@
 /* Mirror capture control register (16 bit) */
 #define B53_MIR_CAP_CTL			0x10
 #define  CAP_PORT_MASK			0xf
+#define  CAP_PORT_MASK_25		0x7ff
 #define  BLK_NOT_MIR			BIT(14)
 #define  MIRROR_EN			BIT(15)
 
-- 
2.53.0

