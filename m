Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406386;
	b=MH6EwX7ulCBkEN0KP4uD5t6ySpIOEyPGhs1q9X2sHVnBz7AXxcY25tQL2RFimIABaxJK
	 Ge3TCWTPQ0NbToUuvYLk659qhs64fsjVHqjHueeaG6nCw+N64as8tu1qV6HuPElLOQL8E
	 sy2/s8QhxyE7L0kHHXDLZIdyhwlAmqHqy38BFv7O89fggfK3cQqk6UtGveQ+QKtTNFDNL
	 dV+AKpWpewWrhZlyOlZY5AR6Py11qrEoDWi34PUK1uA9N+qf2BVo6vhOouyI4bnXA0CkA
	 7r9SsJloniWHP407rVtCUwhktCGtjelE+RKAJPmaTElDUPEA/SWvCEwGSuyx/3fZdyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G+pbc/fHfWz6bvXTAuuM9dleXjCvd6l2HIlBAADBKB4=;
	b=ov5woKumA7AfEodAqFpXbCO/mGpQzSig69otuaydl6r9MXJTEd9fnbNMRUpTHrtnhHa2
	 OZrKsbjnyzCOkckxQcQeDp5Yglu3AX+n2y3GW0zb2Gj21XdmUgYqXJyBfM0+OipaLA+cO
	 bEDX8OV+ZHdsWIpeWOsyW+GIryXMZA8sMMNw6nm2unamWqc9w4BL8GYspvf0IB1UhnV03
	 7pQ6H/d49ZSsFgqydxLLifWzD/QkexdoheAQ2W8erKMJWFmK6vtLfy7RPJxKgrlE47jCC
	 9ynikmIimfk6e+3mxHduEcXeTvItDyBV9sOEhWyjzQO8JXsasYY9Y31+qBeLq3hd0qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2t29f+2;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B93A606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B93A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2t29f+2
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1630398a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406385; x=1795011185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+pbc/fHfWz6bvXTAuuM9dleXjCvd6l2HIlBAADBKB4=;
        b=E2t29f+2UNRSurIt3r3KnMKweMNtc6wjlB5qIKuO48FK51ZX2D1F6HjWnr4wm9+Eiq
         aU2/DNZ3x70FqeN6OcR1naR3F/IUS/JXqS3eT1XHVhauv+/HyIVE5be28ZeBc3MfJYd2
         Vw5pI/WN0UKhFxj8RPJAvoNm1YSEIlnXbTjlNYDk3KHqpMbwymNPd318azNAw3i4eYiy
         l9LDBcGxfl2gKfwik0LAc1Jc9572qG0BelSopKyoX1Rt+ikGcEKI4q18m9S00xraqLCA
         XRh/Ahu4YKLuD51pZ1kSy03oLBDC/j4OoVIAuULSSbCJRT75EoauC7/ULFLm0NXy0Ytd
         PMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406385; x=1795011185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+pbc/fHfWz6bvXTAuuM9dleXjCvd6l2HIlBAADBKB4=;
        b=fd0r3V1LtXeOUAl/HRkK6RTZ8GLkTK9kdW7zlJoMO4O0mUlJg+1ZgU5cmv8SCVZsRL
         CPgz4+YeRyGg7rEOYm0d7MVnJKRCrmIz9uaitm+yYn3wUiSCRHmOCjcsKSSaWekZo7xJ
         QqfZpjnfnfL/eahOV9ukJpFGVFzc9ky3WNiQGSCmFmeD5dvhrHLaT6fPmp7nziHFW73Q
         uxoeP3yjRIP0nxKLPDDCeOujUEeY34/GmZBgKdSU4HjVIUAiMb70Du4pCYYRVmeJC9Bz
         sLeheAs4crI+sUMvY3lMot/kRUKMXILEKPpTYBKMSasyXTmmcP/UdnxdVYJrRhJAYnCp
         6HEA==
X-Forwarded-Encrypted: i=1; AL+hErEPwirZDQPsQ5aMdiFDlq2GEUugyrPx62EQL/qm/XCj48mPyVznjno0D48I2KU3mQ1yIN+ccao6tvz43Gg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aise0c9GaJWasTWgaHG2iT2YZlZpBDPZQgEsaEZH8vusE1iOd
	JGQ++Bb0RtoBShp62uxcB3KRkwHK8JqbwGzjoRI0sukBI4TSQTn3Rpn/
X-Gm-Gg: AYBFou2gV8Sko26nuA6ZIJR2r0bugAwxHEk4P76SrU/T7lQMuVAcR6tprQi+4L0rUVM
	/yb8l7SHN62eMVosR3E3skRqmvfjKqwBTnJ25qpxmuW+Hl6Ap4B4ZyI4QzWNiCkJG4Kd/BOq8JY
	UW6QuRsL8OiXGbbyH5CF3JCcVXylz/XI9xV6QjdMgAxhj3jAwkotDfy++BTWwOkV8H/SeoV3oWP
	tYlz3bMs4/HYOz3hmpcApKiTufRcwZ7+ffSIUF6nzY2wLXo53qLKRpQaIwBAwRuOcnLYbJmM2/B
	NdkGs9c/C8vmU+sQEo9IlN6uV3/qhBOiS3x+RdwJz8xJ+OngoTf9mvJ17T4GM3RPVG6yMbO8070
	cmb0HVx91Iys3+2JZZ6/Zoi1MgVQ1gpcGXiY2uqVJO+k+xJg1jfd3ftWwgPxwr2Di+WNyWpXsEV
	wR2nCFGuFx2zOnHkgKTPUb0aob/go7ABwpoiQQYN4GRIY5Bl9Sn7zJ6KQ03xn85edV19Wb8B92E
	/SwfFsee3TDWvHK5Lr0S/sCjRfSsNDqvecwJUIAFo3eBEMqx8JGMYoddhQAaPaYXer0li8/i8RO
	FA/ipDifIwW9ulk/aMLiqE1B
X-Received: by 2002:a17:90b:57cb:b0:3ac:7872:d1b7 with SMTP id 98e67ed59e1d1-3b182eec0f1mr2432639a91.32.1794406385217;
        Wed, 11 Nov 2026 06:13:05 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:02 -0800 (PST)
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
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v16 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Wed, 11 Nov 2026 22:12:21 +0800
Message-ID: <20261111141226.9482-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111141226.9482-1-qby140326@gmail.com>
References: <20261111141226.9482-1-qby140326@gmail.com>
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
index 981eb3fdbef4..b3307cbb60c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23698,6 +23698,13 @@ L:	platform-driver-x86@vger.kernel.org
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

