Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0A4C33C5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651888; cv=none; b=RrDR8VLWs5vSRGP8RkHsHiEB0CBoweomBPtUX+Bpu1KosmQdoXlU577ioy6FEG5BDPUwUjTPjFKL2B3x4OzoQOMz6XNtWPpDWCWBi3injyZp8U9teZ1ST8wkY9dTvkZzYdaW9lCfkTrnqYD9BkaMiTMdPjvHFzY7acNUVmMz/7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651888; c=relaxed/simple;
	bh=bSWJwBXlrOCPPqMALAdhvCQnU0VIUIjmfsdSClCsa70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lU2HP6HFKcCGB6Xa/GUmMGhr6zRnDKE3A0mHv3FZoEJBkhF7FT9GpLP6LAB4wJEmoMQB0Os9xTHth3rAUD46oCVmavaL3z73DimzWgh8DyJ2Xmu7wnl/TiNZKVzY/6Y7oReV9dadeG4+bDLzGrsKu5d4byQRyRqx39AzAfM7Kdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKT3R2mq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i79Hg3qX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKT3R2mq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i79Hg3qX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jIkT1696998
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcSXSBxb/P7PFQu+uBDPb0bMiJ0Tnsz8E3Lxm0x6K9o=; b=GKT3R2mqvCxnLNwk
	MaPwyxtJMJyYzdQsjwZmJWp7IbfY8Zr3udPp8SlMw7FPOrUfytFUZjMhBs48qk6j
	O2lmRaXKGDZyVP7QIwaywHrUOMj5d3ShSaGRp62tT714Tf9p1LdzlI8prPX7zIFf
	mfsh0kPa94vuH9ROF5ZdLdaUZx4bU+M/KXfGw8U0cwGqFbqhJh9lG69u8gmEdB8W
	Z+OOfcM2obE5coxYy0/GMoSkprdS1vXhj/ztmnRiIEck46BkGbKiaJPZ6dh5OZtL
	Cmz5wiqL7TxQYCjL/w0xoZvtw/K3bbJFHFl/Inmu5agvnGTXIEvEv8W4SJeYd/fC
	Llczig==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn8gd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so7666716eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651873; x=1791256673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcSXSBxb/P7PFQu+uBDPb0bMiJ0Tnsz8E3Lxm0x6K9o=;
        b=i79Hg3qX5dn+ToeX0Cvf981LamrZvzTle2J6Zw06Lkhv8hVb+JO47p57pNQkofZBQo
         Fxl13ktA0m/+RZMzUKVheFLaKAGe8kP6ie1m5oiPjcVPuDcPJLsX0hZuqbMFqfbBm64o
         61zvKITTVFPqwZ1iwIIlikhQzeUOKYp3ypM0Io9MY/xpszdTloy8wHVF7eJ1DMU2GP68
         EN2RUTjMiG88E93TQ7FxBkk1X0cU97byRWk9DlfHYsutUncw8T0wLWwTVgiNhRy+o/qs
         K/V1gREP6V9KlWaxWP5vYZvQ/DRv2vV9MxnW8bAu2WsSuD6vHyhEy0rSE+oG2qq/H35o
         rk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651873; x=1791256673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcSXSBxb/P7PFQu+uBDPb0bMiJ0Tnsz8E3Lxm0x6K9o=;
        b=ZVSh4mfgHnP+I1j2wTrtW8P+uoEA37e0+q9pJQ0v/AM/FFSRviWJc+M7/2zYR+5ube
         OdZxc4nfKTUrfqApPIzJvimOR93XKcZmkMTuhzKAuD5aI2IjI+uWqQsfZBVcY9U/GgJc
         ZhdqBOjhPBE/FSO8AdC1fup1yujOVo7Zv8lu8zZZDHoxONdHitlRal9W/0eU5vo95dCF
         NLGCaw8WO08hK5yNwDFH0LVeuabxDF6Ail0ZtMQkdbgveEDrLlexE1AJ1ak0p8pc4NkP
         bfDXXSNj5z597UayIL+dRPo/BeNMIp0vm08nbH2WwjAfOKENHT0rWD7D7ZeG3eISo3em
         jo2w==
