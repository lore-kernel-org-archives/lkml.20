Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616142;
	b=OKOg+5FLEjztphdLO85zwo527IfsdTz4COpOiL5nZx6TONQifsss+5L75fjOWF/TVipj
	 df4zW69z7IQEwbCrp07YFgDUxyxLEAIyrqpgCDpctNy4DoG3fqEQtnaMeFQb6ntW11hfC
	 ZFgaOxQM10JnufEJ6zpti8gUYptH4JtJzu2+XShw07k8c00H/3TKH8FwJlcy8P0U4axMn
	 Cd0MRLuPZoO8cg3EhiGJGTbbGHOSxkj7RwKcBYcwKyqCyD7Hcaa74wdWoxQuMIiMWvFvv
	 x0KUF6CMReuH2x08uYRLyk2+AkU1bVd6j6GUv+puVMWNOt4C9/oMzo7S2Y5HfR105Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
	b=2Ma6URs9CWG/SiKIFQxqL+pMnUyzgaR8F8AKfEcdNPAVN/dQvEmpc6yhRy8by2a+bZ7c
	 ew+98vakdPCyj9Y9jGTytBZ1jl+geAzT2N0gE1w1dIdXTlDkKzepYLsEob+5D0nV+BZ0y
	 8wcJQx2sjhtutxnhqtSIQ4EEjcpW/MPH8kLHGVD1o6WL8ytlylkhPr2rL8Ic6iL2mGUx4
	 kiHFKrGWsG4pfadBgVgO+mFOsqymgAXOJOYha/194UD6GV1Lh+N83kq7rKByTdxZXCeZK
	 MrQgsivFQG39089Gs4z4OYCOK2ZZYDhYh2F402q1iOAoUW2L8kL+yKj1k/tkN6NIsYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVAXJiAc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G+OnG/73";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626860A260B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E626860A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVAXJiAc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G+OnG/73
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29APAT3086563
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=; b=MVAXJiAcHKx346Z4
	gBF0ZYkZ8zmOHZmk8isiNBTpjqUf7N0j6ghGgwJK4/h80EI1ufdVtSY+qksON/5s
	VIGqu/risGfQ6EaJppiE6fVkC1mmexuD4yqANEQyT6335irJ8GLrN7PSZQ2XgReF
	7LQ51ZHI4W9llbgNTIzzthBnYLUjz02jRgGO9LM+jw95d4eCJ0qkQGw6NY+7WioL
	NjnRzfOSVop/b+1xp+clr8jzj82K0aV5Zv+k4WAZTLJVlcsn9gvJK8eSHZJOMApO
	QTzJxYyVg1WyGaXKhm0lB8DkmGf8B/wIZVXFPRoY3B3vGpwsrzNsmY1cZgrkO4P4
	y1rJQw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61d1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:20 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4eb0b989f0eso4092342b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616140; x=1794220940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
        b=G+OnG/73ZuGVNPMEg63vRhcQzCUTjlB74A4c7HBXAkDtiq4O8FImYsmWED/y6MP7WK
         d9gGWx/AvQxVKmakDQqwsAxpmd6dEuJh0CwAxZxu42Hmne6krRTk2pz+hAacT6Nw0gvL
         /iECrSvOw/ou8zFngT3lbNGWMnq0pF7VAIdnXKcLuwhqOV9uBfV5EM8A/SW/ke9/+4fq
         xRo/DMfVxkOc3oUeSmQdBpSKxZEVZ6vj7mcTGfP2kHLmzjcuWXdHFpw+xCD+wNbm283b
         a7C4ybwa8SmNWf4jIg+ugpXq8zgdTbNUI3mfYSN+i01wBDb2ZO6KYaJtKn//WsEDwmfP
         mivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616140; x=1794220940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
        b=jwwJ6EOJwej3F6Y75cFsKA0Sw6ZVLtWSbt2mbtTZv17w+VZ9kZzvkYG0ZenEUbcoS5
         Ya0sQHMFJtGYKmY49X99isLVggP0ARaGwYOExhadJdxItn9lXmrbsPMzXV3bCChl8H5Z
         yIB1jGwe4rLLO6IeP4R7Fv8kApyBL0h3e1ICBCGnMK2z/O8NqGpDFJEbr5kQK7/anQor
         lmc2i1+gaXfEx9VpcMsocZE6vp5qGy1jgsUMUfbuDqEh3Ym7wHJt4kLBHlAjgt2hou6i
         ryorsWYLsDFwGgJG9er5zhDXAMYgg7xCJfTJVSQGKerpwGgGYE33MjsocTZfDTYPfFY0
         Q2aw==
