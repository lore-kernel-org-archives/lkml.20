Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C883932D3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125884; cv=none; b=ErlOhz+gwI3fcnFKD5Y1nmaAOcU03pw+G5FhG22+zcRyty2mOyRZCBsvIWNtN9CaWlAbCaHNQoiVgCdrsU9JZJL/ERyKBcdgI60wYqrzUFFCenCQqBrcQ1IhIW/noeE5JPx+RSuziYI7QvFEb8XwjwiINs8zSKONZ/jR6MjXrTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125884; c=relaxed/simple;
	bh=RHYtUzD64UUQO0I5Gujz3c30bA6fMFthjuPZDuvoyFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dqfs1PzivOGLksUWlPRuKv8QZwWdpYU9T2qIQxfK4d4jXCFumCz7Gwz8XAA3aYD9G90Dvz+VCmvNkKSc0Mn2OnezrmmTPCvGIayUQwXadzAZrieIBE771BozZa7oSry9O5p1/HzICjlVKkF/LDmXMiBJiQhgu9gmU1Db7l/IMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l9Gldqxr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l9Gldqxr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so32708965ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125883; x=1792730683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSllIrSwa3+mZd7MmtH8oNKCmldtJhE3Jr9UEV+PDik=;
        b=l9GldqxrhLSMLkuX9enrASy9vOrPUAXP4Z/MxXFCHL83XMxDITl9fzqL/G1FfkaacT
         bC/+Aew/oUlSfOLRyuDdF650Bp9y6cIT8Zj6T8bcOQO35nfCZ+5chzRYAX/V7CLAM7X4
         ey+uuL/GdIyCz5gNMeWOYapAgBHrFPmzazJbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125883; x=1792730683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSllIrSwa3+mZd7MmtH8oNKCmldtJhE3Jr9UEV+PDik=;
        b=YIr1yAmgwUTr1qlZl4Hef9w38ME6yPtyBZNbVtiz3SrDB/TyZKmPbzQ4XRqCGU5bxa
         T2Ojf322ge09WcIscrYubG82w76LwWO5kkVXuqQgfrEfxeyUfhsruBwzbz6FH5fqBVTo
         cgLz4kAk8rr2nHJE83O/4fb5Umm9YlUorbnN3Umb+kit5MYeHoo1X7s03jUK4H40tI2M
         HhKIyrwooFUZlVxaM6Kkwrn1UWlVjz/ViMmJ3xb+xfTKrHHga6m2GSgyre04cr4rV8Z2
         Je2y7+qNY2ah2iwMaNK+ZqWk1/dshFGrM6eFkKpRDTbQbGIV7aIftSDqqzvYZjvKTKLS
         A7dw==
X-Forwarded-Encrypted: i=1; AKwUvBwhzOQQJsfwPFEvIm+tMqRGeehMLyxxXVtZgPwiOkdR/+KzCMTTTEIJgH26Lb9qK+qRd7VgNAwDRLxRfQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIukahsufePSGnomk1iyUgH0eZBX9N2UvoqhPTw5coAd2ZhLC53
	9mbKC2H/VxCpL9GyJFwPnw/cxQopkUPYUKeYJUhRT0HLKK9NIPU2ys7RWW8RGQMSQ+XeVZQdQ0j
	zDhs=
X-Gm-Gg: AYBFou3lf0ZmBt8/4HYokS1I0NLGj/AtZyaFeBXVC4ZlCTnwNxFvWsIFvMDMwmZRIe/
	+OKUA79OziPRC5awtv9ZJk+DOXaLT2E/zeeUnwJpQlbhFbfkf6W26Q94C4ga7EG+CbYlEfwQiT1
	xnf1sKyrvB6P1Iww94dm8+PuZpCVHFpHbHDe7U4eHsCv6KKvtl2UcSalXmTwpHm8fyn0OIrqgTC
	DQjECBWWbuuYs9BvGNdiHv+LxXCErBEpl/ptMSoD4FG9dx6Hx5yod3qCj+OUQiNsDepkk0XaPBw
	PJluwPjbhbA3E1a84/xmA9TQfXiKqDVv57fc1OEras9OQmaDOUD8/GEtt4KGJ+dFg21q3GxF3I9
	iuEN6NpEXMFcVyytVn7C+UnaNVIoyQ9b4XTJNuHUnbPvLirygZ3govjqlhMUSZvS2o/vt+K47D/
	yqjAJf2z14r37+9DTqWLzsSLVVB7ttjElFaqrq7u7/nAufsD2AsasLyTOt4KfRvtRX8xrU8xmne
	N0vfA9G/zxVXxB0zJ9oFwXjr43M8VHA1iWwDTkc8QNswYT+HHegQCLkVcHjMSk=
X-Received: by 2002:a17:903:240b:b0:2e9:8505:5471 with SMTP id d9443c01a7336-2e985055683mr10946845ad.7.1792125881530;
        Thu, 15 Oct 2026 21:44:41 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:44:41 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v4 02/12] zram: remove debugfs entry on init failure
Date: Fri, 16 Oct 2026 13:44:07 +0900
Message-ID: <20261016044429.1304561-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016044429.1304561-1-senozhatsky@chromium.org>
References: <20261016044429.1304561-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not leak the debugfs entry when zram_init() fails to register
the block device.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ab064c84b092..593fa4ae47c4 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -3297,6 +3297,7 @@ static int __init zram_init(void)
 	if (zram_major <= 0) {
 		pr_err("Unable to get major number\n");
 		class_unregister(&zram_control_class);
+		zram_debugfs_destroy();
 		cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
 		return -EBUSY;
 	}
-- 
2.56.0.176.g3575e65682-goog

