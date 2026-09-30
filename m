Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E53EEAD7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750381; cv=none; b=L+3N826u9BrdPmWfWrVKzEkCotfdvfBGunUz098FF6X7paKVbkM1NU5e77rnO4WV7R7c0Mwq6ATBp4i0lkEn/M7MO2Gr6eEp+D3/1ShpnPs87uZ3AN5vQg/ok302UiCglrFHb6Mt0psuBUJwghMDCHXZcdCw0LslWyzalbNKaRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750381; c=relaxed/simple;
	bh=xKnX/euCiK/QqaeXOzIScsgk8T7xfOv9BUYMjvYiHjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIClA7wl48XwFjCEolZpB3IUXPydFm1SXIoJgKAkhYpo4BkiVvnvMu9LOibKxmTVC+4DXjL/acXeXbR3jKDXAGzQZiIMtCNKUF8C5nsBFN0nZeSQID2lK3jmhCsWdsaIFRAs8GbngzpLr4Nu64+cg6/0KZhqDe1cvbq0EZN5GkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DU6cKpdr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nl9GLaMq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DU6cKpdr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nl9GLaMq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6F9ja1592835
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5ZZaESGLKRG
	RLOjYU42IQLznpJTnyGsm5Bd30n0iDFk=; b=DU6cKpdr9JziYA+f/jMU6sxrjNr
	G+Zn1PF8FFEJYjeog0vm5jW/Pw6vh3UIO5Oc9OKjUzIYw/7U18E3F3MdPtxifPwP
	wiKiORPmUoyZ3BPJYyURQGd8tDFAcZI0JbTpB1zOnRln0JqqH23GfoAVphGxZTKZ
	Z7MqSDk7odbAC1/OQBpN1GU25b/JOflPjQYMu5Xp2F4BpD1RpM3BhNJEF1diXjqr
	MelEXljKSFk7DLOqfsO9HT9U39Mvu3Slyw2HtbRWXEI0N+x/KdhayFSiXTvaIuVf
	MJCD0lrWLtxKcXgpuwv/xib9cnd+Hwr3/CaWzPn5tDrgwHGwpSCYHUMsBLg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0hsh2u45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:39:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d18eee3dfso322497eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750376; x=1791355176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZZaESGLKRGRLOjYU42IQLznpJTnyGsm5Bd30n0iDFk=;
        b=Nl9GLaMqsov5gouqEmkQjfFUW+rp5P8V2BdRKZs8kei2dNGSfQXR7McdBHF4+CWA6D
         tycbrlnAEqgMjh1ev6J82CzeZhYYk/2hhlq9cAdHqRH9WqixyNXwIhdDX5FXAeb+VeB7
         1DB/H0vjt5LlUhZDGxgdAaZ8imPhlFbJJelP3xqO0XLaZ+ILhPGA1v1L/GB6QdGiAHoN
         78JWrZaAZ1Oeiu7GFKEubdfHCckNzQST20IZDxKzQ6N+DnG1wOwIFz8WthknBo5LzSLh
         sdYPLmBpAqlbmIb1fkNy4r3YuaWbpnXY7TCIWB1VedSar4qLf9cjFEfgbyMmRtvHND8J
         a+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750376; x=1791355176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ZZaESGLKRGRLOjYU42IQLznpJTnyGsm5Bd30n0iDFk=;
        b=DKvMMRHZeOjHRYd8WsXq2DMXkl8+AK7NeiiMkJ9hGd1/fIGYAkeQXAZxeCOdXW9Zdt
         oG36tTnJ3xWKYXBKtqW9jdSb2b00XgHOE4qVyyBm2DHhyTrqOHfkbka1YqvTQz69IXEq
         6iinj0LYWI6eyV3kWdx0678UXzTxg6lgifAHl3Mi8BTlOZRbZcrkSv6MvNyvYc1fJ/bk
         KP5xsPgnz1nogA70IX/7fsKR/gArrbomsbLAUOyPjzjlncVZNrZdlIlmkeSvMvxTwUS5
         TNkZTGyqj2GmV9HWYk43uyXDZNHuoBFUxXhuForuJraOFZ/jfuXoDXIIkLP+iepXo9e+
         oVdA==
X-Gm-Message-State: AFuF++nwaCKT2qsML0+7zmLfoUPdfH4BzjI8jrcGOUnE2yg9lRnd4xo9
	Kvhm1fE1P/mlTEmOXUSBdOZt7o3h9yTZQnWoLV/IIFkm5J6zFgtf8gg/fyolN5fCQtcbjs0Qo1V
	PSklpswKB2r1hBixh3iUQWk+xKMAQLVeYwy1+0o3j9vWoFDAULclSo6m7sTKWh7rzPWvpEPzhIk
	4=
X-Gm-Gg: AYBFou3SXOlOtWzlYORkL8C1510Lh+kEVlRmdXEkYluwRKteuqpqwxMpdZdFYVniVug
	2D13M2pzBw7uRZV4W+uDYT02lhegDosl42KdhI/OCM5q8FsGbMP6mriJg25erGUNhlWN7xN0vk+
	xbfhaGTkObPOnR9wGhdHl9X6C4COJPnHbj7bsMz/MhcINNbnZ5bjSHJXcRJwcbSNNFTJLLM0SKr
	nZD8LTS1XqGQDavQUH9/g+sSmk7XOZKz8lN0PRJNzTXJVHun8BK6ZLscccgGFSwLeJYNUnvDRqP
	cs5BEdNo6+a0QDdleMQ72ry0jpy9fnsiMR0ke/hohQCaYhewpkvyw/1/gEejRA+1TfVJiTRzhaW
	xCXwlum2PSAGJoMo0ViLvJ9fJD8bUcKsXXGCJXXH0TQ0LplFzeUIGeh8vsvr3Z8s7m0JQRmEc/0
	GD3ZJHZGh3DUmvGHJP/9MGiK8l
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr230620c88.36.1790750375675;
        Tue, 29 Sep 2026 23:39:35 -0700 (PDT)
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr230562c88.36.1790750374688;
        Tue, 29 Sep 2026 23:39:34 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:39:34 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 1/8] riscv: Introduce support for hardware break/watchpoints
