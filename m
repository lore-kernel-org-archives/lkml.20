Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDF13CB91C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437425; cv=none; b=MFGkfuHs4Tda3hB+dqrGquSUrAbTY65CKs/RvpToa8KFwqXCnpfjEu0B+tLi6ntji/J94BTedkRBaALkkUdKfMIf+DoK/GFupdmfkMqD63AvJTOulkaTatlRRxkZ6ovfBIFqGrBPZ/AwKvTpGrHvJr72Gx2UVw5+iqsRRtMwoYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437425; c=relaxed/simple;
	bh=EBXnokNYAwuZSJHYusOo2/w/M/vgOB+WF5f424LJH/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbjSLoqw5SZBgNtloeJzr7DC5p9u78gE/yIAas2HcbUOgccdODo4Xjul8GGR+H/9kr11RL7TaJ8VNiDmocQSBR812R0dj+ATSmOf8TW+FMVndaTShMNjlr3Lt8ln0jx8eWf+yJbHolDKTkBFpBdRUjHjf0cnJ780+g1c8gBd2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jb5AH3Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4YPbhpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jb5AH3Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4YPbhpL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN0B8P1914912
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E4UfmlZOgWH
	Ktr6G6kxJDjNWp3Hjne97y+2Wx0uTOxk=; b=jb5AH3NbedZ1uG+ES/jJ0oU0sHS
	H3sD2vGNCCBjFfLCBcrHvU8eXKqGP0saGuAmxRVMBb+gT1AMAelgVtRIwJrXj6vc
	QMIuqTzmUfHJc2hZWJascEwR2fkE7spgQTBPQUsgzpU9gCjGRzXLyAmyqs/Xdgom
	iatqV3UjK2xCSzn/s15SKkc/YH9WQpb1tAzNbTZ8698Nnl1CdrBCpt+0EU4TmCEC
	cl7qY1WIX0OkbnlTtyHqD14uyvobmqm8sJQCHE505iyWpeBE1+NIFZyQHHmNLqGC
	a2c5Ocx6IWz4Uqh1UGO5S2veL919V3I/Ep8ruZZcQFAdQus5CI+FFrsYsbQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2ku51a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso3212830a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437422; x=1790042222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4UfmlZOgWHKtr6G6kxJDjNWp3Hjne97y+2Wx0uTOxk=;
        b=B4YPbhpLOV3r/SzE7VGvixwkywqVIMg2JszB0keFf+AqR5Diaai/VqwgdZ2MfMbRKP
         LNs+sgWupll3rCEriXFInJyD6O3TgQZ1YIHQUc7Shkj6dzJvCfqzdX7zakIpFWolQV1e
         jiF5i0jUM73ElorilimXXuOSdJmyhHvJUB7gCsIHVam4hg6Semv77qveGN5WAADk4xvg
         YBol8PxQUxSZyWVQDxUlFfMritHB1/7oxBCdLhQfxvFoCM2EnXTjr541vS6FlHFFnU3X
         2ooViavtRBVzNQpX8ON/YBhfy/GPRYGE6691Vke+aGjBfqbE9H+RKiWADJHomiPdGCTM
         s/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437422; x=1790042222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4UfmlZOgWHKtr6G6kxJDjNWp3Hjne97y+2Wx0uTOxk=;
        b=GGDFp3ZFXl28/uQ9YrpFFP5x6DzllJ6hH+aGGomOGphr+xatTiOF42u0/lhfhvNcyQ
         gNIBNlWcvjHAXvkvoE5oM3Jq4fSvqD76zp9v2w9rM0Xzo2AbcjmkOaGyobh8NykJmZ90
         31ATwBdZNhGkdBxFM2uJLyOPfv29mmSmO4aN/fAw/47jBFevUnYQ/Tr/+yAiTwoc1zw+
         hOV7UPAcxD7C6IaCbsJkv4gkE7ye2RwfJ0ZGaufj4LUPpz1KKp5Yd70ynw3o9lFdRuMe
         RLFkSuIOSGmaIf88FkC/kztdiTMkL38beWAkGxd6m/6Dj/Uj1hMzmeDNbb/qPfFkju9b
         wO4A==