X-Forwarded-Encrypted: i=1; AKwUvByuNnlXABFcOqyEPjbLzE9SuvIbfFLJsC3sFsGFbFIGxKvBEpRpFO6zkoujVEYmtHdA5CAMsbCDajou3SA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf/ZTM6aK0JD88c3sFaavuwx0qH3mM9d4VqqXq84ODBbklduIX
	8hczr+gvEdxKKOaalQ5wTOOk8YUGXQIl5HlcNVUBYwS09OIEz8ZEJRNchB5putu61QBLt3Ug9t3
	X+srWs9nOHgA+ZQ2oZyCJfOzzAtCw0w4+OSE6KjihWuwMxnibBdNnqRVLGt81ADiXSLY=
X-Gm-Gg: AYBFou1D7MiXb9VVFUX51KcY00C496/cd1ZVNDXUOox6U7s27F64CSWJaBArmrNp2jF
	J0vu+KTMOBaUIRB/wzMs44sZQOLdUI81Y+z4PdK2Sz33hJno3voCc5n5yMfc026s+atMpBIugK5
	ICD3VsFVyuwMbOsTLOVutcbrC/qBbJqDaDVnBDCjAlRgExvhMBfIs2bi4GPM0/gkJhwx/GDdyu4
	+8bc4o/NFUFlwOHTaCELXDpZXlFAZW1KySE8tOv4gWl7RdQqdCescb3zDkuiaQ8OSQFppigoerw
	oNkMRkWeQ1EIkMsrKbr2g1uy20mLeEKLtoBqPpO+nzBT6Y8uzCv/Ec0P8NUg1qVyAVS75tUMUCK
	k+HV9ZW5jO9r3/aTeA1ie6DXvPzwvxt60/c2GfIxY26G5oVyJZy866Ek8eNEw4XVIqHsf1Z6tjf
	/j92mvmN34kQSS4Sxdaytddes7n3D9DUsvcKReHFgd5u6e5kTK3vUrsxDR3t8=
X-Received: by 2002:a05:6808:120a:b0:4a3:cea7:4ab6 with SMTP id 5614622812f47-5640de48fc8mr4536092b6e.10.1793616140134;
        Mon, 02 Nov 2026 02:42:20 -0800 (PST)
X-Received: by 2002:a05:6808:120a:b0:4a3:cea7:4ab6 with SMTP id 5614622812f47-5640de48fc8mr4536083b6e.10.1793616139644;
        Mon, 02 Nov 2026 02:42:19 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:19 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:10 -0800
Subject: [PATCH v24 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
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
Message-Id: <20261102-kaanapali-camss-v24-2-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8ueXVA3tID_O9Xek4D1DhxsGvuKH33sd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/dB/CGni0yl6
 1I7nxkbKp1vu5sp7vQ3EtJZI4R+4TY0qhsvS0ya3PHC/5HcyJgfcSiO8shMzoicXwocsU9cpzwq
 5xPwW/x8X8RdjxcmatUKg7/46aKQDrQ=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8690c cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX02NN3bsr6tXc
 SYUJCOQE3fwAhm+sc8kdrbfiUdewG+TLMMglXTZ3UY5+q5qpjmhR4CFQHsbRwrabpXN3e/j05WD
 iErEreTxSf4cxEz2BN6tN8GpNHc9oL52lxQvp8FyJflz8+I3Wu0YQUSSZg0rtfzm1gYVu9YXin4
 o8KaOB5M1g6liG7cZwUPeRPOlbjTogC5tu+kgv3ZZzHxIrpcnBZ8xeciByiVwn9sMSYH8zz1aSB
 VDVvSpcu6n/xtsyYh5yRRHOYcdL35vluDUcv71sK00XUvPndQDTPttZJ3WqjtlWu3hW52ezWSEK
 EdbBzOaDpCg+Bzn/8hIFc/8qPHLQo/L0R20nx0MGXKT7K3VCscnKnqK3cSgIs0IGWe5zVE31yZ1
 xvsVUvzocXOOSEM8Vzb+gxAfFQXIj7ytfd2HyOLnz3D5MO053mgoioGwNSrS8+heIptqPQgr0Yt
 RGMEgBRg9TB8KfmxSsQ==
X-Proofpoint-GUID: 8ueXVA3tID_O9Xek4D1DhxsGvuKH33sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

