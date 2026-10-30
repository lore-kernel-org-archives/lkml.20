Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394995;
	b=mdpQImlvyx37WERAEq+batzoiDP3zyob/XPZr6xuzTFYlN8gop2Jdq2u0A+0ZBl9MSla
	 wirTHPbsapThTj2y800jAYGZlmp5si5amO06lXdMzIRDvXk4oigf0fg9VuAPnS/SnOYuS
	 98w9Ts7aghA5NXhWzOvIx3YUlaVwAt3mqddeJDfp+fWmcpvRNiWprM4O2dqHqpXup3Lui
	 bXHWmdpbEXBQ2bTf8Mrws6R+GuzzVXE15wLROKDaABqBD1CNooGCv1vvhSh7EC4qO/ND2
	 8SI2FKh6rRFQ9Up4jd0k7ym2sjqxRUCNDazHkuXlUBHLFaqjATAKVXJmjTP0EMzfndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394995;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ElKf65BHYwDdwvUulRpr0xWtFKIs0F3G1kb/zWor7V0=;
	b=I+0EtReWoOfTrvfcED3q8iVLr4SUgvLL6VvWrqQTJMJOVnhpDrt7w3JTx44trpMmP0f1
	 ziLSn6er/EJb9YBkGZ8+rDBe+IM7CyDbzD9e2zeW7ysicwLciGDgsxmfJHsBqfnG4Nyk4
	 QXhbbpYqGlgZN/IU2zFfstebu+9vGkoZWw+yY3SlvH5iZJw20JDpsonHI4BJh8S1wkiDV
	 EUjxAFLQIxc+MZrw3wi1keO0IWLr4+bILy/x3qkPq5PsNJV5sYBUPH5qeDV0WXphXP9KM
	 YRCe2sIt2b8MbURrx6LMhuT8BHNqVATHT5C+Yb7wqy95DqDLxDbNGVPvgX5jfyOna4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="dqDkOY/h";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38460A2600
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A38460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dqDkOY/h
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so584958a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394995; x=1793999795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElKf65BHYwDdwvUulRpr0xWtFKIs0F3G1kb/zWor7V0=;
        b=ppsTksNbsD3a2BJZfy0Rh2cJ6ENAC0lZJKMZwL10g6MOizm0PXo7FY7briYs3Sk1+l
         2trPAjbSLDOUkdm/fAO+/MDD7Ub0Ico1QAGsRJe2Q1uC8iNk1Y5EyuBZa+cx53quga0t
         qb2lP6v5/AJNkjCWtDwaRekY/IiAk8nQ3KPjBtvB70dmEy4oB3UflF2826snbWm+lgwQ
         o/w5QY2rQULgMvLbrakn7c2XF+tEEtg/O7rUJGP6WoxYFLPaR26bcYyXjJKvrGN8SM7a
         W8hoZyHG4E3CUMbYW3MT4nK59bmltLUf5LgKrpZe07t1qt90B3+K7rnJKJ5xK/ch+Pfo
         uE7g==
X-Forwarded-Encrypted: i=1; AKwUvBwgBfbFn4qSIouTdQpTAjv23Gbv9Lq1N6hdeB/ppftlJMPebwFe4e3bNQftHDjl4LTyPQuEPNVJiyTQZtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGLv+i6W5j3Q7VRRFP+kClSiElivN8w0mpv5M/zy5oSv+rvYJ0
	bufHf6gttRSxtEoY8KVCa/3xsIjYfVVJeIGNa0nfwnEv0XE9GMIdFWZk7cvUP5+JFkRFlOk3QZ2
	1AFECFx1byHplav0LlqnAZUqNukWjVaGvMbxsQwf88W2tDW4K6IS139T50cI0qY0f7RSeiBj7vu
	MFMxYJyfRjuah8ldz009c5OLfSpTTBQLVIKbDUtZHlejLXpanmc6jSI2HzbLuqk8dHFKoqZ7OiR
	+Ne82LT5aL46t5w1XeDy8y8O/4=
