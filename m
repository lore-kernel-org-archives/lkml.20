Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AC149BB7A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194913; cv=none; b=kHePvAYrbgtxbH1OABWtwiHkVW0Bo0T88tLeGZ6BObhjOh42bG/IV/pHbbKWW3Dow6Rmy3HRYRryMmNtcwVu8NA0TiYiOnRU++ytNNEjPvH+z1aNihp+TdZuNNS0sDaxsDNlYBoLpaBQJ4nLyWuCa+NXSxhXt5iB3Uioh0Ez2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194913; c=relaxed/simple;
	bh=NHWbjLEcmdAovj3+XJkI8R7rVzYAjs01Hq+/8Hmwh+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bkp1vhEiF5/Es2XWVE9XN/HT5Yt4qw1MmYSMrpEFsK4SuYGAlVruk/UqUZmIiYrlgUGu3FrxV637wx5bJtQxmCAC1jZFDP5QvGT4KxHHl1IswaUj7fLg5osSmXiseZtO1HdqAMIR6hfM+sq/BFIZyi6gv2Vl/ox6p1+NMZyfB04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQrjltu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FITDggRm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQrjltu8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FITDggRm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFFn22166416
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zSo9NJFSO0n
	piRQQAI5lKIuz+Psdx072TJd4RB/+L84=; b=PQrjltu8Z05W1xB4Md26kPKdz3E
	wfxvtxmtg9cFB+4/4Y8u3YPHSV3RZJlnklhuDappfKvGjL/nz+Ru/yD2YbvjX4Mb
	az3msg6yDaqHeOaA3oKrC+5d4YaLi55MX85rGkfVVdNds9ypkr/dZcykvutX0Zac
	iJKRtUdqF+IjWA5UaDjvCY+zmjudcCtNrE8ilxEOjd8K2totSDXIKfWOjO2s43eS
	DqXXgZyfU3iLO7mCeHtaqNd0hNNCuN+Y9rrcU/noGYCH4Rj6fOHBxuPSg1M+NIwv
	lwIsv3ha6wwbdbZNuwbQpndVgdCTNActktqkoAA9LVTFOzZBOFEp9tHLLUQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtc5va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso687390c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194910; x=1792799710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSo9NJFSO0npiRQQAI5lKIuz+Psdx072TJd4RB/+L84=;
        b=FITDggRmynA273/4V6dWWmL0tAhCXuFeluBqLbvivQb02rEpfIuY58+1FQh6FzehfQ
         qwGZhxm76h/zCySIqXaY3r0FuirRrJosIMWdpFG6egmZPkcJLHAOQIAPvfkMhMtiFkW3
         Vwow9+X+OFlMkaB6AMhx9Icks3R1Q05scWwZMIyiRsbgXAil1Uxx5QVahnQDFYzO9U0T
         NHhxPp20x3PnfNnK1GG8ArrD0Ed4fb39rOk8mbQQtdmiB3DzDSIUpXC3uEi8n8BJ9PH3
         hzsTL7ev/HETWBp7JiqS71KnGxSnmR4u30KGN3B2MVpMkGsjALAZNN6a2VcQWlmaV8oS
         cXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194910; x=1792799710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSo9NJFSO0npiRQQAI5lKIuz+Psdx072TJd4RB/+L84=;
        b=wWqZuoliC+0ZAssoAdF+dqeo+BKoZbnB4uIQBuh6/qnLcnLMYcMzjl2BAkqD/4wAOv
         I+ptXOvBtKjbP83hYNmWiiPmIwY6Q2UUI3Re8vg17fkO2zxpnl2uDRK9GU1s6BOuvrCK
         veW9DZF9JxLtIpQF+h634Um/KllqJtaXCn9Y8jHMEFzs4uloQ3wpS4uEok+LrBu7bmLb
         2Vlih6Pbsll2sxxNgWbq+w/SbPxtmMt0QYichgH8WsgOLg0usij8VzQ3T3fKL3+xGUYZ
         JinSGeMTNoz5eg9g8qnS3fnwEPXveu5QrC7zFsj1qLAVSNU1MziKmpaHWQ27UgEm0JO3
         Iplw==
