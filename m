Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506637;
	b=ZmqBgxhrW6EnqDIZkBtDN6sQK3r1QWlC1K+H7bLL1kL22wgu9otKJrH3PSHbUZihX3w/
	 ruDzL6JmMl2K+7qlKeT32xGYZuhrdfoxIU5fyfVEItIKSyBPIhq5mwIyC1pO47OlqnSw9
	 hhJETqHc5EhQzBnDELtuH7Mf6M6CbxHqOAnU614Cd/wPMLrD24VaWYWApbaL/2VTIT31X
	 dBYedZ/M6APKL3C5tou4y2HgEdfpRzwk7Iwy0SpZ06kwxhSEpChjbuY9mt9cbMfE2Lljg
	 b/bYwnpOrHjoGX4mf2W2PQzkP7gYz1UpNCRKMUGADG71NHOpuq1LPHR44XBQGwt1Brw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506637;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ViXjqbT3KRWfvHNHJYyPeRSyMlk/teSxYJxUWIJYwOc=;
	b=z56JjzozZP1GsDTWJZd+wwqI5/XpDAuBtxO5KplCfyHGnfoANjiD0ZJfBOo1JaEMsazL
	 en493Nder/29oYdtOs8RqRc6ENCo20JOYQCDa2BVYdBFyBN0+8HJPOnJdZdVJTevVjxOt
	 7sfnOcC6b2njvMFH90inJfiyLJSdEeiRu7kduDvCf0MmRDjzW1KSRkIxyKoLOJOZ21gQ4
	 HCufX41ITsiZAh9KDgolhrknRWtWr8oVVez9et2gbJ+uKNwfm2GwF0k6miZQlY4hqWv5S
	 riZnmaxZIOkAeqXC+DrRsEtAFrEKOzJbMa5EUj7UYqItt8CBXnZ0a4/H9vKz8EqgMDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gtLqw9H9;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D660A262E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9D660A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gtLqw9H9
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b17cf2fa0aso39879a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506636; x=1795111436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViXjqbT3KRWfvHNHJYyPeRSyMlk/teSxYJxUWIJYwOc=;
        b=gF9SurM/ujKno9Xyf9jpN16MnDvxpBnn40eX0XB+uXVgbTMe5KQ/DP+RV1ae6aO1gm
         yX1ChFonsWjqGeyTms96DV7nPpi+ypOyV1996MiBO/ztnj+P68PQcrKBXDb6xNvbuDSt
         Vq68EAo6Q32hD+ShPfHgGJ58iAvR1GLl6Z2H1lBZiiyJQbYZpmOBFig4KBPV6qQwqhZ/
         8sdqU+SsepgOOx8uC1DBT+wxWB05k5FbUHdIzzgq25/K+VTFMfQn69PpAlcHx7MAPSWG
         AccKjFKtJNYIAtQcnGGvqGUUitAysJOLMMdEK/JXg7JMBXjHFRmrbGH53S32MH7Jxmp5
         F/pg==
X-Forwarded-Encrypted: i=1; AL+hErGOeUBVS3PO7RfB1+MqrsIp+8ih6Q+6jnMBFmD45vONHs1VFfN3Y3hvEYmKDwG/+wcqRTEnkvPz0pH580E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kTTC3TugufEgwg5xRwS08zdBmLmihAeUOjcfJRKTZQFXDIKA+
	9LI5UIF2WgVqTk3O5AzR5AmaA02xbvo6834P8mDiLDhg59Xzu/rwRXB+uNNr9vLDoNpMRjJRIHK
	Vhq3pNUVnZGlyePJqQ2IbYqpncYpqVLrFE78jOube6GRt/bUbPqRM+0gOVeZ1KnuXwp2LFenAZA
	6EeTGbYdWfu/mtWvjj/FP0YKOvj5/4ja80cgxBvsvt7STAgRyzuLpoxA95Xr5SK6yCs08PtrvGO
	C1z0RE8nlAsQPLmElIjtRNp
X-Gm-Gg: AYBFou2Ab5/rkxbeS5X8Z9C6QnR4xJuoisnWQis8Wn1pOLyImTltJrkvhPxfdzspJId
	9MYZn1o86nayrt+E3pxxJ6sD9ovcLZrHAsjZy2B9a0/yl27Kq/Df0XWNXE0IuJvL8Dtvipx3pWS
	x6DowDG/TbhjGPzrwlynPy+kAdzyjiK/CMjHJsEiNM6xSfKWoJkctNmMpxBrOjnn53jk9lia4Kg
	dHfI3qSaY+NBxDNrk/nLg6egKbNsOhGcvIthuTddyKiIUFORyLkuIlmnjoY8I9QUzVZ+QjyY5NR
	Ku4mogxU5/53+bRx7lmfTlXq8vX1BjbbQQ+EnhkQCH7YmUgm9QQYX0CPo8yzfvv7VZF4EUb6fmz
	iM/oyDU8jsK92awkZ3si8GMaw2cSXcXVKYR7vv8Nlq5zVTsi6Sma/XL9H5NAYMNv+YuIQbJm7dh
	io4CXfp3F+HboeLZkU7i+OLpWX5vUm8E9iPP6WdznY
