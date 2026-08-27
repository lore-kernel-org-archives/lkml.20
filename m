Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EA3499F0D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851302; cv=none; b=O9V1qw0lDFH0FD7MHGsHtNNm1OBFnnaT6DFH/ke7yK2v8S/+1WV53KLHRg5i7725431Vh26ifb6hcvt9iTuKALAE0od7TK6KEjvKv7YVCOqEIqgGsYofB80SpdWh8DyLm/O7mYDBPP0ksoRcSvkmLfYmekxAQDQIU3VdfGusSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851302; c=relaxed/simple;
	bh=i4ZF5tM1Z8ws8bEdVnkjHemZs7/wJkd9n0+slBx1btk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XJLQB7JDHFVuSrAYO50vmt4NLXtf7DwQRgDahKdElaF5sQI8Xud5XWfpmcm0MONX6eBzTjcuZjSCIGKT7NoQwFTVdOdKivakRjy1x+mYzInoKnC3etLZUkcK1B/oDiI3bfE6EkZ+902ZE2/+atnU4wQ8jYcKg8jBRaebYortRZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaBTrjnb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaBTrjnb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e7109321dso162017a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851301; x=1788456101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUyG3QvGU6Q+HKsY6Ncct0FACqa/9VKrloUu7M3UGwc=;
        b=JaBTrjnbHbx15X8ZBStA7BXajy2ItOyCciIXoeq74yt26V6xnNHVNtTrbKHlrImUDt
         apP3P2nqDwcv77SsBBtj4dSA/ZiKXLxRjuN9YW4gChUcADOqGFE3go7iWUJO2UX4Se7Z
         IF/bw/IdTbDeVa74YJuom6fLqVUYaQP+1vfRs40ISQ+yIy94PbyZhX87X5gjuLoezugD
         wpJfo+NPCAlQygHX0jPLpqlite8WaBqFf1Vz6u+GgOvTylMAz3jEnOpqAoBRCjkQ18Io
         y8slw7EsChqMn7S8lZ0Tz6X8PUUG/0uykNnbBmHnTTIcUwdR0Ia4UDS2+o4RydDFcRun
         OChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851301; x=1788456101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUyG3QvGU6Q+HKsY6Ncct0FACqa/9VKrloUu7M3UGwc=;
        b=bVMecW9wiW2IZQsCJb3UCsNxXAq9cd16CUlAMld4pYzr89kIc2yvWtwjFAJDL1HQ+H
         BXYo6wUD9zRDc6zKKTcF+KXe7/OWBlXSGNtj1vQU5urBYgIQMM1LfgS0HDlacAIeF4fB
         bttPmYvV/QTB6i0FWx+RdTT5QP3ngB8h0qhm7Ry1PAB09tzMRIl1IiUnb8627yPSEDZw
         R+WiW4i0Pg7fhtA3MoDFonCvHSFcTSVILwTcZxZAsfRB8svdyTZ7CIHkwi0aTG0sHb/5
         zab8OfKveSRXedBaza8xvwIHpdDZOjDmLTQZ4JMtYo21DM9SFu4pHEtHS0ZmyLk74d9x
         2wZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrK82c//x5MFy3XamIw++TeBoi9ctQGZS77pT2LhruSQoTMAuvEkByi1INra+g+EV2r4kBOYL9XZ7Gw9Dg=@vger.kernel.org
X-Gm-Message-State: AFuF++k3ZENyXxMWEGySIACRE2gFsQDqOxFDq+e5uIx31ezEI05D1ikR
	hi5NjWlxq4+9v6aaD6KBbL8xHi7e5bzllgi+hh1KgoKmY9fXmI/1hoaa
X-Gm-Gg: AR+sD10IOJ11Ciuy81VvCpa7h+K76e4VhosQ77r1H9ZpaYUeZyoq319rXGz3cuwUTay
	w2uLkZRv7k3F7rzC8mCLHOhYzrXFLlDxgNLc9epNkJxkv694/8LHnjTe5VYf3D0UDoLn/5zffxD
	pQe8PAF9cSRIBsRHEsR8i7CqO6HVmKJRYT7pmPumNN71bUyZn+ri5C3K0wGmMhlMxKI2tM3OjQN
	sMzQZgAPSU9msOxhnsoo55idM3KsrcKFq8aEbLTsVabKJlsiB+Np1Q5cMmVSthsOBj5JNv9eO5W
	zs4TlfgodlIjjHV9yOFXSU6zyD9p/3pfZ4r3NUCuaoh1ZfPQaC7A/cG4xPNHRSUC01K1SaIRk+v
	m/bjRbpOuw+IhfZEgHF97ZYFl62POO6MGv0S41cbsBNqKRAWasYmHIck+5cF5yzvgt7Ki/MsBHc
	UC+6T+lhpi+tSpwCffmMn5TrQQlJIeZKdDluRigcbjfP5inlaXeGspktp4cAU6rTt4xOjs/PuLa
	mMc1ppFtf4ugHjwpMgv45Y4MtaBa4HV981o
X-Received: by 2002:a17:90b:17c7:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-396d0fc1b2fmr1308289a91.16.1787851300583;
        Thu, 27 Aug 2026 10:21:40 -0700 (PDT)
Received: from debian.ari ([47.30.51.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm17797165c88.1.2026.08.27.10.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:21:39 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v4 1/8] iio: adc: ti-ads1015: use DEFINE_RUNTIME_DEV_PM_OPS()
Date: Thu, 27 Aug 2026 22:50:53 +0530
Message-Id: <20260827172100.39176-2-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260827172100.39176-1-architanant5@gmail.com>
References: <20260827172100.39176-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated SET_RUNTIME_PM_OPS() with the modern
DEFINE_RUNTIME_DEV_PM_OPS() macro. This allows for the removal of the
macro automatically handles dropping unused functions when PM is
disabled.

Update the driver struct to use pm_ptr() to avoid unused variable
warnings.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0fbfa4e499aa..93a165c5416a 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -1059,7 +1059,6 @@ static int ads1015_probe(struct i2c_client *client)
 	return devm_iio_device_register(&client->dev, indio_dev);
 }
 
-#ifdef CONFIG_PM
 static int ads1015_runtime_suspend(struct device *dev)
 {
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
@@ -1080,12 +1079,11 @@ static int ads1015_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static const struct dev_pm_ops ads1015_pm_ops = {
-	SET_RUNTIME_PM_OPS(ads1015_runtime_suspend,
-			   ads1015_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(ads1015_pm_ops,
+				 ads1015_runtime_suspend,
+				 ads1015_runtime_resume,
+				 NULL);
 
 static const struct ads1015_chip_data ads1015_data = {
 	.channels	= ads1015_channels,
@@ -1140,7 +1138,7 @@ static struct i2c_driver ads1015_driver = {
 	.driver = {
 		.name = ADS1015_DRV_NAME,
 		.of_match_table = ads1015_of_match,
-		.pm = &ads1015_pm_ops,
+		.pm = pm_ptr(&ads1015_pm_ops),
 	},
 	.probe		= ads1015_probe,
 	.id_table	= ads1015_id,
-- 
2.39.5

