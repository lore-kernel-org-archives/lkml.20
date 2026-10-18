Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC13AB289
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320400; cv=none; b=qZMH5RxGEeDEahCiXsOTy5ZGdgYPJafRErDVGiF+eCiM+rV1ehA6aNYdZOsL5W5EpoxYF9CAEXdYBOKU1GMSztf4oH60HfKvDx1OeqGEK9Vim4f9PAivXyQy+Tl8t+XP5oO7n9GGF5M4kxMcfSXJJ3PG4DJqwaBAnuMceF/1oEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320400; c=relaxed/simple;
	bh=/9jJroci2U2W/cLGUUAnMj5rSdaDkUk8alpovYx9b1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvbM2B1gpBgnMF87TMuIdoqSxRmDoo4cNYH+gLp8CZYWDV8EwRCCqyd4G3Tv/x12XWGrvFPGKw0q5JnhPb7sBPIgqJphyULbX1WOY4yyienmdwrktWJ4NDxL9dEpE32VOPJfDYCkL4ZBSHBiSqYRydoJP4oBJu658bx32nrTUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSGOfGgW; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSGOfGgW"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso820292a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320398; x=1792925198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTvdBTA1ASG/CLsQcCPNTtAezqD6MV1QwMPamzS3K+8=;
        b=qSGOfGgWrX6cpb7sKnahvisOstsNgVnUD8wjDv1vX57LGeatjcbNhmleYUXQkxlYBc
         sVcfNNTU5uLzw6D1gH8oGLzMI61RNEYQWzFUYUwuUFmbzWn0znvY10Pl6DuRNmRb9i2x
         9EdQ0To7n4OmXtpfe9n7rWupdCBXvFZbR1jGhUbjXe2v4rZYTBS+4cY8fsPdRL0MQzKm
         C/a+J2fhOOsM5OikGUDrkI2vdsy4/RqEiUBbmnHEOnRLBdojlDwkIYzFdG0PLoXvJFeh
         CdJ8gW7Q2yQElBRzXQ9PMEfgCYENhLksyL5iw7Qz+UiSrpkEixUrZS7ereYrGoDxa/hn
         N5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320398; x=1792925198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTvdBTA1ASG/CLsQcCPNTtAezqD6MV1QwMPamzS3K+8=;
        b=zDXnzZis3INXonQ0gupU8j/h4Fjur0C0AKrswDUPriYCkNLzjT9pMqth2ePNH1GGJ+
         zV1PDdOmf5amqd5sR3+yNdV/k+ro6Ul/EeL+764VkZ1AqLwaUGLr1cuK8+jeirYfwD/y
         478yuMVGk9+xpnqyaEIjrhrAxoaMFRh8Dbbp/Qzu7ObL73v/HXJ8ug0JvjeYxtqADJng
         Odu4IEAtZbEGYBGDOdPYfXC5dWSYkGVckV37wGJrww2cGkaUbQlfPef8xlfBwLQ4JOsk
         nI8tmH27ZCyl7nJqk/DREkVD3XICA0b4ayQMZ+6FDUnScbJ+xCvPM1loQknC1xgW2nsc
         NQyw==
X-Forwarded-Encrypted: i=1; AKwUvBwckC0KWcJQCVpM1pAVVfywAN7tJpJwsMT1Mwko7/i+avc8b5uiLk3grGjgxU+Wae3PsJBVXwmhhMdTb5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6NFC5sGOH1UHTjIFrjLKo3TrrXNmH6gm+A8GHi3lhGNaG37a4
	qp+VGT5LPzj3C8St4oyZjDTcLa0dvyxLpcnB2zz8LsEv0V1dbQ5wpcZ5KhZYq+hQ
X-Gm-Gg: AYBFou090NZ/Nq3zwA3kVAOE7fJBeaebXS7bpKe1vy/FcuN/wrVuPe8KPoPcM59n+aJ
	UAfxRdLkz2kS8hDUXG0m128EWA+sqNrhPfe9lR4JNZCV13XuO6ciss9+pq1IL5h9MV5vOQGM3y+
	1wUk/qbc6+6U8MT/kFdhpr+uynyoxhESEkJpaCApPt/J7emD3Q+Fes3ksfmnovBPQXWOQHIDcmQ
	LFJaWwaA8i5Y2Q3es4/r0+zEvMih3X9Fqi0+NsBeZ8LYWopzOW28uI78WkxYiAMo2rpsxApf8bl
	MqSv98aekKfp9QPiqEQXbvxRW4Mhao7oP8v6LEN2UJ/k10V1EWO9SIWv+9Lmu+UhSKTFzN/cGjZ
	JOl1L4lhIy8zRpVD6E0LA+T1UY5+4Pangjtmcmbc9q4lLY/skohZfZnMw6hdIa8ROVnW7i7v4EE
	bxc+Voe7C9v2dC2s85sEPDclouDxLKnO2ZGEEdcSR96IW0h+EF65h9t/VTwPokPEiopcjQiXi/O
	EfkoQHx+T3BGbXzyAAiOgsmyCbedwAbGQ==
X-Received: by 2002:a17:90b:5825:b0:3ac:7c52:faf6 with SMTP id 98e67ed59e1d1-3acee2963bdmr3584156a91.1.1792320398213;
        Sun, 18 Oct 2026 03:46:38 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a33681sm2949085a12.29.2026.10.18.03.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:46:37 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	jinmo44.yang@gmail.com,
	"Claude Opus 4.6" <noreply@anthropic.com>
Subject: [PATCH v2 5/5] HID: wacom: add NULL input guards to Bamboo touch/button handlers
Date: Sun, 18 Oct 2026 19:46:17 +0900
Message-ID: <20261018104617.743771-6-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018104617.743771-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018104617.743771-1-jinmo44.yang@gmail.com>
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
index 12a632ee1cbf..21c2504a085a 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -3148,6 +3148,12 @@ static int wacom_bpt_touch(struct wacom_wac *wacom)
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
@@ -3182,8 +3188,17 @@ static void wacom_bpt3_touch_msg(struct wacom_wac *wacom, unsigned char *data)
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
@@ -3226,6 +3241,12 @@ static void wacom_bpt3_button_msg(struct wacom_wac *wacom, unsigned char *data)
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

