Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863410;
	b=Cuh9b+Dst27JWBQuM8gC8o9Ma5Fo/eox4fAqpldHJfurIueyUEp98SbB5r3H3BBGQLK6
	 YxCP6RPwqmn6He1KmwbbrwWRvymG8jyFcgTmNYOlhTzRtp2GpNvGhbZlYMPIAcizyAiRp
	 Hutlit+Hi54eiuhuxueFAI71P+3uerDer8x+bXwppL0ARFMuC7i227AenZOWfTRe/9S+8
	 tyi9J9ZC2Z/tgZxia9/jN38XIWUcW/Ktgh8AYy6VCo6d8ita0ZAaHDTGt80KlQB1vdm4C
	 Ika/g3etOctA2RwRcXFiWBHw9/OY235e8EUHgGSKETIq5YusHGTJIgnV2Ii2mi2Vsbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863410;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AOBCkUgeExf+j7oQX+n7eUL1E2EGqrF98OLg3M05nF0=;
	b=FI2pzTRUaAIyZU9vU9KpU9QWCqPesmta0y6lkNuSRRNIotnLrli51W63fYvOJIR9OIVR
	 8xrFLg+NmwaMrXFMPqZ8eIAJ+ootvkJGLbDy0VPTxxL2Wp5ATqAn4yr0RXTqevdt9Morm
	 PapBUEBUw1WwZStnVwLNAH183MluNEPGqm0+fd2bIvx0Bagang3T4EiXGTOpBXs7kuZsc
	 xeHD3XJHtSbNrEgvurSNp/lO9Hns/tgejZVqnm2VN2RpLxSX0IxvU0xeGQ/bzGUk+81gC
	 0N0eTT8YO2CFgHDdlaCv8zrCqtLBbTj/7DkYUKO60arN0/0ySixjqiWpmuJKoyRIupw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QIt6YnHx;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3B360A380B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3B360A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QIt6YnHx
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso157318a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863408; x=1795468208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOBCkUgeExf+j7oQX+n7eUL1E2EGqrF98OLg3M05nF0=;
        b=kiTc/xCm1mqARofCLEggwh4Af5l+4cBIlvDdpa+0Dwu9tfl0Ujmns6ItxBlKTmaZ7d
         rcutcf4mrtgiaa2AjwXr6DPnLOugfxqZNfPCNYxRWVdb5U9U7CXEpKt9JDK1KN+CEsiS
         suW8Tx2C48Jdxt9CCfD/vOBVYa6595z9/ba1dNLD0oUGFGk/hSXG7LiZTRGTaQg1wmWU
         B0W9tI2dDfFMpeujwPhUkQS0KPYCIXR2M5KUxGxC0R0IikI6u2mat2VXu17mSS2BvQv9
         EQzc5s9j0Tqw0b2kF3tIQ89Ni6gwVrWcrlgm6O/EgDqy59xY/vSsbGExJ7sVupJpRZD5
         9CTg==
X-Forwarded-Encrypted: i=1; AL+hErEFn0k9KDEDwni5MFB7sA9nSXf+YCuGWdiek16AsfH/YXASVHGS+9R/SUVBEaXho9dr6mVDvxZOW+1lkUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Jm5pnkiCqhnPOsh+hqfy1403SUyTnDfOZ+ENOqTx4qPV409KO
	bpnzwFXsEEDv/1H/OPVW8j3WT04XwDZm0FqoY8sYdX3322I4O49ASM7wbzwoJr7GdD1lZUwLIs8
	AD5SbP95p+FOwtAOf8keMRp2EzzjcVtBY9LJdp5sMa6oMz0w3SlpvRvhWC3XyCL+SbaC4rIHWdO
	Cpk+6pIy1D7xTNR8vTRWo1U9fl+Wny6hfXDFXEXTpldq8yAS3V7KNGxnTKu2HOo0WD16w1h9pjC
	QD7j0oMs13oA9RiTDfT407/
