Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D633D954D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210669; cv=none; b=ep8D2P5VJmFgDkenyEpZuykmqdA2WQM1vhcxt16rz6AAsJrb5PgjTm/LSs6ocyxfH0+YT0nRmvMwPV46zDU6mqF4xXHMZSVIRNRBjcFHIj3u5r8cmWlB8pUZ3FHV7lb3uNFgP8BSWxKln+N50xnrZQlMYNgT/YIob88BEv2vYC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210669; c=relaxed/simple;
	bh=ruE5tx1HkuW+fOzQ6tZ9eszUs2dG5Y7xPl/O9+fbxXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dX+Jnz5VRRrwuD/s5OwSOVsl8ILR8ru0Zb3gyGU74oGAx/wEmdOaFUua+bl+LJVw+FagbOezubluicMNBUsmqzmt/O3NvTtbOix1+yzbsqT42TbcxjJN+Q1/z99xFc1cGL9xTOpWCaEL4KLwxQXmneWN2NAl88Idn0rCq4pgAjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTaDpyC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHHPtlXU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTaDpyC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHHPtlXU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30lVw440490
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8vaJk7pZN0E
	kiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=; b=fTaDpyC0+DVNUcByVNZNwDaZMHM
	n60Iu6gzXawN2L4tmd9KQ6SLblaNZOCPrUHOsVW7gbCupgZmzvCfcAHwBB0tX3dC
	89daQ4ECOJhAfjevDZ1ZCDKKdiJHCaJS8lJizflFWlgBIYa0JQbtDISm7HyVz088
	U41khwJ03wdjwwrDbqOSTbRspKipaITmaNFPAtynjrycoyUUn1qv8LAC3NbkJlMT
	G6W9SLCOnrl68n1+qFTRTcfd8ijMs6E4AW5kuzU+e+JHj5zGIpNInwpNYcZr8E6N
	WxsTAIWhPuvS/HlfDMNS9LTXhkc0/1Wve5zSvoVdYknE175f+jALo1sd8zA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxg4hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1314831eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210662; x=1792815462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vaJk7pZN0EkiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=;
        b=bHHPtlXUer0VRVsv3WOKRCMIC/tWTIRA9LPQHe+e8dQ+UJxWViDJJDanly7gN+6ufr
         4s6ZU2QT/vgyBLk72pyfaJh3dhHU90UyafFonx9WsHpEtSEyi6MQ7gdE9eVotRAIZIC3
         YJolq5u1NtP1/TE1tDCtUKTvWXFlIJwo4rzBdhgZzdXkKV0lj7F2sE0roM1yf6y96b0o
         yM0LyyRltBGeXItOcK+avx34b4BNw9HoDFdVl1y6oIeJS8GJXgN1S7S/szmUtqwyIyBe
         j8nm7gFlinrJRYabOv5Kc3uRUjPrJcr3q63DL5ot89iTa82JGqWFQbws5pROTJo7o/w3
         HLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210662; x=1792815462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vaJk7pZN0EkiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=;
        b=YIWL/+6LVIOo/bcUHNt8PuOgpB6Ssq8OTHu50hbd6oGvVV1uLPXZzU6ZME2DX2n3p7
         W/lHanATiwvZA6KDLD42xCib6EyV9UP2g213bjoZIImhZ1rKS/iJPa6XJs0I77LlimFE
         HGszwdkEqEYwKqXGIOlDsvB+3Z3v+IMBDIYHvp6Tycr9qFj4Zbogbi7yU6oe4yxEgfbZ
         LiFOnimx2OZwHJUMMPaWZ2JDGBwUcxXjperofVFfSFaavhgcb5/IxQ3yJUyuhtRALD65
         kQMw3cEnZcUEJ64JQgtSiv4Kkwq4JYmH/524+4EsmkYRLMxyzG/xJj0oc5JfsMSufe6i
         IQrA==
X-Forwarded-Encrypted: i=1; AKwUvBxN7+apG6KroNDGELwU6yohAba1L+ZTAcUkNkrhk9w4R/3nKeZglfmZmsncikoq+jsX2FPu49mYR0LFpko=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+vcTnNC4GNczNP2LPLAL3uhfGAbACVA15HcouC+Wo9o5FHKn+
	UIdeZt3U0cN8Y+KVL7qtDtMagpL/zhGGvB1RT0za9kkzw7iveZH4zZ+AzypEi08KfIwHRlUe1YF
	O1XP9C1P4+Ly6CSewTMcWcKAhb7Zw7RBdAUPb4qhbkbxKxd8y86pWLj8OpPFpfgZxB0I=
X-Gm-Gg: AYBFou0WRJoA8OdbHtr3CdeFJCx/oF0Ab8eJa+QIqaweVyCvhfIXW+N7v1LHrU3fsXF
	ln3d/Dlj++I8U2HyXwCNw9k9dV2WtgolT0jwIfyXzOjsQHbzUZ6Afnk6z5RaEsitu7o5jqMwwOq
	inmAjHaAAXLLkHFWN5QzPuHsuPPEdlZNt6+4lIbftJTDm3ALuS/gLjWonlWeuVD7h2ZTAPjnK4C
	fqfUF0+r4HctkQSyw8bgq1yY+IEHLGfQDVVQWnQzYx5mh+noIZpTuYS4YGwd0YqyNrGtH04lYr5
	4HN1YpnTr6cYOyS1rSoIU49bViqaFqsf7X/6+VPx+OqdkXBHkJTP3OQTJd+6O3RTMqPtdsfv6lq
	BrQ8+D0CXoLm7pDuKb1mHBhR52oMqlQZKOOgB/Q6Ypi+V1Lz4D8G0fw==
