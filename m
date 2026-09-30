Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C2F4FDE55
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779968; cv=none; b=BXq6B8Jdskve6he/D4iv/igNcxVxfsr5d9xYg8UQZxmsuzgAksGmx1O3TNF7LMbNRnlHDwz+gVZfwK7rKGJEMTR0eVbiJR8m+CtBLkx+rAbvXLc6t4tE7gBKQVhGXlcgGJ1GMrnXlhfnpUV07eUcoqxUzdt+PVovQFuK6bg0slg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779968; c=relaxed/simple;
	bh=dogAdoQ/QCkQb5GhDzIyOp6UYu9xwRLxOLzN5HnPoIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gax0+7fEpaxHkZXQKsGmxo8cjmXOyvjeb3LRhvp5orc896BX5ahNJZtZtUpBizhDSP0rfSeoG6Xewb9CMrzXoo2rhZRYi+H/K2oN/F+zqoinFV00+A4+ZqXiNsj1HZgE3dIRP9IXRrhs98Hu88zSbnFSs6Z2lc7gPVVnZHaj4Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfCCPMna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JU6uTaDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfCCPMna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JU6uTaDN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxqqN3519842
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pujGoTye8c8
	YObD45SWJzA4GPFiLYw7N42q3MidIndo=; b=gfCCPMnaNXdaKUY2Kf3BnL6i30m
	hPMuG2IFctl2aGrE80RioybPYMSgnsdUZnN/Bo0nqfkQ5PlufDHalBSJTUDkgJOQ
	UA+poj+spUeZh02UNH5cUN9/acH6AIyPtPrhjbWzYEbU9l8uF6dUrv9afOCZxYsT
	lXjPzyGe5RBe2lgquOgw3IuzlaOc3QdSnVJYQNh2TrD09u0Kqs4uv6TIPAonKBOb
	uQnm3qF3hw8jRxJVpe+OP0dgP1Asp9JDrc8OpPWDA/Ox9B+7/NXrV4AAOQtipfDu
	1VGipdvDlaJFqED8Ng19sJuw95FnwgwO2Baz//12Bn7DigzynoeWehTP+XQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27hy1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d80ca2184so231581eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779944; x=1791384744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pujGoTye8c8YObD45SWJzA4GPFiLYw7N42q3MidIndo=;
        b=JU6uTaDN2AcdXl38uB0FpK7436H7tJTapsGfmPpyMcgZ3zGGSoB1a9SzfecMLU1Bvt
         T10Dl9qWBTrjLg0AEFgfJndTi2DHwts3cHY8VGsxOspxcHlpdLdqFdQOJd3mVGiJF+Is
         gd3Brh2GJakZQjToqtBhNimFp6F/sQKZGfov1niVkuoAbE3IDe/hgik9m42y7bCBP+1j
         MH/nOQNEwQK5cct8mC0vdTYrW9CO8dLAiWFOVI8yINb0nTbU0DuBzPbMQNBzd34MIzkY
         E9eGnzw09yX+wXUtP8qZxzxx1dLr5McLLdECh6zde+xHaDqGmP9ZiJM0bswwnY31LB0m
         txIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779944; x=1791384744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pujGoTye8c8YObD45SWJzA4GPFiLYw7N42q3MidIndo=;
        b=HEJ9h7XSZanZOScjeVqt6P83vXpeS7V4HtdAnKtsC9smbzI0+4RTb3H/pdonHMGSW8
         80igX4FMmqc4tkKmxGiXZQiKqUVwanF7qiVDPQQabOESqwC5NmFqtc0jDzj9ieqXm57h
         yzIu2y6RTZFabQUcipJcphJaxF+Eej8ZOUK3zx7Ji2/WDifs94okC75/KW8INtfxGgqA
         c9mk2ZljliAw89HRSimmpCmUnOSzCavCrt1Mr30u8esc6/XmCwNHGix2WSH6Gs6UIxIK
         7getnubP1U/PvlLkrXCdXX4v8sHPNJwp3/FPWXe0Rr5S+AFw4VpIAFRjcszqW6hBwHHC
         4+kg==
X-Forwarded-Encrypted: i=1; AKwUvBxk6B8JOA5vPxgTGk3+Xly8r1MZ6Hr6qx7PfY2j6n9ns+OVx6pfCEAoCU2y1qmVXHxlFF2/ywNe8mGMvJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYXsI5e9Im1LCUmqg5rRLUtM+kRB+wOFEMdIccVmGThBTzQ97m
	M3in9rVl7sZs5EwXh0dHdck6FV6T7Rf4sQhT2NbT6txfZwI9ng9+CPJpPQUk+tkPcjEAHhrYp3G
	cJN1UQnVr6J5yxDEiXTqsn8YQPiFvi9vvsaq2KMY9VO8AGfdP+PjlM0eTBQ95DTJXCOI=
