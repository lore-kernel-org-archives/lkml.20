Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2819B2CCB9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908271; cv=none; b=bzJ9vhyYAc/S5vUnPCWAsdO/Mo9tG6cBUWcaEMX11EmocvX5vG+Opcco4oClEJZhcdfRK1sVt1a8CiC2GJ3qPYdpWXknZKAa42uZTS2jSaLHUWkqjaLudy54ifXuo7ccPUePKwxa6z9btitvEbPH/6pfl7GwxRdQ2Vef8A+1dz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908271; c=relaxed/simple;
	bh=1Apm140TmjwBykNP41BteAIeCrQSM7GPOdDxj4xmsQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWsx47/EoGDQTxBB4UGla9EAER2uagSZYexvu/0jYRsXQ3QaM9G0KogLSIUomkSupo2Ek5J9fx72cY3Q56h/QfLmRfxykRO6X+N+t/jiHR6RxByrR3lAJbIPYMBOEjatboq7Ve8bA79cnkOI+fpPvblSY0/mIHpj//lNa77Z+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/xitQhj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/xitQhj"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so4299822a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908267; x=1789513067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHf4Kdg2iAelN0tBevBJGIWkTeGE4acBiDza9UpBpm8=;
        b=j/xitQhj4SVNUNz7zWVeTpmy277/EjWq1HWLVCPAOuqcBDYBNXAe0aRnSj18rUwAke
         Ii8F0N5Z5PWiw9XqvLsvGyvSHchB8Dp7XlqTTsbbqwPBG34DVgd+wa8SmvRGHbrnbJJT
         9iR4XZCenlQwniSHJG/26Kk2jJXRbk54YdNBXQjT2CzOzQ0+KP1UPSpC9EU1ma+Acm8v
         fOtKVJUz13rHKgV3D5T+FYYnvWA/HvKQwqm7Em9AnWQEZzF23D9iQqV0LanDTE2EAfQV
         uVCffVU5PnbedGiqLybe0qhWGA5uA2Ej/4xyj4O7I2h6itzwxgmGwkjDu2PFWYXlVcPq
         8YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908267; x=1789513067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHf4Kdg2iAelN0tBevBJGIWkTeGE4acBiDza9UpBpm8=;
        b=im/2+h2vHK8egrE/sgx4543S7sZoWpdGQ3cFoFKrOLsatFcNvxfDDljoFDzjU0TXWA
         Xyn/qifFpH7LVtoXTHXtHfqGIPM7o+IdBz18KNq9rDMGhdZBZ2E3AwIAZD/fxMpJNTqm
         y/WsjH82b553n1UGeVkvSA/B8kd6XF/EZGwgWoclgu8s8IAORKHUgiCvnzcFtFLrS8eo
         mb/N8MvvNLpb4mx+znPuOGQAVtGuFhKDkg0Dqluv7B8Zl+yM0QWcHKYbf679xEaOD27A
         l1inS0kRo14WiT000bvNReRsKy+HAbIW8stjc4DK9PLS0nkcX5l/oSyTlLGqCkqVy0qG
         0Aug==
X-Forwarded-Encrypted: i=1; AKwUvBx4NAAVdfFyA4oZTgF25Xq3vSu2K8D5MPicI9ZSBX/EXfWSD2c2IYXD+EUv3GiE1ddWUeRzptEQ/eUObK8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKoO6Dbs6GIsTlHi1OASDB9hJGZbYis2uhbkz42gkSII+3+feY
	2gBDDpmCRbB/fm4spTfMJTJY/VZ7+9rmoHA4JdehcNDOcxSCYr6S2gur42WyAQ==
