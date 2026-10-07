Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F5647DFB9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363743; cv=none; b=jhGdCiprT3f6bafxh3HAk/aVajS9TAhQq6o/Em5ABagl4jK1nyavQ6hMNH2QMT5ZdYpfdYTImzIF39yPzpmenmpD8FhkpBmcgO7TR8ZyA9ztEsnv7LV4Se22TmV7u2X5P9UmwBQvK0qTmo2fCTAQ9mSlKf+QTP0tZdskq2VYqqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363743; c=relaxed/simple;
	bh=Jwf+0+K9v4ZiGUn4GrpJqPMCEH18nouQcxm79+WBHMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KOj82ya38gI6eagNtM0ybKQEIMFhC3KB91hTM/NrcNDalmQR/GiimJxF3Ci7RlN1RmwGMToCx/LwTeGiTrZc+6kwdWz8UxY6wVNuL19tFwqjTh8TZKbZ4HondeVozmrd1lv6O1mCfNrnvUGz6cEpbxcwhmj8PAqkIHOwKdUhVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYqa4Z3y reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYqa4Z3y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeD23334684
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/WAX3tXIYtf
	UYHfJJ0DzYn390FJgpp7sq8g9weWyJn0=; b=cYqa4Z3yIY5YmcNi2eF9FVhgYUq
	3UAUIrW0x1KbCu6HDlo7wwQRySIYjx+cf/n6sXYZnGu9W5AnDdmVsYz7V1WCN3o4
	BfBvkRDmw2IS0Ej0QV1zFCVuVktO72Gut9RNmjwf+E31oIyYsy9/b0DM4pHO5y/o
	rIQzobAgbUxjvdpEBJqcLHTzsWvZPu2YoR8NrB5tiKe2Nv5f702ld37EEdWUHIWP
	m7OQ9b/07Zq5NuZk0sptps1Rh4YqEcPtnoKlP/D1hShB5s4mxCy9cs9hkPlfzZYW
	fZgsdmOGeiCIypz4JTOX4lh2e+ZcdjLNCxmVH2pChBlzC/0aSIXw0me17Rw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623as8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so626201685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363708; x=1791968508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WAX3tXIYtfUYHfJJ0DzYn390FJgpp7sq8g9weWyJn0=;
        b=BBfxYSuZnnN6G2FJ4QbmM4WvrA+O8Dgk9SYazae2vCixzQogsfxmH7Rv3Mh9pZUhPC
         cq94Kyu+0THN9reKduTdhUKke07YhEQFADgK8hEk/0nOnTx0dq2rCNpUyMS43fD4fzFk
         BKyMeNinXEfV9Ya/wL7ybZGGRscYkeAv0jFT9h4kTKbRSkFkg26ld44tiKWSjfPXkEHf
         LYHANEr9lva3hsdP2AkPV7XjA4sNXcP63kRfCixlbKhTICFGZv7Iysaq5xYheDXhaOr2
         j2kYtCqnmFqWWe3yk9EevD5drnXDszLhchV2E0cikzrrMlHdzfEkPkG6vO01bgKxyXk/
         OetA==
X-Forwarded-Encrypted: i=1; AKwUvBzTkLYE5NR2EM5FhdxH7PxBhcQnzseHvfJVuJBHSeg35roshxwEIlW/0QlHHAjoMC8ZOFsscS5h5nW1q5o=@vger.kernel.org
X-Gm-Message-State: AFuF++luAg/9paSWuAZDgqPRFBfSE4ywvDOqe1JN3AecD2R+dVJypM6x
	A/0hnNwcZXMxIKKsiIPeNG2xhcchj9GSDXtz+aaQSZlNUhLcQSKVCbsKd0yy7/N+ZH+w+pFNO+t
	GOcg1PHTUuaI1QE5X590t2I0mS2X39zp6u6GsaHBcDakcmVkyEfdyrm0nMGNl97z0WYU=
X-Gm-Gg: AYBFou2/auAwPDOMejrPqVDpdop18uj+/JoykTk+o4MDZ9FNa1vAiTH7iCrwKfhgxlZ
	muZRK8LjaOXoxNT3YvfOnhCWKvwMJu6gP1B70Ak/93jA5nmN4PUvU8lGYhBA53SYYoSN/Cj3/gs
	WeGfTIMVrLEMpdXfEcLDfaaPa2WHw6N/FXrfpNMZ5Fa0C103qZzyTyjhqZmA0LLfah51WWaGVJM
	Y1eCis7vTbHyWaSi34TKpOS3UMp2O2CdPWs9TDHkHjtkwwm+aRf9FP3KAYSYKqn5iWQQSSvO7mc
	SyBmp1Lj+dm+sEYJYycivmhWsRn/d7eSldXGEi/iYDPryM6TNdUJb0b6JI0=
