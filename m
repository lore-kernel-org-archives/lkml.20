Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C08E51B182
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788367; cv=none; b=CbTQp0R8ZcztfJNwq1MIhb1cVmfD7M8CyEh5/m98qEus7Vl35MB2EXl8cdU3SWV4ecsYsFxbyqumuoso4HtDDX/sOvpFWcvvfmTNV19tisCkXjbNLt3Qf6RS5dFvEGCtffrLXkpxtmUQPCxKR7/BuGYKsSch26IZjUADapN+1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788367; c=relaxed/simple;
	bh=VRY54Bp24CMiSqVN+aAIvjHgWCp+bx38PBzd7hShuEs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uh4yuqsCaBHNasC7s8wNFL4evYlWy3VQHLbA3Nef7ojUgEE9cUnz+IVMi8TZsAOikviIgO30ZWDTgn15XwIUYpIiOhW3pNveDqdKdkK721gd6WNYCR0lO/HR8WN7ATQr3Mf/wps741GpgEBUhJ1DZclp2va+wVZlKzDDCsURiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUOy6adG; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUOy6adG"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86efece610cso2829974b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788366; x=1791393166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTeufGQidCjsvqwpn1tRvvD0Docs/Gc7we1s3u6LYnc=;
        b=TUOy6adGCs+JdkjN7lY5lZISuE55iNRPxEg2U0rGtrrjY3gS1nFrUNeBVw/mb1ji7u
         97Q+ApL6sUEAUKyIMkrY0aHFfAgZdGjEvUO4CsH0EYLMfsMqe8DLoNSOWwq8yjyK9htd
         H1qDjrvegJyTR7yL0jYOQCmcI+FSsNZZY2Y5WNDBTG2x3LRB2O5sPp02qkOyFk3lfo9W
         e1xkUE36XuRKrnYnYEOXH6oKsPoGbNoNNkaE4A9l4ddoO/MT/OyamDmuU/OuCaxSUwAC
         zYuiaB0/aXIFiYCgxziLtE7h/mtpaO58j4vafu6klIsPpoPpKTjdkX1kChkWk3px13Y1
         T6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788366; x=1791393166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTeufGQidCjsvqwpn1tRvvD0Docs/Gc7we1s3u6LYnc=;
        b=sVUfyfEPi3afgm9FpHMVgx5B9P8iCaDFm80jn3EB5bW2t2IC+/gR07nYvV/kTmR461
         bi7mCzCQF9ZqdpvgFqo5aAK5HEw8UkZJRO+Z0yLw/xAiOjfeKNpfrJtyNp6fs0QYpGau
         QimrThERvtJDX0L0CjjpxFlHpEROyIYMaCFIQV2hsnL/FKaSzphwS4iP26YSM6sp1tjR
         gzITaWqarSFXAViExTV7q5Ze7jZXU90u6lILngIWDabwpetF1INvjUunnBRxpHb491Ye
         RvDq1SX+fCo7R4yA2TqtzzYY7yBimdCse4jtoRGNRRsSqAF2/mC1L3aRvNzL3/BIt7Ny
         FFKw==
X-Forwarded-Encrypted: i=1; AKwUvBwcoDaUNySTkFEmty0KwJq/3o25h6jHs8Rfi/LW3URv366jCk3LqB4xGw+88edrmcL2M8LcHhr6EU3qa8g=@vger.kernel.org
X-Gm-Message-State: AFuF++n+KdZ9xkUEYcMiRJdtvai8gXCMYR52zPcEV2lu1qmt2EtbKuoK
	803u9IIqHfbtToxUzr28yptdgjTb1IyRmDQhmLQh/Y0RKC9FU5nZDj1s
X-Gm-Gg: AYBFou2fg+viBjSerQJ4O5oJwhgyZrEI5H5fJKqb8iwJv6ICoWGLohHyA3rLM0ZXtDO
	9Q4AY72XgGqKPqQQz+bAugp9poUgoTDyk4hOU/N4c3eXzqoir9kL55H2dbk+J/8yvOb2MyIEf9e
	UmXsXX24zA0nmiwNBK8+xHqFRhIUW7/qw1gzkkFGdGlH3rjRqaoJgrNd5HBxs4VcKIljB+Xnfm/
	fNNzOdXj0oPOV89qErmpMsg3gBXH1D6cNoeXPSeKyuRZNHlbM1oukN3qKuTA7jogNnyi1A4pnda
	y+G444RjM/zA0hQVD9TNP51TnMwjeUimW3KPVS0mwHUHUjT+Lh+MbMoCh47zCYfwvHMVYyQX9sg
	lnHaddFvDWXQzgUBF29Eoo2l9x9EGQSZyf9VApoOKL23l8/uNoLe1f9k01MxerGETA5B2dr0Kwz
	vLLLFObGrW8Yt2DI1bIK7DzT6USixWTZXwmoeNGswA2usdJT4xQWLPRnMiAmohoYhpGYF+3riiD
	eM8Q0AvGZHdC5aqCl/w1A9suv8WWx386dqdXc/WqwlzUX7F5nY=
X-Received: by 2002:a05:6a00:3926:b0:87d:430:1437 with SMTP id d2e1a72fcca58-8874e830b2cmr1452636b3a.38.1790788365419;
        Wed, 30 Sep 2026 10:12:45 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:45 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 06/10] iio: adc: ti-ads1015: drop unneeded < 0 error checks
Date: Wed, 30 Sep 2026 22:42:00 +0530
Message-Id: <20260930171204.12863-7-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930171204.12863-1-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several functions in the driver only return 0 on success
or a negative error code on failure.

Change the error checking to align with standard kernel
coding style.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 34d3d31b5ddd..6637c42e0506 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -539,7 +539,7 @@ static int __ads1015_read_info_raw(struct ads1015_data *data,
 		return -EBUSY;
 
 	ret = ads1015_set_power_state(data, true);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	ret = ads1015_get_adc_result(data, chan->address, val);
@@ -727,7 +727,7 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 		return ret;
 
 	ret = ads1015_set_power_state(data, true);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	ads1015_event_channel_enable(data, chan->address, comp_mode);
@@ -994,7 +994,7 @@ static int ads1015_probe(struct i2c_client *client)
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      ads1015_trigger_handler,
 					      &ads1015_buffer_setup_ops);
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret,
 				     "iio triggered buffer setup failed\n");
 
-- 
2.39.5

