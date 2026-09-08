Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61040526A8D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859162; cv=none; b=Iwzy4YBqXmE79kQwOD/DCnmBddx0EdPEN0+mxGrFFUn98Mo6PaHLiBiA7zLmQJ/jHZFIe0Xdgfz7dYGECbEbHkJ5hFFPNpb89f0XbfnWKN2NOk+beLqM8W3g0eIKUP/SfvYw1f9dXgiGB2/4C86C3rxzEjlvrPquHmhqeJJThfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859162; c=relaxed/simple;
	bh=sLWhsJ6vU01bK4pxK8518malOwcWBl1JUpxOIBYHm1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hvGXppAj8ysqRSBdMXX8xKgNoJwlCsXY3ye+8Zn1kPHODE9ArDF5oGUDFrLhVqBwR4dSIQZJzRQ95OFZ2CmA0xMtR+1mqwNyNEuPuNG5y/BpD2lCIcSqwtvd1CYWYUr+Tl9XtilWesKr9JUAVn6pvL7GeqNuin1dFPsU+Qjd2/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FL1LHpec; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FL1LHpec"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4858269e3d9so360267f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859159; x=1789463959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9mj2u9V5jGMmGmcJmWSSP87GOFeugfg4yqa9HSRY08=;
        b=FL1LHpecLEmFKY5XYAiQL/V76+EAi4kpa49TOGWucOwey3HueFtXEb9oh85zNd4A9Y
         8TSQY1LVyfh+1JyvC8icjn3RB1x0BzAjukwnczKXrhi4IexLxsdDLd4kGB82or1ynevI
         vXUROYsp344ovBfeCzywbCuOJw4L85uji8stqS/2kaNibpTR0aUV0fjKbUgXZ5rA0wHC
         4nAODBdfOhzqh851LA/E43DuM9qI1Qy1BD/uT7X5VILF9r60w3VpabTsAF5fB2lwGlID
         jqmLbJoFkVDRYbj6rnFYn6kSdBTSsCGjw6RKXVYexMEXigW5IxRquo96mdNOXR1ylsdN
         F/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859159; x=1789463959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9mj2u9V5jGMmGmcJmWSSP87GOFeugfg4yqa9HSRY08=;
        b=R++NqhJH81FO167FZpTDvdIOpi4hQr5LaKFgrHgkDR5e5nPkNcpc9d8VzSiJLswl5d
         ANdZ/l7xB6LxJm/GNmxQgnsSzrUOd5gaZQ24FPT99Pdvetb/r9iuBpOhDroVFvWkRTq2
         ltP7TseZI6tqGNeD/pXKN3rHhvEzwwUqqmpM5ri1dxLQ/ZmDxXyqj71sY6tqVa01UFFV
         h8H+wCXv4nStikMpsbRoeVDTJJ3xrlhgEmbH/DxMQLkG2GkdRM2+HmAanTdz0S2gftpZ
         wOWZFkzpy3gSW59aTnCqS38Ef4nScFJam1tltng+H1IIVGyjYeQM7TVKvTuo817VUpPO
         pL7w==
X-Forwarded-Encrypted: i=1; AKwUvBx5jtbyGm3PRuNskyvt/kOzHfJA9eUVrf6sWchYHtKul1uNKx7PfyQXXTrb4BVbo0JHzozoQyMPyLqR3s4=@vger.kernel.org
X-Gm-Message-State: AFuF++ljnqtLEbf0ZvPUXmYsglNmkHcznieU6syqfSF09kfg9n80BJN3
	uLBmJvwK6oCzIGpAXoiwspBeBaDm3Rjj3O+XB+MPggyLfunIbL6L2gOt
X-Gm-Gg: AYBFou0q1iwxdtCxMJpVikbdNRq1q2WjOGgSBI6IVeO6DL7rWo60g/9jeSQeeuDK8eg
	WynBkizehYwIxa0txYfcC/FHTzXEAQVtvcRKUkA7bb6M312q/nuOxsg2fMKOTrOOyvS4xbhCX1M
	WU07JdKuGcu1UZHmNlIZY5HF3sLahl6PMPB1vYeTnJ64t4qTSaaAZY9xnpZDhG/BixUkOFwuRD+
	lLIOLlzhGbG4ert2MPjwYt2tMJ4jSnGzvVzhMD3EXXnSM1oH1i5/CGD6HSb2FcL+ka/2++bXBc5
	KrbMpeYq9CB9Ei+nr8H5P78q3/BzcHyzeio0FqllP8jFNOiW1IS++SEDpcoScMjbHajAR4zSu4/
	5Fv6H7o7kjildomAc2/UrALfuAFb91ClWNnaxz/TlJXETKjcwdLl7SdMmLyeQFUelIma8zD0sB9
	bx1Z3zXisQpJWEmwumBNQHSGCrbqynEaByg9OtyGcMO0tSreUXUW+H/3YolomJ2R/PFyOkRJfBW
	AA8YzHS4oYWaN2f2c7fRa1JmqLhGCd2
X-Received: by 2002:a05:6000:26d3:b0:484:3310:710d with SMTP id ffacd0b85a97d-48587291448mr48081096f8f.25.1788859159484;
        Tue, 08 Sep 2026 02:19:19 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm33028964f8f.36.2026.09.08.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:19:18 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: lenovo: suppress phantom radio control input on Yoga Slim 7x Gen 11
Date: Tue,  8 Sep 2026 11:19:07 +0200
Message-ID: <20260908091907.5653-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ITE keyboard controller (048d:83db) declares a Wireless Radio Controls
application collection, which hid-input registers as a second input device
advertising KEY_RFKILL. That collection never reports anything: the
airplane mode key is wired to the embedded controller and reaches the host
as EC event 0x19, where the platform driver emits the key.

Map the collection to nothing so hidinput_has_been_populated() discards it
and userspace is left with a single, real KEY_RFKILL source.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/hid/hid-lenovo.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 3976d7b53b14..617bba662659 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -476,6 +476,16 @@ static int lenovo_input_mapping_x1_tab_kbd(struct hid_device *hdev,
 	return 0;
 }
 
+static int lenovo_input_mapping_yoga7x_g11_kbd(struct hid_device *hdev,
+		struct hid_input *hi, struct hid_field *field,
+		struct hid_usage *usage, unsigned long **bit, int *max)
+{
+	if (field->application == HID_GD_WIRELESS_RADIO_CTLS)
+		return -1;
+
+	return 0;
+}
+
 static int lenovo_input_mapping(struct hid_device *hdev,
 		struct hid_input *hi, struct hid_field *field,
 		struct hid_usage *usage, unsigned long **bit, int *max)
@@ -510,6 +520,8 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
+	case I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD:
+		return lenovo_input_mapping_yoga7x_g11_kbd(hdev, hi, field, usage, bit, max);
 	default:
 		return 0;
 	}
@@ -1568,6 +1580,8 @@ static const struct hid_device_id lenovo_devices[] = {
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X13_TAB) },
 	{ HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD) },
+	{ HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD) },
 	{ }
 };
 
-- 
2.55.0

base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
