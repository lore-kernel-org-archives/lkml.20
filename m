Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAED377EA2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244580; cv=none; b=gF6bLPO2J+HuiFvkm7/MwG5kSQWMtxcKVgpI8c/TXZRcrIP+oCQ8cuTVqMmtoteplPQXOLMjU1JHWKqRMWJVbmt4zG3Prz/v09PLSEsf32oSjm7lCv/kiA690V3jlqDuLPJ33Hs3H6os5BS9VTDgG4/pG78l2HKO+rYGFt+TB0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244580; c=relaxed/simple;
	bh=reLdAq8P0t49kvDWPzWt8gweqMKLVAKU+JnfiiZyo8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl+pYdcT2MsWbdoQ9Fc/e2obEAOHgX4r5t09gT8h65VOJUkRXXoGeNLv9vP5BGGu4njAO8S7s/uFFNN1qx40TuC0NDq5mFZKkI7lmR3YztI6SpW2CA78czdV7M1f1kgR1yG/UBxFu/kt1R/5w2QusQjEsOzCCwKyqfNOzm4bYnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtSpiDIJ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtSpiDIJ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so4153412a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244578; x=1788849378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxJQOF7esWYVaSzzh3UuNgbHtz6kTLWO9YCyNun8jQU=;
        b=FtSpiDIJPEgFZ7plO/7E82h1VqtthVqVzPO2N6F/U4mGIbUVQWKqf0IAiwvWfbhsnk
         Vpnfk5xLtrht2uuLSBMgNpmVYnIe/jD+cy9qwI+0xo7QvCxLauA0n3LKcfUf8z7UKcL5
         OIgoJWbFQtSAO8ad8xn6ujseuwZ8JQsDE9yGHNOvnjOoeVEMs5U6CQAQjj1hB6sHWGfm
         GjOBSF7KJ5CBSC+Aa1vhBIK+RG/c/r3SqNovgtlcFJDuxbiVAhG4liDGszpCazWb+LiE
         SxnlnssdsCloWEgY/JzAWt8h/XDHi66ztJ0GO5qucr2/Lrp1rQK8UcdVLMfvJi32F7Qb
         VnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244578; x=1788849378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxJQOF7esWYVaSzzh3UuNgbHtz6kTLWO9YCyNun8jQU=;
        b=eD8SeWIn1djJYvAWpuM9dCAJMn5jYKY26qPjEJFBQXhiuVAEBsEm+xf7Fgpsu/6h3R
         z5NohvrkTcSwpv6f56XVyLeYigrRYL1aYLegkooZG0mjqxlcRjw9LdAEzb7r4OwR1bWv
         COc4MQ3CCl09oMPb3mvGazNGERjd3lE9CS3xFrF+li1Ib7lW9TYmpeSp0JbRpi2ubOrB
         QxPvQK27Jhsv3xpmoxXVd/IZJnh71JBAglkNLwZVNXsygsIAkEaoeSiJ3B2dIm63IXUJ
         gVFRPw7CPqxGqnhJjMZ69+P08ajZF5rEDQt3PUkY93ygRar03D5UzBMB3OcNqQOFrBjv
         3nlA==
X-Forwarded-Encrypted: i=1; AKwUvBx5i9EpjLfKF24nSqqW5O8YEgePjVNZFAoDJz2ASGz8IEfuDYidkAPi2GsK8470SSNqaCTXHNSPbxmtUnE=@vger.kernel.org
X-Gm-Message-State: AFuF++mqNnbjNuPOBoYOiyoT35F1A/8vdKC0hWV76sbRlWhSAwE7aJJQ
	4RWmEV8cVrXird1nQPYNEApt9xETsAxgKSgW8Ji7puMbKxw583uOtJT7
