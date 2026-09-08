Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815D52D2BB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866317; cv=none; b=HxdpuKDR/2ca2FFE51DnRY6TNsrbSNSXxU0kstkealGThliD8m71w/C9ACO6ukRG8xHdMRG210mwmP2LYXBSoCLKkl/1LReIauSFQIIfHQvagjDd1tAu+LNKzODjwFtql6Nshq4+F5pGHYnXVWDznS8xDya4F5A6ZBoFGUUg1U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866317; c=relaxed/simple;
	bh=t/ovtFrISDktBvngN1BFezgR29OO5wT7f3gkFho/p6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1K5hv9s5b0nJS37uRvNSmvxC/ScK5R3Oml8A4RKUd8s+AK577lJMvW1af57wReCIVa+HSH1rpsxWqq17MbgA6woogubUUsljHsLmcC9iTm/lGJ7cerJaRGLpfa83vZCFr4cusbOjbHh0jezrzJyGw9FyaZsdD4X+LCk5qk9+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXgU2Ube; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXgU2Ube"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-485843aeab8so5038023f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788866307; x=1789471107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gk/nJeJxwPg2pq5tNRM4eCstoAGF0TBlM4pNX6SM0kY=;
        b=kXgU2UbeblVOpJxBU4KLQ61KVyf5ihL461GpQ+KmK5Bv1pQaMrx5EOj23PMfWCDohZ
         IUPXF/ZGU7BljhgKQvEgoXkILy3qDbjBhN6YSH/7cGrns9CWkzKhEvVw2IAR09LTgNYM
         lEv7PDcJQd2dToSZtRDT0eGEzrrZXZK/3C++fMgglfrnHOFleh2wulHX4hkJUpW+1fCM
         2+N5H6RJaRIg+WK4D/bzXVXQgkqromOW6sGyq69fTfsMet3WIaJYl/ZtIoZZ4RcZHPQV
         KiTAhWKWdacGskOd3gQSqZp0jq0LquMxoH2jlfHcdTnkWhMwq5IiSUjFVF+Zh+te7C8C
         6FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866307; x=1789471107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gk/nJeJxwPg2pq5tNRM4eCstoAGF0TBlM4pNX6SM0kY=;
        b=EJAPZc+VohbsFSAsoNIMUrmGyezztZJ2ry+oZC1/4Y08t2ZP6642okIPrUcfD65mLj
         Ovt63XT1oN2F+Q2Faekcz+8TJkR1LAoQ3EIHlZrzLnMDmzTrMjjKR4MbJmOImgwaxuYP
         zFhLu4lJGC8enJAa56zPLLWRD5kcV3G0WFYTS68jVVI63xLKBW3+jVJM8vm/oIZU8a/r
         URUZYR2kUsN56+KqHpZXyUA3GviNo7FslEOHRcpP3d3uxrCKRdzomVXX+qXqSp4Kwm5P
         DdJW+RAfRAgfnQQ9A0uElgIv4xkRg8svMtvdIg2ZmxITk+Q8Vid5j8K/VjSTkGq6Fbh/
         uQ4A==
X-Forwarded-Encrypted: i=1; AKwUvByz03a+5g+rkIxCaWUvu0W9S6KAoQOFiKS+wbC2Kr4p0gGZ86KYM+yIef1qXJR4jGpZqbxBLbn2WiVzdSs=@vger.kernel.org
X-Gm-Message-State: AFuF++mRK2vLnymPFDgjsZqawckpNnHep1KKTcf/d8JWULti8ebNg8/M
	uFB06jmV5H6VxtuUcfNqxjHqoszfHNSNtAFdCqQ2Yy0EvQv9K+P9ITY0
X-Gm-Gg: AYBFou3n8++b7zw5AmHUfc6kT705XL9YgupM68r78uVX4V/pA87QfG8atypcvFJuTsf
	jghLsTa9IejFe/FKlBKxL9C9Is0qqT775169AjG05K3wByL9eZJeKwOcO2pZ5YBWvm6aj9m9xxb
	CZjRhNVY/YLnXm3kXBnhqP5MitFf3SjEAv+J2tLERfiSd5m1idzihyICNmJW9QFoKcIcy7zBo1M
	EBErKACpT3fbkBDjxYLZGwh6or0FuJeobucNdvD3Bph+7H4APpYWSoohDyZl9uYnHEOgbOjFrUj
	oOHauSi4U+Qa2d62CdDnBJvaT4lOmU1+Zc78IQmxgTPZV8oavylwM3b1JA6SJNobT2QOmQWEZ7m
	X5J/t7L19pmkQ7CVmtszH5aLNJnv51bBXxBJSTASFyJL6LSSaIOeLyoXDhpBEbSyaC95jXlC6bG
	lJFhp7q5m02+jKRXfD+wACu9ytP9ntOQ6IxiYd2SkLpG2OeANFycbL7hvJMftmBE+AintIuu5kN
	9896ik05WpR+CtJRp5gCVJGHMVNLTDCD4gkxd+RfZiX
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr619835105e9.16.1788866307154;
        Tue, 08 Sep 2026 04:18:27 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm34422099f8f.3.2026.09.08.04.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:18:26 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] HID: lenovo: suppress phantom radio control input on Yoga Slim 7x Gen 11
Date: Tue,  8 Sep 2026 13:18:12 +0200
Message-ID: <20260908111812.43837-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908111812.43837-1-okerixx@gmail.com>
References: <20260908111812.43837-1-okerixx@gmail.com>
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

