Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124550;
	b=Gi1JpUP0LR8bGyAW6iTi4JV4P8u30O/SJHUNpyS3B4cWyZ2Y4Tncy75HPWLFtOFlhbob
	 f0ci3ax422XQB/KsMudATFudxIXiy1GlmAm0CuAXE+byihEBPY9SO4OUiehSlqKlA5Oph
	 M1N/M2ep+Onqg2Cu+NpVF5jKIr4ZbGjYulqq8yMh9geW50kLqnZnQOE8uhvZdcNjlp2IM
	 Il7pAA+PoxlFwinansk9XHwCHedGd5FV6zvmSKv1qT7IVnFUdRxuGjbGjf9JKr3pt9Id7
	 1A10gWMfjASzkn6YBt1ageamXIJk1DA/hPAb4/jPxz08XLm+eZQEw666zFfl+NT3V5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TmJy02cqnM+rmzux4OYd7IScjFsAUBQzewxhIDA1j1A=;
	b=5oT+DB/6PGIZShJ93+RxDWkPdTlNGwVc/dm+Ho+grzO/r8GcbMRG6UQTb4f5F2SDI6uC
	 C8ieou0ODWErn2Rqy6htf9I+ARUM1UDJkJxDmJdBgncQ6wV95mDLeO7/E7q6yq/jhGf9U
	 6CuyQJMf9z/bOFFTjJfVa0dr4QJnTXrUMOr0V4lvjyjjyjkb/8kCwwPbe1+71YqwhnkBG
	 BGq7EoRHOxtmCMeAut58p8HR3vef4VOR+NiAjtM1alw7YglPuKgIG6aU/YNoDgPv4a892
	 OvkIWNY2K/ppoORp5n//Z6w/sHRXHx++hzBKFtYH87vhPS/gsF4gb04yFgQJN+8K3kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WjXwCEym;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SlmjlIfG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A0606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC2A0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WjXwCEym;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SlmjlIfG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH01wV2772459
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TmJy02cqnM+rmzux4OYd7IScjFsAUBQzewxhIDA1j1A=; b=WjXwCEymnclF4A7d
	6IADYkZjoJvPhenGq75xTH2FrZgRZE0PXozxkQZ0L7AHSr6pMuiwqYtx39vpeGZL
	TuZwf5+V8Ta/5xbZYFG7oIMlnybK+0aQ3flLwvRdC7q6y+hNdzIZfv04tJ0T9I7w
	XVoLAXdYJx5jhP/HBP50HiRbAQJAMwnvcnO0+16+NQurLJQdEtHWDMk+MUCDXTuy
	eM+n7VLpeJDhn8I3N/IM31YL0hq8Fk4jxp8WpTQ5c1nHBMz4p3rrEkNO1ZjT3EAu
	B6i7mKaXtg7gq8KwJRlYr162nl6md4ODs2bSb50ueWrlaqiJVwPvgoADv9qIHm3T
	EWODHg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6acew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:09:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-15c16792146so39488c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124547; x=1793729347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmJy02cqnM+rmzux4OYd7IScjFsAUBQzewxhIDA1j1A=;
        b=SlmjlIfGRckm8Tx3Zo5Z76PofwNLBwm2bqSujVrroAUcqkYaRF+B+HkHjBcup48M1F
         LEaLNrJV0twPB15+g8EUTvMG1VspHHMA6YDJ7JGb2kTpJVP/ZDx1VhOmzGxEiNhHiRT2
         vCwIxx6j6PE9gwFd3vrO6aHDaOZsrzxkiJXEtM2uSC7l9a0pW0XPETC+2PxlCaC6L1iG
         BjX3L32lFxRUtRUZt94NIZldOMG56M4eAxJ8YU9Cg7KGVxq00c4tG5JKw9G2Y/x6mTv+
         dDxfYs9BLZMW81Pe4QH4kaeXdlhmj2UQbqqK8G4Odi72yn8EyQ1OWFtgq9gO81pRbYtm
         +kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124547; x=1793729347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmJy02cqnM+rmzux4OYd7IScjFsAUBQzewxhIDA1j1A=;
        b=cF6RvQoCH9EkkZqCua6dpEe51DKp+pycrkQvnfU7DgK8lici4KapffKKuQosotkKZG
         dD+K5DNn8vF1uOonUuwaTSbqg2nj6XIye2f4eU+QQj5uP5W51Uu6fTEfRtVVQfFgPOh3
         Ety0s3iI/kPepI0OA4BhQgGGlJJwVnhoNEozvS8rYyVpmL3z/RYt3DAoP8jKogRDXy0o
         VD+9DYg9Z/X51ls+7YGdX3FZgRTJe2jKAP1zi3ApBhuWKGMbfLmFrvVcDGwVJLJTa8T9
         IAiGpy2DIveKuCTtUaQv1EJ0WlRdlhuobtwznsQlH4O7XP+lAC1B46lX7g3tkaKQqoP9
         cIpw==
