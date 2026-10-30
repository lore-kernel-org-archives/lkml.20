Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384148;
	b=DQN1sbVk0cjEIcnFcr4Nmnneko4vyBggB86KMDQF2qh/frIIdIVG1UmBpeH4TbOsG5x0
	 Riujk6LPsccpdmrkzigkvynnu+09NbS7MNHRjx0pI8HSUVd5KWJ2iWfYD+bbe8K9ZtNEk
	 eb+EYWbXkjePpTQFr9mNakpWqW162Msh5ure4J1IpZ1z4FD5/7DE6sGHmEg7FIBGVWt9T
	 YKRVAL702u5fZzmXck9HkQTQfXRwghnp24nSeGti+EZbbIxTMHmCehvctJuq4GcNl9eyQ
	 BRyKHFV2dcvYXcVSBRn+Sci8JSQ/RprmbkZusp/iWo4s4nQ5Z/YK2q/AdTcqt+EfySg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yypjsQQLN14RvHd1ipvvq2CtwzVsovNmzy30kWecM9U=;
	b=HLbMlnTGeyutVU4WKMpSOVQ+cus/tikH9VWWkakIfq4Fi8c2EIFxFzmRlgxGbhsyfzKn
	 1ooDZenVaM6lG07QtLM91DGHzu1yYzQH0K6LasUZL0iBdlSMFuWc3Yb1/qovppklHwEMo
	 Dw8sNgow49/jyN4t3vlEEHO5RzPZ4j23DTBWgS4Ev0gf8pLTkMJ4cpqw7Xt0MB4ZX1+sW
	 JpOQrb5b9wZJSuw2LNz2bBGVJ4OizW9vvBui9oAx+h6KTYEp9l5XrklPR0yLuQmA3JTw7
	 JTSHtocmIbXvBnIZNqvzo2i9zmgtVFpE4RPwOIfU/13PaJIEkp0xZm49CYhNL3zTOZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=MwN8lnYT;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54E606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A54E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=MwN8lnYT
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5e948e56af3so414322e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793384147; x=1793988947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yypjsQQLN14RvHd1ipvvq2CtwzVsovNmzy30kWecM9U=;
        b=MwN8lnYTee2WexfvX1dUv7loi+nZULFlEnpRuBpX/fbfovtMBDNUzTgkpSL+piEEMd
         6n3jIYNM4gzQPoC7cyA2G6OLZirD2blR9EQkfBcrfmugVOTw8oTllp6/LqS7I130OJuP
         knjNkiOlpTawGedEd7fFLQfi13RjzzwXn4OrfrLpczaeK3eZ/xfu0+1UovAKbhOxk9DA
         8EkuId46uTBoYPSeCTayngJsbHRJSLDtsvaVX+Dq+6vN62rrpEq7moo6pGmXejvJS+dQ
         sVzaShyfeJcZIchrF/8NKcTINQS9V/qvTAK6xHix6GJ6378mUEvdCOWzu0h8QWwkUerR
         gf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384147; x=1793988947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yypjsQQLN14RvHd1ipvvq2CtwzVsovNmzy30kWecM9U=;
        b=hd+T2s0rJ9P/LnedfvbrTfDCJlUnBcYtDxjOu3yxrdQ2EbhYMO53rLUbnXh/OjBxp1
         3bsh1NiKIRh53ol1sjIRV6eU6lSfoyZ3wE25nc8Qqu8F7xQXtlifuj93EiG+baFMkPPp
         efXzGLTvHhPEaPHSF06AZS54a/yZ0DEFAJAXCtw3Da3GM3yJQW/ot6wembjon1YWVGt+
         cbV5PpMw/wvCkiE8Vb1aVTlm72+9DbWNZt9PusuFAWTsYXvqd+xYL9rf/wma0QaSu947
         JAzYHFuk8mGcJs63vrfftqi8H1Kurg26IA16zkk4qgNrVVUkmBpS9DohWlfdd5XXjrz/
         r6VA==
X-Forwarded-Encrypted: i=1; AKwUvBwH4hRqZmXAUjc3bdEbG6DIZ3EI+g0LKDTORK3KVz4BXdyB5a4FC5KvJFmck8HqQFiXXdhDqFacvDcYSWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5l0iQAVIFU+98gf2LYoqy//6Rx+iLfh5ejOjmacJ/bex/XonX
	pAuSUZELrvCJV9I84+WC3Fk4vCiQYZpMWhvfOCMa+sxuG7FzCDRunugrLy9/NrYEJKN3
X-Gm-Gg: AYBFou3V9ZYv0VhRSRmEpf+nfFQNMxqy78IxhksQLrBD+TJmL9Vf5AUP/1ckCcYSW/S
	fKKev0t2SAGck5qs0jSYa8n0nJuddq9Sj7dl7NBM32xFgIEhlHlz0sdD7/2pr7rXcSu7XTPaxxv
	4f9DoXgGJIbF6D44v9sP0mCo8KPGgRjjOZan2FLenwjN29dlLy36b5j75/GWxZYU4rucmgkgD57
	bN/eBf40yGRUiQnq3BPXvvb2mzMCYTLoibwO7JrvYfPF7WhhynlfvU2PVZ2Fi2HyPMhin8YvDnw
	TRX1wXiqrgKxwVwAYQ6K95jlq/61oAZypC2+upnNdUjDmp3NBOOwiR5cfrQKjoJpn04ZpYJKot2
	Vd5Zr/KPILFQW5FZQVqvOsanXLSdSNAK2zIm1McILL/A1ndTjcjSTntnwHcozEvh7kHx4glywQG
	iymhUXkEUN+gftk4QN341iw0IIs0fHcZRLEZF6U5SjiXiJX/tf94QG2gZigjMQlvS7EVFjJ0DNS
	T5mGPQEmktoxpXZnPzp0u4dJ57egQvbtIEQGHf50yFcikicKdgkxPp+7p24ybRabMR0yimX7PHM
	vo3WFUIVDzYxodFtrVmtzIDzlP7eBE+6FRHjiB17Ork+Had3YAQCkUTPOOnsPDRsTm0Qumscdr7
	6cy8B9RMqitzuWF00y7zC2ILQm/eOYLgmfwJvdSaGswUINH/pJibBpY3ZNJs3HABQ
X-Received: by 2002:a05:6102:5126:b0:7d0:6db8:dc33 with SMTP id ada2fe7eead31-7d0727ada6emr1650413137.2.1793384146946;
        Fri, 30 Oct 2026 11:15:46 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1c6sm3077931137.3.2026.10.30.11.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:15:46 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Mustafa Ismail <mustafa.ismail@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jacob Moroni <jmoroni@google.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next v4 2/6] RDMA/irdma: Register irdma UVERBS ioctl namespace
Date: Fri, 30 Oct 2026 18:15:08 +0000
Message-ID: <20261030181512.2056056-3-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261030181512.2056056-1-dhu@x6u.co>
References: <20261030181512.2056056-1-dhu@x6u.co>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
index 811b1d532599..dd824720671c 100644
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
@@ -5602,6 +5618,8 @@ static void irdma_init_rdma_device(struct irdma_device *iwdev)
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
2.56.0.317.g454f8302e1-goog

