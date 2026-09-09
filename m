Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2A56C657
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965934; cv=none; b=KT5dzabxrL0vdfyVQ4FFmbFfnqu8yNOoU7MgZsl7vBj0ydF1XfJMggLaPVx4YOI/p2rNBELpTycjX4fbB+q25oZ1AQoWEkFyYpDxJ5DX4B49bxaD1fJSV7YQ3zz2rEu83jFBeKSAphLoH9Nv9hTaEhyv4GTlLL82gqawPkc1R1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965934; c=relaxed/simple;
	bh=nYlHwC6PKpfUPCQFPEdwMq/Ct3VZxMxSmtdDkckeGT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxQdl8o9g0YKGwqYALpcH6yV8Qp0zQdHTBdZ9Khe70M7hWd+mVtBEpIOWgheJc6APC+7CgbZC2QCMI+dAPn7w2+Yz2UUYW78+ecP0J3qLm2YdUwCOEmaFkI9KzNHuESHZ5ujjjyMoK/07iRM/RRbdlab3VDn4cDusFKWxfMz+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqpS/Z1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gT/nbFId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqpS/Z1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gT/nbFId"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2Os2018943
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1NS02MIUiZWRkHxOc0gR/eQgS1BhxaJu4QXKOfECR4=; b=VqpS/Z1z8WzRIEx8
	TzAM0QfQkHJ2p0D16mQgfW3fsApDBvZLRr+DCahCxyEkpFq2Fh4EFJ5HrIroDBXC
	23q9mJqSEeDfHg5qmOa2SqMz5EuMEuhgVRs7fGzswNB0jkJAvPzJBB6XB6hylxQL
	GJXDSygRwxwy1NpE5uucNJiVeOdea2XcSYbJljmF6oVpV4Dm9yKawpvCab5l2++P
	agNz3MU0SxZm0tZa2O7+28XOQUTtE3hBqYHWX+EEA+Ip3ljCIVnbUmPSasPe726Z
	naFEKThmcz8iHv51YdBBZQlNDM+vFhhPxGjl2YnfH0V3GsPzc9gx8qz4w2hs8xoq
	rvvsQw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x8yxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:58:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc44d708055so9977328a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965931; x=1789570731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1NS02MIUiZWRkHxOc0gR/eQgS1BhxaJu4QXKOfECR4=;
        b=gT/nbFIduXPahFoBUn65Buwx7RSA7af+20g1pOEOiHCh0KH55Wau4/msrDJCV/AyRj
         SsrSAk6B+9JLVlpp8cBVwI3pLr1LyzJ712qwhgVDjYvn7d2M/MvuM0+v0usYoeqsjAuw
         cDNJ0GNTrM8K6mzhLpnrZn/e/osmAkYMdq1acaQbvkjHM7RysJr/oJ95+97ghfY16HUq
         N++8CR6TPqV/NqUPiwtOe47ygBQYHe4icmEruPT8tbP87TDzU8wxUQCFMDqkcDhQ+Jwq
         U5cMaSPQYQs7cQFO5MHyFT3Q3Hsqu57gNawOQ/lgv6iKTLg3t07437taje+3unm9IXGl
         C6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965931; x=1789570731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1NS02MIUiZWRkHxOc0gR/eQgS1BhxaJu4QXKOfECR4=;
        b=ODNHAHnFwb87CTlBztE6l/1rPw5bDuLxThBvc3qYfwlQ+sh0G9uw+DFG0DwITAluSF
         ueQVTrD/D5jE2V9L6jg9Hz5UUVNqhV1JSVlSGOzTRArCslirdlc2LjoIessntYuasJqn
         55vrhlnIIZcOSsmXjnWx4TUd1JDgLavrXuKsqmnJZqarKH9iXHn72i/T8oUaImZQhRTT
         twmLn+sbms+pFJVt00l4gsAegZtcZM+Ckf3yqfTXhcb8jeyamaiLAmoT3XRCCDjzdyMv
         p5kVJkj6I89jPAD5MlLLtDoGoZKM7ufdrDX5UMblToCcqziSUeX/MWaGUx7hO1Pt5loa
         +J7w==