Date: Wed, 30 Sep 2026 12:09:12 +0530
Message-ID: <20260930063919.608911-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfXxEvrqmb18/R/
 PVxH052UWQeXu6TCKpXrDyZ6WN6clqrCwc2ytWY7Hkov8dr8V8umQW1nrCmPVZosmm321fvfeQJ
 VRhKF68T4cKS7McUzJvYgbChpXqfIs5zf/4AenBTkXwa/sUkbrpeX6udr1TCu1EqsPQtTGi6Ekj
 sWzY/p3YLJHDziswe8fmMpZ1Selhou94fJAmVtZCjlS7C22Z2NtitPuzYlBP1YN1X6QdaGfQ2tA
 jepZBS7u284tN9jZU1h/HJsBFIjrfb7IW+6Ax3VvkJH0lcluQfgAKD4UKuxlKeIMMpZjclJNV2N
 wTV+a5BS8f2Np+qTaoCy2szaTOwuoTColLOVtLRSy7Ni3WGK39ewgFDUqT5jS6l6HMWE0Ph6I4K
 zTPoybZ2aHpcPwBahRGTzKAQBeeaWLO3J9h32JUsaxlEvLC5xxmJD1m76Pm3pvvPx2adpxlFU/y
 Kh18NgA074Ivc8x+MMQ==
X-Proofpoint-GUID: nYsrqFcipXQsU7WLekaVYkyETR5VIc-M
X-Proofpoint-ORIG-GUID: nYsrqFcipXQsU7WLekaVYkyETR5VIc-M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX25vDWbs7iFM2
 BGZFDqrfneO5khn2Rb7smp2XXm9s8TehJaC7peGhWuECeASCaJzvQNxnNPvqRXyLH/v3xAGz/HH
 C16sG2vSQ2p/ZjEsYODKjr3mOTqAqJE=
X-Authority-Analysis: v=2.4 cv=cZZHPXDM c=1 sm=1 tr=0 ts=6abcaea9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=oxkvXMDg2opwoU6JHakA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300026

RISC-V hardware breakpoint framework is built on top of perf subsystem
and uses SBI debug trigger extension to install/uninstall/update/enable/disable
hardware triggers as specified in Sdtrig ISA extension.

While handling breakpoints, trust the hardware record, (hit[0-1]) bits, when deciding
if a trigger fired, and by clearing it once it's been read.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/Kconfig                     |   2 +
 arch/riscv/include/asm/hw_breakpoint.h | 312 +++++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 746 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c              |   6 +
 6 files changed, 1069 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..17fa7d4f9729 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -174,6 +174,8 @@ config RISCV
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
+	select HAVE_GENERIC_VDSO if MMU
+	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
 	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
