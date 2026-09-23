Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37DA1A8F7B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125542; cv=none; b=tUqbbKxyB85ovTnlTo4OkpDGUM5DQ+Hs9umDFofY/RLExJjwow4SqIWHehRROude31BJXuohhvjO0Ty7QpB0NnshCI+MBfuyXR6tgWevhpkl036T8AUv9EyYZf5uSlwKAMv6giGqBRFpFSfk1FyNDdNRrU1YiNi9tEnR6tlgGEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125542; c=relaxed/simple;
	bh=FjFRP0jJUcVLrPO8ZhYwaG5GZ5vnnMX50LSlCW6IYhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dwjAxdMPNyQzYYOthMvXmuhjH5aJQ323hofAekYtlS1/TdbGuXBl4V7K3yp3ONJj8TP4GAaE+tMkWVuT/ytkxFzxCZDiV6VPLlz1sHimQSzIWV7X2QsjNlI3NJeVqOnyVro1fHXr+EL4i+u5ZoBdlnP0tx8U75uOYEHAM26FW5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJCbov1d; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJCbov1d"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c3304784so298034a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790125540; x=1790730340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXBcmQOVXFt2xi54w4xGq9/5w4oxNvJs4LX+noV2HQI=;
        b=oJCbov1dPX3f+b94Nuq6ANb+qkut1gK76ZNPLj7J89/VJNfciTvMIi0hHbNuTfSviR
         rn0QcxhQoSE0VSw8EjGL3WeNqygYPWvWh/R9ZGz+Kxwj6wzjYBSdT1zfPvJ58NoAmlfj
         q5f4wp57oJVQf1fF3X0cSEEuofrkNZP0z9cJCaTki8Nr1Swmc0J+W3WP/bf2kKiWkcFL
         FcDKIxs/M+ftaW9n8Cr9DPFEyFNXQWSvkLhHFS2jNzK288D5YEdt0Ee4v0cYH0MGfyDy
         oNFFUoefOOmbqdhW0UPDB2pJAmSB99YMDROy+LW8orbQ3LRFGFmMtVMJzkOBvi0FwhkO
         5Gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125540; x=1790730340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXBcmQOVXFt2xi54w4xGq9/5w4oxNvJs4LX+noV2HQI=;
        b=jpUf/+nH5J95pFvuguQ0JZXiayuI0tzvuSZUp5T0oIH1Xa7B3JLVwmPvIj0AYXHdvZ
         ka6fRVuF385kYRJV3G5Fn0sHo7sq9ErfCujX0IzFUdoZ3VCzHKlczkOr8ap49YM93BwF
         iI8+pUxQTLS8w8Z7YAgpObuTNiMXfzOn9jcumVZ5gLTwJHjYvTVrhJfO9QNoTG5UA15+
         zN22FvlBkW0DqBDtr+NvXeY9WdZfm4aXQzNPmTDcR/+hQme2660aRguCsbAyyULFNA25
         GNIsgLraij11iABT3sqIMW4PyepN7HQo+57AiPLqo055YprBDpRuVkKZlvGRXfegTVX5
         n5jA==
X-Forwarded-Encrypted: i=1; AKwUvBy8sQDLJmwrkyzv7kFAAjWDRe+clGzbwcCrLqWM37VhZwL5reizxOg330+Y/Jp0bq/ryvPhmdkfMptw7lw=@vger.kernel.org
X-Gm-Message-State: AFuF++nyskBJnmBoMLsubOo6QPJP34kNV5P0bxUCX6Y01WWp7dkXwc0v
	w7gMmkx+QLpks7ZgbKzrRaWLfBQ8F+u+Jv2mgFsU4qE/A5bHvOwbhjg5FSZmEQ==
X-Gm-Gg: AYBFou1pep/H2hnmmkvs53h4mRRfn4avcj8SXmu+4MylUKpGSWAwzbllueGRXoaJ3uX
	LydLbZwoNZyt+TYnIs+KmxYWKHfhM0Z4KSP+HX/wAXpqovg2vmG/AJ+lmpYLmlTBFEJ6+cnl1ok
	UzPOG7+PlHJsW1PolkZXAT1GQ13Ak/tEOnp5C6gnkFK5DbLNhyGrAU/ubMwKIjWbk1DIX/TOMzN
	r28ThGkF7InuethNAi70by/PyP4ELA46s7EnOtxDPMX5I0wTVv/jGLLd9zl8h8l+xxMJYcQFH7e
	+iXPfYxJl1l7GD5s9O3c/BIJllsEov3Dtn1eOu8bKEAf0RxJUmowrowlhVgjITg2Y3ITClRKWOQ
	WnD+WE7U2cRVAZRfvlutjh5I/+ZSycidhCVaqD5Nx1s63dBBC9I75yzW3NLvYoFPVii9xDzperr
	EYWyp/1We1AbrVuobEGQFB4MiWAUaYqWDx5GeoAJC0NecE5AtYUPNKaNqjgn1CDTb/
X-Received: by 2002:a17:90a:d64f:b0:3a0:7d88:c2ac with SMTP id 98e67ed59e1d1-3a07e65d0bemr822610a91.18.1790125540223;
        Tue, 22 Sep 2026 18:05:40 -0700 (PDT)
Received: from linux ([205.237.104.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0812a1eb2sm336539a91.4.2026.09.22.18.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:05:39 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused variable 'phal'
Date: Wed, 23 Sep 2026 03:04:23 +0200
Message-ID: <20260923010423.6352-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phal is assigned but never used in rtl8723bs_init_xmit_priv(),
which triggers a -Wunused-but-set-variable warning with W=1.
Remove the unused variable and its assignment.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e..0441e84ea87d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
 
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
-- 
2.55.0

