Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506643;
	b=JyTm192WzrL/XeyF2TTpkqazV+AaqEpfCT4hnIUGw/pRbr/+fiz4tdE9NPsINFwySu3b
	 SHtRL9V2V5sf6Lg3cFfnv5RvAKsqYZbCYzYunLuj949QRldb44C2ZS8Cl3QHVg5utUaf1
	 jf4xTtUeoNZEUDFm+nKQwI5MxTBrKX8kWprZ3+n3fAPt92NwVUm7vDD/VuowNM+uZsdfy
	 F9WzQIfsjo+L86VYoUo7ZyGoB44VOd6a+PmTZoXVueuMFjpLrGjdcKTDwZrKhn0Ze5Wg8
	 lqWeRWJgD5QtN5GujBFarGr4sH0B8bN+DXiP7bpAQBzo+tjSFHeJxLA84VwbDqbWaFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506643;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6/hMRTzPv3MqVF9oK762wGe8C/jh3KZRjtP0cpUtUsg=;
	b=jjTDgXfJRsbzd370/zGZ82/oRlGlv5h2zsUyyMBLzzLRTvt5sH9HPokbu2hqls4QLl/F
	 fKOeabyRPspjJ9G1rM9SlBvkkg2YXGrIP+9q57KtqV4teYHTvRm7ysS+32DCqxHtwr8jd
	 Dv2MLSrbsxfuFP8Dd0nRRm3+7fhqMCO4PxZa6KJBDsW6BKD/MVXF5uIUx2aKvMVdXzqh4
	 9e0ODI9KZ0f6RmOA3UYbWQnAGhc6caMrf8E2Ijr7o5j9MErMoWixoFOsHp/Z2D+oi8lPa
	 5WXVF9qjZESDrCNQxpPua1VtNgYf2Y1/vjWj+MQDBthe/RII2CT66pLzuY+fB8Nc+rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SIp53vrT;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0216460A382A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0216460A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SIp53vrT
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso21480a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506642; x=1795111442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hMRTzPv3MqVF9oK762wGe8C/jh3KZRjtP0cpUtUsg=;
        b=XWXoMgwLECLJvHnoogjyFqmJ9a7FAQ83jOUeVkx6PoflbZVaMwCvt7dr283X8Wguj5
         cNkK+YMFpXEZQYLcCPhLn6NhMbyvnQ/mm5l9GC6UmgLEDrS1nGuygTqc1ne43EoSVvx3
         /UXPWUWzzXGha7LxTt8alPSzTx78Cbm6JAWuUeepAD/Lt8tJpCkHkRTB0c+XUexBr9a8
         P6P2kRih5J9gtr9kT+rOKhWoAFPDw65h9KkTbr4060GOzJWd/HToK08veIMI3x52b+vJ
         aLZUinGvdqzSlBjfi3hQTABns5KuarZa0rka11efa9h5/zSFGIfUnOI2BakfOVba0ijt
         Y0+g==
X-Forwarded-Encrypted: i=1; AL+hErGLfcV6Fe/2nXCd3W+O4ss8P9zsfLcH7L1ysqZiXgIHpMAU1jEp20vGQK9tqck0HFBd9QeVTmq3GK84BX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vj5xSxpSbvJfpS98Vo35JzV35Tu88y0gpoAi2b8fR94j1QCgs
	6DdjjOcvCh/bJ/jDqEwjmDNB/sa7zdDH93KGYbDMD6sgHGHgAQjcnQzHS1Dp/neEXPG3gUqggrq
	hNGsPlFRLPmOvd4v3/B776+JsyeA331MvvieFCdjPDLrm+WYmvDAB1hm1npACzwZVjcbOClAG4W
	EVE5GvE9xui/i2mmbYsOpyICEnIR2TGjzAlsO/GPrkCAnL39JF2PDiGGxYchsF6y2V02dX1yZBp
	6Y8U8dhobdfLPvaL7xPxbEG
