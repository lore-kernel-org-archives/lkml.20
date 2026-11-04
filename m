Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806623;
	b=asTNVYwnvMwOzZ6n/DhkiMB2jPSCthj2N6ekYFsrzfxpmK4VKMc2w4Oo85na5RKq7Wdq
	 HWkCxfwteYith60qAeXj3HscOLlm37fZbo+m/+BkgoWOp0dNvJKwSTBo3mAWTjMfvRTh3
	 hqfxWl5+TS/WHgDw3nivYVtozpU1Efpcesq2jBdPOgD0uI7a7tZ+jm3qc3CgzNPlDotUx
	 Wpf5IAIQT3EARjIaMoS0ThPl7oMMrOhWM5O/XfAAcMx+EHHT6B/s5Mzf7p0bQrPzUXm2J
	 jfsZ9DZlisSRenkWEPtQyYNN8o9rqIR1jbdrXGrqPVf2WuK/EtEaYRlKVzJPr6WnIQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=a0ilhJvVm2FSOwYK7E6cSJolJc/7hz1P4Y4Qcsu9YT4=;
	b=S9mXC3ibrdy7snBv2P/ysuadvDds5M3DkJ8SJ/S5IPZDGCL4t90vEx22zcRtpba3Lrdr
	 DFQkV/awgXcgb28Z/JaT/x6fA4HmTSiJkCuBPWOMMvDnFjxLNIf4uOEUeEE/CgeYy44FX
	 ly+s+2SeSg4OxpCSbt6W0YMmL/lROc2I3TRn+LHfnwHUTud3oqUNuSInRI1zWTYYhrsjV
	 NztWb9863UgYFCzH+fXRoLpOuYs1jHf403KKgiW6cwDivHQEEGxych9HO3EUC/UmsVYi0
	 6t3o5nPVocRnOvLCrXOrrDOyVRZkION1bbqr6hc6LsMqJ2IsU3hXVubEbdidDUkn5Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xAIO0KvJ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B155B606EE90
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B155B606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xAIO0KvJ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso7652115e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806621; x=1794411421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0ilhJvVm2FSOwYK7E6cSJolJc/7hz1P4Y4Qcsu9YT4=;
        b=xAIO0KvJWm88JK7VmzFdTGc9u+GiLeNLn222QlK0kVmHTc2YavaIVTkZnazUQIe9++
         gZHp1ELrOveZ9rJ7yPfx3i2TqUWA0wK0QzljKdQ/1VgByRr4KTof7t7loSN4XRUOKtYY
         9E2J8c81hzAHsYlhDdWeqEkZWmgycFJcEWUueY5VB4cGkAq40SOH1BnL/EbUS+Ldidqw
         bf996XCT4v03QaxTfvrEE3poJH+TigXmL8zlogKVMGr2gDyf9YMXAbjU06zVF+oflnZ4
         nseYyroMlOXSALptxqHU1pvHanLGCtn+R+mP38FP3PL2YetDN677BhNaq4NkFNPh88yG
         xspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806621; x=1794411421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0ilhJvVm2FSOwYK7E6cSJolJc/7hz1P4Y4Qcsu9YT4=;
        b=MiGWRTCVdj0XG44MXdp2YsrMvji+BTLwSXHnQp1/0iQdlMpobTpR1HCS0bo8eqPSlM
         6YYQYc1CiA4OlMMSilM+HhV0x0euNIvxmlJvhl2toDPF582AfFn3W2h/wtpUJBXaTqDB
         K1gcnqbJkULQ5uefQh0Dj1vSuztN5B1V4/Pd/aVfIx3JbHRHIGroc9pLUjexH5r55LxL
         dzuJJS1Sw1tQaknbIFxa4hqGbvKxOfz+ZBNzWR8JqEBqU2q8qR58gpX6kueUtaAZ/8+N
         h3Advz61miBmySrpi97pes1tRGmm8TP8u1B/1NMZO43yTLVehYFNHqijLFwAewqPQ2X/
         AwcA==
X-Forwarded-Encrypted: i=1; AKwUvByiHdi478WohzTQt6limbeA3CKo3fqWb//3b3HhInOL0XyJTWRWHwE4M6Z1rghdIjpC91oeS//lOLDsAhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ipQKp9eb6lxYOr8Xe/f3ti3ZIyqMr58i1ke1kS6RAPf0UAgj8
	M0gqMB1hUc86ScJZw7hmoQxyEboRjRNuvE9d+A+RGGgA5/zAXnnur6+24EHephamdndw37/zrtS
	HZc4sgz8=
X-Gm-Gg: AYBFou0uS7JMzfT4j2YIGHv5u8uG/7UxzkT+sM9EUu3VmrJvz1qFq5VS9wzeLjWyuZq
	XogUn+yq21GUBv8zNVzNVsgqQAlFoz5xRhEPJ78xldVkwZSp2jxy/4GBnaw1qzKDMrprIvT335c
	mV4plGw3gv03fFUY7kWZwFXV/uKqgZcDnJX9riof0euLiMq90eI8aJ59Q6cxuZTKNLb2kLNW+27
	TQQS6EDU7qakx8s+cpq8U2cQQNVWB9hn+jim9uhZvw3zysNtYMA1szC6krDpGWzUVoWIHBOFsOW
	PsMvFqpNo1IwBiZ1eJT1De0G0JRe7gxcKp3Qac53aEasgKSgWvDmNtnn+TPKeFamXY2CuvfEDvC
	xF4A7VaxEelaoZ/bxmpyCufFPk/0Hzoam+9OFulLPlF3IJqQVPELyy9w4cX8IKV0w526SQtZPmz
	MFTioNKnLbI9BblplM9BjH9/Vso8f5KlcqAJSC5wAI/a1MwYLQFriEQo9RoDBIEuYvgOtXiQkrj
	ZZbC5kfNVyRsqtZCv87yvuMQPVrFabDIly52EsZlHHMYB6TzQM2zQ+TNup0Ij7xj8eSYNN9821l
	8EXfEjhRdjuoH8q8vGoAcKNmXyIP2r1EMOwU1L9NK+2ni3neTyb9gA==
X-Received: by 2002:a05:600c:4e48:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4ac183d16eemr356314645e9.23.1793806620858;
        Wed, 04 Nov 2026 07:37:00 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:00 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:36 +0000
Subject: [PATCH v2 5/9] coresight: syscfg: Take csdev lock when removing
 owned features
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
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-5-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

cscfg_remove_owned_csdev_features() modifies csdev->feature_csdev_list
without holding csdev->cscfg_csdev_lock, but other users of the list
like cscfg_csdev_reset_feats() take it. Take the lock in the same way
as cscfg_remove_owned_csdev_configs() already does for the config list.

Fixes: 02bd588e12df ("coresight: configuration: Update API to permit dynamic load/unload")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-6bcce2f2-5aba-40a4-8946-4d843ec84683
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..8d18cd2aa347 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -410,6 +410,8 @@ static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, vo
 	if (list_empty(&csdev->feature_csdev_list))
 		return;
 
+	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+
 	list_for_each_entry_safe(feat_csdev, tmp, &csdev->feature_csdev_list, node) {
 		if (feat_csdev->feat_desc->load_owner == load_owner)
 			list_del(&feat_csdev->node);

-- 
2.43.0

