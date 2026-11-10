Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282643;
	b=sPyWSq7PgKkSiY5xDnLk8J1c6Axb7MtyFhWSSq8M8gknscwqc/4a9aEWVU6s6x8kP/Lc
	 qumVdfo8cpd4wiefYMjHFGJkO2jpigp7jQcIo+f/1w1DS5o2Ub2SRw4Pu49EHWhxvOM5H
	 jrukY8Dq2T19OFgC6JBPLdOb+Ouhzgy6sF7HVTcE+xhr2d1SJ+GWKUC0hdNkEpKQFgAkn
	 yA6tal+4WrNbTCpRnuu2xzQHIh+XoJQx0nqUEj0rTO7M+5r//CLAeJ67EYaSKoMlqEQVI
	 AU9nt2WnPaWxKwNdXTRTnqfl8C4xpYOqLa3UiuxtzGDBuzjJJ/lgNwRfQljdpislNEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282643;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kvy1oROhGxytQvDnk0PwhBHRT1/OW69RQXLRvUpt4JI=;
	b=Uew3GymeLwM/AGoaOa3/yhpMGK4fhlE5OF1aR6rSztT76MOaUjZoFJsuulKzpd69mRbG
	 QIybvU/OD5mOJEP+X79oT8ZCL/qMRI6N3dj04vyDfdV+dVi7oJF+2A2gX59RjPLHFfemS
	 SLNjJED/7Tx1YLNM06ajPBfMWcoH0dQQtf4nNkgjCh6iAiOGJQMPej5TiPGS11be4Rc1W
	 VtZEkc88/3azLUFvVEho3LOaqvS/6dKP547ewrKTguFXxkGt0NGuRynBgJspP4tpjAEiD
	 e1PM7H1Q6sMT0U8SeKtcIRRoKJfkj7wZOcHaKNHQrfIltuYXokkj20BwLX72IGueaNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hn69WChe;
	arc=none smtp.remote-ip=74.125.82.99
Received: from mail-dl1-f99.google.com (mail-dl1-f99.google.com [74.125.82.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B053960A5BC0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B053960A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hn69WChe
Received: by mail-dl1-f99.google.com with SMTP id a92af1059eb24-14394530ec6so2221811c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282642; x=1794887442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvy1oROhGxytQvDnk0PwhBHRT1/OW69RQXLRvUpt4JI=;
        b=cv1MdK0JsVE7LUQomk5ZFxcQewM1brBHMSwEJiY1rJP9kq+kbE6WK/lattSTwkqT+0
         /C7et9Ymo5T+RAecmkMBkx/v4XIGpTl+yZaH94+8kQ/HvY6VJntYY/epwqSGo4DJeUU5
         770+CYwHniAuNBIpqyQYTMNzRbnnIhozW8hYr8l08v9TVzLeHZpxBBWdJV0WrJGxhDLb
         451J3kFblQX1hOOeRqIqMXfR/dO3hvp7GKpX4/6ldlDmws+6JZ1zM3CmEwmyr2hw9Kvn
         YJ3RrTFwcH3EsupiXo/WP2ijNTmsvl8qJF9UwXlgf32E3k8UuAxdge36szI3WbLCvFwT
         Eolw==
X-Forwarded-Encrypted: i=1; AL+hErEdsu7nrdE+1J/PYhCu7Z3lHJBqHp+Da+iZn9HqQvAV+JQ5TXh5fcanU2btzWuFa7ZKNbdujYOWWfm36W4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PrXviYUtEAqv4nVFNfTHTTIIJWlVu+Rmd6elkx2TDN4nxhXIa
	zdMFOozkJuOSe4dZnamJdXj4mOahXDkGuLxeO/P3eTH98F7wMuB3ObaqAu6Cu5IRl3KEd35oRYT
	Q1jq0zLfzl9ki7pyGoMkSKuIb96I+vEFPhuqlpt++WHpNYeBKULoO+97H2wfnHJMbGwqJeuCHcj
	ge9FBxZWC3qhYwk3z7T612GAvR55ArEep6Kg+vAgwds76DI+D1LBBVrY1FHy6hmhbJKRN6g7BGh
	0734Rf4WkrQP5gH+yPaQkdG
X-Gm-Gg: AYBFou14fpXVd+r2qBEsmZpDOgX2F3NrPAaLjrcBDyNkwyiFVxUVEgZSqF6aAQTcdA1
	+akOhl4x/kr9pATRBd1dRCQYgzxV69fdD7Kdx1hmQFFKesJ0MpVn5tP6nJmvPyjB2ljkANZEGcp
	jbOWk2uuIoycD7zlPrwlMGbFdQpXtgJR7QxTndLtE9fGHpJRTcsJX49jVONGOxUgKjQG7My2of8
	kjJdhF9UJFdCkimZDCVbU2C6saB7bpXGXBMeZUiWrlsMt/W1A9SxhEatcyvwgNr4ASs6LKE7010
	St3YdWk0s33U9Cguv9sbwTBSW8ki8YBvL3syQUdEE4l1gDEyy21yLAKns8D7uU9H7+724e+tvMv
	UkTKSPnM9//UyZH4707XFSfzrHtOq16cFOhxOWGlMLRvm4hsX9jbPSz7Tko3nVNaaEOJKArV5qh
	VV/rduxswDVzR+19MNaQDxA6ib0+E+A9Pr4F1l7BRf
X-Received: by 2002:a05:7022:3f0e:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b3b6037808mr2008721c88.10.1794282641499;
        Mon, 09 Nov 2026 19:50:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1b3b5648d88sm72737c88.8.2026.11.09.19.50.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f26ee19so45884351cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282639; x=1794887439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvy1oROhGxytQvDnk0PwhBHRT1/OW69RQXLRvUpt4JI=;
        b=hn69WCheS/+Ebqyt0I2xSH8KkWYWozffeG95BJPuaUh8dWE74/FErM3SUEWFJ1cMfT
         bkdWOaTWqKCDjt+Ay9SyWUT5S004FLHkp47BrEMaNdehz2zzje130kum9b/J99z2zd18
         MN9YgBN+F2W7W1ExqQAmCzjJsQ5T23W7cFVU4=
X-Forwarded-Encrypted: i=1; AL+hErFPTcJuttJp/hDyMtzYAxSPkD2yZ9EqkR1xyp0D2c+sLi/x0ZHH9vmlwwzcNPmoFGHWlKwLr9RUNfn1BR0=@vger.kernel.org
X-Received: by 2002:a05:622a:5c06:b0:536:72b4:b84a with SMTP id d75a77b69052e-555287de783mr22560461cf.42.1794282639528;
        Mon, 09 Nov 2026 19:50:39 -0800 (PST)
X-Received: by 2002:a05:622a:5c06:b0:536:72b4:b84a with SMTP id d75a77b69052e-555287de783mr22560381cf.42.1794282639093;
        Mon, 09 Nov 2026 19:50:39 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:38 -0800 (PST)
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
Subject: [PATCH net v4 6/8] net: dsa: b53: reference count shared mirror source bits
Date: Mon,  9 Nov 2026 19:50:16 -0800
Message-ID: <20261110035018.2169370-7-florian.fainelli@broadcom.com>
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

Multiple tc matchall filters can use the same source port, direction and
capture destination, but the hardware represents that source with one
mask bit. Removing any one filter currently clears the bit even when
another filter still needs it, and can also disable mirroring globally.

Track references to each port's ingress and egress source bits. Program
a bit for the first reference and retain it until the last reference is
removed. Keep the two directions independent and ignore a deletion with
no matching reference to avoid underflow. The tc callbacks serialize this
accounting under RTNL.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 61 ++++++++++++++++++++++++++++++++
 drivers/net/dsa/b53/b53_priv.h   |  3 ++
 drivers/net/dsa/bcm_sf2.c        |  6 ++--
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 6b4a94a97d66..7f5bae290eaa 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2604,11 +2604,56 @@ enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL(b53_get_tag_protocol);
 
+int b53_mirror_init(struct dsa_switch *ds)
+{
+	struct b53_device *dev = ds->priv;
+	u16 ingress = 0, egress = 0, cap_ctl = 0;
+	unsigned int port;
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
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
+	if (ret)
+		return ret;
+
+	/* DSA retains matchall filters across suspend and resume. */
+	for (port = 0; port < dev->num_ports; port++) {
+		if (dev->ports[port].mirror_count[true])
+			ingress |= BIT(port);
+		if (dev->ports[port].mirror_count[false])
+			egress |= BIT(port);
+	}
+
+	if (!(ingress | egress))
+		return 0;
+
+	cap_ctl = MIRROR_EN | dev->mirror_port;
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, ingress);
+	if (ret)
+		return ret;
+
+	return b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, egress);
+}
+EXPORT_SYMBOL(b53_mirror_init);
+
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack)
 {
 	struct b53_device *dev = ds->priv;
+	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
 	u16 reg, loc, cap_ctl;
 	int ret;
 
@@ -2623,6 +2668,11 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		return -EOPNOTSUPP;
 	}
 
