Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184230;
	b=R1OTsi5t8atXqCmemPtm4T59XWtXNtnehvJkhfh0CMusytjgARz/WhCyKjwKLnYgYGfC
	 EXITfrgg+pSRA2CXzWu8sywx9Q6rRSTVUl9kIMk8dObAu/7hkP1iYICK2WfAmHZnkz7KK
	 4qzotBUGZ8ZznpeXrdOP1jbX8WKh+22p+bNK/DEK7FobOkGmEe6sEURGuFchzNWaJw+c0
	 Aqkty37merZyJ6ejaAOuySmzBUXzA/SLZxnIgUEVn47pg3/9+zjk4lCFMvfTB3MskO0bT
	 SX/d09RJxvmLdjfRuBAq17/gvbA+8nTfrl9hHEBHPbZ8GzVcyRq5e5NDkb5jE1PbSAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pleVOwNXn94VBCleLoiQTmMQVMT8jMTIBG4OXxMneI0=;
	b=n8vTZFqw5Etk3INS3ThLabLOuhZGK9CLq+62pVK4xDwf1ZDqcxV7DsS+yVzCr9EesUrR
	 A6s+HWM6H+zOoF9h+Jxirgt8XhpAkSHMxJRBOFRJGFbrOyxuSFNRZYYpoEQiptNKXrd3F
	 KDao5hxZIPAtv58dFFnNNTkWOFOiaV1Ua355Ag5utPHjRSLr5+k7Eig2l0pFGB+eKsUnP
	 49R2aFx0XgKLootwDEje8RQ20JYLIkv21JwSsUmQyVIvv8jv/3G8poeWhp3X6vf6NMEEk
	 T1bA+0lU+zvlZ4ss7URgxLIRtpld9ts+B5RwUhqGHUOiRZDeXwDTQU7ZP+XzKklhc3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odVSz5BP;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD42606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD42606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odVSz5BP
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3edaso228387f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184228; x=1794789028; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pleVOwNXn94VBCleLoiQTmMQVMT8jMTIBG4OXxMneI0=;
        b=odVSz5BP10ZyVwpfepYxhS79aL75qmK/7WzhHCxQbQfZ0OHrFJ/n+F/ALPkaVjcq5q
         8UQ7yPxMEVJdpKEtGiyKF9HsjOgWOc02gO5x0otRiZb0F1f30TGA2RN/i3gWVBwhOjEL
         D3pI69R/OPsZ71EUHKEMJSIvYKdSOGPKHz/xuEciOgHonmeSQ0gVma/dyssOvUy+Jtka
         Kz/57EBD63y7Fa55DwWZRlX0jt5YcquFnmjLwHosut7o0gjG+DGFtkU+KucZczzk4GgS
         D6dihqe7M7YODgUpB1+h9qco69HJgLEQL7tLlnSm/77mkZMh9wWfwwNfV7WBUdEH2DlR
         on3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184228; x=1794789028;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pleVOwNXn94VBCleLoiQTmMQVMT8jMTIBG4OXxMneI0=;
        b=1460g2WcJNr/9Jn7rJMAOgP/gKmoZOZZuklNXYTatNqKsOvhZFCvwKOQbQ8o8JGFoQ
         P9bIo21KGT/RMlUpW6Ok/6YzDj7E+RU8sM8K0yVTgMDwUAiJUczHyWgEKiV8M15GW0wL
         XiY4aJ0RuozSgPhNSEkFT5dJ84lgsub0h+CAawqbKdq3dKCpfr+aVe9FFi5etANUoEa7
         JRZWgk527RD2ZwxQ8nU0Nn5gt0zrx96nHGQzaHR9Dn54Mv8mgy6+L6ki0AnKVV2h9rwu
         AXdoSc9LYkgkTdPKb1X8N0Z3VllTcTSmS3dbFg9u8x0teRMjKy0MbigTEF51kBVexOWD
         Fg2w==
X-Forwarded-Encrypted: i=1; AL+hErHx3umwxDRWbLl6PRdROpRnd2TaZqsjEYi4wC6O4kgVD7maadoDNY8X0z9w6jOIOefHOj+Qy8pQu7zWq1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vQkJCP9IycB6qw2vVCtQhnANHxw7f6mMYWY1Xe1gZN++ZgPPf
	wlgnXA1B3YVxLwNpk4qJDKqhniZB3CStgL0UbZ9NLa/8d4koIdgmSSNgYzW4xEaS4mo=