X-Gm-Gg: AZFdTZe9uWDfiWFOtjilRAkcvu385EjndPhQ7Qz8Sce6QffrUOWVaz3Tughm92YQ4uF
	q5HW+hf9UGk3W+SuK8x0nrEucy78aftF84ru8EeCs0NWSSVQZ+yft4qFy5Yav4JvjIUtKW/ZrNI
	Gp74LdfIEGsGmSB/oOSPih5fG0QAXkOtjXV6p5imITHTFYIIscSOmfXMa41fR8dszCOWnuUPXYS
	QR4qBhhSjVoe65tTvgM3MoCPn0oVuOJZmbnmYPaiRVGhdBhgWuDStY4EYif7DGAlncBr4IO1e5T
	83CiZlwi09muoyZFuydteOnr96TVUv+wXOSmNljfbU6msqEQl4oK+Jmj5vjBhLeod/Y0e4fD27o
	M18lElPzfXcsaI5uOqBQBwSF5rbNYoh8RcWjp0ktpmSWMYUV06zD1bkeT4rMNrmVz7OKABUxIvT
	Birtqd5D6SDvpqkYGNNfJis0IT+Mxz0vaoM7SUTwxqi/k=
X-Received: by 2002:a17:90b:5904:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b3abd08fb3mr364082a91.29.1794863407549;
        Mon, 16 Nov 2026 13:10:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b335bdacsm6192192a91.1.2026.11.16.13.10.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:10:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94975041698so66892385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863406; x=1795468206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOBCkUgeExf+j7oQX+n7eUL1E2EGqrF98OLg3M05nF0=;
        b=QIt6YnHxRyjJm6b35ACgJe0Jf4vGg/h7Vb6mCHu25AyHFkDIIbSNCugMQQn+2FNtbf
         Pjc9y0k8K4D+6kjxhMInD1vcQCzI+Y8r9VvJyJKDFi8WQPC7q9k0sGnWmKMAQFkySo9c
         X7NtG7mSb++/F96g1pyOAdS0k1QF+JewnPPGY=
X-Forwarded-Encrypted: i=1; AL+hErED7mRfPBhp7i53h4rTEnDL+8kZHWutn/m2Hw2ePzW7LUkqlqakl7Ug6odRfnl//xv5++UtGZBtxgLQyqk=@vger.kernel.org
X-Received: by 2002:ac8:5dcd:0:b0:55d:2e33:a614 with SMTP id d75a77b69052e-55d492fffacmr12945311cf.3.1794863406020;
        Mon, 16 Nov 2026 13:10:06 -0800 (PST)
X-Received: by 2002:ac8:5dcd:0:b0:55d:2e33:a614 with SMTP id d75a77b69052e-55d492fffacmr12942121cf.3.1794863401778;
        Mon, 16 Nov 2026 13:10:01 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:10:00 -0800 (PST)
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
Subject: [PATCH net v6 7/8] net: dsa: b53: harden mirror register programming
Date: Mon, 16 Nov 2026 13:09:41 -0800
Message-ID: <20261116210943.1352656-8-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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
bcm_sf2 setup, then rebuild the source masks and capture destination from
the mirror reference counts, propagating initialization failures. Since
bcm_sf2 runs setup again on resume, this also restores active mirror
rules after suspend.

Check all mirror register reads and writes and only increment the source
reference count after successful programming. Log deletion failures
because the DSA callback cannot return an error.

Use the source masks to decide whether a destination is occupied. This
preserves the destination when a failed deletion leaves sources enabled,
and permits a new destination after the last source was removed even if
the final capture-control clear failed. Program the capture destination
before the new source so a failed destination write cannot leave a new
source enabled. Clearing the inactive capture-port field is cleanup.

This builds on "net: dsa: b53: reject conflicting mirror destinations" and
"net: dsa: b53: reference count shared mirror source bits", and must be
applied after them.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 91 ++++++++++++++++++++------------
 drivers/net/dsa/bcm_sf2.c        |  4 ++
 2 files changed, 61 insertions(+), 34 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 98696bce368f..deb331b3629a 100644
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
index 1747a1f20c78..cbaa5de9b107 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1061,6 +1061,10 @@ static int bcm_sf2_sw_setup(struct dsa_switch *ds)
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

