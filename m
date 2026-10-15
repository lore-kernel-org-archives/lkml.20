Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55C117B50A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071357; cv=none; b=AZfMmSze8Gde4IFlWfyCUDHMkkP5ipCRwSKzEOLXzoOntKUAXV6PSjbGjRw4k4DSteU2sDfzo92BcpGF1UDX2UhaAkTX0fnweHSW+eXl6g3CamVQEiFUPx3xenKQPI0lEkOKhVxN7YVnOaaMTDM9gZ9gQwDzQCmzvYccL29/JB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071357; c=relaxed/simple;
	bh=+PSGHcYhlKBGUAOZOmZLd2LslZtgKoxn3b+rUp13o9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBEnh97s+SeA3gB3LTGDb8jzyUxILE21g+qk4N8Pqs+Idllu8oio8hMM61qkn8MHglKA81qqV+BkqFBTNpRYzDyQ3e9ORbpgRpD6aTDYP8cKBte4aW7dkaddhXGBorEn3btuJ9BIoOBMh2s1JqZ6eu+ZGdyXf9aWgeNnNDCMhfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPlLOmSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6tuGt4r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPlLOmSF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6tuGt4r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jGvm4077444
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si/Ff0+6PYM+xJYLGWHK2Xz4OkYG/9a6KfcxGBIOM8M=; b=GPlLOmSF1Lm7pu5P
	gXV5tInEi0F71FyHXVoWuKKvWZ0arQju0g+p7t8sE2CxyZiTCqfe7YBS7+WLhTNk
	LmYbPwTIXC/s05nK0YYsh+yok8G1HUEmFn/FpIgvzVO0EuugBM/+VsPeppBN4OLs
	PTw05TZ7u6wJljpwMOwmvt2bSqWTQDIAk89Jm9ZDC6KDknqQAogWH0IUOKka6FqZ
	ExLBbd4C6kE9lvCrxIKRrRVDGf95CiVQcGwVFuYmguvfufjxNlsM3kRDPVKBDHhW
	W1NleltdcDoCjmnr/hTbRrW/2SOlvR1hz0LxG+TVYkpARS+DnW0G8owhTTT2UTAQ
	8d00yQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0y09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3145390a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071355; x=1792676155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=si/Ff0+6PYM+xJYLGWHK2Xz4OkYG/9a6KfcxGBIOM8M=;
        b=j6tuGt4rc39/iT8YlhFfjWIleYvJkmmvtm/0Xv4e21hte3X5VzSiR23xW3OB1+jetJ
         QAAZGcytKn6v+y9gWGxcLwqma/+ZIEdgL3YxY4r584k8E3i2kGz6AvkHGMS+s6bsl2tl
         mfmfQCKTlz/j6Krb2lG8M5LYy0B7kNjMwQkBmiiD14YSHHukBmFLyXD5cBSCa+ay+7M6
         am6Xuehw/aUf81cqVHPglFe+WtBbwkDmfMRYgCvLWgcXXtb9G7PcTFlifFwJKFkgxfVE
         V4UsouZueORPmTCSy6f2CzCFlXfaY99uhInFs2yRMHwhtShK1ZHo8WLu34VdjLNbwgAv
         ADCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071355; x=1792676155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=si/Ff0+6PYM+xJYLGWHK2Xz4OkYG/9a6KfcxGBIOM8M=;
        b=lsoCsL2CCs7LEogDuX85XukDFcNUnNVFflSxQPbA7CdWsL/q/5Cd1womS/4QnZRuXa
         MoVEMXKtEoub7K5emdbihvefbn31HLWt6M+MpeQlL5fWyzSMUdHPQDdbRSPFwgCpsfJo
         0/4+hU0q3CyFGI/t3JfTrvrDiGbvgEVWoB4fWTllDNAhziB7EKhr/dMEEIai07gpO7J7
         9PkCVL77rPyzYI7Wy1m/UHMpvdWIZh6ZbNGhDHHZoyg53+yMCLjkA6IEtZFdY3/3Y539
         VbY1c6h02N9+QLmSTP8HydxKZ78/3wFLARYhG5HYyhnyI1AX2OG5gM9oklcbzfmwE79g
         oq0w==