X-Received: by 2002:a05:620a:1729:b0:93e:6394:5e37 with SMTP id af79cd13be357-93e9b74355dmr305654085a.14.1791363707625;
        Wed, 07 Oct 2026 02:01:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:93e:6394:5e37 with SMTP id af79cd13be357-93e9b74355dmr305646085a.14.1791363707027;
        Wed, 07 Oct 2026 02:01:47 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:45 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 17/45] media: qcom: camss: sm8250: add pixel path resources
Date: Wed,  7 Oct 2026 12:00:13 +0300
Message-Id: <20261007090041.3732717-18-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LbthvdiDyins3eLzrzWcMVwQA0uf2-Qc
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60a7c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=O1XUiH9HgQSgLzsyt4oA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXw7JyJ75ahe3X
 iMsdxVqolVYPGsZ7wHdeJ6OzMq7P9xbph6+1MiVRs8syuW0x895Gy9JwCBB1EcmoP/UhHNMpxrF
 MxsxKN3k03sixg4+FDSmkU4QetWwqrI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX9u9FYvtc+AK0
 Q6HIyh2+s6Y1rEwU8U5QIQt7Ikhtw5L+aP7e2dEtoCnkN/eItpq+Agk8Lz0EELUWjCl/ytTX0ye
 8g6ElJKve2ZrlUl0RG3ftLc0gtstAcNf5b7sfbi6B0uDU4Qa6G4W2W554bFJcBnhYrWpYBQJ9ZU
 LBMKUQs3c5NUoj9AlERm6m7GHGeTxH+g1NJFFDiL8FqvAM6OhBHHxCRvjs/oaSkTlpZFCFXZf+c
 3NT0T7IRK2Kxsz0yxCOp5dLbl0S5hMMbxGhjqXqO1u1GSiYiUS3dIaTjrNNPL2OWgClcf9So08e
 iToMFmozBROZXZS94jRbB0uZ9LevkApidVKFv6UtaE+aJC8nxK5xqW6I+8Yfjo/YzGVClSSKahp
 XAGRPs6wOaeDdpaSy4/3UoFp+I4yMGA70nnwA07QxlcsuKw0z/v6luv45LBHamo4wQBVpRjjfWL
 8iiurUWGrpV88E8/4FQ==
X-Proofpoint-ORIG-GUID: LbthvdiDyins3eLzrzWcMVwQA0uf2-Qc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add CSID, IFE, and IFE Lite resources for the SM8250 pixel path. Select
them with the qcom,sm8250pix-camss compatible.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 224 +++++++++++++++++++++-
 1 file changed, 222 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7c355003c957..2dc7864ebe07 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -27,6 +27,7 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-fwnode.h>
 
+#include "camss-ife-camif-v10x.h"
 #include "camss.h"
 
 #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
@@ -36,6 +37,7 @@
 #define CAMSS_NUM_OF_PIXELS_PER_CYCLE	2
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
+static const struct parent_dev_ops ife_parent_dev_ops;
 
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
@@ -2269,6 +2271,208 @@ static const struct resources_icc icc_res_sm8250[] = {
 	},
 };
 
