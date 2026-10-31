Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420636;
	b=rMvV9xHjqG3IFduPLMX1g3ruBIpTg5vpwxt6RQHGwNNT4BEhCoAODB1yNqhXbSgPAGP/
	 S1qc4HCKK/2zAMFb+jyRzAWeCEweQXijzOdO4BXztIqTD+WhDAO9ZhZ8igi+EOR8GQ0LD
	 4ZgTb2GXAeFnC5KD8LTorSkYqhA7wGOUA8J3tXm3tepKQ/6KhbPzBIj4lFFIbNwbMMaVs
	 GRoA3M8wiGU0Ab+mKK+IdTqNRwPKSdTNOVnsJIwHq74XWAyVsH6WhT1TbqS5n8mgC/Nyd
	 5c8FSa54J2fSCZBKdpBHoRI3YSN8d2jKBWjvNHntknaBcRFbZgBgLf40QcqoZUNgC7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oyMiLoLSdUtmLwvkMWGKLcY+WxNb77Nh3Idx5n8lKi0=;
	b=MZcR0dtUDWxpLZA2FB4FBHSrtZQ1agDt6Z4QCTYaQsTGdu3UEwn+hqwr8JBI1ckiW/R1
	 uZvLLeVjeVdiGWArq33dA2xe2lDA82+nTM32nXyoKeX2NWct2O2vV3HY/Q+GyBVln6L/+
	 7SbSqlDkTDf1U5ItNSQJv9by4SCwXUmyxuFbzrctgFMSC7f6mfUut5NFzNABf6zw3xQ90
	 SlqY2gv48hj6aBskXtzoMRWkHn8OSsPiGDMMy+Z7A2o60JmTsrCYNjtd37S7uixSrrdBb
	 hwRVyxIZqr77q/QKLqm4EFVseR/jMR2LT7ZHfinaa4cFYTGFNXQ2Smb0GkT7brodoXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSqAaJbr;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA6606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABA6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSqAaJbr
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso709758a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793420635; x=1794025435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oyMiLoLSdUtmLwvkMWGKLcY+WxNb77Nh3Idx5n8lKi0=;
        b=gSqAaJbrKK97699YAQ3syVbr4zaddIwIfQLSciJGI9nsXLgGpV8Xw886Oa72h5lOzA
         Dgd0mZTYZT/7eaJosw3cwNANjFI+A/aF+yf/Z6FZ72e1YYKmBaiBsi5ZK5CkQV4CnQtV
         7uFROqLbzdBLezncfo9PDbNmZ6b7LH3rRoCT32YaOg9SuIkarhYwZ31/RgPA0MDVr2a/
         731cHZU3oSg6kGwp5IDpLchC13hLN5eOu6UlRzYJKFM+Rn9AHlccuifKDWjwnVSr9yHa
         +pAQbo3bDj9hpQfrtrn/R9uAB7MxOIX82glEVH0SzKXMZmDraEQQii9PVNsU8zBxMQ+n
         o2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420635; x=1794025435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyMiLoLSdUtmLwvkMWGKLcY+WxNb77Nh3Idx5n8lKi0=;
        b=CXvtqaoUossGq6uQ+BN7glxt+5nZ80Y6w1od+VH2r65wsj69R0/PYhST1GaToJANgY
         6ttbFQZdTb67bhIAW6a2ZQkO+8diwWiGAsKC3oyGAEAYL09KzggyWXiWfoK7UYUt6hMn
         vso6mPxr5zXsqHl+iLQCvqN7WrRMXvJaHdT1+NUWGoXSU0ekMm06xu6/w4/RdLxjpNWP
         berbuhjnDD7gTagarCRTqQolk2eOzBRnHAvDNopBf2f+5YLOkaxYl0KEHfYXT53uW/lU
         z7/xowVLbkVtFjh3jgaW4EmZhOVHcYY5iQ7IoO1wG2eYc3MCjAylkQI85jGB6wxSdjY8
         rA/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdz9zCDBBtsh9idSvdhtbNeEvQ88HURxzKODrlcdxJ5cngq1jsBBka6xbgYwBqif3XAREgvX9Uo73iCDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkPLKs1Oa8tt6CoPgTEbS5145vF1zK92s0zmNEiMSuZEk+3sOQ
	z5WMMaqLhU+jIfg9ZteYAQWwc5q88TgerYRFnESmz1S5rB6l2LPDdDsRJ7yH5LYh
