Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B2538D40B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369243; cv=none; b=RJek/D9kebpslUZKfx5pPV3aKa5iaWE6RmQD+iamGOHBYvw93XshyL5HCnVydPCKY0H+5jMO9Ag1MmSC4z3lPhEZlt38oztWS6GlOuGmvfE4ds3aWPRxRPf5QL17JR9TvomkHlV3zkD9uv5I62ab4yd3sfLuQn9Er4yAUeLrOM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369243; c=relaxed/simple;
	bh=va6xF6vr7UsAt+0AMfDPEagkDJP5CNMoR/tre/z2rzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oefFP+vmeMwiMS7m53diyeSFS4jbnZpX5BCYeGIf8MzP9G2KH2Q8nkKYBlZVVfyGR6+cx2qs4fceiXQVBWD3+95NXQVx1m82DmRreWffVuSTkjhlnfxNrBqscFoAdafUlhsHjbGYFKSE345euCU1MXysAHWef7+oWuGixSvkAoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFQd7xiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jkr+sdv6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFQd7xiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jkr+sdv6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j1w9793870
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=; b=dFQd7xiPTvNfzrx1
	+qo95GhpWZFZR0I+9Abxep9MCdIq1wo+lmRRzuA+XfkQJeMgyr+2WPLWfBIy6V3d
	YWJDRwIrGtdEza2WSo97RhReHmMQErpOFtq8MrGM6Bne4tKFnYyAYrjQwG0WK7R1
	jKYPyU8c7rAdjP1MSA5+LK4or+v1kdjCPDJ0dq2dbH2D56vI4HpzHlyJ4CZTMW/S
	SbVergDLW4SyFUODfOrYUphCfx6Ns93aKxhOlNT2VOw4wHzYQwUWbkg+pDkHubCg
	y9cBuI/WpT7IxTkwXEoLx+QWfdDdq6vKp9eVdYcsQhtUp66fl2CuQcvhRTNMnJ9y
	z0Lt/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cncwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3980325a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369231; x=1789974031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=;
        b=Jkr+sdv6h8/dOwwV8V7opz01zAbHLrV6ZuoZHTKMI7H00g6S8z00RR7BS0uAySBsK4
         jv3XQNnp0kPuBBAr6eCemFSFbGvmX9AyDW8H4fRwjBosmLQOw19QYhXhcRiKVSUcSOF/
         MY1xWWxzkd9GU8TyXcUPFYt8zDe22IqrFbkJN5VuuMDM0CIumCQCUmx0dbe7SfRR9d0r
         y/XGKt/sJP+0R/gAU2b1uaS0g0+7vec6IZFsz18i2Krs7VtBYcEITm/3ayl6jMFWkNFY
         8v4NhK18zFagixvjaWIoiSpJc71ho3back8gt0vMNJ7sEYpsU9GWkYqXkNI3pT5n/cVu
         e+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369231; x=1789974031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=;
        b=RKLGM33WZqAz7ducGufGo8Mp30KQhhtBJ5s/YaCHD6qj7BhJmEn6NOlJZXnLatsRj8
         QY/QMjXmLJKE/UzU4VvdRAqBcdpp2YXTVhXyD8uHI2EQrPD2N/PhX+NRqgMd//y74dEm
         YMcYJAYbz5GKse9dOsEmlroO4IC5n7NzZiRy5M4Y9yOVa7aHJ6QullbT1I3ermoHDali
         iSy1nWEDj9vu78SBNJttcCPk985q2c/DGRzdZQzF1q/ZidKNRybsLOXTNQ+/aQGL/fzr
         oaLHCq0Ot2YhEIvWZWoBXJcQEPIEHqZY7xXCYk6p9dSuOlWQ4lFTqoumG4ephMnTKHKx
         jsyg==
X-Forwarded-Encrypted: i=1; AKwUvBy/9Cch1GmH1IxcdkQqEBQqqYBrhSmmYwP+8UbeX+LMCzp1KBM9+9jHaDC4lfpt+2fHOMQ0oKyhG75s1mg=@vger.kernel.org
X-Gm-Message-State: AFuF++m7wRUFqwYCOBodh8N2CwofOPIzvUfsKzfA59x/o/OaC7WL6s+q
	Q0Qv3BIoTUoKLr6pSD2Aj4ZNQF/jpff91CLyikObct1brNEJsbPm0jZ/Sez36vRPrh5Pd/x1cn4
	LufQ/wdGC8kuU8UMlcPB+jHpN9JeNAmRzrixIFG0nGqXyavdjVJqVYa27QotSA5zaMC4=
