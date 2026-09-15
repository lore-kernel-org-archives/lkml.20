Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9414471256
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463971; cv=none; b=ZH4YCbvC68uUuZ27zKigCsJkm7Tb7EooM7H9PrdcEAPBFTPNsRiPiIztt5LbXssUIgdvk7ySLngj9ffql4KMaUc8qJMI3gKQZF/9bq91bBIpPAQL8nX2pOmkFIdwxHGDNe+rXFo34lfvOYVimqWsCQtEUo0Woz5OGD60VNIn7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463971; c=relaxed/simple;
	bh=yR9/9jmOYrw9BkSWnvr9dsgqtfwkWWF6kfOLtcUgH7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSpX4BfA15whWqtWtYqz0Oi5P2Kz2jl7znHkAqzEhsmvVI7J3aDMR0oa9zUoO0gfD/1JqrCq0f02FH6/v15IrQ3C5zMOhnSCkzAre/G7Gwisdxn1K68TnZuMz2nAoAvK1STENq2EfVRcEq3MS/vQZ5xlWu28LLkBtj5MqBr9Drw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zs9tby6I; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zs9tby6I"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd77300825so6767245ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463969; x=1790068769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y528OrSbj93HX4zcN9psHnDR/XcS5BvWj6WzY8qNcW0=;
        b=Zs9tby6ILPPYt8GaqEfE8QACWMFUkMmU7AVjm7zfmZE9By+XbdJvV4QdVtehftpwSo
         3e/D5Ha7p2bQeJTokpJRFXvXzJ0vn8P/eSqG9Kqtn2jAbYbAaPWGjwdyJq+hTcoYn1WH
         h6uRa6S1etlxBIFtuzk6dmyHbBekaQ65OcAUsDiMYdhNBP08Vq/ZsrfN66e6N+/bbkJI
         h2fovdr+H5Uu+zPclIAjKzHUgnPAodQpdjZ6xcH5QayfITo2oq5QghGV5Y9lxWLHACeP
         2dIJyfqqqgsoS2RzLqa8gJOEAymX/Tg2SwA7N007UYaQVd5IBXl5fLC2Fp2CTZjt5ceK
         2Yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463969; x=1790068769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y528OrSbj93HX4zcN9psHnDR/XcS5BvWj6WzY8qNcW0=;
        b=O+HJnq12hRDGipOe19XJmHLLW+Ifg8TY47tmuozxgrF8OTUJ7tOPKHYmiXaG0ROEVy
         rOgB2l9/5mwltIwb4TYkgJNXM/Jemzyy2OL6PkcgC4hYY+Vsw+k7HAotuDHc14bQzfun
         lXfYb/ikBWyMPlL9oPm8BcTpA34JCwreyDSo4m1oa4Gnv+Z1RWH0PjE1BsCsakymzm32
         wg5fKT1WTBMelaDUKdB41ffk6IiDwA55ctrnXnvkLhgBoCbrjObFBJ0NsnxX7nJAC1EW
         dx6yMbA4JiLvVXmJkNO4JX5pXvOTR+WzS2gVXGufT8buKK7d8oP/mWvYqjCNXWtM1+y/
         8qMA==
X-Forwarded-Encrypted: i=1; AKwUvBy/R6DX1XGsVCNDA3BkEdLKLxc5xvsOsg6l+1OpGjY/pBssgmYk95640mCJ+kb0uNOfaEc+HA1U3aRt/Yw=@vger.kernel.org
X-Gm-Message-State: AFuF++mUp1+a+OexfyYhFs/qn7Tlf+580ialdZvq/WR5/bSqEObCZc1T
	teKdueU1f4ABA93KhNyDhifQdkcVZnMBa7DOx2tUTjTRfY/0K/3fTcmt
X-Gm-Gg: AYBFou1u3F0G4sVUhaAHzSodZD0ijS8UZ75lxU8d8+nHe5vchYNRh/bSkGom0TP38+d
	7P5+zWlGzEgJodBhl51BjHFGsFOQ+uebnDw5As7SIP7SLGFwGYcnDOJGugkE5waTAhJjUddZCga
	bmLqtU3ilfxsr7zdTCYj7bLHMm9HNaZdf9BZcxN9RoEGHSbRdKMgIJeQJ2zAc2ArICwj6fbvuq4
	nLlzoUpAEiPMUcUXxkEGC07s2k/bC/79uga1j+lRJ0plbu8xkypfipRcKRf93MkBjVkj27EGZlr
	kfdaIAUIXIa6jxgc6QdlkMnp7QO5Lp5Bop7bWKImSMGCAypV4HVnVqF2M7WCsRJIxzWfpMsr+I8
	FYEFLdsFA3juTfFKdimsGrcqEDKT3lR5A91TVHktJ3HkEnFDgdoREBs1CIEKsHYP2O37xe31Kt/
	gOeeVjrr8Mu/RsWxtYsD7HhHnw9Z6wiOvBVeYfr5KHTf7SQAhSSwVSAQ==
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr113945775ad.13.1789463968869;
        Tue, 15 Sep 2026 02:19:28 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd7b208a81sm7212445ad.0.2026.09.15.02.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:19:28 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Kate Hsuan <hpa@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: i2c: t4ka3: drop unmatched runtime PM put
Date: Tue, 15 Sep 2026 17:19:20 +0800
Message-ID: <20260915091920.2349128-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

t4ka3_probe() marks the device runtime active and enables runtime PM,
but does not increment the runtime PM usage counter. Nevertheless, the
probe failure path calls pm_runtime_put_noidle(), which has no matching
runtime PM get operation.

pm_runtime_put_noidle() currently does not decrement usage_count when
it is already zero, so the call is ineffective. Remove the unmatched
put to keep the runtime PM reference handling balanced and avoid
misleading cleanup code.

This issue was found by manual code inspection.

Fixes: fd55319692151 ("media: Add t4ka3 camera sensor driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/t4ka3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
index a5a68e3fbec2..bf48a56f5a91 100644
--- a/drivers/media/i2c/t4ka3.c
+++ b/drivers/media/i2c/t4ka3.c
@@ -1034,7 +1034,6 @@ static int t4ka3_probe(struct i2c_client *client)
 
 err_pm_disable:
 	pm_runtime_disable(&client->dev);
-	pm_runtime_put_noidle(&client->dev);
 	t4ka3_pm_suspend(&client->dev);
 
 	return ret;
-- 
2.43.0

