Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96D459AE6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435860; cv=none; b=X5RMApNbZSy7Xzh3fP3/9+pqBelnk6weAJMQTuyj9i0WNRfNCWcQGD8nR15+3I9Elck+WBWzXje/mKgOq2QbOToOtLsYU6ZCgnU1Wig4G9KfLis8O04PRT2s30iCzuEat6hs+rkA7jsR9+pdNw2nU/VBg0hbTiyo0OHrFqDFl5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435860; c=relaxed/simple;
	bh=SYTHgoh5s1ttZLs07spkIpQXvDG9wpe9InvqSJ/tVRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oocDfkCAGyJQGz5Dond5/cEbQvfr8H9Ah4WsPm7fMl9L9pXllEoLyjH/HL6EioLrt5+eA+RQ5gr6E7IuoaUuNYmFDPuaTnt03Sf1yNHtDe0hraQom82OCcZAQ3BA8qcAxVRoCfAZfWaTUj7PZPRhydS79pimHgH1pVdAxUFlCgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0lfYSpD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0lfYSpD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b9320423cso22639205e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788435851; x=1789040651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIXTKgGl3+GsVlj7Ecpw9Kv3oxNqHNNZVPdXkZxB+yc=;
        b=Y0lfYSpD1gIPCxu/PFT7pFzfckUlPPiMKjE2eg7v81G/r8kSAJPmFzXujrSyqqhZ/z
         v7pWPtd/Pc4AjB5a7YQ8ii43GHPbU4CtEKlPlrC3fCf4sWUHKmx43+2UR1ivC2XwwNF2
         ORIJXEzKusJX9dKIYXq1yg7uKuFeAp5+dkYBaZDpE1FI54KsFVW1DLm8AYQirF4Nu/vO
         gFgUAPHJ0fsL0bpS/awUuT8y/3Um9Hhva0Kix9lWx4zqbfh4au2dieskKxjo7tsNb+8W
         NwsJI+1fm10Vuz+I00GvG8aZMpKvWcFRuAyEraqXFSaABRKikiWmQ3eIav7tYtevDKv3
         QJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435851; x=1789040651;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JIXTKgGl3+GsVlj7Ecpw9Kv3oxNqHNNZVPdXkZxB+yc=;
        b=tAxKgkUutr2KLgOTWwAqz/UTGgU0Y0/CIKRIk4rcdnsMBSqIjYDxQVUxr+H9/aspWk
         W/47MpPktYLeG8VDsDyIjZsXnla7DQ+w31jzixs+y/Gewlzs4XY/5S6hyiGEoG32tCBV
         lQ1GNmR7wkO+A+FJznUiewOpAAVlvJYCS8O4XogPo4R522Hjm+daVeNpYLbxcIaAkPI/
         nGWEZvyflRIAKFyou7Dx7O7lwtkPl/nVTIhnSntAjzax2+PHu7r9B/mPumUKS2KjbltP
         /C3/oPs/notjzgGb9JwnJkUPESb/JDznPUkjr2HYfWrw88FeZ5lzs649978Zn4aUz5SY
         jILw==
X-Forwarded-Encrypted: i=1; AKwUvBzOwzvwcgxgaQfp+xkAkj32SeSOZn/mR5QuBN4XAeJz04JzCyqkNRfKIJa54wZ4yYqdc+ysGyM8TCLo0fU=@vger.kernel.org
X-Gm-Message-State: AFuF++kSkh4o18UbT3DTxKD8rOZC6nmCUh78Y3E4B4RNCvRaBdyyW+0D
	grjTQV2yMI44rrCVnKqwe7Nn8rltxLjdKndA8iCHmwqMr4Irm+sEVL0u
