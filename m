Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA203B9DA2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101850; cv=none; b=GqXoxYWfkuC2W/IWSV2t6Hawart+1hp970yhb6g2etO6hCu9PyLxm6tAFDtelAncx0Jj25EAMojqBdrGknONZ9Rf7KsTzqSvQHITr7rDrD1Ek9UwAINLSf51exmAOEbFXHpG+q0xSZ+Zhpa4EuZ3WsCL+jgoJpZ9Q1qNmz3RDvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101850; c=relaxed/simple;
	bh=kyvKj4aiWZsKk79+pNQWhtdDGQxbcy8DpffoE6tdXoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2U4Zs6T6bFxK2ykhqvdi7J9MqPvEwCgbBv6JtkCrPDlX/hjjRTP5QMdfZ7NUm3oAtYkIGVu18jvPEzNdkF7a0r2ZNHGsO15GfdoEvqhIlyw7hHllppSQtIfNlOwKnAnthYg1DRRx0zmra+SGiGiV1gza07vGSfg5ox+hASXGm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtJchbg4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtJchbg4"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3202772a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788101848; x=1788706648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJZEG3Xp29mb0hdnLyMA9g/sKI7+pcsw2OATsKuZZuU=;
        b=WtJchbg4LUckSdKeFZTWm3PvYIabhUE5bPOz/fuHIM6PdM69b+YUooxwOMwaWrxDDF
         rQkiGcrH6xYEnBPZXY6k58oKdyLWwcB9JhbLDCLQ4hMf9KvilE1XO4huzArhgDQa/Nun
         xOzG8p/KCm03U/EZrDgIQBGxja6r/ubpytbSJTBhZqPPpQne9Zh3UxsQfZ6QI3Ifdb02
         PFXrMtxW/BXd/xILLQnGlAi4j1dE/7fJjMfLM/oewLVJTReTjx7KGJaL5zTxcIGls8bH
         31U6g8GQQBTKQPyExWdnlW9HID3KALC51joREh9qgVHDcMFAMWl+jezCbD07IpzScvWC
         4nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101848; x=1788706648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJZEG3Xp29mb0hdnLyMA9g/sKI7+pcsw2OATsKuZZuU=;
        b=gwTUZukH8okj9z4Skb6TOyGL6MSAaO01nTirrQLfAW0j400jf2UZvd/Kdwoen5b7M9
         U5fahoRCS25c650OT6UJ0jiMjYLjaJ/+86+9OLtFoG8/l2IFGVqvGOzHSJAO+HVS7MsG
         7PBsdz4W6yc5cdIX/wDmCuX8oi92GwuD6xSyCVn900lUBg7kRYCo3w1+Xrn+sYXvoUO+
         hK2DlH2nAkea/gyi8pPChN7Y0q012qJRQqufQvSINdIlQU9DofvonQdwsi/1JoLux9pB
         DrhkGk7HKGwlKM7Vhz04yi1bNnXyoBiiYcS0or65taZMtRLhzPVZCut2YsSJBEOchXh5
         yXVg==
X-Forwarded-Encrypted: i=1; AKwUvBzVuPkNbMTARLtL74cc5pRF9rWDie53bfEkp98O+o1ZoSKj3KLiPug8OEmnWCEePRmle0/q6B4njp0LhJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++n/y1SVyGlxQ9wIVkKaDFvEdV9H0P73hSvms73q6h3FhF8hw3uj
	x6n/lwWrk2R2p1UDXxNYYHGuK7MnkA98WA18CydPfEw7gWM4HgseJ2Nv
X-Gm-Gg: AYBFou1dRrObi/QbPS9QiRCSyoJaVbT9rQX0iY4kSTz/RR6h0kwvSP+IM+H6hgRklgW
	7SRKkW4nimqDNoxTBwCU8hBcNUArjlfBrP2oizCo56JGdHZ4Tf2jEa78ENaXb7sjcUagV/4Zf5t
	abbZT2f8dXIME/kGtS1bFhwW+Gi4YtG0+ohgVLuo7gUyYeQ6c1wu3Qk8wmiM7fXkGg85ng9qJDL
	WYYiPuzxx5eQoaFr0t/OfbSrD+qtg3aed8JgRllTS8blNpofRuKxopFecjH2HLIISdbrdTIkkqB
	f7KJxvfaQKQKF+8wDIVeR8xo9OFtbk+5H7eNh0D2SYoKAapVVnhPwieHVRmpoL7jUK5LvnWAk0I
	kiYZqA30ekT8RJDbmwwOUv8KTsfmOdliTDBbbWr9NVlvfteXGcTDPQ1tOkiArwOHGkKDKDjQxb9
	J7Ubba29jz3PQdpLG2DvYwl616ypCt+zq8hJYCX41Af+KP8MfsV0wmtLE+zEVZPIBkjzr/qBVYn
	i5VlLCDk8mfEGT42Tw=
X-Received: by 2002:a17:90b:3c83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-3989bd54c84mr18297077a91.18.1788101847980;
        Sun, 30 Aug 2026 07:57:27 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm23198024eec.15.2026.08.30.07.57.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 07:57:27 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] HID: hid-lenovo-go: clear calibration status on start
