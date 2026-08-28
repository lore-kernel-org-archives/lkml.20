Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088B3BED24
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904842; cv=none; b=WdBImfK/T2Qpqz105gaZ3YxGtJUZVpQeosPnj56OJe/LszQ8HxRwqHDtIVPu93qk3mxe4ViKUjnV2aMo0XSd6mQ/KsSWtooiIByvhxkYAfLtFtc/9MKM+6YxJ4h4pwG2gExdbvYqNXtb6ISr8+nrx/2T2rUt5GKMIRlrNRsPozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904842; c=relaxed/simple;
	bh=d6l+02HOG6dBou7Igto/xXG7YXvFDdwm/IWzpa4cwM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jGBjzdqbxHVyjTDUwwz5TJ/OrjLYB1MVFr5u1dI39e1wwDQVGphqY7M/c9lP1fPUcN7LgmlvnWl77TEGTbH7/ISGLwomltap9fkh5hf5PKRt05bwOmhHrEVp4OLiueZodXgMUi8n+0KAEcPRkhq0loO+G1XSMF/GBc48HL0EneU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGhdJiun; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGhdJiun"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836c91bd782so6787027b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787904839; x=1788509639; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRjn9sqCurrAA+15m/FlRgC4mPrIiDCg2DZ2ej6eFxk=;
        b=dGhdJiundlN4ym6FA5W5tjAySdwoAdFZKNVyxXGEu4tB2a1GYyjXV+8TY/VI+BPyED
         cqLJWsXJABWso8mK+W5edqmiJnFN8reXHnwpOQGYjUIFlA18Y09aMvTKTNYfXw33QjlY
         yEGVUIzFRedAopWrSehjd94O72mjdrnZKKSTULOrxM36BEWqNewYVCMMeSyJ9mK4bu8N
         fLOnkWC2IH4TncwPgcJPWDo6opl/PnRmziYMbhomSVUcbn6gp8D4AZDvsZchTcUxGd0z
         7hxuB3PPU/BR9j72VxbNsXjv7vm2xzrHRSL3+wXJcTX/YUVjAqN1ojwkvABWgUQibLUm
         Mx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904839; x=1788509639;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRjn9sqCurrAA+15m/FlRgC4mPrIiDCg2DZ2ej6eFxk=;
        b=pkGBQkeUCeimG3mcsQ4NL3zedSvIYk6d7dwzU5jxUgApicR+g1UxCpZq59CxfJRPem
         SAx3wkEvq9lG2MxvvzSmb5LscnJgItCf2TbDXhtceYJm+qmlGB1aaIiaK0iJ8SBcTMPy
         UqSnkPuKqlhtQ55iLpODUqOIHQDaskZwwSIl5wOGnvTrfVTvmVJsFl7DnUooV75aZuQr
         m5T9oTcsstv/beantcy+WNyZYifnWMhWUr+Hnr31ZhXSt3F2qwrm/TxecvZExH/RpsZK
         4JVaPn60FB+CvT8NvAL+rMlgbImITk7vmftpJFLsBFkoz1R9DKYUqqsihLErA7m5ATCp
         lnNw==
X-Forwarded-Encrypted: i=1; AHgh+RoGeary7h6j0dnkDTEg8JshQyjaecyKPex45GmsrhhZHfTlS0TVWRTRKzUoKQomNrak3UxmH72xxQtlWuE=@vger.kernel.org
X-Gm-Message-State: AFuF++nSWPOrahaHzRnqtMveBjJ+MFoD89TdjyDWxDWMyIdcpOmhs/Y1
	Bh02/ZQZhp6og3XKvKnGWm+H0OBHw7pwteIsE2lUdpFJl9PUVqV/ZUtA
X-Gm-Gg: AR+sD100XahYQJqQE/+JpzwfXiWAv18ZQwWnT22WxbNhFjPIiQeWCtqaeDzsDvocvmK
	izh2dH0aH3fuBTvl44O4TPPYQEVtdVpFoWnsoPKRSXM0Gn+NQeOpKhn7ug7XByqq6Zf0Y6iJjQg
	1QVnCsSdcw34GHfER+hMkx4nsPBqZf3YZwqNo6vLweS7tVdFI8TYjmHJQvc72nCNfSS+zAcrC7u
	51gSmcSY4QTTiX7vI/FWm78/p1PTxGP4GwrnHA0qNm7E9dBhG9zRdci4/avOiY8eRtkJDVUt74H
	40/96A44izlYvaluB6BvT5UQw6jOUrEjZyamDsJ4CcsafGxiXSPdN6m8d5dn483QDXXfycsmc2m
	kr7Bw/QDUdGBp838Dul76UzrRvX7KhWtBhPW2wubXQFMBANS3fIErNyOSXiua7eVJbwKY2S0o/i
	/BwHaxJDcqCIhSpd9Qi0p28jdpW08egzlFYzsqI0LdL9GE8vhp561myg==
X-Received: by 2002:a05:690c:6a0a:b0:809:ae5:1d2f with SMTP id 00721157ae682-85d6743fc80mr22309757b3.9.1787904838711;
        Fri, 28 Aug 2026 01:13:58 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5f7dfaf3sm3374987b3.22.2026.08.28.01.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:13:57 -0700 (PDT)
Date: Fri, 28 Aug 2026 01:13:54 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Chang Yu <marcus.yu.56@gmail.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] iio: light: ltr390: Remove stale TODOs
Message-ID: <apFDQhk9TUoLnEZt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove stale TODOs from ltr390.c. All features have already been
implemented by Abhash Jha<abhashkumarjha123@gmail.com>'s patches:

[1] Configurable gain and resolution
[2] Suspend/resume support
[3] Support for reading the ALS
[4] Interrupt support

Link: https://git.kernel.org/torvalds/c/13fad2607dad [1]
Link: https://git.kernel.org/torvalds/c/288ce72fb5fc [2]
Link: https://git.kernel.org/torvalds/c/14e0d914a855 [3]
Link: https://git.kernel.org/torvalds/c/7ca4b8957066 [4]

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---

Changes since v3:
  * Reformatted commit links.

 drivers/iio/light/ltr390.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
index bc031f2c3141..f1bb066248e6 100644
--- a/drivers/iio/light/ltr390.c
+++ b/drivers/iio/light/ltr390.c
@@ -10,12 +10,6 @@
  *
  * Datasheet:
  *   https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
- *
- * TODO:
- *   - Support for configurable gain and resolution
- *   - Sensor suspend/resume support
- *   - Add support for reading the ALS
- *   - Interrupt support
  */
 
 #include <linux/bitfield.h>
-- 
2.55.0

