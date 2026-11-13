Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548041;
	b=yavV+BHgUefbXJnyB84dVGF2w9oF/I323XZ69lVqb+s4CMjdeNdFWIyJPZt58t2LUgAX
	 z+RPYOHGMKhcjJht/ucxBgXZ/T7Gv/XzKV2ofUDv7VKwam4w/keaAIvZwg+2709FFBH4p
	 FrjP7+fWWaYoR3gWCcdv/1WppQNG8l5ZCG6WoCUlIhy6oibXk4mCLy8EZvevh70pOrSqh
	 +2w/z3kLZ80cIxEk5WaIApKnUrapMg5IXb6LhWR2p1yLEjpb5ijVX++yWQDAsoK8Sqq/C
	 YuKWCanoXYbtB2FBjASKCGK4uTUoVY+snMwFc+Y7X2Xx8ZIi2eyHx3uQZwibMAFmhWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hrrGUXvg5LDwt/d33DGTAK5iq0jDAdxvcOqzbPiJbqg=;
	b=CBoBK7V9kscrOH8tFxRGcYX//ed+U1vcnaW5gF/vSFy+siSHFVEXdC0pR+5bacYsGQvH
	 6Od8YM03u1Hsz5Er+oPFfoiybk1wLug++7LftzTH6wC+CUx2WaUtwEI0A3aycKZmW+c3l
	 1F51Q0deioEbXtFbdexDUqRrgSRnXKU9rGahNYTluBYyoxkddVDGAvIyqRAQAr8I9bLpY
	 Yuh/Pmq85IpGLEGjUf4SRP9rh8OcodFsp8srLSNT3sOLc3UsZGwKXlpHjwwFOVwpLL6+r
	 a1w5oz16r378qt/9QV8IxEQflYH0lhk1For9tf2H6GVshgaVDbD4BLzXWspT2clzP5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2aPvc79;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBDrdS95;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1481C60A2606
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1481C60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2aPvc79;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBDrdS95
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57HsM367429
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrrGUXvg5LDwt/d33DGTAK5iq0jDAdxvcOqzbPiJbqg=; b=f2aPvc79nLvTWKNM
	IxfETBKwhI6tCoNH/edqjV2tUBnIfCjrTaGER7Cp4ZoOgwRCK1ACqciq96qib9Fo
	5XQHMhQiKwWF+V47LNOJrNxEmUUo6d84ADe/PXSomfurk+OFNfxaw+nAbXe7yZGk
	WrVdUGqvlAa/oT0ITQF7VlMX+azY70OmSxeB2lx/A+CmumrR/euRtzEbwfx74fm/
	HDOweX5wr1TdxKg4L2Q2nDH+ZIDqdO0q9tl80n4Jyt7eH/AlWJey0PwG0+Of9aDY
	H5FKrn2a3TPEnj+ohfQB52/ywhxLb0tNBs87Pls2zZRxM9na1C9tedKgnphS6i3s
	CRGxjA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx33mvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:00 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so775462b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548039; x=1795152839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrrGUXvg5LDwt/d33DGTAK5iq0jDAdxvcOqzbPiJbqg=;
        b=GBDrdS95xKRVNl7ieuHTdAxoGpZ1ha/f5LTLFp/zEtx1fzRORKYil7Ae45a1ixUoQA
         oMovWugQIET/uSDjFXeLRclMdc1de0aui7hcMQfVUBJjSoqUsuPuX+IQFTIX4RxzGFCP
         C2OvZUhMF7g6kt0d9rZtyfk/EeR+g7rHWdaqU5Y2mYToqhAnzFofN+/d3jLjgggMw3LF
         +UYlziDUgxtZbgclrIXmDtBt3EMsLYI5Hafl/8HW0uAH42G28ZXRBrWFWrUjBFnf2O7g
         aQ9Qf6NrFOdyArLgaJ9SegH/IPnk/SM5gBsFlmWU+/qzv52zU/73BKqJcOxg5aidwjOD
         b2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548039; x=1795152839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrrGUXvg5LDwt/d33DGTAK5iq0jDAdxvcOqzbPiJbqg=;
        b=Dmykzu6JvJeO0lWChk1v/FswwK9pPy0KqQCvAJwFvr2GRHvCjJbrwLLbw783NVy5Jj
         Anw3y6CeNX5OZwWOS1Gse0IGjNQRxWfSRNqih5ywmy2iZK9WDq1gQvWjPK+bXDKzCxIG
         JBGGp0ctc1uULQvGgzUayhPKTcR9oU+7KJx3zVIhH4A5TEqF8mjzvpUfBWiDO8OTLwi2
         d4jBbbKT7HZNU0HGJpPUgp5ThsvECJtG3uF886UL18ysCq7Bm9+d9mIxDwyrGEbGdPIj
         QNhVkQSD60QnZ76hQGSbN6RegJ6kyJh69ezkMZpyNGci0yHkRA80bFOZwroot2n6IbxF
         AF0Q==
