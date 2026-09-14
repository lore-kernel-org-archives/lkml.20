Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3913AFB06
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370408; cv=none; b=fDM5ybJ/Q5ExFjCYaefS7V7tWrrnLOOuD2sesyAC5EO65rqmu/y97IHjqBWgTHs5LNFjiDdZUk46F4MQeANsPOaOH1hxUxj7/c6V1/jfywAzwHuMpauRYcNd/ncwLpBI9uVy45VQqdzrbK2j+pbp735Tt4Aw+yvEaoop52MhTkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370408; c=relaxed/simple;
	bh=J1FwxRtiyWITKSOl5tkfxrc/9yH/GSTUOQON86irbnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5CL78YyrGvkv0W6FZY6MWT0plAFeGB0OVeah8LXAvQzyMw3T19/ZVKqcpDjak1EbhGzErfpG62dBFnfsryfGU1gSIDQv6Z0eiB/02uOd4oN/rBeDflqvIM59RoMc7iZVAZObRhxwo9w/ZuvksqtDqR3x/AwFt/qhMlSWQPhIWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhcKpDrt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fk8cOPdu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhcKpDrt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fk8cOPdu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jIEt3740650
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fzuQoqjXy2N
	ntSYmMieNrGawsUXrnwdL7nak+DzSKgE=; b=lhcKpDrtkOeRKqIb3nmeN2nuBff
	wsya5gh5t7pQ5+YdrgxplaEBy37NnK2mGXHHFc9QdDHkK4hFnLSrEZStGOqCyHHw
	SLWoTq5pMk20ooRs5PMgU9dELV7anFcdLcS/BvxCmyKDa56p6asdUsN2syFo2++v
	fguVvK6fGULCZQBdxym19caNXUb25GpyrbFEEhb/0OtTInEj8eapbm3qd875rrWg
	BP2wcNzh8U0B3kj3wrv4fgWHO0kR61iocQ3WyAfSii9xP9tT6uRvEZuChVEmH5Gt
	ngXRbl2oTttCHquLVRQNVz5yT9ljy9KFZmb/Z1sJA9goryqXpeIHaWOw93Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddfx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso2148340a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370405; x=1789975205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzuQoqjXy2NntSYmMieNrGawsUXrnwdL7nak+DzSKgE=;
        b=fk8cOPdue02dlP/Fv65G4GcnKu0gI7lvOM8DQFgaFJ9FaSEP+dXeW7/k6Lhwy6aGmU
         N5J/4GHf1WJRfdQA4OFPimZftb9P25wNV+qgJrv6AGYgI+2c1gndbU+T+tIBmqPFXXKD
         KTLASLlzrv8dFa3o8yfqQUBIOUwj3wJnAy6s12ZWC8y1Bt2VcahspiM6P4eQTUjxxvRv
         T9U5ORnArn0cH3XpvVCfXXVKEHnH5TiK4Uu9vxLXWIT5S57Z/LWuUkQeQ6h0vmtgQTU0
         I3uRND7SlE4ZWSwNbmQ9Mb4+FOaSMw7kakUBNtYTuYX1WVMtaQNAHCu/7QV3PIPDqXLh
         6IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370405; x=1789975205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzuQoqjXy2NntSYmMieNrGawsUXrnwdL7nak+DzSKgE=;
        b=ZK+l3PyqSQP8yReQDE/XvXekx8i6np+c6Ri06qiUy3/hfyEJCvSZCics8kN7tNEWIB
         scWn1ML6LE/0+ubAyw2V/C+grQUtufMUbu1lV8DcOgZSI/XLxP3xMGUyyicknkZ6/Tci
         /hpGURGxDY4CPfOqTgea+UBzWllJYY+3WLjc3Bz/XgP7yrOMQNBEDA+I+2SeNz7QIXTK
         RhpxV0p9GOhELIeFtpgGFrs2dF3RnWB/SHwI+jKQqzsSllCo+gS17Fj/UdTF2tzioiuD
         wQPFzqplAAv/WWdNGmWV4kbLm2jkJTHn4VpKyIKBfC/lJiygvIFLcQkP33cRK0ABjRxq
         uZFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbm/bdTSRqdfpChWtx5+x1h6fiR5wlgNU1CY/n3G2L+/h5C7uOSK9PT6TrIw3ehHPsILx5vOi3cyTaS4g=@vger.kernel.org
