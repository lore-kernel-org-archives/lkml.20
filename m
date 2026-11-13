Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585349;
	b=S6aJOrZGu2JTc/hyo1SG+TRSZr8EbSSpJfQqOfv/jy7mzEQZJitjZ+7H+ejOC9CZ3YKJ
	 RQiaLFI+m0ShHyBX6zx9t1VKPkYDtqo5JKgAidi3UFYxIIx19yM5/kGY1DHYEI3tNClBq
	 Sxp+Csv2BuzwARP8rzP2uXxQER0/xVbU6AP26kljcmYYd2OCY6RcDC73In4P6EKmwtvKL
	 cx8+Xz7vVlk56RITSVlDYctiCJnRrhwHfx/5ut2P7Ohq7G+nKVjn6uQ/JpWr3jsRUikOq
	 cbLoAmhKTsetxE7+GR8fKbDXSzZpngL6FY+Z7WhNuodSqFx/T/gnW/OlAK4bJmlpWPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
	b=JEcodvfbIQduwd/nbKd9boHig/Ff76QYX5RbeUJfC71aMJEPt6rV3nqrSbziRaM0Fk9O
	 PXUKHv2SyOUKiQrcfGOm/Rcb2Zl+ZZbI8DsNajpPFUDZGjvAl68racwUTunuMIMxAq/Sg
	 f9qHMqZZKOZORRCAgrF0ilveXQNUzFEXhzd7L3l+lnmz5oK4OPJmOq4bm8C8EwgcL75Vc
	 RgEShxcVVrFlheOI9vuYfxOFg1iKjsBkAgzJl6u/KU3Ikr6JQMstPp66SX/B3SUpMShsi
	 EDAkKuMoZqapWTnM66kOJBzgiItAlNkJUy0BkLqkVAJhaHSJFl4FxQVtNFv5lvfEGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=vT8AQ6tu;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4D60A3832
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A4D60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=vT8AQ6tu
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d58c50743so204424366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794585348; x=1795190148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
        b=vT8AQ6turuUclN9viL9XgRv4pRh0MkNi3p2IPGmsTRoi/BZP28m/D22w3utokk5SKJ
         Yx/nJVgpy9PveHMoG2/dPsEa9cp/O3L/NejPVRFkBWA5opRnIUtDvRFs/fQBTC1NzyM4
         HeERlJD++vtmnLEi7UF7dx6clJhHXHRkXvvQDDpFWytru1ZLwHFJNLmWu5+OXXn1OjRq
         iLM8unJrkE6x+wv7BQ6UxSfasGqJfhpdm4/NptGDACNvrh2FGj+xXJNuFtLct4UcyyPC
         4FNKstMIaPF3eyduEMFV99OuloyniadLSfpUYb8Nv8tfL05Yy0mGEnADYnRjF4ClEUFO
         pbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585348; x=1795190148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
        b=mFDSESJaSVNz/9v4DMf0wkvaa5hxhf0W4uJwGiz2298jRUIj9VBe0wC+PakMNHzrF3
         jZk8K0VjibI6/+L951+TJJH7eMbGkkYsGWn7o2MFR4fPboLxp8gIVCWgsFi42Dc7Hf1a
         6RszpwA0e2Adefe6bzb/oTOk/822LZrl3ruFh5l/E6S9vv7uatw6oPdOsu/jtUHEMRCU
         Y45f04O60bkQKLiDhMgW2650NhZrYsuTVif/hiG4DR9ZZTHpiFCs5cLmKMI1jnaZ82N3
         vknAnhTk8iHmBxjYK4VEfoqhYW1zWbBud18uusQ9cN0+qM12K+kjgsNwLS0GaOwFpyCQ
         ud6g==
X-Gm-Message-State: APuU4Z/xLL+k2SlG9KoJgNtgWgArHTJqxCtjaBYYRwRqNZrLm2LSy505
	JgOjJ2lKstxr0iyMTMTWOJcf3D4ONS/c0b7V0bGpRObYnUJI1I3u2DEvvI/84YxzmzU=
