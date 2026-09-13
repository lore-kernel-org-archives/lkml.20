Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5463F7AB4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325468; cv=none; b=EKMTE51T3O889Tb3pT5tYGcl3H5DO+54hyqGecFKXx+uzjvBzdbobIiCqVeDs4ZTxdYV4qDR87NJSAJ01b5uZTEO4VI4GNVPIIPW5OyoWBWEfAMVPNRhMHQpnJ5uj1pJT73FOl/pwraUCkmX334U5SvynMI+urBlFhuAvcss47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325468; c=relaxed/simple;
	bh=hSjOhcc48OJghLc+5hynLFQU9EGrwxyIHApwVUWJDT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eprci1v20HmEJtuDEg8hgIzzVEvnbD+wPoF9Od6MWgo/u3DNV95MIjvYSfwU0ndYPmoul/DnTllf588rmIE+Lo0Zn8P0XVL9qU+WdVMdxpawNXOCKiTQMBzfB41SCxtHUZuhEg4Ih2myjcH9FJFmucbC1Grm3zLSPLkUih3BaEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6wEii+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbdB/srX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6wEii+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbdB/srX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2bh82450902
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=; b=a6wEii+AcrYF/jNb
	fTL5eJGPrtG/DS06S8C9poMnseBMYrKS9DeKEvlJlGnPfayvDTZd5CqrIn7UXxqj
	96/JEs57jDJifjTh3Rf9mcs2c3AjbOksWMb+dUm0DOJCGe+YrDONdJHd5mGdfkGu
	mh14gfgHe4ZvLobuQE6r4Sg5JqesUqPji3epcdehdjsiwd6mVa70X2CW3KjYuTvr
	W9VRyizxRLBJLJBfMFM870UHvePPIVKetafsj9YNjdd+3R4SmVBc13vGtyPFAnI4
	HI2jzh6T0G0MYf7mWaGPT8x8Q0WuZnTm11T7celbJ9uTdGKGcPoOFFyfwvwBvxby
	U4DDgQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d3wkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc2229450b4so2180500a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325465; x=1789930265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=;
        b=ZbdB/srX3GiEq0eud0PxZm3hXiMcrxAejJlXW7UNT+ZKGpImUlkNuVJex5RLtTmokC
         ML2Bbvyw2gQIFN9rU0AgkzACO33MdQMLacRnKcv1gERhoF3bkGnPvsNSGcceCgXyG1zV
         pHytur9/h/VXWV7fpPyugdm2MJOj45TWqNwFa6g4HTpLDsRQNvQ5JIbQFXuHqtXX78+5
         rCve8zLKkHp57+U+pdkIKFUt14LEUweE+X8KEMzzqk787FdpAM89EaonYAnC6LdESvAD
         lvsidrYq2Sp+fI463A8e+Z11ReyuMC+P3P4R7dBJn9euAp4VDEbWx9stxxPiIR+ImM/d
         l97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325465; x=1789930265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=;
        b=BDYZKiWyIaIs25GG/U6xPkZaDtnwc3aN3n12T4HH4cf7wUwHypDl8LAdrCs2n/9bzW
         a5u11WsncCfyID2OC63eLf0QHOZp5CCFfXBayMr0cT3MagjKe+JEvOMRSC9khmom7vK7
         OIMmXoENwK6IA0d/xeuejFZkp0SjvQE578mEeD4uetvbZPqFp5UkaknNDXfd5yPXSyXb
         /FpAsuvRF12/DRtj0KNhVSeveGoEReG7ehWH9O0HuXTSYQZKXJy8BZ1fzePNOuHvQtNu
         mMpQJy6hwA/jnyrbCF4ckrKPucxzwlCHw4ZPhzJeYzKZS/osVrNEFj/hWVqGHSZWn6d7
         sa2g==
