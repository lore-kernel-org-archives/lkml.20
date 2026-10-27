Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101824;
	b=Y+TGA8yyOxQDqBisfVArFEC+++dyHx7UotVnsSEKLJhhhBrALEg5paSMyXEqyH6JyIbe
	 DXDdkASgHD2zOqzjUxWNEiBcqaAfU4SGoM8gI8eCKjwx5IpwKk8dZ9OdbECumBNjBKe9g
	 iWyz/5IT8TefbkmhT36dEz4YlkXcJvyaxtU3AMBpLQ1EDYSTRIc0bhq0pft0KfYq6osul
	 fVD8S+L/7e0pH+UbBg9kosANdv+KXEUwG2LtpLGpQhTGNik41MCdZN2FWDUh9DRlwFe1O
	 5tYv8U5WeYSNFQNa+j9YFvQTMFHdTw+Cwf42KHvgZxdWcNIRIMLhvSiupUT85umoQNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EOZp3rfp/w1q05Zv+KbKkhpo60K0a0nNrO/tuiZFfm8=;
	b=U8aKLkZ9r/IQGlnoCIEON4W9ahp0RtP9p0Mx6s1DesxsFEtyslQUtF4ArvCpwTdiHhfe
	 irLK/ornAyPOeetVehD1wm91Ixo3Ywjp/Hp6jL+Ne1OcNFeBiPLOoGRGrfN0oDLsMN3ny
	 G9FnPat0hsVR1QlcaLKCOWUyw6MR2+MpZVxqbe+M7vn54pYoj3PjrLlwNTW52z6QCUhx5
	 +SbKRaHsGvxHNw3Xpc6iNXSOaN4Ap+RlQdeAEH008FpDmCecjsJxYKbnPc0SD4+OhLzwj
	 gzvB/aJ8m6EcVJV2uSBcgcm1ZxwxnZwXFVHEIFxHVBRshL5yqqydBvRYOzD5qzpBsSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f6qEbW1t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EVvGrSDC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348D360A263A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348D360A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f6qEbW1t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EVvGrSDC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0lo2458170
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EOZp3rfp/w1
	q05Zv+KbKkhpo60K0a0nNrO/tuiZFfm8=; b=f6qEbW1tNmn2+V28FVJ+jAvXtsw
	UCoT56LwFk93BTU3SftrS7yiFwdpK4pu07rdHrSOgJDKg0ufWZh3Qg6/6pFlAGI1
	SW+fOrmAdO/b5v35UPj7q4WkEsTDXWsCeSXBX+AE/MLl7qcluzJooHLS8ZwzHrfw
	OtzfDBe+nqxwCxyip22XdC5aAbbXhubWfOQbylUkCV8WBRckUumreaqelmaS/ph5
	+5cJmP8t1gxFvbU7S1WbRLrbpCBWUSv2X//N68n85HQ28O88b3Pk2WAZY6x7qKBk
	a3WAGfWY8dEJhBlDwV1RMI5H3fe5J66fCr7Qr4c6i4/i7JvkwbaZrRtqTrw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta3kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so19115092eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101821; x=1793706621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOZp3rfp/w1q05Zv+KbKkhpo60K0a0nNrO/tuiZFfm8=;
        b=EVvGrSDClAHAngwf98nO90b0Qxv0Uz2Q47lFtlMBaRaBfXQUsQoyY5g7aLHSrYi7J5
         uwuap9o39E0MjT0STpVhyxVaFGFCn/6IPg8j/CEf7+qP2fdlpS0cD+GmDcYYgpdWtYcJ
         NUvifn6NOU8lQ2LCsF2ATtnkDnFEc6NiGawY1zHFy91Bcf31mu18Qf0G5Fnza7wEQNTU
         7Vo3JkUBXDfYsmEEp3DR1TYxbJzp3cdBLfklA3cgMC9BnorZuY8GwXBNF1k9DpaE7wFu
         nTatIZjEKLC+kXRY3fypJf0hKp0E+mDCBmT3QYvjiSYWn5+9hE15+56UXgvoX9RSCUZW
         ljPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101821; x=1793706621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOZp3rfp/w1q05Zv+KbKkhpo60K0a0nNrO/tuiZFfm8=;
        b=u7heJuhcFm6PzjaC1qaMF+1YJAA4hc/kj9m+sGfD8xLLMtq8nMNiMTnDBUOk6q7UbB
         CyG06bBriNsp5XidCYiGkJnaitfw18Ip1Ifj9D/ZtUhnQ/YT2GTg+bpVtqS2P6QVi+Pj
         zlp7QrVZ0hK14uNV/B/zRN8jUteMJaXrKgCrpl8hQhLyKeWjrU2cUcRRiz6hNLiUAIXm
         4AhvYpcIBle+GzpgNmdAgofGlcXgawrGynvG30FL6OnsEDIbht3AbgdjUC48eVcZyx54
         YzLwV6kyAQFFD9Cjj9LEq0s/GISDtm6PN+w12vXfHHhgg8Zu6/1ZyRyO5JAJOjJdpNIz
         7j5g==