X-Received: by 2002:a17:90b:270c:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b182f60ae1mr5485661a91.58.1794506636334;
        Thu, 12 Nov 2026 10:03:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181fa190fsm2817099a91.2.2026.11.12.10.03.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:03:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so97585a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506633; x=1795111433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViXjqbT3KRWfvHNHJYyPeRSyMlk/teSxYJxUWIJYwOc=;
        b=gtLqw9H9hMD6UPk8eAiKRD/RYq49/uol/fIHOnLx+7m0TEsv+PgxjHORPTWMcxELFV
         RQeuxNzHpwCTUAu+6CVIh7Ebaapj61HS/SKuQR9py7NnSDTItljZQpC+/vkwcUEmNbTR
         jN3mX5+jvortH2QlQoEnFx+2YkfQrcKcuIkMs=
X-Forwarded-Encrypted: i=1; AL+hErHlH9iARNZICFDiw4MPT2gYLKrNB8RaYwHMFQcZGCN1vrKSLZmbc9v5PIWy/QY5M5G7PjmYrqJIdiydhIE=@vger.kernel.org
X-Received: by 2002:a05:6300:670b:b0:3dd:85aa:452d with SMTP id adf61e73a8af0-3f2fe0a3583mr7031142637.31.1794506633009;
        Thu, 12 Nov 2026 10:03:53 -0800 (PST)
X-Received: by 2002:a05:6300:670b:b0:3dd:85aa:452d with SMTP id adf61e73a8af0-3f2fe0a3583mr7031110637.31.1794506632485;
        Thu, 12 Nov 2026 10:03:52 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18abc06sm95004a12.22.2026.11.12.10.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:03:51 -0800 (PST)
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
Subject: [PATCH net v5 4/8] net: dsa: b53: reject conflicting mirror destinations
Date: Thu, 12 Nov 2026 10:01:58 -0800
Message-ID: <20261112180202.324504-5-florian.fainelli@broadcom.com>
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

The mirror capture control register selects one destination for all
ingress and egress mirror sources. Adding a rule for a different capture
port currently overwrites that field and silently redirects all existing
mirror rules.

Read the capture control before changing any source masks and reject a
different destination while mirroring is enabled. Return an extack which
describes the hardware limitation, and propagate a failed capture-control
read rather than making the decision from uninitialized data.

Clear the capture-port field when the final source is removed so a later
rule can select a new destination. This also fixes b53_mirror_del(),
which tried to clear the destination with ~mirror->to_local_port. That
only cleared the bits set in the port number, so a stale capture port
could remain after the last source was removed.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index cc42b2a4870a..715a0969eacb 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2606,7 +2606,19 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct netlink_ext_ack *extack)
 {
 	struct b53_device *dev = ds->priv;
-	u16 reg, loc;
+	u16 reg, loc, cap_ctl;
+	int ret;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
+	if (ret)
+		return ret;
+
+	if ((cap_ctl & MIRROR_EN) &&
+	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Only one mirroring destination is supported");
+		return -EOPNOTSUPP;
+	}
 
 	if (ingress)
 		loc = B53_IG_MIR_CTL;
@@ -2617,11 +2629,10 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	reg |= BIT(port);
 	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 
-	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	reg &= ~CAP_PORT_MASK;
-	reg |= mirror->to_local_port;
-	reg |= MIRROR_EN;
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	cap_ctl &= ~CAP_PORT_MASK;
+	cap_ctl |= mirror->to_local_port;
+	cap_ctl |= MIRROR_EN;
+	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 
 	return 0;
 }
@@ -2658,10 +2669,8 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 
 	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
 	/* Both no longer have ports, let's disable mirroring */
-	if (loc_disable && other_loc_disable) {
-		reg &= ~MIRROR_EN;
-		reg &= ~mirror->to_local_port;
-	}
+	if (loc_disable && other_loc_disable)
+		reg &= ~(MIRROR_EN | CAP_PORT_MASK);
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 }
 EXPORT_SYMBOL(b53_mirror_del);
-- 
2.53.0

