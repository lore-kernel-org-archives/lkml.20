Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720552;
	b=xN0LK5vEQZgcfdy7kl0eKIRu7DvJvvRwlba4n8JAb4Opi/89ZtaZDlEuVZcSTHsbdk3J
	 Zc9VxbDEPAVBza92Uy7z5cAyH8uK95a4c8rYFhBX2StIuj8HOfffxWncHet8GeAlA+7nl
	 oT0eB/r9VG3gRv1OaYtiu2zAb24SkBxNwmH96M5fqo1+zNXJXPVmZEhjWkr543oZh5yGA
	 dMSiXzGORPq1QlGyDrcpmPRvF/P1cpK7ZRBY7ZBxCCCYA2GYVPiENrQCIaS0zC5fBlLsb
	 KDUx7Fxwy/mef2Zzl4MmFsAoNzngtvNu16R6ZCHLHsJf/DBLE/uhQnvTV6MaUOW4+RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hNF+NYo3btETTDZhRV9r+Pvce3DmnFyIiY29Le1wbCs=;
	b=HDwFRxtYm9Rx51yJuSHK58QJ/QC1d//WdI4fwKHRZXf6KhBFJwPeS0GddS9vR6lm3MPc
	 IdlWzV/22czPDuUS5zXc3Pu2X1FduIqzzao0AxtAv/I7ck7U7UQiEJqa7wAT8HTlkTH9f
	 oXRPQZYyj+F0+SDCwTLRgLooR38TY2nrFKLZtOUov6l6hAcaXwolYOOwmQn8IqLPzGCwc
	 9n8Ep0jfdgBppNBrqfYxch2ZBGoDbYJArbFLNBdXkJqbLrC1YLfH7pGNv7NexplQ6Fo8c
	 NFHCRitUugI0+71Nh0okXOXoKjVBg2RIvyNbD/fyiv0T6vObaX4ss/RIqfaCdzI1sPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cka8xxvF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RJ/ByBV/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583460A2601
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B583460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cka8xxvF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJ/ByBV/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Ffi2N2202983
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNF+NYo3btETTDZhRV9r+Pvce3DmnFyIiY29Le1wbCs=; b=Cka8xxvF08/6NNsC
	x9HEHYsja4D40yWU2e2gDpmSYEJeZofSr/Y++jr6HLOb+mAwYxduPNx8zqmm74Eb
	fJHAmZHRG/UJ/cwYhsNaxylivAcY1PWqFyst/RQpZbwDTiFA6tnz5+uADe5uUw0+
	JI203RoAFmlt6Mr3c4gdESnTunHO8AL0guiw3IrW7WFlwDs0HTEhgjqv79ZMYwxg
	mbPzSuKwHxh5hqVKY7fkGxeLmhrD4l2dzTRlwEZs819N7d+M7F8aYOWWpbHdilKn
	hzEVdkin04B/REsAIDk1k5gEhLi081VVwPNFJdPBnTy37fOj66kumNKqCsdCkY/H
	IYjlUA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5jhk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:42:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so9372000eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720550; x=1794325350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNF+NYo3btETTDZhRV9r+Pvce3DmnFyIiY29Le1wbCs=;
        b=RJ/ByBV/GDXl8Mf1pXX/IokbROk9B0w8+jILKKb1cA21GP/UDr+3MZQP76uRPS/jd6
         9QzELRngWVGuAjK0WzTZUJNeuFpPvbVGHiRctEn8qScQy96BHZcwj461qcnik+v7iulP
         yGB9FcPCYsEzlBGBAThojyTRVTM7UrlG9i3LYJdLMsBDzkFdfMC9X3Y9uF+YK7MRlRXJ
         XpNqXlh/dWTGpPK8IpoHkQJDIWGIHQ376y3BHr3wdon8c/38NrZXMhY5sTROKKX8FLIi
         pej1Z5BrWIjb3PcXVMmPVhxG215qZvvWwMITS0s+e4lKN5EuYckaJuyh/oazfvzq7Fcy
         mEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720550; x=1794325350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNF+NYo3btETTDZhRV9r+Pvce3DmnFyIiY29Le1wbCs=;
        b=F5s+lhvzU96j2sIh3ouEoK4/ReJayjHzfb9Tj3VISxqr5EpZK5I5YFL9MlnkYyxEQp
         6rhz2QEtgWqCY5WzINB4VmLo8bCLmkXZMievMixXxqsO53zlzQVBOT0vAIjzmra7NRc4
         eiO+91jAB0xVt6VyetO0oR38d0t+SKjwd/P1COA0ct0bk2S3MCl94lrjap2kwjjgTdLI
         /tvjSEx3T0mYrIPgAXXSjYN1wszXQC3TvOu7kcbUDSN9sNIGYq9nF2ObfyfbdXjy8MV7
         jDd+IcuhQAMM31DzSQ+HTjRR/arE/4rwggMeUaNIn/ktStpME+T8zE3iOZlonBVQ7FEm
         vnbA==
