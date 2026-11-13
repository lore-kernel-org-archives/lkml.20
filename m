Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529952;
	b=KsBeJ5gXsnCTB3V8lPtU7bAjzLvNuWS3VGxUyYTwzkbkOXiSxt9z3h7qGw0jwyk4Zkfc
	 NVK4NL8xxAbn0lf3SWndSXXE/ENJiXPuBtIWdGl9RcRWhWPCYA6M7cW1N55+0uxlLA25n
	 C/Tes2APO9owCuZ1JHqdNQ8epjl8edwBrlEZHbDrtAKHQZqk+eEQrzOKBN+0590pkjyYU
	 gYJSqKLujurTmgUjmTyvNyejp+B2+qCr2I3GiThJLhZJtNMe5ZAsX7Gq0E2xrAbN3PAi8
	 iBhVWA1X9PXJ/9pks2niLr39PqKjVCnotEKm/d+aAUtVciKi7304lxGuJ376TX+rBkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
	b=Myq/w+c1rjbL/JJDcbb3npj3tt3sLe14DOK3Tzsem/TzOGMrKezchnAZDDmqNcz04aJz
	 qPYDQf+JN0PEPmFRZi3BLrJzDc9kDLhRtTLD7gICJf6b7kZDkDhIWA1x980LXsVj4imRR
	 VSXSKyx6PY0CwJHtPYwDku7WD/uWKCN6HgeSU1KsGRPYLPH0iI2z/+gV5fji/4FckHY9Q
	 oLiBoGZKVFy8JJjZoqkiYK3WZW7PFufGmZhocBmUTZND8S4xiB2UpqJezcQYZOlVZtgU3
	 CAYO0iGxBU+kIMSXI33+ML8Vlvdl/68wnl0yHaqlqjQYUYMUm0iZgrXawthJlgj15uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjqnet9W;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7699F606A8AA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7699F606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjqnet9W
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49a92144733so120694f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529951; x=1795134751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=Gjqnet9WN/sbUEJTf6Vdlds3Seb7eZti22TD54FtT9971cn/+vOENE35r436ZJ2bbX
         AzkE5RhFryOsnMyYBTQLnJTfLHWJEat8uLl0CCJWiJ5T/Hm1qd/5zapsSDAvMY3+IC+8
         06Tez2QayRutopxficRWi9AH84UgkQnYOPz7vGrKaVYq2Toe2Ctc60M6tRpw8j4bN5m/
         1cf6XKUlVcQLQ7U6f1kxNT0S/weW/nDOcb3gdEj31WqHqgNItWhCFh5wauHF5CsNOa8y
         6VTfCUEQKGABAqUd785EbScZjgj5xZo+r9uUmBe1YpXDVNgjKGbfaiRJX+H7Agw65HWd
         u9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529951; x=1795134751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=pSjQMb2egiJmN70ow0bX53Lx0vq2BytERPULsy3R05+zRZvT39y2BmRLrk8N6CZ0ys
         rueVqi48WZ9rTK5ZO9GWl4YxgvzTuNwjU6Tw8t2UYfRyAz1Vb83PDGGRhmVru8dgcFV6
         a3gbK5x3nfV5CVeG9FIGRbXexHKsDZK6HK49ggwmAr06of1hMUxfwvbPZjM65anyMgSF
         eJIqXZQh1U7Sdsbn3egE4P3x/m7mEvIjmu7171Fcw/LPRuiAkH9RbFcE+XePDyLOXHfG
         4x0zB7EzB8ywTLg+jWe574429xGWwgEwm5rEhACAGFAEc0cAVH/xzikFajMuwwpqfYa7
         TJeQ==
X-Forwarded-Encrypted: i=1; AL+hErGMJu3GTlQSZJADXVR+RTbbmLa+17dxoJN8YBmLxyVSdxPNBiiYEoU2flxwHRDaGYrqfvx1o7UyVEhy0kA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P50S58xpFtetqjV+jtXknp8xkd1JXD8r/XX7WaIlkn8G598RZ
	O3v53vjvC+D4TWDSkrePnbPVlF1RTf4p9w1cZBEyisF9fbveOtg7Hw1Q
X-Gm-Gg: AYBFou2ZgG0RCAd1J3B3IClMTdojv6ZXYSKtPHgRkhFfAw7T7HHdYBRnVwxXcwAv68M
	BpoQzRmoHMCdpWDLkSPmFlfDtPjh4slZOJCnQaDEtlKZB/GZK/YAPACGx5let0Cb2mh6FgvBNsn
	E0ZyJkRwQ4x8SHW7YVyC57KhFCkb09buPGLUauRlm6ww5b884cyNetkG412Giewd0bjrBg21Wjn
	Pt/RHO/H47Irum+Yi5OIJPZ+BwvP8lz4Rhld2K7AHkSCD3r1gU+yFA5SIVBihS0nFtUstD2ALkm
	zeC1XWiGf4jQSUPTIWx2oWLGcNTcGBRAkmvk1drtHhx4LMGlnnqF3yCD1Thx4vHTqclIKin+syj
	wHAdrIrSJP2/l8HbjKndJTn6UU1KVhESgU7PtKsOvHqSdvjW8ZU2YTJh3d/b/xaFsdvoxH52cLo
	gLZUzWGpymvoGlLO9jZuKV0RSLlfQ3fkl2dSI3hpv2/FPjszH6/NbLZhnCDcGFMU5Hcrvz593xc
	Oz1l4Y2UDFcTg9QOaHCW5Wh8fgYEpVi4Z2D/9ycBJIxOSb4Cj7ck6RsRkiq+vQa6jl5IrMsFhvz
	vdT/SvyMlHg0pHXc7VAXSFnGdg59KybG6bXNG277ODIRK2GeJQz9RfGkEdFXyU+/xqsSGtQMARs
	UUDwQLfiQc4LZFbAWZiELI5q/BnAM5y8b9QK8Y1d4bnHh7i4hbkAXiA==
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr2019766f8f.13.1794529950823;
        Thu, 12 Nov 2026 16:32:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:29 -0800 (PST)
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
Subject: [PATCH net-next v19 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Fri, 13 Nov 2026 01:31:52 +0100
Message-ID: <20261113003217.197757-3-ansuelsmth@gmail.com>
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid memory
can be dereferenced and phylink_link_changed() is called on freed memory.

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

