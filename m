Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792822325;
	b=qrbmYD7eok7hU7rA9sPc0qHNLc7vfV+bLqCpvVKbgMy+panDqWGP0mrPVBEuh8YtOmUa
	 6ciQ8Qwxa48chVK6G5eiTbm/vDOYUVaoeXAhJ4EfPGBYJ8xw8ItGY1xZiGbJQ7djCox41
	 yQLMTG0ldF8bjXZJiQho7tWZCT6jDETPIPzYvyT8mJ1m8vUEsuN2KdfHe6MeURcuPtfE6
	 Q62zfjvzo5pggTx3dlAuiQrPJFdQ4ftDWoq33FXaFc8SD21HXCmmTNhLt9lkyg80zkdNU
	 LNUaxRrg4KkRzmnenqlU5Aw2Mx81g7LpAeufRQWLy40Idvt6RXC4/IvEn5WZ+8k2m5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792822325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ouw5OaH9gRiOHGrgEO3yzOJhHXoQ3OvGoXVUHnor6h8=;
	b=eyEf3FLwx9wN1LFpEXXIFPOkMEXor6mkvJ8ZS3xvCdf77ym3H/4K04kQpc47OLlZyDYk
	 XcDJiG+n3NCvRgg+zU0NPkUfgoMtdVMR6dbyuKT1yS+fL6h8neUeV5NCFmwcLo+nqRA4w
	 tmLuuwSk+NgAHESju8XGYu8LUT62tzoHjm2ALYpJQpN3LF8cOpI+6hpKvHsdiWHSoXETZ
	 99afyjoYB3eJHr6GLBiJA1Y/ccGp924d8RAIzBQj0m4G4j87gNuQwGrl54KcXos5dkxu2
	 RQI4y+sCMRWD2IcC8dCXZiVOixj+HV8W43vcEC2OyX65ZERp8sN8CZ+vtkaR+36anlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euWFjswy;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF6D606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF6D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euWFjswy
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e831e86ebfso9160565ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792822325; x=1793427125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ouw5OaH9gRiOHGrgEO3yzOJhHXoQ3OvGoXVUHnor6h8=;
        b=euWFjswyIBcnIxFsX9rCzrIU/H1/MSIa2OiEIxuuCrjbn9E99ohfZYiMq4rSPQdmOT
         imoj/JHinfOCS2+ZZVqngzJ5kPY3xv611A3YDq0UO7UYFOJuMAjoQC02odO7j7t4oswe
         TONaRK49qLNi55dHufnk8b0virTGEeQJ7lGFTgOAgGYsNZO1HTAXeL7pC3FzMFZNgTz1
         iI4F9pB1vj63NZNsjykV2nQcwRu9dj+tn+t+lc4M3F5b9lYt1lVXdM7P850UhGMTgU1/
         URf2YZLiKo4S807XfTVXdtDE5kUfj4ngXf/GgoQeunAKcJWYyWuh+dRQFEtJ0Zi+ApbV
         tW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792822325; x=1793427125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ouw5OaH9gRiOHGrgEO3yzOJhHXoQ3OvGoXVUHnor6h8=;
        b=FjnJZDi/FlJ9McNmp7xhzKIAXegPAGKGTU2lQBWd6qn2RdOdDt+jMg2cN1lJmFd6L/
         9C+bf/Jsb5vXJfeUy69RRnEoF9kdMGv8AjA13A2Cniwxy53TltHEPWet91A9EThiAXk9
         zqzNVbESCdZZqodr5Xcb+rfpQtvVOkYtRU63TpE0uR1kEtAJ7W6M/Eqgpvo8+TqhDx88
         1U7jD61eADNs3YajRZ+9vR1Kfea+I4fyDiObWBoYSQ9w9sm81HG+Vvz4yX0IKTsapv9O
         B1IEhtLUKNli+w7NmgwEhUhMYSHGA4wTLH5GhJmZzdS7+XGSmbw2Wv3SHd3BCh8j5A/q
         b6pQ==
