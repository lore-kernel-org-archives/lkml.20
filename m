Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5304B95D3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729726; cv=none; b=N9KQ02kaimST5KKQ79ZV9liVECwJdeWqnypBMrLNns9MuuTP4O+4mnZi6zbi8OIpfGzprFj3UsQ24dqsXMS7YuSZKFzdPoe+qWho8wMF6qqad7VqftbwfvmMi+AKjxv0uDrgVyVPckvjX5ugcXgrW/tePvaauo3p6yoe7z6bdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729726; c=relaxed/simple;
	bh=CTynR59BziX2J50wpNmLmLXJ3GpwJvm84Os5HZU24uE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qdkohPcBst3SQwaS/K7JviRSX/eRP4LH0AuBLqyrEZnVbII8fPwRESTEwQrRtXQ7gidvEaXdtg0nvgWZ+8j++h5pZErEVxMGBL0N2hKbEo2XRarsarwBo/yAjsaBdsj3aKAQ1A0sXxeVnPcoiQCg6MEtcV2LBF+cTV/JIvHNGmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQxv37kF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQxv37kF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so3874505e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789729721; x=1790334521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZN+e+voYt5PknARoCumXWZsLFyIMao9d8Ma+Y4jDI0=;
        b=qQxv37kFE4iV+jfZ3oZiH0QSvfHFAPE84OeoueIKa6/3+zCFKPrGhTt7LClxlW8swD
         MvXMqhmCEGzbuda4RKLznI8zg/RjzqfvOmNc5lzUYkWcLUm8Esny0yuH49h6EbzDulcn
         VQ9N5v9CHjOG38vq6cjP6Q/SwsHyg6e3Hx1jZh5EeZBAKui0aTzzPXKuCPPIktt0fF8V
         apDHlyKgRXzx6r7SQfHgBlOF0jTh1jXzvjNOsg2p/GgKgJRudLx/utVlxGkYFCP8JPMG
         a1yr3eWDHtaJyj14qtfbmuLq0X5VME1sldUifY/hpjKlLgOzb4JsgLMn/CfRESqg9gI/
         aVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729721; x=1790334521;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GZN+e+voYt5PknARoCumXWZsLFyIMao9d8Ma+Y4jDI0=;
        b=NOOaLiI+vwUZ1TUMTcSz9K6QIlioH7DYrzT8MQ6rNey53DsiXOps557kOcwM4xOHh1
         WO7RY9hOgCQUg5r/cwpY1CCOCxqvas79CcAKE/Iz8fQzLISxev2zIwYnFhq3pi5Ot/tS
         dMFe+aDnwGqLlpkVNF1dqblXP6w4yJgv2yzmE9qhWo7uwaI2LICWmNXsk8NUhFepqS/G
         2QR2HKAqAJYQcmDk7f5XZ/7YJ30bdbR7RBSdwteF4Jw6P2m9mkrbXJw+WUakusS+1kOd
         0jwHplcS6+rhkYv/+NBbkMgw5e87nCDwl8Gq5M+7v14+yC1nEQ7W5uvSMidHPOpVyrJh
         d5Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwbryiq6rvCYvxzNQe8YAJKv6eCHHQC1pQJcQmamJkVdr0eilrGvZQdMWoctKVOvNaFoBibujqXY3hhjzk=@vger.kernel.org
X-Gm-Message-State: AFuF++k4z2JNwjDHBbSm5GKUtQZCeYHXlDB20ruQBCyPJwdCIPHaqUJr
	G6bQI7HL0x9dn0M48/xBzoYXMIsCTy9BVQKBgDCNq16IGY8oIddqz5+z
X-Gm-Gg: AYBFou0Y4DxINPHlVnny36PXRytxydcyJTDVUryko9Y4M5RbmLbftG5Kg5ocafy8vrR
	INMLvOxfJWiCBEncgFX4FjeEkmCeZjk43tQfPZAIwkaKv1mpGIuIu4sWqL2i63HIGNR3ZKi3Msy
	OWQHq/pPdp9NmjdQX9pm1EtxPiuHH1o3CceeMWnogONtqUrpklx08R/CqZ+KmcViPOZqIFBMFRb
	VNnyyfeBfDjUxkvmoejteRaiIy9+nIGaNCzkDv+CGXxh49QQB/m2KJhxVAIihVeDpXWk9guARgj
	LT3HsPPhN2JawYw3WGuS0m0JmBP/pDrEnHHVIokrsXOh9kAARYRFJFWgvKwFOyG5MwQunyhENly
	sx4io9TtZLXU+VfPabWzuJPqzZ43ETXVTcunG14xzja5UNzBwSORiWQvRzv7Tw1ZNaYuZo91NBF
	Bi9WTdbCQ5sqQZkHHs3K9byHuFYgPmhyGQGyAvg7n2kPHjIE9/g7dst6XOxY75cwrJTWHI8wFKy
	yXDqjYPh+0Nacumwzr7+A==
X-Received: by 2002:a05:600c:6211:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fc5735be7mr54409315e9.14.1789729721115;
        Fri, 18 Sep 2026 04:08:41 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cfd3fcsm43592295e9.10.2026.09.18.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:08:40 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_mlme_ext.c
Date: Fri, 18 Sep 2026 11:08:21 +0000
Message-ID: <20260918110821.1117935-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 11000) for more
precise short sleep. msleep() can sleep up to 20ms for values
below 20ms due to timer granularity.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e965133d9..f59302802 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5749,7 +5749,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return H2C_SUCCESS;
 
 	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
-		msleep(10);/*  10ms, ATIM(HIQ) Windows */
+		usleep_range(10000, 11000); /*  10ms, ATIM(HIQ) Windows */
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
 		spin_lock_bh(&pxmitpriv->lock);
-- 
2.43.0

