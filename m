Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7490B47D931
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466198; cv=none; b=q9efd9EYzHSfdmkiyNiuPfzUQizJRLBhOt+YEcYPphRJatrbKRz03KFElAu282trr707ye4gwzEU2Ho+MqhaUCLULQPeeleUz4cJrNSEF527rzXsgL1BkY/5wDz9Ja3s3Ema5bUfIttPx1NZ16a2YK8o2NDDdzKCMBQjqEKSEmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466198; c=relaxed/simple;
	bh=0ldLI0jIdMK8AiSGipfQlJFMXUeME3rzoXRpb5rfrmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kvtuyigx1kMfSaAZsPzwPRtXns6DEpDUY7YYt+X+/j89aoUlDxsSJbIu6XljcSVUiW73WUlNRE3va6eU/FXjqXu1N3Hdh27noJhLX1c5pCagPYQDnZFZmBQ4gWPIAYgnNHAI+SyM4D5JlakGGrPmZOhgdrUIIxFaoe+whALVKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bEm6i+h7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bEm6i+h7"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso54316a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789466194; x=1790070994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvp3AKdBFRuYXKGE5C8H1XVVcyDgnt4wpE1IB5bJa88=;
        b=bEm6i+h7blKf6wpQSvFMiBTrEG4i1jhAxD194Vdo0qpjTukmqypChECy1GenGBDr6/
         xr71Ucb3OSMciAny1RgksWs6js5dmWdUK+K1YIQkwlwp/D4pf2Ll7/akVCs6UKIFdRZE
         TIOXv8Opabz9obRFw8ItLuRfO1e4agkSglI9UhRjDArhv4kJp0a2W0Ck3W8RySEOXUdF
         BYyh5MQbU/qIgIo3L6TX242XzDyQE59R20nqhf5tIeIbD3kFx4TH12TqaGTlFCAguSUc
         pM0rLSETAt2noGH84EmkPDZfEjv41DAp+3hGXhgF2qPai7XESt2x2eSMW14J7wZiMKVD
         8hYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466194; x=1790070994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvp3AKdBFRuYXKGE5C8H1XVVcyDgnt4wpE1IB5bJa88=;
        b=YP1NJl7zq5p4ovBuox+MdzLNv8Wch6nIVojEca8KdURZmiUOoZvbtjhv7RZR6P5PiH
         pUXy8sS1GslwbRyaGpQ8DNUyKF5GEXNVc2rw7L3JynmXDZqI9B+JqZXlPP4mC9P3NN60
         DW5u3qh4aWidCIfbGl93mPc2VkAqsy6ex0uKKkBIRvBjsOVxwWxyG5Jfo3VKrybGCYLc
         hprl5zronrDsB1KTjSxKfemV6YZk/Do6Gu5hXKo7IcJ2SINUEgZojlKmY7ezrQOnxVlX
         uN/vGdsK56621gpq3BQeZeZarnOHe9pjs18Yk2matRnfa2C6FtVRe/HDdOOBeFkj9HKS
         muRg==
X-Forwarded-Encrypted: i=1; AKwUvBxhW7sTFkFo0IUxAQFtDdGH2kt5VLdnyWdoJgt1S7CBBVL0h2dmGtAbosvlW+ZtIBS0q+BLUdmU3RKt1I8=@vger.kernel.org
X-Gm-Message-State: AFuF++kwnqXQ2ZOjLlLb/GMEPQWQlFBmExx5VZOb1YS6snyYPcP9eAr3
	asUQMuK+rPmcLORtT+I3ddJKIa12A6PuT9S4KPtIeKIttl70TLoirY86yBSQZtQtWmQ=
X-Gm-Gg: AYBFou3M+YLl2YNKUG+qbLC7cEvOMRBd+tr/nrKlf8k3s7I9mFVin8FQlgtXPtBaSNZ
	jgyW3am/MMw5yqR7C65Ntg1nYwVeinIrh8/VKU+Zn18aYhjoiztOUOZ4gTO9w7rkzX2mmp1FEba
	n/uNztS2stXEJHgScYsZKwc22oabOHq2O6msy90tQdkz+xX5Yfype+F96aqze9GofJsOLsrnY5O
	yG1BkAzfJpexpahrvgmnYeRq3wuANuyYUiOWU9HqSIu6g5QnGkcC02l/UK7RAQ+uaREgIUS+vsD
	h0RliGbjh06mpU1aIgom8OqrALCI8coYOz7I//7EEsqhRRSDrudiyibnJ91QQNb1UhcXLoHA2/s
	nQzrM9ly8FisS4w0RnfM3pbI0cJJ+17DSq0qZVbAKvhvLty0RXyrYuEnAwfr1bFwosriHUym0+x
	04O7ImkHzrHVQ2HQ1t4a9OShNg95sfgHIUIDeUdj5vV49+SXueTVRoEw0woRqwMBCu3VJ8gjl9W
	6pJp+ecPwvbLaaozjkx
X-Received: by 2002:a17:90b:2c8f:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39e1107004emr273952a91.21.1789466193983;
        Tue, 15 Sep 2026 02:56:33 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6b9687sm4477827a91.0.2026.09.15.02.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:56:33 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH 2/2] dax/bus: fix mapping attribute error reporting
Date: Tue, 15 Sep 2026 17:56:21 +0800
Message-ID: <20260915095621.3744167-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915095621.3744167-1-songmuchun@bytedance.com>
References: <20260915095621.3744167-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the DAX configuration locking was converted to rwsems, successful
lock acquisition leaves rc set to zero in mapping_store(). If the requested
range size is misaligned, the allocation is skipped and the zero rc is
converted to len. The sysfs write therefore reports success without
allocating the requested range.

Call alloc_dev_dax_range() unconditionally and let its full range
validation return -EINVAL for a misaligned start or size.

Fixes: c05ae9d85b47 ("dax/bus.c: replace driver-core lock usage by a local rwsem")
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/dax/bus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 54e4bbc98218..f232001ff5b7 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1276,8 +1276,7 @@ static ssize_t mapping_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	to_alloc = range_len(&r);
-	if (size_is_aligned(dev_dax, to_alloc))
-		rc = alloc_dev_dax_range(dev_dax, r.start, to_alloc);
+	rc = alloc_dev_dax_range(dev_dax, r.start, to_alloc);
 	up_write(&dax_dev_rwsem);
 	up_write(&dax_region_rwsem);
 
-- 
2.54.0

