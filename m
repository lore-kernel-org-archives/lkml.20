Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8E4B8287
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577046; cv=none; b=Rgm8fY0EBRtS9c1IP6vde+JEMdRBtUQw6YB9ii3Nc4yXSpnOxIT/YhPccH6xkKmCt+DTAGQ/QA9042WQeUemkT4IrbRuqjV4YNImqxAuL/WTXoW9bsdz7Lkyt6lvr94j59i5YYcoJSN6eOaqwdL1i2CNa7ByjHGeIVfTMxUr2fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577046; c=relaxed/simple;
	bh=9OzXTV0DA223m5vSCHBBhdaUL4nKz5XYVLsqm8ikMrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hf/+OY+3KzbZsPadKdpbrFWZcQRpGA5G0W8WK8frTMfIrjkt3Pcik27wRyXdwL4jIrKUiRJ5UlDPcNZvg/L8VmKKpbVaeAv3bzUd5byfEeiAppp2oLEVmMyU6WKiP6s1z/DJ+ikHxI/k7SexJsl3Liy/oNVdqLMAhUmtsWStC9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIEe9K3z; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIEe9K3z"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a3so901455b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577028; x=1790181828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFUZqkMC5HU2RrjnHFq3xM9VTr/hsbrNJYOLEraLd5A=;
        b=DIEe9K3z1S1ReY6ZKBy5guty6474aRlSXzrOpvTTmYqk05p7qmawy/l2j6cIaO42Jy
         6qGOqZQj3l0LELq/Ne8jOciBac8P9vP1sDNopm851EjKMfjPsnIswYQ2PtclkcinCzdt
         R8hmkRWpPl5B+oKeGSBOFxciAbuvDhrYVgE3NFukK0QrReTgxA+eZvLGaJmDnZIEDnrI
         z62cd1dD+IX+tomX7uZPD8dBXUg3brqCjVhHyakcEX2CXd2l4arIjdPv5sj8Nv7W94cH
         yfM+AjgUsCE0XFxYzHLZLDgOcdAFNlSb8NUhBkB1r+9bs0oBY5m2ikihQ6ThjG0U9Dhw
         n+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577028; x=1790181828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFUZqkMC5HU2RrjnHFq3xM9VTr/hsbrNJYOLEraLd5A=;
        b=lj6+SiRkgFnh3VPNm9dMXcCM4VsFY7e499iEWcOjfAe7MnIHJGcfpB4sPDBxyWltfa
         x0EMl1Hg34ygEmn1FM9YCNG9zQRfA25a0qcU6qEw3dFfuTal6CU3+fyJtNqbFKpG94Yf
         PFj3jrReBTXEPD/qw/8MlrqqX90u2bkqP/px/rnmgxi2zTwx7FX7Cp2Ko8NL/zVOdjWp
         HNHZmn94MyI7iCvyj6mN0+q4AaJ+dmBvkpfRu9cqfBODI9Cw7WGhovPTN9lnd9C1dX7q
         T7QJiwXE/9isaK3MyH6YxOAiwUfPe0Ra86BwcsZa9BXtB0M9iDIxV/X2FveKldJUmjKq
         s1vw==
X-Forwarded-Encrypted: i=1; AKwUvBwmGS4keWLtii+k36hY/e5M3K7n462Fbb4YwjYwf8epjkFlIml4x4SeUqkWGwrXXXYO+pITPIbp5p9dzsg=@vger.kernel.org
X-Gm-Message-State: AFuF++lZnSTfGL3x/j0gpznzmQzZj9YNcRwU0X8BIAM8JBY+JmV2VT/L
	cQ7DDR8n+4gXcXsrjldSeGBcSqWg8GlKdYAb2RagaK/ERx1DbnTIe2qu
X-Gm-Gg: AYBFou0abLuz0HJtFf4Neb+P21rdAfFLQR9/FqAlqkDw3X0w5/YthWMw0JApk4dSYhS
	0riWG1WqR+/a6jlJBUdJHRoHQvR6GDBpTafUTp+yFoJcSA4bo8OhA7nfkj5ZEYIyDsSgUBB4SXw
	g8wwrRTRXTsCXc5aE3GtlDnN21OldkhyMIgxlxi92WvAT4/2dqoLdsAAej5QyNu58c+H0NQRN2t
	jmFAOdroiUWXLs1A4NHy+/Y8IoZ69X+Dga7iIBh+tgGvQpxNhHu0JDN8tVCUH95nHg4+erYpt40
	SpcVSfYpkbVLlhBdNydurl1j4BOaDzvHuBnGc0ZYuqIdFmBGCQJCWvKlyHpCraItyg9skd7UKU/
	9Bgy2yMmyKYtIThrbd3316c9WINohF9Shx9D9NH+TForyLTG3gesu5wLuAR88Bl5d3PUlnD6oHO
	f0FPxP85f56eSyfObxOBwjjpdaT+Lii/6I2iGqg+sB5PwV0BrfocxI9AEIDgmd3cgz1ICiHDJJz
	G9iQYo5Z5dgZABw1OJVUsFIqA==
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51e3 with SMTP id adf61e73a8af0-3dd5f702df7mr8337741637.23.1789577028021;
        Wed, 16 Sep 2026 09:43:48 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc757csm1902278a12.32.2026.09.16.09.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:43:47 -0700 (PDT)
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
Subject: [PATCH net-next v2 6/8] net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
Date: Thu, 17 Sep 2026 00:43:06 +0800
Message-ID: <20260916164310.3168269-7-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916164310.3168269-1-mmyangfl@gmail.com>
References: <20260916164310.3168269-1-mmyangfl@gmail.com>
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
index aac550bb4f72..e7fa5557ec81 100644
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
index b3670f1e1427..6652bb4304b7 100644
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

