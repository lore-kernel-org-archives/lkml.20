Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38A44E4C38
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777547; cv=none; b=oNeKqjxgwkU2bojZPuzxfCbU4+7Zxy+pXl7JitDL7+wHSVu+8yIw4M4B92mSG/s4YJmUuoNL7oW4QoxhpyfX0MnIJN4NRAXKyXzyfC7mVgT/eVhT8bJPTGgKOY8Nuuy3HxgWf8q+Hsl5INArraZCu0PqI5XfX6EDbPGbxStLbLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777547; c=relaxed/simple;
	bh=UI2XZTTAmMT6S6fO82VLI+DGctHWm6fuFI5NTz0VPh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3i9Aly2ut6OtvnoDTdX4RXPyNbxjWHUdp9DocqkKa5/u67F9589rutwzorcSS1fGkXVhlRF7NJBh+wyOujRT8VDkDdDj2q+FO3YKu3tWM2cDSrJ/iykbzblAGNAach5VnYfLkqKSbSPpO8n7UBHznsvOwICzKDBWj+75qwcLYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnoVKPoC; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnoVKPoC"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso30739585ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777526; x=1791382326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3QS3HEpc4LkcdODNfPIRR2bjRGT+/U73u7f7QjEG+PU=;
        b=OnoVKPoCLO97EXXagOYMRCy1bXkxniGeH5LOXz0pFNK2txiVq/85FPuL9ifEuoQyyW
         KUY1xqY2raq46bXWIfsNDYShjQ1AkQPhHt70bimt2F6un4pxL8ayjTm8b1jFqC2WZdg0
         S/jiXbHuxS+51/MhyLzOnM+g5b8fb8PWW+VMRo4C/64fkS7IaCom54JU1xpuk8BYc8QP
         xIEJYckeVLncx4NjjLsKku0Wwx2IrXTv6BSelTbRLOmpTdQXDb9ZzJW+ErPu2b7hVBLV
         /yXyEDcOfb9+ua4Qhq/CcthcZKZcuLwuSfDMGma/D5zuJfQ7OHdJ612PvtQN9yTjczZM
         v6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777526; x=1791382326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QS3HEpc4LkcdODNfPIRR2bjRGT+/U73u7f7QjEG+PU=;
        b=KJ6bz3Wg45SrrisUH+Edfii2uwC+PWmRkeRfB2q4LnNvaBhlmmAIWTFXNZD4c8GKaO
         lf31tSUYECBzZ/wOBGVhdpQC0NGwUS1wZbaruufVN+gsWFapRlw+IqoYziYoAdVdda3p
         gEWXcFMtyxeU8HMgCa5NmUriL3S4Uo5cJZHk6z0shmFJIJiG9smSBtKIYttTsYr5/UVa
         h4hcnYZcX+EalHPryJYsPoFPR0xllRjnXqdwYQFyWKbB7t9VG8pG6rLe49PVtF6EtN6R
         +qe94CkSpS7957IQz2MHitB4ZrECaAM8o4oTfH18k4tXUIjsMLrFKkuxOAba1OziZxqC
         MdIg==
X-Forwarded-Encrypted: i=1; AKwUvByatittLstomre0JgZblpyJL72fUP7lWwRaBNoiGeQ22xYkprRKB5Ts3ZivSmHM6hR04VsSkWYtYLclhaw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKULEQEWUEWzOvb4cqg/0SQMQD3sHD9X0yt3FXaZDfpPOk04lk7
	Z/CEbGmbvKBbnfzRsF5k0we6nzceARaZQly8W/MoDo37ssgbndbG56NSNHPawQ==
X-Gm-Gg: AYBFou2nQyrRuBa4S5q3lbfWvmS5gre9/BQB1ebIKvZJICgrXTvHDX2L6Fc4wcfcUvi
	IyQRvAIwE7hTBr6VdRY7VnZsQhP+VlgFe4tmXZNDKmJyyE7GOvAm+4uLt7Rizy2RLmu5TdECZb0
	3L6lhACFjULCIZX2qeoDW9W5DJBlfqMHQVU6GeC+HETAP0RGgeTMNB9pBCVNswUmYAbVtriVUnQ
	ZwHaEUwcFYHXghHb0y+4J1fDm/pQKbUSDLAoIXPJkcdeB8HsPzqb4Fa+amDCOnmYAaBKPKGcOEF
	jdGHEVldawDBptkzrszLgOJpJdfXI3fPdrJnWuvlW4h/7tXoafFwkhhsrtvOjFklN2JVWDToAwr
	zIIs9KPt8gUDO/nEl+qVpcNq9PFz7sbrtJCRkeJYOiF1ogSFM1SQkj9TLGPRa7vI5IXlrmFvTx6
	ebLsrW/xkJsrknpThybKtKK0ExaHZFr5/qfGiJYEooxysgVgq1O8f1QotrVRoa8oablItUH6MKd
	DT+lnC5FmHvUAmGoxjQwFvR
X-Received: by 2002:a17:903:4b0d:b0:2dd:87c7:a907 with SMTP id d9443c01a7336-2e2e4a01156mr12465945ad.15.1790777526423;
        Wed, 30 Sep 2026 07:12:06 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5b897d8sm8307475ad.28.2026.09.30.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:12:05 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: dsa: motorcomm: Fix register rollback in LED setup
Date: Wed, 30 Sep 2026 22:11:48 +0800
Message-ID: <20260930141151.3973221-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED error path writes back a stale snapshot of the whole words taken
before the class device registration, silently reverting LED2 state of
sibling LED groups already registered and reachable from sysfs. Although
the odds are very small, fix it by reverting this group's fields only
for correctness.

