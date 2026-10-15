Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DBB4FD260
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075888; cv=none; b=WLkIjSOoBdBz/wZI8ZcoALE9SXZKnsHrNyOMtE3IjwlBGvVQiQ+L1LPkItOuOc2u9wo9SMeAKdzyfYE2t4Ngv7UoZG5M0sOihT1luwzfoQJCS/dkfdB1KtOWWKz/PslN1B3uJGjUcFp2OzZTVzSD9B1MzJtCIVL4ukKEg1zd0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075888; c=relaxed/simple;
	bh=VTpo5ZReKi6aUeoYA7BClj2A3JUFHeXh9bZfnZxoBwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBA0khEECoX7k1jPXb9SYK0I4kzjL8bylNHKJ1739YSd4ZYIyQuNnF4Eqt6BrXt7Zkbz0KI/Fovb73z7YWPooYigsDvPWRxaUG+0MD6BIa9EFwyVTmtLRTd655tVqdKzMQrxnwm7/zH3dhloDSSdmr2N0aCdPNnrTPWs00F5MmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=GgWpBPO4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="GgWpBPO4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso105653266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792075884; x=1792680684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYfTJ5hv9EMwutjH+FlT+/ZfnsL6STQjw/HcZoZEibo=;
        b=GgWpBPO4E98j1bU3Las7AMJ1w58CTUUG09/K6io1hSDHtC++JEl+cx+37MHMykOVk6
         IxflkK8TlvHfdJgdY2JW9SFWxC/WjmchWlknZn4U7EjTa1TEzlaqUaxKhPhtt9hHouUi
         mAeoCoU9XZ/1XitM4NLcui063oZZ8RJAv1M443doxXAoFj9GuEUaduhgprgKhGze/oE/
         y4ipmUBth/oVB77P+0AebPy5Wsk+e/JKVKqlXMAC2OQXoZmgqPXNhm/B3iuHT3zSDkr3
         ejyau32foa00GlxrNcnrebL9et4a7xBSRIzJBvx22JYDvtKON/Idasj0wlzEPedIT7Jw
         BLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075884; x=1792680684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYfTJ5hv9EMwutjH+FlT+/ZfnsL6STQjw/HcZoZEibo=;
        b=YSm0VNtNd/1iOrX70SEBiH1bdVYT5QUNgSerSxe9NBGztcDk0uecOYWn4IxXFG0xg0
         w2Z2OixuBwkq61wCByHK6qqoRllrrA7RCXWqpEI+2OvJjnH181vSzC/7l1EbBY7/+RWO
         CspOBqKpXoxV2ikMwusVVRPozTcB9oCr32WnC+//Z361qLAmPvMUKrpKVkSFtJ3kbAfN
         g1uAafBHhfrgPYpGfguQ/ZgT0CWhJu30X+TnS29SOGJa+vN0WUP/WwbodUQHS+YUkH9y
         cWZcWB11oKgp3/1G+tqLaUb9Xsg1VQc3in/A623qTNGB10OUcKxrY5f2xUCOqfGUwUrd
         hqvg==
X-Gm-Message-State: AFq9FYLs8sHG/YG99eD4TM3qHuzcSma+p1t98NgqT6nB4ayuQxfT/io+
	Gu8gD4XXD66xxA1JiFn/z1l+Kvq+iVM+Ak22M2oK7Ex6fcj0WjJjd9pmdqbwh9dgIvI=
X-Gm-Gg: AYBFou0UHpEjure4XW77o7c+Bj4YTSkSnEtWIFt197P0IHKZUHXxAhpWasl5ID5bccD
	0kzCxcOjivDE8ZhYwyohExX73Hi4Eqq3rieimBQZtHdbNYm9F94Ki+noyrMjJiGS6sfS+PB4lhC
	Ov8wMta5Dw11BuXKMV3qi6scIPpDjAw38ijn/nzX8X5A07hfFUNyL1tZYzE1Io7Mn7H1KyJ5N2J
	KvK6QueFa+AOgCrzL1aBS0Qy+NxhWrPZx+cq+bEMxcz3fr0hPvKjkkh6b1oaBbIp1jU95yxkOA9
	B0iQj0nlSbyJK4T3rq1IzZoRF8N4vZH9tYA45v4/uY7fXArG62b3PPQYUp771Hk3YuTDu/u23tT
	iqZbfKUU+LGg7+CA5cou6NZI8qQADjwVgHJtXjeNLsDJdzF37mG5N6VNAb/ufyaJNVuQWz8LQFL
	Fiyuyr4cLKUF18d9qytb8cqbj/UQst7SzfZgylAO2vRgOogx7u0WfERk+cue77PsIP4ZRL+dGHo
	TQq6iXHhw==
X-Received: by 2002:a17:907:948f:b0:c35:3880:773b with SMTP id a640c23a62f3a-c3538807e2bmr1079685366b.45.1792075884192;
        Thu, 15 Oct 2026 07:51:24 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3fd83464a7sm40271366b.76.2026.10.15.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:51:23 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com
Subject: [PATCH RFC 06/20] ctlv: Prepare blob descriptor validation
Date: Thu, 15 Oct 2026 16:50:39 +0200
Message-ID: <20261015145053.3664509-7-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015145053.3664509-1-jiri@resnulli.us>
References: <20261015145053.3664509-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Add parsing and VA checks for blob descriptors shared by schema
validation and runtime acquisition.

Keep CONFIG_CTLV unwired until dispatch completes the module.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/ctlv/Makefile    |   2 +-
 drivers/ctlv/blob_desc.c | 102 +++++++++++++++++++++++++++++++++++++++
 drivers/ctlv/blob_desc.h |  29 +++++++++++
 3 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 drivers/ctlv/blob_desc.c
 create mode 100644 drivers/ctlv/blob_desc.h