X-Forwarded-Encrypted: i=1; AKwUvBy/9zIPapUtB+RGu5yF9okfbetYSDPIWHRdmWyM5D/0MOt6DEu8Up/PLtVAaWV9UwUq/gquzBPrmQAiUYs=@vger.kernel.org
X-Gm-Message-State: AFuF++kLH+KWr4ewb3OcacNSmu1GBGFVL5Ukp9dyqjIofJjm4Fp1LtNl
	oemGla3Mes+qAOAx+zhJCF3h1Iyqi5DPgL7OUMTDv8u8ZFKxnq+1BjSWKxHS859L9al8iehsRLT
	Zl2oKMtninf1K2Byb0C2nHdFWL9/bFlKLYtBe9IONZnzNGWBqnUTlDFIIIT6ZamQjM2o=
X-Gm-Gg: AYBFou0XTW0xkIz4eNsCPuPKkNm+AWn1V+t2kBHqmRx6A37Nj4Kf450nvCGlKwyVM5E
	r/WtdzlYoTWT8C/Fq0m+DPMrdl+/qx6kNslJfIoXSgbDThxV4Are4carqVYZzgmdbDt68Yk1Vy6
	Se0hHYZOwk0IC5F+8UISfzCtpM6S9w6BVhH4OMMEe1A0xWxfZDhavwIBHsxJMkUI2rdJMEVqEHV
	WdhfG8P5CFl9DRStu2v+mAXQYnwndciUD1vChYPuMLi+kP8GSKI1JkMWCSVUBt1Qc6JP5LPKo/N
	6azL5fOPYC7gVu96jWE+9Dy0Ndk50AFlJSeZksDy7iWOs6EMSBRW1EeIix0Bf5GceHXAkBbIhvo
	Jnt0h40+bRQAuIUMy3/qjLcXJ7tYWnthThaoHGgTUYOVL1Eia893szmi2wYKD
X-Received: by 2002:a05:6a20:d492:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3db4057bd97mr10740892637.20.1789437421620;
        Mon, 14 Sep 2026 18:57:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:d492:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3db4057bd97mr10740834637.20.1789437421179;
        Mon, 14 Sep 2026 18:57:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:57:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Tue, 15 Sep 2026 09:56:29 +0800
Message-ID: <20260915015632.283642-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1Rg5uF-3PR-74KafUtE5PscMqny_qYwn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX9SFFoaZVs7uU
 OM71lw8wk+sTL9X4OHV7mb/hkqyGL5sEYY9v1FYsUAwnkYnk3SQtprsNyop8KFOVCzsdiFiY4vr
 MzI3V7FatmlZ562Hp3XlLO5C62fr32SKI2QnFDfhvEeuog6YxD7lLLwZbn47BjlkFFE854N4SRP
 z85jCsim/aJ6y7aePCVoVMf3ulM/7pNvbny/MM3UubzxIxeWHfZmwssXeBp4NEa9ufymPPIi4pK
 WPnZFmsD/jh1ErW0ZIakobplTY1UeaDiAeOXaE1FSXeuJApNhQBPzijMiOVRK4YWrzIQuPw5M79
 sL4g8s3hVOZR6tH94by8VEKHLR0SDbtceI/Psz1luPGjP4yJ8iYPJWwbv2o96jyqzoeJkKRE/le
 Z2qH9hkK9wniC2sHaCs94ETrcwEh7wLb//PKKXqolRfEXg+xGhSj7gAygrd7FDovT+zR6GyI6vj
 KOtlZY8NgBLGpVBbgnA==
X-Proofpoint-GUID: 1Rg5uF-3PR-74KafUtE5PscMqny_qYwn
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa8a5ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfXzfKjg42098hn
 6uLxId9Tis9eS+KxDpdK14wKHh6cpDLpl2TVhibxQ3CkFAm2tsVzN6AmUwdWgY47YsLT0iXOJXF
 8vcsUpL1etAEIjmRzF4viCnI8oITnbY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150024

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..4c4d54d7aa90 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