Fixes: 9af9a8168213 ("net: dsa: motorcomm: Add LED support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v2:
  - reword
v1: https://lore.kernel.org/r/20260926202955.905761-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/leds.c | 69 +++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/leds.c b/drivers/net/dsa/motorcomm/leds.c
index 6613fe3b0471..c97b560299d6 100644
--- a/drivers/net/dsa/motorcomm/leds.c
+++ b/drivers/net/dsa/motorcomm/leds.c
@@ -420,13 +420,15 @@ yt921x_led_setup(struct yt921x_priv *priv, int port,
 	char name[LED_MAX_NAME_SIZE];
 	enum led_default_state state;
 	struct yt921x_led *led;
+	int polarity_orig;
 	bool force_high;
 	bool force_low;
-	u32 led2_val;
-	u32 inv_val;
+	u32 led2_orig;
+	int polarity;
 	u32 group;
 	u32 mask;
 	u32 ctrl;
+	u32 val;
 	bool on;
 	int res;
 	int ret;
@@ -452,6 +454,7 @@ yt921x_led_setup(struct yt921x_priv *priv, int port,
 			port, group);
 		return -EINVAL;
 	}
+	polarity = force_high ? 1 : force_low ? -1 : 0;
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led) {
@@ -470,23 +473,27 @@ yt921x_led_setup(struct yt921x_priv *priv, int port,
 	/* Inversion is internal - force on will give low logic.
 	 * In the rest of the file, treat LEDs as if active-low.
 	 */
-	inv_val = U32_MAX;
-	if (force_high || force_low) {
-		res = yt921x_reg_read(priv, YT921X_LED_PAR_INV, &inv_val);
+	polarity_orig = 0;
+	if (polarity) {
+		res = yt921x_reg_read(priv, YT921X_LED_PAR_INV, &val);
 		if (res)
-			goto revoke_inv;
+			goto err_inv;
 
 		mask = YT921X_LED_PAR_INV_INVnm(group, port);
-		ctrl = force_high ? inv_val | mask : inv_val & ~mask;
-		res = yt921x_reg_write(priv, YT921X_LED_PAR_INV, ctrl);
-		if (res)
-			goto revoke_inv;
+		ctrl = polarity > 0 ? val | mask : val & ~mask;
+		if (ctrl != val) {
+			res = yt921x_reg_write(priv, YT921X_LED_PAR_INV, ctrl);
+			if (res)
+				goto err_inv;
+
+			polarity_orig = -polarity;
+		}
 	}
 
-	led2_val = U32_MAX;
-	res = yt921x_reg_read(priv, YT921X_LED2_PORTn(port), &led2_val);
+	led2_orig = U32_MAX;
+	res = yt921x_reg_read(priv, YT921X_LED2_PORTn(port), &val);
 	if (res)
-		goto revoke_led2;
+		goto err_led2;
 	mask = YT921X_LED2_PORT_FORCEn_M(group);
 
 	switch (state) {
@@ -494,16 +501,20 @@ yt921x_led_setup(struct yt921x_priv *priv, int port,
 	case LEDS_DEFSTATE_ON:
 	default:
 		on = state == LEDS_DEFSTATE_ON;
-		ctrl = on ? YT921X_LED2_PORT_FORCEn_ON(group) :
-		       YT921X_LED2_PORT_FORCEn_OFF(group);
-		res = yt921x_reg_write(priv, YT921X_LED2_PORTn(port),
-				       (led2_val & ~mask) | ctrl);
-		if (res)
-			goto revoke_led2;
+		ctrl = (val & ~mask) |
+		       (on ? YT921X_LED2_PORT_FORCEn_ON(group) :
+			YT921X_LED2_PORT_FORCEn_OFF(group));
+		if (ctrl != val) {
+			res = yt921x_reg_write(priv, YT921X_LED2_PORTn(port),
+					       ctrl);
+			if (res)
+				goto err_led2;
+
+			led2_orig = val & mask;
+		}
 		break;
 	case LEDS_DEFSTATE_KEEP:
-		on = (led2_val & mask) == YT921X_LED2_PORT_FORCEn_ON(group);
-		led2_val = U32_MAX;
+		on = (val & mask) == YT921X_LED2_PORT_FORCEn_ON(group);
 		break;
 	}
 
@@ -539,22 +550,26 @@ yt921x_led_setup(struct yt921x_priv *priv, int port,
 
 revoke:
 	mutex_lock(&priv->reg_lock);
-revoke_led2:
-	if (led2_val != U32_MAX) {
-		ret = yt921x_reg_write(priv, YT921X_LED2_PORTn(port), led2_val);
+	if (led2_orig != U32_MAX) {
+		ret = yt921x_reg_update_bits(priv, YT921X_LED2_PORTn(port),
+					     YT921X_LED2_PORT_FORCEn_M(group),
+					     led2_orig);
 		if (ret)
 			dev_err(dev,
 				"Failed to restore %s for LED %02d:%02u: %d\n",
 				"LED2_PORT", port, group, ret);
 	}
-revoke_inv:
-	if (inv_val != U32_MAX) {
-		ret = yt921x_reg_write(priv, YT921X_LED_PAR_INV, inv_val);
+err_led2:
+	if (polarity_orig) {
+		ret = yt921x_reg_toggle_bits(priv, YT921X_LED_PAR_INV,
+					     YT921X_LED_PAR_INV_INVnm(group, port),
+					     polarity_orig > 0);
 		if (ret)
 			dev_err(dev,
 				"Failed to restore %s for LED %02d:%02u: %d\n",
 				"LED_PAR_INV", port, group, ret);
 	}
+err_inv:
 	mutex_unlock(&priv->reg_lock);
 
 	pp->leds[group] = NULL;
-- 
2.53.0

