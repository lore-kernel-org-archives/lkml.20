Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380216;
	b=2BiJLNoxch+Md8xTQf0oKmTqS6YmZPaJ5DrblgTRKP3WWu4kOnVfnB5tg/tZjGYxpzo3
	 qDoiX5IZ0hxmI48dd6eAolaF+frYMkAH91c/OV4ifBC8vb/9CS1smUEV7QSIhjuEYZgR+
	 80HrMkpehtguBuc2F+CJj1G1DKRpD1bK6YCKxxN2JkCnLxetmHZsjmsJ3I8+L3ft1WtKQ
	 GU6aSjrkrPCtkC7dSyJhEagY29VhPJqT0bvslk2pReXXg/KCQm05dgUbsN3CQldexhNWM
	 dFPqMgOBLphPmWM0QHLXwkOoh6QNiJ97lbkPsFUHBrLPccAf0aIuwkoNXSLNv92cAqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uXatp3CQ/U/8sPWo9k+x7ZCgVJOzTYATBGbDznP95hA=;
	b=jCd7x0rffCaAMCH4WMAo5kgaVwMuiG+QFJx140Od3o1hyEC3c/9LaFw3X7Du0GEtU34Z
	 nB19qpBqihsCwPWXwaxxWp7Uw0C5nLQJZuiTgcARGrgFr2oRHhvuDeyDtIzQ0e2YdgADt
	 UpgSnnehhR84QVKJr7cK7GCTKnVvFypiz/SgRGVrqm+jxyts+IThzpLRPzCnJiE+FpiXq
	 ZDi884QpcKqxN9LhtYW2C0w964vdc3Jrzo8yzJpon8Wfjr7qlC5wAIKAxvl8zGZXL+HXz
	 oyVmBuFQU6VBQR3VDBYBV7mh7yVo/oZL/17wFfUsHxFmKrOR08LO8luA9CzwclHaCwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2jXXfW+;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878C60A263B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8878C60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2jXXfW+
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3ada81853so2560404c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380215; x=1794985015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXatp3CQ/U/8sPWo9k+x7ZCgVJOzTYATBGbDznP95hA=;
        b=Q2jXXfW+G3OAac7PW6JwmNe0P/HzqYfthm8GmgGAZehEpnDybIUsAkxL2VgfRbB6ZK
         1Iu3ZgZCPbMO/L0dtz4943WYW+pJf3wj3Wf1ORmkh2VQKxXDFPvjgOGZylkaOKHTVOdi
         cb0IV6kGqI/m/0E4XhQk3QIePmrmZ5kwFR7xQBPFQvLtWwplnVbmC0XMsAGamL24wmBx
         Sywpdm7rCVWF12w5fS+U/y8VNWB2kWX2n8jim4f65UEiPsjW2URDqZR12XcKhlIf0okN
         pdzIkOW8ACQClbFsB4RHCPnAN35rjhJr+8LR/vkZM7j27hi1aKqEFQxetC6ngxYK1CYR
         uL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380215; x=1794985015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXatp3CQ/U/8sPWo9k+x7ZCgVJOzTYATBGbDznP95hA=;
        b=QUTq44nNkrIpLo6Amiml8O293HbazXDwMqZanX0wOWOVC081Lt7FR67UJqZvORB6Ul
         KZCvtqq7nB1FvVwDdDEhkWZJkzPQ3Sf1/0tYehV6ayrd1vKrjlgC+9KcR+yb4SI1JmL3
         K/2HbME4QLWwkMEZZpDmkA3XQlDJWcF1n0uPnlFFGJa5goUA+cP9w+z30W0oC7L40Yra
         Je69OKzmTyoaYbVFRAnKlth7rRPJeCavDtMIRT0XB/SkGrJyBD0JvrybK159gtAVfUit
         hQ+L46GamDJg22tA47ksompg/IsuunP0auSlT/IKke2fRYeHQCmj5CEQhr/Q/cunOibM
         nXEA==
X-Forwarded-Encrypted: i=1; AL+hErH44iw9hEMKCWsCcLoZXsWtNgdpjcbuu/WXBXmIjuWlgGuVTtrfX0GajL0Evg20202xX0E/AXc5vbZV9ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+501Q+07E0rWvspjo9yFlgZIoAbEK7Iy0SU+eZz3iAS2BrCBP5
	rQvcMz0uACOJ99w8tBAwZH/Zl97ify8rGT7Tr4gGxlwm3jxE7kRfU9Jf