X-Gm-Gg: AYBFou1NSjcsXgadDsbAp1TrGSGxkcsKzQzK8DJc1stqSWzzRfdatJjai9kaz+Gqy8y
	3Oy/ybq2itkifqfuAmV5w/+cpTUQMAnEQMriILHDfPCepYbBzEtsprBH4IjD5Z4Lzlpk3PKXCay
	qSPr/GiEipYlTeEOY0VC/ZHJwnCm7uIYYmdyptM8s5ynopluq0oUA55NefbJH973FzsZ/6Cpdxh
	FeiyJypiSyffWgpemrNlYeT0cixfFIg8oVPY9lyJHsBnKLocGsD98AyPKbvrnou1LV1JwFv3bnw
	O8Q9YLVH1Oc8VfWsvK/1i6zck/gtJNj5+dDjxcErxzsNVhc6yZ19OcBsZYe/mKc4qe9bDiMZtol
	piCGF/GYVHB/KZbuaXHwjb7aY5Jufhe/eUY8AM69hRUpqkW8UkalALks=
X-Received: by 2002:a05:7301:6192:10b0:34b:2362:90a8 with SMTP id 5a478bee46e88-34cdc4c0558mr2042932eec.19.1790779943569;
        Wed, 30 Sep 2026 07:52:23 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:10b0:34b:2362:90a8 with SMTP id 5a478bee46e88-34cdc4c0558mr2042887eec.19.1790779942856;
        Wed, 30 Sep 2026 07:52:22 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:22 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 3/6] trace: qpace: Add tracepoints for QPaCE operations
Date: Wed, 30 Sep 2026 07:52:12 -0700
Message-Id: <20260930145215.3380977-4-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX/ddvn3Az1eFy
 c7sOYGyqmozLaDwIMcllOeoKNyGtEoX/8LxWhs7h//pE5M9ZP9WKhQPemDPr7tqGJzsWbvWGoPs
 ldhDXa43YIh31WhsGsRJCA+r5Bd5qT0=
X-Proofpoint-GUID: SSjjgc478uixEiQQ0Xgoyoj8Ay4AEtLD
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd2228 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TOX0-C0EfqkpjbOQ6sUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX0mOKSQ7zhHw5
 ts5zCuvjgj5cSrWHFHoRC7P4ajRwPC3eMV0mHUpyxOCiND29Hw6TSdYeVx58xnn2BET8iLvIP2f
 T1jc4pntDk7aGrqZWO8qdLtVJRsSKoHoA7uxcar58qqoOy03C761abXeh9/TonM/o8322OJt4Nk
 uGDs4KPc1CHW7jMLNVD8p1Mmcpw4ZNX1PV3wBf+1GWt1WAtLlnH+KO5ebQgRBN6fswc7erAyLZZ
 H5pjfkywkb6vpzQtAnaiXWsC1/WokJ/BFvz8hEXu6tP0epfIcdb0Iaw5cDfeCHpEB+Nx/lMCwoV
 NML8h5aFEDm83QBte0WqkZ2QpzrUBKkgfPanxBsT2OthN8/I4eMGciUBIcwW5Cw9kkPS4BW4hMC
 GTOQix94P5hR7VolrwNJc8jmxK1b31JC1XewmcKvuwy031k3MHW83RVgPJK+iyP/Vu2xernwC1f
 YYU/5C3B5LQOJUJQ8Tg==
X-Proofpoint-ORIG-GUID: SSjjgc478uixEiQQ0Xgoyoj8Ay4AEtLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300059

Add ftrace tracepoints for the Qualcomm Page Compression Engine
to allow performance analysis and debugging of QPaCE hardware
operations.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 drivers/soc/qcom/qpace.c     | 12 +++++
 include/trace/events/qpace.h | 99 ++++++++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 include/trace/events/qpace.h

diff --git a/drivers/soc/qcom/qpace.c b/drivers/soc/qcom/qpace.c
index 69aa14b7c477..f5b21ffbcbff 100644
--- a/drivers/soc/qcom/qpace.c
+++ b/drivers/soc/qcom/qpace.c
@@ -23,6 +23,9 @@
 
 #include "qpace_internal.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qpace.h>
+
 #define QPACE_REG_PAGE_SIZE 4096
 #define QPACE_CORE_CACHEINDEX_SIZE 4
 
