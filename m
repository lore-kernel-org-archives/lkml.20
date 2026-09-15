Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA8222599
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435237; cv=none; b=D3LRDu6Rra7ZjTWTMg2eA1Oou1irfHETaIhw92Gfp2pz8YFoqjz6iMd0ixvXrbCI+HCaT1H318HU2pX0663ZQCTjFpzdrkILVESbGlef+m3QKsjxVo12o0mKkEZkicXVSJQMsBsPFKN9W1r06kjuITVDH09iI9FnO5eiLwAFveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435237; c=relaxed/simple;
	bh=odgso7si0D+HJtBaRRkr+elkQ6gwGtPGCZeiSn/buw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lAynjqwWDvRzzJNpUD1eqXHu5cbgB2uXkAwLLwQb0Suc6NvDPDRhmqv6MqDt3zcXzVwXFyuHR02zVSQANhQp6cQ7J3kL/15fO5fqEF87uQdY3PnkjdA2PQ6TfkthMOL+en4zBk7jTY0a/lLNOLfmw+9HcYkguuZW06OilqshHw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3JbfoxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wp62EmjA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3JbfoxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wp62EmjA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN022m688780
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70et
	djYEZIzo=; b=E3JbfoxO3Uv8ltyHcugsZQeWqsYtLuR6Sw7/59+b0dC8Qslxkwa
	1UVVhIkp7lL9K74TqBVAUFe2TyJezH9P1wkb8CrWtmvBeW73dTfVHEX3dZDwcwJ3
	eq+13cn6avh0RxUGLoIpIIAF6Ykt4mCBHtrNxXBuIk9847Iv/7i7kG20J927rLdS
	/tgAa/V4oYiiFPMf/vc3PGBfv5C/rH+/VnLp8TdXaA+Xj5CMyyAwtTWW/wz3Woxw
	OHgSNUfG+Qt63vSFQhTgj40SZxRN+npDZCJywq+mxcWzNkYUBtBAc3c9PD5xTekJ
	xNeq3WLMrBsFYnS+HhIgrqggGX4LKwdO55Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergba9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:20:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso428407a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789435235; x=1790040035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70etdjYEZIzo=;
        b=Wp62EmjArbGlgWuw5mNcikkNALRpYyN3Sw5XJRaP59XEAX4GbAopzdrETy5sljsUui
         eYboJxGDNAUcR3qeAhmqsrAWQtdYW9v0I8WxvNRYsmY0q9EKjoCdad+oaET+ZeZwu9og
         yk3tkJkMnNqJ/TBCxLeBHg4zo+dH2YH+B92YQNn0Fv/KC44fSRnOW4VG/Icnq3k+jTSB
         /EqUiuW5h/ZXuoRCCPbZeBTFp9v0unjDWrMI5jUmON/DaFyiAl1pM0do3XojYddRg+yE
         3UuSr3gEYi7rOms2TY3R7kPLlepDZo0+iu1syBUx7Chz2ibicbMgwosiZTAySHlxCSvX
         1VrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435235; x=1790040035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70etdjYEZIzo=;
        b=eJofYS9k/ce+3UWh6M2+6TwiS0/+UUOXtu5sSK2sHzc0RLVltaVQ/SUEvmeB3tA46D
         jdJLnoD8zaC7k5rEvuV5mMOneiEnpXCYrFcwE2pbDEXR6hXQL0v32dBQulQqUpfJ49/t
         iDFdkREEyyBquzdubocC1m4dilMWmBBDw1OnoQEnpzlUyIaqu7mERO2sKDZ7fP7HHVX0
         eszO6GGAHzIsXssLv6AP1HRm3IXzhXNI1o2SQIFdZz2MeEJtG5A760P9mf3cIAVhi6W7
         xiGePCX8CKBtVeUjz8uXBKGtsVp1DRJHPQApTb/JwpaRa90T3cELWZocvhEw/JPd+J4W
         77fA==
X-Forwarded-Encrypted: i=1; AKwUvBxYxt8IyQdHxhuy2tMP/YUBKkkyaAXW0JGY2jXVz5FHximqdMRPAuK+tLM3c6MTaOWkUiVA9Bhn/9axVQU=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ0evLDDbnzf8q/hRg4PZkOIO5pmw6OaVuTuvm/LXwUSGGMtYE
	14bXpyylYRnhupfACEjo5dvUBftsw1znME7QvDihAx24Ngyup4UZs8ZPqFJr9GPZyujfCeN7S7+
	1URmmqKi4+HirZKgznxSVNmUidsW+rPjdJPSdlM1tQNqMzTqbGz/CnIh8D8Q/WlsmAYk=
