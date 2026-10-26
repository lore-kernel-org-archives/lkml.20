Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006682;
	b=cS+vT42OkA3BJ5vjhHRNa7RDU7RfJtRoePu5LLvPvE6KifzJVu/5gE/rvkORx8jEEy3d
	 jdYWqFlQ+TH987SzaXMB/Wk5arQ1sIFyRqoouz5Ouhp7op+ky6+Wafbww3exw4+BWg5D4
	 Sw5jL/t7eb9a/4ocLIL3yLFj78PjoA4OfEd5xHgqbEpw4ykALHP+PqEA+DsZuyls5mPhL
	 xY+kjcshQ3gTUXOSg2MvSraihZM1ZLZwvrHsufpLxwlInBnnaFOCvJd1AGx82gqJXm1Zo
	 HJZ1v5lT96Q86xa9nN6eg69ZXS/RUitTafyNUGPWa+oIrPF5A+XWjiV6Iy1f6GhEUig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EKnTU2YcJJTvtAtaAZdLOGPL4mJYMsQRUA55KN9Oiyc=;
	b=qsgFmVR1+VpBxMRpqQ+qyNfJxjdiYq+MAPDxmQnSta2u9rZOKPggE+HSZX9Ul/heWmVm
	 J/X7pU9HAeOjpmJGxlvGneDkwlhvSB8ffmQ8EQjLNnGzDAp/4WoFeVufyimuffHREpixV
	 Jpz+JNKiZqcthm0yaci4LnXyqAP1t1acW/4IkfAyp9aIVvb2pdO8gMfejb/oFwjkG6SUx
	 65JDxo2HXhob64mejg/9QCrZRMgTX1azZ6LpyyV+BqAiDHhZbizRcCbOBQPkFuP/WCQez
	 i9Jdb7TAaLnXLOaxKunXivEeF2gsdldZYDTApcOJgpIwHObkzAaVclUzuz2RCm3aRyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qaAS420E;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92053606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92053606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qaAS420E
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-369f33df08eso2431006eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006681; x=1793611481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKnTU2YcJJTvtAtaAZdLOGPL4mJYMsQRUA55KN9Oiyc=;
        b=qaAS420EFiFTQrOs6XweruNecSqNFR3KwTo0uV+oCYPE0CKvgrzY7JAFrmQIzA+Swy
         tGD4Ge0gHZsti7q9ZEFv29luQ7f07y1Fuv6IOLCYtVdRiNefMbEjlRKeqzfkydftPqQi
         sPwSpfcmZvHAVX83jXgME0IBHiZoHnTjOiLSw0Wur/QG7DV2BFQXUCgZ5hYO0mO8soe8
         tY+y5eRE5OGTbjWeWX/gExOZJbwgpv8HDSUZff9iATCpL/ywjeFEzDDW8FeW5TxG/I/3
         fz5JrVAgcCT+BjVUEMLSqyBGpBcHhM7U31XmKVE1XXzcJ7mRCZhRTzMAp3wSPq1DypEN
         8CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006681; x=1793611481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKnTU2YcJJTvtAtaAZdLOGPL4mJYMsQRUA55KN9Oiyc=;
        b=ZlnDVn1UM4nZvA1KTOzuDhyjm56n8ehYVZu9ADoMk6vskBBqGcMvh2ZuZkGVCesbQd
         tosxFCdM+ZTVczMehmbgljmAxLCxGgI3XdmlIdswWEtScM2Ps9UkZr95/7IZvYJ0wYVP
         3csm9Kj19oMQ68xPwTDb2tVF3LlKf7iI+E0EeFWBA7TzjqJhq5LyT0qz/tXSADJdLE10
         svYMv9sfEpTSnDSo80k2bVS8WAbD3YwKxEVGcrx4h5m3D8pEglbsK18Na4WMZfpepUKh
         18iLV0VLgYXS1ug5ZrKc2bLo0b9KauWafWS5/ZNK61WQbJiF9d7tLmxXZGUEmAxndgWn
         9sgw==
X-Forwarded-Encrypted: i=1; AKwUvBwdO9uw3qLVZIAZrYGOmZpWoRh2s23mf5x2zk4K0NLvITq/wFp0QLsaBBLIMtjKaoKW80JLc+Mglo/zECg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5l+DveNrK/QkOTksfIhK3ED9Gw2+oIDrBZwVSvdcldvsqaiFY
	4cEfK47X1RJa8dzHbyzMPNtNfXKYLnFdPMwwZXIzSylyVPlhpmx1Tj5d
X-Gm-Gg: AYBFou2snYM+Gf+rQDI64HzazeluN9n2DMJagQ/koXHfPhbj3Hzc5xr3Gp9JKVzRvMq
	E6wZpljyFJb32bih1/N4XkUjz/0IhCOtPL8P/Dj4BF2Vo/65p/zrfiC5pW2aSU2f2zk7pFFg1S3
	Q7uNbCvFEcJiM5XUBafcS21CtVRZ/3XyCx3jrEmtwqE7ewxkHE7pzu27D+rCROrs6Elh57b7rE/
	FR/qjfSppH14Ihyx2YetfFmdaQ8UF1/p+D/JLn7ikg4Zjfjsjay0IkWm0Qt7OP3e5WEXjd0gEdc
	NAQx296OczX4p9QCmEBnL2L3AvLnW9zJJaTI0s4O945Yj7vkMBGMsnO9/E4o/AG6bXd9p62Om0Y
	60qZZg7XfJ9nH2Z6732i/TmBGwFMqxnzrv1lP4L5yI8yczYZ7Pax2tM5k23AkZPMcYsvs4ycJSH
	EsDBvhno0z3IltvEkTSBz+clPgdYO2H9/BZ641i3F6sQbwdRKbSr+qJVw6i3sVViIXuuMQnGySB
	mGkPKCR0HJWChqUOfWJFxKLmZd8+XJ09EOnKnW7R2XDSirzMGiOpjM4IRD4wxmiMj4vzwWro34=
X-Received: by 2002:a05:7300:fa17:b0:369:fcbb:4d4c with SMTP id 5a478bee46e88-369fcbb4e9dmr4419186eec.7.1793006680504;
        Mon, 26 Oct 2026 02:24:40 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8c576ebsm23648985eec.3.2026.10.26.02.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:24:40 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
Date: Mon, 26 Oct 2026 14:54:23 +0530
Message-ID: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
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

The fbtft_init_dbg() macro is not being used, so delete it.

Reviewed-by: Dan Carpenter error27@gmail.com

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..16459e4e0ba0 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
-} while (0)
-
 #define fbtft_par_dbg(level, par, format, arg...)            \
 do {                                                         \
 	if (unlikely((par)->debug & (level)))                    \
-- 
2.56.0

