Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112992;
	b=T7qdsn5vYYFej+ga+YEAHMdFmSfwLEQ/OiPG3H4w5QbXEp9/anaRWG/yXMkJERIHHFSj
	 mZIyOBfo72lJ+IN9uz+8+4id8NquX8N6EweFf2klVbmS2S+YXSn7EWvkF+n64CIwbeEgj
	 gvN8qhIAyzD1aWophDUYlMmZXmgoc247707hb1zbmqdQ94A8PPQH6COYc/dY5JEpTJASs
	 YemBgRuWLc9+tNwpnwXsMzNqg1jbsJs1zVlmiF6RVcA+/w2uEwiE39jEdLETBVSXOEMDU
	 OmjUxKuE/XXRNBSvMrcIGy5iFJQg9upLGNGmi8bTWmbfmYFhnv6EVax+Ilssgy9fWaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=u1dD9kKTSvQydGIkIP8wNeoMYn3abPERgC1itA5uKVk=;
	b=N36FDtBarBvbDo/8FpfQL8EUljEil9ZnXGDKmlTIxrkLWs51Qj44t6wH5hWR9BrQPUmP
	 5uwUIjqJP4T7/w49LIz0S9nFtKaHeL/s7PLbGyhcsoSJm0PXO2l2yNFOv8wJrh+/LcYf7
	 FWyg2RjiiB9CvIo2jJXrDENxGX+VOzmTgPmNaijPLRHuP6dIyMJibr38SzK6JQND44IpA
	 H7CXRkKMHb+ML9hX2Elo20fAHRcNXk0jq3/DgvSf60erL6UGv6qkM7eShKenK8UHJPiYZ
	 rXLcFsuTODEyTYEZj/sW0YtAXDVZevgllVtdrGNeCmcR+And0Msk9QKR9el9fZFUeYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Zt7xVYh/";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C5D606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C5D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Zt7xVYh/
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so27268555e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112980; x=1793717780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u1dD9kKTSvQydGIkIP8wNeoMYn3abPERgC1itA5uKVk=;
        b=Zt7xVYh/6RPLx3K9G+46Ds3mczTrIFOD+unyxhWrSNVhSA5q4/72XC40TecYu1oArr
         p1AjHyCl0bl2yUcnZlr0hs+C0CihP3ND0pTfG2zQNGDdtC1M9HT9jXjs0Ua4bFxQ1c/P
         5YN/7kdhIQ1sy/zFG8ziSTbcsuSutRGdDNXSmh3aGcPZbjj+XE/yzVGC0mv3FdEr2N5d
         Y9SJrWfikQfPaJPuMnAsjqQYj1rcFwT0FZOsZG0i1HJW/blxYfxTFfdAdQBFJ7TVz8dW
         jUHz6XbEvRxNO5aAM8xMfgyae7ORyEw7BVtXei47eAX/B1kKIPkcC9FmNrC+7/n7RZ8H
         aeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112980; x=1793717780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1dD9kKTSvQydGIkIP8wNeoMYn3abPERgC1itA5uKVk=;
        b=DpRh6ZnxLOCnfCy4YJggOL2Dxf4KB2+tAfx3WZfU52c1jkb6BKmEogq0Bv0+HB/J9b
         B31FLh/Nh5VYOrKR78u9dYsuzYnYrsLmparEqRivkpg3SFhoZgf7EBikeWFaK7m/jXu4
         8vto5fpjYOM+T1P9Tr2hC19iZTYTY1wdhxOTALvP6/kGheN2l7hoi3BpjonQbUB2gMyY
         8V8pmVOyR976Io8ZcyhqGw2YYk1zchVDCb5XhHrMB10jdGyMhfFXDZDNPZ04QzvEteWQ
         wcsEhH9WVMZ41+gAGr2FBdsOH7PaoiX3Fv7spyPnkSlZpZCxCEy+ZNEJjUEEh4gxTkjx
         Jafg==
X-Forwarded-Encrypted: i=1; AKwUvBwmilOnnc006D+2ZrQ3TSv+Z1NsYqivArNYZvsN7kgIm9z95eJeqqlyQcvq0NzT47lJwTyWcOqixm0oSaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd/COWagDYO2KGb7/6hf/6KiEjPhx6REyJ1WLoWwmx4gbQtvZB
	dMC7YFp1sgRazfMc3AljgtT/r/M9bNHgFrnbXyf+C6TvJTUBh1FPE2jRWWGHv2BuvPA=
X-Gm-Gg: AYBFou2YW3ak6Kr3hEZGMzxBN3VcCIyILhWt/ii1BiCGq+Uc4BRdJO8appwuuCnXqBB
	Tk2GDx3qxzSv4dNGdYFEtiket3zGDFUIo92xfCa7YS3pGasht3k92QCi44LONAY56e/aufdZK7j
	M74cfGCAxeMgTT2o4GjtX0NS7sce7pM1PtGQ5O9dUxpPZryhqXm6rZZdW8fcrlexXUCSHX1MwDf
	C3FxRbW/HHg2nGYqSkwPVg54Htb//QfMXr7Cp33WF8MVQduR67gjn7J0qaef/fTrvJnZNWuW/Al
	Pi1F9ygMn2so/2+9fLV0o5mMvI03FYEqhaCdyLCfA1eeQSpYKQ2NtrjnwB9FNBHOixgMgcHXpy3
	HbiPzeHDRvCeQK0Z/4MtNy3yFfHSLgUQXZXHueTduK/9F7ZS6Q0uCTHerc1ccx6tdoHNOxC6tdQ
	Q+O1pyEhVyxhTGV3xRhmuLLHEmFzFmvNldfwzf8n5XsJOy7aQ3eQktd1ifB7ihm9+iebxSze6ig
	mUgkH224nM6IlrWGdMGVMl6qsGUgq7yAYlNA2COluk6EK8C94eu42gLlk0=
X-Received: by 2002:a05:600c:4445:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4a8b8b4623cmr28880515e9.28.1793112980006;
        Tue, 27 Oct 2026 07:56:20 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:51 +0000
Subject: [PATCH 5/9] coresight: syscfg: Take csdev lock when removing owned
 features
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
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-5-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
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
index 7e3c9844bc00..f93150a1bee4 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -415,6 +415,8 @@ static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, vo
 	if (list_empty(&csdev->feature_csdev_list))
 		return;
 
+	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+
 	list_for_each_entry_safe(feat_csdev, tmp, &csdev->feature_csdev_list, node) {
 		if (feat_csdev->feat_desc->load_owner == load_owner)
 			list_del(&feat_csdev->node);

-- 
2.43.0

