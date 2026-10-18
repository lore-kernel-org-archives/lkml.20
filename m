Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE29144F57A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327704; cv=none; b=HSuor1tRFcE1Y/lQzIzAnafwsS+MI0CtItT1U+3j6OMev7V+x68CcfMjsNfQH8FQsOiON1UxaDMRrsEgyQcSuSQZ0swfHr9iEBxBKpFPluAiq0mU6T2v1CS78+AL9MOrg1NtxggT0r33hlfsWbT3hPGd3xsU52vJsPIqyrEqHHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327704; c=relaxed/simple;
	bh=lN41a61/nKGGG/YTHpOK/9MR+fMHvrEQ5y32R9jcciw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6mlmz0rNGZrZ3wkO4X0Nls1PiIUxFo/RPHCLSk/YZx5d+bzT24abVn+2iRsX8+OSkExYofyjwjs+6KwUGqZCioj0zWvfWVcV76cJN8gCczoI4ZLgrfBt/u2zwyqUtvfID8HqCETd4OcYMAo+O3tMyRhgVcwFM7J3VFTf+1I9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuNjyExD; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuNjyExD"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1248316a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327699; x=1792932499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CsZ2iMRB1tUMxGPpgV7ei32dAx256Q8EZ78cw7J4Mk=;
        b=UuNjyExDUrlOn6vVkCs5mF5LqDTWLaUF0a6+XMJKICgfPVgdzyshJ+Hk0MCfZ7gk20
         77lHy92V2EdUiOp9H26/E3yTdfdh4cS8VvbRlcmZAMZEJWFmvKBreq3Deg8o1x0nfTGE
         AwoIHCBZZ4xiJnWC6F4mL1awElepMlIaog56Heg4Pn+bkObUVOa4UNiUCNKOZFXUw1Fn
         KLDfOL3PacI9tEBhHue4PC/VlgZr1JUORhrCbQTVVCwqc0bbMKbyIle/aLYKNsABiA2c
         y+fkmNSLzX/q7mkmN0yVyV2qbVrKi5nPYi1yoCvaLdB5bbjHwMrfaOMSVupXxtO/YgIK
         Mm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327699; x=1792932499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+CsZ2iMRB1tUMxGPpgV7ei32dAx256Q8EZ78cw7J4Mk=;
        b=jQmPznSWj0t3RI5WXs6Uek15/QFT/eIfmqlAlwiYw0TTMA0Xej9F78GWaXqFaawhRz
         zwHlNNgMBMSwo2p61uC5DtUB6jGn9Pna9X+gMH6WgQn+7FzVpgsWQuGYgWkWQ139ASWJ
         F0RpDz/4nyxQ3Y9NS8ELMgEE0hRNv1xiPUfStP2jGP1Jc6Ij8grlJcmJeIWCsgUZL4hA
         /xWukpnC5U+SQSG4AoWBnPzKXq6diHPpgDfoXwhtgom39EmtoqnCr0mECiW7AzhUi9VM
         P0SANG5IHRh1BpTZ/xWTosOHOM7rcP/YhMPIQmvyGoRb39UaabflTGe/US/ROAfPH6rh
         tOyw==
X-Forwarded-Encrypted: i=1; AKwUvBzD8rcAmFZektV0B0cCg9B51Zi8DkvgNEXpnfyf49FfcgyIFfJt/8oGUNZVLB+jm4S7Se9IEutUAxR1etw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp0jV4HXS435K78vjyHzxNGSawtiPn5ZMZ+uvAS9NZXNIR1ixY
	FliXVuw1O3sL2dYIsXGhkpHgMQnuHKOs/XFUr4tJGcY2DLg/Ln8i5XJa
