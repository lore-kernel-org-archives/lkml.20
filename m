Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529965;
	b=XK4E135XjHrV7nU3einR6lqIaQe8rygb/ai4LXHYbhVGr+VL91C0TXpqCSmXhtNdKNgp
	 5Xj7soQlIqSyZYSpVq4Bu2ayz40HJd3JXMSFvHCs4Oo4sMy+YVc/SSoCPW1ukVd9IIUix
	 zUGI6S3Ri3GkpDzSQ9QJfnD8LL4JRaI2KQ3K1al8vYlGnvDNTWiCql36firk5rerGRFxq
	 OmZE13RMl1mGIMpblUnFThOZuPmR7tAL2TyfgstfuLnpnLdOF51nK/x7uVgbw8tmLklz6
	 9cv69xws1TZyZaXv3UpxlmyXze8zBOqaF9zoReuRuAoImHZOZ+JdSFJ3ZwyhzGrfipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=;
	b=IOWkGFSWWg3QY2790BmiaCDwKh/19e0MQ4RTtVzLeCjX7KROWl8imztKUfPpF0NHFMFk
	 H61kK61ByF+FrJf4UAUmA8iDcevsk9u/Vkr446RvYDRtfNdFex9/r9OkSevEvqhTLonr9
	 +Va4MRgDdRMiHk3BrEs5jftmSq+J4RrK9dx4t5CSRxJwq28TW0Zgyn8MXwQc2hbwz6ttm
	 pr81QdGaBu4zXVj1l70IlxiVObtnX3hzGBJwBH/fyiDEE/7lRyCieynppTzEG2s99WD9m
	 hZeRM4tmt7t5TvD0+LOs2jqcgAe0mTLg9KkI/PdTGuyYoWj4vuln0GRLagLD8UKs1nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6Zqrcms;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65D4606A891
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65D4606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6Zqrcms
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so384388f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529963; x=1795134763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=;
        b=s6ZqrcmsfrZxKw51u0kIJBbXbxP1aIplLOFEAF2AEon8PK9evOz3a/LxZRmDm4Eq7Z
         qau2gRwBQYkzBLsf9GIFaawrSn1G1wf2s0YdQNKby5/MPCOea0zFNbFeRW+rN/A3RQz9
         vBpUi37Pd0jjyCSCRZsUdK7DZ+RtcvxJCfgKAHXAoWqH4+PSe1gCBD+eLvDSpInxTLAh
         2De8XWBr0RojPqk6BzkkHFu0PanZB5Vb+cvZWZbVAWwqJ03ibU2JXEAXfMaYaBuBmmS4
         YWTwYC7FwQwHSa9Q+CFHBwRsVuyCOHIGKkc8Bxhwrsjd8c5B8pkUWYOGT/dmI7Rj+2xE
         +QnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529963; x=1795134763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=;
        b=DOIaBIX4eRRqmDHya7qFejJ0zhANpwnGK7Ki7gl0kpD+a8hDB5iXtS/ueu2cL4zSCF
         LdqzUUczS6m2C3VJNXUA9sCX+TjZwDamkNWnZo/FBgYeQywvlnWdBddS3613zj6ow6nD
         zFHSAnkxxc2AIFev8fOfn+pOI2ZgBr90AsN8QjweKteWSIbiifQPh0bl8UIVjfmYK+v7
         G9u1G+hQL/g3pgPliFQCRIo9LTA91Z60MnSHKmZB51CwRcM7COm8yiuJJkSNKw8jv72p
         h/JP6Yx+RlkkD/Ju3wsJjRZMxFze6U1L84W2axUL+UpIf6B2gUPLm8nJAm4beh/sO3g7
         7w3Q==
X-Forwarded-Encrypted: i=1; AL+hErHt2JWH6lQ3ob7zl95OsHuXz/3/OlDH7RwJhcgB5IHKNzseRQqNyyyJblwE8fQJ6PQdBiOg083nUsttv0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ypF4VG3tvWyhxbTtqzpctsf42w6Sm6zsPiBDTtYZ2kOQ5jGoh
	0oWOZCy1qWNkPQZioo9EIPPWrH8zJfBnBf0IkjPnxIEiLjoMer6FhhSH
