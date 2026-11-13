Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547545;
	b=Il34h7RfyAMNqLsqDMGK67lObwSwfSamcjvuHqAA6YgvoCTpw999nEXFKnqN4CMcXYXK
	 R2WVCJGtEpOJ4g11ZeYW1mPj+XGXy6nYf59Xe/En1dOWsmJsbrmL4OKJdpvRS75ccBBjx
	 /duep0Kosjur8rugbjRFHPRel4B69GAg4VwNZB2r6HKCvCs2r0sKf4Cba4Auer30szzU8
	 xcDwPKMZQXTY/A6d0vTUiLe371SVxXgRCi9nMV1sY2uz08RglM2nuyF+o8CKLLuxDcHWQ
	 igBQCfl8HyetIWLvA3mEYpFBShiNeWo4OSM69kh73SygJQASsBhnzz/8H2GyhkYqpkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hc26nAXdEa9s0ljd85iZeQt/CoG3wZSNWTf75pTYhKo=;
	b=CR5+5+Rop+nWmc3ckhG92TYVV4GODgUp9pi4DDDhZW1juESKXV9Ow/a6uxG1/Yfqg+LG
	 N4rLaNZXVH7i9OENBKYB29D5E8GO2Cmelo2me33QP1CgYL71/FIfv3JXl6MQ5uBPNQHmv
	 zMvWdKmTlNMZ3ZgYOzLTkvZue/9d3a7F/XKiCl5xa+gtZFfmGDIZQo7+rTtKXc7TWpiy7
	 vKVRE3WsaJec/ZX0dZIzdswaaobpkYmRyZq5sc3URCRiiGTuSwJq/giFY7lnPRA6+q+x2
	 eZsDStzoEfr5uDGUeiGC/K0x2WS92vzD3EQFVhdfwNiQ8vtlAUGuXMg6i8w3jIGm5UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGX37Xq1;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00F606A894
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA00F606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGX37Xq1
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so162816241.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794547544; x=1795152344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hc26nAXdEa9s0ljd85iZeQt/CoG3wZSNWTf75pTYhKo=;
        b=UGX37Xq1B5mND896ZmBiiD31YFttEBfrFng2/axVOm0A99AW1tB2HuU2+66VnwdebZ
         JJUWmInL3Uc9n7/1tFdsRdHT2DwM+sx79sLrlFqBBsWuWolkPlZICq14uIIGGm+mgkpQ
         R9sgILAPPmKhjweQQUCk7TajMrLDwPCkwYbzhzxzNaX0f+1pO0oaWmbniQKHCgX3cnx5
         pPXSTZG3FDw04nwO9VqusZGLDgOT6ASMmWE7NB1YFSGlYeIHW1eeFyATc3kcm5KoXA07
         Ap4/3X68liHTQCsn7g3VD51Fh4u80w+AgUwVfxPCMps1DQFjbRKeM0BI15mismYwyG8/
         Jlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547544; x=1795152344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hc26nAXdEa9s0ljd85iZeQt/CoG3wZSNWTf75pTYhKo=;
        b=A0fnZ0r0E5G9AhYy4S0BuoatJ5GJXXOSPA394yOrSXNGbPVkO5hskorjoFjwzyHIbI
         hBAuW7LKQlozmtK9qS/ddwS1zALzZA/PXrPOuYMcVkqisap8Fip5N52lvJWVmjkbXcz5
         f0b1UMsPNDZpDCSQu163NGlZGK0+StbLOSSlbSk3v33D9Dvrb5CGbjwaQhtVvsP397pQ
         bLJA5SJW7Lxb8swCDAIFWY5wl/rNGbdy9Ym5ejyGw9NkXgyqRE66dsXKb9RhwV4iUBuM
         CQh+JY3tZ3NWgrMxwWJa53ZdVQ4wHzIuyLXymY/Zup41QlkrL1wsKtry/GoodJcGuKsS
         QeYg==
X-Forwarded-Encrypted: i=1; AL+hErFOdxLUBk8+AodaGLkPPm3Z6KAGVIqskRE8NcVUQn0xmvIgQ0GVAMwbkdOYq9Tu/TbZzmaBV+gAizL8v3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xvKVon6H0UuxQnK09x4FbU8KXC9pC2jDjOCtCTcl1+D55t1A+
	4cU+84dFt0S6se6VyRJCAuQ4cVUWR8/aNRfgkcuwX47Yi3dRU8bxlZK5