X-Forwarded-Encrypted: i=1; AKwUvBykHWMnCf0Ioc99zHTqb81K45q7hzbay9akodW02vCkEU8wAjJ4L0ego6ZUEQQYlQMqSAv0D8UzlQMyPo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKkEmmMu/ilyI+69v+qWBtqJYb37cf23AbTZUYdYXZY1ejk/S/
	DiwLBZLLtr0O15UhbltVjlrZ8PjFGHk+3jWtJEx5G9GeOv6xa3uO5fhD
X-Gm-Gg: AYBFou2Dqpn/h6d+K12DXFY9NkO3C/eGj+TBeF3hBkfPhFoNDoS5Zwq/XoGZiIUBFjn
	tbueV4f7BkciaNUrbFdBpTwqQXPK9a5TsPZAjT5cKUUXPgnaUfIUa7Sek/N/5VN9IoHPPgnWopF
	ZL9TWbtTyXx0vJyCjOKLy+sqllT4BmnC4frfNrN8l9YQ38sP1OMygKAsfRzxT61Va24VTTss/RA
	9pKdt+XZ+VzL9Awd4pQ6Q35Y/zfEBy28P7Cfw++D8J17Qe2baPjuBvXCADcIVWoE+KOMYSBePSi
	h8amUYCnTGpUHEtQheca1BzZ/nR0b4Y0qEBlM5pqWQjWLl9pYjuEGzn+lxf1vfs3YgkTDCbFy8h
	KNr89De6kW2HDmb+NWO+R3IGPFoChng/rqq8osX543mfMwiNSLfeW9cwZ/HpLaidOLaDaS+LUyi
	oyvjIL+i0Ry9N9fUnegPe9DFDSS5QXL6tmEcp9HkGtjOmOMGsePcqaNPx6ezNeqBe6DCPq1u84l
	dJ2J0NZzoDCss9L4uXP8684Lbvh0XY8lg0ReEwxOAoz0ebbotKtwVE5Lz4qSpgP2hmOEHNn1XJF
	z1czbTNaFxgxosAvbWTyCYIVCszMgvDTibbV5ig0LBrudfh6Ey+ewuCjmDAIrsVcPxPD6LJhGdP
	AY3IcPDHKfNSRDjOv5F7neK0ixg8tAtb7G4OIWegRQ44Zbw==
X-Received: by 2002:a17:903:2f88:b0:2e9:4243:431d with SMTP id d9443c01a7336-2ea9c87dd9emr9133875ad.30.1792822324813;
        Fri, 23 Oct 2026 23:12:04 -0700 (PDT)
Received: from LAPTOP-VN8JNK11 ([111.223.27.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af332c3sm3153665ad.3.2026.10.23.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:12:04 -0700 (PDT)
From: Ankit Thakur <codeankit.thakur@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ankit Thakur <codeankit.thakur@gmail.com>
Subject: [PATCH 1/2] alpha: boot: fix typos in bootpz.c
Date: Sat, 24 Oct 2026 11:41:55 +0530
Message-ID: <20261024061156.1742-1-codeankit.thakur@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

Fix the misspelled macro name V_INTRD_END and the word INTRD in a comment.

Signed-off-by: Ankit Thakur <codeankit.thakur@gmail.com>
---
 arch/alpha/boot/bootpz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index c6079308e..d53801108 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -202,7 +202,7 @@ extern char _end;
 	ZERO_PGE	KSEG address of page full of zeroes, but 
 			upon entry to kernel, it can be expected
 			to hold the parameter list and possible
-			INTRD information.
+			INITRD information.
 
    These are used in the local defines below.
 */
@@ -228,7 +228,7 @@ extern char _end;
 */
 #define V_DATA_START		KERNEL_ORIGIN
 #define V_INITRD_START		(KERNEL_ORIGIN + KERNEL_Z_SIZE)
-#define V_INTRD_END		(V_INITRD_START + REAL_INITRD_SIZE)
+#define V_INITRD_END		(V_INITRD_START + REAL_INITRD_SIZE)
 #define V_DATA_END	 	V_BOOT_IMAGE_END
 
 /* KSEG addresses for the uncompressed kernel.
-- 
2.55.0.windows.3

