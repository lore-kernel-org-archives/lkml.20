Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A10B4477EA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022687; cv=none; b=nJZhetBevJ0Q38X9KWoO+ojER1lPRpn5a41A8n4YypwOav1Eln8HfmVmBGu947ZcGbEaH1pQ1qI0O64Ps/+8HdutS09GYJYVWDlB/UAtI6Fr4pgIBC1BtKUM5Oq4+KTEhYC5KtqnQGNlyQxcqk7OL1QyvcD/78yOSXx7ROnU5bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022687; c=relaxed/simple;
	bh=Hfn/RFfA59PXEqWm88i0jT6Irs15cdflbyXalU9LxMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhQf8/bzttnX8grwMa2b63YCUrXjgi0fN7it3fIeK1RFAFeAakQG9pIqSnKjTeRO/Xkn6PR8Kr9ZWNPhELc62oI/tv1Q7MkdhGbRFqfI0w3O2b7BcsED18GHyD9aRWEsewylUJj63IxyOfu61hKWv40Y7loA0xLHF7+yP3243Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1FGusiW; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1FGusiW"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso3109906a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790022685; x=1790627485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5HDWmpx6LncuH8zbt4GsN7mum7FN5BQZYEBCPrt/7w=;
        b=U1FGusiWbl34A41xmVjEU3r/ysZfm+2S0LtTv1d8AozvQGsPZS9dK5Fp5ZOokEauSZ
         WEDJaXCi8J7fdWJCvI1nyR1BjsPNgh5+XsCqLQB/MA86aJm7l4fO4L0g9EW4rQPKB3+9
         oFkU8cjZrJYjs+UeNsR0UJ+es4OcsYnVTe7gq6ABHUkHAgaCIawUbs8r6ZVkcLqSVjnp
         8ExxtZv1LPWBGPhY2vuightI67MIlXfcQfLYpLXoeWWUwNJv1cgKx+DBdHKHIJ1emdJz
         NlDZoHzVEWfVLpH2RWCHg7TP/vhxHXZEempEShu/pf8a4uFNWKl8oAHAh/xbc1tr/Wh7
         sbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022685; x=1790627485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5HDWmpx6LncuH8zbt4GsN7mum7FN5BQZYEBCPrt/7w=;
        b=uqoFMNRvsFWjSRt78AYNvcYU4VTj6Pte6eWBdBr6qi9nCBsvfkp/aPZ4r29zUTv3cK
         Zdclh/Aa5m3mG2wo760ynCvgSeg1a/ocnCBTwGvJL+SkalxfO2lNOIJK1tDPH8lkKrF/
         b2cG/JTBvuYc1xCihjgIWQWc1P7eLQ9w50AbuM9diQ8UYh3/9dyW8bQw16LiZygAiUa7
         4+eS4TIH9nAUFhmFiES7LigrVr5x44hIGeCydRWp4mwPdYw3N7CTpjzRSn0aAnwQEbnF
         aqrdnJejELkuL8GmslhUAkolVBLCEpqoaAwz4fkXZDHpd944XQot+OITxZAgd7jInG2D
         SlCA==
X-Forwarded-Encrypted: i=1; AKwUvBzhTzRSEXtKJHaNarGFVNSl/wubfPJsPBMdUEzOdOIAiv4qdD9zEdlHXtG+2tVcDyi86Y0cHmtsWpyesV8=@vger.kernel.org
X-Gm-Message-State: AFuF++m12djvOCI/mpSdux4L1QHuubQ6BvxTSmSseLQUAw19Ge37B9Nt
	q74sp5lq1KLAxDdJ3n9xB5agVQa9yfQXdAE7LRkV3F/wYwHu2cU4fpZq
X-Gm-Gg: AYBFou2nSAqUcIckdked1dQVtNnfSURmIIL/Xv98a442oFi2DssSwE9ZoSSX8ddqtGq
	oHXxrB+K0Up13qKW7slQuEhXvYWOihueyMnyduz2WQVfwabWdrHF9ZU6NCKFrZT8BNPzjPuDcmn
	1/YClRUQHz2OaHjOyPPotkuJjL2XS8LHQV1JD2e8Fp7HZrX7vVoD3muUXwQBXOLnzBLEMNtQFgm
	USv5MEWmJES6kwTKJlaPEcEPa+d9scZ/enwNDU4wFh9XsK34+S6kAep086Vi7rHQuWHM8pSSj4p
	XUvxNK0PYC1NPbKLp2K/Rma9iewnsg6DP0IBPk9RnqzragD1G1ljiogClEfvbRktkjw0zHdYpsN
	nZszPNB6weUYdsA3kksSXZqlyYT3IFoVM9wkHZqz1Fu/xznllwFyQayWORNMVuFVUhuo8j0GjX0
	Jj/3IOt53/4QvsQryP6nQq2ZkHqKQ64eJT5igWiJsYpq3Y/X4OJyGpql00iv0saRlKcsJ9Z5HQS
	MyygqViVnsuc32I8GDgWv2E
