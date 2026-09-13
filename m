Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE9406270
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325487; cv=none; b=Ksvr70ArBSt5lFpEUqisPtVn+ORK1jWFT3EhGY//Ag9qvcVhgs/XqklmQOIU/aVm1jgX6uCcIzRxDVZMJMEd1Pg8CthsFXUcNuZIlDZbICSf6F7zI/g5LvrqpE0d6uXIcZu+zUH+SF4tw2tQAT3iu471A4MY6fs15lJQMaoNaoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325487; c=relaxed/simple;
	bh=XZTtH+KJamke7BFQt4SKU9GHxEgBbysv5OHmqTqkLnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNIAfk4qU82Bl5ilFkR2DdpwLcDWE2nvLEWn7ZgWE67BwlYYhwz8zoVL2EsA2IM/KzLVh6CrCyj7B1h+G66/uYFqNvulkDOhCRT+vFEnbjJ7VSlaid8gwhNkkNteV9aBtKB74fc3+ldbUqcEniySSROQJSigqSntFlN7txSHQCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YnG1P6rN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdLx21Qg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YnG1P6rN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdLx21Qg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2bt23284353
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2X//wdUyighhdjTu9aFC9mEc3Ky0vJevf2387nQX+A=; b=YnG1P6rNVYvQj7N1
	0JRSiheTe5dwHdZ1yYPoC8K73Y6fdz3lsSxvQzLGnLBFiaDjZqibnzkLuybNnZLj
	PWm+36kedWfqlFiL9ywbNllZxVDfhuyuwwl+A7Kgbv6bKtVU+QG1pGMDuseDZ8Gu
	O5w8up4NNpOXW8SJ14ubeCa05DvnMEWmCFYutHBDJZt3i31k0CKgEvtu0wOioXnV
	a9ckf+Fx5tyhjDeWWoNoA2+1dwc6b8Xrz1TgmdPpzPnBGTuivpglI4eDgiGAvyXx
	2A1JNrBcQ++35N9KlZeK4u78VUxZzxXbnphV2BU2pZ2XuRtHWItpu950tFtHI3Fw
	sNDYrw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cby8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399311947f6so4850040a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325481; x=1789930281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2X//wdUyighhdjTu9aFC9mEc3Ky0vJevf2387nQX+A=;
        b=gdLx21Qgh1qyJDSP4yRgAUZXRz0ca+BS57bDctsdd1GjY9dq7zZz8ulbnLlqfRLxJY
         DbC3B/eJj+Bm2+l7cduelkZZX/DWoIZp5td1JzCYyYIRXNDJO9FG0q9b45HvKacXkkSV
         78KNIsx0uXoR7BKW1PQGnt3yAd5X1s/w9MZeQPAIuFqq99A3vv4nz5xQlmwA0DvGOaYY
         0GKtO51GrDPfhUOyPAIK5pyZRMwbeR647ADqAdvBVjU0jF6QBGA/U77bxQ7yghgHwTke
         gz3tbN1j6eSBJ6XQkKXLwUPqMXLoNdtKiIG1jAj+sq0UBUhtZ23HCLPGaa0ygXp8Ba8U
         QC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325481; x=1789930281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2X//wdUyighhdjTu9aFC9mEc3Ky0vJevf2387nQX+A=;
        b=B0FrFcUWLx+3DCWZPayKzcPbG0dqhct9lU8BuKRYUEmPAIa2OnzMJ8EU2RK4RYhV6F
         IpU5RTXEZUMpBE0ZInbHFoXnhGUnDX263BldtdQUycnGMk3Ny9kJrWxtth2JV9R1wuT5
         acVLFm2IbcE7J3k4D+sqRkTJLSwt7hqWyhlp5/WmA1tQWXwudcNXyLN0ttS4A3VRZFRJ
         Sk9FUendGSMUPY8VWM7U/RW439Gs2nNgRbfMt6KowW8n0VaepGvLcdDyL+DGTIza2iJu
         tRXD1Wo8oR74IN16DyoeY1iT5hlIZ2j32wUzzoa6e8qXzM8gIIRSFBYb+UBOGu4ptEdu
         sq6g==