X-Gm-Gg: AYBFou2p7T0AoQrojbG1neJY5YsdxIDR7gRSrYPJBsaCkSOUASf6M9KVfNakIrik/F3
	Swpcad2Mh2pA1OH0QvvhaVG927GtRRTKi3JQWB3nU2GjqlD+hSHcXVXfm1PUX+0529MrkaFhCwG
	nIddk+Qs8T5n780a1MKvEGF+wd2J0s3J/y9za/eaJ1x6+TJE/PkI7JergFSqrTprG73Zt+blKGE
	UpMmTQRZuGSHog+nDgOq2+0vHn/pdER4cxtUAHjb//gKrOoKg0cdN9G247KFveiWxYWVokHNDde
	pAG9p4GjwJj2WV2twu78PauvcucOT1Ppi2097l9hozXQGZAhYrDT+Qx8wNkKgc+mkcZBI1BwJDT
	TN59Yjqan7e/EhK/Ne/jPXauT6cJM9wjhESHOOqud0NPqS4PdVarA1AC/EbO6RmYpElcKgbPF8O
	BgqiiptMQVDZq4j6WxlyQtEXzeHSvgCW26FDLEOtHVecK5AEl8a988kSXnrObW4+61inqs1WkMb
	7bnVyNnyQuIbQ==
X-Received: by 2002:a17:90a:e185:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-396d0ecbdb9mr52394238a91.6.1788244578206;
        Mon, 31 Aug 2026 23:36:18 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.192])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm32694425c88.10.2026.08.31.23.36.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 23:36:17 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] HID: hid-lenovo-go: use the correct calibration commands
Date: Tue,  1 Sep 2026 12:06:02 +0530
Message-ID: <d10f7771d20d356dbba45047894aca0b41e7a3ae.1788222001.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788222001.git.mradityadash@gmail.com>
References: <cover.1788222001.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calibration attributes pass the calibration operation as the command
and the configuration command as the sub-command. This sends each request
with the two fields reversed.

Swap the command and sub-command values for all six calibration attributes.
For example, the malformed left joystick Start request is:

  05 00 04 0c 03 01 ...

The corrected request is:

  05 00 0c 04 03 01 ...

The bytes identify the output report, configuration group, command,
sub-command, left controller, and Start action, in that order.

Fixes: 995887a10da1 ("HID: hid-lenovo-go: Add Calibration Settings")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 318b1152ff8b..b8248bf8965c 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -1911,18 +1911,18 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_left, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_left_index,
 			    "rumble_notification_index");
 
-static struct go_cfg_attr cal_trigg_left = { TRIGGER_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_trigg_left, "calibrate_trigger", SET_TRIGGER_CFG,
+static struct go_cfg_attr cal_trigg_left = { SET_TRIGGER_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_trigg_left, "calibrate_trigger", TRIGGER_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_trigg_left_index, "calibrate_trigger_index");
 
-static struct go_cfg_attr cal_joy_left = { JOYSTICK_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_joy_left, "calibrate_joystick", SET_JOYSTICK_CFG,
+static struct go_cfg_attr cal_joy_left = { SET_JOYSTICK_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_joy_left, "calibrate_joystick", JOYSTICK_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_joy_left_index, "calibrate_joystick_index");
 
-static struct go_cfg_attr cal_gyro_left = { GYRO_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_gyro_left, "calibrate_gyro", SET_GYRO_CFG,
+static struct go_cfg_attr cal_gyro_left = { SET_GYRO_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_gyro_left, "calibrate_gyro", GYRO_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_gyro_left_index, "calibrate_gyro_index");
 
@@ -2018,18 +2018,18 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_right, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_right_index,
 			    "rumble_notification_index");
 
-static struct go_cfg_attr cal_trigg_right = { TRIGGER_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_trigg_right, "calibrate_trigger", SET_TRIGGER_CFG,
+static struct go_cfg_attr cal_trigg_right = { SET_TRIGGER_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_trigg_right, "calibrate_trigger", TRIGGER_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_trigg_right_index, "calibrate_trigger_index");
 
-static struct go_cfg_attr cal_joy_right = { JOYSTICK_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_joy_right, "calibrate_joystick", SET_JOYSTICK_CFG,
+static struct go_cfg_attr cal_joy_right = { SET_JOYSTICK_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_joy_right, "calibrate_joystick", JOYSTICK_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_joy_right_index, "calibrate_joystick_index");
 
-static struct go_cfg_attr cal_gyro_right = { GYRO_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_gyro_right, "calibrate_gyro", SET_GYRO_CFG,
+static struct go_cfg_attr cal_gyro_right = { SET_GYRO_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_gyro_right, "calibrate_gyro", GYRO_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_gyro_right_index, "calibrate_gyro_index");
 
-- 
2.55.0

