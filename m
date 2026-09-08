Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A643806D0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846826; cv=none; b=stpvWuGJwE/gHf4kGxjeikKHKPrBRwy+VnSrTFWj7URs0evVBERP4ob3fTrH5zuE6ARN/raKTKwaermuhgVO5Dg/fpujbITfzMo/gHNo0HaD1hatEZfRyDpTB6Os339OgVEPgUjWSus6f3jJUE5LuAwei+rGQ1a81GlTOi8fWbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846826; c=relaxed/simple;
	bh=Jz7PTSKGJ55NnLyUAIe8domyVhPo7IY8b8In90AwBXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLN8zw29uZAcI7XxRFLdHzdQbfZ31rb2Owp/j49G9QKMUjFQq+hW8XJhnCbw6tIQ4et4L+TdmPWz9DHQQVDH4ntxIWcTbARplzJuEixuGuM08JUhTI6I9+j0AO79LUsktycm/eMHwqQSEvM18u0vYn/y9hhtkF2KrfU1U1o2XSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REm/t7Yp; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REm/t7Yp"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso4539955a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846825; x=1789451625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAY8TY9q0i8zWUjXHOr0pnr+Oz87HVu+4vQWB90u+IE=;
        b=REm/t7YpYtdFkFjpSRuG6V8ORpjLjYmftEj4XQurPT3CpkVwfxjOpWQht+bI7q1i5Y
         DO6SMQzSzRkHtQCPDxxwi940DynnPVNkQWqljEyNdkLTGR1uugfSDSfjLMdCi/w5WNuO
         PWuzr3p3pRP7vVmXx7Gs3HtXmt8MAmO66uHGiGS2r7WgYN6qGBzD8/BT/1VhdL8aXYoY
         64y8cBeYA5gPsqSv2/NIQ019RRIsrVX7rNvbBgvgGD56GhSJm+jqpFZ/mZDeFPv2580u
         idbkKdY8/Zb5H56FpN3nX4kD5eRUQhDuyCH6Xariv7hgeaFz2z57qZ2Gla8HKNhLLKhO
         Nltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846825; x=1789451625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAY8TY9q0i8zWUjXHOr0pnr+Oz87HVu+4vQWB90u+IE=;
        b=hXbrvY1+56LIFm0rp8UXCGk4FnjBuUmAxhR+SdXZ9WYJOGrrpm1YGigW3zSMKSoEta
         ICtloLlqmL8ftS3fEnSfYgoQRu4C5/s0Yq1QY7Ss82vdwGM6Da6MjdvmZyX2f3Vn5lGZ
         dPMrXXrSuUtCmIr8mdmZFJEQmvwfr/6M3rpZenU0MucvcI1NZPn4hzW4kt9Lkx501mXn
         tW/2nmRl/gCFv294Yp3DJQhYSsqiAyohZg0IT5Zb1ei9/x8EKqZHSIQVDbHGSWtU6g8i
         m//RuP7pArFpvQrOUoRNWlha6UZLb/xmHL9T4xCKZ6U1QZOhULoQUNkR79ySLj6K/7Y9
         uVBg==
X-Forwarded-Encrypted: i=1; AKwUvBw0LMsi+Y9IsKW2uWgSUDV2ja3/eSeifm0ve1x86hNBxsYyoz2Y16EGlRVKtJbAN38tss4Ue9USjnSsiBA=@vger.kernel.org
X-Gm-Message-State: AFuF++lOVkhajmLhtFYpTccdOqlxyNGYqq7v0doDRwE/hc+k/5kH3Z5x
	tywpR9Sl03qu1hegbESkiYDG3Ly285g5M5R2dMPQJYhR2GITwfZs2N4R+gsiASptJG0=
X-Gm-Gg: AYBFou3YUDDRpLqorI9JJ4DPxT7vSOnqGpDPX+hwu9saU1hAnL8YT0iC34IbOAwLKEU
	DFa7DRf7XyqtWTImkU8E0xgx3jjtPVJi0HPxi9xFOI7UH9pJw4yRcVc7Eu7V3qmv0AGLRj190uj
	FlzLx6u85Rj0dcTuEYgc93CyizoQDim3O9IecFkhAcOj1dV9Tm+hnbJ7wsRmyN0IQet7Bo511Gu
	weVK4XfXsoxf7zQDXGCU7V/nnuIrGwbGXBGN7xkU7m2KC1YsfrhY+/7vGAqfEHc/iZRmvQiIMxX
	DzUbN3IOx0w3A4wcPL1Ac+VTlnRHZv6ZhRjbkz6ZCMEHcUZANuIitEpT2+pJ2TwxeyWyWVvKX5C
	WSoJ/6Gm47g5449vi7INJ442F91ZzIVB2y7RXVd0VDba3TVyeWtUgYzi71JsH1AagXnGLgx4Rkt
	wtaKRdky7K/n5oMWeyQnsewLV2vtpDExgl/cqWnWtt1z7X5d3/960lJYkfu7r3YmK0domnPyRwm
	NwbZilBbTmcWg==
X-Received: by 2002:a17:90b:1c8b:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39b26214502mr37996095a91.19.1788846824454;
        Mon, 07 Sep 2026 22:53:44 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm32427231c88.12.2026.09.07.22.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:53:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>,
	patches@opensource.cirrus.com
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mfd: wm831x: Fix typo "convertor" in comment
Date: Tue,  8 Sep 2026 11:23:40 +0530
Message-ID: <20260908055340.22241-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "convertor" to "converter", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the MFD subsystem convention.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Changes since v2:
 - sent on its own instead of as part of a cirrus series.  Mark Brown
   asked for patches touching different subsystems not to be grouped into
   one series when there is no dependency between them.

 drivers/mfd/wm831x-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
index 744e1d161c5a..6280d4f38981 100644
--- a/drivers/mfd/wm831x-auxadc.c
+++ b/drivers/mfd/wm831x-auxadc.c
@@ -132,7 +132,7 @@ static irqreturn_t wm831x_auxadc_irq(int irq, void *irq_data)
 			1 << input, 0);
 	wm831x->auxadc_active &= ~(1 << input);
 
-	/* Turn off the entire convertor if idle */
+	/* Turn off the entire converter if idle */
 	if (!wm831x->auxadc_active)
 		wm831x_reg_write(wm831x, WM831X_AUXADC_CONTROL, 0);
 
-- 
2.48.1