X-Forwarded-Encrypted: i=1; AKwUvBxUKZwuRX9z0MycFOtvSeKJ3OIPSrjcmLzagak8dNc7suEVOcQupuhBU07CGTqcg34ZIVSciF9r0HJD01A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqCFVmRlBifQzBU2kE7NnbOr+BuuImU0y3QuXeqcP0GSWfqNPz
	fcKRKQ9ZHf8WzbxBmJWxw2lfHC8EgBg4Ddft4tuonH811UFTt5FmfG7Xip9cNXVM4iQSbCsbzAE
	llD3Iu2jvV+1OsW8Dao7yI+YW8jCDWn7cYz5NHLzWtLqpVVirgNsoQs1Q9gdhPE56L0o=
X-Gm-Gg: AYBFou1ew0lMTW2AD85wzMnpVwP44aRW9MlGVRHFeUExkHRY/Bj4h+IaAeh2suXkF1F
	QVjrrDrHeBAgoMFalpX14EIXXXz2LvMuBwAK+fFZwySGttc97OXbTS6hlJS4/7bTDDxcPpg+4EP
	d7dnx1cb+PsBOFHQm3zHPVtNtyhwVahbI52UNud5QmWrvpxLLeFn5JMhcMHW/atrcsllMIjNocR
	qZGW6Ulkzv7tkkr+LU1yUq9H/ZfjRZ255lg97lhTVxtwGArAKweyYd3rJWqMmpseZj37+BjakmU
	2W6wUu5txPSyNdfDlKq9cMSiVcR7HZuHnm00KtvlURB8SJe+AHVJJJS7WHugui7cOhiIz5TSDYu
	iUd6FT1N8YYHn6fEp41RAjBT/
X-Received: by 2002:a05:701b:21db:b0:181:7e1a:e3ad with SMTP id a92af1059eb24-1a6ce2ff0e2mr11770c88.38.1793124546091;
        Tue, 27 Oct 2026 11:09:06 -0700 (PDT)
X-Received: by 2002:a05:701b:21db:b0:181:7e1a:e3ad with SMTP id a92af1059eb24-1a6ce2ff0e2mr11728c88.38.1793124545182;
        Tue, 27 Oct 2026 11:09:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:09:04 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:38:29 +0530
Subject: [PATCH v3 4/4] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0e8c3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Pny_x_ucYqVPpLIU650A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: pEbslLWlUGOPj3bGFWdb4GXaKo4ad5s_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX4G4JOVRu91lE
 8DW9hvyTdx/SE3lWcUPbtF75X+RHVx2aDelMeGjHCzh7/W9kb6i7gKH5hdVElJPfZXBaYkHVJeu
 nncJm8shcQ1G1M3LMtKKZfr6DpayGAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXxCdLkFlvSeN7
 +LkM/M8V3Z+9eQSqLwgjHrXaIklZakcBi1mC3psJV2uCycxAsvQbeZjoIpDbVncGrN7lefI5UXg
 1On6VV9UmEdky+PrhrAItIucerOzYHsmVwj/Ea/AJAzVQpkSktV5wIo3rJSehDnu5tCOsc5sPWI
 QlHHHMWz3zO72W49HJFAMgLP0HO3swxxwWk87RbrOfJF9O3Ksn/v16TBZkiMABqvruMgBsae3u/
 m6gOnHPDhmzuVax0l+G2K/UsrzgHho1q8AOBohgh1K+BldR6lod76SFoz9CxuFB52jVHjlwbwh9
 260WoNG5xA79H5sTHhE3je46XZgesRTaDM7h8Ex3uSBUA+aIlZ0TuiDxlaA/rmcOOour/B9LvPS
 KZ0Y5ZKka/15DgwcSuLGkvmGAzf4DOli0stlu9m8dvsOVTJHEE+arYeBnNFXuG8BO/DSejS6N7F
 ngGdeLD4k5R9qCCGL4Q==
X-Proofpoint-ORIG-GUID: pEbslLWlUGOPj3bGFWdb4GXaKo4ad5s_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072

