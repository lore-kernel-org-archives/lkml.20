Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1286B48D882
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046995; cv=none; b=qlaffD+UzE5zi5OXx1pITIpaQUNtT+03+KZDtmHk5W9r14flQAO/pVilTsdVRoECuaoQ5qBTfjuboc6XZfEPaalUirMGJcKleCCmMMXgVqwvcst9p0dbTgWCzbRxfdwrxmV5ycQFnG7P1wH7X4A4qaDYY0Vk3h5YLZY2het8udM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046995; c=relaxed/simple;
	bh=ng6TQ1j7rHwm4b9vMxs2nVTuvSLo2hIPKE6L/BFFWyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOSzQ4wxjIaBW7jnLjKtwGNA3lX3xlM1sXM1X88yUDoNSqzzgM0ZAM74tY2mvW33zxBZIehq6sXMUktQYX+SCkNtAYr6Bmo3fFLKSWVGpxYYclonF1It+owhC0uRsW5WfNRZbT2YBObYj39CFZsh252jjANxcnbuRWe3fOG1FO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hM2GHJJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hmwlf++k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM2GHJJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hmwlf++k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7e3l1440466
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=; b=hM2GHJJ7m2zXjgET
	lJ8/Wjgi3xwiE6lm9LYvk4ifITlzfnqWykzDIiABteRF6tbNEWFKzGx61bl1wDcL
	1ntp2O1aiKFFKt3xv2OmDHHgbTKf3w3Qxh/HHPhq1QypWIyy8rM9ZopsKcMtTxzn
	iOXR3KNnmKncBjQPi+fxQqzEk4JTVQzi5/5zczCEjnxhUi92fOYblaaPEcrrmM/6
	PGVYJW/z9W5fyWbKIlw7mW3OU3SgB9Pys6nZs/cm1nj2jcaMteJWLS24iCTxVe3v
	lGV/ou+04v9QEyOrpl/omJirvQ6bB/P4Ln32z1KmZ/05TPGCNBhpx0BNVVbkiBsS
	M1Cwig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsf1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so15069153a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046992; x=1789651792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=;
        b=Hmwlf++kd7dKUdvPmXcbmy4OnEyGA1xzHCNpgy/6qlN+Wjq+s5WcHyqGVWTjjXLKMm
         ACOGsEFmog0rYnhC9VvBPEUfpSSt5LD4yxfEFJL5l+nHrEIZW+ZuBz/ngydc3ZgNN6SJ
         FvqIYo89+ZbGalBdEb3xHsLEW+LPj/x6yA4S1l0ntcDYoNOk3VT2HGx2vlOsWItjJ2hL
         xdO9RGF8JxNazZgez6sM97yHYSM6PftTrhUWakosDQOY0HbtshdYhUAgKx1usMau86l3
         q/nRiUjRz//8LLW/4BwijRLA9oUuvT7XH1f9hPVL2FKZcMts9HAZ7s2hXDDnGl2waYrk
         AglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046992; x=1789651792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=;
        b=GnkRac3doBuXHxROV+lbjD3s0nJVhaGPhUKsXCdj5uBRGxX73+CrZSEA1vH64oUsPJ
         emG90PBPAp+t03FihD96zZhPqljllepq2/RQ/yoJ/ftqQ+2+nnF2LeF/+t4GddGC666e
         em3kFdGGz1DvW/VZzH/7fYYrwis6zW6CLRhFo810W1rGcgVclNfjnvNA9hgBejgqI1CA
         jeljxDRvrX2e8mqhnHP0F4GifRJ8Q6rPwKlnc3OrCKy9Hcw1vueYVEZNMGq2bx56yHIs
         FyemMaV/s/fI7mDDTi2mATLPjL5tNJnuH4scd1E5cE419c/VvkSTtsKLYCzNJKqtA0t1
         vKnA==
X-Forwarded-Encrypted: i=1; AKwUvBytfOsrNj1wIZsVxTHIlJrCk4seNG25cAYMeF2KC4X+Feol5BsCqlWTFPc78h+IzpS+hNvLi+ta1TBMNO8=@vger.kernel.org
X-Gm-Message-State: AFuF++nbAChkOAKjJ0oqkFSohLyAP9Mw4awvWYeMOQbNLIQWT4qg55q3
	7Cbe2tTpSz4lcd9Lo5ynoQitbQw91UHELdFt6KbCgxiDsr66n5vQGet+l5v2ry/2pkamO/LgDYF
	S/aR1gYwzqKMhY3N9iez8c2GCNa95aRN3CwOZnYHQkZ6xJrSHljIR09hNfaJ2BIgef+A=
