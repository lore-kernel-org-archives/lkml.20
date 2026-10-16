Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A74548562
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170443; cv=none; b=Q4nmLZPDLftIhlldvUitareg0Na2mflUYEMBYaNraGnGLlXYzNgqpYdh+TnLNtu3Lww+5es33llN8UhzTRarZCZRchtPSVk2Be8BJs8UcMzq0Ju6z1UuTo0G1j3xL6xNEvyvby7Sf3zY1VmmL0DFV0bgLA6pjMMXDGNVr2BA1to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170443; c=relaxed/simple;
	bh=NI+HOKofBp35ZZB5kRjgj6Bca1ZC0PGe481UGKIIlVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E3+nFcNFyWjI+tiY9e3eo6GQ6qLfFoe9w8A9jXIlq4skBZT0RM+D4sc2erENFs1KHfibuK4Q2qo4UciVsJPhNSJwfyIWwb8WbUqx1GAd4IXHLixloxVMMPVyOIylMheSFl86idI5wGGbRCU1YJlWRPICVAnffuvMbIOg67smiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E130aczE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFVUOXcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E130aczE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFVUOXcA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5wHa997076
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tf0laCkIY+O
	8Uz++9XKKGPxDxkLjNK9ABuSo7fWpIWA=; b=E130aczEcEfMAlpoL5m1AnQR+aI
	hd9cGmWvovpUhiYm8KPVe/svCtwW37nrFbHx3M4cTFpLGrhV7PknWjvgGWDGSKlU
	7mNbL/pgGv6NeImjpxXznog2xvjEmcQypndJvqGkb8yKBPgj/oQ5Ob7aP2OVg504
	TGAtYen8rKaD0gzYWvY1uykDCwPoMG3PUIVFEBas5tO6jmCi7PhlcUCEONqw/d4H
	lyugpYrosvHUVadsc8Rw1dOGyOeibvErIaCMGvMFnCpaU0njjim2AldiCksCWrZs
	M25vCFN69xKgyjHBluzorb4NG7zimsdpsARkXGvTJUo5ZmarChjNl5dZmMQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtax2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d600e3ee5eso132949e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792170439; x=1792775239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf0laCkIY+O8Uz++9XKKGPxDxkLjNK9ABuSo7fWpIWA=;
        b=IFVUOXcA1MWfy2CP59zAiIRWGV+yVdtmYw8tmQv0jtQJ9dtub+4cNhLF51Jc9rGUl4
         XXJykMMZva+QgzhSILeUHZQdId9Z0MDCAdAoPbGZWLcuY6yJ3xb74e/teccCy4RQwMhd
         SB/7wBWMfK92sTNMH8P5bGR82xcuR8xHaVsz3S5iUDuIs0kmvdv94mVfmWEK3cDlIM00
         dD5r0pDGl2hr+IS0yIC583brOw/4t6BBYZhwN6IwrCYywsX6IQP2iECCkHKnFnjZw3lg
         +QlSCbUfOqmJ/8dN19Wlb5JYrx1bbjncQcgCq7F0Qs2nx58scEKOgSnyOg1vyaE9G/mR
         jJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170439; x=1792775239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tf0laCkIY+O8Uz++9XKKGPxDxkLjNK9ABuSo7fWpIWA=;
        b=BDrACOWUJmrSIuo+4anISWgvbiZyVfm9FHtzJkY7wzEna2mG7OkWnY4QLjzVll0DEx
         t+2437TRYjhz6LK7AgBZZicbOzi549fnbPnGGXsQ7ygc8i8Q9H+45+lV/YLN1xepIsIQ
         C3tSghbKfIuoy4xpaY5kpDj1haT+yWLS0zi49md8FB1i9MyB1w0TGRtSLk13yEiA5l/v
         WZrd4QRnF209s/Ifng2/wqhzfmRaIGZPXrLsmZpd9RAkbHkMQzsnOJdoA0QC0bWn2p3f
         a1q7e90YfFRNeL7Xttbj2wgODeNSEoWwVRQiOjO5Q0pYFNiyA1SQxAgmHmY4pml2zN0g
         gQew==
X-Forwarded-Encrypted: i=1; AKwUvBxqJGzRACLPU4K7JhHoq5sEeY/YPVi9Gh++9LKExreo5BwqCeEriNxUOo5++4oUBmRMNUCbBEAZdTl0qv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnbdong5V6T5CFhZk24hg4JLu2J2TBnt2P9IMx3wgwxtCj+B1L
	zVg3/IEkkeZOtR/QApihQfj5pgZcJ4DxHPCoJDh1W2YAaKnrXjTI8SijL9nk+KGt+5rdmaYsEqE
	NtbhkzDWodjyS9Ga/bPHV4sYEKqqZlWvKIZwQjxquKk0rH698runGcDH1J7LEUTZ+HKE=