X-Forwarded-Encrypted: i=1; AKwUvByuXmQYSiCECzcaWlQXMwbPH7Kn104QmW9Ox/zDFPPbXhcGkCnv5wEjx8Eie174bqq+IB8gou5KjX6r6uc=@vger.kernel.org
X-Gm-Message-State: AFuF++ld4tI6MYJ1mxNH6qaaRgVO69DPqFt3nxpoTTIIuHYQ1N2qSTh5
	PHXMXS3/uAoVbhq7g68XNV2Y8mDsViBcv6MzQgidMTYbZg8ETZUS/jtuNM6VS75gvruzjCkirX0
	0+HZZBjmpdYuEhXRqrrr2q/PVsN2WCGG+DG8k0GyItI/mZvSECuGAKhHNLKqWcLD5NFU=
X-Gm-Gg: AYBFou2a4bvNajSpGll3wCFTcjmxJYFwT/QKIgbksMtuy9BFKeB0k67Cb1Fu2/jUOzw
	hZDwzpy83JSil74hiqUrqbebaaYBsvO5M7SmP5ClYrinEHhsDmwuvilFc04pMGjUzO8MSsBZcDF
	WHcBGpFWz8i0sDnc2+a7aVxR9h3/ExzApMjalekSGfEsWqxWX0DHKMeZIKQfL3e+Ck7mOK2CbCB
	+oFSDhCJ2En7rmla4zUpBthvk/0XUaGheGm5+y+FWlxtB2lSXhqj5CzffDThcGgkSc3hb7ahrqX
	Nhh02+mJJfbwdKSOAMd2C3G5cXB0NFSxmHwvLJV6ccuuJ40kJANozeHeZHra+wOFF1Np6pvUDbp
	bB1ia239IyT5X9Ayg+XDKtTrEfiHGk6HU2Wo=
X-Received: by 2002:a05:6a21:32a2:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3da39d18cd8mr53688417637.1.1788965931392;
        Wed, 09 Sep 2026 07:58:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a2:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3da39d18cd8mr53688366637.1.1788965930967;
        Wed, 09 Sep 2026 07:58:50 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:50 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:17 +0530
Subject: [PATCH v3 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-10-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
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
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965841; l=3265;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=nYlHwC6PKpfUPCQFPEdwMq/Ct3VZxMxSmtdDkckeGT8=;
 b=TJg9jPW+LtEtoQPVLGk7bkpFtL3R6/FJZVqPXa5SHK6hi1G3HPDBiRrVpSEykLC2USjw2SuR0
 7usvYl/9ejuCaFydP4EkjJpaliOsB3TSM0itCPBuuWLWfJEF62LJLBu
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX4V1FkWtsA0Zf
 M4Lu6deas8hbS0YL7WL5ezwR5mJTifo3GbOdLlXsHI0F5n6kFDCcRZ5tqlus5UK5KCxZn42YxRy
 v2IFlUddWNrMKn/L/VRAddsPFsD8Ce4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX8HkG5cGL9pNi
 IZ6iLAEmUcMP/Agqe+nVthqXYPXdAU7VxLvPtvNSPw22BNuUYA+x7QoxuuNgp3lLwRmuBfWCOiD
 Py26Fqt0pXMezaqbAbANdKhzzWazjZ0qCrTd9gkGc0ZIrVYHwbI/O3HnEbb2uHJ/DrrE1FBn5ta
 bosGrrAEvvTySXL8Am05v1IgpQwgr3x22gensf/myBW3XXvHpQcdGq55Gr/v3GiGZMCZpLrEA4S
 WFAOimb9fsNFzEU682zZaSwQtg0WIsg31UDvu0Xh5OqTEbwundzPMoXWIKFo6SqLzMTrcWGQlow
 1fIaStTAPT6IeN9pW7i3KdlhK3zsVbigEDmxEnQH7Kkdt/bfXzkTXizlFJ/7raaUNWMm5DzWyAJ
 l6fCFipuKFFumenihG9F2Ndsvr4jBy2Ng0qNWPvFs4vocjro2UJbum4IooMPDpb/g/Q+qOUyglx
 PVrp7E8kaWM+xpLskYw==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa1742c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=w7pRem5UOBajBC5HA0sA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: pgapXm-WtT4G5odQ7QtnaoRcmGIoO_qJ
X-Proofpoint-GUID: pgapXm-WtT4G5odQ7QtnaoRcmGIoO_qJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

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

Tested-by: Daniel J Blueman <daniel@quora.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256911e656ab1ecdd92aca135d92f39..afed5e43b4fcda8b8400e815d24c5094834677f3 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4962,12 +4962,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