X-Gm-Gg: AYBFou0ynrC28Sd65D9X+eLYlqZ//hz8lew/bOtJltwAU0uHU5GJ8Gua3cblgJn7KmX
	S3kdR0UMzNHWTG1ZV4mkJVs5u5MpOBo2nkrB9jtm5eUmsEinNOCUrygCOuyhHK9bnLxtR0F/675
	mvsDIiIWuh2gtwbzbdCso/sCF4MdY+KMUjI/KngpF8ebRCbTulRPP6KgL5mGU2isPLZiIVO1OSq
	viNXY5dVu0Zw+xgZuOeGb38GhaDR3bJVbRsO3KjwyAtDwCysOrlfwBbW8eWLgMM4ElYs2j293nU
	FNMSMgRcAi62Il+7i3+8Jy0WFFQI6bx7nCJqmmmhNO3AmDErCbhbyaAPZK0xIgVlvI2HwBFAwMu
	VExN4RyIN7iXmVEoyWD7SJaTtf7aQ4yUFYDI=
X-Received: by 2002:a17:90b:570b:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39b260de5bbmr64257561a91.5.1789046991979;
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
X-Received: by 2002:a17:90b:570b:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39b260de5bbmr64257487a91.5.1789046991413;
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:59 +0530
Subject: [PATCH 10/34] arm64: dts: qcom: qcs8550-rb5gen2: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1740;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ng6TQ1j7rHwm4b9vMxs2nVTuvSLo2hIPKE6L/BFFWyU=;
 b=vvvuJBJw2XVJcpjO+JG0qLAn4bWDQHHusZOl0uck3t28eDShAxTXWXxXI+eL+xRacXL6+kBDy
 u7W6aCf6DWoCYoYEbjvJtPPzVKs9lYbx/GoYNtxO3GTXH027GbF12Zu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2b0d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5T2ikL9G9zeQ
 VOucd+dAlDQxnZ/tFBXPzWAjn760SSOs8PbbjXx1uU9mShLpWlC3xN+rLBzKiiXkRibBagpdV1F
 +mIet9wbfUw+AQ9WJ2Z8Tq3CSBmSJV/2Y1TvpMlMXYPUkxr1+cmU54mWyZPoQMJHyIYyvOMjddu
 BgxeA/Hx807Y5WIW4l4OOtJqRp9x6X1mkOr5U84uGySszar4zjjXJQ0Cnr0j13c5f6cSboH1FAG
 0R3AXdJoU72Mo7+xp2eAe3GEhPgwYLgeQzRsZiR9/IlmPTB9JQmnLflJOLR9bqTdi2Wxc0NZ6Xm
 1CX7X1NXNQFmSz9wnqf4xLR7LLBZX1KVY0viEwamgHVmcZX3sIec/bcESvkE03X4vMLpTKunTxL
 z3ksQWknedcCLijpqLR9/qhgWJNyNU04SfZfn2yLXnO5gKD5g+oi4yejsoEgZbWNlheb5fXQ+q5
 W7sY0TIVGpt2GZs6Izw==
X-Proofpoint-ORIG-GUID: 5LQtPfUXaAxciP1LWmRNEF2OOBoTLRdO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXz4xLKkN+NysW
 SY57YVyNL43mctNEcqrl+eXTe6uGhWE1CGcyha8PJK0BlahUTb++CXXLJ5bXmrrYKODTPk1G4c6
 Z6tYVkJCamb0BQ9/8UEIQ/GBqsL4RCQ=
X-Proofpoint-GUID: 5LQtPfUXaAxciP1LWmRNEF2OOBoTLRdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcie0_port0/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 41b09ab43d0c..42e3e862e6f4 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -1045,9 +1045,6 @@ &mdss_dp0 {
 &pcie0 {
 	vddpe-3v3-supply = <&pcie_upd_3p3>;
 
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1074,6 +1071,9 @@ &pcie0_phy {
 };
 
 &pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1146,9 +1146,6 @@ pci@0,1 {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -1176,6 +1173,9 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

-- 
2.34.1