+static const struct camss_ife_stream csid_ife_streams_sm8250pix[] = {
+	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
+	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
+	{ .id = 2, .pipe = CAMSS_IFE_HW_PIPE_RDI2 },
+	{ .id = 3, .pipe = CAMSS_IFE_HW_PIPE_PP },
+};
+
+static const struct camss_ife_stream csid_ife_lite_streams_sm8250pix[] = {
+	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
+	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
+	{ .id = 2, .pipe = CAMSS_IFE_HW_PIPE_RDI2 },
+	{ .id = 3, .pipe = CAMSS_IFE_HW_PIPE_RDI3 },
+};
+
+static const struct camss_subdev_resources csid_res_sm8250pix[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite", "vfe_lite_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		}
+	},
+	/* CSID3 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite", "vfe_lite_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid3" },
+		.interrupt = { "csid3" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		}
+	}
+};
+
+static const struct camss_subdev_resources ife_res_sm8250pix[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
+			   "vfe0_axi", "cam_hf_axi" },
+		.clock_rate = { { },
+				{ },
+				{ },
+				{ },
+				{ },
+				{ 19200000, 100000000, 200000000, 300000000, 400000000 },
+				{ 19200000, 350000000, 475000000, 576000000, 680000000 },
+				{ 19200000, 300000000, 400000000, 400000000, 400000000 },
+				{ } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE,
+			.pads = &ife_pads_v20x,
+			.top_ops = &ife_top_20x_ops,
+			.camif_ops = &ife_camif_v10x_ops,
+			.mod_ops = &ife_mod_v10x_ops,
+			.buswr_ops = &ife_buswr_20x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_streams_sm8250pix),
+			.sink_streams = csid_ife_streams_sm8250pix,
+		},
+	},
+	/* IFE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
+			   "vfe1_axi", "cam_hf_axi" },
+		.clock_rate = { { },
+				{ },
+				{ },
+				{ },
+				{ },
+				{ 19200000, 100000000, 200000000, 300000000, 400000000 },
+				{ 19200000, 350000000, 475000000, 576000000, 680000000 },
+				{ 19200000, 300000000, 400000000, 400000000, 400000000 },
+				{ } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE,
+			.pads = &ife_pads_v20x,
+			.top_ops = &ife_top_20x_ops,
+			.camif_ops = &ife_camif_v10x_ops,
+			.mod_ops = &ife_mod_v10x_ops,
+			.buswr_ops = &ife_buswr_20x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_streams_sm8250pix),
+			.sink_streams = csid_ife_streams_sm8250pix,
+		},
+	},
+	/* IFE2 (lite) */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
+			   "vfe_lite", "cam_hf_axi" },
+		.clock_rate = { { },
+				{ },
+				{ },
+				{ },
+				{ },
+				{ 19200000, 300000000, 400000000, 400000000, 400000000 },
+				{ 19200000, 400000000, 480000000, 480000000, 480000000 },
+				{ } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v20x,
+			.top_ops = &ife_lite_top_10x_ops,
+			.camif_ops = &ife_camif_v10x_ops,
+			.buswr_ops = &ife_buswr_20x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sm8250pix),
+			.sink_streams = csid_ife_lite_streams_sm8250pix,
+		}
+	},
+	/* IFE3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
+			   "vfe_lite", "cam_hf_axi" },
+		.clock_rate = { { },
+				{ },
+				{ },
+				{ },
+				{ },
+				{ 19200000, 300000000, 400000000, 400000000, 400000000 },
+				{ 19200000, 400000000, 480000000, 480000000, 480000000 },
+				{ } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v20x,
+			.top_ops = &ife_lite_top_10x_ops,
+			.camif_ops = &ife_camif_v10x_ops,
+			.buswr_ops = &ife_buswr_20x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sm8250pix),
+			.sink_streams = csid_ife_lite_streams_sm8250pix,
+		}
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY0 */
 	{
@@ -4977,10 +5181,10 @@ static void __iomem
 	return NULL;
 }
 
-static const struct parent_dev_ops ife_parent_dev_ops __maybe_unused = {
+static const struct parent_dev_ops ife_parent_dev_ops = {
 	.get = ife_parent_dev_ops_get,
 	.put = ife_parent_dev_ops_put,
-	.get_base_address = ife_parent_dev_ops_get_base_address
+	.get_base_address = ife_parent_dev_ops_get_base_address,
 };
 
 int camss_attach_host_data(struct camss *camss, struct v4l2_subdev *sd,
@@ -6142,6 +6346,21 @@ static const struct camss_resources sm8250_resources = {
 	.csid_vfe_fixed_pairing = true,
 };
 
+static const struct camss_resources sm8250pix_resources = {
+	.version = CAMSS_8250,
+	.csiphy_res = csiphy_res_8250,
+	.csid_res = csid_res_sm8250pix,
+	.ife_res = ife_res_sm8250pix,
+	.icc_res = icc_res_sm8250,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8250),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
+	.csid_num = ARRAY_SIZE(csid_res_sm8250pix),
+	.embedded_csid = true,
+	.ife_num = 2,
+	.ife_lite_num = 2,
+	.link_entities = camss_ife_link_entities,
+};
+
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
@@ -6229,6 +6448,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
+	{ .compatible = "qcom,sm8250pix-camss", .data = &sm8250pix_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
-- 
2.34.1

