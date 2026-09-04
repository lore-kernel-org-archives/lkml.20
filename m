Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4ED46F481
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519156; cv=none; b=sFVn4JQfXnTvqXTYVbwCMwWdI+w0xu75lXszURH52bjpE53couPfPFKTvOJTmiT6t+B+ck6JE3pyHEXxYIKA6XKmmjV2t5TbGEEmw5dSKXl7Cf2a+od0c2qZpVXSYNoFbmpuYbV8E7KPPtwRbBLXF7J+iZMSJyToCA9Aw1PbZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519156; c=relaxed/simple;
	bh=31EO+obuyVyJy7sDrrORj0J7yrJ18PO1XejkzTuAIG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKio0/YqXUW/U3kQXwH/LwMjzgPpNjCGfjsw6FD/shzN3PlEvKrMYWcScCmg9V3LpPiWZzB4SDBeeQ4gkYbv1Nn97NXza+hBwfb/RMvaqg7Wg9Uv/z4sV3vWbJZLp+zKWjf1OS2jjLsz+wA6A7EVyTekVCC7RxYFuxjAeTSq66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GPdrJZIt; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GPdrJZIt"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso659134a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519150; x=1789123950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Vh9JXE6CrP53vg0mGaWkyinhC/KwcpsssZ0zP5EyaQ=;
        b=L2bI9oTRdys77TYF4vBkqgMWSEFfO78X+Q3o3crtW5pdIpMXAUuVTi6VZrLKGcGykw
         9fiOyOKGQIKaCXU8JpQdOBZogfvVeQ8jVdNGnDwjDxpbx73eJwNDxZ9AXSL41XwiIHTc
         KbxaJaNWFIfIhGBz/PeA+/SRVoHJKAU2qVXK1aK+536nJIQ9xi8UckAcsWDVuOrfNb3A
         j8BdUzyDRXhdx9H+So7HzCOhrs2BX+RHZTi012WdV4T3S2Op9F0iA94F5o04mNxTrYcX
         Ozp6619+QNeP10tfLhVf7fqmSN4GwwUkPc1+IA7gp8yMncVQ2HQdhSIA57sWqI0TuLfv
         5ugA==
X-Forwarded-Encrypted: i=1; AKwUvBwmNBOhOcpBvSm2/9bXfv4FirCJICgH0MLvV0UQQb63CF1hSEHVbBZSgOskTynNdn70gJ504zmxzcSnJzM=@vger.kernel.org
X-Gm-Message-State: AFuF++kevr5fbEbkWIbEaKTpPkmvKOpKDpPwvRniyZWGczesdWvARAg7
	A/yHDkQzvGOomR5WtmB+84Lm7QCAx5hPoVOsfE/1CAeg9QmIgSKRYmTitl/etuUSC4yF6N5fiil
	aGdFZYjBqlXBowA3FnP3tmAYojbVDCyE6i8deYMt5pgCF5AUVOdPp5Ih4HsWOXN45G/+YkSoyPr
	klz2OAI5rU0w4c6NrnB2RaEKryCx4A4SXXLnPf3zw+VV2JHPOAdX5P3+I5Q9WY1S8e9Ubgm1sWM
	QQxGuyj/8xC02H7Efea
X-Gm-Gg: AYBFou0cH/0B69UIB92M66S+rSUcMwmIlvqH07jqXChTRX/WX+wkB3FlMPb/KzpcK3K
	XykRCUXHWrAP1en6C1b0o40KOoBmHldgplOGC/bc3dlJfMeaGjN/5N0fDqYSJt8ZIWN3t8x42Hp
	HKesTzTK7cuScg55d0GJWMw384Q4DtbODYtHNaOfI4aSDCwjDy4f5njvecEPSQ7aghb/Yix+wIp
	vieiQI+6wnl03L5JGkgpXgEYQsFdrLp+Q0BxEssNuPvWEk07VN72n92ACpc/5YqfKPNKOh4R2E2
	zzfdJNp1UWTV3HRC4+idEeJp+murOf0dI/YgvDzmUl082Agbx3H2W6JhM6IHoLYTKLqQrIbKgPC
	XaFvPM4fOsEF8N1iw6uwHiOq1wmdw0TPd0f0GBMIlv6Dewyq0vkIjQFPFy8K79xnHqq8/lcK6C9
	rodAzgourFroHgIxw3Puzk3OnquFA5BD0spw==
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr8716441a91.9.1788519150169;
        Fri, 04 Sep 2026 03:52:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-143243335a2sm86627c88.1.2026.09.04.03.52.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:52:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so1080776a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519148; x=1789123948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Vh9JXE6CrP53vg0mGaWkyinhC/KwcpsssZ0zP5EyaQ=;
        b=GPdrJZItQQd5588sj+MKp7ikI2nVB95dbvue01wtXKVn9DS5t8KwzWk3rAZX06uteP
         iRYk40SpMwgk4tMqZuUGi5abwTTRS3SxR6CvlSiJRkYCZyQKVJ2Osa1T9xXLh5LcyTsV
         E2FF5xq8zt5VsrQrNjcjMVwinSik2v0abatLc=
