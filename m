Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846866;
	b=CZO5SqnDowu2xCseO61eh1VvWc25FF/UDoDIxPyr3mXtNw4H1N7b/UtJx+cVrarNTdA1
	 wDUyuuKb/Z2m35kYvptWZn6qHN9O++0FsWHkMe7QuuJhfmaHH24zeLst9PFe4no83aBf6
	 9LoWMxodMk26E3Vy/XXCTLiM7RIsBXGfRI5qxbLtmikKtV5YHRu9i9aioT4cyhhwBoD3N
	 iOd991DQuBxg3O2T3Dhj2DO3yLdwZZQnMOhk2E4lkSHlEhkTVmL/LsX+OsezBXy8LJ+Pe
	 h+wK3ROU8pXrOV6NasJTCzyGQk3Zb1pW0q+AU2n32M7oJvPfzYburOu1aJas5U1gT5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
	b=zVn4cltSOPAFuv6D+cxYxnNLwqm4Y1+XZkGoh2mZOC4HcXKciJHiOHo5cmsZ3TxnNLyj
	 +XZpcJ4RlwSOAGL27qGW7IgUucQbVLBtEfdcEEXYP/zHPVd1S/naRUs3foqYYzs+vLoV6
	 2Waz9/WPwmTpIEl9Wh3RgajwYQ0uZsdViLB/yWU+l5s1BGGb3OUnoI2RbYVijPLM6P7ty
	 nYXgaDYLZBgvAdAqN3yRAUdJe23rpsJIqlAMQw6B9arXDQw94NGFXxrfTO0Ar1WzrXkoy
	 kKOmh7I1taWxwXmBZTxWF5/IO38GOiAjbAEmTtPjTiIXulBljf4ynFHEkce1wJSkg5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8PZobkT;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFA4606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FFA4606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8PZobkT
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49a92144733so1463750f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846864; x=1795451664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=y8PZobkTNSe286sthC9hFeEIYis8FpFW7RElSVsmvEjhLIk5rhlvTHbYfHMdZSs27S
         G+EV170+v9GwVuAl51fLoVMULj9D/mL1FN/R3uLdFFKrt8OYYE/QgPCyxDX/7Q3cLjX8
         ybxq3kVQQolmAIu1eU59Sfwi/A6iIdaIcJ3zkQcFWLKKh+3V9002Ut1jI04cOgijC212
         U7zvppPtoHWr9awCEu1AnUCfDh0YXi5Xo5HlgaOZc3/2XVnaXZ4vYbnIGTmCoC7w25fM
         XMOpS+GBZxvJWJQ8GYM1GRZeRRhNGO9Q9KQkdLJ2j56Er3jHA2BVxaxVIoNYniRGzlD+
         v4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846864; x=1795451664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=FKa1vrls7gFEQlHcD95JTKrF9ejoY/edSYO0zxCM15+YdH6c4MpRXTY1kiucXkWsWC
         CiMDdZz2Ae84I74/F4JIfePye0rdbzLRNzGM1PvdgO8AM5syLtMzk5cAOqWGBLga6yyb
         J3oytQEjfT5XyKSXgGiyu84+MB1MeEZgt8TJLqTcXTi6NWDfpJlx8/xF9b5XG2SRPVvX
         eeGuBQbq26FCJWM2VoGplNgyToLaEqaoJ0z17QvRfAdUtt7KHuX3YoVJmQsA3YIRMovW
         kNPxWzJYi5oilt2TC2uEGySDnsMrezbx9dnOsfiQKi+aK9zYsWDOpEB4qIS8hAPtuHy5
         719A==
X-Forwarded-Encrypted: i=1; AL+hErEaY0y98lTIkCGL0Tj6mL5SJDDdKw/6HwbBhd1+UmF02wmMDIzAs/NscSq8LpLR2RnRc2wVkPHpv1dM0DE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FxYH1X7pu4Ryzn31GUe0x8/bl24DBJIgKyb5GA1MxI0ZZvW2r
	dJ2O/lioDEOhaecYxQvnvcL4NhMyy8eBI9S0SUZNIJd+C24JV1hY8Rgf
X-Gm-Gg: AZFdTZejOz3mv68IPBZ6q1aCHwWFKt9Paw4NUfaUX7ob5oPoFC8pcLQ8+VVgqmlX6Ny
	bOKbb1Z9P4uobEHGtCAHO16idLWH8Dxt4Uow4h/0UlR9fG4GCA+06QP0EiqjcbtH/qcLEXXRD/w
	3Olgf7/Dtht1eLuCVjS+/vxB/002xUqW3pWJG1RVXHcy3FgZ3+yCwJo5tTfBGmSEY1Kh4HoX7Bk
	d/3ytOidWcGPrAiUPNX1Nb5wJQAn71pMxFowXVKxu3ykfBKI1Yg6UwYVb6IIJOp4GcPdeFafYhD
	tQHqwjU6V+5uJPIdj0PB0jHYXPS+aVTECo67qaATZwlAoGyssnwQhB7lYI92mGUYkZXjBJhAUs6
	Y6yX/0n4qOBeXM1Trd+Nm21kUqLnGx9hgobDMdfWxRxwLJ4p9W9WDgD0oOOY2Y2GN7GjFlCAr6S
	vvcat/V8qVljk7Sfpn+D2nTPnfHUMowoghueCyRzZU+TkkAq5i3QNs23WwVI5N1Ya1zCs4ehHqa
	qvv4EqXIUDvV8vGOY4TYIzESj01MPqJ7OlX4IKYuQhjCb4/FruKXPGL7S/SgWa5YL9tX84AfhOv
	4TuQbbicNs4RPjn71QCF2TK1CqI5EmugtsISVQ5tB0BGS+RCpIxoLc+27OBnCEB6gmsZ1s2TMgO
	vwXfJXwDezsI/kEV4wT0enE30Pqqnq1qX6TUo1PTtwgRYVlSU4DFsiHE=
X-Received: by 2002:a5d:59ca:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49c723fb77dmr22962598f8f.37.1794846863544;
        Mon, 16 Nov 2026 08:34:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:22 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Mon, 16 Nov 2026 17:33:44 +0100
Message-ID: <20261116163412.551438-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0