X-Gm-Gg: AYBFou012KbZufqUg9RB0cm5rEoRZxiZ4l5nQ7b4q7I9KTR6RF4AyXQ0+Sb5Lmr2mpW
	2ZR1rlBzU2/ZFOrjtkpHpEBWKjasKn5rE76OTDBPLkuRJdZu+iJ+wwOIFwWXWvr8LNAObPOjorU
	PDC737YeZqD0FsV6gtFmXfOBImMF6aqpkw1tM4TJLLV6bXXNz+Z/yo742vcLfsQyu+fBrq+gI6U
	KaOi/xwHZ5hf2v6aj1nnQiCQKFUY+cPf4nAW6DnNmeQJPBGpdvprMljZ4mT/TfRnJ5nWN1CfUbD
	qeeqwKCB+eUWkkqxb+/h0NXTVJDPXRK7YMk0cFhoNNITE04M+9J4A1gMRzsewwwYFjLHAGx7Q+O
	Hx9DEBVue2GOwVppuQIpybsSheJ2osMk1Kic=
X-Received: by 2002:a17:90b:4a92:b0:398:9beb:a2b9 with SMTP id 98e67ed59e1d1-39dfe1ca2dbmr2501320a91.27.1789435234663;
        Mon, 14 Sep 2026 18:20:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4a92:b0:398:9beb:a2b9 with SMTP id 98e67ed59e1d1-39dfe1ca2dbmr2501272a91.27.1789435234220;
        Mon, 14 Sep 2026 18:20:34 -0700 (PDT)
Received: from hu-hongchen-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm29216573eec.7.2026.09.14.18.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:20:33 -0700 (PDT)
From: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: hongcheng.zhang@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add PCIe wake GPIO
Date: Tue, 15 Sep 2026 06:50:20 +0530
Message-Id: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa89d63 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6FOz5cXy--B9gFNoW_kA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bn45L7jZfdBKlUikCqjTHwi_2T1ieyga
X-Proofpoint-ORIG-GUID: bn45L7jZfdBKlUikCqjTHwi_2T1ieyga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxNiBTYWx0ZWRfX/Qiom9Axro0o
 JNBuwJcicFgtcfZ7EzW41OzVsgEKBU+Pb0j1EyI6ytnWc4KJgfBsctE3joZIcWPaBQNtAh2QTS4
 3FCQy7tImXvYt4zBV4foPRmdx/RyKiNPWsejFJ62D7HxIqtzL7DEpcOdSuTfbqj9XMCIqSt77Wo
 ZsDp/mwAXmk2bOLByOGSfYDrgpbIBW5PuJ/xst1GkRj4KqDXp7lbTCDnWrb7bImZ3+kMzOSPg7C
 Lk5vefBxCBJuLFYt9iKqf9HZ8Nie5yBN6IkN1OclMBKGhpboKQq85LURrvv0Jn6U8e5YLtipUqN
 YrkLprh85Z2FJGCGHfvm5fXNDsMsK6t+iWWTfj05UAriOsKKzjr5w1n87gkuPAujO5S2uzJoKii
 JjXs9x28w1/nADxldawCLG5+RpeqiiZm7/ru80xUMEUJZzFJuEJFa9OPxH8xSsbSandneN4WAMk
 gL22zp9bXpB/XFLPnGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxNiBTYWx0ZWRfX6qBXhBKb0r+q
 57jXlz+UMW8/NRoihXKAigTtNVIiwNHGwkrIVnKw58zWzdnra56UzSttjUNVm9HzfkqNA0bhoxi
 2yLO8CFuOxjlspvs2S4Vn7+lTSzPbAU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150016

The QCS6490-based RB3 Gen 2 Industrial Kit cannot wake from suspend via
PCIe Wake-on-WLAN.

Add the wake-gpios property to the PCIe port so the WLAN wake signal is
propagated as a system wakeup source.

Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4..b2bd60dad1cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -78,6 +78,8 @@ &pcie0_port {
 	#address-cells = <3>;
 	#size-cells = <2>;
 
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

base-commit: ac38b483e5aacffecdf0c91f7d767ce6284cf57d
prerequisite-patch-id: afb3d6a9952fa85d5ea4e9a6e19fdb54b03bb9fa
-- 
2.34.1