X-Gm-Gg: AYBFou0DrP0BNY9ar3YupFLRCyQoALY/cqNsLSwLexnOTtLn9wA19G9zRacjnX2bvLY
	uj1i04dKZ59pAmZPYeLvN96QIk/tkov3AUOakeAxvN8/ioEdF/y0VS6XRsuJF6ixBzWCBwYRnWr
	AXr3w6KlxQep6dobWvpdZTnC0id618VpKpHL3OvyiLmiBes6bB7HdZ/GnQ5bUWLMnYeAlihCIDR
	Fz/j0sCNGk20uvWDuRlu5+845Rczdbdu1oNioKw9YvPpVxPNjMVmRMRgsOWpSWky0lr3ZQFrK/B
	C+YriMa3Cme8mAeR9VSTQQL4b4Ib82ZLcBK8arwLMCplykSfJY7Y+TeeW5qxcLWU2JILma4A+hc
	WcLkvib7rqN0gHFV0JXsp2yLEr9LUtDTlSlu8xEX3P6fWrhg+MORcexOOg6f2AMce1fAdvGTtWc
	qUTtPyMGBTuF7KeU72A+TTk2Z8Jw7yk9sfnqgjb9T4XjySAl4SkC4KuCr54nsDaQf2ofXApWQ5m
	LeM9c0YjBtoowHKt2uapLI=
X-Received: by 2002:a17:90b:2701:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3acef11c1b5mr4055247a91.60.1792327698656;
        Sun, 18 Oct 2026 05:48:18 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549ee946sm2804669a12.20.2026.10.18.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:48:16 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	"Claude Opus 4.6" <noreply@anthropic.com>
Subject: [PATCH v3 5/6] HID: wacom: add NULL input guards to Bamboo touch/button handlers
Date: Sun, 18 Oct 2026 21:47:54 +0900
Message-ID: <20261018124755.850888-6-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018124755.850888-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018124755.850888-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wacom_bpt_touch() dereferences both touch_input and pad_input.
wacom_bpt3_touch_msg() dereferences touch_input.
wacom_bpt3_button_msg() dereferences pad_input.

All three can be NULL when the corresponding
wacom_setup_{touch,pad}_input_capabilities() returns -ENODEV during a
successful probe. Add per-function guards.

Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Fixes: 862cf5535c0c ("HID: wacom: Introduce a new WACOM_DEVICETYPE_PAD device_type")
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index e0bf03123cf9..a34db1505625 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -3151,6 +3151,12 @@ static int wacom_bpt_touch(struct wacom_wac *wacom)
 	if (data[0] != 0x02)
 	    return 0;
 
+	if (!input || !pad_input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: input is NULL\n", __func__);
+		return 0;
+	}
+
 	for (i = 0; i < 2; i++) {
 		int offset = (data[1] & 0x80) ? (8 * i) : (9 * i);
 		bool touch = report_touch_events(wacom)
@@ -3185,8 +3191,17 @@ static void wacom_bpt3_touch_msg(struct wacom_wac *wacom, unsigned char *data)
 {
 	struct wacom_features *features = &wacom->features;
 	struct input_dev *input = wacom->touch_input;
-	bool touch = data[1] & 0x80;
-	int slot = input_mt_get_slot_by_key(input, data[0]);
+	bool touch;
+	int slot;
+
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: touch_input is NULL\n", __func__);
+		return;
+	}
+
+	touch = data[1] & 0x80;
+	slot = input_mt_get_slot_by_key(input, data[0]);
 
 	if (slot < 0)
 		return;
@@ -3229,6 +3244,12 @@ static void wacom_bpt3_button_msg(struct wacom_wac *wacom, unsigned char *data)
 	struct input_dev *input = wacom->pad_input;
 	struct wacom_features *features = &wacom->features;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pad_input is NULL\n", __func__);
+		return;
+	}
+
 	if (features->type == INTUOSHT || features->type == INTUOSHT2) {
 		input_report_key(input, BTN_LEFT, (data[1] & 0x02) != 0);
 		input_report_key(input, BTN_BACK, (data[1] & 0x08) != 0);
-- 
2.53.0