X-Gm-Gg: AYBFou2pwPb7XucydcaDtBMa91C4cqWzga1J8uBo1N5SA7Fcqr/ysMsoVl4hY8qBIR/
	e+SR6bYf3PdH+MiEZZt+U63WQsQQwFdYxbeB9o2ZuNgeeBFdsqRBGtqLLAS6wbdTQpoFcgyfJw0
	KPKlx+P4crWqnOkhrp1RxEHtFmpOxGoafSDr75CBWNqBIzqzYndkhQK2YqUjxRVmf2NXtwX4pu1
	um6NHymnpwNDhP+te6QPktMbnxp4NGEh9QGX3wpEwSFiyq/PrlrqrDo9hum7rWvLSkTP9djCayx
	GFvRDwHuKuRLEACHDWnTigu25b2ErZqBSG451gK++BRDynex4L7ieTulsF/8ZLBz3xitCFtGIxB
	9wsFQedmBviSF6lauQ75bAPYcka5A4h7p6tLvwASW1dRbgAXKOKzDmWzTJQ8wWWN/1co0xn4Ypq
	qniOWZhrnfl2eahAemPv4fZKKRpfK3O7wiJ8C/xidcC0ag4KwHxGJES++if0n1LR9EonRBXZQrN
	WmXYug2g4fmSCT6
X-Received: by 2002:a05:600c:3e0a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49ce5810b5dmr259425575e9.3.1788435850729;
        Thu, 03 Sep 2026 04:44:10 -0700 (PDT)
Received: from localhost.localdomain ([196.235.147.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm64541785e9.10.2026.09.03.04.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:44:07 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH v5] iio: adc: ad4030: fix invalid oversampling_ratio validation
Date: Thu,  3 Sep 2026 12:43:09 +0100
Message-ID: <20260903114337.63541-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In ad4030_set_avg_frame_len(), the logarithm is calculated before input
validation. Passing zero or negative values leads to an undefined result
from ilog2().

Validate that the input is strictly positive prior to computing its
logarithm.

Fixes: 949abd1ca5a4 ("iio: adc: ad4030: add averaging support")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v5:
  - Split validation into two distinct checks with explanatory comments
  (per Andy Shevchenko and Nuno Sá).
  - Used 'avg_val < 1' to explicitly reject invalid values for ilog2()
  (per Andy Shevchenko and Nuno Sá).
  - Tightened commit log description.

Changes in v4:
  - Reordered local variables to enforce strict reversed Christmas tree layout
  (per Andy Shevchenko).
  - Rephrased commit log in plain English without C-specific terms
  (per Andy Shevchenko).
  - Converted AI assistance note into a formal Assisted-by tag
  (per Andy Shevchenko).

Changes in v3:
  - Dropped the !is_power_of_2() check to preserve standard IIO attribute
   rounding behavior, per feedback from David Lechner and Jonathan Cameron.

Changes in v2:
  - Added note stating the issue was identified with assistance from
  Claude AI and verified manually.
  - Removed initialization of avg_log2 at declaration.

 drivers/iio/adc/ad4030.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index 9c5f19321e3b..f1499b4792b5 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -746,14 +746,21 @@ static int ad4030_set_chan_calibbias(struct iio_dev *indio_dev,
 static int ad4030_set_avg_frame_len(struct iio_dev *dev, int avg_val)
 {
 	struct ad4030_state *st = iio_priv(dev);
-	unsigned int avg_log2 = ilog2(avg_val);
 	unsigned int last_avg_idx = ARRAY_SIZE(ad4030_average_modes) - 1;
+	unsigned int avg_log2;
 	int freq_hz;
 	int ret;
 
-	if (avg_val < 0 || avg_val > ad4030_average_modes[last_avg_idx])
+	/* Reject unsupported modes */
+	if (avg_val > ad4030_average_modes[last_avg_idx])
+		return -EINVAL;
+
+	/* Avoid invalid values for logarithm since it's undefined */
+	if (avg_val < 1)
 		return -EINVAL;
 
+	avg_log2 = ilog2(avg_val);
+
 	if (st->offload_trigger) {
 		/*
 		 * The sample averaging and sampling frequency configurations
-- 
2.43.0