X-Received: by 2002:a05:693c:41d4:20b0:359:818a:df2d with SMTP id 5a478bee46e88-361a2843cd5mr2360174eec.31.1792210662116;
        Fri, 16 Oct 2026 21:17:42 -0700 (PDT)
X-Received: by 2002:a05:693c:41d4:20b0:359:818a:df2d with SMTP id 5a478bee46e88-361a2843cd5mr2360129eec.31.1792210661476;
        Fri, 16 Oct 2026 21:17:41 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:41 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 3/3] phy: qcom-mipi-csi2: Add sc7280 C-PHY support
Date: Fri, 16 Oct 2026 21:17:33 -0700
Message-Id: <20261017041733.3946816-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX/ey4Ku88APFx
 A0/hQNCKFYad10EH4ceY2kpPD6PrULP2Q0RYEf7HlsWbohwWrAKrLDYmchcAzokBHkP7lURqBj5
 xdROBqe68JBujA35PUKnb6mUF1OJ6Mc=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad2f6e7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MGGm1cd-6uVm1nftqCMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX9A4HNtmnhKIw
 XRRUxoWnjaka36m/qULZhvyKez4ZLsxhrLVCJva5gCzgSOsVwf7nWgjArWLoak/wHvZp+cXAxE7
 +WDPIiGwW+5lGCi5h/yb5mNOqpt/QhsgyBfg/oGNEdE9eX/Ui6vwQu+KOuI+XWOgvL1T/FkTdtm
 5tEBk6VPQZsWrMKinCeNMVHNH5PPBmD5EzoK//+XGalyDHyPtX4haod8NOi9ssqgY19mRBPaBDd
 mr9HoUn7b10AHQsm11WKwdib3mBASUYVX554kgLwCWqZKkYqucP/+IjDrHhXyxvaYxC6fqitCeq
 7tQU61gTs13aTV1rnlN0wBspb6kRFxiJhKYcM2H7CSsegGe3rpPmjb6+fH6hbr5CSe8TL6N+PMK
 AbP2Akxp+bSI/K6u8WuvY2wMv/XQ1eEFClsjfmyaL+uEZY+tE9gZL/bj9Nmf13SeVBLcQ28I32j
 em1PIeHl31N3aq2sDug==
X-Proofpoint-ORIG-GUID: smz7u0mm9K1PEx0pD9tip9OcgJK8M8sK
X-Proofpoint-GUID: smz7u0mm9K1PEx0pD9tip9OcgJK8M8sK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170016

Extend the SC7280 CSIPHY provider with C-PHY mode, so the
same qcom,sc7280-csi2-phy provider can drive a sensor in either D-PHY
or C-PHY mode, selected by the devicetree bus-type property in the
same way SA8775P/QCS8300 already do. No dt-bindings change is needed.
The existing qcom,sc7280-csi2-phy schema's bus-type enum already 
documents both MEDIA_BUS_TYPE_CSI2_DPHY and MEDIA_BUS_TYPE_CSI2_CPHY.

The legacy in-tree CAMSS driver (camss-csiphy-3ph-1-0.c) has a
dedicated lane_regs_sm8250_3ph[] C-PHY init sequence for its
CAMSS_7280/CAMSS_8250 case.

Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 114 ++++++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   2 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   1 +
 3 files changed, 117 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
index f388997390b1..9b921bec4696 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
@@ -5,6 +5,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/time64.h>
@@ -445,3 +446,116 @@ const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p = {
 	.datarate_regs = datarate_regs_sa8775p_cphy,
 	.num_datarate_regs = ARRAY_SIZE(datarate_regs_sa8775p_cphy),
 };
+
+static const struct mipi_csi2phy_lane_regs lane_regs_sc7280_cphy[] = {
+	{.reg_addr = 0x0990, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0994, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0998, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0990, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0994, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0998, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x098c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x015c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0168, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0104, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x010c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0108, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0114, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0150, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0188, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x018c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0190, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0118, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x011c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0120, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0124, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0128, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x012c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0160, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x01cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x01dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0984, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0988, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0980, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x09ac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x09b0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0a90, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a98, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a90, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a94, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a98, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a8c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x035c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0368, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0304, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x030c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0308, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0314, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0350, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0388, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x038c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0390, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0318, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x031c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0320, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0324, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0328, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x032c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0360, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x03cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x03dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a84, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a80, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0aac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0ab0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0b90, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b98, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b90, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b94, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b98, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b8c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x055c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0568, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0504, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x050c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0508, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0514, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0550, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0588, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x058c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0590, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0518, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x051c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0520, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0524, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0528, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x052c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0560, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x05cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x05dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b84, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b80, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0bac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0bb0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+};
+
+const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sc7280 = {
+	.init_seq = lane_regs_sc7280_cphy,
+	.lane_array_size = ARRAY_SIZE(lane_regs_sc7280_cphy),
+	.common_regs_offset = 0x800,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 41664a593f91..ebddddb14efc 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -627,6 +627,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280 = {
 		.lane_array_size = ARRAY_SIZE(lane_regs_sc7280),
 		.common_regs_offset = 0x800,
 	},
+	.ops_cphy = &phy_qcom_mipi_csi2_ops_3ph_cphy,
+	.reg_info_cphy = &mipi_csi2_3ph_cphy_regs_sc7280,
 	.supply_names = (const char **)sc7280_supplies,
 	.num_supplies = ARRAY_SIZE(sc7280_supplies),
 	.clk_names = (const char **)sc7280_clks,
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index af8426af2ae3..2d33e7267e1c 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -125,6 +125,7 @@ extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280;
 
 extern const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_cphy;
 extern const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p;
+extern const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sc7280;
 
 void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy);
 void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy);
-- 
2.34.1

