Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA539A04A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010496; cv=none; b=K3IpIxpAgzXxrXuH62ow6NB9xMM+VI3ZTHhsEUF6wzCo/SkdnD6MBYTSoOvrJWBMUP9AiZR2Avk3aG8fkj1hjVGtEjMIMqnR0MDlxx7vfaQpoBliLGosgZEL+seRJRKfQ0U5bimQl7xXH82JdbIf7L20kWqpULh8LX08A1Po5TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010496; c=relaxed/simple;
	bh=Um74UX+MRF/9P0ke3riKZo7+21YZ3eMyq0VMLteOHVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mbr0gB7FHatNHMwBmD5a9VwAE45mKsC4wf7JOBpWHZFk+IZ8ZT0LMSO99BW2rJoTwezRtby1+nEJet8eIE/yiIURhXMMG1Pc9ngxOJIsYTlL/O52i0LcPfwJpkcaVr9qXCl/DdQX3KO4HQvID/CIDnP9ZuA4SlBGVg27LZWn0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6RAp1Z4; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6RAp1Z4"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4ea978572so268045a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010493; x=1789615293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xO5C08EX71sX1hq1xlgBn85VpHzDdFalT8bt09irpJA=;
        b=j6RAp1Z413y0sYYZnJYJImC5XAQayzqOCxKJmSimUC43MB114oNgbG+w82A55PB5K5
         GIwQ+2oyC+fWrGmVrVc7v0OcNZ1N9ZjObmwdLmdHpK6gFv1kIkl9No2O089wsA6ISert
         tSNOCGD0f5Ey6Z67MPY74/n9WveNoQmY6460smH8oSKBeD8JzAEsomQIGglMSjbo5Sdm
         KRV/k4WbVEUjz9sQjqBJuWOFpfa9SB+2xsKf8U+lxg+DEadiRdl/SL03NnbzI6C6Yw8O
         rOtkM7OoOfDuAbqv5wAWK34kPFUw2tIlD2WILyUyC5u9E9BwhmBhoS3cI04UmXbs8sf1
         KSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010493; x=1789615293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xO5C08EX71sX1hq1xlgBn85VpHzDdFalT8bt09irpJA=;
        b=Yu88li2rykbDS1O55+vcGImvfausiM/C4SuMCGuOZBBU7Y6xUcpUECT7fikQea8Th4
         C+ffKdgsrPQjjckpPZxRWZVaQ3EQr8HZCgF/gjH2JmEBfTjnG9fJDDzJISZhJ50WL5or
         cYsBYE9dsTGUf+EeUPlxdXcKJBvlrrjOQ+yxfVQMmHEx4MfnU3qeo9W3nlo8N8BzSTo4
         i9MUODr4JL+reSNgSA2xDORWGRiljspP+8epeeB54zfIpPkIlhkAtJkaVU9OrgX/V4pH
         nPP2BVczvKeDHizngZ9sjHrgipMbUPl3t1IkS7o8WVzbkMcx3zNi6A57UhBZS7ttUL4V
         0eWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrzWzBkUy0JJwTv7VeTKjixBXRpJOmoOH2ms8Ii10V0glzHKzKIKrfvwSEb+Grpg9ZbN7WfKujIeu5EzM=@vger.kernel.org
X-Gm-Message-State: AFuF++lqnUI6zKFV+RFHZMI0wA6cc9CjeKdlDWkZA3Qysm6nhTzX0Lf7
	k1Gw2OqTl9hwOQYhwBPn9WwMCCLc4rzOZWXjLwYK5JJEisoD/td8IDjD
X-Gm-Gg: AYBFou2d1XGFAzJwb+CYeNOXqpfxeHf1Tga6BVONTHGWqA/L8rJx7fuL/8ksz3f3LaD
	rAez0lEloBZNRAl3+OzVGpYMvC0qi53l9jX5iPKTEMu/6YCOZO97lJen3zWNhDUHRRQDzOUp5g/
	Mx6nRzf9L0QkWL8iqOveO1Vh4Tf+21Q+7o0OVR/DiUvx7Xr3wnCBkwJNv4C8+wK8uUTicS3zT9n
	Vxgb5PJo+xfNy/2vfxu56TVjyn1pVd0PAqaqXA+YR+1r8VYDmkEx+HY0CxOSGf5cjgWU/hVgdUd
	EzWKAPpZrvlw7WHpavXCqS9fd+6KrEMK++U7oVICSh1Mwhj/NR51sVnnK0A8DRQd02ZSba7xFHE
	fgxs5Kjer+aYMaYWJhxG3CrFb8YatBRNVNGeeS2dxk++BLzh+31Bg93pFj+3XQfvQRvG9tHJlOh
	Q6axptq0OLybQEpBa1py5w1Cy3R8JhUZ1owRXwireFyCyAz1Jt4FJp7Lb86iN5WupP5ZTJrkKH2
	h4oa2nUm06G57y3OEULO7GvXR2yN8i8gCZdgQy4r29Q+coWoYSCDO17aHYUzHRURw==