X-Gm-Gg: AYBFou1zPAkZnmL3N5D1s4XXxTU3qo7Mrcn8IHt9SMD4Y7mC6Sx+Pme3zqfgyw4Q61L
	YaYNeP5cdRIwGmMTORWmhI9M87ZF29PNIlh424PvyRsZM+TJmnaefZJzEcEsebcxeX7LixSnVja
	sH0n0udQ/fO4WhP4mGBRudZSiaTpWRxxLToXvRWEPEFdbehDnGPGYlrVKEmIJ6RcBSFZvPwcFD1
	7kuXMu+HBGmAFQwZ5aThc0w31LfLs+NT7DpDF7MT1aeXtIFXUbkRNtWf/Fk/jmQNk80s0H8Ivfz
	3T6oJhFH8zW+TlDfZYfAyT6/P62sTlw9UArBxdFON/OSwJ/LSKy9ZsV7TYodnq5po3e3CHPvjTT
	5ltNJKPSrBFhLhT0KzmfSdsOYMSpD5e3VdEjwp/dILygAIo7Is+d2QCranIBTTawC5Ug9votAzY
	67kz00C6RHkP1mX70oi1LHL9s1D2m1gmYmYw8Jp9n0tedOmFt0fEbFakqGRMlrkhOQn+IufT8o6
	jY9pXYPdWaGaBEN06i0sHr+gFyUel6hye/kRmEmOf/rEKHw0ElsXKVOMvMxqFZ+Go5YrdVjIcvx
	aTcXaoE6aa/J4RiYEiXYhySTVUxTOdPO8KruWfIlgGtrORPrm/YGxK+Wdg0qfhZdtw0=
X-Received: by 2002:a17:90b:3f84:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ae89776af6mr3372365a91.11.1793420634944;
        Fri, 30 Oct 2026 21:23:54 -0700 (PDT)
Received: from localhost.localdomain ([223.167.219.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm6344526a91.9.2026.10.30.21.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:23:54 -0700 (PDT)
From: Eric LI <eric.lee0305@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Eric LI <eric.lee0305@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fix space prohibited before that close parenthesis
Date: Sat, 31 Oct 2026 12:23:15 +0800
Message-Id: <20261031042315.1122699-1-eric.lee0305@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Clean up the following checkpatch error and warning in fbtft-bus.c.
drivers/staging/fbtft/fbtft-bus.c:14: WARNING: macros should not use a trailing semicolon
drivers/staging/fbtft/fbtft-bus.c:65: ERROR: space prohibited before that close parenthesis ')'
drivers/staging/fbtft/fbtft-bus.c:67: ERROR: space prohibited before that close parenthesis ')'

The reason of that error is the modifier argument is optional to the
macro define_fbtft_write_reg. So, even if removing the space before close
parenthesis, another error "space required after that ','" occurs.

In this fix, I change that modifier argument as optional, so that
it is both ok to use that macro with or without modifier argument.

Signed-off-by: Eric LI <eric.lee0305@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..e483ecb10938 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -11,7 +11,7 @@
  *
  *****************************************************************************/
 
-#define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
+#define define_fbtft_write_reg(func, buffer_type, data_type, modifier...)        \
 void func(struct fbtft_par *par, int len, ...)                                \
 {                                                                             \
 	va_list args;                                                         \
@@ -60,11 +60,11 @@ void func(struct fbtft_par *par, int len, ...)                                \
 out:									      \
 	va_end(args);                                                         \
 }                                                                             \
-EXPORT_SYMBOL(func);
+EXPORT_SYMBOL(func)
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
-define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8);
+define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16);
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16);
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.34.1