X-Gm-Gg: AYBFou1bHWg9YktqHvcrmkmA7+Z0Wk09FkyRSmv5dORJAodETwltcYsYi7VVSqJuACR
	V3uUb1gSF7WY6C5X3P5FSAoysDsdbuUiDecYyhxjArTkCIkIVNt51pXfF34tI7ORNzILJxIH0rW
	SoI37g0ywqC6W88qHG94w3Z8KIlrWCIX1F9iGasrZ3/nS323SDMUAbcTosr9d7yBJoGjRcWqfiP
	rDhC5a0axPcphA8wwwO11TouttHYhfz9LWyYoqY86jJ2DchHfTSrGJsjZVIkBhsMFBSZ3Zp8WiC
	n0v5Wj7MfF0lknkucV84/nHoFw9kVLeMeGPmrjyArJ0ebDXlqRKA0R3z1uuPfuPiJJfF694oWc5
	L19jsESoGmBKOZoQIn1f8W9kL
X-Received: by 2002:a05:6122:32d4:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5eaa9eb7e68mr392972e0c.0.1792170438842;
        Fri, 16 Oct 2026 10:07:18 -0700 (PDT)
X-Received: by 2002:a05:6122:32d4:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5eaa9eb7e68mr392952e0c.0.1792170438403;
        Fri, 16 Oct 2026 10:07:18 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm6630571f8f.31.2026.10.16.10.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:07:15 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v3 2/3] clk: qcom: camcc-sm8250: use icc-clk for camera NoC AXI clock
Date: Fri, 16 Oct 2026 20:07:00 +0300
Message-Id: <20261016170701.1504338-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX3JDGoqOHaCxL
 uSGTJIHLJM3yvgW0iXfmchLb17TUc7HMTOW08RH6wg/TaudFf4B9HxJfzB4H/H4pN0KmspTCWmh
 7FaFztWz4q94IWA6CcgxrUGLiHf0iVV1Nst/BFwMzv6S6lzqBBsuZ+6bRM4c3KvOgxOCoUVz9Q+
 W6ZX7ALFFQPrQK4Yxkb6/Uzh3OpIh81IS/o9Ls9ul7NgLnt1689n8A6WX1Jf+3u+WZmCH5i5abk
 EAKj40kHBhkX+bxQv3+9RGJurKVEs4hPhh1IB7+tNcKCgvrOXniA44wNhpuMhMXNznRFg8jGNsR
 USyIgjXrhP17XH5L7f6KZJWZMdWT+7Jxn8aNmXnTn8TvUw22u+nv1u58CQSEvsM7K31+ozguF3J
 +xCpNmx5I4NU510pR0kMfsDruD7sjIxNYekm4e2a4d2yQnjwLXTOSTDdnmS6h8ZHmA26LtZLHo8
 WLYnnUYxG5Bze0wM5Jw==
X-Proofpoint-ORIG-GUID: R1S5aiDWOMhP-wbkPqcFe9ozpZpvbqwa
X-Proofpoint-GUID: R1S5aiDWOMhP-wbkPqcFe9ozpZpvbqwa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfXwm8v7/2Ho/5Y
 SZTO5eSZixHhDGxQNkU5CGMTnG40Xn5o7g3/69B+D6ZqqxCYjw/7XxnWcqQbIb/9i0trPu73pW+
 fXmFDP1w2Jwa+rDk8JkSxRTCn0HxhJw=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad259c7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cu8AwxT6VGdwWvmfZG8A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160068

CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
rate directly from each consumer means the last writer wins.

Register the clock as an icc-clk path through the common icc_hws
support, as gcc-ipq9574 does. The interconnect core aggregates all
requests and the clock runs at the highest requested rate.

Use the RCG rather than the branch: icc-clk enables the clock at
registration, when TITAN_TOP_GDSC is still off. Consumers enable the
branch themselves.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8250.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 21e9423676216..84a91103e5bef 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/interconnect-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+#include <dt-bindings/interconnect/qcom,sm8250.h>
 
 #include "clk-alpha-pll.h"
 #include "clk-branch.h"
@@ -2405,6 +2407,12 @@ static const struct regmap_config cam_cc_sm8250_regmap_config = {
 	.fast_io = true,
 };
 
+#define SM8250_CAMCC_ICC_ID		8250	/* some unique value */
+
+static const struct qcom_icc_hws_data cam_cc_sm8250_icc_hws[] = {
+	{ MASTER_CAMCC_CAMNOC_AXI, SLAVE_CAMCC_CAMNOC_AXI, CAM_CC_CAMNOC_AXI_CLK_SRC },
+};
+
 static const struct qcom_cc_desc cam_cc_sm8250_desc = {
 	.config = &cam_cc_sm8250_regmap_config,
 	.clks = cam_cc_sm8250_clocks,
@@ -2413,6 +2421,9 @@ static const struct qcom_cc_desc cam_cc_sm8250_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8250_resets),
 	.gdscs = cam_cc_sm8250_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8250_gdscs),
+	.icc_hws = cam_cc_sm8250_icc_hws,
+	.num_icc_hws = ARRAY_SIZE(cam_cc_sm8250_icc_hws),
+	.icc_first_node_id = SM8250_CAMCC_ICC_ID,
 };
 
 static const struct of_device_id cam_cc_sm8250_match_table[] = {
@@ -2443,6 +2454,7 @@ static struct platform_driver cam_cc_sm8250_driver = {
 	.driver = {
 		.name = "cam_cc-sm8250",
 		.of_match_table = cam_cc_sm8250_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 
-- 
2.34.1

