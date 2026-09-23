Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7850437D10E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130023; cv=none; b=hcY5nGTeag2OBm0/B7dpZf5l/weUNeZxA5wWFIrcPaLh8mBcHhYdkeIsOGJC3azChsZT+uD/D5KfJUN/fLDqoi+IQ9n0yWJE2689G1uxOlBE8/aGwoi+OXjIzGb0mhHcjhihKfByrYctdzwR3VmKCVntbLDxZnWH4db66WPzl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130023; c=relaxed/simple;
	bh=Xomkn+Srsksc9rJ4hB1Sw80030NagAwzSURN/+X4zrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bj4sJg98M7PWGYEtjW2q/iNjYsOe6v51GP1FYr9eXao/cjRLo16ghtoSgnvOy7vnPP3JqIXWfbTnwHQQBO1QRFc/ZblLeR2gbqWmMmeAGc4WJXN0nKjM/Hjhms4JBdtQaKb4P/UiQykfOyjWKYm7N5MMKhI+hN+rLopCPqyoQfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbfMBNmy; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbfMBNmy"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso369244b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130022; x=1790734822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwBq1Y5sOSoRLLcFFPEkua7arDxpIQDc0k7JtosP1rk=;
        b=QbfMBNmyeQlQj2lae2UC1CT5KCtaayh0tOaY2puZqROPVQYL1XaamNVlEuZRM7iCJq
         8cwKFUB/J4otdK609eG5VNoBbqwbFQzQqTTBZyVQgnRJZ0mauZlFdWu5IHoJx/hUZA20
         KxEo4KIgBSc44gXaLGZWor0OYqntnEQhBq2xtASIYoS59EeYZPBjW2Txv5vnIJPXOUkU
         n178KmGLbzVSnLs+LBAUyjq7/Ms80UE7OfLK6cEJ+ZhJTG9ZXDKPu2PhCnue3ABOIA2P
         NM0NX6ugiXqAfMMGkrDMvsGE6G+nvIpz6i1QZteFF8wSIQVP9//VRzeGtjsejJIoxbrR
         88cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130022; x=1790734822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PwBq1Y5sOSoRLLcFFPEkua7arDxpIQDc0k7JtosP1rk=;
        b=llw0AjEtO/BzkosXZOHvDX8DBsILc81Y1zctY5YRKsykpVn+TFV6gtPsxerAXKH+4c
         XFN0bHkw3YpMWJTK/OXgC7/1aIst8EBELKv/PDmq8nkOPjDyHjdgQTCJ6xKx/MjyYed4
         AFLwCbIP+vt9lD/at73ljZUdlt/z3estkmQ+P53GXiodaLECveUpdOzN4/3Ycw3m4QuN
         6TveNqFHuf27xBz2Qzu6937XYEgsLhoyBuyGcgVVnHqZ0jeCT7LzIPuElFwhdHEAl4po
         MxU2rBVy+X2ddnPrfNWZrNOYeFnhzYr9MEC/XrpTjkiIqVb+9gmDKHmrckFAzRuVU932
         Xl/g==
X-Forwarded-Encrypted: i=1; AKwUvBx5sa2Zk/GE+FHcXXw2Ri2E+GnqvuNVdO4bBnPDvkfwhtnQgWCPXY7owXlzwvFOfsWCV8hWryg4qIP8w50=@vger.kernel.org
X-Gm-Message-State: AFuF++n/OxMp9gc/CcuDmYywMuxPsx8V8cgH4C8k8KPPWfszvwk8YWD6
	SjlPdG93bPgy4f5bZc8iObMPkQpwhWP7WyIXSMoLGNLvpHg8oIRZP9FA
X-Gm-Gg: AYBFou1b8fq9iuuHZGageLc1jL+bKJGN7HZMW3q4XZYwFJvQXEM5GZxwnVpS9bC86MI
	YWW6+AIl5Ifk6Uvc1DB/gJeu67knBqm2rylS2VXaFsVRLuGziIEQm5ynSg0r9/Dix+xkKIizQZu
	KA65hPmrkcw0kr/Iv11RAuJe34QD1O3eIb8n3bWAzLhUe8oBc5AY4Hse1RT9tPQ0G9x9I2RkBlk
	QqTw+j0gXnYZtnlLOzECcN5xKzH0DQspKyLLjdd4b51pYs4J+ar/aYVP82TE0c3kDku23KgpUhs
	kttn8HL1j2jHxKNX4+rgrni1hLlj3tR05e3wjmVy6UF/feskVx+0MVP1SYfRX/rmi6rVzHPtPQI
	x2RUStyRIxRrAHbJE+haWeR++Od9YxZJcUJgHz0tNPiWOf6th4vvfjk2YtPIJ0OtS6UNKMKPOwE
	/qZRV+FYwm78gSM/k4OurMt18au8WdfIzPV5noU2eTNUM6UaJaQSk2u3ce9692BPVCD+Lja4IQi
	yYL38fYfgS+Q3e6nI9Z1mL8NIh8jfC2voTH5k03YtXnkg==
X-Received: by 2002:a05:6a00:bb0e:b0:878:34d7:6a2f with SMTP id d2e1a72fcca58-87d1cdc1447mr1088739b3a.49.1790130021643;
        Tue, 22 Sep 2026 19:20:21 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fe8sm502924b3a.51.2026.09.22.19.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:20:21 -0700 (PDT)
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
Subject: [PATCH net-next v4 6/8] net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
Date: Wed, 23 Sep 2026 10:19:38 +0800
Message-ID: <20260923021945.2203368-7-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923021945.2203368-1-mmyangfl@gmail.com>
References: <20260923021945.2203368-1-mmyangfl@gmail.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/chip.c |  3 +--
 drivers/net/dsa/motorcomm/chip.h |  3 +++
 drivers/net/dsa/motorcomm/leds.c | 14 ++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 06e2c60b415f..ee433f1e1b58 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -598,9 +598,8 @@ static void yt921x_poll_mib(struct work_struct *work)
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
index 30d131eb9844..6a9fb27ddfb7 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -999,6 +999,9 @@ struct yt921x_priv {
 	struct yt921x_acl_blk *acl_blks[YT921X_ACL_BLK_NUM];
 };
 
+#define yt921x_port_to_priv(pp) \
+	container_of_const((pp), struct yt921x_priv, ports[(pp)->index])
+
 static inline int ethtool_speed_to_yt921x(int speed)
 {
 	switch (speed) {
diff --git a/drivers/net/dsa/motorcomm/leds.c b/drivers/net/dsa/motorcomm/leds.c
index 0e8761f37995..6613fe3b0471 100644
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