X-Forwarded-Encrypted: i=1; AKwUvBxNPd8lIluL/m3jHcBB8rWoGMOAsUjpBOCgAc5GeImmvPQOeFJaWpeect8C5ZywEaT2bFrOPpPYDim95ys=@vger.kernel.org
X-Gm-Message-State: AFuF++lwl9WKpwjgr6Wo3LlXPdFshoRrs7fb+BGIxuGu54iGdKshHR6u
	+tBwWIG9AkSuvoqsy/YP/kyESqozUY5gPVEZw3ne0SMIjjOwy3b14SH+/4RQYzv0fchmU6EaRcQ
	UlAVwBZSf15qI6KH4fCtikwek+X0eL8kb4viCCfW7aHSXjpGVPKU/+ljqLUzZZRdd3g==
X-Gm-Gg: AYBFou1W4XNjfY5TSAEOigw1ATZRn/bTH2k/QSj1WUt4D1aPtqiatTfY78H/vEopKB3
	kDOBBGsYn8dnczRMpkz6DKTgiKGI1Y7vP86razqnwrq2NVgX0R28F411drv6NpeQYici0jgcVVT
	xIFT/h6veB83OK83IvWeWWloRr3C4F95YKD6Y8AtDXNs1dr4NKOXIhI/yQw89PNJW7MQfVcfhSX
	wo//5mi7aRQGpB2hqTUQNHkzHCN54oNgKkmftlm/LNPKF2w5cFMgxteIUXbDQlaL23hP5GmiVhp
	OrKBMIB1aVQMexALIirpJH3833nEc7VxlVhf1BLMR3vrS9EzdqDoDcdtmt48TCkxFfeY7BWrebR
	XqsuCOQH9gpXqTPBT4b7yZoL21kprRbZwPB5sv7rmg2oH3SjHNrI2MrMZNg4=
X-Received: by 2002:a05:7022:7f13:b0:148:dfc9:425d with SMTP id a92af1059eb24-148dfc947fbmr8103482c88.46.1790651872590;
        Mon, 28 Sep 2026 20:17:52 -0700 (PDT)
X-Received: by 2002:a05:7022:7f13:b0:148:dfc9:425d with SMTP id a92af1059eb24-148dfc947fbmr8103437c88.46.1790651871705;
        Mon, 28 Sep 2026 20:17:51 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:51 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:57 -0700
Subject: [PATCH RFC 06/10] firmware: riscv: rpmi-tee: parse system
 information tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-6-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb2de1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=POWkj4GtxbLqprlqRRMA:9 a=qLrqz2gbWCqx0rJJ:21
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: qhRuA_AfBcLD81N7QkEXSJqC83cw8lbm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXwdQujgphik4v
 y13hlKR4upoH8x/6wFWy1VyfWM/+4/dC62jdhvjz3rkKpO0O88HYuhBQqC68PimJQvXsen+p6MW
 FcJuwzE5LxNoTqv4T9O85fvyLRIn2Gk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX0bWYvNX0Mfgp
 nl9TWbDG8N3XHGWwUfMGuGOS/KOdobWd+JKVMzZZ/9gInOV7CvVuk+tJLeaCY2/sIE/AIU8xqqz
 ILYpxt+/v5Wri1u7sdlhmjG3JmDHvA7jbbJGmzxrEwXpYquCGc/SUw5mNe7naoEgBNLg6GQXiao
 xIvC4ZHp2VfU4fnfSFEO3Fx59wD0hWndllu6kHsK7xqsyxDgNYgcEx94GoGkrTo1LH8o9ce91LJ
 jClRS0ASeWmC9Ccx17pn5Dcgf2TV+6orXo4Zt64OPT2V1W61q8+jhhY6BmnQbikQJXp3+UDtTQG
 Sn+pIWp7lyke+nQJRcecIso3UlFrFkj8TorhzjOAMGZS/nSpFo3sDSyKSHmv+0RoDXK3nip/ZUp
 v1n8I03BSyZRcBoW9t5eLGp+cQFbRUwmvbktZJ3ZhIa9PExnmsiKcQA9tDOyLXB/DTRNKDWND6J
 /dc7P2Z0rwBl0gLjmdg==
X-Proofpoint-ORIG-GUID: qhRuA_AfBcLD81N7QkEXSJqC83cw8lbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012

Add parsing for the RPMI TEE descriptor-table SYSINFO format used
during discovery. Validate the V1 header, the table directory, each
table's byte range, endpoint role flags, and endpoint-to-service
ownership before any record is trusted.

Support both the Self SYSINFO response, which identifies the local
REE endpoint, and the Whole-system SYSINFO response, which enumerates
the physical TEE endpoints and their service UUIDs.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/Makefile  |   2 +-
 drivers/firmware/riscv_rpmi_tee/sysinfo.c | 385 ++++++++++++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/sysinfo.h | 244 +++++++++++++++++++
 3 files changed, 630 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/riscv_rpmi_tee/Makefile b/drivers/firmware/riscv_rpmi_tee/Makefile
