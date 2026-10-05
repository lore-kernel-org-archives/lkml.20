Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A149337B020
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193713; cv=none; b=fM3stm9LLptQo8WsTU/xiolpYx28vRV09+EVljt4KcAMciiw1Kr3Cy9xIlD1br4eXdlTpObSB5w42PGh8KGIuHNOYVfkJQEOv25iLyplDi9cDvUjU3bTVVKoRpilYtVSb9vpsyqmQj1aXWkge197aNYgVwtMVOX0KNS9XoF9Fyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193713; c=relaxed/simple;
	bh=z9ZKfJBnvHjkl0/CtSeNAQyka9+jUFUILVKgLbgudgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IGPpWfh3ermpQ4rm8FplHNr0Hul4VTWOxT8Z+tAG+jPzflrL1DMwHMyERtgv3knN5BtRbb1GquAv+CXGsIuSek7JuxrbkszKd640We/2fNOe8WFdSxBZVTHVOs4te9VL+2E/IcmijIF+dwQ3uXvnbaiBBobD9UvOWS5qMW9CMTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPmdwh1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6n3OFuY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPmdwh1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6n3OFuY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xj3P1504975
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 09:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AT0s8lSVdlJqvZFz1ZDNTq
	fDoFU3JFa5rAxP6+Em7Jo=; b=iPmdwh1s3f/KG9XykpJH+iUaEJwmFTMJJ78aAg
	DNmLKn1fIWJLZzPhGWNXXiXZY+MKOrdbS7/zsnSXdfMA53O33+xXPZR14cn4LyTw
	5jcnTPSNKTw5MPOhOc7P17kexD2aFdegzSrPOmTBI6w+juNEHNnVPSyuoqPc/vPf
	PFt8Z3oWqFDBxmcjK2G6m3NPLuv8cfDg8QidwOxWM/HF/24f5weK/0J3Y7xbgQX+
	3N0N7vGcLLqD7QStd/WWvjWBr303B6rEoDQdfsLI+RhUrBjobZQVeKILosaZ34kF
	nY6q2ue9m0oBWyxYgGan6OJr7pKO5zJI6cChNnT4Vyi0LyHw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgysjva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:48:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc51591102fso1176466a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791193706; x=1791798506; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AT0s8lSVdlJqvZFz1ZDNTqfDoFU3JFa5rAxP6+Em7Jo=;
        b=K6n3OFuY+iUUGYrO1Zxb1U1tSpBwrKs8tfbGb9R/Lea2G3U8C8Ks3DbKfCUbpH1oDY
         WpSSFChbQdwQdv5HLNiEQ5TawkJ/rRpz5yUEc8kunMfj6yHx62gZPyl3DJwQeaGvpZEW
         MHro+pUGD1p/WUzInN2Bd57Ikc1TAOyLuS4HPDkl6UFUonqxmOaHlSZc8mssL7uuSU8i
         pCzcUy09e6PhqbLxurjJCfMdbytwDkful2y9Ipn65HaLyHJLli2wuwFxMScQ0szZ+mPS
         u++x/okKGMiuCWxy7Wywbm9AF7+mYLHmVPsQ3agX4fklQ81qVxrIHJUcTRhIOpB014Qj
         oTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193706; x=1791798506;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AT0s8lSVdlJqvZFz1ZDNTqfDoFU3JFa5rAxP6+Em7Jo=;
        b=QnD6+FjjPyw2CxyiJRyRvOrjn9QWuc8S/fV3+aROIUeuYEoYSDFjQIynkhlhF2u+rI
         TOZHPBQ2j9YRUwY7+BON60GDdNvOri7gfouPYD4jTu6WP22qWA4Z67FAkoCFeR2WPGe/
         2kWiKMqTfBpu+Pp4kxw/aNkEuk38Ps4HIfrViTueBYaFp6mADylJPNoQiPYtNppHcs3d
         z0axtC4sPSfbHgkaTJxN/PV8H+3/Pit3KEu3xuYJ22eZFFzIJpsYORmuuG8ILbVpdJGO
         e5/48dfYd2gesAI3vMAmmB9p/WofbHQPbHUE0RkP0kbODWch6/oWIoVuX2XT0gMY/DP9
         VrsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOaWDAYHGjuOrkLL19LPZx1r3BAr6EPx+fhaUKLnvyh1K4xUDfLZSdAkfh52pacx29PJkyApnhi+ncY70=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCg6IOepQUlWVPQtjVh7jiRRL0ejSLae2Mg2q/+sXYCr3zNwro
	7CpZqWR41gKzrOqdS4FGEMYCkVWnG4l+iEfhtDSRWYztcQ1di/+4Ma9d+KvkYFYYpIft3sAdDl4
	q9slh8erPLhKgIQ2U7b2lB6zqXVPsUm/nU4FHeHBbDU/zsjWiM2LKG2y8jfyWHyrVl28=
X-Gm-Gg: AYBFou0LAt2ehyIrNGaAIvdBHYC/zGpuI1PDrKtqj3HKMXN5KmSkUNOltNAwHKHnwR2
	sFRIyjuGl6yyYHxQtwBu6vsvYQpY2aaoBN/ndIGAMkFZIzZaQm4fs2tTwmJQYwEnQlk0AbeWBrb
	mdniAt4SI7dSpZJk/YAEe6ic8qFBpRMnAshB55WIyNAD6tWJ1Dnv1kg9WwR4x0en98zSOJkMCFI
	f+5RnF8gogu2VZxWTNyWdPmN/5zpBi93K9OqH2LuGJAjbFu1ZtPs92Gb9MXs67sOCp69qUuuSyB
	jHWo8K3n87dHUF+Xe92wPAJZd1ajdTXj4Op4suODkCAuRJX28anwyjU3nh6LxxSv5YZAaj9MYC/
	h7PlLbECfQyv7Ok4xcW4gzo8SN6kNzQ==
