Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327E751991A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788346; cv=none; b=HlmucuXtTaFudK+YNIVGCevSI8mSRYuYo/s7L5CVf8NIs1lXm0aVLJhk/3JZc8HdbmPc3wkb2UWVEoa1QwBKjFaqITSxlWDSkCPXjPtDLWqrjZfS60YwSgBF8zPkk47bX17T6mqfPCo++BJAJP8OmCoO7ytTac+8XH0FBpWN9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788346; c=relaxed/simple;
	bh=i4ZF5tM1Z8ws8bEdVnkjHemZs7/wJkd9n0+slBx1btk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6/RbA14VIgwpWhu9UqbNeNJ6i2iN65turwABoQG2r2zk5OYFDnyucAnOW/anR8TgZvSCXAfLxKm4OsBzolifWetZqUWc2lsE4hCBdISO9naqQJreicDW6ZfKzUsskdEy637VyRvmfKxT2uxzzYykDlaPeYMR/yac98+yUyvQFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POhocg0Z; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POhocg0Z"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86212a185dcso3883849b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788343; x=1791393143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUyG3QvGU6Q+HKsY6Ncct0FACqa/9VKrloUu7M3UGwc=;
        b=POhocg0ZrGkgm6KY0qU7Sb1ekMiXgMWNQIrzyvtC7iXj3koqvoH5IJUlt0zv9xcctk
         zT9Nl9zrIobxizplLk9zqqVmY13WtAB4lwNh5oBeXIO8/k93f+f0Qb6+mpZh5Y0xws4k
         nP2Qc5lqe1XEy4/YXFWmZmJGd+7J2sPn+39eGlCpSQjRgA3ZmQUcvBuLYXpERrfVrhPQ
         s57B6Ar3B92aSuT74Q1EYS5y/q7Z/kuAq2GzjSY3xQnFYy0z5F0G8QOkvddUvAq+K69O
         5yNHa59+Du7kTKX98abuhKeMgfQtPzSCIi9AHEgPmiWZYWe9T3y3PD6NLnH5dNMoNSbk
         cJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788343; x=1791393143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUyG3QvGU6Q+HKsY6Ncct0FACqa/9VKrloUu7M3UGwc=;
        b=PraCnus8qKaUbPezoeNMy1MgiP9JeDYCzGfalbT4vNCZxfEkIshr9uXYrnAKcPz4Vj
         PPz4l2WfF/Yvcr1rbrWLmLl9iV8y1KJHMVdqKJehR34N0GYheatOhyIwW36mQshFchDD
         3RWJyzzcsyPT0MlkB5yxFzXToNrjCwZ4aHdfgIbnP63OF2O2eBZuK9zwRAQsDNTKKGKi
         Yzhp8zQgajGuK9lQFuOBHYs9yJ2n0S2WZSihyHcdbUdd0GEbYvSsK4dVXsX02M+wQGfO
         rljoL/2zMDHLa3+PmBEetTYoWlmw3shKgZgRUS4pPuef5rEGTxO5jyjdcZ7IP1GCD3oj
         JgvQ==
X-Forwarded-Encrypted: i=1; AKwUvByg6y8v4jeq32FFtbAIwavzqy/PZpamuvl4KMkCS/ZZHBSXlw1t6X2+YdOqWvmr8BsR4lK2AibBQQovW+M=@vger.kernel.org
X-Gm-Message-State: AFuF++maXX4NDCUR7PE0vC+gzPAQiG3xQHa0bWVQZ7biufEzf7B1gAe9
	Se7EU2y3U5GNhyE95dId1MiitzxP5ARqC7yW6wu+8c4NNYeqol/WrTCjXYOTGQ5Tjik=
X-Gm-Gg: AYBFou3l7kP1lv4+BvcwypieCGHJk3ESGfWfNth7Xi/mmbk+NRfXtzA0MW1YzoCciao
	lFXBBjq1BibOfKib+UA4EEI2Or22YM/TioSykz+URwpmmkFBSSQCKKkTWgaiHsrucCgg2/v65Z+
	WbRf1ml53Mp+lPUHf/Msbso1HTEuWKwx4byS1fT/PCqVsS6zk7ZNw8bRLXnRv2O4SfOZLLb9dBq
	lGT+SkUnuTHps6GmZaIA+CRAt+qVsjx3/5jT6XFZeV44Jr0Qtmy6qLuslRK5SEMBndAOaxvD4TE
	e8F6QE3ZraXnBaQdZuttN2zvN2tTtELNNmBFxnuX5y4vaq1VtSs+YBuD4TfER/4BpcJtDcgc+NP
	j9KDZinsVRteW8bY4jikZwSiOnfF8aEE/sV1b2rMvhXONdH5eVwf/BieXC6fkPx8GmE8MVczpU8
	UNoe6HJPUADb+gtL6ClYG+GLfRCH98QTIfBbrQN6l9D1eWg2fcHnAr0hRTVk0IipSRESvQ4VO87
	ho4/CPtnro6aum/9VF8yDMiYjqXia95OkHRd4clyCpI3PFLknygVl31GbImVg==
X-Received: by 2002:a05:6a00:94f4:b0:880:cb95:aa7b with SMTP id d2e1a72fcca58-8874b5428e9mr1410325b3a.35.1790788343472;
        Wed, 30 Sep 2026 10:12:23 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:23 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 01/10] iio: adc: ti-ads1015: use DEFINE_RUNTIME_DEV_PM_OPS()
Date: Wed, 30 Sep 2026 22:41:55 +0530
Message-Id: <20260930171204.12863-2-architanant5@gmail.com>
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