X-Forwarded-Encrypted: i=1; AKwUvBzYZB9hQhLZJzJBKI90I0po95pNVuoLQMjbBR1MA1CWLnlo4VinCgxFXuuoM6zIXQXQk1fpd2fmj5tws0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU3tjofS8iK6q7txItJqClvt73+7WckLWYxctERkLndOSkMn8m
	/Ow509LwTbN8GUTDTRrchdqaGZCyEcJtU4Mg4mztQ0nzD+vcnHk8uJUpzeRjRdqXPw6SYKKLy7z
	geZWcjMOTqRFL6OYuzh7TxufPAGnb44sY1ysBpMgi54M8/V+nqeHcmyM8CMAFy1PS63Y=
X-Gm-Gg: AYBFou278nIKBK89K7ZWKX4W1niQqbKx9pX0sxRRxwYyMqgogD4rtAF7TPeGH+5YCiG
	Nqn6UFcknMdXUNytcgeXbpEzm0Y1IUpMNHRl9vNPkPSnBv72KXPq5A0ZHxhMomUsjONRZdgmgeA
	7Hfp97DPR9vhy1Kt52wT6IqUZYUmdtdj4xogUgNehOXrTBBrjMcSdcNWF7MpIFeHBCOadDkubfx
	OPY9mNiFMOnqA5zsjiQrRi70A20IC2Vz3jRxQ6vbbXl3/35UCqikYVliyf+i6JEqWtBI7t6CYUU
	Veik8UpLIWQOmGeN/q8fK/gablxCjaoMiM6OJJpmbBp5j694g/x4vjdd92SWQStszRRaZCL317B
	aJNyg/HjRmbV2E7fzcwbKjiO9Xdj1DZcSiWsTdtLm8rk9yga6W85HnA==
X-Received: by 2002:a05:7022:ea47:20b0:143:2719:566e with SMTP id a92af1059eb24-18515a66a98mr1836433c88.42.1792194909449;
        Fri, 16 Oct 2026 16:55:09 -0700 (PDT)
X-Received: by 2002:a05:7022:ea47:20b0:143:2719:566e with SMTP id a92af1059eb24-18515a66a98mr1836399c88.42.1792194908850;
        Fri, 16 Oct 2026 16:55:08 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:08 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] phy: qcom-mipi-csi2: Add sa8775p D-PHY support
Date: Fri, 16 Oct 2026 16:54:59 -0700
Message-Id: <20261016235502.2274268-5-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfXyGd5DNaIu95D
 Z7u2QvpMM7LzVIosI7mh9SVyDyRh5xtwub33aYoDWwqFD8HyvB+NiI8gPOWrcz0BQGA5oRQzRQy
 95dDqO4e7/htS91/IGF5KfniDSXsbnjiP41A4klE073ctRK3K2vU69+EpptPuhpeW8Uu4JeADVT
 Q1ZWcvKpMCA/w8B9Iikg+sNEM6mSd6N2FTzoU8P5/OkWONvIGRrtAwQz56zmBfDaxNiEOBoPMtl
 m4+uqK/vtpZBdZGoUw6jUDYWejFeAvW5+IUG9EZIigrH++EFYyNLlAvMLIn9lJ2DbyagrE9kBn+
 63SAXYRnN7qhlYYasKP5a1Tg6TPGeN/oJ0MVmUZg6RVsg3pGQDWuNhtZUEILA+5hVqtRnjzTb4g
 j4XqMvY1aj6f1FhieQaj2wgMpkO2kNrrHIoR54lMMkZ9qj5MfmnMemAmLy4kRgK3FjDQ4UJ+ZRy
 XWG4hjYIATxGI81bm5A==
X-Proofpoint-ORIG-GUID: YV9eVDVmLIdXZ96T64o_3dUUBWPhQfVY
X-Proofpoint-GUID: YV9eVDVmLIdXZ96T64o_3dUUBWPhQfVY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX5+BS/nucjJPG
 Mf+QVCyUhunkMHEFeR+ixd25eRrEtP/+YMUCEpBQHTZ6X/KT1FmQATMpdPkUXaFMQXQ+B54r9rW
 atthrjJO/+CV7LhF/dpgDVA9nP9uRuc=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad2b95e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=44N_cihSaI7VOVReE0gA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160095

