Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B641C415B85
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037588; cv=none; b=O7Sqlr0q05j+u5NaICsqW8XvNPQ55Ht244P4hmIUeoUt4XtUKp8JbjVMmI47HyKv5BeuYq9P8OrJHXRJeI/6a6tUieYx0iTXHmNm60IUHzTO2ocCD8k+b58G2Wkp7fjvzWNAeqJRqPywVaWpf72z5OphWsHt5ukx+QmtY+SsnEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037588; c=relaxed/simple;
	bh=sAQjUxIjl8nvqblAqmHcPV7IsLhvqooON8HdUtzV9R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kumHk+9G+58GeNl8bZtFyE6hfwOTKvvxPJV/QmysRL+ViH/Shkrv9vbDtR4Yzzbi//P8AtZrYGN8wmQ8hGOUn9Dm5RBnhy+ju2qhzMDOCCJfxtJI5Mmr5J1V9PYMk0yYe+xOPD+mp+RKRkOTfCVnuUBkGGJzTzjYp1s3fv/Ibs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/wvFhNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMj5QhXh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/wvFhNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMj5QhXh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1Aldh3468841
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I+/LBRpEdI3
	GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=; b=Z/wvFhNkjpzEL4rlfFHP+T4j7hG
	Jm2GfYV4c8XgN1xwHgd0JISeGIY2doxhgLrdIZ0+PPlRXXgiudslDd9MeSbpJErq
	YjCaUS0gKIn9P6MlKyNUF0r29yu4iaeCMt+YOH4PI71O2q9Q1CBs64jqCuJqSI4g
	UehC6ZhiO5LVbW/n6SbTCrWxEGqqwDBuiL05eYQvqGe01OAzISjaX9+ROSu8WuoP
	cGdOlyK4HvGcaBGHXqCBT1Zy9/I3nASKmGH3FXyWJ74GcHWuaecNjcNoA3KLqgVt
	V37McIQgZCBhzupnaREHvTS4nJHLGyg0zOSgRYwhFJEZDRSLNAbcSCW2b1A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7a9jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:13:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac765fe43eso303928a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037586; x=1792642386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+/LBRpEdI3GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=;
        b=DMj5QhXhEQRTPs161s/v57nRZbMX6YB4vKZwohDryEVRejZzPoN18WKNF6CVSLcZsx
         1kJfkpZVvZrFMXDjn8wsvZVLNkRsmYI2qLn9i1s9Byg0+C/EWtxL+ZhZ4dSeV+JVW+R8
         cs8YVLVMgakuLwjPv0+Zo3KvbDyXW81J5jzlp+NAJXF8PbtCFEfn+josbs6NtuGvwj9M
         DRmq7lHg74OXmm0AKhaMUM1NaBOkXdpDPMfv1MEo6Jr9yrkngYDCme/NLUpLuumLJmu0
         aY7gh/EeDE8ici0IIjmxevfPjl+Qcc5LVVLqmzS5hD39GIa/61P7mJm2mTDJ3sIPQAzW
         DhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037586; x=1792642386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+/LBRpEdI3GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=;
        b=BpJbV1wqADRG3x+mRuLZnHubxpDjb06O9z1vBGYne6POjOVuvdxlSIz5yZkbrpEfQv
         NbMmiPbpPiiK3fsjwKicDJopyaZbCWJyqvBI5Rre9JMn4SLHpcqc7WvJVhwdiZgAMFwT
         7IFbxaeLbyfcLEoNwfMz1QmWbYuRV+C3wUEkJQIOJYferMIK2Pf7XDPi9kaconVxVk3h
         3zFF+2KP8a83anwpEteaiMQbL4BlW0yWc1QTliR/bkGr3FlCb/Ru3Mxt0XISi7U1OnxY
         pz/+A4DQeNP6SCg3pA6v02+HOGTZf9WdJ3nWr7pWMqCfdzkeKL5Xf6n2jaazZzWS5jBI
         KAng==
