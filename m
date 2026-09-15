Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051433C988D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459516; cv=none; b=Kzsiy7rdLMactduRf15QYhx4XSkgqiO/BR0EDb7U7vCcU7hV5DqET0GY9t4H9IDgwpBlsO5zDBq4o36VC6mU6xi5OnoWSqRzRP8sjtf73OSLdbjBh8b/CsARqPQzbsTbgjo4UEKGUougTFl08EzIJZskfRvEwSw9wvvfra9IiJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459516; c=relaxed/simple;
	bh=oZ0N0PsuEqbDomR5sP8cO8KR7NnXA59aOg2GPCnVdzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DmYE5BWgXS+LYHs+7INUlQ6s8kzDE0w7McL5d0i6bTzr/7aZD7ZvG9h/SCv/Za7tmc4CyQlhxiHkxNMsf9xVFM4O8YphOuhgzO5MnaqCBx32Pk40m7fevLaztNX5mafTyGsIuqsCuNsirqhQdBBBhMydZhz+7F7JAPRh07+1798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvUHXw09; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvUHXw09"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so996707a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459513; x=1790064313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8oXVOqLbDDmDiQXcRbmwevDgD4MKWOik8Fi0EZ/eGXA=;
        b=YvUHXw097GpnOeKx3RqOvXwHCDuOFBisU2oZR8wSUAlVg587FR5RKspun6BYboviEE
         JJWC8Xl3JaAoNWvSFokP4axbLJ3T5W0lojiJku32hZen8xx0MIzsgYD91x/zaOuUXri2
         AygA/0kn6SgQVCrUtNpq8KGevX+FuAv2Y4pSwwJxDc4h6YVyH2y4T7iVHjv9a0LfN13i
         Wj7R3U00jJaeOhnhFPeMAR3O6WrWc13Y2N9zg3KMgajXP4pe1bD2YX/ngwaMPcJJldya
         RNRqh5ZbVnlSCtGPyGNH21tvL+8cflMvBD05v2t9Sj9ceYgqTEmaVosiyfY9829iWW7/
         Ocog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459513; x=1790064313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oXVOqLbDDmDiQXcRbmwevDgD4MKWOik8Fi0EZ/eGXA=;
        b=s4rTtWW2BiHWYdKa+SerFlx/FOPPxElUJETILHN3yK6mWJ7Y0E2UteVSHDgHTmRvFL
         kHztohBNChSArPsYnrqVMlDZjpn9PDOe92YInq078a9bfHlYG6GqIfIRczpLgEkPbbZ9
         fZ28415WVeKqP1ks3KGujGYivP9PhrHWghuWJrurl3ymt1iAPsg4xs//AbRdSJdAcPcW
         EVCNaTeGctEArj9ncZmEdkBcPJ5xqhhncNVh6YBWtXweVrZWEkrL7DD/54H0mcOVWF+Y
         Nmsi817aj6OitsRaezHx874UicOHeIy4/aZfvNyd4XOeBmO5UfcO7AO932WAbE1WzABM
         Zf/g==
X-Forwarded-Encrypted: i=1; AKwUvBx2j4ievsIh1rD3Yujfr2IqUwCr4tVaM33FmtqdPWE1lMNNr3/u5HuzT7IKs1aOozO6sBtUpqCbCFL5qDg=@vger.kernel.org
X-Gm-Message-State: AFuF++ldf7ZrazhRcnqaxpD+9KkcQXiWptoulgOg+cGmXzLqpLxSYd0u
	NHUAgTdUev1ccfOJAqVRWyVEoW+GKkpto0iK0XE+pVgaA+lSxgVUAoqW
X-Gm-Gg: AYBFou1JQO3REzaaZAP6K1qgfdnivJ/raXRsjRaU6bmQX23XH8nAwgxQXUm8GUbJkBz
	FgagDR6GXgcSgSH5Q13qBKVErBIU0keat7nky9iuzf39WkHOq87wSP/+4JuxUQvbwOtARUvQyrp
	ntPycLu8lzaOMFW+9Cq5DDO0a5bRINcd7sRJnEGX0S2I5vb24FOJSMyLBH8+Ex1i9qFmjEJXtbw
	xopDv6sMQj7ComSmNOtdlT4l5priJv/mA/rdVDVUkvSeeXVgpH2P3CiJ4YG3mUHTDiyBKbwJKg2
	DKBBaDQvtKJflQyQKdhF21KLQdEV36/Q3x8pLaGQ5hJEdtnPbS52boXi8NXTnq7w3VKL/Kx4YM4
	zO77zxzExSTVZcq0wF660cvS03QYbinZvgCQFIxf3zWXxoeOz9cODaZLELIB9b53fwCpTfEpSR6
	xRuNTcfFs5xR/WkyiXOKZm1QMIRJBX4md20I6Lm7dTWYXvMw0xu6pv1g==
X-Received: by 2002:a17:90b:314c:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-39dfe1901e4mr2977305a91.16.1789459513101;
        Tue, 15 Sep 2026 01:05:13 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfddc2759sm3727034a91.17.2026.09.15.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:12 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: gc0308: drop runtime PM reference after probe
Date: Tue, 15 Sep 2026 16:05:01 +0800
Message-ID: <20260915080501.2164892-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gc0308_probe() powers the sensor manually and takes a runtime PM
reference with pm_runtime_get_noresume() before enabling runtime PM and
autosuspend.

The probe error path correctly drops this reference with
pm_runtime_put_noidle(), but the successful probe path never releases
it. As a result, the runtime PM usage count remains non-zero for the
entire lifetime of the bound driver, preventing the sensor from
runtime-suspending when idle.

Drop the initial runtime PM reference with
pm_runtime_put_autosuspend() after the V4L2 subdevice has been
successfully registered. This allows the usage count to reach zero and
the sensor to enter runtime suspend after the configured autosuspend
delay.

This issue was found by manual code inspection.

Fixes: 3ae52083b533 ("media: i2c: gc0308: new driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/gc0308.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/gc0308.c b/drivers/media/i2c/gc0308.c
index 15900d5414cf..266f737f9c5d 100644
--- a/drivers/media/i2c/gc0308.c
+++ b/drivers/media/i2c/gc0308.c
@@ -1385,6 +1385,7 @@ static int gc0308_probe(struct i2c_client *client)
 		dev_err_probe(dev, ret, "failed to register v4l subdev\n");
 		goto fail_rpm;
 	}
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
-- 
2.43.0