index 8984127535ed..90cc6c39b273 100644
--- a/drivers/firmware/riscv_rpmi_tee/Makefile
+++ b/drivers/firmware/riscv_rpmi_tee/Makefile
@@ -3,6 +3,6 @@
 rpmi-tee-bus-y = bus.o
 rpmi-tee-core-objs := $(rpmi-tee-bus-y)
 obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) = rpmi-tee-core.o
-rpmi-tee-driver-y = driver.o
+rpmi-tee-driver-y = driver.o sysinfo.o
 rpmi-tee-module-objs := $(rpmi-tee-driver-y)
 obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) += rpmi-tee-module.o
diff --git a/drivers/firmware/riscv_rpmi_tee/sysinfo.c b/drivers/firmware/riscv_rpmi_tee/sysinfo.c
new file mode 100644
index 000000000000..5829ab6db042
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/sysinfo.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * RPMI TEE system-information descriptor table parsing
+ */
+
+#include <linux/errno.h>
+#include <linux/overflow.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#include "sysinfo.h"
+
+struct rpmi_tee_sysinfo_table {
+	const u8 *data;
+	u32 count;
+	u16 desc_size;
+	bool present;
+};
+
+/**
+ * struct rpmi_tee_sysinfo - Validated SYSINFO descriptor-table state
+ * @data: Start of the complete SYSINFO response buffer.
+ * @len: Size of @data in bytes.
+ * @tables: Table views indexed by &enum rpmi_tee_sysinfo_table_type.
+ *
+ * Each table view is populated only after the header, directory, table
+ * range, and descriptor size have been validated.
+ */
+struct rpmi_tee_sysinfo {
+	const u8 *data;
+	size_t len;
+	struct rpmi_tee_sysinfo_table tables[RPMI_TEE_SYSINFO_TABLE_MAX];
+};
+
+/* Assign table record @i in @t to a typed pointer @ptr. */
+#define rpmi_tee_sysinfo_entry_at(t, i, ptr)			\
+	do {							\
+		typeof(t) table = (t);				\
+		(ptr) = (typeof(ptr))(table->data +		\
+			(size_t)(i) * table->desc_size);	\
+	} while (0)
+
+/**
+ * rpmi_tee_sysinfo_buffer_range() - Validate a serialized SYSINFO range
+ * @total: Total SYSINFO buffer size in bytes.
+ * @offset: Byte offset of the first record.
+ * @count: Number of records.
+ * @size: Size of one record in bytes.
+ * @start: Optional returned byte offset of the range.
+ *
+ * Check that @count records of @size bytes beginning at @offset neither
+ * overflow nor extend beyond @total. If non-NULL, @start receives the byte
+ * offset of the validated range.
+ *
+ * Return: 0 on success or -EINVAL if the range is invalid.
+ */
+static int rpmi_tee_sysinfo_buffer_range(size_t total, u32 offset, u32 count,
+					 u16 size, size_t *start)
+{
+	size_t bytes, end;
+
+	if (check_mul_overflow((size_t)count, (size_t)size, &bytes) ||
+	    check_add_overflow((size_t)offset, bytes, &end) || end > total)
+		return -EINVAL;
+
+	if (start)
+		*start = offset;
+
+	return 0;
+}
+
+/* Validate a directory descriptor and record its table range in @info. */
+static int rpmi_tee_sysinfo_get_table(struct rpmi_tee_sysinfo *info,
+				      const struct rpmi_tee_sysinfo_table_desc *desc)
+{
+	u16 desc_size = get_unaligned_le16(&desc->desc_size);
+	u32 offset = get_unaligned_le32(&desc->offset);
+	u32 count = get_unaligned_le32(&desc->count);
+	u16 type = get_unaligned_le16(&desc->type);
+	struct rpmi_tee_sysinfo_table *table;
+	size_t start;
+
+	/* Validate table buffer. */
+	if (rpmi_tee_sysinfo_buffer_range(info->len, offset, count, desc_size,
+					  &start))
+		return -EINVAL;
+
+	switch (type) {
+	case RPMI_TEE_SYSINFO_TABLE_ENDPOINT:
+		if (desc_size < sizeof(struct rpmi_tee_sysinfo_endpoint))
+			return -EINVAL;
+		break;
+	case RPMI_TEE_SYSINFO_TABLE_SERVICE:
+		if (desc_size < sizeof(struct rpmi_tee_sysinfo_service))
+			return -EINVAL;
+		break;
+	case RPMI_TEE_SYSINFO_TABLE_PARCEL:
+		if (desc_size < sizeof(struct rpmi_tee_sysinfo_parcel))
+			return -EINVAL;
+		break;
+	case RPMI_TEE_SYSINFO_TABLE_PARCEL_RECEIVER:
+		if (desc_size < sizeof(struct rpmi_tee_sysinfo_parcel_receiver))
+			return -EINVAL;
+		break;
+	case RPMI_TEE_SYSINFO_TABLE_MEMORY_BLOCK:
+		if (desc_size < sizeof(struct rpmi_tee_sysinfo_memory_block))
+			return -EINVAL;
+		break;
+	case RPMI_TEE_SYSINFO_TABLE_BLOB:
+		/* BLOB table is defined as raw bytes. */
+		if (desc_size != 1)
+			return -EINVAL;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	table = &info->tables[type];
+	if (table->present)
+		return -EINVAL;
+
+	table->data = info->data + start;
+	table->count = count;
+	table->desc_size = desc_size;
+	table->present = true;
+
+	return 0;
+}
+
+/* Validate the header and directory, then populate table views. */
+static int rpmi_tee_sysinfo_init(struct rpmi_tee_sysinfo *info,
+				  const void *data, size_t len)
+{
+	const struct rpmi_tee_sysinfo_header *header = data;
+	u32 i, table_count, dir_off;
+	u16 header_size, dir_size;
+
+	memset(info, 0, sizeof(*info));
+
+	if (len < sizeof(struct rpmi_tee_sysinfo_header))
+		return -EINVAL;
+
+	if (get_unaligned_le32(&header->magic) != RPMI_TEE_SYSINFO_MAGIC ||
+	    get_unaligned_le16(&header->major) != RPMI_TEE_SYSINFO_VERSION_MAJOR ||
+	    get_unaligned_le32(&header->total_size) != len)
+		return -EINVAL;
+
+	header_size = get_unaligned_le16(&header->header_size);
+	dir_size = get_unaligned_le16(&header->table_desc_size);
+	table_count = get_unaligned_le32(&header->table_count);
+	dir_off = get_unaligned_le32(&header->table_dir_offset);
+
+	if (header_size < sizeof(struct rpmi_tee_sysinfo_header) ||
+	    dir_size < sizeof(struct rpmi_tee_sysinfo_table_desc) ||
+	    /* Directory can not overlap with the header. */
+	    dir_off < header_size)
+		return -EINVAL;
+
+	/* Validate directory buffer. */
+	if (rpmi_tee_sysinfo_buffer_range(len, dir_off, table_count, dir_size,
+					  NULL))
+		return -EINVAL;
+
+	info->data = data;
+	info->len = len;
+	for (i = 0; i < table_count; i++) {
+		const struct rpmi_tee_sysinfo_table_desc *desc;
+		int ret;
+
+		desc = rpmi_tee_sysinfo_desc_at(header, i);
+		ret = rpmi_tee_sysinfo_get_table(info, desc);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * rpmi_tee_sysinfo_table_check() - Check a table index range
+ * @table: Validated table view.
+ * @offset: First record index, or first byte index for a BLOB table.
+ * @count: Number of records, or bytes for a BLOB table.
+ *
+ * An empty range @count = 0 is valid.
+ * A non-empty range must fit wholly within @table.
+ *
+ * Return: %true if the range is valid or %false otherwise.
+ */
+static bool
+rpmi_tee_sysinfo_table_check(const struct rpmi_tee_sysinfo_table *table,
+			     u32 offset, u32 count)
+{
+	size_t end;
+
+	if (!count)
+		return true;
+	/* For table->present = false or empty table, table->count is zero. */
+	return !check_add_overflow((size_t)offset, (size_t)count, &end) &&
+		end <= table->count;
+}
+
+/* Validate endpoint records and their service ranges. */
+static int rpmi_tee_sysinfo_validate_endpoints(struct rpmi_tee_sysinfo *info,
+					       bool require_single_ree,
+					       u32 *self_ep_id)
+{
+	const struct rpmi_tee_sysinfo_table *service_table;
+	const struct rpmi_tee_sysinfo_table *ep_table;
+	const struct rpmi_tee_sysinfo_endpoint *ep;
+	u32 ree_count = 0, ep_idx;
+
+	ep_table = &info->tables[RPMI_TEE_SYSINFO_TABLE_ENDPOINT];
+	service_table = &info->tables[RPMI_TEE_SYSINFO_TABLE_SERVICE];
+	/* Endpoint table should exist and not empty; service table can be empty. */
+	if (!ep_table->present || !ep_table->count || !service_table->present)
+		return -EINVAL;
+
+	for (ep_idx = 0; ep_idx < ep_table->count; ep_idx++) {
+		rpmi_tee_sysinfo_entry_at(ep_table, ep_idx, ep);
+
+		/* struct rpmi_tee_sysinfo_endpoint. */
+		u32 ep_id = get_unaligned_le32(&ep->id);
+		u32 parent_id = get_unaligned_le32(&ep->parent_id);
+		u32 ep_flags = get_unaligned_le32(&ep->flags);
+		u32 service_first = get_unaligned_le32(&ep->service_first);
+		u32 service_range_count =
+			get_unaligned_le32(&ep->service_count);
+
+		bool is_physical =
+			ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_PHYSICAL;
+		bool is_ree = ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_REE;
+		/* Require exactly one endpoint location and security role. */
+		if (is_physical ==
+			    !!(ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_PROXIED) ||
+		    is_ree == !!(ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_TEE) ||
+		    ep_flags & ~RPMI_TEE_SYSINFO_ENDPOINT_F_MASK)
+			return -EINVAL;
+
+		if (!rpmi_tee_sysinfo_table_check(service_table, service_first,
+						  service_range_count))
+			return -EINVAL;
+
+		if (is_physical) {
+			if (parent_id != RPMI_TEE_SYSINFO_ENDPOINT_NO_PARENT)
+				return -EINVAL;
+
+			if (is_ree) {
+				ree_count++;
+				if (self_ep_id)
+					*self_ep_id = ep_id;
+			}
+		}
+	}
+
+	if (require_single_ree && ree_count != 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * rpmi_tee_sysinfo_parse_self() - Parse a Self SYSINFO table
+ * @data: SYSINFO response buffer.
+ * @len: Size of @data in bytes.
+ * @self_ep_id: Returned local REE endpoint identifier.
+ *
+ * Return: 0 on success or a negative error code.
+ */
+int rpmi_tee_sysinfo_parse_self(const void *data, size_t len, u32 *self_ep_id)
+{
+	struct rpmi_tee_sysinfo info;
+	int ret;
+
+	if (!self_ep_id)
+		return -EINVAL;
+
+	ret = rpmi_tee_sysinfo_init(&info, data, len);
+	if (ret)
+		return ret;
+	/* Expect single endpoint in a self SYSINFO response. */
+	if (info.tables[RPMI_TEE_SYSINFO_TABLE_ENDPOINT].count != 1)
+		return -EINVAL;
+
+	return rpmi_tee_sysinfo_validate_endpoints(&info, true, self_ep_id);
+}
+
+/**
+ * rpmi_tee_sysinfo_parse_system() - Parse a Whole-system SYSINFO table
+ * @data: SYSINFO response buffer.
+ * @len: Size of @data in bytes.
+ * @self_ep_id: Local REE endpoint identifier from the Self table.
+ * @system: Caller-provided discovery-result storage and returned counts.
+ *
+ * The parser records the number of required endpoint and service entries in
+ * @system. If either caller-provided array is too small, it fills the entries
+ * that fit, returns -ENOSPC, and reports the required counts. The caller may
+ * then allocate the reported capacities and call this function again.
+ *
+ * Return: 0 on success, -ENOSPC if an output array is too small, or a
+ * negative error code.
+ */
+int rpmi_tee_sysinfo_parse_system(const void *data, size_t len, u32 self_ep_id,
+				  struct rpmi_tee_sysinfo_system *system)
+{
+	const struct rpmi_tee_sysinfo_table *service_table;
+	const struct rpmi_tee_sysinfo_table *ep_table;
+	const struct rpmi_tee_sysinfo_endpoint *ep;
+	size_t ep_count = 0, service_count = 0;
+	struct rpmi_tee_sysinfo info;
+	bool self_ep_found = false;
+	u32 ep_idx, service_idx;
+	int ret;
+
+	if ((system->ep_capacity && !system->eps) ||
+	    (system->service_capacity && !system->services))
+		return -EINVAL;
+
+	ret = rpmi_tee_sysinfo_init(&info, data, len);
+	if (ret)
+		return ret;
+
+	ret = rpmi_tee_sysinfo_validate_endpoints(&info, false, NULL);
+	if (ret)
+		return ret;
+
+	ep_table = &info->tables[RPMI_TEE_SYSINFO_TABLE_ENDPOINT];
+	service_table = &info->tables[RPMI_TEE_SYSINFO_TABLE_SERVICE];
+
+	for (ep_idx = 0; ep_idx < ep_table->count; ep_idx++) {
+		rpmi_tee_sysinfo_entry_at(ep_table, ep_idx, ep);
+
+		/* struct rpmi_tee_sysinfo_endpoint. */
+		u32 ep_flags = get_unaligned_le32(&ep->flags);
+		u32 ep_id = get_unaligned_le32(&ep->id);
+		u32 service_first = get_unaligned_le32(&ep->service_first);
+		u32 service_range_count =
+			get_unaligned_le32(&ep->service_count);
+
+		/* Make sure self_ep_id exists in the list of endpoints. */
+		if ((ep_flags & (RPMI_TEE_SYSINFO_ENDPOINT_F_PHYSICAL |
+			      RPMI_TEE_SYSINFO_ENDPOINT_F_REE)) ==
+		    (RPMI_TEE_SYSINFO_ENDPOINT_F_PHYSICAL |
+		     RPMI_TEE_SYSINFO_ENDPOINT_F_REE) && ep_id == self_ep_id)
+			self_ep_found = true;
+
+		if (!(ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_PHYSICAL) ||
+		    !(ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_TEE))
+			continue;
+
+		if (ep_count < system->ep_capacity)
+			system->eps[ep_count].endpoint_id = ep_id;
+
+		ep_count++;
+
+		/* Extract per-endpoint services. */
+		for (service_idx = service_first;
+		     service_idx < service_first + service_range_count;
+		     service_idx++) {
+			const struct rpmi_tee_sysinfo_service *service;
+
+			if (service_count < system->service_capacity) {
+				rpmi_tee_sysinfo_entry_at(service_table,
+							  service_idx, service);
+				system->services[service_count].endpoint_id = ep_id;
+				import_uuid(&system->services[service_count].uuid,
+					    service->uuid);
+			}
+
+			if (check_add_overflow(service_count, 1, &service_count))
+				return -EOVERFLOW;
+		}
+	}
+
+	system->ep_count = ep_count;
+	system->service_count = service_count;
+
+	if (!self_ep_found)
+		return -EINVAL;
+
+	return ep_count > system->ep_capacity ||
+	       service_count > system->service_capacity ? -ENOSPC : 0;
+}
diff --git a/drivers/firmware/riscv_rpmi_tee/sysinfo.h b/drivers/firmware/riscv_rpmi_tee/sysinfo.h
new file mode 100644
index 000000000000..f275a612f720
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/sysinfo.h
@@ -0,0 +1,244 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __RISC_V_RPMI_TEE_SYSINFO_H__
+#define __RISC_V_RPMI_TEE_SYSINFO_H__
+
+#include <linux/bitops.h>
+#include <linux/limits.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/uuid.h>
+
+/* RPMI_TEE_FEATURE_SYSINFO_FORMAT. */
+#define RPMI_TEE_SYSINFO_FORMAT_CBOR  BIT(31)	/* CBOR format. */
+#define RPMI_TEE_SYSINFO_FORMAT_TABLE BIT(30)	/* Descriptor-table format. */
+
+/* "SYSINFO descriptor-table format". */
+
+#define RPMI_TEE_SYSINFO_MAGIC 0x49535452	/* Table magic ("RTSI"). */
+#define RPMI_TEE_SYSINFO_VERSION_MAJOR 1	/* Supported major version. */
+
+/**
+ * struct rpmi_tee_sysinfo_header - SYSINFO descriptor-table header
+ * @magic: RPMI_TEE_SYSINFO_MAGIC.
+ * @major: Major format version.
+ * @minor: Minor format version.
+ * @header_size: Header size, including compatible extensions.
+ * @table_desc_size: Size of one table-directory descriptor.
+ * @total_size: Total response size in bytes.
+ * @table_count: Number of table-directory descriptors.
+ * @table_dir_offset: Byte offset of the table directory.
+ * @flags: Ignored by version 1 Linux.
+ * @reserved: Ignored by version 1 Linux.
+ */
+struct rpmi_tee_sysinfo_header {
+	__le32 magic;
+	__le16 major;
+	__le16 minor;
+	__le16 header_size;
+	__le16 table_desc_size;
+	__le32 total_size;
+	__le32 table_count;
+	__le32 table_dir_offset;
+	__le32 flags;
+	__le32 reserved;
+} __packed;
+
+enum rpmi_tee_sysinfo_table_type {
+	RPMI_TEE_SYSINFO_TABLE_ENDPOINT = 0,	/* Endpoint records. */
+	RPMI_TEE_SYSINFO_TABLE_SERVICE,		/* Service UUID records. */
+	RPMI_TEE_SYSINFO_TABLE_PARCEL,		/* Memory parcel records. */
+	RPMI_TEE_SYSINFO_TABLE_PARCEL_RECEIVER,	/* Parcel receiver records. */
+	RPMI_TEE_SYSINFO_TABLE_MEMORY_BLOCK,	/* Memory block records. */
+	RPMI_TEE_SYSINFO_TABLE_BLOB,		/* Arbitrary byte data. */
+	RPMI_TEE_SYSINFO_TABLE_MAX,		/* One past the last table type. */
+};
+
+/**
+ * struct rpmi_tee_sysinfo_table_desc - SYSINFO table-directory descriptor
+ * @type: Table type from &enum rpmi_tee_sysinfo_table_type.
+ * @desc_size: Size of one record in this table.
+ * @count: Number of records in the table.
+ * @offset: Byte offset of the first record.
+ * @flags: Ignored by version 1 Linux.
+ */
+struct rpmi_tee_sysinfo_table_desc {
+	__le16 type;
+	__le16 desc_size;
+	__le32 count;
+	__le32 offset;
+	__le32 flags;
+} __packed;
+
+/**
+ * rpmi_tee_sysinfo_desc_at() - Get a table-directory descriptor
+ * @header: SYSINFO response header at the start of the response buffer.
+ * @index: Table-directory descriptor index.
+ *
+ * The caller must validate the table-directory range and @index before using
+ * the returned descriptor.
+ *
+ * Return: Pointer to the descriptor's known prefix.
+ */
+static inline const struct rpmi_tee_sysinfo_table_desc *
+rpmi_tee_sysinfo_desc_at(const struct rpmi_tee_sysinfo_header *header,
+			 u32 index)
+{
+	u32 offset = get_unaligned_le32(&header->table_dir_offset);
+	u16 stride = get_unaligned_le16(&header->table_desc_size);
+
+	return (const void *)((const u8 *)header + offset +
+			      (size_t)index * stride);
+}
+
+/* Records. */
+
+#define RPMI_TEE_SYSINFO_ENDPOINT_NO_PARENT	U32_MAX /* No parent endpoint. */
+
+#define RPMI_TEE_SYSINFO_ENDPOINT_F_PHYSICAL	BIT(0) /* Physical endpoint. */
+#define RPMI_TEE_SYSINFO_ENDPOINT_F_PROXIED	BIT(1) /* Proxied endpoint. */
+#define RPMI_TEE_SYSINFO_ENDPOINT_F_REE		BIT(2) /* REE endpoint. */
+#define RPMI_TEE_SYSINFO_ENDPOINT_F_TEE		BIT(3) /* TEE endpoint. */
+#define RPMI_TEE_SYSINFO_ENDPOINT_F_PERSISTENT	BIT(4) /* Persistent endpoint. */
+#define RPMI_TEE_SYSINFO_ENDPOINT_F_MASK		\
+	(RPMI_TEE_SYSINFO_ENDPOINT_F_PHYSICAL | \
+	 RPMI_TEE_SYSINFO_ENDPOINT_F_PROXIED | \
+	 RPMI_TEE_SYSINFO_ENDPOINT_F_REE | \
+	 RPMI_TEE_SYSINFO_ENDPOINT_F_TEE | \
+	 RPMI_TEE_SYSINFO_ENDPOINT_F_PERSISTENT)
+
+/**
+ * struct rpmi_tee_sysinfo_endpoint - Endpoint table record
+ * @id: Endpoint identifier.
+ * @parent_id: Parent endpoint identifier, if proxied.
+ * @flags: RPMI_TEE_SYSINFO_ENDPOINT_F_* flags.
+ * @service_first: First service record owned by the endpoint.
+ * @service_count: Number of service records owned by the endpoint.
+ * @parcel_first: First parcel record owned by the endpoint.
+ * @parcel_count: Number of parcel records owned by the endpoint.
+ * @name_offset: Byte offset of the endpoint name in the blob table.
+ * @name_length: Endpoint name length in bytes.
+ * @metadata_offset: Byte offset of endpoint metadata in the blob table.
+ * @metadata_length: Endpoint metadata length in bytes.
+ */
+struct rpmi_tee_sysinfo_endpoint {
+	__le32 id;
+	__le32 parent_id;
+	__le32 flags;
+	__le32 service_first;
+	__le32 service_count;
+	__le32 parcel_first;
+	__le32 parcel_count;
+	__le32 name_offset;
+	__le32 name_length;
+	__le32 metadata_offset;
+	__le32 metadata_length;
+} __packed;
+
+/**
+ * struct rpmi_tee_sysinfo_service - Service table record
+ * @uuid: Service UUID.
+ */
+struct rpmi_tee_sysinfo_service {
+	u8 uuid[16];
+} __packed;
+
+/**
+ * struct rpmi_tee_sysinfo_parcel - Memory parcel table record
+ * @id: Parcel identifier.
+ * @residual_access: Residual access permissions after relinquish.
+ * @receiver_first: First parcel receiver record.
+ * @receiver_count: Number of parcel receiver records.
+ * @block_first: First memory block record.
+ * @block_count: Number of memory block records.
+ * @label_offset: Byte offset of the parcel label in the blob table.
+ * @label_length: Parcel label length in bytes.
+ * @flags: Parcel flags.
+ * @reserved: Must be zero.
+ */
+struct rpmi_tee_sysinfo_parcel {
+	__le32 id;
+	__le32 residual_access;
+	__le32 receiver_first;
+	__le32 receiver_count;
+	__le32 block_first;
+	__le32 block_count;
+	__le32 label_offset;
+	__le32 label_length;
+	__le32 flags;
+	__le32 reserved;
+} __packed;
+
+/**
+ * struct rpmi_tee_sysinfo_parcel_receiver - Parcel receiver table record
+ * @endpoint_id: Receiver endpoint identifier.
+ * @access: Access permissions granted to the receiver.
+ * @flags: Receiver flags.
+ * @reserved: Must be zero.
+ */
+struct rpmi_tee_sysinfo_parcel_receiver {
+	__le32 endpoint_id;
+	__le32 access;
+	__le32 flags;
+	__le32 reserved;
+} __packed;
+
+/**
+ * struct rpmi_tee_sysinfo_memory_block - Memory block table record
+ * @address: Physical base address.
+ * @size: Block size in bytes.
+ */
+struct rpmi_tee_sysinfo_memory_block {
+	__le64 address;
+	__le64 size;
+} __packed;
+
+/**
+ * struct rpmi_tee_sysinfo_service_info - Discovered TEE service
+ * @endpoint_id: Owning TEE endpoint identifier.
+ * @uuid: Service UUID.
+ */
+struct rpmi_tee_sysinfo_service_info {
+	u32 endpoint_id;
+	uuid_t uuid;
+};
+
+/**
+ * struct rpmi_tee_sysinfo_endpoint_info - Discovered physical TEE endpoint
+ * @endpoint_id: TEE endpoint identifier.
+ */
+struct rpmi_tee_sysinfo_endpoint_info {
+	u32 endpoint_id;
+};
+
+/**
+ * struct rpmi_tee_sysinfo_system - Parsed Whole-system discovery result
+ * @eps: Caller-provided array of physical TEE endpoints.
+ * @ep_capacity: Number of entries available in @eps.
+ * @ep_count: Number of discovered physical TEE endpoints.
+ * @services: Caller-provided array of TEE services.
+ * @service_capacity: Number of entries available in @services.
+ * @service_count: Number of discovered TEE services.
+ *
+ * The caller supplies storage and capacities. A sizing call with zero
+ * capacities reports the required counts and returns -ENOSPC for a nonempty
+ * result.
+ */
+struct rpmi_tee_sysinfo_system {
+	struct rpmi_tee_sysinfo_endpoint_info *eps;
+	size_t ep_capacity;
+	size_t ep_count;
+	struct rpmi_tee_sysinfo_service_info *services;
+	size_t service_capacity;
+	size_t service_count;
+};
+
+int rpmi_tee_sysinfo_parse_self(const void *data, size_t len, u32 *self_ep_id);
+int rpmi_tee_sysinfo_parse_system(const void *data, size_t len,
+				  u32 self_ep_id,
+				  struct rpmi_tee_sysinfo_system *system);
+
+#endif /* __RISC_V_RPMI_TEE_SYSINFO_H__ */

-- 
2.34.1

