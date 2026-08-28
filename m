Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F123DB626
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901054; cv=none; b=hxYnMBs1JsZPcLUQ72Wu+rL3xcSCMdKOPxHhoQfV6OHYPez1GMkNpAsqoZidvwz27TPDAj779keJ7zJZH5m3QPW0WtN1WQoWguASI1QmWT1U/FAhJqJESTsmYsq7jMP0QPmvd2LiLs/DOEbEjgbcNNUdgomsNQHsc4LLPVj3cZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901054; c=relaxed/simple;
	bh=hYDzKjnNqxYmY1OnMOzHzkHQhcAoDevwky7lPWZ82tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bnxm1JHQon5T6uWjibSJrhCfHVern+pSlm+H4hXYvtXsDIKzLhhsWP2DBuMZ87+rS7HW6hKsPm5xiywXYIKOMaHTbRIHIBmMgp8oS7c4W8z1sp3/TbmAoMTho2zt58E/mTnqReEoYKpJYsJnqyoQLZ+BEAwVO3OjDkKyC1e0+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMsrKb0d; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMsrKb0d"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ecf499af9so6764807b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787901050; x=1788505850; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mfhcIqIfHWd8sNFxoHf1vs2muwYwCiSdxw0D5clLVA=;
        b=jMsrKb0d6hPuD2NtTKmwZIGLGWM+A2GPNM8bwtlNRRsq+P2j9EeTHePMla7SiM8nrn
         KCc7+/ZSk72RzNe/8xkqMLkp0M12MuunGMgenKWDC3hiMIh8cDX89+Ilqf+680um/0yl
         p+NnKNOVFUn/c4jKNJzL/Ct/AJsodN9HkeC69HA3uS4f24JGmQ47A+h6+Run2DWIfd6m
         CwBVHd0G70Bj1+63YblW+7w3xjHKOgI+ZZO02DxVVyzb2KD+qLbqicZMoqY1Hg5qJozt
         BbVqPEph8FBwKL3V5zRKtUKfp48wPI0k1JlWVasWRet7UzAQa9dNFMzpSxBqJOVmYIX6
         YDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901050; x=1788505850;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mfhcIqIfHWd8sNFxoHf1vs2muwYwCiSdxw0D5clLVA=;
        b=X234os1lrbNWlrGrmnVLI3lysJGlUhtGbhy/4GH2Ge7SahAhOnkTpckkzuK/ETSJdE
         tRZnMWTCkBCx0LkZVNpnarTkGkMZyu27E02NqIqdtya5ea9SNEmToTNHAYHGpLlRNzD2
         Iry7w2BGOFllFTrxWXd7LZKx9mTeWZINwjqZzjLoCt1PMZrJr1Qo5GQqb1eaQAM3O69S
         txSwlj6A+ed3tD1Tu9mXt0NaHaUm7UfMgDVDQV13ePgl0f0sxUhnWx6F4PdQ29HBV/C3
         3MuVa3NZanFxdxSY9UBFiB+NRMM6Nc6lj4WUB39tNlIdBqx85PbiMmBmCd+ZIpfoCZ5M
         KTEA==
X-Forwarded-Encrypted: i=1; AHgh+RrkpkUWdIXHF+Ag1fwpf7m1PueMVTqHRnL1jdSMZMGbf/cwYAVAfJg1lrsiJfsYytqDmnabJPNlI8SY7TE=@vger.kernel.org
X-Gm-Message-State: AFuF++l+4puFnC9CYDsZJ+JodiZOPUsHyU9M/YOWXCEatpxbDbdLs+uM
	DWumuFIv4ZsWvtNc3NSSGwQl43zGD/zJhXCUgAC7ArjzslnorByQ78Hs
X-Gm-Gg: AR+sD13WBo23J/2gBVOm06p1gaO0/KadW5q2r1TmivYn+WJZHKUwt27nbuzKHdkeMDy
	t5aZ/hHg9GHdRyVGyUTUT18YL+TMBmV57v5lmA8JXKDwkElwx3QG+Y4qCfJYYtK8rJZsSoW/jDM
	USf7XIyR902CxEa/jsBd20wVGR1ayNdPMKZuedTL+T43nbGuYqHNlvmHH2tF7NE4LkPtooGxIuM
	IQYKKGV/A7pissiIx1F4lCsI9Pq77c7tHfCVx5Gg9oMel2hey2Xk34xVCVlTY4NFhgdzLHoQ4lH
	mZ/QAh+brCcXTdhyxi//fLq2a32rwFfyusQwgleHcy5m8egO8EZ+OSbJV040y6Q3ZDv1JVPwEZa
	ijXVOOkZkFqjY8g93jU5wMqnB8Rl//Sfm8nSDiAjT8J+TmwrdZW846Nv/dCIanZhxeVj/hMuEEv
	7D8yl2WCK844BoACYBHPQFT8IgJhEZWmU6mdoz/tSBR4/o
X-Received: by 2002:a05:690c:e3c2:b0:816:b469:cd12 with SMTP id 00721157ae682-85d6743f652mr23133277b3.8.1787901050397;
        Fri, 28 Aug 2026 00:10:50 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e677606aesm2859147b3.45.2026.08.28.00.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:10:49 -0700 (PDT)
Date: Fri, 28 Aug 2026 00:10:47 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Chang Yu <marcus.yu.56@gmail.com>, Andy Shevchenko <andy@kernel.org>
Cc: Anshul Dalal <anshulusr@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] iio: light: ltr390: Remove stale TODOs
Message-ID: <apE0dwvpW6Yl8yzz@gmail.com>
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

Configurable gain and resoluion: commit 13fad2607dad ("iio: light:
ltr390: Add configurable gain and resolution") 

Suspend/resume support: commit 288ce72fb5fc ("iio: light: ltr390:
Suspend and Resume support")

Support for reading the ALS: commit 14e0d914a855 ("iio: light: ltr390:
Add ALS channel and support for gain and resolution")

Interrupt support: commit 7ca4b8957066 ("iio: light: ltr390: Interrupts
and threshold event support")

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---

Changes since v2:
  * Added commit hashes for each implemented feature.

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