X-Received: by 2002:a17:903:986:b0:2e3:39e:188a with SMTP id d9443c01a7336-2e49b81f81cmr86730645ad.60.1791193706218;
        Mon, 05 Oct 2026 02:48:26 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2e3:39e:188a with SMTP id d9443c01a7336-2e49b81f81cmr86730475ad.60.1791193705714;
        Mon, 05 Oct 2026 02:48:25 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecbed5sm4751605ad.47.2026.10.05.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:48:25 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 15:18:09 +0530
Subject: [PATCH v4] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-bt-wcn-clk-enable-v4-1-efc9f9be9119@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFhyw2oC/33NTQ6CMBAF4KuYrh0zbQGpK+9hXLRl0Co/SgE1h
 LtbNDEu0M0kL3nzvYF5ahx5tlkMrKHeeVdXIUTLBbNHXR0IXBYyEygSVCIG08LNVmCLM1ClTUG
 gMsIklTLSmrPwd2kod/eXudu/s+/MiWw7QVPj6HxbN4/XaM+n3j+/54Ag0RClqY0yira196trp
 wtbl+UqHDbN9OIbUnOQAA5rrVChyGWWxz8g+YE4Ip+DZIB4GOFxIo0S6xloHMcnROLVcF0BAAA
 =
X-Change-ID: 20260925-bt-wcn-clk-enable-9de068334aa1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791193701; l=2644;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=z9ZKfJBnvHjkl0/CtSeNAQyka9+jUFUILVKgLbgudgQ=;
 b=YHlbBXsSKKZFtPOEVYK/CN9/MWG9yZm8hYxXZUKRDRs1dad3ZxH5w11dNfSYCaGZak5vX1CBL
 VNH7OLYny81Cw2+xy3jkx27QRkemwQaxQuMRmruaYhKGmSGldjTHgqT
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-GUID: xZn5vqUFXnSC1BJFrNege-9VlhQlwNP5
X-Proofpoint-ORIG-GUID: xZn5vqUFXnSC1BJFrNege-9VlhQlwNP5
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3726a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=AAjP_CEppu18DpECG8EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOCBTYWx0ZWRfX1WLQf3DCvnKG
 ekK+kYzNUlA6XhcItE+k66mgQ2UwnjFyA8cd7IsNgbndlq96oBaWNNVPF15aaa3QynsX1XVhsso
 yCG46Qf9AbG55qf4109xmM0oVkrwGGAZy121/WiFHR0RBg6jDXGglPqQFel8PtGzhg9uk4gsZPq
 kMLL9eElHiCC2g/kA0fOSh3Wu2eFaZEJKAEx6z/fCFzXbtyuMjbg8ZMJzhh79zb8c2mjXiykjru
 DmLAAw+Ge0PF542duQLXAH2XzU3r8bDaxwLiEMDiUEJPjLxjjpmeiAuJb59r+SyXW4S4OW9+krp
 g/AMiKTXx9LLPFl7dP5g3r9tImHOgCucgb6aYaAsoz+dPZe7bRCgQ5Rx++BSEwjI3DJdGlIpA+v
 KaytrlFPHWMLHXjumPE0pf8TpuFTIwiWXxuvUPqUUCogp1B7oZROmGX5ewzLekn9L+R8fi8Iu0J
 7RBcUXX3qzrLttIoL1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOCBTYWx0ZWRfXweiUmuwgm8Sq
 Tp00tysD4yv3cNlPrypKBdo/5XKGzwx20UBBSdHeqmm+TwfTCpLjtxCRvMmNqGJjf16cUcA9uRX
 IAswSzMkor539CHh61901MMk9xk4vYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050038

clk_smd_rpm_handoff() votes both active and sleep RPM resource states
for every clock, keeping them non-zero until a consumer takes over. On
Shikra, the BT WCN clock was surviving on these proxy votes. With proxy
vote removal on QCM2290, the sleep vote is no longer held, which means
the WCN clock must be explicitly declared in DTS so the wcn3988-pmu
driver can manage it during power sequencing.

Place the clock in the wcn3988-pmu node since the PMU driver owns the
WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
variant.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
Changes in v4:
- Drop cover letter description for single-patch series per Konrad's review.
- Link to v3: https://patch.msgid.link/20261001-bt-wcn-clk-enable-v3-1-19291563b927@oss.qualcomm.com

Changes in v3:
- Merge technical details from cover letter into commit message per Bjorn's review.
- Link to v2: https://patch.msgid.link/20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com

Changes in v2:
- Move clock property to wcn3988-pmu node instead of bluetooth node.
- Drop hci_qca driver changes; clock is managed by the PMU driver.
- Link to v1: https://patch.msgid.link/20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..48af2bb87cf3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -45,6 +45,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm4125_l10>;
 		vddch0-supply = <&pm4125_l22>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..90aceaa6e1e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -52,6 +52,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm8150_l8>;
 		vddch0-supply = <&vreg_wcn_3p3>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";

---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-bt-wcn-clk-enable-9de068334aa1

Best regards,
--  
Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

