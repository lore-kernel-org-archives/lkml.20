Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED242AD83
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182577; cv=none; b=neZcdhPWMUKnH8ldbm2ebGr8KDCj6/oPHNl88hDJVXzi0nAzO1SFFQfzRhNun7QTKetNZcWknvxA/kopeSBIS2uaP45wh4wpKfkWctfReV0rNoN1K7VBxJadyEF7pT4hIRl1e47olxws2JMSGREhCub519sgeBzEE2LIzdyFaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182577; c=relaxed/simple;
	bh=AwIYAUE+IDC9LiRwdBTT1Pd1UEL1hzxH1T8RDGwzeb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7xB+sohMCSU+gHIVVW2L1F8KKO5LWygSSx33s/KqVkoVx6IRXhqSIx1WJGwKz/jAtGoZLGG9q50UZlWeHh/FIPiSOoLwbwYfLSF6yj1y46yAQtKVFglMTFmBZM5sKFVFuliatSFga56qMXmipc83PjrveFkQvmGU/ujU5p/sgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=X77FX8Ej; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="X77FX8Ej"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e930a11148so230177e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792182571; x=1792787371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aYFM6YBCwEZLKr+JLdUZp7eLuz8AbhTnX/F18Towkk=;
        b=X77FX8Ejh1vOxjlQuNlI3fQbkxbYLNNxs5haDUtYPRvqxw+z2FN/QekcbgbKMNTTZr
         XSsDAv0ljCvnDLqZ2+YnRRLV7C77QHrmTiRvomUo//nI/jKOUNms4ioZ1qLpuFvuyzGF
         OBtJZWgypEt9UhNpMx9LxaDHwk8MDbGfEW7Xg473l+csDZOVrpxZtP94sgVHIzA6p9xA
         7a+W6ypJ7j7PBH82CFb4JTPTrPBuMzqxZnxe5dwTOA5B4C7cnEYkNSkkt53cWSNagD9x
         4oQg02TrLTTZzQvT82VnZ2Qs6EWIZPmzCaVQ5QoySw+hmEj0C83jwyryjukmJVSnBzEr
         hRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182571; x=1792787371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aYFM6YBCwEZLKr+JLdUZp7eLuz8AbhTnX/F18Towkk=;
        b=wMytUM1I4YWJCXII6uvev4W08+KVNFOEgRP9Se0q/8RAeoTzO145MZkcmA/TgmLKnN
         QM5JFqWmrZ4ioJY7H3tNaw7OV+jbm1XGnXjkRssf284/y9y3IUEeRKMPhZUhDtWtd/GD
         nwdX3I17pBClwl9xZay1b/vspm5qLObDr8kxnGAHgZP1qXkASdVN5pn72uc9PV4CfPg9
         wKn3sUYo+wWnx7+xzOSODT13R2EUnM8heXzv8thfC30YN1xIZCZYHIDu0weD1OQig1ZX
         f6cHyNG8rjsULKNGZIZCoxanZ1NLcMT4G9I8+mXo9jt5hEGYbGYDtZA6ICp4/LFXGdHR
         EeKA==
X-Forwarded-Encrypted: i=1; AKwUvBxSFP1LamDxctoWWKiZ+3te6jF22v07XfalrVUeE5oKfe9rWRIo36YIKh0cJA9gn9jiF1bgYuqTpt8dJFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoFgW0mzPioR+yYH3+8LPm5OClM1YD8zGCQ5+Qaqkrm7L+C0rg
	9x54D0Wp3evtZtPLMvbZcSbli5s3DST7vWxABOhi76Dtwv9Q3hJVfO9g3KYbvwVZQLx0
X-Gm-Gg: AYBFou3LLJ2ZqWk8yeOqrfNCUjDCWzQsUOspc1WDQQlzO3C9DnbQRtihfu+hedwqjBA
	OWesGtR1IpKXGAKyM5vqEGh2ekbLrmtS9QwowL+8jq7CMGkxs86onJH0cF+K4uq3MVi6TrbS0n4
	lUtUcjVkXvbEZgZ13L0TbyASWWlGMA3ze5Q5mjBlX8YeJrI+DLsC7vzXJf0DsBN0zNj7pKM3G7o
	I/jGkIbMGmhMHnBwUa9RbnhP3K26ctk4TcbgQmz1XY2V1ZZxmCMVD5pG6NcoaBUP61yExRp9zr4
	Gt7+de5d3AT3DMCoJWwAIcbtP3/6CaiRfBlIVOYYS8OMvhBlcYmCXuPrmX4eBWwOwxXtguHmFas
	j2bkysJQnFt1V1t9xGjWtIMWTB6O09CaitYrOY88av1jlIk9LUinGqNaJqwqG7CVPC8hcctHTys
	/Jh3CKICTkmavx6a9RbuUq8wlodFEAPEOIPy2KWmohDJfilALizfWr10N5y17VQWaVkNVdthTJ1
	LmCHrUDD+YnkvFvk4w9cvGCyMsXoERjyEue1MFYP3KDflXBbwpwfBB52KCiAM5MScOaJpDk3dPg
	Y7P8QbfmuvFtjMzUy7SQ18MDS1dEksTbGku6JoeEfFzpaVrc3nUlBhQFA89y1fBCz8U=