X-Forwarded-Encrypted: i=1; AL+hErEWt/kHG9I4j9DD6829abAoP1a+hWOvJ3L4sDsY6pfW23fBtKrQZcRxlJH4hITwv+E5nzgBbTTfPLcDLZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SFSY3JpqefbxhxEkLNnw1Cf7J6rV27UqBOn2dgn8g0NlYGaqY
	mE1qZfD2vWU4izVTR5k7pVUW+l2zTe4iNzCS7JcqUWBnyC1DE/5RHDG9QAUmiJutOmZeDb0BdYN
	BW6vlxjtZx/kXNK1XvrbsZSI3KG0eLfgrdWuk61RzEqYfxQ5xlNxsZ+8SfSGp8MUOhWk=
X-Gm-Gg: AYBFou1t9f1+swgB41xdEGG7TJ3oCgA5kumYUXUoy/LZiwPBG7PmU/LGoEicmuRNrAS
	roA0RiJCjrPMSfnb/sxpN0sLxk6UwaLmPShGnS8+KM608gQvoIOoU/EvVnCzELVcM/u15NjncPX
	7ei3ffNLonCw7yod7INmqgGmMlr+TReOot12IW02j29y8LMEfdH7foy8M2rbBSl++4hv2lCS9Z5
	OBE/S9W2bA2iVyY++X4LQoGdTxuNiZ1Nwxt7JVlujJbbjxKATUCUhAXYU63MIe9VrRHcIDqu0XV
	0GOaz+wDtdYXdgCkUXPQz7waLWVeNnpZrZ89ZP5L2n+Af30bQe+mymfejVdGGSmLBzes4bbWOvB
	4pYg4+7WFXqkvN34Hy/eN/dRmJ4Xus/uMyU3Tb8IVLdVcPR0vZfDx6EiqmkF0Dl4Y9MI9x2GSgj
	L59sFCbQkYUqBypjVJ/iPUcMipPWLm2NyAGuMWN1NZXX6OgfytDV8nRYdm/FOA
X-Received: by 2002:a05:6820:2228:b0:719:1627:6c0e with SMTP id 006d021491bc7-71ab4d06a4fmr994581eaf.5.1794548039455;
        Thu, 12 Nov 2026 21:33:59 -0800 (PST)
X-Received: by 2002:a05:6820:2228:b0:719:1627:6c0e with SMTP id 006d021491bc7-71ab4d06a4fmr994557eaf.5.1794548038963;
        Thu, 12 Nov 2026 21:33:58 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:58 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:35 -0800
Subject: [PATCH v25 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
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
Message-Id: <20261112-kaanapali-camss-v25-3-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6a148 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXzeAKmx5s1vqs
 80CYwSkeVBJHnp4FlsIo4sTOSYvjK1e2vliMDdoBZXkkmEK7uCBYZLC+8tcQlHLBgTuTzE9P1pN
 5vQ+BFs7LbtSfbE90SQfYMEa0Mxz8SKGCaJKjwpBka1iXdDsWHrXEhPkoaRUPW/dmla5K9p2+Ne
 zyT3ZlildT8i2C/KdnMrlmK0TXEKMOezwtCYPvBwHI40D406mvo7eqLfGZ6YK1zljD90e04pQ2L
 9oRITImwwp4aUU9lCltZ3CDsGaK7qVFSfZcdFdE/AH6ApNMGkpgCe28YF+y5BLuIQcDrFF+6+i3
 Ws7tn0YZ3FCPyz8kbm6XfwlRGLU+ObOsMdGV0+MorfqVlHqIP+5oUMclIXcFl+Fe0d18GO56T8q
 JUul6WLXaPaaJzkcM7J5zvgGYmMNiwNQnT0f4v7Jbha1ivoednDuSrXeOXGkRgXbgALViyMsz8N
 0nerDTJSLf4eorgCF2Q==
X-Proofpoint-ORIG-GUID: GLSFyKTtYYWUf5Hfoie9I0_UrOquvpoC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX7x2BHl9B3y0f
 Xl6EmDBKG67NFzlesqEb8A8NW+pkwGjC6Ob0jruGroN3jeYfI+gQy0+UF21JpvmrSsRQ0ZrWT6c
 Erpc7DrvCBzhWGjfy3znx3Gw+HPyi/0=
X-Proofpoint-GUID: GLSFyKTtYYWUf5Hfoie9I0_UrOquvpoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..ed40934d67ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -374,6 +374,22 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index e04bde03e278..165e3d026872 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -443,6 +443,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..832c8d048b77 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -93,6 +93,7 @@ struct mipi_csi2phy_device {
 	u32 hw_version;
 };
 
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

