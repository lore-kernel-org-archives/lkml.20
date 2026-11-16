Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863403;
	b=0E2NnCFfcaEytSnVSaaghyKi/6Zcqv5aLi1ZSZVQw791hJI8n4+4+uuTMxPHJIPaURop
	 oXFO8zrserBSvX6Gslbqjjs1/f7DNGCM9rci1XTOjh30UA5s8fF/XR3YfeC6UpkaCPZm4
	 m55i1nfFxoGT46oiDFj13zkqAG6KKv41uN1tgVvIDfbn/m/EylLBktynhyveb5z5MLPHX
	 1cL4j10pqxvzDpT2mPBxi0+hvBwv70PCLmkhtXLZxTsDy3+8zxWxxfB0236G1aHFUuUDG
	 +nEDiUP8t24AKNjzg1UzRXfKZBZc/+65AXTTSjClYTtLNzdaFFCaA3wreyS2jJ0/Hfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863403;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kJJKYqk5qfBQROpfR36DkUxtCSrRkzG2y4RMp/6I4f8=;
	b=S+HVecK4xlYltpRTIsb1Z9UW2tt+zMPdFPklyt/HSi5tKIaBSKb/kvyxQa9BX2WIuZv1
	 xsVmRu1DHm60jZarN+ZPLmgWkhNBJ2+ynaqvTF+SmNJ7+vtQ5mATt3B5shnogpxBx5Ydb
	 4Y+uSDlZQsGy8csGbLRXUiaDjInWeNnkEE/hmtM95aWC0M9M25ntUL4LNkXDq6CqFMRw4
	 fVjwxQJVrFPr04rwIv/cOW5MQyz43sKDXEAev3kW/rRWShPdCLQmUu3Lrjzj7cz46xnuV
	 NAKkqYEYRUY/nPWmf+U7l62l9rYUdNXBz06nb9DuxZnlj5GJI17JxUIgu0sG6jChDwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YajL3D0v;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDC60A2629
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EDC60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YajL3D0v
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cddee4abc57so468448a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863402; x=1795468202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJJKYqk5qfBQROpfR36DkUxtCSrRkzG2y4RMp/6I4f8=;
        b=OZerJoy9KSK+Dvic0W/dZNfNOXmxEcmMOtlOQNiIZUEd5ED/5yFYyenF4ZRXjgRzGP
         yRDL/bSRtHS7YjPF8+igxkPZoz3fZgXqCbgz0nsVSH/uMSYo380iWUOlXksNJI8GNcix
         Z/mB6Y8Nz4PgJvrv9gLmJTEgjHznC2VOghdjwQgLMi8dt/dEZ+WHo+BXtYu1vI2HtufC
         hfviC3kAojrONRTz+lmEnF9I/2aZCMftUdnqWgQb8oRKDRaZOriZW9GZl0Pldv8Wmyon
         PUYpqo2U/J+yxA9ZQuMdd7swOsw8Lo3HkvrgqMsyBfizpEGHrvvQRcBLqoexqgdgtG6j
         rgvQ==
X-Forwarded-Encrypted: i=1; AL+hErHjhxJG64L16oeDt8jgcZ+K4IR29r+BL5hQSSVuIHOccfgvXl7H59a0y7lIXNK3mqv1GhKP3V73aIc2X9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z83HZmgx3WLUUFGFV0SGcoH8eg1mLUEIzcwgr5DWqOVkLCHZhyj
	uMF07S6mUE+j9nja75XPrBBHtJTtiNCBcD+39l80kftJ1mByV4gGbhRw4Hw4Dq9z5DgvcWQLfXp
	EMZjR4o8dE7c4XNdhp4kXWtXPc3bKghvGkN03pD2jWBETmplZerXTGQ27Za/PvgcShCzRVTJkK9
	YuTCJueuf2NH/dOIL4TuBWVyg803wrT+Qey3HKlUhvV5PYOSuNNAW9BUUBQ1vkaX7/qadMn32ik
	WpeZhXDXbJxaP99l+97znNN
X-Gm-Gg: AZFdTZdY9NsvM8TWAqL6iPzmDWhy2+T1zKbEKBTgJws10p+xFJ+l+kY1Z4GK/P87+PZ
	ymx0SNGzRpryLTdqDal06EK1xBKCTsAlaDP/ER4jYy82sciwrp13fofBJVFz71W6k+dZucZNVul
	MxlIhv888+bJJ0VN21RKpyigJjJKcTUIb06yRnoximOGaNcXRFO8cSPNbHB0OUCGIwdzDmHNzha
	bxTKANsl1mxAGI8QVkqYgSV3JxRwr/7hU0saThWGToUtn7njoa2X8YQGR6qh2DDjhtW7Vw+SFOH
	6g++m4kNQjzY0teEV747ueQKVI/JfuQ3PgjsftVxZ/6Ik3AianMapycC1UY+ZCTUXc/AUObYoTP
	k2yaYgrvTd2ZvUbzDbfECUMg/hYGDrs1UrXE6NJOHWAq8HSAERwBWKT6zCZJqsYOLjiVOpDbjZv
	5aH35tnbse8El2Xa3lRNxDuw2aHxBhFNnD0qnPEGXd
X-Received: by 2002:a17:90b:3c4e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b1b0b67c8amr11565598a91.46.1794863402074;
        Mon, 16 Nov 2026 13:10:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac02cce6sm353361a91.7.2026.11.16.13.10.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:10:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91256a7b7b3so64644356d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863399; x=1795468199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJJKYqk5qfBQROpfR36DkUxtCSrRkzG2y4RMp/6I4f8=;
        b=YajL3D0vTf8Q92qu7fSwwW+vTQGnL5X0HOtQvaaZTw26rw6vOIsPWc0i0QSy6jmsbe
         +g78t22cwkqLOsk8GcuNpJmM98KepO95/BqSSpR9ah8StK3G8OJKoaxkjGwHnSnjOwPo
         NxLNXbAnkWwS4Bb6t6LiQBIjvgrCOVJs9gSC4=
X-Forwarded-Encrypted: i=1; AL+hErErU2RDl64eIfAaV7JTHTMtacpXS3cd010n0nlt/yJX1w13dbDP0cyO4Ec/98taWQh7vWdSg6IQmF5MQS0=@vger.kernel.org
X-Received: by 2002:ad4:5961:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91f241b8f9bmr178214886d6.22.1794863399623;
        Mon, 16 Nov 2026 13:09:59 -0800 (PST)
X-Received: by 2002:ad4:5961:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91f241b8f9bmr178214366d6.22.1794863399141;
        Mon, 16 Nov 2026 13:09:59 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:57 -0800 (PST)
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
Subject: [PATCH net v6 6/8] net: dsa: b53: reference count shared mirror source bits
Date: Mon, 16 Nov 2026 13:09:40 -0800
Message-ID: <20261116210943.1352656-7-florian.fainelli@broadcom.com>
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
 drivers/net/dsa/b53/b53_priv.h   |  4 +++
 2 files changed, 65 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index d8dafa9e0c44..98696bce368f 100644
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
index c4d2a41c714f..df00a5ae46c9 100644
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
@@ -545,6 +548,7 @@ int b53_mdb_add(struct dsa_switch *ds, int port,
 int b53_mdb_del(struct dsa_switch *ds, int port,
 		const struct switchdev_obj_port_mdb *mdb,
 		struct dsa_db db);
+int b53_mirror_init(struct dsa_switch *ds);
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack);
-- 
2.53.0