X-Forwarded-Encrypted: i=1; AKwUvBwD0ZmAdqr6MdKCl4BuFdxFagsla8pm4AFGpV6ORjhNOWLQcX0ZsopwodjhzDH32ejfiSBgqQSVXrjOsIE=@vger.kernel.org
X-Received: by 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr8763704a91.2.1788519147567;
        Fri, 04 Sep 2026 03:52:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr8763623a91.2.1788519147004;
        Fri, 04 Sep 2026 03:52:27 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:25 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Usman Ansari <usman.ansari@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [PATCH 05/15] RDMA/bng_re: Add support verbs
Date: Fri,  4 Sep 2026 03:43:13 -0700
Message-ID: <20260904104328.763768-6-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260904104328.763768-1-siva.kallam@broadcom.com>
References: <20260904104328.763768-1-siva.kallam@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Usman Ansari <usman.ansari@broadcom.com>

This patch adds below verbs.
- bng_re_query_device
- bng_re_modify_device
- bng_re_query_fw_str
- bng_re_query_port
- bng_re_get_link_layer
- bng_re_get_port_immutable
- bng_re_process_mad
- bng_re_query_pkey

Signed-off-by: Usman Ansari <usman.ansari@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
---
 drivers/infiniband/hw/bng_re/Makefile    |   3 +-
 drivers/infiniband/hw/bng_re/bng_dev.c   |  16 ++
 drivers/infiniband/hw/bng_re/bng_re.h    |  11 ++
 drivers/infiniband/hw/bng_re/bng_sp.h    |   1 +
 drivers/infiniband/hw/bng_re/bng_verbs.c | 200 +++++++++++++++++++++++
 drivers/infiniband/hw/bng_re/bng_verbs.h |  30 ++++
 include/uapi/rdma/bng_re-abi.h           |  12 ++
 include/uapi/rdma/ib_user_ioctl_verbs.h  |   1 +
 8 files changed, 273 insertions(+), 1 deletion(-)
 create mode 100644 drivers/infiniband/hw/bng_re/bng_verbs.c
 create mode 100644 drivers/infiniband/hw/bng_re/bng_verbs.h
 create mode 100644 include/uapi/rdma/bng_re-abi.h

diff --git a/drivers/infiniband/hw/bng_re/Makefile b/drivers/infiniband/hw/bng_re/Makefile
index ea0c6951728f..1b954a35993b 100644
--- a/drivers/infiniband/hw/bng_re/Makefile
+++ b/drivers/infiniband/hw/bng_re/Makefile
@@ -12,4 +12,5 @@ bng_re-y := \
 	bng_debugfs.o \
 	bng_fw.o \
 	bng_dev.o \
-	bng_sp.o
+	bng_sp.o \
+	bng_verbs.o
diff --git a/drivers/infiniband/hw/bng_re/bng_dev.c b/drivers/infiniband/hw/bng_re/bng_dev.c
index ea6528e80ce3..05665c82b4e1 100644
--- a/drivers/infiniband/hw/bng_re/bng_dev.c
+++ b/drivers/infiniband/hw/bng_re/bng_dev.c
@@ -6,6 +6,7 @@
 #include <linux/auxiliary_bus.h>
 
 #include <rdma/ib_verbs.h>
+#include <rdma/bng_re-abi.h>
 
 #include "bng_res.h"
 #include "bng_sp.h"
@@ -17,11 +18,26 @@
 #include "bng_debugfs.h"
 #include "bng_re_mpc_roce.h"
 #include "bng_xid.h"
