Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069177;
	b=OZzXt332/qUI06v7pXS+YwXRSwTZMtSZjXvbMjmYCJQeq6ONAOOHMuMymiRCzXuRGKNY
	 60vlVzkVOz0AeeaUQITHOVyWNqzurXYpqObtYqsi2QxtbMtCiANO4fIxaUdUPtPAKVwnI
	 iScQsW+q84paghIraHxaw4MIJAkf71Zu6W82F6KIvMadsl0CttSvktbi/E6DujZnRMS97
	 j6z+Uxkns0VLkar6mn+q99YTOdPEGv3e+eDYnCWucvpMApS0iKublf+uuql30UzMIw4fr
	 5+UPwQqLy45FPGJFDZjcA9jaVePIhDWa9uoiaMCKy1noFHFKKQaHVfIUY9i4F7Q7yRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGT+puAojXJ10M7d5F+nORTVc4mPik48tZJfhJIgcgQ=;
	b=SUblbqBZSaLzw/Qk1D1WSH5dEcaBYCucqQLiwu3oHbnqUDcv2VoWQSe0jAB8hjnRkLvv
	 eGI0xeq5Kf//Agf9JYkvLXQp3DrTCRuHbFiCLHxUrDNWkKsFVqdgaC12LSO+8Gehxt3Yk
	 fLdzl0+70nho51NFlqHZFlmoSraf5bvPNlfVnXIHCjn4BVFVy593VBinBvdZvdIcz3Ytm
	 fBTOrE/lJHGcsKkwEPR+eYqxZivXXZL9wjqsFtKbKvWU2MTI376A9FhrBpw+U6ouzIeW5
	 8oXVqOLykjB9aOkc8lWto97nEYD6bD7FDWwcCD7PgLJpoIq5MqLS3uGGrmvw4q67eJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tBxBQwUw;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495E2606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495E2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tBxBQwUw
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e987a2ba0cso23042705ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069177; x=1793673977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGT+puAojXJ10M7d5F+nORTVc4mPik48tZJfhJIgcgQ=;
        b=tBxBQwUw3LMOsElAatjrmzeCT/o+kwm7rU70vYpvStsNfTivQebNbB4S41E+reNAut
         vBPJYEZw9Al2tLcsK0+O8GSooRxE5X6oRt+UHy9JrVZ2d/LOkrADi8GG3ZFsP7Ne4glw
         BZoGPPf27Wg++Q+2TjK5M9XOH/uM4vXzr6gE+sDNBd+LIyxuw+n3oEQO2qegbvFb5CDr
         HU67wvjRhmgK+NlA18o5tGS8b/EwtF59eqMjNHkrumRV+iYvNvSMf5ZYxcOtPsOwbhSj
         g7MgKYiODe3DijlSrduXjNpZdKp5uVlgbF81OamBofyYH1tDfIa6AnrYoN1LuAuLHvRx
         k3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069177; x=1793673977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGT+puAojXJ10M7d5F+nORTVc4mPik48tZJfhJIgcgQ=;
        b=iRwYua2OiqBonsz2LnSkE3IW7tMCDcxSJqbiACvk7Om8sO5DHlcIEJAaOk3vIuL2Ek
         bOwSgIAqkLqI4T/Jn06uKIAiCDJjRlG0ZW4fQS1WUeB+Kq0FL1ylGa5yUVJz2YcO0VBr
         OB0G0LmRKD758OdKsyUTzqdvxMoOlRpFSCQf4UwacTWToaoB9A4LvoeUMSTjekueMT8y
         Ysq86mhsWeMCv+iw7oqeIXOhp2puWzAX5zZApLRndmI8+SbbV8gUR4jnjTsSJPRQ0eqq
         lBDdnCXlA+HJfViwuAp5p9JzksQE7YXBqGbT90oTPa2e4AO0Sn4yNnibhIOpweDVK+l7
         5CFw==