X-Gm-Gg: AYBFou0/tptgA2RQIZRiDHVvbZaHrLc2+CIi/oVOMmtL2XYPBhpNthTzIMOeN7545N4
	D0lMwX1TnrpVmwEJjNsnMNhaKabHUbwQ8O7U7obyJK0EdbWt8jViNI53AwaaOyysC6gdc6I5EL7
	NuVm6GL+q32p/2r07cdVWwKrnFfoCNJG1HikI2JGzZNlfCuTze29zaMMXojY50RbOwWAMvisGWS
	ekBtbqCC2NBEi1oBsZA0ym6UJdL+v6cuD9KKZ0zsM7HNZUuLyn8+vUmS6zaxqNFHj+w+81pD9Ax
	8mat/2+iF3JLmnGTLRrK9Z2bS7A84gMRDy+sSf3WYDBN6E8xcm2Bas33X4zmzieiJjZgS+ThDPY
	mi09sJSs3cfUTdrmBqPV36ktIVGH69TAMP6iEtb9Fk3PCX8RcWOX0XsaEX27B0pIwHcboVxP4td
	yPsuOzusW+Ol5BdZczr2+QaT+bY+LokkMPngfAKHP/yRyp9IW/0c2cWcpgt1rXPi6Xqiktb5ugz
	mYrb2oZp6TQfIzOMAOVd3VtcBpbs/gNLCYuKybiEIWStrmhSSYh36mTPHh+ZbJKXjlzLZJsb0pd
	KK0LLv6S4OdDhj8kHg==
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr255794137.37.1794547543655;
        Thu, 12 Nov 2026 21:25:43 -0800 (PST)
Received: from [192.168.0.8] ([2a09:bac5:565c:aa::11:1e5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8425d142sm880439241.5.2026.11.12.21.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:25:42 -0800 (PST)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Date: Thu, 12 Nov 2026 23:25:33 -0600
Subject: [PATCH 2/2] iio: gts-helper: fix duplicate NOTE section in struct
 iio_itime_sel_mul
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261112-iio-kernel-doc-v1-2-e382fc9a47c2@gmail.com>
References: <20261112-iio-kernel-doc-v1-0-e382fc9a47c2@gmail.com>
In-Reply-To: <20261112-iio-kernel-doc-v1-0-e382fc9a47c2@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794547535; l=1234;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=REpyrtxy5vZO221Dtg+htmXzpUSwT6gPJO/n9pSAGjE=;
 b=GSO9P+m5JPtXXPWKWzRwPML3VIgPHLZ/x48mpri8vGZ8iGFZIDjVe8WQAqsQJOo7KmiomGElR
 JPKBHs2dHlhAQrg0atZ/mLz4oFXW/+dRaCGKsSZhrFf3OIa2UY0CITt
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=

Replace the repeated 'NOTE:' prefixes in struct iio_itime_sel_mul
kernel-doc comments with plain sentences to avoid the duplicate section
name warning.

Verified with ./scripts/kernel-doc, checkpatch.pl --strict, and a W=1
build of drivers/iio/industrialio-gts-helper.o.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 include/linux/iio/iio-gts-helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/iio/iio-gts-helper.h b/include/linux/iio/iio-gts-helper.h
index 0c4b2e9fbe1e..3f07a46ddff2 100644
--- a/include/linux/iio/iio-gts-helper.h
+++ b/include/linux/iio/iio-gts-helper.h
@@ -47,9 +47,9 @@ struct iio_gain_sel_pair {
  * @time_us:	Integration time in microseconds. Time values must be positive,
  *		negative values are reserved for error handling.
  * @sel:	Selector (usually register value) used to indicate this time
- *		NOTE: Only selectors >= 0 supported.
+ *		Note that only selectors >= 0 are supported.
  * @mul:	Multiplication to the values caused by this time.
- *		NOTE: Only multipliers > 0 supported.
+ *		Note that only multipliers > 0 are supported.
  */
 struct iio_itime_sel_mul {
 	int time_us;

-- 
2.56.0