X-Gm-Gg: AYBFou3JjHwfNIWvtiPKuPjwgDVjDxHMs32tfWmbHLX0qCQuM4EK5l4Pg2DXBixqcJ2
	4cy2ZaxhqpjGAQiLwBFa3IqHZGRdURHGUrU7p0D3n0R0LLYIMFppSXdAud48FZRvcZmZe4EGaQI
	SkRsQecY/Xf8qU4JlJEfyW/zR3nmji495UfW708Tz5I4vO19kbwbp5lfGeL8/b1/XlAOa5yMo7V
	Lrx65lrlTBHAJpMi5QG0cxIrkB2Fg9J6PD0sypkYpuuagjeANIp8NMVhvfSEyH+4jD7Ho/roMzU
	yjiVYneZyEI8lCIVx6KgXt3Xz0rKDKEo9OTw+CdhDtYnIsXN8lsP2TMGgMXWHltjWqBti5ffAbh
	VSxe6YER6iKi7GrgaYi/1qDpU+13gWyZ5mDOf1R5a05XRF6ReLVPgmwgZ+YdQgoZUtDiBa8+whu
	B8MGWf/dCHICv5qBe05QKIkarZiy1LOmJ08+Yr5iaA
X-Received: by 2002:a17:90b:4a90:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b182f45140mr5407219a91.42.1794506642064;
        Thu, 12 Nov 2026 10:04:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae81cfa5sm419088a91.0.2026.11.12.10.04.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:04:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so44748b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506639; x=1795111439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hMRTzPv3MqVF9oK762wGe8C/jh3KZRjtP0cpUtUsg=;
        b=SIp53vrTRC9rZgu3Mdtb6woZLvcyVesxSQPajgXnpxTdiWhoq73K8Ny/wd2U468Rhx
         fQzv1OHoemQlt9YXT/d2spN6GFj2cxSbyatmdFEP0Pi04PDZpln8/Bh9+7fAv9JD5bfj
         ktpfevPc+kA3asDE3bvhuSciBSzVRq2+/0wrM=
X-Forwarded-Encrypted: i=1; AL+hErFKcv1gTV+0ZM3O7/zLmRYK43CWgEt1YxSUr6UVy0lR+DKQEjKEMktSdDkzLcGkUBSnKSGLdtAIy7xl/fI=@vger.kernel.org
X-Received: by 2002:a05:6a20:9c8d:b0:3e2:b239:87 with SMTP id adf61e73a8af0-3f2febd4adcmr6135774637.73.1794506639212;
        Thu, 12 Nov 2026 10:03:59 -0800 (PST)
X-Received: by 2002:a05:6a20:9c8d:b0:3e2:b239:87 with SMTP id adf61e73a8af0-3f2febd4adcmr6135746637.73.1794506638754;
        Thu, 12 Nov 2026 10:03:58 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18abc06sm95004a12.22.2026.11.12.10.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:03:56 -0800 (PST)
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
Subject: [PATCH net v5 7/8] net: dsa: b53: harden mirror register programming
Date: Thu, 12 Nov 2026 10:02:01 -0800
Message-ID: <20261112180202.324504-8-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112180202.324504-1-florian.fainelli@broadcom.com>
References: <20261112180202.324504-1-florian.fainelli@broadcom.com>
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

The mirror destination check can reject a first rule when a bootloader or
previous kernel left mirroring enabled. Not all supported switches receive
a hardware reset during setup. Unchecked register accesses can also
corrupt mirror state or report an unsuccessful rule installation as
successful. Reference counting must not record a first source reference
until hardware programming has succeeded.

Clear capture control and both source-control registers during b53 and
bcm_sf2 setup, propagating initialization failures. Check all mirror
register reads and writes and only increment the source reference count
after successful programming. Log deletion failures because the DSA
callback cannot return an error.

Use the source masks to decide whether a destination is occupied. This
preserves the destination when a failed deletion leaves sources enabled,
and permits a new destination after the last source was removed even if
the final capture-control clear failed. Program the capture destination
before the new source so a failed destination write cannot leave a new
source enabled. Clearing the inactive capture-port field is cleanup.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 91 ++++++++++++++++++++------------
 drivers/net/dsa/bcm_sf2.c        |  4 ++
 2 files changed, 61 insertions(+), 34 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 7f5bae290eaa..a2d46cceca47 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1360,6 +1360,10 @@ static int b53_setup(struct dsa_switch *ds)
 		return ret;
 	}
 
