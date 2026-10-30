Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394998;
	b=C8qYa0aderJ3ohLdrcxUPd9+ImvcWFArdK3SY+E3B7cYEO/bxioMdQooz6ci+48t7+uh
	 ooKekOV7qkgWkNMf1EDwiPPGoxSYSyazVHXAhHKEDIBwydFGVTghoz814i8VU8bLBRAGi
	 E1IJRDrczhR3RQBqU2dYwiRI/fWdmt1Heh9853MEmvsOZt6JOF0VmfWHoMIO23d7TEo4O
	 +DB8vy+Q1Ga39qNHVDUV99rq9maEzprWsT1079cSIFy5kdKf5R94/6CPI+TroIet/VxWr
	 dFFZiB8AXT5fXjDO/dlZr6ahsH5DUAJ9Q68dNxEkpQr1jiWBEfjzc0fCb0EV8CTJ67Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394998;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=5pFLRxCJ/yA1VIBBqBPBGRLvkDsq4oo9CE4KjMa/p5I=;
	b=d3zgd2KBrfbgztRFmcd7BfpaH0DCXrD5DBJQeAFGG7dKjVoagkHa27anI87D4z0OG0jg
	 ARJ15H/QlmLeJcDRD5eNGqD62lDKZM0BYjAOeXTWCGxrPQyOriw2kFarAPtbVtzRlomqi
	 4Jt5bk9GnQGrYVY10UVjqpLlYov+Q4e6CVsgIGcy899KqLWFmDFUELYt2EA6mc3fUmIrC
	 YqGXTqyjd9ikzMQTC453W0TdBCcbWVqlZ/yaRhiK11bO7wA+8vBeBITr1Lh6GdjcpX587
	 iptt+rfLev99mRmCauFkgAMQNIFzSR4HvGHW+hdxzyZos1Fe5B+/6m+78ut0SnWB8vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=esSWvlVA;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0490B60A3835
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0490B60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=esSWvlVA
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso844503a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394997; x=1793999797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pFLRxCJ/yA1VIBBqBPBGRLvkDsq4oo9CE4KjMa/p5I=;
        b=FecDFTKOhtiX2Z3EGW80fN7nu8HFtgOjwdP7vrvYsBt4s5IB2Bn+YXUeIiqJwspO2g
         WSwqsvQGAk82LgKTmlF8XlCVq9aT68AEPoR35hSCvvmxO1bt6R1VlOBmxBNTZGzWDlqY
         hVKq46PSwkPa/ziBz3MPtbn2mJyflm6OK+QLKLiq8QbYRUjGopU7SpoiUeKMFuVKgo2b
         bnCFK2zertt7qZKZTbmdUer94ifZwfSsSA81xV5wHOIDpueCAt2BWpxfeyOFN43TUnpS
         8yUkR2niIwvyhn86sAOdNxYO2jME+9u4E+42wTw9RsH1il3KP86fsvhuayMI6aJSUt++
         9tsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw21A2bowdTgSbKf+y/TV21vH09dAzsh6DadMs6ZzmW1aTmgWJ1+9FN9ZkmTqM7hnfSlCuiowjD4ipFg8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOz+Gmy5RL170N+6JSluqQOeA+ErL0PiDnGrQ93BDoCm6OU1kZ
	87anTA7LK+o5a9Ecy3phVQhyWMz/NAGP8synujIOWNNyzu5TUDlrbJVYYglGeiUHGRM4bxzDtkv
	en2PmxJslUR5A8Q6vLO5P+Xvam1nZ3xpR1DZT+tw3DuEOEFNxD2ai3Od+6HfO9ySOa9dy2LPA5q
	bXD0/l3JI32sPEP2/zc5IiJ7aovtcNspNT8iOX+fBsXZyLF+3GiG7IboVv2ttM9ApKNXMO0WukQ
	ZNHKMsIBSPLqAykcBuCDpAK9ec=
X-Gm-Gg: AYBFou1yR8gFn7JdVblkVcO761soIsZ0KNyrDe5eUYoK2ts30xE2E7zuIt6vXeh7JHN
	I23AONCbDoO5t4nQgz3ADecTPMXrxX+pIAYNdFT8iEVH9jq96XqYy/dNOSIdWmEQRZMJUD0ANO3
	wwBkC7lK41cxyHnV4kRRntkT/KoOJXXbeW1S5T+EPJuRkCKeS6bObMZSj2hYQNY1HgOZ86f4zEr
	y5V9Ibt8odsdQsqntHUast9A3VUD6YGY63GG5rglfMlPoZUcWXVllztXPQ7E2OvY8WC7Gux5qnc
	EXaRbRvkvw1EXefxGQgUJ8enuiYo0Hb8v16Z6eoBoJJNfyp+UxLvud1PMg5AXhD9JfixbyiLJcs
	H8spWbnD7JMAf+5d1PQ6ZnE1RATAUf+y4uX8d6kR8euKqCLNFatdRlCWJ2Fx+BRrBFz9b1BAMna
	Yo8h1ZNTvqAGVQi5LMGinMx27KcpB43FUDSUtFQ8EZ
X-Received: by 2002:a17:90b:4cd0:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3ae895a5680mr2941210a91.3.1793394997391;
        Fri, 30 Oct 2026 14:16:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae841ee0ddsm2607624a91.0.2026.10.30.14.16.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2479558eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394995; x=1793999795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pFLRxCJ/yA1VIBBqBPBGRLvkDsq4oo9CE4KjMa/p5I=;
        b=esSWvlVAKWFnw0zzehpvx4zBQHZr0WtN+i0OZQgFS0UCUtDJeND2jZLxGLMgeQR0EX
         pUw6CIXCS8n8loxoKigEhKWiL3Vfc3Hkyab7f2dyW6G++732Nr2z930d5cHFOfwgk3ro
         ejwtpcZgRpPsvYgf7UbRLt0QVsCuDr7bFn/xo=
X-Forwarded-Encrypted: i=1; AKwUvBwYallMN0ZgWdAFXqqc16v8EWHGbnGU1uR2/qQUdDXmoveCkplWPvl5Rf/W1fThRgoYWdWidEbS5EpAGOs=@vger.kernel.org
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr7245424eec.28.1793394995208;
        Fri, 30 Oct 2026 14:16:35 -0700 (PDT)
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr7245363eec.28.1793394994513;
        Fri, 30 Oct 2026 14:16:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:33 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 8/8] net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
Date: Fri, 30 Oct 2026 14:16:17 -0700
Message-ID: <20261030211617.288562-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211617.288562-1-florian.fainelli@broadcom.com>
References: <20261030211617.288562-1-florian.fainelli@broadcom.com>
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