Add the SA8775P (Lemans / IQ-9075 EVK) CSIPHY to the generic MIPI CSI2
PHY driver, bound to the new "qcom,sa8775p-csi2-phy" compatible and
reusing the existing D-PHY 2-phase hw ops (phy_qcom_mipi_csi2_ops_
3ph_1_0). The lane_regs_sa8775p[] init sequence is the CSIPHY v1.3.0
2-phase 2.5Gbps 4-lane D-PHY register set ported verbatim from the
legacy in-tree camss-csiphy-3ph-1-0.c table; common_regs_offset is
0x800. The soc_cfg declares the core/timer/csiphy_rx clocks
(csiphy_rx is the shared CSID CSIPHY RX clock, matching the DT node
and binding's three-clock clock-names list) and the vdda-phy/vdda-pll
supplies.

The timer-clock lookup in phy_qcom_mipi_csi2_probe() and the OPP
clkname passed to devm_pm_opp_set_clkname() were both hardcoded
string literals sized to x1e80100 ("timer"/"core"). Add
timer_clk_name/opp_clk_name to struct mipi_csi2phy_soc_cfg so each
SoC can declare its own clock-name strings; x1e80100's soc_cfg now
declares "timer"/"core" explicitly, with no behaviour change.
SA8775P reuses the same "timer"/"core" names as x1e80100 for this
pair of clocks.

SA8775P's CSIPHY has a single power-domain, the Titan Top GDSC,
matching the legacy in-tree CAMSS driver's sa8775p_resources.pd_name
= "top" and the existing lemans.dtsi camss node. Like x1e80100's own 
"top" domain, it is not OPP-scaled, only kept enabled.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 112 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   5 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   4 +
 3 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..85e89235f7c9 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -380,6 +380,118 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
 	.clk_names = (const char **)x1e_clks,
 	.num_clk = ARRAY_SIZE(x1e_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+/* 5nm 2PH v1.3.0 2p5Gbps 4 lane DPHY mode */
+static const struct mipi_csi2phy_lane_regs lane_regs_sa8775p[] = {
+	{.reg_addr = 0x0724, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0728, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0700, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x070c, .reg_data = 0xff, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0738, .reg_data = 0x1f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x072c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0734, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0710, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x071c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0714, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x073c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0704, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0720, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0708, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0024, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0000, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0038, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x002c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0034, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x001c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x003c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0004, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0224, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0200, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0238, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x022c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0234, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0210, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x021c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0214, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x023c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0204, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0220, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0208, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0424, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0400, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0438, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x042c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0434, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x041c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x043c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0404, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0624, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0600, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0638, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x062c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0634, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0610, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x061c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0614, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x063c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0604, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0620, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0608, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x005c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0060, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0064, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x025c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0260, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0264, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x045c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0460, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0464, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x065c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0660, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0664, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+};
+
+static const char * const sa8775p_clks[] = {
+	"core",
+	"timer",
+	"csiphy_rx",
+};
+
+static const char * const sa8775p_supplies[] = {
+	"vdda-phy",
+	"vdda-pll",
+};
+
+static const struct mipi_csi2_genpd sa8775p_genpds[] = {
+	{ .name = "top", .scaled = false },
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_sa8775p,
+		.lane_array_size = ARRAY_SIZE(lane_regs_sa8775p),
+		.common_regs_offset = 0x800,
+	},
+	.supply_names = (const char **)sa8775p_supplies,
+	.num_supplies = ARRAY_SIZE(sa8775p_supplies),
+	.clk_names = (const char **)sa8775p_clks,
+	.num_clk = ARRAY_SIZE(sa8775p_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
+	.genpds = sa8775p_genpds,
+	.num_genpds = ARRAY_SIZE(sa8775p_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 00285be9dd64..821c6a0a916c 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -402,7 +402,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		if (!csi2phy->clks[i].id)
 			return dev_err_probe(dev, -EINVAL, "Missing clock-names\n");
 
-		if (!strcmp(csi2phy->clks[i].id, "timer")) {
+		if (!strcmp(csi2phy->clks[i].id, csi2phy->soc_cfg->timer_clk_name)) {
 			csi2phy->timer_clk = csi2phy->clks[i].clk;
 			break;
 		}
@@ -410,7 +410,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
+	ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk_name);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
 
@@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..5578741c0930 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -68,6 +68,9 @@ struct mipi_csi2phy_soc_cfg {
 	const char ** const clk_names;
 	const unsigned int num_clk;
 
+	const char * const timer_clk_name;
+	const char * const opp_clk_name;
+
 	const struct mipi_csi2_genpd *genpds;
 	const unsigned int num_genpds;
 };
@@ -93,5 +96,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
-- 
2.34.1