+	ret = b53_mirror_init(ds);
+	if (ret)
+		return ret;
+
 	/* setup default vlan for filtering mode */
 	pvid = b53_default_pvid(dev);
 	vl = &dev->vlans[pvid];
@@ -2654,14 +2658,25 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 {
 	struct b53_device *dev = ds->priv;
 	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
-	u16 reg, loc, cap_ctl;
+	u16 reg, other_reg, loc, other_loc, cap_ctl;
 	int ret;
 
+	loc = ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
+	other_loc = ingress ? B53_EG_MIR_CTL : B53_IG_MIR_CTL;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	if (ret)
+		return ret;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, other_loc, &other_reg);
+	if (ret)
+		return ret;
+
 	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
 	if (ret)
 		return ret;
 
-	if ((cap_ctl & MIRROR_EN) &&
+	if (((reg | other_reg) & MIRROR_MASK) &&
 	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Only one mirroring destination is supported");
@@ -2673,19 +2688,17 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		return 0;
 	}
 
-	if (ingress)
-		loc = B53_IG_MIR_CTL;
-	else
-		loc = B53_EG_MIR_CTL;
-
-	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
-	reg |= BIT(port);
-	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
-
+	/* Select the destination before enabling the new source. */
 	cap_ctl &= ~CAP_PORT_MASK;
 	cap_ctl |= mirror->to_local_port;
 	cap_ctl |= MIRROR_EN;
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg | BIT(port));
+	if (ret)
+		return ret;
 
 	(*mirror_count)++;
 	dev->mirror_port = mirror->to_local_port;
@@ -2700,8 +2713,8 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	unsigned int *mirror_count =
 		&dev->ports[port].mirror_count[mirror->ingress];
-	bool loc_disable = false, other_loc_disable = false;
-	u16 reg, loc;
+	u16 reg, other_reg, loc, other_loc;
+	int ret;
 
 	if (!*mirror_count)
 		return;
@@ -2709,33 +2722,43 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	if (--(*mirror_count))
 		return;
 
-	if (mirror->ingress)
-		loc = B53_IG_MIR_CTL;
-	else
-		loc = B53_EG_MIR_CTL;
+	loc = mirror->ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
+	other_loc = mirror->ingress ? B53_EG_MIR_CTL : B53_IG_MIR_CTL;
 
 	/* Update the desired ingress/egress register */
-	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	ret = b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	if (ret)
+		goto err;
+
 	reg &= ~BIT(port);
-	if (!(reg & MIRROR_MASK))
-		loc_disable = true;
-	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg);
+	if (ret)
+		goto err;
 
 	/* Now look at the other one to know if we can disable mirroring
 	 * entirely
 	 */
-	if (mirror->ingress)
-		b53_read16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, &reg);
-	else
-		b53_read16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, &reg);
-	if (!(reg & MIRROR_MASK))
-		other_loc_disable = true;
-
-	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	/* Both no longer have ports, let's disable mirroring */
-	if (loc_disable && other_loc_disable)
-		reg &= ~(MIRROR_EN | CAP_PORT_MASK);
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	ret = b53_read16(dev, B53_MGMT_PAGE, other_loc, &other_reg);
+	if (ret)
+		goto err;
+
+	if ((reg | other_reg) & MIRROR_MASK)
+		return;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
+	if (ret)
+		goto err;
+
+	reg &= ~(MIRROR_EN | CAP_PORT_MASK);
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	if (ret)
+		goto err;
+
+	return;
+
+err:
+	dev_err(dev->dev, "Failed to delete mirror rule for port %d: %d\n",
+		port, ret);
 }
 EXPORT_SYMBOL(b53_mirror_del);
 
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 6570279cc040..ccc836c0718c 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1063,6 +1063,10 @@ static int bcm_sf2_sw_setup(struct dsa_switch *ds)
 	unsigned int port;
 	int ret;
 
+	ret = b53_mirror_init(ds);
+	if (ret)
+		return ret;
+
 	/* Enable all valid ports and disable those unused */
 	for (port = 0; port < priv->hw_params.num_ports; port++) {
 		/* IMP port receives special treatment */
-- 
2.53.0