new file mode 100644
index 000000000000..a165bb9636de
--- /dev/null
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -0,0 +1,312 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef __RISCV_HW_BREAKPOINT_H
+#define __RISCV_HW_BREAKPOINT_H
+
+struct task_struct;
+
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+
+#include <uapi/linux/hw_breakpoint.h>
+
+/* Maximum number of hardware breakpoints supported */
+#define RISCV_HW_BP_NUM_MAX 32
+
+#if __riscv_xlen == 64
+#define cpu_to_le cpu_to_le64
+#define le_to_cpu le64_to_cpu
+#elif __riscv_xlen == 32
+#define cpu_to_le cpu_to_le32
+#define le_to_cpu le32_to_cpu
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define CLEAR_DBTR_BIT(_target, _bit)	((_target) &= ~BIT(_bit))
+#define SET_DBTR_BIT(_target, _bit)	((_target) |= BIT(_bit))
+
+#define RISCV_DBTR_EXEC		BIT(0)
+#define RISCV_DBTR_LOAD		BIT(1)
+#define RISCV_DBTR_STORE	BIT(2)
+#define RISCV_DBTR_LDST		(RISCV_DBTR_LOAD | RISCV_DBTR_STORE)
+
+enum {
+	RISCV_DBTR_TRIG_NONE = 0,
+	RISCV_DBTR_TRIG_LEGACY,
+	RISCV_DBTR_TRIG_MCONTROL,
+	RISCV_DBTR_TRIG_ICOUNT,
+	RISCV_DBTR_TRIG_ITRIGGER,
+	RISCV_DBTR_TRIG_ETRIGGER,
+	RISCV_DBTR_TRIG_MCONTROL6,
+};
+
+/* Trigger Data 1 */
+#define RISCV_DBTR_TDATA1_DATA_BIT	0
+#if __riscv_xlen == 64
+#define RISCV_DBTR_TDATA1_DMODE_BIT	59
+#define RISCV_DBTR_TDATA1_TYPE_BIT	60
+#elif __riscv_xlen == 32
+#define RISCV_DBTR_TDATA1_DMODE_BIT	27
+#define RISCV_DBTR_TDATA1_TYPE_BIT	28
+#else
+#error "Unknown __riscv_xlen"
+#endif
+
+#if __riscv_xlen == 64
+#define RISCV_DBTR_TDATA1_DATA_BIT_MASK		GENMASK(58, RISCV_DBTR_TDATA1_DATA_BIT)
+#elif __riscv_xlen == 32
+#define RISCV_DBTR_TDATA1_DATA_BIT_MASK		GENMASK(26, RISCV_DBTR_TDATA1_DATA_BIT)
+#else
+#error "Unknown __riscv_xlen"
+#endif
+#define RISCV_DBTR_TDATA1_DMODE_BIT_MASK	BIT(RISCV_DBTR_TDATA1_DMODE_BIT)
+#define RISCV_DBTR_TDATA1_TYPE_BIT_MASK		\
+	GENMASK(RISCV_DBTR_TDATA1_TYPE_BIT + 3, RISCV_DBTR_TDATA1_TYPE_BIT)
+
+/* MC - Match Control Type Register */
+#define RISCV_DBTR_MC_LOAD_BIT		0
+#define RISCV_DBTR_MC_STORE_BIT		1
+#define RISCV_DBTR_MC_EXEC_BIT		2
+#define RISCV_DBTR_MC_U_BIT		3
+#define RISCV_DBTR_MC_S_BIT		4
+#define RISCV_DBTR_MC_RES2_BIT		5
+#define RISCV_DBTR_MC_M_BIT		6
+#define RISCV_DBTR_MC_MATCH_BIT		7
+#define RISCV_DBTR_MC_CHAIN_BIT		11
+#define RISCV_DBTR_MC_ACTION_BIT	12
+#define RISCV_DBTR_MC_SIZELO_BIT	16
+#define RISCV_DBTR_MC_TIMING_BIT	18
+#define RISCV_DBTR_MC_SELECT_BIT	19
+#define RISCV_DBTR_MC_HIT_BIT		20
+#if __riscv_xlen >= 64
+#define RISCV_DBTR_MC_SIZEHI_BIT	21
+#endif
+#if __riscv_xlen == 64
+#define RISCV_DBTR_MC_MASKMAX_BIT	53
+#define RISCV_DBTR_MC_DMODE_BIT		59
+#define RISCV_DBTR_MC_TYPE_BIT		60
+#elif __riscv_xlen == 32
+#define RISCV_DBTR_MC_MASKMAX_BIT	21
+#define RISCV_DBTR_MC_DMODE_BIT		27
+#define RISCV_DBTR_MC_TYPE_BIT		28
+#else
+#error "Unknown riscv xlen"
+#endif
+
+#define RISCV_DBTR_MC_LOAD_BIT_MASK	BIT(RISCV_DBTR_MC_LOAD_BIT)
+#define RISCV_DBTR_MC_STORE_BIT_MASK	BIT(RISCV_DBTR_MC_STORE_BIT)
+#define RISCV_DBTR_MC_EXEC_BIT_MASK	BIT(RISCV_DBTR_MC_EXEC_BIT)
+#define RISCV_DBTR_MC_U_BIT_MASK	BIT(RISCV_DBTR_MC_U_BIT)
+#define RISCV_DBTR_MC_S_BIT_MASK	BIT(RISCV_DBTR_MC_S_BIT)
+#define RISCV_DBTR_MC_RES2_BIT_MASK	BIT(RISCV_DBTR_MC_RES2_BIT)
+#define RISCV_DBTR_MC_M_BIT_MASK	BIT(RISCV_DBTR_MC_M_BIT)
+#define RISCV_DBTR_MC_MATCH_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_MATCH_BIT + 3, RISCV_DBTR_MC_MATCH_BIT)
+#define RISCV_DBTR_MC_CHAIN_BIT_MASK	BIT(RISCV_DBTR_MC_CHAIN_BIT)
+#define RISCV_DBTR_MC_ACTION_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_ACTION_BIT + 3, RISCV_DBTR_MC_ACTION_BIT)
+#define RISCV_DBTR_MC_SIZELO_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_SIZELO_BIT + 1, RISCV_DBTR_MC_SIZELO_BIT)
+#define RISCV_DBTR_MC_TIMING_BIT_MASK	BIT(RISCV_DBTR_MC_TIMING_BIT)
+#define RISCV_DBTR_MC_SELECT_BIT_MASK	BIT(RISCV_DBTR_MC_SELECT_BIT)
+#define RISCV_DBTR_MC_HIT_BIT_MASK	BIT(RISCV_DBTR_MC_HIT_BIT)
+#if __riscv_xlen >= 64
+#define RISCV_DBTR_MC_SIZEHI_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_SIZEHI_BIT + 1, RISCV_DBTR_MC_SIZEHI_BIT)
+#endif
+#define RISCV_DBTR_MC_MASKMAX_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_MASKMAX_BIT + 5, RISCV_DBTR_MC_MASKMAX_BIT)
+#define RISCV_DBTR_MC_DMODE_BIT_MASK	BIT(RISCV_DBTR_MC_DMODE_BIT)
+#define RISCV_DBTR_MC_TYPE_BIT_MASK	GENMASK(RISCV_DBTR_MC_TYPE_BIT + 3, RISCV_DBTR_MC_TYPE_BIT)
+
+/* MC6 - Match Control 6 Type Register */
+#define RISCV_DBTR_MC6_LOAD_BIT		0
+#define RISCV_DBTR_MC6_STORE_BIT	1
+#define RISCV_DBTR_MC6_EXEC_BIT		2
+#define RISCV_DBTR_MC6_U_BIT		3
+#define RISCV_DBTR_MC6_S_BIT		4
+#define RISCV_DBTR_MC6_RES2_BIT		5
+#define RISCV_DBTR_MC6_M_BIT		6
+#define RISCV_DBTR_MC6_MATCH_BIT	7
+#define RISCV_DBTR_MC6_CHAIN_BIT	11
+#define RISCV_DBTR_MC6_ACTION_BIT	12
+#define RISCV_DBTR_MC6_SIZE_BIT		16
+#define RISCV_DBTR_MC6_TIMING_BIT	20
+#define RISCV_DBTR_MC6_SELECT_BIT	21
+#define RISCV_DBTR_MC6_HIT_BIT		22
+#define RISCV_DBTR_MC6_VU_BIT		23
+#define RISCV_DBTR_MC6_VS_BIT		24
+#if __riscv_xlen == 64
+#define RISCV_DBTR_MC6_DMODE_BIT	59
+#define RISCV_DBTR_MC6_TYPE_BIT		60
+#elif __riscv_xlen == 32
+#define RISCV_DBTR_MC6_DMODE_BIT	27
+#define RISCV_DBTR_MC6_TYPE_BIT		28
+#else
+#error "Unknown riscv xlen"
+#endif
+
+#define RISCV_DBTR_MC6_LOAD_BIT_MASK	BIT(RISCV_DBTR_MC6_LOAD_BIT)
+#define RISCV_DBTR_MC6_STORE_BIT_MASK	BIT(RISCV_DBTR_MC6_STORE_BIT)
+#define RISCV_DBTR_MC6_EXEC_BIT_MASK	BIT(RISCV_DBTR_MC6_EXEC_BIT)
+#define RISCV_DBTR_MC6_U_BIT_MASK	BIT(RISCV_DBTR_MC6_U_BIT)
+#define RISCV_DBTR_MC6_S_BIT_MASK	BIT(RISCV_DBTR_MC6_S_BIT)
+#define RISCV_DBTR_MC6_RES2_BIT_MASK	BIT(RISCV_DBTR_MC6_RES2_BIT)
+#define RISCV_DBTR_MC6_M_BIT_MASK	BIT(RISCV_DBTR_MC6_M_BIT)
+#define RISCV_DBTR_MC6_MATCH_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC6_MATCH_BIT + 3, RISCV_DBTR_MC6_MATCH_BIT)
+#define RISCV_DBTR_MC6_CHAIN_BIT_MASK	BIT(RISCV_DBTR_MC6_CHAIN_BIT)
+#define RISCV_DBTR_MC6_ACTION_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC6_ACTION_BIT + 3, RISCV_DBTR_MC6_ACTION_BIT)
+#define RISCV_DBTR_MC6_SIZE_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC6_SIZE_BIT + 3, RISCV_DBTR_MC6_SIZE_BIT)
+#define RISCV_DBTR_MC6_TIMING_BIT_MASK	BIT(RISCV_DBTR_MC6_TIMING_BIT)
+#define RISCV_DBTR_MC6_SELECT_BIT_MASK	BIT(RISCV_DBTR_MC6_SELECT_BIT)
+#define RISCV_DBTR_MC6_HIT_BIT_MASK	BIT(RISCV_DBTR_MC6_HIT_BIT)
+#define RISCV_DBTR_MC6_VU_BIT_MASK	BIT(RISCV_DBTR_MC6_VU_BIT)
+#define RISCV_DBTR_MC6_VS_BIT_MASK	BIT(RISCV_DBTR_MC6_VS_BIT)
+#define RISCV_DBTR_MC6_DMODE_BIT_MASK	BIT(RISCV_DBTR_MC6_DMODE_BIT)
+#define RISCV_DBTR_MC6_TYPE_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC6_TYPE_BIT + 3, RISCV_DBTR_MC6_TYPE_BIT)
+
+/*
+ * mcontrol6 hit1:hit0 (ratified Debug spec v1.0). RISCV_DBTR_MC6_HIT_BIT
+ * above is hit0 (bit 22); hit1 (bit 25) is not adjacent to it but combines
+ * with it into a single 2-bit field, hit1 as MSB.
+ */
+#define RISCV_DBTR_MC6_HIT1_BIT		25
+#define RISCV_DBTR_MC6_HIT1_BIT_MASK		BIT(RISCV_DBTR_MC6_HIT1_BIT)
+
+#define RISCV_DBTR_MC6_HIT_FALSE	0	/* trigger did not fire */
+#define RISCV_DBTR_MC6_HIT_BEFORE	1	/* fired before the instruction */
+#define RISCV_DBTR_MC6_HIT_AFTER	2	/* fired after, epc has moved past */
+#define RISCV_DBTR_MC6_HIT_IMM_AFTER	3	/* fired immediately after */
+
+#define RISCV_DBTR_MC6_GET_HIT(_t1)					\
+	({								\
+		typeof(_t1) __t1 = (_t1);				\
+		(((__t1) & RISCV_DBTR_MC6_HIT1_BIT_MASK) ? 2 : 0) |	\
+			(((__t1) & RISCV_DBTR_MC6_HIT_BIT_MASK) ? 1 : 0); \
+	})
+
+#define RISCV_DBTR_MC6_CLEAR_HIT(_t1)					\
+	((_t1) &= ~(RISCV_DBTR_MC6_HIT1_BIT_MASK | RISCV_DBTR_MC6_HIT_BIT_MASK))
+
+#define RISCV_DBTR_SET_TDATA1_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (td1t1) = (_t1);				\
+		(td1t1) &= ~RISCV_DBTR_TDATA1_TYPE_BIT_MASK;		\
+		(td1t1) |= (((unsigned long)(_type)			\
+			     << RISCV_DBTR_TDATA1_TYPE_BIT)		\
+			    & RISCV_DBTR_TDATA1_TYPE_BIT_MASK);		\
+		(td1t1);						\
+	})
+
+#define RISCV_DBTR_SET_MC_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (mct1) = (_t1);				\
+		(mct1) &= ~RISCV_DBTR_MC_TYPE_BIT_MASK;			\
+		(mct1) |= (((unsigned long)(_type)			\
+			    << RISCV_DBTR_MC_TYPE_BIT)			\
+			   & RISCV_DBTR_MC_TYPE_BIT_MASK);		\
+		(mct1);							\
+	})
+
+#define RISCV_DBTR_SET_MC6_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (mc6t1) = (_t1);				\
+		(mc6t1) &= ~RISCV_DBTR_MC6_TYPE_BIT_MASK;		\
+		(mc6t1) |= (((unsigned long)(_type)			\
+			     << RISCV_DBTR_MC6_TYPE_BIT)		\
+			    & RISCV_DBTR_MC6_TYPE_BIT_MASK);		\
+		(mc6t1);						\
+	})
+
+#define RISCV_DBTR_SET_MC_EXEC_BIT(_t1)			\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_EXEC_BIT)
+
+#define RISCV_DBTR_SET_MC_LOAD_BIT(_t1)			\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_LOAD_BIT)
+
+#define RISCV_DBTR_SET_MC_STORE_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_STORE_BIT)
+
+#define RISCV_DBTR_SET_MC_SIZELO(_t1, _val)				\
+	({								\
+		typeof(_t1) (mcslt1) = (_t1);				\
+		mcslt1 &= ~RISCV_DBTR_MC_SIZELO_BIT_MASK;		\
+		mcslt1 |= (((_val) << RISCV_DBTR_MC_SIZELO_BIT)		\
+			   & RISCV_DBTR_MC_SIZELO_BIT_MASK);		\
+		(mcslt1);						\
+	})
+
+#if __riscv_xlen >= 64
+#define RISCV_DBTR_SET_MC_SIZEHI(_t1, _val)				\
+	({								\
+		typeof(_t1) (mcsht1) = (_t1);				\
+		mcsht1 &= ~RISCV_DBTR_MC_SIZEHI_BIT_MASK;		\
+		mcsht1 |= (((_val) << RISCV_DBTR_MC_SIZEHI_BIT)		\
+			   & RISCV_DBTR_MC_SIZEHI_BIT_MASK);		\
+		(mcsht1);						\
+	})
+#else
+/* SIZEHI does not exist in the rv32 mcontrol layout; nothing to set. */
+#define RISCV_DBTR_SET_MC_SIZEHI(_t1, _val) ((void)(_val), (_t1))
+#endif
+
+#define RISCV_DBTR_SET_MC6_EXEC_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_EXEC_BIT)
+
+#define RISCV_DBTR_SET_MC6_LOAD_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_LOAD_BIT)
+
+#define RISCV_DBTR_SET_MC6_STORE_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_STORE_BIT)
+
+#define RISCV_DBTR_SET_MC6_SIZE(_t1, _val)				\
+	({								\
+		typeof(_t1) (mc6szt1) = (_t1);				\
+		(mc6szt1) &= ~RISCV_DBTR_MC6_SIZE_BIT_MASK;		\
+		(mc6szt1) |= (((_val) << RISCV_DBTR_MC6_SIZE_BIT)	\
+			      & RISCV_DBTR_MC6_SIZE_BIT_MASK);		\
+		(mc6szt1);						\
+	})
+
+struct arch_hw_breakpoint {
+	unsigned long address;
+	unsigned long len;
+	unsigned int type;
+
+	/* Trigger configuration data */
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct perf_event_attr;
+struct notifier_block;
+struct perf_event;
+struct pt_regs;
+
+int hw_breakpoint_slots(int type);
+int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
+int hw_breakpoint_arch_parse(struct perf_event *bp,
+			     const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw);
+int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
+				    unsigned long val, void *data);
+
+void arch_enable_hw_breakpoint(struct perf_event *bp);
+void arch_update_hw_breakpoint(struct perf_event *bp);
+void arch_disable_hw_breakpoint(struct perf_event *bp);
+int arch_install_hw_breakpoint(struct perf_event *bp);
+void arch_uninstall_hw_breakpoint(struct perf_event *bp);
+void hw_breakpoint_pmu_read(struct perf_event *bp);
+
+#else
+
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+#endif /* __RISCV_HW_BREAKPOINT_H */
diff --git a/arch/riscv/include/asm/kdebug.h b/arch/riscv/include/asm/kdebug.h
index 85ac00411f6e..53e989781aa1 100644
--- a/arch/riscv/include/asm/kdebug.h
+++ b/arch/riscv/include/asm/kdebug.h
@@ -6,7 +6,8 @@
 enum die_val {
 	DIE_UNUSED,
 	DIE_TRAP,
-	DIE_OOPS
+	DIE_OOPS,
+	DIE_DEBUG
 };
 
 #endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index ebe1c3588177..a4197c3c36e8 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
+obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP)		+= sbi-ipi.o
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
new file mode 100644
index 000000000000..c2ab5e6008e7
--- /dev/null
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -0,0 +1,746 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/hw_breakpoint.h>
+#include <linux/perf_event.h>
+#include <linux/spinlock.h>
+#include <linux/percpu.h>
+#include <linux/kdebug.h>
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/cpuhotplug.h>
+
+#include <asm/sbi.h>
+
+/* Registered per-cpu bp/wp */
+static DEFINE_PER_CPU(struct perf_event *, pcpu_hw_bp_events[RISCV_HW_BP_NUM_MAX]);
+static DEFINE_PER_CPU(unsigned long, ecall_lock_flags);
+static DEFINE_PER_CPU(raw_spinlock_t, ecall_lock);
+
+/* Per-cpu shared memory between S and M mode */
+static union sbi_dbtr_shmem_entry __percpu *sbi_dbtr_shmem;
+
+/* number of debug triggers on this cpu . */
+static int dbtr_total_num __ro_after_init;
+static int dbtr_type __ro_after_init;
+static int dbtr_init __ro_after_init;
+
+#define MEM_HI(_m)		(0UL)
+#define MEM_LO(_m)		((unsigned long)(_m))
+
+static int arch_smp_setup_sbi_shmem(unsigned int cpu)
+{
+	union sbi_dbtr_shmem_entry *dbtr_shmem;
+	phys_addr_t shmem_pa;
+	struct sbiret ret;
+
+	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
+
+	shmem_pa = per_cpu_ptr_to_phys(dbtr_shmem);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
+			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("%s: failed to setup shared memory. error: %ld\n",
+			__func__, ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
+
+	return 0;
+}
+
+static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
+{
+	struct sbiret ret;
+
+	/* Disable shared memory */
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
+			SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
+
+	if (ret.error)
+		pr_warn("%s: failed to disable shared memory. error: %ld\n",
+			__func__, ret.error);
+	else
+		pr_info("CPU %d: HW Breakpoint shared memory disabled.\n", cpu);
+
+	return 0;
+}
+
+static void init_sbi_dbtr(void)
+{
+	unsigned long tdata1;
+	struct sbiret ret;
+
+	if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
+		pr_warn("SBI_EXT_DBTR is not supported\n");
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			0, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect triggers\n");
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	tdata1 = 0;
+	tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL6);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect mcontrol6 triggers\n");
+	} else if (!ret.value) {
+		pr_warn("Type 6 triggers not available\n");
+	} else {
+		dbtr_total_num = min_t(unsigned long, ret.value,
+				       RISCV_HW_BP_NUM_MAX);
+		dbtr_type = RISCV_DBTR_TRIG_MCONTROL6;
+		pr_warn("Mcontrol6 trigger available.\n");
+		goto done;
+	}
+
+	/* fallback to type 2 triggers if type 6 is not available */
+
+	tdata1 = 0;
+	tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect mcontrol triggers\n");
+	} else if (!ret.value) {
+		pr_warn("Type 2 triggers not available\n");
+	} else {
+		dbtr_total_num = min_t(unsigned long, ret.value,
+				       RISCV_HW_BP_NUM_MAX);
+		dbtr_type = RISCV_DBTR_TRIG_MCONTROL;
+		goto done;
+	}
+
+done:
+	dbtr_init = 1;
+}
+
+int hw_breakpoint_slots(int type)
+{
+	/*
+	 * We can be called early, so don't rely on
+	 * static variables being initialised.
+	 */
+
+	if (!dbtr_init)
+		init_sbi_dbtr();
+
+	return dbtr_total_num;
+}
+
+int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw)
+{
+	unsigned int len;
+	unsigned long va;
+
+	va = hw->address;
+	len = hw->len;
+
+	return (va >= TASK_SIZE) && ((va + len - 1) >= TASK_SIZE);
+}
+
+static int rv_init_mcontrol_trigger(const struct perf_event_attr *attr,
+				    struct arch_hw_breakpoint *hw)
+{
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RISCV_DBTR_EXEC;
+		RISCV_DBTR_SET_MC_EXEC_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RISCV_DBTR_LOAD;
+		RISCV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RISCV_DBTR_STORE;
+		RISCV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RISCV_DBTR_LDST;
+		RISCV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
+		RISCV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (attr->bp_type == HW_BREAKPOINT_X) {
+		/*
+		 * Userspace debuggers can request execute breakpoints with
+		 * bp_len == 2 for compressed/non-aligned instruction
+		 * addresses. Program execute triggers with "match any size"
+		 * to avoid missing valid instruction fetches.
+		 */
+		hw->len = 0;
+		hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 0);
+		hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 0);
+	} else {
+		switch (attr->bp_len) {
+		case HW_BREAKPOINT_LEN_1:
+			hw->len = 1;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+			break;
+		case HW_BREAKPOINT_LEN_2:
+			hw->len = 2;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 2);
+			break;
+		case HW_BREAKPOINT_LEN_4:
+			hw->len = 4;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 3);
+			break;
+#if __riscv_xlen >= 64
+		case HW_BREAKPOINT_LEN_8:
+			hw->len = 8;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 1);
+			break;
+#endif
+		/* Set to match any size */
+		default:
+			hw->len = 0;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 0);
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 0);
+			break;
+		}
+	}
+
+	hw->tdata1 = RISCV_DBTR_SET_MC_TYPE(hw->tdata1, RISCV_DBTR_TRIG_MCONTROL);
+
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_DMODE_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_TIMING_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_SELECT_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_ACTION_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_CHAIN_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_MATCH_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_M_BIT);
+
+	/*
+	 * Match only the trigger's actual privilege-mode target. Setting
+	 * both bits makes the kernel's own S-mode uaccess (e.g. SUM-enabled
+	 * loads in strncpy_from_user()) spuriously fire a user-space watch.
+	 */
+	if (arch_check_bp_in_kernelspace(hw))
+		SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_S_BIT);
+	else
+		SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_U_BIT);
+
+	return 0;
+}
+
+static int rv_init_mcontrol6_trigger(const struct perf_event_attr *attr,
+				     struct arch_hw_breakpoint *hw)
+{
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RISCV_DBTR_EXEC;
+		RISCV_DBTR_SET_MC6_EXEC_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RISCV_DBTR_LOAD;
+		RISCV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RISCV_DBTR_STORE;
+		RISCV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RISCV_DBTR_LDST;
+		RISCV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
+		RISCV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (attr->bp_type == HW_BREAKPOINT_X) {
+		/* See rv_init_mcontrol_trigger() for rationale. */
+		hw->len = 0;
+		hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 0);
+	} else {
+		switch (attr->bp_len) {
+		case HW_BREAKPOINT_LEN_1:
+			hw->len = 1;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 1);
+			break;
+		case HW_BREAKPOINT_LEN_2:
+			hw->len = 2;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 2);
+			break;
+		case HW_BREAKPOINT_LEN_4:
+			hw->len = 4;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 3);
+			break;
+#if __riscv_xlen >= 64
+		case HW_BREAKPOINT_LEN_8:
+			hw->len = 8;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 5);
+			break;
+#endif
+		/* Set to match any size */
+		default:
+			hw->len = 0;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 0);
+		}
+	}
+
+	hw->tdata1 = RISCV_DBTR_SET_MC6_TYPE(hw->tdata1, RISCV_DBTR_TRIG_MCONTROL6);
+
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_DMODE_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_TIMING_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_SELECT_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_ACTION_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_CHAIN_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_MATCH_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_M_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_VS_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_VU_BIT);
+
+	/* See rv_init_mcontrol_trigger() for rationale. */
+	if (arch_check_bp_in_kernelspace(hw))
+		SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_S_BIT);
+	else
+		SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_U_BIT);
+
+	return 0;
+}
+
+int hw_breakpoint_arch_parse(struct perf_event *bp,
+			     const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw)
+{
+	int ret;
+
+	/* Breakpoint address */
+	hw->address = attr->bp_addr;
+	hw->tdata2 = attr->bp_addr;
+	hw->tdata3 = 0x0;
+
+	switch (dbtr_type) {
+	case RISCV_DBTR_TRIG_MCONTROL:
+		ret = rv_init_mcontrol_trigger(attr, hw);
+		break;
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		ret = rv_init_mcontrol6_trigger(attr, hw);
+		break;
+	default:
+		pr_warn("Unsupported trigger type\n");
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * Read mcontrol6's hit1:hit0 field for trigger @idx. If either bit is set,
+ * clear it in hardware (the Debug spec requires the trigger user to do
+ * this; hardware only ever sets it). Returns the RISCV_DBTR_MC6_HIT_*
+ * value read (RISCV_DBTR_MC6_HIT_FALSE if unimplemented or unfired).
+ */
+static unsigned int mc6_read_and_clear_hit(int idx)
+{
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
+	struct sbi_dbtr_data_msg *xmit;
+	unsigned long tdata1, tdata2, tdata3;
+	struct sbiret ret;
+	unsigned int hit;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ, idx, 1, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to read trigger %d. error: %ld\n", idx, ret.error);
+		hit = RISCV_DBTR_MC6_HIT_FALSE;
+		goto out;
+	}
+
+	tdata1 = le_to_cpu(shmem->data.tdata1);
+	hit = RISCV_DBTR_MC6_GET_HIT(tdata1);
+	if (hit == RISCV_DBTR_MC6_HIT_FALSE)
+		goto out;
+
+	tdata2 = le_to_cpu(shmem->data.tdata2);
+	tdata3 = le_to_cpu(shmem->data.tdata3);
+	RISCV_DBTR_MC6_CLEAR_HIT(tdata1);
+
+	xmit = &shmem->data;
+	xmit->tdata1 = cpu_to_le(tdata1);
+	xmit->tdata2 = cpu_to_le(tdata2);
+	xmit->tdata3 = cpu_to_le(tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE, idx, 1, 0, 0, 0, 0);
+	if (ret.error)
+		pr_warn("Failed to clear hit bits on trigger %d. error: %ld\n",
+			idx, ret.error);
+
+out:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+	return hit;
+}
+
+/*
+ * HW Breakpoint/watchpoint handler
+ */
+static int hw_breakpoint_handler(struct die_args *args)
+{
+	int ret = NOTIFY_DONE;
+	struct arch_hw_breakpoint *bp;
+	struct perf_event *event;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		event = this_cpu_read(pcpu_hw_bp_events[i]);
+		if (!event)
+			continue;
+
+		bp = counter_arch_bp(event);
+		switch (bp->type) {
+		/* Breakpoint */
+		case HW_BREAKPOINT_X:
+		{
+			bool hit = bp->address == args->regs->epc;
+
+			if (!hit && dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
+				hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
+
+			if (hit) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+		}
+
+		/* Watchpoint */
+		case HW_BREAKPOINT_W:
+		case HW_BREAKPOINT_R:
+		case HW_BREAKPOINT_RW:
+		{
+			unsigned long stval = args->regs->badaddr;
+			unsigned long bp_start = bp->address;
+			unsigned long bp_len = bp->len ?: 1;
+			unsigned long bp_end = bp_start + bp_len - 1;
+			unsigned long stval_end = stval + sizeof(long) - 1;
+			bool hit = false;
+
+			if (bp_end < bp_start)
+				bp_end = ~0UL;
+			if (stval_end < stval)
+				stval_end = ~0UL;
+
+			/*
+			 * Prefer tdata1.hit from SBI trigger readout whenever
+			 * possible. Fall back to address-based matching if HIT
+			 * isn't observed/supported.
+			 */
+			if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL) {
+				unsigned long tdata1;
+				struct sbiret sret;
+				union sbi_dbtr_shmem_entry *shmem;
+
+				raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+						      *this_cpu_ptr(&ecall_lock_flags));
+				shmem = this_cpu_ptr(sbi_dbtr_shmem);
+				sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
+						 i, 1, 0, 0, 0, 0);
+				if (!sret.error) {
+					tdata1 = le_to_cpu(shmem->data.tdata1);
+					hit = !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
+				}
+				raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+							   *this_cpu_ptr(&ecall_lock_flags));
+			} else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6) {
+				hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
+			}
+
+			/*
+			 * Sdtrig may report STVAL as the lowest accessed
+			 * address while the watchpoint can match a higher byte
+			 * in the same access.
+			 */
+			if (hit ||
+			    (stval >= bp_start && stval <= bp_end) ||
+			    (bp_start >= stval && bp_start <= stval_end)) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+		}
+
+		default:
+			pr_warn("Unknown type: %u\n", bp->type);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
+				    unsigned long val, void *data)
+{
+	if (val != DIE_DEBUG)
+		return NOTIFY_DONE;
+
+	return hw_breakpoint_handler(data);
+}
+
+/* atomic: counter->ctx->lock is held */
+int arch_install_hw_breakpoint(struct perf_event *event)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
+	struct sbi_dbtr_data_msg *xmit;
+	struct sbi_dbtr_id_msg *recv;
+	struct perf_event **slot;
+	unsigned long idx;
+	struct sbiret ret;
+	int err = 0;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	xmit = &shmem->data;
+	recv = &shmem->id;
+	xmit->tdata1 = cpu_to_le(bp->tdata1);
+	xmit->tdata2 = cpu_to_le(bp->tdata2);
+	xmit->tdata3 = cpu_to_le(bp->tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
+			1, 0, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to install trigger\n");
+		err = sbi_err_map_linux_errno(ret.error);
+		goto done;
+	}
+
+	idx = le_to_cpu(recv->idx);
+	if (idx >= dbtr_total_num) {
+		pr_warn("Invalid trigger index %lu\n", idx);
+		err = -EINVAL;
+		goto done;
+	}
+
+	slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
+	if (*slot) {
+		pr_warn("Slot %lu is in use\n", idx);
+		err = -EBUSY;
+		goto done;
+	}
+
+	/* Save the event - to be looked up in handler */
+	*slot = event;
+
+done:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+	return err;
+}
+
+/* atomic: counter->ctx->lock is held */
+void arch_uninstall_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		struct perf_event **slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event) {
+			*slot = NULL;
+			break;
+		}
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		goto out;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to uninstall trigger %d.\n", i);
+		goto out;
+	}
+
+ out:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+
+void arch_enable_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+	struct perf_event **slot;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		goto out;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to install trigger %d\n", i);
+		goto out;
+	}
+
+ out:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+EXPORT_SYMBOL_GPL(arch_enable_hw_breakpoint);
+
+void arch_update_hw_breakpoint(struct perf_event *event)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
+	struct sbi_dbtr_data_msg *xmit;
+	struct sbi_dbtr_id_msg *id;
+	struct perf_event **slot;
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		return;
+	}
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	id = &shmem->id;
+	xmit = &shmem->data;
+	id->idx = cpu_to_le(i);
+	xmit->tdata1 = cpu_to_le(bp->tdata1);
+	xmit->tdata2 = cpu_to_le(bp->tdata2);
+	xmit->tdata3 = cpu_to_le(bp->tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
+			1, 0, 0, 0, 0, 0);
+	if (ret.error)
+		pr_warn("Failed to update trigger %d.\n", i);
+
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+EXPORT_SYMBOL_GPL(arch_update_hw_breakpoint);
+
+void arch_disable_hw_breakpoint(struct perf_event *event)
+{
+	struct perf_event **slot;
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to uninstall trigger %d.\n", i);
+		return;
+	}
+}
+EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
+
+void hw_breakpoint_pmu_read(struct perf_event *bp) { }
+
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
+
+static int __init arch_hw_breakpoint_init(void)
+{
+	unsigned int cpu;
+	int rc = 0;
+
+	for_each_possible_cpu(cpu)
+		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
+
+	if (!dbtr_init)
+		init_sbi_dbtr();
+
+	if (dbtr_total_num) {
+		pr_info("Total number of type %d triggers: %u\n",
+			dbtr_type, dbtr_total_num);
+	} else {
+		pr_info("No hardware triggers available\n");
+		goto out;
+	}
+
+	/* Allocate per-cpu shared memory */
+	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
+					PAGE_SIZE);
+
+	if (!sbi_dbtr_shmem) {
+		pr_warn("Failed to allocate shared memory.\n");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	/* Hotplug handler to register/unregister shared memory with SBI */
+	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			       "riscv/hw_breakpoint:prepare",
+			       arch_smp_setup_sbi_shmem,
+			       arch_smp_teardown_sbi_shmem);
+
+	if (rc < 0) {
+		pr_warn("Failed to setup CPU hotplug state\n");
+		free_percpu(sbi_dbtr_shmem);
+		return rc;
+	}
+ out:
+	return rc;
+}
+arch_initcall(arch_hw_breakpoint_init);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..1b9ccc0b6b8d 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -287,6 +287,12 @@ void handle_break(struct pt_regs *regs)
 	if (probe_breakpoint_handler(regs))
 		return;
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
+	    == NOTIFY_STOP)
+		return;
+#endif
+
 	current->thread.bad_cause = regs->cause;
 
 	if (user_mode(regs))
-- 
2.43.0