X-Gm-Gg: AYBFou00P6bI9B+qaNWqxr2DsSJipipZ78sA6CfW5pdNpi0DLhbFwqxxVPXK4tU4A6J
	yEbDXgJ1AFAW2uuP4Tx3RoEE5eQjYyux9zlQmpp2T6ymjvW1dU+1M4jPjFazX8M6XntwCzz42sp
	W5WbsjrvL9XrKvoub3xdty39Lpo+ExmpVJKrYximhja7ZYlSFTVtNk55Ce+aaqx/Tk4/yCyBVSZ
	BuFW9Ka/d8ASfwXKF3zE2aSdgj8B1bDvu692XMWg5Z4u3ieQVxrGUyd8QoEF6EBZWBzRzuIIl0y
	zH9FRjJjyDJSKvw6fVEyT2uW5IAj0JMlnb6FyC1ZJ/Bt/cOnqz2t2a/R4xiROsSaJ6od14BznoS
	Ymy+5mtJnIZSW5dsPexv7labtaTvQQfWNEJI0q5FjtL5nHQ4oayXPdXrwOSH7bRLN2QJBnPlkRv
	2EqelsaCQ89ixlJPtWM8IjqWTk2xsdjVeFqHQhanNupCdIZJ3cLoCFo0olNa7ATpX86sBDAEEAS
	HmRfYsp
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr43767196a91.21.1788908267472;
        Tue, 08 Sep 2026 15:57:47 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm37289140eec.0.2026.09.08.15.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:47 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v3 5/6] eth: fbnic: report temperature and voltage alarms via hwmon
Date: Tue,  8 Sep 2026 15:57:36 -0700
Message-ID: <20260908225737.3034403-6-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908225737.3034403-1-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building on the temperature and voltage thresholds stored in
fbnic_fw_cap, expose alarm attributes through the hwmon interface:
temp1_{min,max,crit}_alarm and in0_{min,max}_alarm.

Each alarm is computed by taking a live sensor reading and comparing it
against the corresponding stored threshold. The static thresholds
(min/max/crit) are returned first straight from fbnic_fw_cap without a
firmware round-trip, and unsupported attributes are rejected up front, so
only attributes that actually need a live value fall through to a single
sensor read that then feeds input and every alarm.

A threshold the firmware did not populate reports -ENODATA for both the
threshold attribute and its alarm.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 68 +++++++++++++++++--
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 7dc4d705f566..11fa8aab0f5b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -86,34 +86,84 @@ static int fbnic_hwmon_read_threshold(long thr, long *val)
 	return 0;
 }
 
+static int fbnic_hwmon_read_alarm(long a, long b, long *val)
+{
+	if (a == FBNIC_SENSOR_NO_DATA || b == FBNIC_SENSOR_NO_DATA)
+		return -ENODATA;
+
+	*val = a >= b;
+	return 0;
+}
+
 static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
 {
+	int err;
+
 	switch (attr) {
-	case hwmon_temp_input:
-		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
 	case hwmon_temp_min:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);
 	case hwmon_temp_max:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);
 	case hwmon_temp_crit:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.crit, val);
+	case hwmon_temp_input:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_crit_alarm:
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	err = fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
+	if (err)
+		return err;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0;
+	case hwmon_temp_min_alarm:
+		return fbnic_hwmon_read_alarm(fbd->fw_cap.temp.min, *val, val);
+	case hwmon_temp_max_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.max, val);
+	case hwmon_temp_crit_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.crit, val);
+	}
+
+	return -EOPNOTSUPP;
 }
 
 static int fbnic_hwmon_in_read(struct fbnic_dev *fbd, u32 attr, long *val)
 {
+	int err;
+
 	switch (attr) {
-	case hwmon_in_input:
-		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
 	case hwmon_in_min:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.min, val);
 	case hwmon_in_max:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.max, val);
+	case hwmon_in_input:
+	case hwmon_in_min_alarm:
+	case hwmon_in_max_alarm:
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	err = fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
+	if (err)
+		return err;
+
+	switch (attr) {
+	case hwmon_in_input:
+		return 0;
+	case hwmon_in_min_alarm:
+		return fbnic_hwmon_read_alarm(fbd->fw_cap.volt.min, *val, val);
+	case hwmon_in_max_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.volt.max, val);
+	}
+
+	return -EOPNOTSUPP;
 }
 
 static int fbnic_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
@@ -138,10 +188,14 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
 
 static const struct hwmon_channel_info *fbnic_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT),
+			   HWMON_T_INPUT |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM),
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
+			   HWMON_I_INPUT |
+			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX | HWMON_I_MAX_ALARM),
 	NULL
 };
 
-- 
2.53.0-Meta

