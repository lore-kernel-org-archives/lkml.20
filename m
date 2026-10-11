Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99F2D739C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681091; cv=none; b=XN+nEdKLtTLVZYM+FII7JYmRsnv0ZFF3PnRFfb8cbWqvkrhC8sAeAHTugRFgow2F7aWUAhe7g8OZLwkpWlW1m6f5TFp/X3yDpHz33mStN59PRtHh0/UK3ClyuuWXlx+aNlFVqay6zsGbOoovrqMxAGiyxjSEuKdVFbkgTnjAI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681091; c=relaxed/simple;
	bh=SdYKlGAk5FxGTnN7edG6HjQX9dfLZMrPwHGdCAUwRSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZMBkn4hFdRVuKhVC3ibXgVAtvyzLaRl7mYfjqgalA2IALqJP7CpY27WneWSDNqkB0+XXAV6LPuV7JhUOHF7oN1xgDL8D0uOXGToOFmQ1lLXsHi4WForGj0QdCfAICWMyburA75w1xii+qHK60TmRlZeBmGwmNh/wpB9CkDVbpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=y/Mx2Z4d; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="y/Mx2Z4d"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ab3fd8adb1so6040027b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1791681089; x=1792285889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6T360LoHPKeGGB11zAlRCDIQcDQxGKl910+v9te6Pw=;
        b=y/Mx2Z4dbCw7JwaeJaaNX1s1qi6aDSWdPrOiBoqU9yc9R79ep4AePP3OASCZW+49cs
         5GXwq+BtmiAPdxpisG1vhoO0PMmChJ93uxN4hBfgEEe7zVIZegZfPWo2COTIhcbikwF4
         4AAmb4ohueLpnQ7wiI6pGvT0vi6sJe8A+gPB0RtXfuItOB0X6lCeIPevbkjrm04d/v+L
         AN3kmHUuNcLpYiQQ7D/MX1MoQFBA0Rxp36IDMzn/8w+IAlqD1GIOqHbEFWj6nh/CL41D
         WUkLSoZ+TtJD2GorcA0sslL/+xEaPpDb9vhf1QYhK7cYoB8OSRID2N6O9c0lWyz3JRH7
         dnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681089; x=1792285889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6T360LoHPKeGGB11zAlRCDIQcDQxGKl910+v9te6Pw=;
        b=e7dp5xkleNxSvygfBZXxwp6DqEYbpIVpvUlRhNhmIXYmu2Fs4Bl7Y+QPboL7WHoixc
         r3UTs2OsiWb3sjQQHI2AmVZL2S6aOkfxGqRrRXumCAlGKunWA2iZGpVl6qLTygjFeVmC
         wXJM2eEHJPAupsYNh6MU8NRnw5t7+maQjujveGfsU52ex4rrRdhrL32q5MyVc76KVqJN
         chb851umNPf+9IZq+HISfnifigdQ/B4o9ogCk3rdALuiLG0GAncBFieMJxuDYlDuL0Tf
         B/+qSMcKSsgl1IYqQ9XwhKTUaflykWI6s7iN9a9xSlqcBubvuJn5jXNPdGPADbq0QdUD
         thQQ==
X-Forwarded-Encrypted: i=1; AKwUvBweLCOGtKvtYloQlyV52XCvGYa8/kes3npNgSfX3BkZMUm+H+QoP9lrpOxiKmwRptkrhpOT9J5tcM28lq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWmeS8geLZwKvAnLXTRHLVHwSnreYkg2VFk7ebaUWV715KFTFE
	+lhLyGjLhnbTHDYJ8VgWH9IVbYB/dn2podrxDLsYup1eZSmYklyaO+P72KsiEJNWcI4kzJl/5OB
	wRz91LQPT
X-Gm-Gg: AYBFou1IjfA6tGyZdq16rJO1zxpgdojwBI/JKBWMwYIFzAUupyxYxiM/Ac78/LGNyxU
	rCa+RE1F2kDp89jCDZ/TQVSlkpjkVrqtU5kDIKFBdHTPYVi5tBovfsKcqGMvfIQcjx/qEIy/Mjl
	n7AwGOEO5uAVB7/YsF1lmP58kF3iH2HC6rOQu4ke0BtvjQ3XrSw2gkWbw3pwW2NIaf6o+ugoeks
	QYllzovCyOxsQjhvxOEw2B7zgMXUIpqOlnnEHbIzpSdUXB+84GpDg5Lt4mHme6FqbAeDY//76Ka
	IE9+tTAdcjddLfAnFvnkDyxeOjvz2+9wA9sYtK+XMOBMKDZFHpHBFNSx6P9vCpTj2nStKeyhWr1
	ovzF0OiA9hIYs4SoRi8MWdgSJ04gughzrVAGATqMd5iGrYlvFCsXqWkCbeseCG+r19nDNOt4Nb7
	qD5Bo5gKbXCmL4EFFetns5mUEK8c5jdPK2jWy3q69KiX4Li+0EB3C0B3G7M8r2dzaRdNSSwRSsf
	BBLsOLuHQ1fjSBCq5wPW/yEcM1u/aK7SxLzpr487WM6qidkDBjaA0aZqEniEhdORzThkJOKWca5
	rfYR7Ef04A==
X-Received: by 2002:a05:690c:6e83:b0:8b0:76e5:ed0c with SMTP id 00721157ae682-8b07ed3e710mr19097207b3.39.1791681088722;
        Sat, 10 Oct 2026 18:11:28 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f263bc8sm21311817b3.45.2026.10.10.18.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:11:27 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jmoroni@google.com,
	eagleshaw@google.com,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next 2/5] RDMA/irdma: Register irdma UVERBS ioctl namespace
Date: Sun, 11 Oct 2026 01:10:19 +0000
Message-ID: <20261011011022.1445352-3-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261011011022.1445352-1-dhu@x6u.co>
References: <20261011011022.1445352-1-dhu@x6u.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

An irdma UVERBS module is now created. An irdma
specific shadow buf is defined for CQ, while QP and
SRQ reuses core's uapi definitions. This works since
core builds shared core ioctl parsing tree first,
before adding driver specific `uapi_definition`.

Destroy paths are automatically handled by core
dispatchers, as objects are now registered in the
parsing tree and no additional driver specifics are
needed in destroy ioctls. Resize, Query, and Modify
continue to go through write() cmds.

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
2.56.0.385.gd3acb90ef8-goog

