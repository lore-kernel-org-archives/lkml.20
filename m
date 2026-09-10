Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22687493631
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047024; cv=none; b=LUpC0SC1V/nC3wQEd8/kS6N/90XkvMLGD8hWTILMvJv/2D8nehqJwN/M09Kjl78dxbh8gFq/3eRi+52EOWg/mMESEnsdhDysN2pBcQJ+2hfJiZBkyVEjXxnYgR3vhO54J7UVSo8SVbeDlmp9ogvvFviz7LGFnXtXKYlI6Y9X0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047024; c=relaxed/simple;
	bh=HDGnFTmPUEdQbKcRCT9nv9sl3yEGqgeQBSkueOd7QDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8DMsxpeRoPFVlcKrIyOOo+/Q/c0JUITX74/SlRR0ZXBRK3+AqOq2c5IpW7yLLJ3LCMn4pEZ0CwygZES0xIlKC+jjm5ZwOJ/Q2J2Gydka1lo4BHK8Q2NwtkkU4bSWg4zW57feOA3p8G9B/ZNltKfaIFVWqLrLTWFEdbVLzLsIvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQJxHuhB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNFt2f3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQJxHuhB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNFt2f3V"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7pIP383943
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=; b=JQJxHuhBcVlJsCgh
	lajkaQpPtzEmWiUnstavxLhu1Zpuop4oxgqnhDE7ErrJHoeMqA/78oIAm2A61eGR
	4opCnNfFxTGA2sjRzRmnKYAC7jU6PzfvicZOr8VUVB4AfxzsAAvwvWlh8q3X+Pai
	O20vGg36F1EFYB6H+3fok3DMUetOuRXYrx5zXZ6YPNadlBMcbUbdgc1GiriN02NO
	kjAhx7z3+n7LUETVF86CiQ84a/BZP1LiVsXxSRAtItuuJjNlGUUdwEaaXhxDL1Zk
	YbKEPUPdsYjruqtr3qOibn4zxZmyFPfUx4a91GXPVdSxCLp+5L6zFcdhGNmPbKS9
	cS+ZsQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydv04y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so8781795a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047022; x=1789651822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=;
        b=iNFt2f3VFM1zuKXc0+cOZe+4xDNymnlycy4el1iKNbnspPe48zENM2KVH61K9scYRr
         iWH+cQmd1w6hK2hkhza5Mjss3Ppa56MIhVI54Wih1O6uIIiCgeSEv6hNPM1wycF1hSsN
         BW56A9pHSlOm7QgIL9A81Y4DcVfEEZ20MT24rC4+oAIgumW6GrFG1aEboYKdt8bLJmIV
         Ng99YrHUbF0RaMJlJ+LbTKF9guAQ/epaxinJhq3LJsXX2dOcMfqCT9sYZaMzCrBSUnij
         osGLwiqi+j66cbzbIKONY6yvZ+y1Y1sEYBbWLwU68grOVwUvmdpu1uB3h7skw/cCT38u
         vZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047022; x=1789651822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZVmtVG1KkUm/sTiH6Ufv2KhllpI3N/zRgjDHCnimoA=;
        b=tRJLuGWAqghNoh+XBrZ0BjmmZeVrTtVZ/m/M0Ry2cp7usLI81OHI1oDgKuEPwM+XOh
         g7e3nLGz5iFTHkB3P/AyY48RiYUUaU89qskUDB275eEBcUgjwjaA/tqx3nY8sM0LPwV5
         iCmaVUpIUGLGMgMjSlT2swDOpQCO5sfATmXjOEbiJhuzoZTuID6Tj9HSpLKG0zOvu1GD
         JXrUMlb5FjJMnCtEPx7+Xc7h9OeM67eS7OftV+PKEN8Mz+IYJEInudBWrq0E3c7K8ZXJ
         CRR0PA+kl9/KZUplA+DTKpWVaWh5nlU417bmBprPUcv6iEOmWQBOF7iU4UKlyOvPLyqA
         uiBg==
