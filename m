Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112984;
	b=toPmMw0zwW0fYd/bJANxo47ywVult+KwthUZ7/5a/jKWE9sQvfD/R+tjqv2KeS+MGkO+
	 /zGZPPfgsmfl34nO5p8YFwFyg68zZAjAlXsmakly3Dx35StvtRl12G8h5w7YWIZFSpW2L
	 4O+PTtulY8ESityEJqh+92njFr0lTgX2ai3Li5vrPDMXwkzr+WM0a9ztFM5eId3mEfnyk
	 nYsvP9YzKEyaOpqJJk2EuwcK/KGIjd4FSLEn/yGvJa0pYnzzlOCgqaYpQnNGTi6CkjnUb
	 lpKqSaJI16MmnVnsLupY7ppAMq4ifAhnTQwZMIGtFjkebjCpeiLnuhh250m0n4fKbjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ezAyafs7itRFwZvi69GYT5lFoWwHTrJ2DQwxldT/WPc=;
	b=UfYIXyVNBIf4mP/11lqvecTGcgW66u1WOesAbIpoG7SPE3U3TsjcVbbn4ZDhXf8zDNXw
	 sOfAxfzdjevRRyckohM4JswrmRMeSWIpHvmlkfPyPxb8k/I2VQDY9gkV+2/Rz2TOr8Xj3
	 H/Lcd7ZZUS2LrunPRMt8hsHT/X45otlLP4+CrJcCe5OVxtXNKn1e0QK6HqMxVIFbHYONS
	 NAKpKYUNfqm6YByg5j4fMg7Pj93uuCZst6Fpoyo3yuOn0cECREonyfRDQXEVHSyUyHpkG
	 +m1809Hlb/al1Tanx2ELUtzS/JPIZWN/KU2b3vMUxS1gEmZv2RAOJsHvG9cIZPvqMZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p9Z+0tvh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6304606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6304606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p9Z+0tvh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so21208125e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112977; x=1793717777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezAyafs7itRFwZvi69GYT5lFoWwHTrJ2DQwxldT/WPc=;
        b=p9Z+0tvhgBfF4+yPLvmLqY3f6jg9XzUe9lXdofWWbEfNgHeMcz66PDIwfS51MF083A
         YJngemFeUXRPrONacEpwwAee+DtQlHK6ZycQFGzfGu5TLBRDS/00VYZTFr9ZHDeELEXo
         G7Cs7J1wsizt23Cj16Edvkd4B2+1NwGu+WPzoi+RjesxBAGlNm7UuRh3p0HRkeNLj/41
         b7R75cVLddnXAUC0DQteBE3zE65ZB+3qr7jyB4qi3HxvnGNfiYsAirbVm5z/yDuIQ/rR
         hjtd0XzmmUV83YqFy+tS7svUBqzUPgrrohewAHAYpI+fXUp0RA5IhgFzTKdn6GT2DDvC
         0IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112977; x=1793717777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezAyafs7itRFwZvi69GYT5lFoWwHTrJ2DQwxldT/WPc=;
        b=KGcI0guopivVbGb1750UT4XqdfmTc+20QR89/hKP3vvTwysHdT9qA/qlEeTitWXtZ+
         a9y65W0R+Qhgtr2kDysnOmZFkSXSifgVGa2MtZ9mFC3ppXeLHzEKCmmy46pYAmWjbEuZ
         8cn/QFDy+NCPIxYM/feYoeOiKGDKFKiw7QLaGgqnuNdj+vu6Ui9RMVRV3J39pwLMQbnb
         ylO9FXMVVGgYAADczFYdHA1FEpeQT9NMNKPCTDby9yLpr+EckUS/DogOIZoDPUTvZ0oN
         RF0q/0/vzSk6/7FJumdjIjel7S2y6Sjvmrlqv9B11kroj9MVJJ6CROc7uT+WzEyislWW
         DAEg==
X-Forwarded-Encrypted: i=1; AKwUvByPqGlrFL7qr56L9cBFrqmQUEdxUcUJvicG6BlqGLxF6XVmKguo6eYJB+1+m983VR/G34Dn0ua0O6AgQH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ2CnuNfYKq1YE1yMG4GZZGHxrYUD9M+bT9FfQEjtL+QM7y3Zq
	9AJJiXuOWqOYh6IdN/e4MG0a8nPLSQC+IJ+jaLhFbLSx6iSqNY3NyStO7jr1LDXLXH4=
X-Gm-Gg: AYBFou1ceTL6NGIM9jWXqNkKkguGJfWt9LbmPkwG+cCjZ8QfrEYWq9X+nEk/sx5rElk
	VUlVs17Gq/1vabU5YJQyAHjjNUtS8Ndjst8nAEvNm/vhh+Q3oXf+yMZu4UHlO67XSgwHKHw4GrI
	eMabLHbt+cYPK0e16tkCEUOeH8Qk1uQS+DVLMv7mfeZ9dwlpiv9Q0t+zu5/jUKfwKGH/cK3i8AE
	K4Edph7x223Kd766w0yo0ugtbjzPC7cw4x9CQdbSHc9pk6nEGfTuUITbbzkMcfOvFwD+wlU3uP/
	nVvPm/MpqZh2PGQEbx+a9RXp2tgKD8Ny7bwBJlhgHagZu3OFW5nNPrxO398j7rk2+7hA+uuRVL8
	tpBnG7AgSgv+jg+41+UTUn6Rv3/NFu1dSap11KtYr9sFhHQAAt3/upZ45iQAyQbOkDaKkmVFIz/
	9zE0VyB3vKIkJRPsnzxJIpSQNCWL0M6NLLyJXssZlGtpKyswLhvNbShlAzoMk/H+evjyBfDN4KT
	Q/x8hWF0xFR3LZFESJhmhljxD2lkTYCP4gs+j4Rzt4BlemBUy5hHKWtzMKU
X-Received: by 2002:a05:600c:190b:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4a50d0b6418mr158726105e9.33.1793112977200;
        Tue, 27 Oct 2026 07:56:17 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:16 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:48 +0000
Subject: [PATCH 2/9] coresight: etm4x: Remove perf symlink if config
 registration fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-2-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

If etm4_cscfg_register() fails, the perf symlink created just before it
is left behind in the etm_pmu device's directory. Remove it in the same
way as etm4_remove_dev() does.

Fixes: 810ac401db1f ("coresight: etm4x: Add complex configuration handlers to etmv4")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-5a385158-37fb-48f1-a8c7-28e86e07848a
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e21be6468e95..ba21fe12870b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2258,6 +2258,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	/* register with config infrastructure & load any current features */
 	ret = etm4_cscfg_register(drvdata->csdev);
 	if (ret) {
+		etm_perf_symlink(drvdata->csdev, false);
 		coresight_unregister(drvdata->csdev);
 		return ret;
 	}

-- 
2.43.0