X-Forwarded-Encrypted: i=1; AKwUvBz4D4s9gb0V60y5aJZd5bolVIbbloQLHgYDOp6Cvsi0eDEpfAU/NiIl3hKjaLgwKmdg06Ej7BNDRTRnr0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxJqahFwPThonKhG3fKktDgWzyML9kIXOj9MQ3FAlOD3oPsPmd
	Q7eqih1fQnADuprUmK2mRkJaol9g02epz7wXxDJkOFs7u7yMBbwPafDb
X-Gm-Gg: AYBFou3/UuqUj2JB8BOqA1FO2Xj8MKZafvtofsbpkpduLpMsaF/Y+tDg9GSdpTWt8/I
	q/MyuTzEk2DA9Va44JuWuwPYwVzRL5DD6lGeuxJzFdCgO1zUnd+OEX8TKjxy8DtRFfEz4criOlb
	bY2ISSzmAY2E2n+uyp5dpnFjKrecOceUQa/KUMGSC+b2iQFi/K6iIsa8/qtMIY6GMdlp+N7qYeG
	TjHsqq6AzjW2m06fmLxJHOzMvVsXvbjHIZazfVuUXS8kBx3jsVouLKqMFXEwPBdbNCG677qvx5i
	UtfrRBOEu3jqa+EezoaQrI8c6ZxQ2vH7SI67fgmCOhla4CYILrJn5KBHhUhcNuThzlGt8KCsV8b
	CDJbYWiYWuCBzE+oKTT0cCqJoHr9Fwl9HDiIBwHRr2M0i5ODQNRgukorrjChQdAnnwXCd2NZRGm
	mMNxuwazDK5i0JMZRHWTxpssyQDhmeCsw7kLO2LOujG6qkKU/00AgGP94fDup1Wf2EWsbCrI2R5
	90zkiAZ/CtHRqJ8EW1vaGkyoQ2uAqOPJ7kMvAuPf15r54dLx6kyVQptnwzaIexAC34DIX/+MPFU
	02hZY4+1I5eAedyE8RIlgNcoVekI
X-Received: by 2002:a17:902:ea12:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2ea9c83f108mr69673795ad.29.1793069176577;
        Mon, 26 Oct 2026 19:46:16 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bdd5cesm2324565ad.30.2026.10.26.19.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:46:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: hi655x-pmic: fix IRQ action memory leak on removal
Date: Tue, 27 Oct 2026 10:46:08 +0800
Message-ID: <20261027024609.117371-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi655x_pmic_remove() currently removes the regmap IRQ chip before
removing the MFD child devices. regmap_del_irq_chip() disposes the
child IRQ mappings and removes their IRQ descriptors.

The hi65xx-powerkey child registers interrupt handlers using
devm_request_any_context_irq(). During child device removal, the
device-managed cleanup calls free_irq(), but the corresponding IRQ
descriptors are no longer available. As a result, the allocated
struct irqaction objects referenced by irq_desc->action are not
freed, causing a memory leak.

Remove the MFD child devices first, allowing their device-managed
IRQ handlers to be released while the IRQ mappings are still valid.
Then remove the regmap IRQ chip and its IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: eb10245fb37e ("mfd: hi655x-pmic: Add powerkey device to hi655x PMIC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/hi655x-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/hi655x-pmic.c b/drivers/mfd/hi655x-pmic.c
index 5cb392892c19..3a7ccc9d30b7 100644
--- a/drivers/mfd/hi655x-pmic.c
+++ b/drivers/mfd/hi655x-pmic.c
@@ -147,8 +147,8 @@ static void hi655x_pmic_remove(struct platform_device *pdev)
 {
 	struct hi655x_pmic *pmic = platform_get_drvdata(pdev);
 
-	regmap_del_irq_chip(gpiod_to_irq(pmic->gpio), pmic->irq_data);
 	mfd_remove_devices(&pdev->dev);
+	regmap_del_irq_chip(gpiod_to_irq(pmic->gpio), pmic->irq_data);
 }
 
 static const struct of_device_id hi655x_pmic_match[] = {
-- 
2.43.0