+	if (*mirror_count) {
+		(*mirror_count)++;
+		return 0;
+	}
+
 	if (ingress)
 		loc = B53_IG_MIR_CTL;
 	else
@@ -2637,6 +2687,9 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	cap_ctl |= MIRROR_EN;
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 
+	(*mirror_count)++;
+	dev->mirror_port = mirror->to_local_port;
+
 	return 0;
 }
 EXPORT_SYMBOL(b53_mirror_add);
@@ -2645,9 +2698,17 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 		    struct dsa_mall_mirror_tc_entry *mirror)
 {
 	struct b53_device *dev = ds->priv;
+	unsigned int *mirror_count =
+		&dev->ports[port].mirror_count[mirror->ingress];
 	bool loc_disable = false, other_loc_disable = false;
 	u16 reg, loc;
 
+	if (!*mirror_count)
+		return;
+
+	if (--(*mirror_count))
+		return;
+
 	if (mirror->ingress)
 		loc = B53_IG_MIR_CTL;
 	else
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index c4d2a41c714f..d55fba9bcb1d 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -119,6 +119,8 @@ struct b53_pcs {
 #define B53_N_PCS	2
 
 struct b53_port {
+	/* References to each egress/ingress mirror source mask bit. */
+	unsigned int mirror_count[2];
 	u16		vlan_ctl_mask;
 	u16		pvid;
 	struct ethtool_keee eee;
@@ -170,6 +172,7 @@ struct b53_device {
 
 	/* run time configuration */
 	bool enable_jumbo;
+	unsigned int mirror_port;
 
 	unsigned int num_vlans;
 	struct b53_vlan *vlans;
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 1c846f6d7802..6570279cc040 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -996,9 +996,11 @@ static int bcm_sf2_sw_resume(struct dsa_switch *ds)
 	if (priv->hw_params.num_gphy == 1)
 		bcm_sf2_gphy_enable_set(ds, true);
 
-	ds->ops->setup(ds);
+	ret = ds->ops->setup(ds);
+	if (ret && !priv->wol_ports_mask)
+		clk_disable_unprepare(priv->clk);
 
-	return 0;
+	return ret;
 }
 
 static void bcm_sf2_sw_get_wol(struct dsa_switch *ds, int port,
-- 
2.53.0