X-Forwarded-Encrypted: i=1; AKwUvBxIh++SDIuOYEDViTNbSyGRL0P/kBKJYctuOonzZIrnLNv6jmLQUhhi6SjJfSQmgXq1GX18XL4Y4m2ruCo=@vger.kernel.org
X-Gm-Message-State: AFuF++ksMZlzXaCAsRMtl4kOwAnW0IYzFc2WIOSzt1wwb3Bz3SXabEQk
	9A3BU01UgctueX3lZlEhGDhSH1ACImOzgqmL/khXZ/l+J21eK9FLCWcnQesvLvwN5WQRcPfJYCn
	dKliZ8ZCA8xjZrFMhcZXDAABqm6M5b92v86us3VPreQmOgk7bnPJ7lozSglAZR2nEAV0=
X-Gm-Gg: AYBFou3kgMNt07y/h4xt6a3n6kIpVKUUZkvSejckNHcFbulEB1lP1H6IG2UTL0xrcOO
	1TR16xsb1iQJbT7kONjfRZtrWI4lXdR25WWuaTfGzKU59+7zhFujcFPfwPwQpVX771/9srMWlcO
	sAb6PRqKIkd3FtWJz63dlcWPaJhGEa4KKhBzwcQDIDdvnB1TFcouRF9BgnjAFABmJ1isCpaNCkR
	9yHr3XgOHMgayis2/JYE1NBlR4vyOQqvZf6zwl4O1sy0BaeTZNdVzkTaFDB2IdSgH32mUO7aMHf
	0IDxL5320IEcxQSSls1/oJod/MQbO+D4LAmoz6ARdmNWl8oY+1fuubLMzOy8ThLld7cg8L7ycOF
	fXUtNO/fBMtNqD9moC/sI6t6G02kriS/Sx3Q=
X-Received: by 2002:a05:6a20:3c8d:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3daed15360bmr29215140637.1.1789325465275;
        Sun, 13 Sep 2026 11:51:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c8d:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3daed15360bmr29215086637.1.1789325464863;
        Sun, 13 Sep 2026 11:51:04 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:51:04 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:27 +0530
Subject: [PATCH v4 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-10-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3217;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=hSjOhcc48OJghLc+5hynLFQU9EGrwxyIHApwVUWJDT4=;
 b=rNRYR2UL+6T+Y/48EKnbZEZhgN2E1kCdWuexvsvexUC1FXasDOTGl0dVgyL7S6L7yqUiwHPkQ
 AeWD3PV3JnSA9ir0zeujjgzPioZI1LuG1StoJZP0bpFuv0+1J5quea1
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX6JKMK2v51gtv
 0d9zUCrOcKS1VLIuj81pKJMxn1CoGn8sU52xGeVbH/whnMi8eq6xTaqnTXHzSLLL6U4MgclGKix
 /S+Prvua2eOQJZQqU/f9f1agGMUTv5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX4CM4orjD6rES
 cA3VIXCq2b3eFUDoJc8jL+NFa/AvGpZw713HYcwcuK8pOMJMK6SdoIyI9WqF5Pa03iiTFFdTBBG
 FPihXvnSZSAqmNIwv0u318SnP7z/hYbolXswYz3UiaNxNo1G0LDUSBhAdzT0aEc3EcRDttM4BLF
 26G1ibKtPok3p1JeJgLDw3ft4SOt82gKmmo6g+9+N+8ryr4zuqbSoIL7leLBaDuNEB+d1ZQT58y
 coIsuRrIgoDPDkfrwiPUofOMrt+YsvEvnSQIIn8FtjnXvivLh+QhbHi3rzMGe6xG4ZuSnL7rK+c
 txC06Z3cFOWyJwbUIK/tt6In3EoUGv+vUEf3jtqF75jWn0dJ9ZLVU7JPF0nA3MEgWzpKnJYAsb4
 HWBHgp9blpjHHn2B6L2ANARGHn9I60V6NSTD8Pxi7ei+DzNIj8e5aBxqJKofUsIbXxTmVhjBDXq
 lBOcEm4oGkPfy4uzdbw==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa6f09a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: UBMnSrnNxBvOkWHyYztUS1N5bdouzQoB
X-Proofpoint-GUID: UBMnSrnNxBvOkWHyYztUS1N5bdouzQoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130267

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

