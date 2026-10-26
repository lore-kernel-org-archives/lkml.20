Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009405;
	b=tM0eNFJw3ipBoJU50tS5gEdsayW1Hxb5ivoGP+b+N5LA79QwvFklozKspNr59mzadZMM
	 xPVw5saoi2pRH2cjLSTVNo0UfZjvt7XAroyGrGTrDbHtGz0BRgdLudDOcrHvTjjbcCiae
	 70x9+bY9KIocr2KAW5SJnQIIfhkZzl9qpjwABElmErXRwiX/80/Bl6CRP/7I6mkdsOhoy
	 3AteFIV1iv6pbM9CNBdyseT45dm/P7Rkzjt1G4LFoBIVCwnJyb1TBQwJF6+QHmp7F4PLI
	 cXapo65ebs2iwkOdZ/xUhUBNQ1YjgoarYWDZIF2Fo0QgEAO66VYzNvzMV8GxyXFYMhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
	b=bpbYvzyNHW5isZfSbw0vDjeenOsdSHXNj3Rc3pZAW1Te7TJ/oKlX0eqlYGcTcUY23aZY
	 tCVcGoHN/C63m3dG0Fii23xTsbcEesUwZnPjlOjp53vBN0ZCegkIctvhaHBx2WlZ0//BV
	 T0DF6nbXszQyoTFcWZ4Onee6Sg3Kwihm3m/GF5vrVWNJ8+OiYbH/xDQYUTSRJMIpkUMJ2
	 aku+NUbUCjRb5ZzH3H4LAjLEYjgtuZbKCKx4odFRLtJBS1y+5M8aF1FeRmMq8vJ+mK9H9
	 /9J6tEEOhLKtxMLshwAuilTN7La3hsEogUQJPNQNrwtUQt5d4mHvKUfCMyCGUoKLKPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AGBI+n4F;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3D606A336
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF3D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AGBI+n4F
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2633691a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009405; x=1793614205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=AGBI+n4FyqI0e7H1JI/OtOzxEDk30NE3utwQKNq4PfOTBiNpsUBjLSH8w7FDC/1pcm
         KwGM4CGOg8iyFFxYRGkoGecNUUkb3H3xVAr9POcBH0/Z1GEnSUHfd7tBJPqSqwNX08Jo
         3GlRU8wgDKCOZj1xWmDf6JKVJJSo6VPK5hxEkrptyM0Lpe12oT2BtdN7X7paG7UUAeBC
         PcAxRbbbAR9YcpmOdKPdlSlEAaYWJvHHoGqOqHv45YdDgnBNl9jUHuXwmhorUogoaw2B
         lmQ9yxqVJnQLQsMhWVEVNjWrI+wMatfd9HhitX3c057FmJmkkZcmYSkTeQZ4jPoWB+Sl
         KqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009405; x=1793614205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=yCDOL4doe9dYKBOIVBsuOPO4uE/aER1cQM/d8lK2M7urisX+tBJD54tQljB9m+T8mQ
         FRV4R/VOI6ndSgskkwLw1untIXwURxfSoQaPTR5fvRF7AEuwBzBPNa2+ftj2xpOsDH8j
         R1JNmxoM5eR2IrgoVolWHMe6qxe5dKtBj4n9Tq2jOQQ6KTLQY7vuUYm3T1K0XQfF76i1
         /dCNXSqpiqZg1sVCwOthTrzQVEsb3V7lK3Fdwn12SHwuCkvHrPdjYF1D+GXEY/XwQxNT
         h3rHWur1PidT4yGDUNg8DJn2mEZOlWr/yxYT/Iokeiw9TNcjT7ONB2xripeBQSue69VK
         J5vw==
X-Forwarded-Encrypted: i=1; AKwUvByQaa/YCRK0eJOlvwCsSM6g4YCuSZzpMJ/jwQgkMXss/fpqwxtISIZHnfb5Jp8sjuwc2DKO6iqTii0JaBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP47bmNoA3+K4xJ7QAcylv9G82hna/NkqNyJ8FkdzXJBmcnyz4
	+/XpLdvxpEzK+Oe6ld2UQlTdPgjNM8rJpk/8h06nBroj+9oWpy7gjhdj
X-Gm-Gg: AYBFou2Y5oyJZqWMO4qNgWM4qwLLQ/bmNN96e3vaDplKVXHArMDzqJ93Qbv/K5BG0R6
	9YJZhsHqH04JDvV5e7VloAD0NTwCoC0A3bTADWgRmubDvrdUuvh74qvYlLt5vNlcv4w343/4pZO
	O3d/pmMowVz5kO/e+E3WbKmbUnrGE1ybfhlcvCvXtptVqUTrrsTsEEzyX5L2+13OA+ZqBNLeOMu
	BVxofLA8HJ5Ng+3H0XG6B96e9Det5GuhDTo5f83XfHWNjrH5d1LUzJrjwq/la7bDtqMQiEZzgmX
	7hx2t4O0GdOWPrfzXcP0CTAGg5BkH1z/v2D+lhZw+dUfMHPdyaZNa/EeD1BSOT3yLwFbyAX3hU/
	vaGMKSa/gcB7RzRtpRJ79zONeKFzaUoM1zdWJFm2akqYgozN/S7ZdvtDDBjBaRLihcYZcecW1QR
	791EVKL3yEpD2Wjhm771ggmzGgDYX2kz4wBB+uxcunkDYY6Rcxd2tDjYoclFYW5KWBfJJ3FgIHJ
	YJ8E6+nzhT+h4zZK6ahRQAEkB3V5HIwARzZrw==
X-Received: by 2002:a17:90b:3f4c:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3adeae7b904mr5397160a91.44.1793009404767;
        Mon, 26 Oct 2026 03:10:04 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1e52f3sm14586065ad.67.2026.10.26.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:04 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Mon, 26 Oct 2026 18:09:22 +0800
Message-ID: <20261026100927.217643-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026100927.217643-1-qby140326@gmail.com>
References: <20261026100927.217643-1-qby140326@gmail.com>
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

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 508912fb4e54..250c471e674d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23044,6 +23044,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.56.0