+#include "bng_verbs.h"
 
 MODULE_AUTHOR("Siva Reddy Kallam <siva.kallam@broadcom.com>");
 MODULE_DESCRIPTION(BNG_RE_DESC);
 MODULE_LICENSE("Dual BSD/GPL");
 
+static const struct ib_device_ops bng_re_dev_ops = {
+	.owner			= THIS_MODULE,
+	.driver_id              = RDMA_DRIVER_BNG_RE,
+	.uverbs_abi_ver         = BNG_RE_ABI_VERSION,
+	.query_device		= bng_re_query_device,
+	.modify_device		= bng_re_modify_device,
+	.get_dev_fw_str		= bng_re_query_fw_str,
+	.query_port		= bng_re_query_port,
+	.get_link_layer		= bng_re_get_link_layer,
+	.get_port_immutable	= bng_re_get_port_immutable,
+	.process_mad		= bng_re_process_mad,
+	.query_pkey		= bng_re_query_pkey,
+};
+
 static struct bng_re_dev *bng_re_dev_add(struct auxiliary_device *adev,
 					 struct bnge_auxr_dev *aux_dev)
 {
diff --git a/drivers/infiniband/hw/bng_re/bng_re.h b/drivers/infiniband/hw/bng_re/bng_re.h
index d6fb205d9f12..4fa5db15625f 100644
--- a/drivers/infiniband/hw/bng_re/bng_re.h
+++ b/drivers/infiniband/hw/bng_re/bng_re.h
@@ -21,6 +21,14 @@
 #define BNG_RE_MIN_MSIX		2
 #define BNG_RE_MAX_MSIX		BNGE_MAX_ROCE_MSIX
 
+#define BNG_RE_PAGE_SHIFT_1G	(30)
+#define BNG_RE_MAX_MR_SIZE_LOW	BIT_ULL(BNG_RE_PAGE_SHIFT_1G)
+#define BNG_RE_MAX_MR_SIZE_HIGH	BIT_ULL(39)
+#define BNG_RE_MAX_MR_SIZE		BNG_RE_MAX_MR_SIZE_HIGH
+
+#define BNG_RE_DEFAULT_ACK_DELAY	16
+#define BNG_RE_PAGE_SIZE_SUPPORTED	0x7FFFF000 /* 4kb - 1G */
+
 #define BNG_RE_CREQ_NQ_IDX	0
 
 #define BNGE_INVALID_STATS_CTX_ID	-1
@@ -250,6 +258,9 @@ struct bng_re_dev {
 	struct bng_mpc_ctx	*mpc;
 };
 
+#define to_bng_re_dev(ptr, member)	\
+	container_of((ptr), struct bng_re_dev, member)
+
 int bng_re_net_ring_alloc(struct bng_re_dev *rdev,
 			  struct bng_re_ring_attr *ring_attr,
 			  u16 *fw_ring_id);
diff --git a/drivers/infiniband/hw/bng_re/bng_sp.h b/drivers/infiniband/hw/bng_re/bng_sp.h
index 91faa5ac7464..4dac43540f54 100644
--- a/drivers/infiniband/hw/bng_re/bng_sp.h
+++ b/drivers/infiniband/hw/bng_re/bng_sp.h
@@ -24,6 +24,7 @@ struct bng_re_dev_attr {
 	u32				max_qp_rd_atom;
 	u32				max_qp_init_rd_atom;
 	u32				max_qp_wqes;
+	u32				max_sq_wqes;
 	u32				max_qp_sges;
 	u32				max_cq;
 	u32				max_cq_wqes;
diff --git a/drivers/infiniband/hw/bng_re/bng_verbs.c b/drivers/infiniband/hw/bng_re/bng_verbs.c
new file mode 100644
index 000000000000..25996133c83d
--- /dev/null
+++ b/drivers/infiniband/hw/bng_re/bng_verbs.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2026 Broadcom.
+
+#include <linux/interrupt.h>
+#include <linux/types.h>
+#include <linux/pci.h>
+#include <linux/io.h>
+#include <net/addrconf.h>
+#include <rdma/ib_cache.h>
+#include <rdma/ib_verbs.h>
+#include <rdma/ib_umem.h>
+#include <rdma/ib_pack.h>
+#include <rdma/ib_addr.h>
+#include <rdma/ib_mad.h>
+#include <rdma/uverbs_ioctl.h>
+#include <rdma/bng_re-abi.h>
+
+#include "bng_res.h"
+#include "bng_fw.h"
+#include "bnge.h"
+#include "bnge_auxr.h"
+#include "bng_re.h"
+#include "bng_verbs.h"
+
+int bng_re_query_device(struct ib_device *ibdev,
+			struct ib_device_attr *ib_attr,
+			struct ib_udata *udata)
+{
+	struct bng_re_dev *rdev = to_bng_re_dev(ibdev, ibdev);
+	struct bng_re_dev_attr *dev_attr = rdev->dev_attr;
+
+	memset(ib_attr, 0, sizeof(*ib_attr));
+	memcpy(&ib_attr->fw_ver, dev_attr->fw_ver,
+	       min(sizeof(dev_attr->fw_ver),
+		   sizeof(ib_attr->fw_ver)));
+	addrconf_addr_eui48((u8 *)&ib_attr->sys_image_guid,
+			    rdev->netdev->dev_addr);
+	ib_attr->max_mr_size = BNG_RE_MAX_MR_SIZE;
+	ib_attr->page_size_cap = BNG_RE_PAGE_SIZE_SUPPORTED;
+	ib_attr->vendor_id = rdev->aux_dev->pdev->vendor;
+	ib_attr->vendor_part_id = rdev->aux_dev->pdev->device;
+	ib_attr->hw_ver = rdev->aux_dev->pdev->revision;
+	ib_attr->max_qp = dev_attr->max_qp;
+	ib_attr->max_qp_wr = dev_attr->max_sq_wqes;
+	ib_attr->device_cap_flags = IB_DEVICE_CURR_QP_STATE_MOD
+				    | IB_DEVICE_RC_RNR_NAK_GEN
+				    | IB_DEVICE_SHUTDOWN_PORT
+				    | IB_DEVICE_SYS_IMAGE_GUID
+				    | IB_DEVICE_RESIZE_MAX_WR
+				    | IB_DEVICE_PORT_ACTIVE_EVENT
+				    | IB_DEVICE_N_NOTIFY_CQ
+				    | IB_DEVICE_MEM_WINDOW
+				    | IB_DEVICE_MEM_WINDOW_TYPE_2B
+				    | IB_DEVICE_MEM_MGT_EXTENSIONS;
+	ib_attr->kernel_cap_flags = IBK_LOCAL_DMA_LKEY;
+	ib_attr->max_send_sge = dev_attr->max_qp_sges;
+	ib_attr->max_recv_sge = dev_attr->max_qp_sges;
+	ib_attr->max_sge_rd = dev_attr->max_qp_sges;
+	ib_attr->max_cq = dev_attr->max_cq;
+	ib_attr->max_cqe = dev_attr->max_cq_wqes;
+	ib_attr->max_mr = dev_attr->max_mr;
+	ib_attr->max_pd = dev_attr->max_pd;
+	ib_attr->max_qp_rd_atom = dev_attr->max_qp_rd_atom;
+	ib_attr->max_qp_init_rd_atom = dev_attr->max_qp_init_rd_atom;
+	ib_attr->atomic_cap = IB_ATOMIC_NONE;
+	ib_attr->masked_atomic_cap = IB_ATOMIC_NONE;
+	if (dev_attr->is_atomic) {
+		ib_attr->atomic_cap = IB_ATOMIC_GLOB;
+		ib_attr->masked_atomic_cap = IB_ATOMIC_GLOB;
+	}
+	ib_attr->max_ee_rd_atom = 0;
+	ib_attr->max_res_rd_atom = 0;
+	ib_attr->max_ee_init_rd_atom = 0;
+	ib_attr->max_ee = 0;
+	ib_attr->max_rdd = 0;
+	ib_attr->max_mw = dev_attr->max_mw;
+	ib_attr->max_raw_ipv6_qp = 0;
+	ib_attr->max_raw_ethy_qp = dev_attr->max_raw_ethy_qp;
+	ib_attr->max_mcast_grp = 0;
+	ib_attr->max_mcast_qp_attach = 0;
+	ib_attr->max_total_mcast_qp_attach = 0;
+	ib_attr->max_ah = dev_attr->max_ah;
+	ib_attr->max_srq = dev_attr->max_srq;
+	ib_attr->max_srq_wr = dev_attr->max_srq_wqes;
+	ib_attr->max_srq_sge = dev_attr->max_srq_sges;
+	ib_attr->max_fast_reg_page_list_len = MAX_PBL_LVL_1_PGS;
+	ib_attr->max_pkeys = 1;
+	ib_attr->local_ca_ack_delay = BNG_RE_DEFAULT_ACK_DELAY;
+
+	return 0;
+}
+
+int bng_re_modify_device(struct ib_device *ibdev,
+			 int device_modify_mask,
+			 struct ib_device_modify *device_modify)
+{
+	ibdev_dbg(ibdev, "Modify device with mask 0x%x", device_modify_mask);
+
+	if (device_modify_mask & ~IB_DEVICE_MODIFY_NODE_DESC)
+		return -EOPNOTSUPP;
+
+	if (!(device_modify_mask & IB_DEVICE_MODIFY_NODE_DESC))
+		return 0;
+
+	memcpy(ibdev->node_desc, device_modify->node_desc, IB_DEVICE_NODE_DESC_MAX);
+
+	return 0;
+}
+
+void bng_re_query_fw_str(struct ib_device *ibdev, char *str)
+{
+	struct bng_re_dev *rdev = to_bng_re_dev(ibdev, ibdev);
+
+	sprintf(str, "%d.%d.%d.%d", rdev->dev_attr->fw_ver[0],
+		rdev->dev_attr->fw_ver[1], rdev->dev_attr->fw_ver[2],
+		rdev->dev_attr->fw_ver[3]);
+}
+
+int bng_re_query_port(struct ib_device *ibdev, u32 port_num,
+		      struct ib_port_attr *port_attr)
+{
+	struct bng_re_dev *rdev = to_bng_re_dev(ibdev, ibdev);
+	struct bng_re_dev_attr *dev_attr = rdev->dev_attr;
+	int rc;
+
+	memset(port_attr, 0, sizeof(*port_attr));
+
+	if (netif_running(rdev->netdev) && netif_carrier_ok(rdev->netdev)) {
+		port_attr->state = IB_PORT_ACTIVE;
+		port_attr->phys_state = IB_PORT_PHYS_STATE_LINK_UP;
+	} else {
+		port_attr->state = IB_PORT_DOWN;
+		port_attr->phys_state = IB_PORT_PHYS_STATE_DISABLED;
+	}
+	port_attr->max_mtu = IB_MTU_4096;
+	port_attr->active_mtu = iboe_get_mtu(rdev->netdev->mtu);
+	port_attr->gid_tbl_len = dev_attr->max_sgid;
+	port_attr->port_cap_flags = IB_PORT_CM_SUP | IB_PORT_REINIT_SUP |
+				    IB_PORT_DEVICE_MGMT_SUP |
+				    IB_PORT_VENDOR_CLASS_SUP;
+	port_attr->ip_gids = true;
+
+	port_attr->max_msg_sz = (u32)BNG_RE_MAX_MR_SIZE_LOW;
+	port_attr->bad_pkey_cntr = 0;
+	port_attr->qkey_viol_cntr = 0;
+	port_attr->pkey_tbl_len = dev_attr->max_pkey;
+	port_attr->lid = 0;
+	port_attr->sm_lid = 0;
+	port_attr->lmc = 0;
+	port_attr->max_vl_num = 4;
+	port_attr->sm_sl = 0;
+	port_attr->subnet_timeout = 0;
+	port_attr->init_type_reply = 0;
+	rc = ib_get_eth_speed(&rdev->ibdev, port_num, &port_attr->active_speed,
+			      &port_attr->active_width);
+
+	return rc;
+}
+
+enum rdma_link_layer bng_re_get_link_layer(struct ib_device *ibdev, u32 port_num)
+{
+	return IB_LINK_LAYER_ETHERNET;
+}
+
+int bng_re_get_port_immutable(struct ib_device *ibdev, u32 port_num,
+			      struct ib_port_immutable *immutable)
+{
+	struct ib_port_attr port_attr;
+
+	if (bng_re_query_port(ibdev, port_num, &port_attr))
+		return -EINVAL;
+
+	immutable->pkey_tbl_len = port_attr.pkey_tbl_len;
+	immutable->gid_tbl_len = port_attr.gid_tbl_len;
+	immutable->core_cap_flags = RDMA_CORE_PORT_IBA_ROCE;
+	immutable->core_cap_flags |= RDMA_CORE_CAP_PROT_ROCE_UDP_ENCAP;
+	immutable->max_mad_size = IB_MGMT_MAD_SIZE;
+
+	return 0;
+}
+
+int bng_re_query_pkey(struct ib_device *ibdev, u32 port_num,
+		      u16 index, u16 *pkey)
+{
+	if (index > 0)
+		return -EINVAL;
+
+	*pkey = IB_DEFAULT_PKEY_FULL;
+
+	return 0;
+}
+
+int bng_re_process_mad(struct ib_device *ibdev, int process_mad_flags,
+		       u32 port_num, const struct ib_wc *in_wc,
+		       const struct ib_grh *in_grh,
+		       const struct ib_mad *in_mad, struct ib_mad *out_mad,
+		       size_t *out_mad_size, u16 *out_mad_pkey_index)
+{
+	return IB_MAD_RESULT_FAILURE;
+}
diff --git a/drivers/infiniband/hw/bng_re/bng_verbs.h b/drivers/infiniband/hw/bng_re/bng_verbs.h
new file mode 100644
index 000000000000..5875ec565ea4
--- /dev/null
+++ b/drivers/infiniband/hw/bng_re/bng_verbs.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2026 Broadcom.
+
+#ifndef __BNG_RE_VERBS_H__
+#define __BNG_RE_VERBS_H__
+
+#include <linux/refcount.h>
+#include <rdma/ib_verbs.h>
+
+#include "bng_sp.h"
+#include "bng_re.h"
+
+int bng_re_query_device(struct ib_device *ibdev, struct ib_device_attr *ib_attr,
+			struct ib_udata *udata);
+int bng_re_modify_device(struct ib_device *ibdev, int device_modify_mask,
+			 struct ib_device_modify *device_modify);
+void bng_re_query_fw_str(struct ib_device *ibdev, char *str);
+int bng_re_query_port(struct ib_device *ibdev, u32 port_num,
+		      struct ib_port_attr *port_attr);
+int bng_re_get_port_immutable(struct ib_device *ibdev, u32 port_num,
+			      struct ib_port_immutable *immutable);
+int bng_re_query_pkey(struct ib_device *ibdev, u32 port_num, u16 index, u16 *pkey);
+enum rdma_link_layer bng_re_get_link_layer(struct ib_device *ibdev, u32 port_num);
+int bng_re_process_mad(struct ib_device *ibdev, int mad_flags,
+		       u32 port_num, const struct ib_wc *in_wc,
+		       const struct ib_grh *in_grh,
+		       const struct ib_mad *in_mad, struct ib_mad *out_mad,
+		       size_t *out_mad_size, u16 *out_mad_pkey_index);
+#endif /* __BNG_RE_VERBS_H__ */
+
diff --git a/include/uapi/rdma/bng_re-abi.h b/include/uapi/rdma/bng_re-abi.h
new file mode 100644
index 000000000000..cea056dc8610
--- /dev/null
+++ b/include/uapi/rdma/bng_re-abi.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-2-Clause) */
+/* Copyright (c) 2025 Broadcom */
+
+#ifndef __BNG_RE_UVERBS_ABI_H__
+#define __BNG_RE_UVERBS_ABI_H__
+
+#include <linux/types.h>
+#include <rdma/ib_user_ioctl_cmds.h>
+
+#define BNG_RE_ABI_VERSION	1
+
+#endif /* __BNG_RE_UVERBS_ABI_H__*/
diff --git a/include/uapi/rdma/ib_user_ioctl_verbs.h b/include/uapi/rdma/ib_user_ioctl_verbs.h
index 21f86cc7bb1f..d8ffeb6fbb4a 100644
--- a/include/uapi/rdma/ib_user_ioctl_verbs.h
+++ b/include/uapi/rdma/ib_user_ioctl_verbs.h
@@ -257,6 +257,7 @@ enum rdma_driver_id {
 	RDMA_DRIVER_ERDMA,
 	RDMA_DRIVER_MANA,
 	RDMA_DRIVER_IONIC,
+	RDMA_DRIVER_BNG_RE,
 };
 
 enum ib_uverbs_gid_type {
-- 
2.43.5

