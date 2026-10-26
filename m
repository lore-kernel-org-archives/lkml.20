Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008860;
	b=uMJng33DdW3Rq+5x/hu2UG81PmkZDQr7IiPn245VuBnTerMPJOuYALVZr5u27MpnhVq6
	 UwUw+65nkyw1ydki+IhRNpx6gPmVD3yUNQABdJiurg24/lrF0nx1ylPB8mL/ihesOjvgt
	 mgwX+Qakq3EDWPBENw4S1WeCSJP9xHq6tVFznFxtXTt8ZL8YKhOURc/Rz9mBU3W9IXrdI
	 bVQ4lB/PGSlYkuz6my1Vy8wfuRQnO+qRwzg9oaFb1NlYpe7mYWZlXoV3P9NULHH8spAHe
	 MeqpR/8TFuyHnGYevJ5u3Q+bFO+a84eqw9UUvVrqjRPLaIvAkLjlEJsi9V3lpNGeXIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yUNue8RqNAG3xbvxKJkiWvhSC7sssvJxNpD4oMJGghY=;
	b=Dg+3ktHj5JZNyxw/E7B3tJqhVKLaNrVJkgtqFRcrZV/5wQDELfFX4YXArlSdNtwc0jlx
	 6pAZCAkYOAyTuPsD7qLToMXOvfocVtECkn+z7FgYFZ0n6MtFQ1d9xvrEtD7xGAw56Ev5R
	 TFBAq3z5ODYZTBAiZeykqqm6x/LZlo48mU4wommJE/GkGQx0BJlTxbDYv3BiTELVB1x2A
	 54ENbCTF1mZ9i3R2NPY+NK/j1yp+xHn48HGx5wpDuPY8hB8VActWgFtAkIoLLZ1wKDUIl
	 fnAKj5PfHcquqW0VszPIIx5ZRov43/gu/zPuOEWXlr+YVtqkSyL6pmPfyqLMvO9PCpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="O/1e9Whu";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C650606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C650606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O/1e9Whu
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-156cbe59524so1910159c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008858; x=1793613658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUNue8RqNAG3xbvxKJkiWvhSC7sssvJxNpD4oMJGghY=;
        b=O/1e9WhuRj5MV0MSVJ/fCJ+d2Csw/EvdUVILQtiqBCNrVw2OXmB71KQukWHsM+3SBc
         gVTl0OaIEBRElvVZbt22X9R2lExgCsH70Eepn4lJuXgVwHRPRMxr81DMRS9DysV+oiFQ
         Vku5nnGFOdI8I0Hk4vt22aMqA74ehwiShxq63/eKYphx3BPxJPP3kh0m4BUA4BT/t/ud
         Vf2Frefo06rVKqEPy8J25uzpAk0ECeDhnfAxcAmsZnO++g7K2MEgTKTwqAXl4rt7/qOM
         9C8htxP1+mOll8ttMad2MWAMLSts/UmjHkgNqW1bOTe27d+XGb/HjYS029Qh13dkGMLZ
         KAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008858; x=1793613658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUNue8RqNAG3xbvxKJkiWvhSC7sssvJxNpD4oMJGghY=;
        b=U88+9kugyF+TUZznXNdkwL2NAiYXeP3tHdYJx5yRVzbVk0uuIs8DbOJZYj+aGt/JO3
         bO5RxZLKKHGCuqXCCRodj29I43ObfxsXHclGucZkitf0q+RWhDdrNbUUqN+9Ufb5tlY7
         sjJb2wqqIpFqg0qYm0XnAy1uFdGg2kwrM1DfFkQuHnDdQu6ygiBhd/1PNmWrm6ZF/dO8
         MqnX4P5CfAb97N28Uk1sfwPzKB7mh8T+k2ZqEm2B4afFdXiHuO8yrAd1R1P+VqfTflqL
         Gl9hMrxKVhIkMm5vvO/wi+ZhNt3N9kyD8VUiECN16QRFYIlHYPvgvCCXxqvgi5tH+/Bw
         iuOQ==
X-Forwarded-Encrypted: i=1; AKwUvBygGbzTP7CUc34kd/HGU+GWyqqpsAUMOn7HbvkrsJgspU+v0wslpC1xdTkcsAcFno2VJ4niSL8aa1gOZhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOAVvsDGGBLL340w1qnKC9qq6o3CoidHbD9kgMRpWHOfJm3cRU
	eU1kcYpVzJA4hZYHZmFyK2PbwTcxvfObaZEBXY8gCJuSq2yyGEAlktWL
X-Gm-Gg: AYBFou1PqKvoa6UEoqb05qR5v5E0TrtPKkMT5EJ/LZmLdWENd+/Jw0L8CuQtuPZwj2j
	U++TU7Lgl/iKeevg8HPhdH8jz4dqfFLark+TCb+zMpq7qxnMB/lX5GPcnwoNKNqGA6lZnBOhZso
	WWhSgvKnqqJHe5Icp8iagKJjNMSJIi62vMT724GcBUcPZEZW3PC54Es/kvr5Q37zpEtOkGMAB75
	5aJ0cXlJM9TT4XWpcB3PtN8uob1RmrD32lxdiZjZf6hI+5+FUxvJ2eCz6wcoiKDPoWb4xO0GKK8
	ARcPWnUwc80Mktk1o50/VbKrvVQOsF2K4AFcqZS8MvSUiPRWs3CyDuC1JDqWNqwPLndWugJ01la
	WvHf/lWbZapoGGrpv9VscNL3epAj1axByijKHeDBugOwDs6oYybhBG4dFcJx+AUB/3/xZE7PiqK
	EllW9CEP4zKVzbzVbwTSJbBQI+LC+1KpQk+CR2qw1PyBhfPXsMfh5RsQ1q+t/ZQ1Fuek1c86DLX
	jKnJz4XHy8t/DAHK7ux0N8Zqu3Jyp48vijpG7YyEIkasVwTVBa8ltJIDHnbO17nM7GptZvmOD/f
	WOchTLQ6MqRCfCT+NuCNKA1TlRVM+5gCnxAVceomKJlArzGysiG0Yt0uiTGuW5hYgKnNkdQWm1y
	r3Jei5Bi1/uQ=
X-Received: by 2002:a05:701b:428a:20b0:192:fd91:c567 with SMTP id a92af1059eb24-19935906f80mr10155416c88.11.1793008858180;
        Mon, 26 Oct 2026 03:00:58 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm21224176c88.19.2026.10.26.03.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:00:55 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: proximity: sx9310: report a hysteresis of 0 when it is disabled
Date: Mon, 26 Oct 2026 15:30:32 +0530
Message-ID: <20261026100041.16018-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sx9310_read_hysteresis() turns a PROXHYST value of 0 (no hysteresis)
into a shift of 0 and reports the full threshold, which writing back
then usually fails with -EINVAL. Report 0, as sx9324 and sx9360 do.

Fixes: 08f0411c48f2 ("iio: sx9310: Support setting hysteresis values")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Compile-tested only (W=1); I don't have SX9310 hardware.

 drivers/iio/proximity/sx9310.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 79ba46d8a0aa..80b9714caf39 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -447,10 +447,9 @@ static int sx9310_read_hysteresis(struct sx_common_data *data,
 
 	regval = FIELD_GET(SX9310_REG_PROX_CTRL10_HYST_MASK, regval);
 	if (!regval)
-		regval = 5;
-
-	/* regval is at most 5 */
-	*val = pthresh >> (5 - regval);
+		*val = 0;
+	else
+		*val = pthresh >> (5 - regval);
 
 	return IIO_VAL_INT;
 }

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0
