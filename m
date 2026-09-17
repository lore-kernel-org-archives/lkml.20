Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06766457E47
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679318; cv=none; b=Yt/OqgCtj6cjBUmOFlbuMRQEqijS4YhVQXR80/xfLJvF3WRAitPCXim7kiz1QOayQ9XDxdLZuu/64/r8YHGlimdcR7dsb2Winb6UvaXcMk8ILLqU9zHuH36B9rbwU6lXKlGF8PQQU03yVVVVxKw8vA/OHrWXOBsgr/HJJ94PPWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679318; c=relaxed/simple;
	bh=bzDavEoyisLgV9Dqni7EvV59qJaL7uG9lj7oSTHVBiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uYhkUAuqgpFKqSEwm2mnECngb7o0Y70p4TmtLdaJnHriQTreXN12UNXm6n/270rQ2A7z/VUTDgH+ukWrUqaxZiJmECA6pmdfTMdOtNTA+LJaEIJsCnoW/Ekxy2jsJi3SGBB10gegEpnyA/hbn1dRn+g6ME6JLfQAgRmgR6vHP/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nk9EdyU3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nk9EdyU3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so8267f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789679315; x=1790284115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdp2C4fIqt7YuChYvn7y27NtEdZt9/0KRN/uN+Dhw3k=;
        b=Nk9EdyU3AGvOCEY17NoOkvo7IhwM4YvfqBa6+ANK4frvGxAUEDrWWK7XIvam/oby4f
         6tvDzN7oHCV2rOiHVF9QWW0EAzIqBFQYiR7UBzE5kAaEwjWv73U/JqdG5S+lYrW/R4O1
         dJQJdUaYCSXnqsk/f41xnq+tiFZN+98EmIA0aSKcNzqwcY5d8WvcqA/3CDJiegQdK4gI
         DEkxBrjHr+kM314QcmYa3L6R8fTDOZhNEpU/ee29IYdhTu4hJcT76wvC0cRC4o5FZZMu
         LrKl2DSmkXDkU7YKnuzUPaYpxIwGPvGr/rN/vO3bAZIkYD3fnjOcHYkU5H8ieMtv1sUT
         VNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679315; x=1790284115;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jdp2C4fIqt7YuChYvn7y27NtEdZt9/0KRN/uN+Dhw3k=;
        b=rflOCgre+g79XyQR6Wxdsv4kUm2ttb9ekMZFmd3lSh8H3MuSikXb+iba9gUz9UYpvY
         8ZvgyLQnX5cZ4GREAGC2h/Znmtr+owKRy4jq6O/tWwDtO8uviCz1B2jpXUklVx7h6Q/C
         Fhh4WS3AkpusbXdu+38GaSUWoJdRN/7fSbl1eXxmr3SXmdVzXiT2LeFrFjOD8g/SgxCr
         a1CzbqAU/+dFqjgaazsGwHAC+CFDc6xBCJZfLNZgYBu5FXh+jNdiea4XniTVecHsgbOp
         fCX5iLlaikXZEtZoBzajpc8a2R8UvN3lBVa43Int0aWPlh4V4//x20LkLQyY74s5+j55
         0Kgg==
X-Forwarded-Encrypted: i=1; AKwUvBxj0kZQhWRWrH6SHNz7kb9SEo5+h7L3Y+3DSiV4fAo94tn6Z1oTlOyGiFRwTJnu5tUV7QERKLQFFZ9K654=@vger.kernel.org
X-Gm-Message-State: AFuF++kwBymTFyzyifY+b+O2l3LGMTn9IR+XUTNTGnykNqZTi8G10p+D
	LHtwtNSiVwop+dvKp0DVx7ZB+mtGTzD7nRQOvf4ivPmsgAXX7SV+27Ow
X-Gm-Gg: AYBFou1gmufxHxZHvIxgJah9B4XnIDOM1MPTvNJLhop0n0KqSQSdG6a2Q3GlEF5d5Kd
	Brpf8rvN/27hnM5AJLpQwPgkkCpqkWrnTlI+6Q12NQ8eFjmSkwX/VWInCUZOxvBMN1OI0Y47zcd
	uFlSsqIguFSofGawfnxzLKakV5zQHsSehsu4daTvacju2b2Xbtjs3mej5i1CBGzoiX8SVSk8TFM
	rFMl/Suhex3YbcZOUjS4WPT55Tg5cUlJ/i8foikNgnr9RYdX21Q0s0qe1jJGG3VGHjen4rO49XI
	tA6ou02ybht2nvDqQ/+G93UZctNkdqCBNBlTHscGLOHJPUAi0KKv33HGyXhq6WBHxMo/iKfteEh
	/6mRlXNVqfOlTlNI96D/OVg/dqT2vuBS5WHoeS9SvadoC5VNRc+F5VV9Z/M6kWGMa0JxciWP+Vl
	0pwljrcVG5WrE875IWvgVKtodCaOfJg/nnxcWPPPNmzumGGpVeU5YkQQm3BgJ8ejffd662DbSYj
	2+IAC4DujtunJWY+attUQ==
X-Received: by 2002:a05:6000:2382:b0:487:c76:4d12 with SMTP id ffacd0b85a97d-4871e2132c3mr232680f8f.11.1789679315024;
        Thu, 17 Sep 2026 14:08:35 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f98csm18394730f8f.11.2026.09.17.14.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:08:34 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused variable phal in rtl8723bs_init_xmit_priv()
Date: Thu, 17 Sep 2026 21:08:02 +0000
Message-ID: <20260917210802.1081830-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the unused variable 'phal' and its assignment in
rtl8723bs_init_xmit_priv(). Fixes the following compiler warning:

hal/rtl8723bs_xmit.c:528:30: warning: variable 'phal' set but not used

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d5..0441e84ea 100644
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
2.43.0