X-Received: by 2002:a05:6830:7316:b0:7e9:bbf5:1079 with SMTP id 46e09a7af769-7fb7d276778mr17530457a34.2.1789010493406;
        Wed, 09 Sep 2026 20:21:33 -0700 (PDT)
Received: from localhost ([76.187.192.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da9a49sm19758315a34.13.2026.09.09.20.21.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:21:33 -0700 (PDT)
From: Andrei Aldea <andrei1998@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH 06/15] HID: hid-oxp: serialize complete RGB updates
Date: Wed,  9 Sep 2026 22:21:06 -0500
Message-ID: <20260910032115.28669-7-andrei1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910032115.28669-1-andrei1998@gmail.com>
References: <20260910032115.28669-1-andrei1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The transport mutex protects one report at a time, but changing an RGB
effect requires a status command followed by a color or effect command.
Serialize whole RGB transactions so sysfs and delayed brightness work do
not interleave these command sequences.

Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
Assisted-by: LLM
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
---
 drivers/hid/hid-oxp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index bee1317..8d07816 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -181,6 +181,7 @@ static struct oxp_hid_cfg {
 	struct led_classdev_mc *led_mc;
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
+	struct mutex rgb_mutex; /*serialize complete RGB transactions*/
 	u8 rgb_brightness;
 	u8 gamepad_mode;
 	u8 rumble_intensity;
@@ -1074,6 +1075,8 @@ static ssize_t oxp_rgb_status_show(void)
 	u16 up = get_usage_page(drvdata.hdev);
 	u8 *data;
 
+	guard(mutex)(&drvdata.rgb_mutex);
+
 	switch (up) {
 	case GEN1_USAGE_PAGE:
 		data = (u8[1]) { OXP_GET_PROPERTY };
@@ -1191,6 +1194,8 @@ static ssize_t enabled_store(struct device *dev, struct device_attribute *attr,
 		return ret;
 	val = ret;
 
+	guard(mutex)(&drvdata.rgb_mutex);
+
 	ret = oxp_rgb_status_store(val, drvdata.rgb_speed,
 				   drvdata.rgb_brightness);
 	if (ret)
@@ -1244,6 +1249,8 @@ static ssize_t effect_store(struct device *dev, struct device_attribute *attr,
 
 	val = ret;
 
+	guard(mutex)(&drvdata.rgb_mutex);
+
 	ret = oxp_rgb_status_store(drvdata.rgb_en, drvdata.rgb_speed,
 				   drvdata.rgb_brightness);
 	if (ret)
@@ -1302,6 +1309,8 @@ static ssize_t speed_store(struct device *dev, struct device_attribute *attr,
 	if (val > 9)
 		return -EINVAL;
 
+	guard(mutex)(&drvdata.rgb_mutex);
+
 	ret = oxp_rgb_status_store(drvdata.rgb_en, val, drvdata.rgb_brightness);
 	if (ret)
 		return ret;
@@ -1340,6 +1349,8 @@ static void oxp_rgb_queue_fn(struct work_struct *work)
 	u8 val = 4 * brightness / max_brightness;
 	int ret;
 
+	guard(mutex)(&drvdata.rgb_mutex);
+
 	if (drvdata.rgb_brightness != val) {
 		ret = oxp_rgb_status_store(drvdata.rgb_en, drvdata.rgb_speed, val);
 		if (ret)
@@ -1470,6 +1481,7 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
 
 	hid_set_drvdata(hdev, &drvdata);
 	mutex_init(&drvdata.cfg_mutex);
+	mutex_init(&drvdata.rgb_mutex);
 	drvdata.hdev = hdev;
 
 	if (up == GEN2_USAGE_PAGE && oxp_hybrid_mcu_device())