X-Gm-Gg: AYBFou0fc0E0yeSULZ4wBMpaUlpdcFt+8Y03gz3R99YpYlNvJRYjeMHOiL1BSnP1GEB
	0+GEqZ4QPdnmyifsiTFvhtreR6a52nCGmvlaHBj80N75WuXgmZs0RV8ijhOCTEuoWW1F19znXww
	083uku1dEF6lZ0AQu/btyQ77QudUOElYC5F+14Z6+frx+WCI8/bnIymO4Iw3hlKbufQq7H5v8zD
	iN/LjbtlsfzqhhxX4DdOmUPVcd6TLkdWMSQeYTJE36+0sTKT4/9xbK8EN1mztT1JbCsc1TWCVfH
	HP5UttbUWLeyPYzAbRPd4KwuGX+pfD9j1fTsy3x2CTMFYEncdTSNdpWONiVkpNvP9v3taTTO07/
	2lqRlpU9orNoOnKdAm5jZVM2f8Cff
X-Received: by 2002:a05:6a21:113:b0:3da:9f19:bf2 with SMTP id adf61e73a8af0-3db4064eb93mr2783053637.18.1789369230944;
        Mon, 14 Sep 2026 00:00:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3da:9f19:bf2 with SMTP id adf61e73a8af0-3db4064eb93mr2782968637.18.1789369230469;
        Mon, 14 Sep 2026 00:00:30 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:29 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:41 +0530
Subject: [PATCH 09/31] arm64: dts: qcom: sm6115: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2637;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=va6xF6vr7UsAt+0AMfDPEagkDJP5CNMoR/tre/z2rzM=;
 b=6WOoHZceESG2EM5WDiZaE4GzIdxna278JZQ2Sjv3y1aHrtRXmPk+tlhgXxOdaU3bcaEiVgbmx
 oQ9utQ73qggCkPNGFvql6BqLCoE+DcrWFZJka7RM+2GmaKyB6fhJdIZ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXzbssTYP7aEaX
 bsi95prmEY3JFiJU3eiRVWRSHegQWiXT2NwbbqHCv0667rJr3h/UJ64/wIHsizOTjwuOg7SFDBt
 WJk66EV/6qSk0JYITI+ex0NO8jRoZ2yXQ3zUVIAoQ+nXTv0cgBHviwuSMuxlY2JiLWXO32wn/GJ
 P/EN0ETLgfyOVVFbuKVhcddvi1BfEW6rfMgmGeoqj83HXmw29+bELim+hxpVFdjbtn1M/9S7lAL
 OTd21XNqGyFxcEHewsqRMox3c007Pp7D7kEN2vQUu5x3pEzgQo7fWY/xp9cfRXv01K6VsVhA4QK
 foKMneLA94tZAAUDeM+u20KTnCTNreyyJdH6+ZaO4PHyHe4VD+U7zriGBSpACdK4mu3uZx8iBps
 xw88pO9mYtZUSOaQJL5KQLPRz6ul7F4ShkdUDTMs2JTNMFRWjsfKOnhgxpozV7EAcyu8NZrLI5Z
 diUFOrDenZDgBYzP9RA==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa79b8f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX6lnaD78N13+5
 d39WPfPJMsCMxm2W0KJa6TdNCCN2Su/MNVtISkdxaly/mwEaevfaP6X5ZXqWBj7QZ/6W7Plr6WJ
 FqcPj8X5JdnJygH2IieRJyXz5iOBbDs=
X-Proofpoint-GUID: O6EDmMj94eie7nO_sWKDHUXThtXJpS72
X-Proofpoint-ORIG-GUID: O6EDmMj94eie7nO_sWKDHUXThtXJpS72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3520802d1fed..27b5ee48637b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -209,7 +209,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <290>;
 				exit-latency-us = <376>;
@@ -219,7 +219,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <297>;
 				exit-latency-us = <324>;
@@ -230,8 +230,8 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 
 		domain-idle-states {
 			cluster_0_sleep_0: cluster-sleep-0-0 {
-				/* GDHS */
 				compatible = "domain-idle-state";
+				idle-state-name = "silver-cluster-gdhs";
 				arm,psci-suspend-param = <0x40000022>;
 				entry-latency-us = <360>;
 				exit-latency-us = <421>;
@@ -239,8 +239,8 @@ cluster_0_sleep_0: cluster-sleep-0-0 {
 			};
 
 			cluster_0_sleep_1: cluster-sleep-0-1 {
-				/* Power Collapse */
 				compatible = "domain-idle-state";
+				idle-state-name = "silver-cluster-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <800>;
 				exit-latency-us = <2118>;
@@ -248,8 +248,8 @@ cluster_0_sleep_1: cluster-sleep-0-1 {
 			};
 
 			cluster_1_sleep_0: cluster-sleep-1-0 {
-				/* GDHS */
 				compatible = "domain-idle-state";
+				idle-state-name = "gold-cluster-gdhs";
 				arm,psci-suspend-param = <0x40000042>;
 				entry-latency-us = <314>;
 				exit-latency-us = <345>;
@@ -257,8 +257,8 @@ cluster_1_sleep_0: cluster-sleep-1-0 {
 			};
 
 			cluster_1_sleep_1: cluster-sleep-1-1 {
-				/* Power Collapse */
 				compatible = "domain-idle-state";
+				idle-state-name = "gold-cluster-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <640>;
 				exit-latency-us = <1654>;

-- 
2.43.0