Add support for the DisplayPort Receiver (DPRX) clock controllers on
Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with core PLLs.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  11 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/dprxcc0-nord.c | 441 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c | 440 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 893 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a4ca5587ed8d6085c4d6fcd57eb8c..a828e349fee98245b2cfabc43a1fd92b1936403d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -255,6 +255,17 @@ config CLK_NORD_CAMCC
 	  Say Y if you want to support camera devices and functionality such as
 	  capturing pictures.
 
+config CLK_NORD_DPRXCC
+	tristate "Nord DPRX Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the Display Port Receiver (DPRX) clock controller on
+	  Nord devices. The DPRX clock controller provides clocks for the
+	  DPRX core, audio, AHB and video memory paths.
+	  Say Y if you want to support DPRX functionality.
+
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f269d18f1b78d6c7f92e14baeade1e5..237e5d7ff5f30c38a5d3d303998d735afda0c89a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_CLK_KUNO_GCC) += gcc-kuno.o
 obj-$(CONFIG_CLK_MAILI_VIDEOCC) += videocc-maili.o
 obj-$(CONFIG_CLK_NORD_CAMCC) += camcc-nord.o
 obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
+obj-$(CONFIG_CLK_NORD_DPRXCC) += dprxcc0-nord.o dprxcc1-nord.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
diff --git a/drivers/clk/qcom/dprxcc0-nord.c b/drivers/clk/qcom/dprxcc0-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..456666834a4f41eb9b6eaa99f57023b9a3567549
--- /dev/null
+++ b/drivers/clk/qcom/dprxcc0-nord.c
@@ -0,0 +1,441 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-dprxcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_ODD,
+	P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN,
+	P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+#define DPRX_CC_CORE_AHB_DIV_CFG	0x80b0
+#define DPRX_CC_CORE_AHB_DIV		GENMASK(3, 0)
+#define DPRX_CC_CORE_AUD_DIV_CFG	0x80d0
+#define DPRX_CC_CORE_AUD_DIV		GENMASK(8, 0)
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 550.0 MHz Configuration */
+static const struct alpha_pll_config dprx_0_dprx_cc_pll0_config = {
+	.l = 0x1c,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll dprx_0_dprx_cc_pll0 = {
+	.offset = 0x0,
+	.config = &dprx_0_dprx_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1080.0 MHz Configuration */
+static const struct alpha_pll_config dprx_0_dprx_cc_pll1_config = {
+	.l = 0x38,
+	.alpha = 0x4000000,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x02000080,
+};
+
+static struct clk_alpha_pll dprx_0_dprx_cc_pll1 = {
+	.offset = 0x1000,
+	.alpha_width = 28,
+	.config = &dprx_0_dprx_cc_pll1_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map dprx_cc_0_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN, 1 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_ODD, 2 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 4 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data dprx_cc_0_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map dprx_cc_0_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN, 3 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data dprx_cc_0_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_audio_clk_src[] = {
+	F(216000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(360000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_audio_clk_src = {
+	.cmd_rcgr = 0x80c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_1,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_audio_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_audio_clk_src",
+		.parent_data = dprx_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg0_clk_src[] = {
+	F(220000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg0_clk_src = {
+	.cmd_rcgr = 0x8004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg0_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg2_clk_src[] = {
+	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg2_clk_src = {
+	.cmd_rcgr = 0x8068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg2_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg3_clk_src[] = {
+	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg3_clk_src = {
+	.cmd_rcgr = 0x8098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg3_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_0_dprx_cc_core_ahb_div_clk_src = {
+	.reg = 0x80b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_0_dprx_cc_core_rcg3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_0_dprx_cc_core_aud_div_clk_src = {
+	.reg = 0x80d0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_aud_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_0_dprx_cc_audio_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_ahb_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_aud_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_aud_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_aud_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_mdp_mem_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8088,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_mdp_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_rcg2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_mmcx_xo_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_mmcx_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_vid_mem_clk = {
+	.halt_reg = 0x8028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_vid_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_rcg0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *dprx_cc_0_nord_clocks[] = {
+	[DPRX_CC_AHB_CLK] = &dprx_0_dprx_cc_ahb_clk.clkr,
+	[DPRX_CC_AUD_CLK] = &dprx_0_dprx_cc_aud_clk.clkr,
+	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_0_dprx_cc_audio_clk_src.clkr,
+	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_ahb_div_clk_src.clkr,
+	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_aud_div_clk_src.clkr,
+	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_0_dprx_cc_core_rcg0_clk_src.clkr,
+	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_0_dprx_cc_core_rcg2_clk_src.clkr,
+	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_0_dprx_cc_core_rcg3_clk_src.clkr,
+
+	[DPRX_CC_MDP_MEM_CLK] = &dprx_0_dprx_cc_mdp_mem_clk.clkr,
+	[DPRX_CC_MMCX_XO_CLK] = &dprx_0_dprx_cc_mmcx_xo_clk.clkr,
+	[DPRX_CC_PLL0] = &dprx_0_dprx_cc_pll0.clkr,
+	[DPRX_CC_PLL1] = &dprx_0_dprx_cc_pll1.clkr,
+	[DPRX_CC_VID_MEM_CLK] = &dprx_0_dprx_cc_vid_mem_clk.clkr,
+};
+
+static const struct qcom_reset_map dprx_cc_0_nord_resets[] = {
+	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
+};
+
+static struct clk_alpha_pll *dprx_cc_0_nord_plls[] = {
+	&dprx_0_dprx_cc_pll0,
+	&dprx_0_dprx_cc_pll1,
+};
+
+static const struct regmap_config dprx_cc_0_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8104,
+	.fast_io = true,
+};
+
+static void dprx_cc_0_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Configure dividers for core audio and AHB clocks. */
+	regmap_update_bits(regmap, DPRX_CC_CORE_AUD_DIV_CFG,
+			   DPRX_CC_CORE_AUD_DIV, 0x13);
+	regmap_update_bits(regmap, DPRX_CC_CORE_AHB_DIV_CFG,
+			   DPRX_CC_CORE_AHB_DIV, 0x0a);
+}
+
+static const struct qcom_cc_driver_data dprx_cc_0_nord_driver_data = {
+	.alpha_plls = dprx_cc_0_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(dprx_cc_0_nord_plls),
+	.clk_regs_configure = dprx_cc_0_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc dprx_cc_0_nord_desc = {
+	.config = &dprx_cc_0_nord_regmap_config,
+	.clks = dprx_cc_0_nord_clocks,
+	.num_clks = ARRAY_SIZE(dprx_cc_0_nord_clocks),
+	.resets = dprx_cc_0_nord_resets,
+	.num_resets = ARRAY_SIZE(dprx_cc_0_nord_resets),
+	.use_rpm = true,
+	.driver_data = &dprx_cc_0_nord_driver_data,
+};
+
+static const struct of_device_id dprx_cc_0_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dprxcc0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dprx_cc_0_nord_match_table);
+
+static int dprx_cc_0_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &dprx_cc_0_nord_desc);
+}
+
+static struct platform_driver dprx_cc_0_nord_driver = {
+	.probe = dprx_cc_0_nord_probe,
+	.driver = {
+		.name = "dprxcc0-nord",
+		.of_match_table = dprx_cc_0_nord_match_table,
+	},
+};
+
+module_platform_driver(dprx_cc_0_nord_driver);
+
+MODULE_DESCRIPTION("QTI DPRXCC0 NORD Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dprxcc1-nord.c b/drivers/clk/qcom/dprxcc1-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..836ca7cc50d82be3973df8b5d1322fe2dd7cff6d
--- /dev/null
+++ b/drivers/clk/qcom/dprxcc1-nord.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-dprxcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_ODD,
+	P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN,
+	P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+#define DPRX_CC_CORE_AHB_DIV_CFG	0x80b0
+#define DPRX_CC_CORE_AHB_DIV		GENMASK(3, 0)
+#define DPRX_CC_CORE_AUD_DIV_CFG	0x80d0
+#define DPRX_CC_CORE_AUD_DIV		GENMASK(8, 0)
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 550.0 MHz Configuration */
+static const struct alpha_pll_config dprx_1_dprx_cc_pll0_config = {
+	.l = 0x1c,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll dprx_1_dprx_cc_pll0 = {
+	.offset = 0x0,
+	.config = &dprx_1_dprx_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1080.0 MHz Configuration */
+static const struct alpha_pll_config dprx_1_dprx_cc_pll1_config = {
+	.l = 0x38,
+	.alpha = 0x4000000,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x02000080,
+};
+
+static struct clk_alpha_pll dprx_1_dprx_cc_pll1 = {
+	.offset = 0x1000,
+	.alpha_width = 28,
+	.config = &dprx_1_dprx_cc_pll1_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map dprx_cc_1_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN, 1 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_ODD, 2 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 4 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data dprx_cc_1_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map dprx_cc_1_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN, 3 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data dprx_cc_1_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_audio_clk_src[] = {
+	F(216000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(360000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_audio_clk_src = {
+	.cmd_rcgr = 0x80c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_1,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_audio_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_audio_clk_src",
+		.parent_data = dprx_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg0_clk_src[] = {
+	F(220000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg0_clk_src = {
+	.cmd_rcgr = 0x8004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg0_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg2_clk_src[] = {
+	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg2_clk_src = {
+	.cmd_rcgr = 0x8068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg2_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg3_clk_src[] = {
+	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg3_clk_src = {
+	.cmd_rcgr = 0x8098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg3_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_1_dprx_cc_core_ahb_div_clk_src = {
+	.reg = 0x80b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_1_dprx_cc_core_rcg3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_1_dprx_cc_core_aud_div_clk_src = {
+	.reg = 0x80d0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_aud_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_1_dprx_cc_audio_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_ahb_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_aud_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_aud_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_aud_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_mdp_mem_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8088,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_mdp_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_rcg2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_mmcx_xo_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_mmcx_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_vid_mem_clk = {
+	.halt_reg = 0x8028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_vid_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_rcg0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *dprx_cc_1_nord_clocks[] = {
+	[DPRX_CC_AHB_CLK] = &dprx_1_dprx_cc_ahb_clk.clkr,
+	[DPRX_CC_AUD_CLK] = &dprx_1_dprx_cc_aud_clk.clkr,
+	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_1_dprx_cc_audio_clk_src.clkr,
+	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_ahb_div_clk_src.clkr,
+	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_aud_div_clk_src.clkr,
+	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_1_dprx_cc_core_rcg0_clk_src.clkr,
+	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_1_dprx_cc_core_rcg2_clk_src.clkr,
+	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_1_dprx_cc_core_rcg3_clk_src.clkr,
+	[DPRX_CC_MDP_MEM_CLK] = &dprx_1_dprx_cc_mdp_mem_clk.clkr,
+	[DPRX_CC_MMCX_XO_CLK] = &dprx_1_dprx_cc_mmcx_xo_clk.clkr,
+	[DPRX_CC_PLL0] = &dprx_1_dprx_cc_pll0.clkr,
+	[DPRX_CC_PLL1] = &dprx_1_dprx_cc_pll1.clkr,
+	[DPRX_CC_VID_MEM_CLK] = &dprx_1_dprx_cc_vid_mem_clk.clkr,
+};
+
+static const struct qcom_reset_map dprx_cc_1_nord_resets[] = {
+	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
+};
+
+static struct clk_alpha_pll *dprx_cc_1_nord_plls[] = {
+	&dprx_1_dprx_cc_pll0,
+	&dprx_1_dprx_cc_pll1,
+};
+
+static const struct regmap_config dprx_cc_1_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8104,
+	.fast_io = true,
+};
+
+static void dprx_cc_1_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Configure dividers for core audio and AHB clocks. */
+	regmap_update_bits(regmap, DPRX_CC_CORE_AUD_DIV_CFG,
+			   DPRX_CC_CORE_AUD_DIV, 0x13);
+	regmap_update_bits(regmap, DPRX_CC_CORE_AHB_DIV_CFG,
+			   DPRX_CC_CORE_AHB_DIV, 0x0a);
+}
+
+static const struct qcom_cc_driver_data dprx_cc_1_nord_driver_data = {
+	.alpha_plls = dprx_cc_1_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(dprx_cc_1_nord_plls),
+	.clk_regs_configure = dprx_cc_1_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc dprx_cc_1_nord_desc = {
+	.config = &dprx_cc_1_nord_regmap_config,
+	.clks = dprx_cc_1_nord_clocks,
+	.num_clks = ARRAY_SIZE(dprx_cc_1_nord_clocks),
+	.resets = dprx_cc_1_nord_resets,
+	.num_resets = ARRAY_SIZE(dprx_cc_1_nord_resets),
+	.use_rpm = true,
+	.driver_data = &dprx_cc_1_nord_driver_data,
+};
+
+static const struct of_device_id dprx_cc_1_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dprxcc1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dprx_cc_1_nord_match_table);
+
+static int dprx_cc_1_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &dprx_cc_1_nord_desc);
+}
+
+static struct platform_driver dprx_cc_1_nord_driver = {
+	.probe = dprx_cc_1_nord_probe,
+	.driver = {
+		.name = "dprxcc1-nord",
+		.of_match_table = dprx_cc_1_nord_match_table,
+	},
+};
+
+module_platform_driver(dprx_cc_1_nord_driver);
+
+MODULE_DESCRIPTION("QTI DPRXCC1 NORD Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