X-Gm-Gg: AYBFou2X91jYU1Nw2bE7M4EKp686kYr15v2IBQkbL30sRwmEckUEL75Tuf95a+HdBOP
	NhYf9hWkJ4KUO2kfr3IrkkTjaqAX3C/yjoyxHD3FloEmjgvS8WLM62ZNs3xBc9mk/RqbS3vFaEd
	YWHwo6Hf3JzE8RvUDoQ/qP+TD1YuHZOwMY/J4g4q5xe0nGSdv1HDE2qELw4P3DP02YuyPyrCeWh
	5RmesR3rmXdWBWwmfdUz/nDD/iAk8Hytad7g+nOET2WGl+uZ8JarowmC4CjIcC2P9A30U2M2MGN
	nY3RjIZruenx9noS+mjX3J3BmQb8ay8xd/Z5xgaOouhnCUEtII2A2SjwBARbSBMggqwWwpLMHH2
	BQf2IlNwuqtgU5TG2GV54Lv2TzJJbDf5rZHW2Wg+9OwT/pWm+LcC5kXAxPBKGnCWsjmzQrF7T41
	7wKJ6vGOeOHPDK24JJ1+ce6MJj3L7lShvwegG3CkPY
X-Received: by 2002:a17:90b:2e90:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ae898311b8mr2630093a91.64.1793394994673;
        Fri, 30 Oct 2026 14:16:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e84adc9sm4637919a91.5.2026.10.30.14.16.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso1368896eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394992; x=1793999792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElKf65BHYwDdwvUulRpr0xWtFKIs0F3G1kb/zWor7V0=;
        b=dqDkOY/hAcz3r+w+R9uL+EHlUhnohPS83FFXd3tGPX5P4BDnnHtRff0iouySzEs4P4
         uZYo82MjBGQi32gVkxuNkb3iN9quvYD3VBr/NMzaCkWjCsJWLniDhzkju/nd49rtr42U
         LtvbuAI2TZ+GZSXVwhORmQiFRjKNKQ0HWE8eI=
X-Forwarded-Encrypted: i=1; AKwUvBwRXlFV/uC3FhzMnb4GQXtE0c6svD8rlrjZQAXkYBgHhOVXfqg7wEtjEyNVdZX3iqGUgm9/bDaj9W5QcmY=@vger.kernel.org
X-Received: by 2002:a05:7301:6193:10b0:369:a162:af96 with SMTP id 5a478bee46e88-36a4238974bmr4897036eec.17.1793394992158;
        Fri, 30 Oct 2026 14:16:32 -0700 (PDT)
X-Received: by 2002:a05:7301:6193:10b0:369:a162:af96 with SMTP id 5a478bee46e88-36a4238974bmr4896996eec.17.1793394991319;
        Fri, 30 Oct 2026 14:16:31 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:30 -0700 (PDT)
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
Subject: [PATCH net v3 6/8] net: dsa: b53: reference count shared mirror source bits
Date: Fri, 30 Oct 2026 14:16:15 -0700
Message-ID: <20261030211617.288562-7-florian.fainelli@broadcom.com>
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
 drivers/net/dsa/b53/b53_common.c | 16 ++++++++++++++++
 drivers/net/dsa/b53/b53_priv.h   |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 75033b28100e..b16167c9510b 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2545,6 +2545,7 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct netlink_ext_ack *extack)
 {
 	struct b53_device *dev = ds->priv;
+	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
 	u16 reg, loc, cap_ctl;
 	int ret;
 
@@ -2559,6 +2560,11 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
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
@@ -2573,6 +2579,8 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	cap_ctl |= MIRROR_EN;
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 
+	(*mirror_count)++;
+
 	return 0;
 }
 EXPORT_SYMBOL(b53_mirror_add);
@@ -2581,9 +2589,17 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
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
index 29cca7945df7..910c71618d0b 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -121,6 +121,8 @@ struct b53_pcs {
 struct b53_port {
 	u16		vlan_ctl_mask;
 	u16		pvid;
+	/* References to each egress/ingress mirror source mask bit. */
+	unsigned int	mirror_count[2];
 	struct ethtool_keee eee;
 };
 
-- 
2.53.0

