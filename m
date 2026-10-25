Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946442;
	b=uTHBNsbZ4YoV4DhDIYNZwl2PXWrMSToEftJOzGkXr10wz7FAzRLPj06kPxa7NqDcumG3
	 UqsDriojyfXrDiJ+3Ex+uViynAy53Q7p+almMyQoggcv7G/1fQ5ggM0Lrv4Cm+9SOaBGt
	 1+6IwoQ2BvVadpSUPhL+WrTBtlIBOebcmwA8bBsJNYbM/yBi5wpWUNCK6IQKbNDoV5+3r
	 8VDIp0EmxO3nndtkib4ZmnapUOsSiUEriPdX4I6roufYG1xwdK7MKr9A29FWZab/0CyXs
	 HKtzEyvv8UfPeu+ogq0GwPXGkINXeUz7dZ0J7WUHop3PLlhcCbN3UqtXOLBGlMrrLFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xv9NAEq9hQ0540bja4x3wK9UU5VFlX1ceZODo3NuB5Q=;
	b=Oy58JGTMj7n0OhTamhsW15pZnFmbsGSAfYYubmjkQ+5P9U6WiGe2qVmBYM2/J5bP0rnb
	 qm/c8LUhS/3r7V2zVpZraRDDdiOFw1KYSHI5chTU4Vt0RQ/ym5dVNG/4WGk/jysTUkN96
	 JwDGGJyOLRHMVs0qVRZfe4OhD6ebIlKBAl0xTiSp4/HY37br5uXnRo5slgg5uSm/LCqFc
	 pu0F60/ElaCY/8EBmxHbApNaFKLMnubedjHJ7rBxRTWO29HgKpY7p4zV0FhXGGufO865T
	 V2kOWWltpOlcsjKluPcYOMn2pcnr2wZoDyuR838bNVPgiOz7V1zKeVJAFfU91tk5yWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+wAaBf4;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156E606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2156E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+wAaBf4
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-181516de561so1465981c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792946441; x=1793551241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xv9NAEq9hQ0540bja4x3wK9UU5VFlX1ceZODo3NuB5Q=;
        b=L+wAaBf4hK1NOTaPyxxY0g42upPhkjpjdeUiMZeUE+Y56EtN/LB+Zu7EteOUThkX8P
         KmzPxkAwy9Kc5ET7HoU3BnOi8xxPnp9W0aqPR4qXq2QkwKE9+YOsJVAOHkK3Dg1U2Dk6
         2+7u5PrMan60eMyn7BckCODwxqK8nMdXuZf3mKTjtX3yAApBQfa/uEnIZGLkhsbZ2do9
         baKdvqBQHc6tGtxH4dogrGf2dB5EiBU5+joNNxyXFFrjfWxIlG9bRDY/KvaITkWhf8rL
         SzwOAvZ4MhkWDXCTeg+VApOzj8+Su68djNAbV3vlJMjfyjYZscV7t9xwqFzklqhdQmRr
         HGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946441; x=1793551241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv9NAEq9hQ0540bja4x3wK9UU5VFlX1ceZODo3NuB5Q=;
        b=bX4c0pAnZHM22+9KFeZ4b0KVr4HBNAwY1BNAtE8gB2MXSGBuF1HxFrLel+HbAJg2TJ
         rqx3MWywCFM5gl2VBllrRHOLdbOgOisXULl1jh8c4Swcw5AFsyE11sfqQvtvr2wLLpid
         XTORahNKhnx8p2jjI5azwxeCaSc104dlTRATSgQlJ0VWHxVb8uQO/efSfNSlJxkOkxF4
         Og/zS8xeHR04ebraaXI18zqTbtpKT90XLqSqFdIsAxoZ+SmLusxhq74biJmD735dE2md
         mFLOZMNA1zdbAtpYclp/WY7zhXDAdV4uqljUiPjHOxF4Twsd3e5s4Ix8QoXmeGNr8WKK
         SOHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgM5ReEo/D2xi4llpCO/5xaVnbl297KTeCTwWUmeo59ARJvp/L782NACGCUzla1iUSNERcfDHrnmTsBQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkHtMpozuyZnOcTVQ0qcD/nar+TZz07I/SK7WNvP4k3f9DdfWw
	uwy6R/k5Zdcc7BL6O8yyVYwWfPGm7vpEYUxJthQPN7kooeIk+7R/JX2l
X-Gm-Gg: AYBFou2JW6VeaPc78zKtyk9LgrsnqFDm11FSNbqQwIPAFWsIqrlYRIYCZ5kvDaUwckX
	GZ4ODZAwbdV90G5RR+h1uF4sc8sNxAzgpOfoVZj/jVP11EQkqeJ7cLkzvr378cs6LWFDJYKjjov
	MsEHf3tXUndLkYGbdNTJxsqkfRcL7F1Kw8LcML27ZA78cKYBlz9j4YvftXKUmOabU/+57qdlVji
	Qa1b5M0xq9zFjGWvZ1JiK6wJxikgspePBwtiOMAH4CuXog81ES6kzywpWZpJo9D5JHE8DuOpLb3
	VkQO7cmHyyU/mW262U0VyQpHl8Era3BHjvyRuSblrjrRDQi6pqFK4lx3wVm4zaEtxZdE6uL+Ug3
	uHf+lYFCcP5pzqlTejRgCYRrFjsQ7zVdr0FZXKk8CpytRdKP5Ze6gjdIO74tMnG32b0dlxdEUvo
	DRTg3W1Q+3Fx67mx9AEgr0K/qqDuaD5766XRktTtNAsiPOVpDVowWfrmDNj/pzJn/Qa9kmxDS27
	qm/W9BzEN24S2Bzy32LtzP3rqRN1iZ9d9a0niG1eFrABRNptDksCvfjfIHpmEqaCdcuWMysF6Mc
	YTRhlbqXxd2GVaQjiINv
X-Received: by 2002:a05:7022:28d:20b0:15c:a04c:cd4f with SMTP id a92af1059eb24-1993fba292amr5562765c88.0.1792946441092;
        Sun, 25 Oct 2026 09:40:41 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaebfsm17401503c88.15.2026.10.25.09.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:40:40 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH v2] staging: fbtft: Fix line length warning
Date: Sun, 25 Oct 2026 22:10:03 +0530
Message-ID: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Hi Andy,

I have made sure that the \ (backslash) is properly aligned to the same
column as the rest of the macro. I have also taken into account your
advice and hence added a local variable for platform data.

After some thorough searching through the respective directory, I have
not found any calls for fbtft_init_dbg. This might be because it's a
helper macro that might be useful as the driver progresses.

I have also noticed that some other macros around this one have simple
style issues and if you would like, I can send another different patch
cleaning up those too.

I have also done minimal testing by using the macro once to make sure it
compiles and has no errors, if you would like, I can also run any
standalone tests for this macro.

Thanks and Regards,
	Himanshu Bakshi

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index fd7f8fc2afba..ceaa9a3906ef 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -421,12 +421,11 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)-> \
-	    display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
+#define fbtft_init_dbg(dev, format, arg...)						\
+do {											\
+	struct fbtft_platform_data *pdata = dev_get_platdata((dev));			\
+	if (unlikely(pdata && (pdata->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS)))	\
+		dev_info(dev, format, ##arg);						\
 } while (0)
 
 #define fbtft_par_dbg(level, par, format, arg...)            \
-- 
2.56.0