X-Gm-Gg: AYBFou0E25CYXG52exWfcqmpK0lR2AiYEemS2ZSbP2Cb/NQH1BaCqnqop9QrqKmEa4Y
	DamogAsTW8t82YoqsvtSdCfjGPPSgnNdyuvnRcX8T4YHIKPh0U09tw95ywEiNYSYfcJdWow0q9C
	F/ZmVrUyCTFiDmXp/XXKEmgNBulwxaFsTIGQv5mRpupN9keJk5mlEfqnJ2suzUtiROqi7fq3AHc
	OWw7w419A0K94TtV/XxHnVJteBUYM+3W5pCBN3dLj1F8PI1qYuRDHTU2B3BE4qGSB8E2yGAGblA
	yr+VHTe6Poot6c8Vqmwvdk66StcjlnSSgrpCGf/69qk1bKLs84j9NvW//vz6Z0sW2ZjssK2t6pL
	WdDCf4rMTmRKG1eBAiQI293yyqq33EO3AOOPuJ9NXefaxC/8ovxbSblDC+mx8thIujPqQyT3g+K
	jXNQsC62IyS65O3GD0DYk2XyuAR8C2mz/ucB2wne6kfJZlqOiSC+X0HmpKazxGnCqzTwDodiJp8
	Qes3yqdlFf6EKrY6XokCNrj/XL4/5b+BxsTxGAHKNX9dXPl/8THulnkGhyIZ8Qq0IqjM67YC07c
	pkzW15hvRIUCckoYvfUJrp1Aq4+8rYg7+R2W3lT7j8hXyCXvVyyAtImKz4iD
X-Received: by 2002:a17:906:c151:b0:c42:102f:15d3 with SMTP id a640c23a62f3a-c5096541a80mr254985966b.34.1794585347782;
        Fri, 13 Nov 2026 07:55:47 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm115330066b.76.2026.11.13.07.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:55:46 -0800 (PST)
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
	peter.fang@intel.com,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	yeoreum.yun@arm.com,
	aneesh.kumar@kernel.org,
	dave.jiang@intel.com,
	nik.borisov@suse.com,
	sergii.dmytruk@3mdeb.com
Subject: [PATCH RFC v2 06/15] ctlv: Prepare blob descriptor validation
Date: Fri, 13 Nov 2026 16:55:05 +0100
Message-ID: <20261113155515.2510194-7-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113155515.2510194-1-jiri@resnulli.us>
References: <20261113155515.2510194-1-jiri@resnulli.us>
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

From: Jiri Pirko <jiri@nvidia.com>

Add parsing and VA checks for blob descriptors shared by schema
validation and runtime acquisition.

Keep CONFIG_CTLV unwired until dispatch completes the module.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- returned EOVERFLOW for a blob range that wraps
- said TLV, type, record and field instead of attr
- said record instead of nest, the root being one
- numbered every enum member
- took the UAPI headers from include/uapi/ctlv/
- moved to lib/ctlv/
---
 lib/ctlv/Makefile    |   2 +-
 lib/ctlv/blob_desc.c | 101 +++++++++++++++++++++++++++++++++++++++++++
 lib/ctlv/blob_desc.h |  29 +++++++++++++
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 lib/ctlv/blob_desc.c
 create mode 100644 lib/ctlv/blob_desc.h

diff --git a/lib/ctlv/Makefile b/lib/ctlv/Makefile
index 4f0fe41bc9e1..5edc0b4b973f 100644
--- a/lib/ctlv/Makefile
+++ b/lib/ctlv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CTLV) += ctlv.o
 
