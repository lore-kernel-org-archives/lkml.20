Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394996;
	b=2sH6iRy4fVDUqUmZLKwZKNsKPqCkD9QEUv5r1OKXG/Rqr4fYfb9nZJjUT6OvXv1NvYcw
	 faagblgGbAQMkglxQA6EqSfBvduY6DJ4HdCIxIO4nfmBt2PtwAD3G9HXb78cFdJV6AIUz
	 TxdiMT1k7M7FMyYRFv6/h+Qjt6xUFMAg/PQXAZOp7c+nUl8KL2LD4oYfel9ApQqr0xMR7
	 aOr4mEibTLG8xjAO8ZYX3V6VTgRA9pQIvUONnSWcpXKcYk2xSwvSKms99TBYFzJ4XKyon
	 3P6eNZRPXT99FFLvmemAO7HfEdGnwK5/UttKfy4B/KixuBJCFBmgGRSosrs7XbFI2EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394996;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=b5hKSSPqLOErsxv3U30fZpQLPSnwl4d2gi3NrK5GmXM=;
	b=utU4Dzc+jbIoRcrZoeuYqKSvLK9T0fqrGra3+g4r1iwAblxGH5hDnod2Impc3Z/etXI+
	 ZmlqpszExZdlOOsoFata+F0/lPeenPrTIIm58zPr0pZbuMAe6YmtOaQCQS/5Rd8zW0gnT
	 MvMgBN6pHbbpfivQkZAS7GZqEKAp8/4dHjrYNB7xEb88u7vnVjFdBezsqTpkpOVO6VX2n
	 xPoA+RHTJSb4FLvqtqxhk39hR4Jh8uszkLPGgW5lqlxNcQZCOrP/WxgX4pfcmhqlk+rms
	 r0iQ1gXqBu5nm22H48J1l7kYx7XG4MoATYKDlhQnwNLUB3Pn9cHAUnG7IIa6hnwMHaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bbyQyL9i;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCBA60A381B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CCBA60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bbyQyL9i
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso806104a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394996; x=1793999796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5hKSSPqLOErsxv3U30fZpQLPSnwl4d2gi3NrK5GmXM=;
        b=j711mNb4RqON75FG6TErFCFeWnd1lS0lCyMrIX5cN9cG3bYFn65zKpjuJGIzpAMzJ4
         qaBPeg7D2kLWWC+x9yNpXZ1z0Wc8A8vzBA58VbXLGiNKGCdKIApl8I4lEshdiGDLZVyO
         yZ93mZ+9xzeUMZMX7yaYZqxZCdzsHTq7nLfJ6sttl9reenw/PQq8ACvr7YamZFMoqGOH
         u8ahMrUAJJ//aSXUshhIf0AhItDOKFUXCd0hIk8LzHCnyCc63cuXgheUiQIAuSZPx/xX
         TfxtahCIhz1UQaNiLK4HOhGmNCRa72/3tRruaak8jVT331GhACUFIr9z7sctb4QFU3PN
         Lw5w==
X-Forwarded-Encrypted: i=1; AKwUvBzE4z9AvugiI++97kyZEAriyfvyue0J0STEZ2gotiFh00zkmOXDG6gwWAORANpy+OejG/CeLX5yB6K9uhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo8Wc4kk6PJd3n9SRYDDp7dcyEPhPwgbSQvVGle+cBJOIC1/fA
	82fgWv4+Bd3ffUNV4muuU9+NyE/FCCK9+EqLqV68VIgHOyGynMWLB9vp9lwGx2tViePOpOkd4aT
	Og6oaJu1gbgD51J4OPvMsF4bqcIXD6qLFYLuXv2EypUsW7RhHCzn3OITmr9UcpVUkOoiBLNEYYd
	6BmTMV9KJy6kb2YY3wwfw/vyDdH0LOD/47QlR/irkjwD/1znOvx9Weci5eunSPJ8HG4jzksCY3f
	AFb+0sQxaKTI6p6LT2WSlR6sBo=
X-Gm-Gg: AYBFou1Wktx7SJMCmuOoL+aFhgG0ak2FpGBPxtSNU9kHcjMyWHONqfcBjcEBLyjwArt
	K/1274hkSAvUMRu0m9krCt/dTyWIxVVHi/4t4qzJi87NdZ/IVR2TZnv0EBKw0C2IdInLcN79UPH
	R5yd5EyGTIoGeBjMfIT4NNJUymF1wovsdisn0ufTKMedJNXllVAsXC3qCCWyRCfbwFaTu2YYI0L
	+Mr9mfwNxKVYUMKS4t2NcpzHtI+rgghHn4P22teGGvzzI0vpFQiCKUXCWye/5Nn+I8naPKSZWSD
	Ll1QyJcaLLuSroJaMhyvN0lTJ+O7UlrpFktT4oVWfjKMgrLjGTA5ZRrYxJiUSNiu0vimNbpdlQ4
	9TlsJMoxq0Qqk5nBIlPG3ZmSfJKizQpbmRF8aqj+pRTeNNb+lv139m2zRXRKwcFmQxWyBl0kAq5
	twE2QKfuabXSKtBtdJuDufnXqtOnYQOhMKqZOfepl/