X-Forwarded-Encrypted: i=1; AKwUvBwte9cjqVllajoa3vrk6lFAUtqN2Z/dROCqdQ6zZYipULGBPbZYWxAoWy9SVUrmeZ11LfuZ4cr9IO1QG3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYzpQNX+mLCX0ZYNBe6WdTijUPNNVLsrpLJia0bpyqcWF7Zb7J
	nOuO4aeFCJwGgaxUfJ8B6aESgoGZto52fOxWkHNw3OUW7sWAbFzOWBUGS+9watquhe0vy9Q6Hu3
	9fEk23c1ScozCpeo6RSvtsDIl04WVWiQR3D+8by7InM/Pxk61ogd6C7LBl3hwISnk284=
X-Gm-Gg: AYBFou0xXjb6TBxGkNwVVruzY0rVSV4A8QKHBZTKcPJoAm1vLClFIm96tdp/NZ3QWdH
	ITO3cNOt5/KRA2LGHb7b8DiL/C6k6uQG2l8OO/KXOPkPTm0s8sQjumPsjnA1SnUeBbq0aX++E7V
	631KjwkPg05bXrw67tSsMWKHPEcojqLFKMts7nTOF8qsYjZpFyCr4myvJD1lDx+TjTQnvRX3R+t
	KhMeZw238J/nm4eIZUJX5xUePp+8BOHUUR7VkYACCDZoImmxVXQJDHTEinwgktOGVv6PxY0rcp7
	WD6Yce7BN1AJbTdQS8F+PIdLl9457iFuuLd3pV1dKW7MCd8V8y805kYL9obxmkWTow21NQs4lbX
	aOX7lWF10qdE0B2huhTkzRvNK0pI28g==
X-Received: by 2002:a05:6a20:258a:b0:3e0:b778:d988 with SMTP id adf61e73a8af0-3e16bf5d189mr17201059637.83.1792071355249;
        Thu, 15 Oct 2026 06:35:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3e0:b778:d988 with SMTP id adf61e73a8af0-3e16bf5d189mr17201036637.83.1792071354770;
        Thu, 15 Oct 2026 06:35:54 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:54 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:05:04 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0d6bb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2qHST6af7bV6ZHC55aQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX+1RThlTq0AF4
 89mACZP25oSD5MO5k92qjVTS5SV/IgJk0HYmkaA/kCCsWKhpDiy5nlj4Nr+ajNcr5a49oGf7pcj
 6p44mstNaqkbexSu/6o0/Dy6+Fxhmyo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX/RWw68wXzQ1p
 5nb5IXNr0XDxvZrge2MOkUjDhGLvLUJnuHNNkqeWyLFJpV/j2HZp4OhuKCOX2StP2a2kYSO0yi0
 Rvwb2n7xDeP4GxMKwy7QLchckuasAUAJBGzVlXCePigkx+EtzwpcIWg8AaXP+SoPYpRnTKhuJ6r
 sDLq7AzrevQZqONHsk7XZkp3osgjC+DJM63gTCy5aolOdal8b+bwcQDVFYuR/RQDrAyW1dlfR1G
 cIEJ9EZ0RsRyy3GESDkobm3hmfouDlJUxjzGouDG+xwrH4xIAP6cilP+CjDXUubrkv8LJrkZfPX
 crff3NFWsTWZt+qwE5PrHTXWBR9aIl57oZyEFkhJ47bMoAMjrcHKHNHCunVcBynkmCNJ4lqS8IE
 Dvh+Rg3jNCra3YDw8BPYeYvLnx2GGqjVxkhcw3m3zHnoOVt2mxF4WR4COCRHRC0oMOpgG8lumed
 CQ15/UFsp6kHubKZfMg==
X-Proofpoint-ORIG-GUID: chkQoEGkXnPuJ8oQnUGUAh5KDRcThoaz
X-Proofpoint-GUID: chkQoEGkXnPuJ8oQnUGUAh5KDRcThoaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150054

Add support for AV1 encoder clock controller (AV1ECC) node on
Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a99208584797eaca8196348c617619af..da7548e6f1c555a01513c964dd974d45f07f7266 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8146,6 +8146,22 @@ apps_smmu: iommu@15000000 {
 			dma-coherent;
 		};
 
+		av1ecc: clock-controller@15220000 {
+			compatible = "qcom,glymur-av1ecc";
+			reg = <0x0 0x15220000 0x0 0x14000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_AV1E_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pcie_smmu: iommu@15480000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x0 0x15480000 0x0 0x20000>;

-- 
2.34.1

