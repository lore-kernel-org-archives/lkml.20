Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A30D47B41C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519206; cv=none; b=e+A6gAUT0ZMtCZXSB9fLNfBWxg22piiFusZL3w7FxxfvDnAbtnI/dwj0FAuY5rw+aC9yJZY6UMHAphkcLZ7NLbsD2hC/FNCa+keKiglFIkcXR2kL9HTUCepYUwBvqnxjnFcwOwZt7F/eq5ItxwKGpNu+6WOJfIiGNJDr/SPfhE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519206; c=relaxed/simple;
	bh=Uo0nJNWyQeugzeZ71OV+2aOLYFmZFM+SLpYSMzCZIWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+jWVasY6ajoqde0TGmzLWhiETG7YUdVuI6JPAVo//zz5Gagnartu6OQuZHzivZnPrJnnyYdUSP1t/1Nydz6bLfQrTtXUICH0fVKZ5zQHn1wO/nBCRRyhCoXN69VoGzkrFqrBsJPVwvdvtUFjByQvhj89wvS6seiCjt2ltFYXi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bapG/pt6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bapG/pt6"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbee846deecso1247783a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519199; x=1789123999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpIP2MYSsGgQmoU6USafOMMVUmfThh8Xiz9qk2fLfyA=;
        b=bapG/pt6JLaGyer+ME3IOo4ak5/hS3tmHIAYg99AFRmeN5r1gQGQb2c3Wo9G4ksCVU
         1kwA0/G07x/wswDM2/sSwiWiUnSwNGG6z7YK14FQqZ95COFCytCHuVQMJRocsiWwsYdt
         Da2diZ2UfCYg3q0JJX43+GFhMCMF2JT329uYxZrU12dkoC0pOcaTayeafujInulmFJdZ
         XplPNc7RCiccSSZumVS+yu4w8sykXOcVU9KF1jsiOYtUWv1u3rFtSjNj6M+g30vQ5FaE
         6CEQ/TEs9/JWfIg7Ybr6jfTx6GFwHBmOk6IwswyziNVe3hCwAI3Ji3ygg87GQO8czX+d
         0a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519199; x=1789123999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpIP2MYSsGgQmoU6USafOMMVUmfThh8Xiz9qk2fLfyA=;
        b=T/SDy92izRZhXJUaFCIAJMmgwYnpsKYLLCs1iV63ZhHRCG9HHzUNx/BIzCvZXaz+f3
         ckHMWlQIBjxFB2iRN3eS9ZAnu85Fm6m53rNEd6IuFRdDxfKeIMIjdfbIoyzHhh/4Xozm
         ykEBO1/oEI8uViB0QX+8w3BRWLQA0NAIuWTKwuIZ5Grzog4ijJtYwZqhF1DIfFRS0kp9
         4C0to2ViPY15Cbce1IbSXaNUmICoPME7EyIK4MgHAim0Lwzg+B50OG2kn/T+BVAtHSzp
         Di1yVII7ZCeGmL4vv1ig15TL+wdwQrA7TJBwjxXqKva/Yq78l4HUQSPhO3Kf2IQkfJkn
         +k8Q==
X-Gm-Message-State: AFuF++l/5EsnL5tduwBvoWTohHfwgWVt5ML9YlRNO4nLMtkl1zz7tsEc
	J9bdHRLt8+iXUd2G2KZKUsYSGUgy1fDtFz8jVUpEvWWlLDbsnxCRVGAh
X-Gm-Gg: AYBFou3MEcbSLrBJ0gdeqMH6alF92ytzbN4e5pp+HjfoS4rl8eDAifqUFRUTAF7ULtx
	upBpvgKVIGrNjEwukU5M5jZbqwM92Uf2z9STg8Mxl6VlhPUKxJsBzu71JPLR0yRPU690/k1XVZt
	cMqm7i5GdOp3u/erp88X1uubi2U8qG9gZX3lNXNup6lxMh5rBlS3diJ0LhjWcOPUmDe3HyQH//K
	PVXuzOdN/LZBYGck4LVD5ERH9hk5Ai55RDGPhRvENGoaSImC7NTwPOdZa3prl/6OhGeyoabRC5B
	MKRsVM5+x5xZKcj5Kmx5/vHwwiVjlRQQuatcJUnRO8Egdmq0o4N1acIhp2juEBqdzNViinp3wpf
	FqVYsLmNDCMGttMzubwrxuKCrbqGiQWdFu3beMRhQFQaWWFdI5GRXr/EHGpQDp06+C/XwhES99g
	3wz4Ng85jE6t2ANhg3p+QQnY2S61R6uRW8efX9vlI2dTRkO8iSIXJIP6Z689XNm2i3WY4A+VOhx
	FfAe6Fcs+1zMx5s219wNrnAmw==
X-Received: by 2002:a05:6a21:3204:b0:3c3:bbe6:95c7 with SMTP id adf61e73a8af0-3da3a0a910amr8553364637.17.1788519199395;
        Fri, 04 Sep 2026 03:53:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm8624311eec.16.2026.09.04.03.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:53:18 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath9k: fix typo "upto" in comments
Date: Fri,  4 Sep 2026 16:23:12 +0530
Message-ID: <20260904105313.33238-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 0d6272ac0dac..af92bb25f74b 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -1826,8 +1826,8 @@ struct base_eep_header *ath9k_htc_get_eeprom_base(struct ath9k_htc_priv *priv)
 	struct base_eep_header *pBase = NULL;
 	/*
 	 * This can be done since all the 3 EEPROM families have the
-	 * same base header upto a certain point, and we are interested in
-	 * the data only upto that point.
+	 * same base header up to a certain point, and we are interested in
+	 * the data only up to that point.
 	 */
 
 	if (AR_SREV_9271(priv->ah))
-- 
2.48.1