X-Received: by 2002:a17:90b:55c6:b0:3ac:9f00:3bc8 with SMTP id 98e67ed59e1d1-3ae8976f2f0mr2737733a91.36.1793394995606;
        Fri, 30 Oct 2026 14:16:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae88072814sm915577a91.3.2026.10.30.14.16.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so4499205eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394994; x=1793999794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5hKSSPqLOErsxv3U30fZpQLPSnwl4d2gi3NrK5GmXM=;
        b=bbyQyL9i9IzZ7W7SOdsN6jLvYET0a3+YT0pZss2E7bShkQyuYAQAtS0ximt9cHeXBs
         hu2m1ml/2fggYgGsMOat/USlvPSHy8jBTt/R19LZpqmzGlZwPWh4GjuUYVtlGEz3O5xI
         ASMx0bWQlfUw0yGKkTbELKDJ15k8KDU0kEFAM=
X-Forwarded-Encrypted: i=1; AKwUvBxo99qNMQ16tyq9LFuVbt5+TnWrC0JC1fFNbRqjX/Mlace9N2vaL1zZVDDS+HnFuNGViCLHdy6GkOwV4AE=@vger.kernel.org
X-Received: by 2002:a05:693c:69c9:b0:36a:13df:749d with SMTP id 5a478bee46e88-36a423b3dffmr4319138eec.24.1793394993545;
        Fri, 30 Oct 2026 14:16:33 -0700 (PDT)
X-Received: by 2002:a05:693c:69c9:b0:36a:13df:749d with SMTP id 5a478bee46e88-36a423b3dffmr4319093eec.24.1793394992792;
        Fri, 30 Oct 2026 14:16:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:32 -0700 (PDT)
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
Subject: [PATCH net v3 7/8] net: dsa: b53: harden mirror register programming
Date: Fri, 30 Oct 2026 14:16:16 -0700
Message-ID: <20261030211617.288562-8-florian.fainelli@broadcom.com>
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
 drivers/net/dsa/b53/b53_common.c | 109 +++++++++++++++++++++----------
 drivers/net/dsa/b53/b53_priv.h   |   1 +
 drivers/net/dsa/bcm_sf2.c        |   5 ++
 3 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index b16167c9510b..c2706c2e643f 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1307,6 +1307,10 @@ static int b53_setup(struct dsa_switch *ds)
 		return ret;
 	}
 
+	ret = b53_mirror_init(ds);
+	if (ret)
+		return ret;
+
 	/* setup default vlan for filtering mode */
 	pvid = b53_default_pvid(dev);
 	vl = &dev->vlans[pvid];
@@ -2540,20 +2544,49 @@ enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL(b53_get_tag_protocol);
 
+int b53_mirror_init(struct dsa_switch *ds)
+{
+	struct b53_device *dev = ds->priv;
+	int ret;
+
+	/* A switch reset may leave the previous mirror configuration intact. */
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, 0);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, 0);
+	if (ret)
+		return ret;
+
+	return b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
+}
+EXPORT_SYMBOL(b53_mirror_init);
+
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack)
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
@@ -2565,19 +2598,17 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
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
 
@@ -2591,8 +2622,8 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	unsigned int *mirror_count =
 		&dev->ports[port].mirror_count[mirror->ingress];
-	bool loc_disable = false, other_loc_disable = false;
-	u16 reg, loc;
+	u16 reg, other_reg, loc, other_loc;
+	int ret;
 
 	if (!*mirror_count)
 		return;
@@ -2600,33 +2631,43 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
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
 
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index 910c71618d0b..b871a82cbb23 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -546,6 +546,7 @@ int b53_mdb_add(struct dsa_switch *ds, int port,
 int b53_mdb_del(struct dsa_switch *ds, int port,
 		const struct switchdev_obj_port_mdb *mdb,
 		struct dsa_db db);
+int b53_mirror_init(struct dsa_switch *ds);
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack);
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 9e5713015187..9f54cd414c18 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1059,6 +1059,11 @@ static int bcm_sf2_sw_setup(struct dsa_switch *ds)
 {
 	struct bcm_sf2_priv *priv = bcm_sf2_to_priv(ds);
 	unsigned int port;
+	int ret;
+
+	ret = b53_mirror_init(ds);
+	if (ret)
+		return ret;
 
 	/* Enable all valid ports and disable those unused */
 	for (port = 0; port < priv->hw_params.num_ports; port++) {
-- 
2.53.0