X-Forwarded-Encrypted: i=1; AKwUvBymDJsLClGT1kOQRa2By6VCJ4Vr6+tNcbm5JYeeEOYf175AM3hdwqXBlucVE9K7oFzQs1KAZzzcMIcjcHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJNok5ZGelHf2yds4hbWuhdyzxqSq8Dp569RkPUnz2IhYqxPtS
	2PaiNFZjlFeyxSa1HWpdju+7hBQOBIb3AcKwsqrTQxkTEMUsp/blEbdA9kK9lMCVCEy42+S4iYy
	sKhmQZQWUXVXIgp/vo7B1cIqBgeZk8rFP63wgpML9Q1+1WsgdK2LNZtd80e/M9FZyVSk=
X-Gm-Gg: AYBFou3/aO8FMhX3bEDEcVjvVoBufr3qmOde1W11rajxnKYCB6uA3rt3R2yDAePiJre
	J0mxxE1v0nxzpLWx1vHDGz0zgeA6dUYL7e4Jjz/l8fS6jQGgra66GNJweryAsK6RHynwKYYZxCZ
	1MhVS2c5OH4y3sPKa17cxxsL7yFTDuqcmDZygujedh4cIrMHVoM5k7ahguuczGftPJGt2lo/Oic
	kp7WT35AT7LAqk7HEtlgwgY1iQfGr8DdMHlIeNgpq0vaDHUentk4JXhH0yhdHEPC3FYDUOFnzH/
	CKOfO4XEMDyaMFyzPBTD0cUvrtzOuS4kVn8gcRMN/67hMWHSmmf0a2b0B7EmHv+9p50Ejb8Uh1k
	uP9H1QHd+BETojCxvsETdaRMayf1xCXh6ed6PNk2h+5r4hvTUdMRhmEKIQbcIF5FTYDZ9AQNCWi
	WWlrfs/Wn8L6jDkTVNLNeSBA==
X-Received: by 2002:a05:693c:820d:b0:358:eccb:af7c with SMTP id 5a478bee46e88-369e8515310mr15323131eec.33.1793101820926;
        Tue, 27 Oct 2026 04:50:20 -0700 (PDT)
X-Received: by 2002:a05:693c:820d:b0:358:eccb:af7c with SMTP id 5a478bee46e88-369e8515310mr15323109eec.33.1793101820441;
        Tue, 27 Oct 2026 04:50:20 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:19 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: Add Mahua QCB
Date: Tue, 27 Oct 2026 17:19:55 +0530
Message-ID: <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX67vWSfVO7yCW
 tA2Vu63OgWeZ4OCLiO/vY7zYVDif+qYmvWl10TkUjT3L17VAIA/Tx0NY2oH/Ez8UqyJQD8xQ5kP
 FdGiGFWcnX1K+jkYLa2WYYRq6o9ZJ3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX2XDkQC8xEz4N
 ENQ4eZuoKc8yVfQDfo6s34P7j4na8+JocsyuYz/MgJGtVu5AhT3EMQl8tLyQhiZCLqo9+kM1PA/
 SUTIXW2yCDus2dhmeihzGgJ8H0W/KY9LldXcJugUkJOPt5AQp4kj52umJuMGd8xvZD2wjagnt5N
 WWohcds/FGovzwlvxY2UgFcSniEjn/3lS3leEdLS30XPXDAPwRW2eKhLsLzvuDQ98tRN41MzgOb
 FMYuYn8eAzpUhh/HQ45nB0VikFUq3J0riGJayaCqDg9S0mrAA0NYackHHfEThLr2NvU+xlyyXct
 O8gz6jiXrniiyZ9yq2B6ZSPVr6r1ibG38b8V2Zuu0mx3Ek7EVPiDQFWzxBXkG91chR42Ur40XU/
 vrfZDnBQJ8fS5jiHnUgGYKXoYqx66CQJg1z76ua2b19RKKjThxAeXRNJ0KsfsQEKOKNlELeyWbw
 GlKBE25Svx3TD2nXGNg==
X-Proofpoint-ORIG-GUID: 4FpCED5wx5HCZJQ_NVZg3jKmRbR0PIsa
X-Proofpoint-GUID: 4FpCED5wx5HCZJQ_NVZg3jKmRbR0PIsa
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08ffe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Ajfpb6hXBSAmRpdWA78A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

Add initial device tree support for Mahua QCB. Mahua QCB is a variant
of Glymur QCB but using Mahua SoC instead of Glymur SoC.
Mahua is a 12 core derivative of Glymur SoC.

Unlike the CRD, the QCB is suitable for compute workloads, power
measurements and oscilloscope-based hardware validation.

Includes glymur-qcb.dtsi, adds Mahua QCB specific board compatible,
adds tcsr regulator-supply properties, removed cluster2 PMIC/thermal
nodes.

Co-developed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |  1 +
 arch/arm64/boot/dts/qcom/mahua-qcb.dts | 38 ++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-qcb.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..830c43000897 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -65,6 +65,7 @@ lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= mahua-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
diff --git a/arch/arm64/boot/dts/qcom/mahua-qcb.dts b/arch/arm64/boot/dts/qcom/mahua-qcb.dts
new file mode 100644
index 000000000000..0c742c54a237
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/mahua-qcb.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "mahua.dtsi"
+#include "glymur-qcb.dtsi"
+
+/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Mahua QCB";
+	compatible = "qcom,mahua-qcb", "qcom,mahua";
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
-- 
2.43.0