X-Forwarded-Encrypted: i=1; AKwUvBxBkLgNlur9co8Y+WXaGZ/7P5ShLZ1h7BZ29uDbwBlLw5xzWbUZFf6abkfjg0UTQGazwVkbwEn9WPWEeeU=@vger.kernel.org
X-Gm-Message-State: AFuF++nYDtBHasM7BIsYmN1sTH8eEJ6vrmzHXZJYz0Hmq2t2dRtm1KSG
	epS/GBlVsx5NNqB+5Kt1LRwgrm/+G6vrzwBM67X8cGTCR7XmydnnCkPqHDDZTcaChWfRY40ELTe
	M4TQwqEvb0k1YkUjbYYdUeIOasU1fXcxW42/aEbmb/maa2LTc773AIX1bc5DohBOvA7M=
X-Gm-Gg: AYBFou3F9R8ieUOR1j+fGX/V2gZ+VGAHACyjm8417UMVhBDlJojF/LnYOeBP4jr0Hjb
	mW5mb84ttmu13jaldBleMIkWpSYVQd5QpirfJrnKWfnfLChbhGNWOkmNbsLazKsZCDVSy0m6lJY
	1VCZ5W/ghLageIoiWaTKNIY0zg1GPWknV4T5bXv+ONuRjls6bCi0yl3ttzjzi+O/ZI6/rlDo7G1
	QFVdBG7rri4TS4pDku3OTMP3jWgeLSMhsMS++Qo7LIMZ9+LlgvJAzehbDztg9BJVvGCgaPvXnz/
	PQ3kneB0ZgUvcYa12BrDHw2nB4N9N90DwW34ECD7gfeaJOe/aOkeeKxogJZDhFqWcEqEXKWxs6x
	5R1dYTodkUminuCrEezbddvx+A4BoEhTCyIA=
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr64030128a91.17.1789047021786;
        Thu, 10 Sep 2026 06:30:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr64029997a91.17.1789047021098;
        Thu, 10 Sep 2026 06:30:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:06 +0530
Subject: [PATCH 17/34] arm64: dts: qcom: talos: Fix PCIe wake GPIO polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-17-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1536;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=HDGnFTmPUEdQbKcRCT9nv9sl3yEGqgeQBSkueOd7QDw=;
 b=NW+jqUahwmrBL226gTHopBfuXm03QjAeZdyvFynUT+D32H7LvvoXye01UkSnso7+Ncnr+Zw6l
 lpmzBW/jO+WCSksOxzdqsr3A31ac21BkwVLKGGlyDUFNCuw7dlUbRz8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa2b0ee cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wGReLxZ69uIU5hf-D58c2xUhcr9_0khE
X-Proofpoint-ORIG-GUID: wGReLxZ69uIU5hf-D58c2xUhcr9_0khE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX+c/R3Pfbi4Ae
 KQQWrLpbrGf/d/jWAJoCtWt4KHOrqUTyA1kNYXP2TMmsIKvP3WT0d+csLSGXbla+/h+f+y/w2yC
 imqD52t4WOMyUVYTHULJoJw8zuhaeHs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX6xEzV8p+oZz4
 UPiTHKajRnwIdfjrAOSnMEspyEpACEIuq2T7Lax4sAQ4g0oLbdKkVQNHdf+ZKlRi3QmdTDnZmA6
 3Df8itkIxQSBDHRbyLRZC8cupUtC+5XOEhtPzQg8EE0dvYVdZEfl219x+T1lWzbq2UXnxlkuEtk
 5lus7NxGaI6S67QJJDlTGP3Fbtj0iBwGFtrx5cQn0Fsa+aQXfCDCF3+u2hWyt5oVbGzo3W9/Rb5
 rs65Mf+lypYaYp35t3BI/35BHJPSIPI0Z+ZD8vBipUZd0er5FmxkfktX0cm0Dfxy9L3LT6O6E5Z
 0l2xkg+nu5Tar+9dqBVU8CBpgoU+zwK+lw1lXSD5KxsMmADlS0PtFE9EBgdSglaUaXjfUslWhM3
 khSnHzhdrIUsR1CJfZdh7qjwf880m+5H25Q9ELVCuBzXeJ7MkBKn9ouvSnCjIesH6eZrel4IR7Q
 m9lx3EpvVxY8js0F/Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 047b4efb04b9..43f110ba3a7c 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -445,7 +445,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index a31bed7fad07..198f656bddf1 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -367,7 +367,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