X-Gm-Gg: AYBFou0WM98/+T5BJJ1TptHuTqkiBd7ZVF8qReu02fB7fpoTlvNEgirvGmOhPbPmefl
	PZfcAvOkWmxoDD6q6qnK53eEBtKE0tnjtkaLr6mjqFHLo2qwN9X3Vwg6hKJculRveZ/G87MTZ0T
	SCbfIPYKTy6T4WSOqakO1s/7ZFxi1hdYdScNshHcPDpEqmAJxOC84kQhaex1SXL5cK9+2fVPzaV
	HmrLPwL5tDRTb5LJGxoIa76RuRw+eDMbq5wV+hGm+5LhHVymX2c0MXesty1b1NnNcJOogHFPz7L
	zQdLfi7aQubkP5GU3qH5vpgU7OLHlRRtTH8e5SUD19Jt4gNYQT7gcvDzSVfIQe04tvO6B3mJGo6
	sWtIzoQMlLJdOlWkDK6EeJPH6dzQi5BgPy/T4pv3RLVSvKiAZjAg5eyIx9Kw97DKdLzkqW/RzBg
	9Tz3IrBvMR7rrgz9UgB0eTaPf7X+BY2ombA5lN1ZJi9EWTtUBD4sdGLyqu2boYa9Zg79Uo39Bh8
	k/669Z6XZTgPZCCZpuBWiM5VVwjwGcYBi8SisQg20NHjxE6i2aG8w13+3s/Pl1MtZfjH7/KFGGq
	KwWcBgBthF8LgYX/oz4IkeX+cyW6ZxT1aLOlNnCCW0xD+5PAGKCj+ShVo6vVf1J85rc7SMMwDHg
	/fXYtNMQL7xZSeseCxg==
X-Received: by 2002:a05:701b:2514:b0:1a3:8d5f:6f93 with SMTP id a92af1059eb24-1b3c030745fmr1216047c88.17.1794380214379;
        Tue, 10 Nov 2026 22:56:54 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:53 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:18 -0800
Subject: [PATCH v2 20/33] HID: logitech-hidpp: manage G920 range sysfs
 attribute via dev_groups
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-hid-logitech-hidpp-v2-20-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Creating and removing the G920 range attribute manually inside force
feedback initialization and destruction ties sysfs cleanup to input
device release rather than driver unbind, leaving a dangling attribute
if userspace holds an open event handle across disconnect. Manual sysfs
management also adds avoidable boilerplate.

Register the attribute group through driver dev_groups with a visibility
callback checking initialized G920 force-feedback state, allowing driver
core to create and tear down the attribute cleanly around probe and
remove.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 45 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 03d2e9077675..f24fa70d272e 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2747,16 +2747,47 @@ static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute
 
 static DEVICE_ATTR(range, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH, hidpp_ff_range_show, hidpp_ff_range_store);
 
+static struct attribute *g920_range_attrs[] = {
+	&dev_attr_range.attr,
+	NULL
+};
+
+static umode_t g920_range_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hid_device *hdev = to_hid_device(dev);
+	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	struct g920_data *g920;
+
+	if (!hidpp || !(hidpp->quirks & HIDPP_QUIRK_CLASS_G920))
+		return 0;
+
+	g920 = hidpp->private_data;
+	if (!g920 || !g920->ff)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group g920_range_group = {
+	.attrs = g920_range_attrs,
+	.is_visible = g920_range_attr_is_visible,
+};
+
+static const struct attribute_group *hidpp_dev_groups[] = {
+	&g920_range_group,
+	NULL
+};
+
 static void hidpp_ff_destroy(struct ff_device *ff)
 {
 	struct hidpp_ff_private_data *data = ff->private;
 	struct hidpp_device *hidpp = data->hidpp;
-	struct hid_device *hid = hidpp->hid_dev;
 	struct g920_data *g920 = hidpp->private_data;
 
-	hid_info(hid, "Unloading HID++ force feedback.\n");
+	hid_info(hidpp->hid_dev, "Unloading HID++ force feedback.\n");
 
-	device_remove_file(&hid->dev, &dev_attr_range);
 	destroy_workqueue(data->wq);
 	g920->ff = NULL;
 }
@@ -2843,11 +2874,6 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	dev->open = g920_input_open;
 	dev->close = g920_input_close;
 
-	/* Create sysfs interface */
-	error = device_create_file(&(hidpp->hid_dev->dev), &dev_attr_range);
-	if (error)
-		hid_warn(hidpp->hid_dev, "Unable to create sysfs interface for \"range\", errno %d!\n", error);
-
 	hid_info(hid, "Force feedback support loaded (firmware release %d).\n",
 		 version);
 
@@ -4985,6 +5011,9 @@ static struct hid_driver hidpp_driver = {
 	.input_configured = hidpp_input_configured,
 	.input_mapping = hidpp_input_mapping,
 	.input_mapped = hidpp_input_mapped,
+	.driver = {
+		.dev_groups = hidpp_dev_groups,
+	},
 };
 
 module_hid_driver(hidpp_driver);

-- 
2.56.0.542.g3ef89b7020-goog