X-Forwarded-Encrypted: i=1; AKwUvBxVU4UeeeWDdd6Lw+rMBOXRsmlUeQH9nrlQbEcuNTsgmFqi3jl/MvANfrpEUr3rdiA5PuylsfpbUYThnT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Gh7pUP8ceoOXIICGcDL5dclWNKHKFUfBi7Lqmowms0Y2SUW7
	oY/goY9SQQtA25r2BFYQnGei5vln23l154D68dEirHS1XAP+z46O1ijuPNIK38OctuWY8gOL6Kh
	+tD3ekTOjrWwAnyU0eZLaadwI6HOBqYXaaV0uGavakDnc10r7tBrLs9SifeQxHv/Bdu7o27SgKy
	w=
X-Gm-Gg: AYBFou0YBC2KN7OsYTYPvLPE58+4RRzkAXmCh9SyKFgr+CDGlUBCDstXTGl5TS4Yec1
	3vkqELHyKjEXCOcLEmWLygE5+el/W5a/JjGAkJEMgQOPGekUJGyzFgpew1TgYhxK/8zn3TxKW9s
	Ymplp3PE/UfMxu0YslLrMBealifZPAsffC3Dk6o6hwsXbPmzCVI5X9fJnDkMWbeCHwUYhQRO4UO
	j5z+Xnwz/6665H5fb0OBp4Slp27i3WQUGScNAIfPNxqLLZNi6flOHJZAfyHtMgAtseUlREP2V1O
	OA/PSgzKmjgB6ZK2OoKYhpxNa6MDlDorEhul0BthHUbE+p9ELTeiv8Tbuwn6m9O1EcnB8sBGfaP
	A1CBrtaMm7Hb01Sv+8maKguAY3VoXUltgotJeXsIAppyxMnvEY5fdZBYqO3HbY5tDNLacfxbrK1
	yARCKXKKl5
X-Received: by 2002:a05:7022:68f:b0:169:3706:d61b with SMTP id a92af1059eb24-1ac5bbba040mr26528078c88.16.1793720549636;
        Tue, 03 Nov 2026 07:42:29 -0800 (PST)
X-Received: by 2002:a05:7022:68f:b0:169:3706:d61b with SMTP id a92af1059eb24-1ac5bbba040mr26528018c88.16.1793720549022;
        Tue, 03 Nov 2026 07:42:29 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:28 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:43 +0530
Subject: [PATCH v6 12/12] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-12-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720463; l=3734;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=wnCJMe/SJnRQHRE44liPYjnsfn9lqvCycBqxBWVztmo=;
 b=43gyIhmQX8To93opd/zTCL1i0gOvYIugyJG5p9wwvRxhrBlzLKi9sFKlfIBjZjNoSrNVwe0yd
 YmMzuVs9jxKBH/L43D3IVDB5D1/w2MKDiup8uECxylJ5jWEw3frqS4n
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: TYsYoY_jd63kr7g5y9gmhCAlkYj-g8Bi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX7ugwLZJzoCkj
 Xd0cW5s2EJbgLLJRuEiAQwykidy+EqLpYWePDkHHKBtmyInCGJMST7S59Aq4UEdLA2fnqG/sFtZ
 u8bzXLXg5ny8E3y0PkjeCuasa8NRfoI=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6aea00e6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: TYsYoY_jd63kr7g5y9gmhCAlkYj-g8Bi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXxqltlm0Ebu/A
 CVk24BRI2N19vPBZOwidJMA7OSJ7smSjzP3E5A8hNmCwbhgu323EaBYNrZ/d0rQ0TLa53Ec1bU9
 NcP/HPjUuUf2LKtpMtZn6fUAfcnDwziRLWwXb0ohU8NRUrB6dxn0vQkJqYE+UmPLWfSIebRZSWi
 7XVEzCckJ3YuJq5bylOhEYuUx+KBYCg/xS+2vBLrHkoXBym5lSAcsbgvF6HAy1FEdSXJ3ilBH/y
 ofQDz5Y0tAgyZ/kT3TB2skuAs23UdfGABcQ+BGDaB3oUYurAlnDjeJHeFvVIZsI2cUDB2KGk+3D
 dnA2xn44qlHxdSeJzWpGK3556jIfDBN8asM55LlJybZMoL5FvLVypARAVpO3z5W4/gsHUoZp+m8
 W69x0C5+Mh5r2IlJ1BZRpfCtJVWRc33jyqti3MEavsCKfO53lN+jC7jlAF4sib5UDByy2frIHkD
 lYjL7cOYxhmeUcqEV6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc57602aed5af9f8b014aff48deec4f908..eca9944ff22282b979ad780bacc1dded21259490 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3246,8 +3246,6 @@ iris: video-codec@aa00000 {
 				      "vcodec0_core_freerun";
 
 			dma-coherent;
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -3280,6 +3278,10 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "core",
 				      "vcodec0_core";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable in boards where the proper signed firmware
@@ -3287,6 +3289,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

