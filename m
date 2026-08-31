Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0837C0FB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204484; cv=none; b=Oa6aO8xO1/9ZKmwx8od2I2NTJ97iMU7k0JHDsTJJO7m69YSidT5jeA2AybByZEOXY5cl6zLr6f8Q3Ns9hcXbn8mzUbPQ20CJHMzLBpEeIMBu0uUsVXmdra8l6yVMhECwlD9UmfKFG8/GCUBLoIYdfj1SPsxpnXdmG4KRQ1wkgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204484; c=relaxed/simple;
	bh=NnEQOnZj4BFAWotZoJ9Pa2KYzLkhMswxt53AVdkVHVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z2dWy3VUP/+TK8oMoaK2D64n967UeON2ruXM+0cvWD4j5TRrZ+1NrhD/B+f0mRRncIIkIg1m6AeSzQ1B0mlRCE+yteUY5m5hfeG3xnNXqQW9yjRUP3Tsn6NsRtMz9ydB9u+ceL4Knmdd0XEoHcFukpHV8kHR6CWRrl4luoV1dZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfsGlr9a; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfsGlr9a"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73720e58dafso3737137.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788204481; x=1788809281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN7H2mlXyqcLAf7M2EYDutGVS5enJP1kVnOii3DYdIE=;
        b=CfsGlr9awmPj6BOaUxb8t4d1xyG2siLpKbOxQV/JGjbPbuuTMQUonX6bHCpcMKzIfK
         +FqVIQNeiHsrBgzDOHt8fcJpJZYZHco0hOg6IUr7VEnygMlWrH0cV5FpO9qJ7ErIYNPf
         yQI0V2F6upz/9KGfLl/5x29nC0b7RpJNiYBo6k33p5kBLP8/5Xd8nk2HDLU6G7WGQ0dp
         QTQUgJ5GVhdx5WLcEImCF20czmcmysHBN2yrMQWK6FcnOCJdKoPmlTX3cDa548GR9ELW
         TdKGLHsEWFf7kpaVwHUbsXwMJ647OfODMCLNi9mII+dK0mIi9R+5x9QIGGzRVda+ja6r
         DtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788204481; x=1788809281;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN7H2mlXyqcLAf7M2EYDutGVS5enJP1kVnOii3DYdIE=;
        b=rUiZTixIE/iJTP4PkskP5Wk11+GFP38yDpk8buktKrK7SD8Yms1gKPz5SXFGhqXrbO
         0kzrB/D2M/P+yN+kQ3l0GzZ+Ydzr/JNb42+dNwxb5RCpDwlIxcNu9fSTzbS5/HvzMlZr
         Ck529f8CATM9hB7DA0HkTk4Bmko47GFXLXW7hHFVBfgi8l9QZncB4YEJBlz8AfW5kvrv
         UiDtH8yhuc1eGg28XRSgheUmfEr0SazvkQRaQk+TVl5Uelr72Djbkth8xiZcDTvR6Rot
         phHya/GCnKWu2CTq5pIW6XynHUatrYOh6bbn7VUjJ4PP1trFPLLm5zeFCn8go7Ac01kF
         OoBw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5aGOmwDGuteIefG2QoU1fYVsNqScRIt8p7EJp3uv14t+4mIVNSzrDPkJoIkYDoCioSNBv4W9P7xTnDzU=@vger.kernel.org
X-Gm-Message-State: AFuF++l+4fK6ZVfr8ZQUmPnMealD6sXJ6LzWMGiGDHlp6RDSC08IdTdt
	DlRtqapuWSDpcjzXayeI49RknXoMG6TJ5bwN9fR5b0eRBrGinvIJiEGr4Yd2Ci2q8Hs=
X-Gm-Gg: AR+sD12A3XLTrqLCEHJA5L0GDDwRFNIp3fcqYyvYAZdmydgYwXCLCsfH+NKqRxZNIPz
	lam7XHO9MKLGv8foGK8ARGCVwKbFU+DkBqdjShl3q5VfDkvIMjYtyolOsTDx2jhAa0Opc9EGu9J
	7Q/5s5Dyfgv9RGVIGx6P7GURC/2pYurHpg/CU0pMjPTCa8t3Ob5kBTzrMHebjR6xGFa45OkW4K1
	haTa2qEINJ1i6EJP7WwjExfpX5tj0csKXq46D9uv27KekDFj7H9H0iDVG0q3s+veC65fwDio2Tj
	SJ15a+N0/CdHFVA8mp0MThIuj2W66ReGoQPZ4WGkXKCkTIqs1L+qArwGH2RlRCn+ituGnpNTj2D
	qVXj8uEhSCIk6iw++UziPq0gTsKrF2UcvLVu4LARe6lSlPMdq8rLDhGNztUAM0A1hDYId7KsUdP
	TSPVgDfBdzRniqnLn58+0Nsj6uLdEz75+Nh1Nbp6yJU6VCIL0y6JksqU7awhCVQvMf
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr10293783137.1.1788204481486;
        Mon, 31 Aug 2026 12:28:01 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f247e397sm7359428137.0.2026.08.31.12.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:28:01 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v2 2/2] Input: uinput: return -EINVAL for out-of-range UI_ABS_SETUP axis code
Date: Mon, 31 Aug 2026 16:27:52 -0300
Message-ID: <20260831192752.258550-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831152156.166514-1-ivanrwcm25@gmail.com>
References: <20260831152156.166514-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

uinput_abs_setup() rejects an axis code above ABS_MAX with -ERANGE, but
the UI_ABS_SETUP documentation in include/uapi/linux/uinput.h states the
ioctl may only fail with -EINVAL, -ENOMEM or -EFAULT. An out-of-range
code is exactly the "incorrect values" case described there, and every
other validation failure in this path already returns -EINVAL.

Return -EINVAL so the code matches its documented uapi contract.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/input/misc/uinput.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index d32fa4b508fc..7d6266c2bd84 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -524,7 +524,7 @@ static int uinput_abs_setup(struct uinput_device *udev,
 		return -EFAULT;
 
 	if (setup.code > ABS_MAX)
-		return -ERANGE;
+		return -EINVAL;
 
 	dev = udev->dev;
 
-- 
2.43.0

