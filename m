Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653078;
	b=D50pX1VeMFuDVYormKhGaKqrwFkWJiCke1JOw6w/clZrTEy1vhLwM0hSMSp1jFTFBCPs
	 9t0amCw1zL7UXssTg31j+BiP+AZVGHbN3qezCIWz1JKyuXxLxiyhlhI28Wks/pDw7jS3o
	 JRk2aJXfXnNKtUzbuklkvnBNukq53UbW4r4YaQYr11cWb4LTZyS6ye4uqALvH87Q58POk
	 gRRuAS1FXwBXdQEZcO1E/zbhyx0GzUg+wJJNrLNn8Gw6etPFTVOiieDGQqI7joxE3KKCa
	 LyhZSxcMm4Mo0OUTATm285GSkPdrpHC+/auO4NMajQ4ysHnBOLB0ZZN9JyPWonI4qTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
	b=NT5PKBx3ULSka1Zs/Yx7depLCNymoULDLK4Ogq/W1mtsYFXRD10NgCLc0xAOA/81mEsu
	 mN+nLAzF7U8kTaApBOE876yLYmF4Lj9e0wXfLbJIIcBP6el8DloBZ8tI+yEY4EvhUyWxq
	 nXipuVHY5K9/16rUwlqohcRuYENmohqDv3acpnsJ+bCxI/QrrPK3VuZ+HIas/PjG9V+Ws
	 jXlpTWi1IBWellrh9yu+xTNRaL9rrDn8eWb9BMyBRmWQY3g359TkKqmqhoVRpGt7gXGC5
	 U+YdHLVwOywJloTp/Bd4+PipOTW9ZGyD5etETkfgA43rcZbtcdWQRbFwuA75ax/tQZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0oUyz3M;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8F7606A8A7
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8F7606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0oUyz3M
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22007685e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653077; x=1795257877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=g0oUyz3M9pE5NvVzo8DmuoJiVKr+lEG6XjqgZnUJypGA4hL5Mi7l8Csc3q2TH8pnSM
         u4eBy0FBllABc2t4SvnHlMp9XIHtsPnWh/g1tlopwD52Kb+RhD7RxE1wyrVRlNeUXrY2
         Pd7Y0GaxEXsMVBuw8QhxfYNe+pchh/B7iaXeXVPJhiWhmtOKsIfoz1a2epPsV74pc2bu
         jQZ5PMLTU/HpLWOFs+Jie6cZolYTMahycMI/6gPJDNHk9Iohv9SU94BuiHsr6KMUsSeR
         5xJT+Oc6/+WmiS6JYVxM5Tm4KSmLCGUzLNSxsmGv8cfcOZdLrGO0TNwXiOmRlUzNT7Ki
         EKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653077; x=1795257877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=g21NjzOt3+mXDU9D7Kyl5UAmeAXiLBqroioiUscs0sVPVSnA4nxrTmdm8etM5mtNR4
         ZZ5rDTYchQQ0KuhZCFmtvt8W0FzcpDjL1S6x4F3w/cg0OA/KFTzof7a/MQV+Knvx8Xj1
         Hn244i2jXVKf3cqO6JxNI70SkmsCv24A8wBPftf+BEmiQmxEzxpYC66CMEfteiToQIXi
         tyypj2wyjYZQRtdrkivzsK485j5B3w64JwX+a8GTS43CG4K9Xcavk/UnU+JJOVvtA29h
         Fk9OTralT2YTBq+2rKAODm62utWK4sA8ySb2/b4wRvRGTu7P6QwvteKTEOpLDHsB3Nu3
         vFBw==
X-Forwarded-Encrypted: i=1; AL+hErELCL5rPM3YDxqtiYxujxiGB+2+U9BjPjgubobknpcqgcfING7LRsce3c37V1mj5uV+c8STyrgIlmZ8DMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+If/hhguQ1+DKsyALzYc9tEouUqt2EIyK3kJa6KTpund6ugOCC
	cgsEhTJEvNNZLJ9d5Eq9eWGtmNNbP3t7xsZGY0bagyxQpWecNbUBy+35
X-Gm-Gg: AYBFou2YKEWViq3WuLTvKbIaUs8c+UzKOOQVO/PCWp9U5AUVcJN/N5J4ugJYsuQews5
	MP6d0Dydq9yGAs8n3BAXqLCDxTfeMk8dBLimEe2WGH2/gOTjZiztiK3bg6x14hgsT9fyWRYS356
	s1vBV5TA3U/B1GgfORRmxFVMMolpylLmDxNXi5c5Dk9nExBZAGKactX9LVbKl3Jt6+33L3Xa1rH
	GNg0EW242NkaG7WCDn8tsqh4lWaE0UBc3ON/3lnGrQykZOeV5sfTlBnzyG0yQ8GX8MSp1jsuFJF
	KHRF9YzSMcnHUskLBzX8IhpSpfJDPUmTZyARYWZbw3m89U3Qnq/eozCdqWX1bIhxWbornIC6b72
	493ywbcLoHSqX9U8yWgnU4Kex1ZYyu/pC7/0wIcTRDIySPtYVhv+AEIk7bF+LKCefdXikgddYYI
	phu95fu2jdjZ1P2Rs/RBESGuJqLkMQi9LwBDgDVOAhfqGR7BTLzFHzIxx3HBGiisBkVWoIM1clC
	NDiv/lQ8ebtoMuZMnmJwYt7CaMQPJSVxEDyroyQwbBfXn8/lO2GgHhEkpti2ja8F6NXH6GoXb0Y
	kv7DdenLtzapb/W76ZUTOV2y7GoNilr2hggGfof8IIvmJhHTx2JIHITX6jI+phT8EIftZ4zCmUC
	xXf3mAmrgjpypFAAMrHfAlb30eGNMqEMuwA==
X-Received: by 2002:a05:600c:8518:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb5de1f1fdmr75369625e9.31.1794653076664;
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
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
Subject: [PATCH net-next v20 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Sat, 14 Nov 2026 11:43:41 +0100
Message-ID: <20261114104426.235620-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5d649903be9e..83620a120f18 100644
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
@@ -1300,10 +1301,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2145,6 +2146,11 @@ void phylink_destroy(struct phylink *pl)
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
@@ -2609,10 +2615,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
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