X-Received: by 2002:a17:90a:d64f:b0:39e:4c80:44b9 with SMTP id 98e67ed59e1d1-39e54dccbb8mr18482940a91.28.1790022685159;
        Mon, 21 Sep 2026 13:31:25 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069918587sm447247a91.4.2026.09.21.13.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:31:24 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 1/7] net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
Date: Tue, 22 Sep 2026 04:30:18 +0800
Message-ID: <20260921203040.1203911-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921203040.1203911-1-mmyangfl@gmail.com>
References: <20260921203040.1203911-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

yt921x_poll_mib() open-codes the same container_of_const() expression
that leds.c defines as to_yt921x_priv(). Move the macro to chip.h as
yt921x_port_to_priv() so both files use one definition.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c |  3 +--
 drivers/net/dsa/motorcomm/chip.h |  3 +++
 drivers/net/dsa/motorcomm/leds.c | 14 ++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 8b0ac5fc8c8b..38e7879a9f1a 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -608,9 +608,8 @@ static void yt921x_poll_mib(struct work_struct *work)
 {
 	struct yt921x_port *pp = container_of_const(work, struct yt921x_port,
 						    mib_read.work);
-	struct yt921x_priv *priv = (void *)(pp - pp->index) -
-				   offsetof(struct yt921x_priv, ports);
 	unsigned long delay = YT921X_STATS_INTERVAL_JIFFIES;
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
 	int port = pp->index;
 	int res;
 
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 83cd454955dd..9cd1010eb970 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -989,4 +989,7 @@ struct yt921x_priv {
 	struct yt921x_acl_blk *acl_blks[YT921X_ACL_BLK_NUM];
 };
 
+#define yt921x_port_to_priv(pp) \
+	container_of_const((pp), struct yt921x_priv, ports[(pp)->index])
+
 #endif
diff --git a/drivers/net/dsa/motorcomm/leds.c b/drivers/net/dsa/motorcomm/leds.c
index 87a6b9cf6068..dd5b3684250d 100644
--- a/drivers/net/dsa/motorcomm/leds.c
+++ b/drivers/net/dsa/motorcomm/leds.c
@@ -12,8 +12,6 @@
 #define to_yt921x_led(led_cdev) \
 	container_of_const((led_cdev), struct yt921x_led, cdev)
 #define to_yt921x_port(led) ((led)->port)
-#define to_yt921x_priv(pp) \
-	container_of_const((pp), struct yt921x_priv, ports[(pp)->index])
 #define to_device(priv) ((priv)->ds.dev)
 
 static u32 yt921x_led_regaddr(struct yt921x_priv *priv, int port, int group)
@@ -321,7 +319,7 @@ yt921x_cled_brightness_set_blocking(struct led_classdev *led_cdev,
 {
 	struct yt921x_led *led = to_yt921x_led(led_cdev);
 	struct yt921x_port *pp = to_yt921x_port(led);
-	struct yt921x_priv *priv = to_yt921x_priv(pp);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
 	int res;
 
 	mutex_lock(&priv->reg_lock);
@@ -337,7 +335,7 @@ yt921x_cled_blink_set(struct led_classdev *led_cdev, unsigned long *delay_on,
 {
 	struct yt921x_led *led = to_yt921x_led(led_cdev);
 	struct yt921x_port *pp = to_yt921x_port(led);
-	struct yt921x_priv *priv = to_yt921x_priv(pp);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
 	int res;
 
 	mutex_lock(&priv->reg_lock);
@@ -353,7 +351,7 @@ yt921x_cled_hw_control_get_device(struct led_classdev *led_cdev)
 {
 	struct yt921x_led *led = to_yt921x_led(led_cdev);
 	struct yt921x_port *pp = to_yt921x_port(led);
-	struct yt921x_priv *priv = to_yt921x_priv(pp);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
 	struct dsa_port *dp;
 
 	dp = dsa_to_port(&priv->ds, pp->index);
@@ -374,7 +372,7 @@ yt921x_cled_hw_control_is_supported(struct led_classdev *led_cdev,
 {
 	struct yt921x_led *led = to_yt921x_led(led_cdev);
 	struct yt921x_port *pp = to_yt921x_port(led);
-	struct yt921x_priv *priv = to_yt921x_priv(pp);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
 
 	if (yt921x_led_trigger_is_supported(priv, pp->index, led->group, flags))
 		return 0;
@@ -386,7 +384,7 @@ yt921x_cled_hw_control_get(struct led_classdev *led_cdev, unsigned long *flagsp)
 {
 	struct yt921x_led *led = to_yt921x_led(led_cdev);
 	struct yt921x_port *pp = to_yt921x_port(led);
-	struct yt921x_priv *priv = to_yt921x_priv(pp);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
 	int res;
 
 	mutex_lock(&priv->reg_lock);
@@ -401,7 +399,7 @@ yt921x_cled_hw_control_set(struct led_classdev *led_cdev, unsigned long flags)
 {
 	struct yt921x_led *led = to_yt921x_led(led_cdev);
 	struct yt921x_port *pp = to_yt921x_port(led);
-	struct yt921x_priv *priv = to_yt921x_priv(pp);
+	struct yt921x_priv *priv = yt921x_port_to_priv(pp);
 	int res;
 
 	mutex_lock(&priv->reg_lock);
-- 
2.53.0