diff --git a/drivers/ctlv/Makefile b/drivers/ctlv/Makefile
index 4f0fe41bc9e1..5edc0b4b973f 100644
--- a/drivers/ctlv/Makefile
+++ b/drivers/ctlv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CTLV) += ctlv.o
 
-ctlv-y += message.o
+ctlv-y += blob_desc.o message.o
diff --git a/drivers/ctlv/blob_desc.c b/drivers/ctlv/blob_desc.c
new file mode 100644
index 000000000000..b84be3d723ab
--- /dev/null
+++ b/drivers/ctlv/blob_desc.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
+ *
+ * Blob descriptor parsing and validation.
+ */
+#include <linux/align.h>
+#include <linux/bits.h>
+#include <linux/overflow.h>
+#include <linux/types.h>
+
+#include <uapi/linux/ctlv.h>
+#include <uapi/linux/ctlv_gen.h>
+
+#include "blob_desc.h"
+#include "message.h"
+
+static int ctlv_blob_member(u64 attr_id)
+{
+	switch (attr_id) {
+	case CTLV_ATTR_BLOB_TYPE:
+		return CTLV_BLOB_MEMBER_TYPE;
+	case CTLV_ATTR_BLOB_ADDRESS:
+		return CTLV_BLOB_MEMBER_ADDRESS;
+	case CTLV_ATTR_BLOB_FD:
+		return CTLV_BLOB_MEMBER_FD;
+	case CTLV_ATTR_BLOB_OFFSET:
+		return CTLV_BLOB_MEMBER_OFFSET;
+	case CTLV_ATTR_BLOB_LENGTH:
+		return CTLV_BLOB_MEMBER_LENGTH;
+	default:
+		return -1;
+	}
+}
+
+u32 ctlv_blob_desc_read(const struct ctlv_attr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_attr **bad)
+{
+	const struct ctlv_attr *child = NULL;
+	enum ctlv_message_step step;
+
+	*desc = (struct ctlv_blob_desc){};
+	while ((step = ctlv_message_next(blob, &child)) == CTLV_MESSAGE_STEP_ATTR) {
+		int member = ctlv_blob_member(child->attr_id);
+
+		*bad = child;
+		if (child->flags & ~CTLV_ATTR_F_NESTED)
+			return CTLV_VALIDATION_REASON_UNKNOWN_FLAG;
+		if (child->flags & CTLV_ATTR_F_NESTED)
+			return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+		if (member < 0)
+			return CTLV_VALIDATION_REASON_UNKNOWN_ATTR;
+		if (ctlv_message_attr_payload_len(child) != sizeof(u64))
+			return CTLV_VALIDATION_REASON_BAD_LENGTH;
+		if (desc->present & BIT(member))
+			return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+		desc->present |= BIT(member);
+		desc->member[member] = *(const u64 *)ctlv_message_attr_payload(child);
+	}
+	*bad = NULL;
+	if (step == CTLV_MESSAGE_STEP_BAD)
+		return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+	return 0;
+}
+
+static u32 ctlv_blob_variant(const struct ctlv_blob_desc *desc)
+{
+	u32 required = BIT(CTLV_BLOB_MEMBER_TYPE) | BIT(CTLV_BLOB_MEMBER_LENGTH);
+
+	switch (desc->member[CTLV_BLOB_MEMBER_TYPE]) {
+	case CTLV_BLOB_TYPE_VA:
+		required |= BIT(CTLV_BLOB_MEMBER_ADDRESS);
+		break;
+	default:
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+	}
+	if (desc->present != required)
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+	return 0;
+}
+
+u32 ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node)
+{
+	u64 start, length, end;
+	u32 reason;
+
+	reason = ctlv_blob_variant(desc);
+	if (reason)
+		return reason;
+	if (!(node->blob.backings & BIT(desc->member[CTLV_BLOB_MEMBER_TYPE])))
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+
+	length = desc->member[CTLV_BLOB_MEMBER_LENGTH];
+	if (!length || length > node->blob.max_len)
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+	start = desc->member[desc->present & BIT(CTLV_BLOB_MEMBER_ADDRESS) ?
+				     CTLV_BLOB_MEMBER_ADDRESS :
+				     CTLV_BLOB_MEMBER_OFFSET];
+	if (!IS_ALIGNED(start, node->blob.alignment) || check_add_overflow(start, length, &end))
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+	return 0;
+}
diff --git a/drivers/ctlv/blob_desc.h b/drivers/ctlv/blob_desc.h
new file mode 100644
index 000000000000..27f77af16f01
--- /dev/null
+++ b/drivers/ctlv/blob_desc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _CTLV_BLOB_DESC_H
+#define _CTLV_BLOB_DESC_H
+
+#include <linux/ctlv_family.h>
+#include <linux/types.h>
+
+#include <uapi/linux/ctlv.h>
+
+/* The members of a descriptor, in the order the root family declares them. */
+enum {
+	CTLV_BLOB_MEMBER_TYPE,
+	CTLV_BLOB_MEMBER_ADDRESS,
+	CTLV_BLOB_MEMBER_FD,
+	CTLV_BLOB_MEMBER_OFFSET,
+	CTLV_BLOB_MEMBER_LENGTH,
+	CTLV_BLOB_MEMBERS,
+};
+
+struct ctlv_blob_desc {
+	u64 member[CTLV_BLOB_MEMBERS];
+	u32 present;
+};
+
+u32 ctlv_blob_desc_read(const struct ctlv_attr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_attr **bad);
+u32 ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node);
+
+#endif /* _CTLV_BLOB_DESC_H */
-- 
2.56.0