@@ -310,6 +313,8 @@ int qpace_urgent_compress(dma_addr_t input_addr,
 	if (ret)
 		return ret;
 
+	trace_start_qpace_urgent_compress((u64)input_addr, (u64)output_addr);
+
 	urg_reg_num = get_cpu() % NUM_TRS_ERS_URG_CMD_REGS;
 	stat_reg = qpace_urgent_command_trigger(input_addr, output_addr, urg_reg_num,
 						algo->urg_comp_cntxt);
@@ -338,6 +343,7 @@ int qpace_urgent_compress(dma_addr_t input_addr,
 
 	ret = FIELD_GET(URG_CMD_0_ED_STAT_SIZE, stat_reg);
 out:
+	trace_end_qpace_urgent_compress((u64)input_addr, (u64)output_addr, ret);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qpace_urgent_compress);
@@ -356,6 +362,9 @@ int qpace_urgent_decompress(dma_addr_t input_addr,
 	if (ret)
 		goto out;
 
+	trace_start_qpace_urgent_decompress((u64)input_addr,
+					    (u64)output_addr, input_size);
+
 	urg_reg_num = get_cpu() % NUM_TRS_ERS_URG_CMD_REGS;
 	qpace_write_urg_cmd_ctx(qpace_priv, QPACE_URG_CMD_0_CFG_CNTXT_SIZE_n_OFFSET,
 				urg_reg_num, algo->urg_decomp_cntxt,
@@ -381,6 +390,9 @@ int qpace_urgent_decompress(dma_addr_t input_addr,
 
 	ret = FIELD_GET(URG_CMD_0_ED_STAT_SIZE, stat_reg);
 out:
+	trace_end_qpace_urgent_decompress((u64)input_addr,
+					  (u64)output_addr,
+					  input_size, ret);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qpace_urgent_decompress);
diff --git a/include/trace/events/qpace.h b/include/trace/events/qpace.h
new file mode 100644
index 000000000000..3f0ccdb8f206
--- /dev/null
+++ b/include/trace/events/qpace.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qpace
+
+#if !defined(_TRACE_QPACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_QPACE_H
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(start_qpace_urgent_decompress,
+
+	TP_PROTO(u64 src, u64 dst, unsigned int size),
+	TP_ARGS(src, dst, size),
+
+	 TP_STRUCT__entry(
+		 __field(u64, src)
+		 __field(u64, dst)
+		 __field(unsigned int, size)
+	 ),
+
+	 TP_fast_assign(
+		 __entry->src = src;
+		 __entry->dst = dst;
+		 __entry->size = size;
+	 ),
+
+	 TP_printk("src=0x%llx dst=0x%llx size=%u",
+		   __entry->src, __entry->dst, __entry->size)
+);
+
+TRACE_EVENT(end_qpace_urgent_decompress,
+
+	 TP_PROTO(u64 src, u64 dst, unsigned int size, int ret),
+	 TP_ARGS(src, dst, size, ret),
+
+	 TP_STRUCT__entry(
+		 __field(u64, src)
+		 __field(u64, dst)
+		 __field(unsigned int, size)
+		 __field(int, ret)
+	 ),
+
+	 TP_fast_assign(
+		 __entry->src = src;
+		 __entry->dst = dst;
+		 __entry->size = size;
+		 __entry->ret = ret;
+	 ),
+
+	 TP_printk("src=0x%llx dst=0x%llx size=%u ret=%d",
+		   __entry->src, __entry->dst, __entry->size, __entry->ret)
+);
+
+TRACE_EVENT(start_qpace_urgent_compress,
+
+	 TP_PROTO(u64 src, u64 dst),
+	 TP_ARGS(src, dst),
+
+	 TP_STRUCT__entry(
+		 __field(u64, src)
+		 __field(u64, dst)
+	 ),
+
+	 TP_fast_assign(
+		 __entry->src = src;
+		 __entry->dst = dst;
+	 ),
+
+	 TP_printk("src=0x%llx dst=0x%llx",
+		   __entry->src, __entry->dst)
+);
+
+TRACE_EVENT(end_qpace_urgent_compress,
+
+	 TP_PROTO(u64 src, u64 dst, int ret),
+	 TP_ARGS(src, dst, ret),
+
+	 TP_STRUCT__entry(
+		 __field(u64, src)
+		 __field(u64, dst)
+		 __field(int, ret)
+	 ),
+
+	 TP_fast_assign(
+		 __entry->src = src;
+		 __entry->dst = dst;
+		 __entry->ret = ret;
+	 ),
+
+	 TP_printk("src=0x%llx dst=0x%llx ret=%d",
+		   __entry->src, __entry->dst, __entry->ret)
+);
+
+#endif /* _TRACE_QPACE_H */
+
+#include <trace/define_trace.h>
