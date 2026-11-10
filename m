Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282644;
	b=nqmKzyt5ZvghiJneEw9ITwz/r6xu+0tEEjDAPOoIJyhTyERyaRwcOVWfNWyY5q5LfJPO
	 xzbOUKs0MY+MOc6TgA2w2v7ppuzCitidM/lpwvulZl3IfRu9N6q9utMNw4+4yY8HCE5xP
	 6PkTvPMUPUhSPbdFZqQ5Dc+Y7OlWkBMMmE8mvfl+rkyi6qBEc5V0ecxLBzIT8zOjsIrnH
	 g+bg45/yBEDQ/JH7gb5tySvBWAY9U2/+7LVdgflgaH7CkQKENiMIm+BBXVvq9cO06bV5g
	 M/q0RThhmmCDyI1ZbjHvapdrrB9qWr1OvZ89nKC/shFKy9CCn9DbW7aqInh65HkiFNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282644;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7meWxertAjl9j9mw2S4lICUqNDf7vNKHIx+/yv0Rf3Q=;
	b=E9duT5u4a/SmofPNeTmeQQ+ndoHSTai+eQ69BgnY33zMY201P0ettwm2Jve6bgch39d+
	 dI0Eog1Q6FwFOdEXLAEKJV2gv+F8pkww6OIJTBg1ggKUnMeCVhHYI7Pep2t2NGbEScOqi
	 MMhAWI414LL0z28sI1E+oFiV4FlWvgCmcsxviRabwZpG3dkWyYHUOifk1Kcs868vyQH4x
	 015atAdIhxzE4TjUDsQdtPQl85miZ8Wo3CRLLL/SCDeIxJYOfhr+7qbidQnBthJDu0w+F
	 ti91dbYI0rhWyNXDVjdRRa6XKuw39h1bZCWqi00bmfY4CNT34umvabvk/wyMTcSisfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="S3/LmUfK";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B39B60A5BD4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B39B60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=S3/LmUfK
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1182484a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282643; x=1794887443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7meWxertAjl9j9mw2S4lICUqNDf7vNKHIx+/yv0Rf3Q=;
        b=xru4zxpYnhK7nxScHO7gyZeVoHvQZ6re1s0C4aAGabDwDN2zzJFbdYm4okJiVImpAr
         2kD449DvNScEqzN0i5HUe5g4V7DuiHj0a7oTCSJFasVttlYHzyjj583DRZ8fOUS6nIHx
         SyK1bdAoxyS+r0GCuS/54rMM+hsw6nW04G86bC8aeop+PebgEhXd0O6qCjpx8fTtAqdf
         npjaISB81L/xPJMRJQNqlXPflAVrfri65L6uGtW20i4/+lT4R2rs9p3BCOnGXZObbhHN
         H1r1NEWb8NntjPv1rdZkWE0RhLgzqV3Hk1H09ADa64y++83O49qm3P7jOQJrryFGFJRv
         QJMw==
X-Forwarded-Encrypted: i=1; AL+hErGXjb4eiIeW8UQ7cP2CFfCNiush+P3f9Y/nyM67JVBufZyhpXWYgzXbXECTLr5DuRVoOFafDS3Juu+nVAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RlRdhjf2sDFjD/sbbWW9exxOdI2ad7if7rD0zHXn3UxpTcciN
	fWruvuoVkHAZosrEXr72rjZZyCIDintOMey36X2gpN6R5bX8vqfbRamk9icGWCHawmh6U0UQOHE
	EmyaZUrB0pUoyUJun8+jYsqm+DpOnoknzIGVjI8W7b4S2POaVJ1IoUZjuJtnhYkdvsAwPZZs+jY
	FZHdo3QhzD9P1fI8kFFbOzzN/ccQwm5sqojiGHpjZO7gGnHD5pgs0O7bZBWDmnpm2GB6LB5+WU5
	1e3XjMx26kNL49KTPn0MJZB
X-Gm-Gg: AYBFou2Ba1qBV6JtsDbUnRoa5phGGF5I+RPjc3EBsC2iKkK/r+8i2OMNzN+nzGj/z83
	GRZlYkBwDQn7Mvb+UD6s5y3+jrLkX2EGSnCK+1rJ74wOPV/TFNfmDP8b5z0nuMeDpChfBLdrEWk
	fQrWkSKtTclWxctjyiQxrPW2E/q5XPVMZxG46knagpdFzO5cUI2tC+uUXW2yb5nELN8sb1fUnyq
	7GSFWuxIYxC3PPje6YABB3zVNP3lVQ486iOGDGESuIikze7rLETHW8+lCTG4X2sVFc8fnOzOcHT
	oisLg6qDlqKSWLOaog/ndO626Fm1NBWjpzyDLfWWwJjcP04eVY7t8ce5zbMkxTd4ARcB6IcdqT/
	B2+tXcYKEoz6QfBg+Iaz+ltOiU1rBpA4vEO3rKoTChvN3Zap6GMXi4JtXSUY9gSjD8NZf+TyK94
	eofvuIX6SSH0BDfA/eMOeVLUYq6oNEBwMOACVNQ/PB
X-Received: by 2002:a17:90b:3809:b0:3b0:a1af:e4fc with SMTP id 98e67ed59e1d1-3b166d3014bmr1697648a91.63.1794282643319;
        Mon, 09 Nov 2026 19:50:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b166fd0077sm1032038a91.0.2026.11.09.19.50.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363b06bcb2so35074771cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282642; x=1794887442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7meWxertAjl9j9mw2S4lICUqNDf7vNKHIx+/yv0Rf3Q=;
        b=S3/LmUfKXgPvyn04fdZpFpEkIotVwK2um6RLTnnnt2he+/MCN5G+nWuriTHH8Mu4Oa
         X2gFBYx40ukTV9Y0yIo6tXOhCuO2lRXrAP0Si7o9D/UNRRz8MM03MFzhHRscBaWuJ0qH
         ySMOBu5CvVcu7UjyIJuI+EMtcEGs3eCM3bN6o=
X-Forwarded-Encrypted: i=1; AL+hErGQAPdUGeMhMKiOePRbJbRd+if5LztqBAFyUUZcl5CGSrXCfs5QjYftGv3OFiRE4r0YML4O/BUsPiBKxI8=@vger.kernel.org
X-Received: by 2002:a05:622a:1911:b0:535:2e9:e474 with SMTP id d75a77b69052e-55525fa6b62mr21683251cf.4.1794282641821;
        Mon, 09 Nov 2026 19:50:41 -0800 (PST)
X-Received: by 2002:a05:622a:1911:b0:535:2e9:e474 with SMTP id d75a77b69052e-55525fa6b62mr21683181cf.4.1794282641365;
        Mon, 09 Nov 2026 19:50:41 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:40 -0800 (PST)
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
Subject: [PATCH net v4 7/8] net: dsa: b53: harden mirror register programming
Date: Mon,  9 Nov 2026 19:50:17 -0800
Message-ID: <20261110035018.2169370-8-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
References: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
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
 drivers/net/dsa/b53/b53_priv.h   |  1 +
 drivers/net/dsa/bcm_sf2.c        |  4 ++
 3 files changed, 62 insertions(+), 34 deletions(-)

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
 
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index d55fba9bcb1d..df00a5ae46c9 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -548,6 +548,7 @@ int b53_mdb_add(struct dsa_switch *ds, int port,
 int b53_mdb_del(struct dsa_switch *ds, int port,
 		const struct switchdev_obj_port_mdb *mdb,
 		struct dsa_db db);
+int b53_mirror_init(struct dsa_switch *ds);
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack);
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