X-Gm-Gg: AYBFou3GPfGpVRIu3JSgOwJoUd6tIIfcosL4becepbMvAHHh/DF6/sy+6bkOWxigZDD
	Igaj5Rr1I9rBXHYSkWH0jMYAmEVeVo4LccQuDf2vTxShhzh17ghg8SVp71mLefK9FF/D7a8t+DR
	NUZ64EntZ7kp724tOv/Ryz4anBu/tKkktzhX0N2nPVHCpurNkvuZMeZuvQ2tLdM0+lT5Q+q749N
	mZ7g4AAE2//YYG5Rxm+nTs8ogXX1InSAKXg5SEuZ+BxjbRviMfn046DAYo7yzk+eatRuc4zPw9b
	9SpRImkuwOwtQ98ilTkDnusmqRZU9DdsjTX9OsVaDfFobCo8yv8iztDtcb/hIfDJLpOBg2gEhCq
	7i1LAhSWBRxeGV1Z5Hwh2Obsz9oj9BQ+cOFLujohEuPtNJK1oV2yTa14UK+eGDk2bP28XD5wq+I
	Rq8IbRGebwOoD9CaRRHLLacfZawBMe19F6/k6XRhH+hakqyWZtp34L0olGF0aoONYp3VERB8MCl
	0nzakkfjUPggapcLp+7bnk2Ws8ZvrUGfLMMEUZAW+YH9PgeChtrHBn/Wvfg2B4dl9TJrdMqGlQS
	QKjfaZoTt1dDZDK0XfWSgVLvMJJm5HD1f12+56m2ESKNM6uedWbwo/s3owUlBw==
X-Received: by 2002:a05:6000:240f:b0:48d:f160:efad with SMTP id ffacd0b85a97d-49425566d13mr11602673f8f.30.1794184228470;
        Sun, 08 Nov 2026 16:30:28 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b2066esm6771239f8f.52.2026.11.08.16.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:30:27 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:30:23 +0000
Subject: [PATCH] firmware: qcom: scm: Detect Gunyah by Qualcomm's
 hypervisor UID too
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
Message-Id: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB4U8WoC/yXMQQqDMBBA0avIrB1IhAbpVYqLZDLqFIw1Y0qLe
 Pem7fIt/j9AOQsrXJsDMj9FZU0Vtm2AZp8mRonV0JnOWWt63GhdUGnBqaS3n7FIxOAvPVkTx+A
 c1PKReZTX73ob/tYS7kz7dwXn+QFsJK/UdwAAAA==
X-Change-ID: 20261108-qcom-scm-gunyah-uid-ba58c10dfb66
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184225; l=2208;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=4S/1zpYisnJfX/pxx0SkcGzbyQaiPKSXVwD2VXQUq0s=;
 b=Mm2zB2MFzRRCx1WAltsIRVkefw6P8m2ZSixn5TDixFUuXPmV0pI599ipjhUvKpjcyCpkBkzHD
 S/Zr8qRntG/DsiX4qRHFDU+IVc7yDu0VMbF/WkKq0GPphh0Nm3EM6yI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

qcom_scm registers the Gunyah watchdog only when the hypervisor reports
the Gunyah UID. On the Samsung Galaxy XR (Qualcomm Halliday), Gunyah
reports Qualcomm's hypervisor UID instead, so gunyah_wdt never probes
there, and no other watchdog is available.

Accept Qualcomm's hypervisor UID too. gunyah_wdt still checks for the
watchdog: where the hypervisor reports this UID without it, the probe
returns -ENODEV.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
in the Samsung Galaxy XR. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR: gunyah_wdt binds, and the watchdog
resets a hung system.
---
 drivers/firmware/qcom/qcom_scm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..559865139c46 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2434,6 +2434,10 @@ static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
 	static const uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb,
 						    0x92, 0x65, 0xce, 0x36,
 						    0x67, 0x3d, 0x5f, 0x14);
+	/* Some Qualcomm Gunyah builds report Qualcomm's hypervisor UID */
+	static const uuid_t qc_hyp_uuid = UUID_INIT(0xbd54bd19, 0x1b57, 0x370b,
+						    0x9b, 0x60, 0x6f, 0x94,
+						    0xe6, 0x9d, 0x53, 0x54);
 	static const char * const of_wdt_compatible[] = {
 		"qcom,kpss-wdt",
 		"arm,sbsa-gwdt",
@@ -2441,7 +2445,8 @@ static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
 
 	/* Bail out if we are not running under Gunyah */
 	if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) ||
-	    !arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
+	    (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid) &&
+	     !arm_smccc_hypervisor_has_uuid(&qc_hyp_uuid)))
 		return;
 
 	/*

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-qcom-scm-gunyah-uid-ba58c10dfb66

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