Date: Sun, 30 Aug 2026 20:26:58 +0530
Message-ID: <931a17ea1ce972af018252681a253a21465ad494.1788096668.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788096666.git.mradityadash@gmail.com>
References: <cover.1788096666.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A completed calibration leaves success or failure in its status file. If
the next calibration has the same result, userspace sees no change and
cannot tell when the new attempt starts or finishes.

Link each calibration action attribute to its status field. Set only that
field to unknown before submitting Start. Stop leaves the status unchanged,
and the next firmware result replaces unknown with success or failure.

Fixes: 995887a10da1 ("HID: hid-lenovo-go: Add Calibration Settings")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index a4231d188b7a..2ed367abd4cc 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -111,6 +111,11 @@ struct go_cfg_attr {
 	u8 index;
 };
 
+struct go_cal_cfg_attr {
+	u8 index;
+	u8 *status;
+};
+
 struct command_report {
 	u8 report_id;
 	u8 id;
@@ -1410,7 +1415,8 @@ static ssize_t device_status_show(struct device *dev,
 static ssize_t calibrate_config_store(struct device *dev,
 				      struct device_attribute *attr,
 				      const char *buf, u8 cmd, u8 sub_cmd,
-				      size_t count, enum dev_type device_type)
+				      size_t count, enum dev_type device_type,
+				      u8 *cal_status)
 {
 	size_t size = 1;
 	u8 val = 0;
@@ -1425,6 +1431,8 @@ static ssize_t calibrate_config_store(struct device *dev,
 	val = ret;
 	if (!val)
 		size = 0;
+	if (val == CAL_START)
+		*cal_status = CAL_STAT_UNKNOWN;
 
 	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, cmd, sub_cmd,
 			       device_type, &val, size);
@@ -1822,7 +1830,8 @@ static void hid_go_brightness_set(struct led_classdev *led_cdev,
 				     const char *buf, size_t count)           \
 	{                                                                     \
 		return calibrate_config_store(dev, attr, buf, _name.index,    \
-					      _scmd, count, _dtype);          \
+					      _scmd, count, _dtype,           \
+					      _name.status);                   \
 	}                                                                     \
 	static ssize_t _name##_##_rtype##_show(                               \
 		struct device *dev, struct device_attribute *attr, char *buf) \
@@ -1982,17 +1991,23 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_left, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_left_index,
 			    "rumble_notification_index");
 
-static struct go_cfg_attr cal_trigg_left = { SET_TRIGGER_CFG };
+static struct go_cal_cfg_attr cal_trigg_left = {
+	SET_TRIGGER_CFG, &drvdata.gp_left_trigg_cal_status
+};
 LEGO_CAL_DEVICE_ATTR(cal_trigg_left, "calibrate_trigger", TRIGGER_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_trigg_left_index, "calibrate_trigger_index");
 
-static struct go_cfg_attr cal_joy_left = { SET_JOYSTICK_CFG };
+static struct go_cal_cfg_attr cal_joy_left = {
+	SET_JOYSTICK_CFG, &drvdata.gp_left_joy_cal_status
+};
 LEGO_CAL_DEVICE_ATTR(cal_joy_left, "calibrate_joystick", JOYSTICK_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_joy_left_index, "calibrate_joystick_index");
 
-static struct go_cfg_attr cal_gyro_left = { SET_GYRO_CFG };
+static struct go_cal_cfg_attr cal_gyro_left = {
+	SET_GYRO_CFG, &drvdata.gp_left_gyro_cal_status
+};
 LEGO_CAL_DEVICE_ATTR(cal_gyro_left, "calibrate_gyro", GYRO_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_gyro_left_index, "calibrate_gyro_index");
@@ -2089,17 +2104,23 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_right, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_right_index,
 			    "rumble_notification_index");
 
-static struct go_cfg_attr cal_trigg_right = { SET_TRIGGER_CFG };
+static struct go_cal_cfg_attr cal_trigg_right = {
+	SET_TRIGGER_CFG, &drvdata.gp_right_trigg_cal_status
+};
 LEGO_CAL_DEVICE_ATTR(cal_trigg_right, "calibrate_trigger", TRIGGER_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_trigg_right_index, "calibrate_trigger_index");
 
-static struct go_cfg_attr cal_joy_right = { SET_JOYSTICK_CFG };
+static struct go_cal_cfg_attr cal_joy_right = {
+	SET_JOYSTICK_CFG, &drvdata.gp_right_joy_cal_status
+};
 LEGO_CAL_DEVICE_ATTR(cal_joy_right, "calibrate_joystick", JOYSTICK_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_joy_right_index, "calibrate_joystick_index");
 
-static struct go_cfg_attr cal_gyro_right = { SET_GYRO_CFG };
+static struct go_cal_cfg_attr cal_gyro_right = {
+	SET_GYRO_CFG, &drvdata.gp_right_gyro_cal_status
+};
 LEGO_CAL_DEVICE_ATTR(cal_gyro_right, "calibrate_gyro", GYRO_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_gyro_right_index, "calibrate_gyro_index");
-- 
2.55.0

