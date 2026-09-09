Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D34A3AD53F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980778; cv=none; b=a91j6j9x+mM+uU/EQcyGxivmflOzLwtUarQKnRWqGaNSn//slFD6MPCJ5Ds5QHna196hlKpvdUiLuBEdAJi1jqKmpZLUg8/beMjIPZkxW/i4EKENa9E9yOZvqVk4nnNvRJH5x6DF9Zaa8vYdpWcRyJyZPxltTFzR9+hFadBwho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980778; c=relaxed/simple;
	bh=AA1XKuFsWbOGhsqN5VhG4cOUMQCdMAYYicvgwb2LxKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9RmeT9XUswQQJALzsL+VfAW6jGdUDeW1E2gA3WwoxHOftqFj3ZeaZYysgOZrWX2gg7N+QgSKZ9KuKjGdQPs9QeKf8JFAJ6cwgt+r7WMQ5r6/cXYAvtWuHdwk/q/AHRMw4ckyLeJOTxd7aBiRPReveSCg12u3MJQ9h/tz9OAQrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUwTzPaN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUwTzPaN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06b03so10699325ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980776; x=1789585576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bk+YtOMCSmx0TWEmBa1/4a0coFcVyJrJnWGNi0NAeBU=;
        b=SUwTzPaNK/6JY4fYojzcjkV9k9/cbl+6oYyD2/+x+x06OJyZi3RaWy3mqK3kkm/1Nb
         noaJEylP/wSoMa0CvY8fujp5tCTgHrUpOBiBzuWVB8VAj48PgdjQpvRegae84agvmXg/
         Qsggzk/A2XpfL8CCvDhu1TZNHY5QpLrAotz6969GJryUS9uV5AShH2NVMUXaeGL5bjIP
         F2NiHtPZshT//TF/ar9Zw64Eet5NU731a6K807oI/D5QESiWLBSYlTq6aKQz6fRNbMNC
         vOCWUdfSnKPSFeZvB1CbcxP6TEeFE1VnSPZS1pz6Ga2m2SYFrIO/ALtKmqrB2/yX6gSd
         r8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980776; x=1789585576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bk+YtOMCSmx0TWEmBa1/4a0coFcVyJrJnWGNi0NAeBU=;
        b=bkJStI/22DtAlEKbuqPQ/184PiE9Fwf0l8k6iXu/Er8K7JXBJpgfhU9lnT1Gn1Lyna
         srbXxjiVCzEP0q+Faoh3SyZF4q/zRe5c7a83pFgA86zkdGTZ3CSQWsbNnef6KfAV5OPs
         qtfGOOHApdP83xCP5Nk6TqqBWjgqH0Ml7yy+Z/M3gx2GTwP88PPYlnGe0cv1DnaGpu1u
         fVSXLkoqIMkYIFJh/D6CJRIwDG5WCbYitgiOTUbXPQFHfoNVRz1kFwr3LdyUKci4QJIq
         xBNQjMIZt5n/GvHshVxWeX5z+2CQBNqfdF5y6xYJ7XdGPFVBDc+CpFgIsYgdHKKnWgh+
         mUwA==
X-Forwarded-Encrypted: i=1; AKwUvBz6veujUE2d5E/RYL7wGuKavjqB7U4fgjGznlqwHjPYn+SY78GVYYYotiJ9QNwtTT1MZQJbAiS8quL848c=@vger.kernel.org
X-Gm-Message-State: AFuF++l5FR7frTbE4Doh/uUEgMxDG0T1zwQqXu0JoFynx1y9HJTKhP8k
	xV0ILyTnV1kJ4TGiTrIuH/KQRiSCao+q5/bNcATKg1usjXsxf04Sunn8
X-Gm-Gg: AYBFou3w5CVSufshE6HEjbHKaF1EKd3vJSIGxLsIOBVVRLvIDrtxE++TiSEKBEQLqm+
	/4gzngbiLZ5nm2jZP6+03Gz66eiuqXT8Qnmfp4hGvzZLnBhc/oActGv7PUFaYfmGLG9jinp2bwx
	2ctRBk6LExsvcsXnBon8VXYFBoY/LP/U0L3yqmLnZNaqRDs2UKqPEDNK1YRJhNkzOg6sEhj5xc6
	ErRGGQHZIuKLUOlUGDYUvnIkOL3jdf6wR5DAghwh3Yvpy9qs/hwBivq78tA13ky0iSe001NOJ2n
	EOZdfwFwmjEMz7uV2XGG6/Lcqnw9aHPZkq36ZHiCN4H8xp396cfb9+AtqmAv8GEwHS5LwY+umzE
	ig5q6czrVIBrIgwcEX4qOMD0yth49Df8+32724WF1lWhQRCDlDL0dwfZMXnEjt4Rzlx4+QGM+w1
	poeGatyGcswuKL2iAnd5cAJHXRH4SJUCcmEwqvVns9xrJV16pxQZ7EXDDwZc1BsDBHLodgHv15y
	6I3jRGLhgSYwl/iJA9yIN1o
X-Received: by 2002:a17:902:f68c:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2dd0e8c12bamr6879465ad.3.1788980775465;
        Wed, 09 Sep 2026 12:06:15 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dcffa9827dsm13988515ad.66.2026.09.09.12.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:06:15 -0700 (PDT)
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
Subject: [PATCH net-next 5/7] net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
Date: Thu, 10 Sep 2026 03:05:33 +0800
Message-ID: <20260909190541.466476-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909190541.466476-1-mmyangfl@gmail.com>
References: <20260909190541.466476-1-mmyangfl@gmail.com>
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
index 0635359787db..beeb08f2b000 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -603,9 +603,8 @@ static void yt921x_poll_mib(struct work_struct *work)
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
index dd121ef2cbf5..b9a9e9d22d4b 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -1004,6 +1004,9 @@ struct yt921x_priv {
 	struct yt921x_acl_blk *acl_blks[YT921X_ACL_BLK_NUM];
 };
 
+#define yt921x_port_to_priv(pp) \
+	container_of_const((pp), struct yt921x_priv, ports[(pp)->index])
+
 static inline int ethtool_speed_to_yt921x(int speed)
 {
 	switch (speed) {
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

