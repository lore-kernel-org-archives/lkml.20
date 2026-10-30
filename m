Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394852;
	b=Fh8giTJAE4L/WRM40FmLe7mX6TYMalcYSfl9BPv09C+RpRZAvHhefZtUS9VrWhInZ/CN
	 TwamMZExcM/lp3HKkF9+a0eCshixXgGu9w8XK4gXxluNYFBhjdXlS+UsDaTakAvQo1KPI
	 NKxRJFVLFwsvToVyuwJ6weSG8NiZNm0yH9WXAu2TknThBbVMezoK1OFHYZX5MKvNCRRWm
	 p2zNVDhkVEXIE0cujmosb1/Tl5z95MhiPfTyIxfEVGO7HvJWnlaaWEwasbHZXjEq3OMce
	 VT6SJuRAXnaIdq5e/aqSfjuwGocflXkk7GQP96KFf6b/GxGClqoBv8dwEK+Zu5QRyig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394852;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ElKf65BHYwDdwvUulRpr0xWtFKIs0F3G1kb/zWor7V0=;
	b=SinoAcCOVONpTH7wc7xpfA0cPyhdajVheuCBkba6WnW0BmU6hnWD2ZITTV8qPwW4oBtb
	 mdvLBhZ54p4gc4wgqnBBQI7jF+cf0E9Cjh09i+iMkgHZBVKrmsCdB5bWIj6eoQ1XscL8W
	 Usp7igbelPVTijroolJAoV8A0+fuDkP19ASSrDTkbOLZfUrtLEWqek5ig6RvnxiSEzwU8
	 drPLREdkuMrFRw7fTsm4+ORFdaT3nip5OWzPIG5C5JvB5Nnd4g+p85qV4bQJbHkuSE2s3
	 YVoHsoZL1zRr//0CKy8N3YPmrYbZHmjex92PmDbBH1IaT/vlvH3dAurgUvJjmRa//Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Cy75qxHI;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15060A261A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D15060A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Cy75qxHI
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso449639a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394851; x=1793999651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElKf65BHYwDdwvUulRpr0xWtFKIs0F3G1kb/zWor7V0=;
        b=IIBucYRbqYb3U7IiH62Ma8quX51TKbIpdd9s7qBv8tUA7GtiV4q9ZQxAhPrpLTGuKO
         PXnXSfm8Vi4Jv0vGG2ly8e2vmiZoLJI9+3Fv09GpnblFM1mWYYrSwhfqRn7ww9IIqVQx
         9ZNs1veu1ayPPh8YLFSG8gTQDteAh0Xjf7bNE57yPFV8NyY1XYCcrKzo/KWDzmDCpT9U
         k4iY/JyuI3sukauwjRultweN6AATGtwjZy5xQmqsHQYhy2gnyfW1rTjj9Kj8CTMfO6BV
         x3AQMImDpfmj8UN3Q8V52ym97cSrjBfRQYUrrniB8YcSS9kfmDfnGwocEan7TzGZV01u
         NjHA==
X-Forwarded-Encrypted: i=1; AKwUvByinle0Wg4Pr4XQRWl1HVZBFDJD1VHsSf8J5HhcNCH5L++ZHYbfnnV8xzBmgtvFIGK/YC9n1hzcbVMcu1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYINcnYIbfHp60So6BR+cmKs448r5QKRPjb+uuZyUnPIDXxze/0q
	dk1BIjVRUgZIkVcLD2EmgeLlI4SWI2hCwfssfPx9Bf8CY3D+QY56ZTUCPrNvDAagbFS4vEhHPTY
	g7t5ZL6XfUH+tfVrjLGb7gHZDmkgumbkR1EiJj8yv7tZg1pgMbWhPhaoMeBHSPjx6XW9F2AjTWV
	Rjyi/G0CgHyolo4/4eetdoG436ZJ9V0Shqz3wuauMDKGuQ/udArjdpjLr0SwVKH3hgUTYyIcrhW
	XySkKm7Q9aCfNbALEAzbv6c
X-Gm-Gg: AYBFou0wRbkKRVkRE0ffeQzSpPOvpnpaZLsuFhzk1VtxR1lWfO+EkptxCPnRuihAQ70
	yStOMlgGOzR2eE0pOSuJvRNo/qSXddX5chTRoZWAvH1mx4RYbrDRH7V9BgeBSu+M2WbkFXWM6Nq
	Lb7lxoiMKWatcOQKAQRFwTnA0+Vq3OWNsPq6llYLtmAZE4FMIU0tu52VWSV6KNDDUBVAjG+MqVC
	48n4LLEP1QC7sNBBsKNciVPT1qMYRUYZxWicYFmSwV2kdAC+OygoOcLXDP1cy8FeUfgAzJgofAe
	w4LtwoyW4MOScTgNaRP+XvoWutE9IyZ2bQtR4tFSHeGKFGPdbvM3GnoGXdF8DKAihhOmZed2/RB
	6wPK+JRfsldltBkzC6hwZcCKF2QGtUMHL9fpQohxI1fA6JIHsB+zNomJ7HdSqgETyFOR8G+eBqV
	2+Zole6s2o2IXaQaM8fxZLksiaBUOweOQ+uSOMTd4J
X-Received: by 2002:a17:90b:2b4f:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3ae89741d7amr2961996a91.32.1793394851562;
        Fri, 30 Oct 2026 14:14:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e874b16sm4780890a91.6.2026.10.30.14.14.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:14:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so1786623eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394850; x=1793999650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElKf65BHYwDdwvUulRpr0xWtFKIs0F3G1kb/zWor7V0=;
        b=Cy75qxHI4hJaXHHG1UQOf/JsSApX4RcwrAGFgLcUSCMM/DxHXCI1049PqOsJ2er02q
         5td6RkHGtRGqA5josKq8t2LCjemS/vI0CNHs+dQHZSONXLNAUZJW1/vHmCkWNJu6Zj6s
         ngukaa3I95/df2FT5SYVMRXWCgEBJXUDRtTdI=
X-Forwarded-Encrypted: i=1; AKwUvBwQvs5e3ezx53PFRIhOZ+dkL2hA97qgLMHHWimSUN3f17Tz9AitoHqbDK94s5db5OBIKQtf+IM8pZ2Y5TQ=@vger.kernel.org
X-Received: by 2002:a05:693c:894f:20b0:369:d992:e3 with SMTP id 5a478bee46e88-36a4242b2ebmr4747149eec.32.1793394849652;
        Fri, 30 Oct 2026 14:14:09 -0700 (PDT)
X-Received: by 2002:a05:693c:894f:20b0:369:d992:e3 with SMTP id 5a478bee46e88-36a4242b2ebmr4747079eec.32.1793394848448;
        Fri, 30 Oct 2026 14:14:08 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm10574595eec.3.2026.10.30.14.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:14:07 -0700 (PDT)
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
Subject: [PATCH net v3 6/8] net: dsa: b53: reference count shared mirror source bits
Date: Fri, 30 Oct 2026 14:13:48 -0700
Message-ID: <20261030211350.287566-7-florian.fainelli@broadcom.com>
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