X-Forwarded-Encrypted: i=1; AKwUvBzYGYQTMeL/gEW4r3c+iStFeBW6BvL1pkcfQvl3Dye+Yh1vztSr8OdPdSFHQXoK5cYoAkVCwz6cWhwJAzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/E0s7BoMT8IWaeRlxwPgH2ks7ID03KBybetMwj2PNInXs2x7a
	CDwzZ6EPGqMtSbgZtJqxZCO3+KX8cMg07wF+AAZ7D3KummWU+Fr+t/6NSOL3IR0WrD3smc2zHSY
	f3mH1KwXbDw1YC1rpBCB27kXiUAWpPNE0kE8QYGlZXfYxCjmF+ALEWHohWjOh0EFzcn8=
X-Gm-Gg: AYBFou2h6j2lM225KYubyl+pVGgtm0aWPAAhk7Qvuvx+xX2Tvwl4OK2+t1U2URpE4cF
	EjQh2r6vbc374VgAcki3LQ5zwvz4ncm2mWUBDMMqOurW50olWZK0ZHjTkwiCUxbxlYYCGTfCBlx
	GWvPcfT8jXQADsOk+ntF0sRY7tdpSkZ4gB8QI0wsgxemGALOp27mUnB3oekGrGhdspvIGrkZmEJ
	5Az/Et7FRMUDm3fnATWQQ7KgxjlkFuRB+T4MSC5lB1Pl4RI2V9F75buwTsjZwDQfsgS9CkCnOzg
	Z6nTJxnMREx2LxZxeQhE2KBKqgESQyrvuMgQ/U7r+OlvWjfH5Dachu4LJQPnt6nKDn7JJ9kvD+w
	R9Zx41A+mn7H03wAfXp1mcvePw8JO
X-Received: by 2002:a17:90b:3a48:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ab3a33ce37mr25720238a91.1.1792037586308;
        Wed, 14 Oct 2026 21:13:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ab3a33ce37mr25720214a91.1.1792037585841;
        Wed, 14 Oct 2026 21:13:05 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2267762a91.15.2026.10.14.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:13:05 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH v2 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup
Date: Thu, 15 Oct 2026 12:12:41 +0800
Message-ID: <20261015041241.2186521-4-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad052d2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GJxj0BfhqkdqIuq2HFIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: eI6O4fZolIwufujWBPLj5AkO9aJOdFww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX1gj0E6xFUhRR
 xA6at+8KnJYTDy03h5A5pedB+3b27g02Z2yp72owkFpkK6/V9d3I5K8SEji5iIUWznavY8uI+n/
 2AOO6lmMr63NHToQ8xEJnB9JF+KoMr7RFT3eQtUQzLgeosOKx/FJaqTvh0Y3HPxblpSw8pYXaHa
 NJl7cn67xi9jXJa8o1laBLA6X/LUaRONrLoUszAkYer0Qqs1DQbp1cbnsJnaQK8LmKq+0To154V
 CWMafWlpDqENcH7yl+LFTkiC3D1pSaL166aYSZXBjgKkCIqqV9H4EI6M5enCaPReoxS+pMEjneV
 YeTyKM4jLCG/iFKVECCbdTM0FaoGLi3+uJEucO7GaUMPtvgcAACdqkMz9Sg7GHqKrsUhf+Fkzcy
 DnvdBQIw7Q9pI5Df38KZUJ5sW9GcXhFegHJom3UiQ9RjCrRRbPVKdoLKpsiVECKZXIZvRXnHwvd
 2juXAzxYMvURmeEcvpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfXxe6CJ+v0YIKu
 OX/RWscK+1OQK89tFd7A+aEduMM3vRRhTkDY53bVA8lDH/2cJvKm9JEO5kAokEBGz9Vt4j03Ila
 Luey2kQ2LnPtlESfqSiDPi4yL0HSAHg=
X-Proofpoint-ORIG-GUID: eI6O4fZolIwufujWBPLj5AkO9aJOdFww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150016

The WCN3988 SW_CTRL signal can wake the application processor on the
Shikra CQM, CQS and IQS EVKs.

Mark the WCN power sequencer as a wakeup source so the driver uses the
existing SW_CTRL GPIO as a dedicated wake IRQ.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..c7b894b6126c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -102,6 +102,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm4125_l7>;
 		vddxo-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index ebc3052d57a9..5edcabd9dae1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -85,6 +85,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm8150_s4>;
 		vddxo-supply = <&pm8150_l12>;
-- 
2.43.0