X-Forwarded-Encrypted: i=1; AKwUvBxNLTL35McaFcnbSl2rt7BnCcs0SbRPrCLQyKvvMwGU0vhk8KN/aWTtcWcaTKSXlic6lwq7RBXtFEToV/4=@vger.kernel.org
X-Gm-Message-State: AFuF++kaWsrgZuJeA+Bk1oihaMwBec8pMl5WiEdNd8Rf33xToDrA/aXm
	xVBW4G+BU3Hc8KMAdo2gAb6Cbz/RNnfBuHyLZ1NA0uJe0Q2gDP/UaA9iooGpt/3XN5/2Z2ZXE+f
	G4ybhmldfyD87VTw1/Y1dX3bAsPnnkFeEu+LnUhUw4TWsHCM+nJfEDd536ycVucPI/otTs7a8DD
	s=
X-Gm-Gg: AYBFou2PHGmkOQic+YM7fXDSDym2rU+fBtmoOodMGKfo1MPHURa7cPz4/TDKvwoQIKz
	mc4WJapMqvy513eweMt2tq9t7CiEd3mQJ6JVFs02a8Hq6LhrCFClEyWduYSPS5NCv2rPXMpLJp8
	WkrIJfKFTueA4Tue5DXSIPqbh8I3v98PZxBeynoC6bOy6qwGfkgxZ//5NSi+3QGHDjvNjLGLwYr
	JIA3wU5d9L4HpFm6ikUE18sFyFFagFWqWuFDc6OXyfZLmVwlCn5U7Gujs3LDXRQPydGQpX2VVr8
	a9HfrqmHTr/Nd2Hpm0/VvYfSMTGh2E5R8cOyl+YRfwDJeiE1WSzj0okl4V7ZZLN0L9+k7i1bbef
	kgTe+5m1+rr+tMusQ2bUKAcGME4VeXeJs0oo=
X-Received: by 2002:a17:90b:5283:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39dbc6f0818mr15864242a91.21.1789325481140;
        Sun, 13 Sep 2026 11:51:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5283:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39dbc6f0818mr15864196a91.21.1789325480726;
        Sun, 13 Sep 2026 11:51:20 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:51:20 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:29 +0530
Subject: [PATCH v4 12/13] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-12-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3374;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=XZTtH+KJamke7BFQt4SKU9GHxEgBbysv5OHmqTqkLnA=;
 b=3nR06g4I3fBs4o4T5XyN+m8O+pKFq55VzseEc6i5f+1knjv4ynnPHTfHqGTC4ufsLP9OOFxdo
 GmoP0kLA6X4DkjwqjCtu/xGJOLXc3FWdrQYymwfSkvKVr1uhi+5WF+h
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXyY8ZCfO14eZv
 aHJ83/F0OfEFxZ79/y2+EVCXK/9PbmphQMwPa5bk2lC/fsgkGLeaxkpHuEpKlqGVv8h56KxaiXH
 nCj3DgkcXDFVn0y+4a2KERm4ry3Ze5E=
X-Proofpoint-GUID: JLFFfLGwsQ1KpIazxUm6MHkIIcW-OPuJ
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6f0a9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: JLFFfLGwsQ1KpIazxUm6MHkIIcW-OPuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX1X1WwTwCBVtW
 M4Zp1dyV/GWF8kOI1OQR+kQvIfaIrTpfZRoTJQ7565pmDcbPAManGY/WqzpvEzVTIuCIjL5/r5/
 XQQ385KwXT/BTWS+u7jfDjanD7B1MT3l44bZbEvRldtXXqx0QPRDhfUx/EwU08JHYB3Sn1Yd62Y
 6MT7eKgm26CpHpOIn7p1fZ+4/5r+ubShL4HCKh45nlIQIeJ5X9P7wT+fCtlrOQjjzOJSqtUyoKN
 tLbrssTj4d/GVlURkBJyd6Q37Fbntgy1fNVQx5EnD90JGPTfmGtXcZ+B8TL4J41mhRGPLylBeFF
 66LBz2L3qVvKKSzW3HeeNpWtfr6Iz8i+i7xT/qmU/YPL5Yco+p9UFj43w7xqi0IFm9gYIULXstJ
 PLlv2n/CIChS2bXHnKuCszcaf2I6k4e1SEA5wD7+I4Qaiv8ywTPpF0fRnbqrYBUMrjjjaMiz4+0
 KT5m12An87WGnfGf15g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f9702addbbf3f4269e558e08d0bc1b25..88233c1f6107c5fbc0f0f68202fe6383abb10f3f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5274,11 +5274,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5286,6 +5287,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