X-Gm-Gg: AYBFou1ILw1/2ypt0Mts8zVZIWmT8IK+VIFxBHwR+p9BGJbv3gdSLJNjoCNpFsTAhWN
	CaDh9JFAbR4HecX+1KamYuJ3rq3dxspbK3ibqfcBrubRj8tXUKyivefhLQpbFyB1zb2Ud/KoWdo
	CdAmuA5yu99MsRjEQohQWSFFdTsQCmB+9i6JcWxm4JkuFgOOdoHPdgo4A6ESMAtKkaA23Ei+jry
	0QpQ/7Zs+FfGD2zOdONdBteatQQsYlDRy3v9UatUyAbddXwWNYv3dl0izrS3mXTTHqcEoKYdr69
	ryFgfKGUaKnv23DWmDx7wB0ZmnKOV6vI+dCbobTbw6trI+SfjMI6WByIvkm25wnOm5MVwLRBZCf
	PeSugg6PtXSIw0uVe9NPxyBi+qFXx1EOpp+CM0XjQ0BEZl+j4syL4ySKSOz6Qn1fqjNbfWoG9zC
	b3ieMfZF3wh8tR/gWY3W3JXBXJ/8Gt+m6ZbFfGzQrkNdia0HcfOONQvtdkjAO6bcT/NN48ZU1n9
	ziFylRVmC7Te1fFrrTSBCMW0FF6rnURt7b9vQMHh6k84BCxP+TFBnCkoM2/q+grXJnlegCs/Cw7
	yAKtqksAQI7gFhRxbP0le3vBYthYqvYMME1UIzctMz/I4M85VndBFb/x96q33hU1giz4qvmdtLS
	SVJOkX5lXs7vBUV3WKhlFPNoZLjVVoK2dumSzprH+PHPPpYkLcjy+0EX0B6ss2E8WgCO2CfzbXU
	s=
X-Received: by 2002:a05:6000:2085:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-49c73a050e5mr2244067f8f.54.1794529963290;
        Thu, 12 Nov 2026 16:32:43 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:42 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 06/15] net: phylink: make phylink_validate state locked
Date: Fri, 13 Nov 2026 01:31:56 +0100
Message-ID: <20261113003217.197757-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

In preparation for support for PCS release/late attach, rework the
phylink_validate functions to be locked under the state mutex.

With the introduction of a notifier that can be called concurrently while a
phylink_create is called or an interface mode validation is being run, on
recalculating the supported interface and capabilities, an inconsistency
can be introduced with 2 validation run at the same time.

To handle this, make the phylink_validate lock under the phylink state
mutex, add lockless variant for phylink_validate_mask and phylink_validate
and add lockdep check to make sure the mutex is held in the inner
validate functions.

Function that already run phylink_validate under state mutex, are updated
to use the lockless variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 47 +++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e2e0b313fd61..918aa95e5a64 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -9,6 +9,7 @@
 #include <linux/ethtool.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/lockdep.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -550,6 +551,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,6 +631,8 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
@@ -648,15 +653,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	}
 }
 
-static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
-				 unsigned long *supported,
-				 struct phylink_link_state *state,
-				 const unsigned long *interfaces)
+static int __phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				   unsigned long *supported,
+				   struct phylink_link_state *state,
+				   const unsigned long *interfaces)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_adv) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_s) = { 0, };
 	int interface;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
 		phylink_validate_one(pl, phy, supported, state, interface,
 				     all_s, all_adv);
@@ -667,8 +674,22 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
 }
 
-static int phylink_validate(struct phylink *pl, unsigned long *supported,
-			    struct phylink_link_state *state)
+static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				 unsigned long *supported,
+				 struct phylink_link_state *state,
+				 const unsigned long *interfaces)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
+static int __phylink_validate(struct phylink *pl, unsigned long *supported,
+			      struct phylink_link_state *state)
 {
 	const unsigned long *interfaces = pl->supported_interfaces;
 
@@ -682,6 +703,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return phylink_validate_mac_and_pcs(pl, supported, state);
 }
 
+static int phylink_validate(struct phylink *pl, unsigned long *supported,
+			    struct phylink_link_state *state)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate(pl, supported, state);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2117,7 +2150,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0