-ctlv-y += message.o
+ctlv-y += blob_desc.o message.o
diff --git a/lib/ctlv/blob_desc.c b/lib/ctlv/blob_desc.c
new file mode 100644
index 000000000000..7c68ef5702fd
--- /dev/null
+++ b/lib/ctlv/blob_desc.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
+ *
+ * Blob descriptor parsing and validation.
+ */
+#include <linux/align.h>
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/overflow.h>
+#include <linux/types.h>
+
+#include <uapi/ctlv/ctlv.h>
+#include <uapi/ctlv/ctlv_gen.h>
+
+#include "blob_desc.h"
+#include "message.h"
+
+static int ctlv_blob_member(u64 type)
+{
+	switch (type) {
+	case CTLV_T_BLOB_TYPE:
+		return CTLV_BLOB_MEMBER_TYPE;
+	case CTLV_T_BLOB_ADDRESS:
+		return CTLV_BLOB_MEMBER_ADDRESS;
+	case CTLV_T_BLOB_FD:
+		return CTLV_BLOB_MEMBER_FD;
+	case CTLV_T_BLOB_OFFSET:
+		return CTLV_BLOB_MEMBER_OFFSET;
+	case CTLV_T_BLOB_LENGTH:
+		return CTLV_BLOB_MEMBER_LENGTH;
+	default:
+		return -1;
+	}
+}
+
+u32 ctlv_blob_desc_read(const struct ctlv_hdr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_hdr **bad)
+{
+	const struct ctlv_hdr *child = NULL;
+	enum ctlv_message_step step;
+
+	*desc = (struct ctlv_blob_desc){};
+	while ((step = ctlv_message_next(blob, &child)) == CTLV_MESSAGE_STEP_TLV) {
+		int member = ctlv_blob_member(child->type);
+
+		*bad = child;
+		if (child->flags & ~CTLV_HDR_F_RECORD)
+			return CTLV_VALIDATION_REASON_UNKNOWN_FLAG;
+		if (child->flags & CTLV_HDR_F_RECORD)
+			return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+		if (member < 0)
+			return CTLV_VALIDATION_REASON_UNKNOWN_TYPE;
+		if (ctlv_message_hdr_payload_len(child) != sizeof(u64))
+			return CTLV_VALIDATION_REASON_BAD_LENGTH;
+		if (desc->present & BIT(member))
+			return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+		desc->present |= BIT(member);
+		desc->member[member] = *(const u64 *)ctlv_message_hdr_payload(child);
+	}
+	*bad = NULL;
+	if (step == CTLV_MESSAGE_STEP_BAD)
+		return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+	return 0;
+}
+
+static bool ctlv_blob_variant_ok(const struct ctlv_blob_desc *desc)
+{
+	u32 required = BIT(CTLV_BLOB_MEMBER_TYPE) | BIT(CTLV_BLOB_MEMBER_LENGTH);
+
+	switch (desc->member[CTLV_BLOB_MEMBER_TYPE]) {
+	case CTLV_BLOB_TYPE_VA:
+		required |= BIT(CTLV_BLOB_MEMBER_ADDRESS);
+		break;
+	default:
+		return false;
+	}
+	return desc->present == required;
+}
+
+/* Every failure is a bad descriptor; only a range that wraps is -EOVERFLOW. */
+int ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node)
+{
+	u64 start, length, end;
+
+	if (!ctlv_blob_variant_ok(desc) ||
+	    !(node->blob.backings & BIT(desc->member[CTLV_BLOB_MEMBER_TYPE])))
+		return -EINVAL;
+
+	length = desc->member[CTLV_BLOB_MEMBER_LENGTH];
+	if (!length || length > node->blob.max_len)
+		return -EINVAL;
+	start = desc->member[desc->present & BIT(CTLV_BLOB_MEMBER_ADDRESS) ?
+				     CTLV_BLOB_MEMBER_ADDRESS :
+				     CTLV_BLOB_MEMBER_OFFSET];
+	if (!IS_ALIGNED(start, node->blob.alignment))
+		return -EINVAL;
+	if (check_add_overflow(start, length, &end))
+		return -EOVERFLOW;
+	return 0;
+}
diff --git a/lib/ctlv/blob_desc.h b/lib/ctlv/blob_desc.h
new file mode 100644
index 000000000000..e88693cbee4b
--- /dev/null
+++ b/lib/ctlv/blob_desc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _CTLV_BLOB_DESC_H
+#define _CTLV_BLOB_DESC_H
+
+#include <linux/ctlv_family.h>
+#include <linux/types.h>
+
+#include <uapi/ctlv/ctlv.h>
+
+/* The members of a descriptor, in the order the root family declares them. */
+enum {
+	CTLV_BLOB_MEMBER_TYPE = 0,
+	CTLV_BLOB_MEMBER_ADDRESS = 1,
+	CTLV_BLOB_MEMBER_FD = 2,
+	CTLV_BLOB_MEMBER_OFFSET = 3,
+	CTLV_BLOB_MEMBER_LENGTH = 4,
+	CTLV_BLOB_MEMBERS = 5,
+};
+
+struct ctlv_blob_desc {
+	u64 member[CTLV_BLOB_MEMBERS];
+	u32 present;
+};
+
+u32 ctlv_blob_desc_read(const struct ctlv_hdr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_hdr **bad);
+int ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node);
+
+#endif /* _CTLV_BLOB_DESC_H */
-- 
2.56.0

