Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112978;
	b=LrWGu1dNNNOftFCe2sFWGrxBiI9sRKkIlDD2ZYSZ1/ZVd1zhHBQ1QrVrgefba7qAxKdy
	 49hPfjPVGlPabkaJ7Wpgh+WJQPi3GTv/RkCn9ZwNDle5/DPYd24NRozhb7P3d2F3w8CWD
	 /dpSFhbuuYZzBFQkdpIHnXyHx7XDZUAhRhkqFsyOAGVE0AHCnYp5o7EqqCxVHChtJNqEO
	 V/od5P4mkUxlBJPCg4mIBf5N3uhGANnaGolGWuZrPR2064KpLcFit3US6A82tOfkXLujw
	 kPPRskied6BhzhpGyrlNVSQgZ/ToD6VLWeH2/LPoEjyjjgPW2DhzXLOVFiJfm3zQPpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PsSbhhNXZiMOwAB3tEJHSwF7cxJu37qqiwKgqgPvUX4=;
	b=MUrDQYQ5pwtVkDQfifWPYPGdekHGPf74lLARvI/ghPm8om8VOKRA+L6dv618AAtqqJ/P
	 H8NbB1Cdy+kLHmjCV0i6ycl8fYRQZUoLWuazBOMcCE+ONAk9250es542YdYHi5YC+Wvrl
	 vuK30dnLsQj9lw+tlL0PFm7vCJZiH7unftjwpCrqDMBJycEG4u1tDT2FyXZkkuvCJkCnW
	 4n1wNkBc7AHX2wyfopUosJqdAivd2AUP0lW4yNo0wsZo3MBtkZlpkCTvv9ItpyWFoB8dJ
	 YKBzjeN+p+FGDSrfgUTOwFEvF8eBANFDHwdV3y4EDn0GhPWok+yNZwy3Vhtar3bvWIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZYXlSXyp;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4A606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D4A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZYXlSXyp
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso21964765e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112976; x=1793717776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsSbhhNXZiMOwAB3tEJHSwF7cxJu37qqiwKgqgPvUX4=;
        b=ZYXlSXypCzx6IpUlZ1AzcPUXFqYBKCOJduK78MIUFqlSB448NYs7cpVOZGB5w9gVTu
         xPSnPOlp4SnwOMW/4WSVdFqWxGvlnlMliDvimMo83YJBP/TlFT8VyDymWkQDwcmwaBvW
         nIVi+pr9u3t9Fo9YdrzFZvKtA2tm8Rg/yuDvjAj6ZNaDbEQxDdX4SI4/DjN5FllA4SXT
         /APkFk+5V5Exf+u83EyB5414vOsbv9jrzJjNljAVEW2GQa9qSWtYixfFJnh8Gftu4M12
         NDMs5YArC+rzgzstAkqgz0wVsinpJLDGvtGXBSFbQRauOwJx5rcXV2J/2qms04wvw6Rx
         5EAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112976; x=1793717776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PsSbhhNXZiMOwAB3tEJHSwF7cxJu37qqiwKgqgPvUX4=;
        b=2yuYjik95W287X0M9r2/xwMrmpxYEJy8alkrM6c5o9A8YLIxGC8iorLlG+aIrMTih1
         F9zDRaKseuFTHMfCc0i36x/gadVDlphkuy1Js4+v9TpxcngKwfVZFU1lr5oyxd7EMPtp
         hCZd74gkc0cQ04B+rU8biog/RU7CWQIAs6n7Uhagnbvvadk1zlI7nDcPNFxMHVchWCid
         MCrD0oTvU12MHkWU7whCKfCjfzQcLzs0N9w9z+2qpoD32CZce9NyhQORpD6EerL0Lcmb
         TyhLtixdMQpCXrZgUThC2FaQpgZZyf2mQ1GTMOx2h5aUdMUrEww12vrf4mZ/A/TGhYTR
         hVxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKnNifO54sztn/7/cfMH82hd3Nf8QsExHsQSjEpwVVR3qV39yEOM+E34Q597+hOm46PqNXBNCSOUsfj60=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3Ug2eP8g5l2yQfuxb3BtO+wifWump+0/h8iDh0NRLuab4bBi4
	2FoKUGae7Qa7ZYErKnjTCrOA6fTfDJK+BauiRHPno97C41QqXAowxDRiZ3LDwzV7Ee0=
X-Gm-Gg: AYBFou0TyPXNvgQVxekf9ZmJnqSAyr+6aYnyR5oDL8qkrP4kCoisiqOMH4TgyT3fz/f
	YYXESjCgK+64ZrIj7qziEPr+FzlkcclMuu2yWUFvz5aCuwjGWY3dME+SS3joS2vuhw8Ty1lRrfp
	8IhdGHzzqwuEC34/jfRP9S3O37xJxmEIKC99FLOWK6/W4+Lsffl1avIZlwHJJkG/GxNisv+ZlN+
	T14unOfm3eH1/At2qU38NaDyyugLGUtKHp5nHnoA6jn/3BHJllHjhwwmQnlMsnjDwZJtC3pRH92
	UICQUQJnF2y72w9qnUaf/3aRU+VpKyG7DLuSdHNg9CWxCvv/jYjQrDjhutthZFf4kWRmv+2JTHk
	kriwK/ortCNJeJ93L9XzJjjoXkamkn0rk7GzHSPLs7vR+KHpLJDZkZSg8/h6dsHto1yMfQxzSuH
	o/UfU2+hMTXzMQ9M4N+qknb112Y/Bqhj2Y2/Y8h2PmX+2+fdad+ntPNusBu9qfIbW/FM3D2eJer
	LdkgxiusF2x+L7v2/BYCWSjVZac3XfdNeydS3P4xXBsIKKEjvi9JXqi4M+M
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a35acbd3b3mr203785635e9.15.1793112976312;
        Tue, 27 Oct 2026 07:56:16 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:47 +0000
Subject: [PATCH 1/9] coresight: cpu-debug: Fix PM usage counter leak in
 debug_enable_func()
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
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-1-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

pm_runtime_get_sync() increments the usage counter even when it fails,
but the failing CPU isn't added to the rollback mask, so its reference
is never dropped. Use pm_runtime_resume_and_get() which drops the
reference itself on failure.

Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-2ff60e6d-33ac-4a69-9c62-63eb482f1913
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50ea..06e55dfa6b91 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -429,7 +429,7 @@ static int debug_enable_func(void)
 		if (!drvdata)
 			continue;
 
-		ret = pm_runtime_get_sync(drvdata->dev);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
 		if (ret < 0)
 			goto err;
 		else
@@ -440,7 +440,7 @@ static int debug_enable_func(void)
 
 err:
 	/*
-	 * If pm_runtime_get_sync() has failed, need rollback on
+	 * If pm_runtime_resume_and_get() has failed, need rollback on
 	 * all the other CPUs that have been enabled before that.
 	 */
 	for_each_cpu(cpu, &mask) {

-- 
2.43.0