X-Gm-Message-State: AFuF++kRsAP6jdI5USatkU5/I7K/b3+6rxjuv98atCz25KA0U5UOeCUU
	HuVIds9C9HzFgCx4tymFxnTWm1olujJG7YPNKXvofczQIQb/UCNWEm5yaPls7Tkp+XoH/NPxMVi
	XONhOxs8HWJoBjWtP3Yf0naiVW2rvXGA4nKsEpYRLieWpFrzO4Z9bDskSfXT8D0zdd9o=
X-Gm-Gg: AYBFou1BGkoLAbusJ6b2455nYSnMvmqqZgGjZGVblZ2qGs6raYDUXMFb7oE+bQfzNCx
	g9Hn4J3UCNoYGiVNDI5GfO03KYjj8CTAmLU8bS2kCkiInMFDVMCP3URVPefY0ARvOsCSpa6EaS3
	TRmtNPYaecif/D9FakXMk0+QXyNdO5mZiDBBf+kuPTEl0LDZ30qKyOwod+x9jru43wp3kMjnSAb
	am9xuHWd4HWARQFafgPOT3HF7poRqipy3VPeVDlQJ8FnVXlE9HvTnTg0tylANZdBwkOt0tom2E+
	zZAwsPzKYEgO3cIxzVXM6p7sAnWHrMA9HWn7wuByifl/rI/iVl7GDt/1BPuom8IHhfY/bgHioH7
	ygvjXwFMjkvNi5BEU2dLXuM/pLww+Fkm+fbPRe65f0YLP3KdAWzOFSsCBWFxK
X-Received: by 2002:a05:6a20:6a0f:b0:3d3:b00b:26e8 with SMTP id adf61e73a8af0-3db40611088mr2309592637.28.1789370405290;
        Mon, 14 Sep 2026 00:20:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0f:b0:3d3:b00b:26e8 with SMTP id adf61e73a8af0-3db40611088mr2309518637.28.1789370404769;
        Mon, 14 Sep 2026 00:20:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:20:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/5] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Mon, 14 Sep 2026 15:19:42 +0800
Message-ID: <20260914071944.164217-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX2fPlgNCD3YSE
 gFATQ+xerM5rzWmD+KP74C4djIo5dX1Uof15biulHV1pkgB4PAtSl5XRHfwWd5aYHicfNXpFNxU
 JDcFNdGgiHTUYp0W4JwHimg8uo9ghUDltDEFmIQ6yGKTkElIoaXsPQ60daCu7nxKOGnm48yOaS7
 S0KwvgL3mm71CGL1FJ99A8zutWw8xysVQB99yaIi1aAh5bw/B6zGoVJnwE2G9cLyOA4D8nPH+3K
 cQ0Gx5r/yFy+B83o8rO0pX0y8vKGG0gNZwKYeBDTJuh9J6LWJgMBpz3oRr1NX2nPAQ9u1NjzA1T
 D28JBSbWOTNFZxFpSQ9krJtCRHnr6HPhC5Fl5KcbtghsW1Zi2n4R5E9AC3qj7e+DE3xD5TGXz4J
 uagJC5JM2/AKNR9DEOYROHfmsv6hbmDhYcaS4E8Df7XHpzaJ2VhEUVnFG2g8ygXS7Mus2sQI0NO
 mZHhT4JlsZkJ6t7qwhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX1C9q463yvTyM
 NlWu3YlpwPMfjGOJwXxMGYfg3V4bBNwDjXtl2wnP2GzQF9YLFhwsjIUho3++xCxVBlROmK70PUu
 WkcSIS+V+Ee5Sh7Hk2Kn08bQfmRjxu0=
X-Proofpoint-GUID: Bz-joxwGXvgiQrbPUcEQvCgslHskmvHG
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a026 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Bz-joxwGXvgiQrbPUcEQvCgslHskmvHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140103

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 09ee525764ef..0b230551a49f 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
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