X-Received: by 2002:a05:6122:4217:b0:5ea:9f07:5134 with SMTP id 71dfb90a1353d-5eaaa37e98dmr511145e0c.5.1792182571428;
        Fri, 16 Oct 2026 13:29:31 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b5201b1sm2588281e0c.12.2026.10.16.13.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:29:30 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Mustafa Ismail <mustafa.ismail@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next v3 2/6] RDMA/irdma: Register irdma UVERBS ioctl namespace
Date: Fri, 16 Oct 2026 20:29:05 +0000
Message-ID: <20261016202909.1289496-3-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016202909.1289496-1-dhu@x6u.co>
References: <20261016202909.1289496-1-dhu@x6u.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

An irdma UVERBS module is now created. An irdma specific shadow buf is
defined for CQ, while QP and SRQ reuses core's uapi definitions. This
works since core builds shared core ioctl parsing tree first, before adding
driver specific `uapi_definition`.

Destroy paths are automatically handled by core dispatchers, as objects
are now registered in the parsing tree and no additional driver specifics
are needed in destroy ioctls. Resize, Query, and Modify continue to go
through write() cmds.

Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/verbs.c | 18 ++++++++++++++++++
 include/uapi/rdma/irdma-abi.h       |  5 +++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index 10c790fdfc57..b2ffdc8e3d67 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -1,6 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
 /* Copyright (c) 2015 - 2021 Intel Corporation */
 #include "main.h"
+#include <rdma/uverbs_ioctl.h>
+#define UVERBS_MODULE_NAME irdma
+#include <rdma/uverbs_named_ioctl.h>
+#include <rdma/ib_user_ioctl_cmds.h>
+
+ADD_UVERBS_ATTRIBUTES_SIMPLE(
+	irdma_cq_attrs,
+	UVERBS_OBJECT_CQ,
+	UVERBS_METHOD_CQ_CREATE,
+	UVERBS_ATTR_UMEM(IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM, UA_OPTIONAL)
+);
+
+static const struct uapi_definition irdma_uapi_defs[] = {
+	UAPI_DEF_CHAIN_OBJ_TREE(UVERBS_OBJECT_CQ, &irdma_cq_attrs),
+	{}
+};
 
 /**
  * irdma_query_device - get device attributes
@@ -5629,6 +5645,8 @@ static void irdma_init_rdma_device(struct irdma_device *iwdev)
 	iwdev->ibdev.phys_port_cnt = 1;
 	iwdev->ibdev.num_comp_vectors = iwdev->rf->ceqs_count;
 	iwdev->ibdev.dev.parent = &pcidev->dev;
+	if (IS_ENABLED(CONFIG_INFINIBAND_USER_ACCESS))
+		iwdev->ibdev.driver_def = irdma_uapi_defs;
 	ib_set_device_ops(&iwdev->ibdev, &irdma_dev_ops);
 	if (iwdev->rf->rdma_ver == IRDMA_GEN_1)
 		ib_set_device_ops(&iwdev->ibdev, &irdma_gen1_dev_ops);
diff --git a/include/uapi/rdma/irdma-abi.h b/include/uapi/rdma/irdma-abi.h
index 38155affc8b4..a1a26529aa85 100644
--- a/include/uapi/rdma/irdma-abi.h
+++ b/include/uapi/rdma/irdma-abi.h
@@ -10,6 +10,7 @@
 #define IRDMA_ABI_H
 
 #include <linux/types.h>
+#include <rdma/ib_user_ioctl_cmds.h>
 
 /* irdma must support legacy GEN_1 i40iw kernel
  * and user-space whose last ABI ver is 5
@@ -23,6 +24,10 @@ enum irdma_memreg_type {
 	IRDMA_MEMREG_TYPE_SRQ  = 3,
 };
 
+enum irdma_ib_create_cq_attrs {
+	IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM = UVERBS_ID_DRIVER_NS_WITH_UHW,
+};
+
 enum {
 	IRDMA_ALLOC_UCTX_USE_RAW_ATTR = 1 << 0,
 	IRDMA_ALLOC_UCTX_MIN_HW_WQ_SIZE = 1 << 1,
-- 
2.56.0.176.g3575e65682-goog

