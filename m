Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B8243F8B5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344581; cv=none; b=EhZqwK65p0V5Ss7b/UIGKcM/+sGSiwv/wHpemK8tXj6H+CgxVzbBCrawhkd4KEd9Fs01Rj5+v1z0y8ItbKIfQI8hm8vIkcb4DbltyZOKAzuoHDKj5FP3mhUcgtbTuSWD0y7whiXqMGQTww49EHr+eCgMmhEWLFo7OBWZTcuqG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344581; c=relaxed/simple;
	bh=5EDSihuwvQgWSY+SPpNz6/lXB4qk7JQjbpKZPFbUOT8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=du8pIESt2+jhio5AnFEa1L/x8bBxXH4NLVTNeV9iZ+fcaMxz2Xr0gvy+/fuZGvNIEmW4G4T5g1wm8+ZXrglHv/bYWQk/Xhy2e22vculR5blvzDKRgy+lR9H3PPDaEAX6lL6eePCrXzwnygn6E51O5TUopxxjhgImyXQAFlFpfFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOJaXpMq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPGpV4EO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOJaXpMq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPGpV4EO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NDUa463911
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I3c/ez/BMeWoUUBSmRfHIE
	4MlPNloLAq9rhccCmFjVA=; b=iOJaXpMqflaDVWYFV/LFwYJL+Risuil4wD8IVi
	K6vJsljuSly9nT4ZggF19lKeE9FVCJeqWtmfPFRDV42X8uvKTlkag2SPOXgzz9Yv
	OO9cBmEtqP15jp7Fn7oQGxSfmsLm2kTJXpMQFXqdkKLB5kqHzI5P4NrYEFh9XDZO
	kycv1rsaLF/RGhU3fsd0LgjkUGX5LY5bSJvDG/XgvcaVXOaTyDqS1OxFXlT1g/e6
	NHsGOJwDXOAbkpFmPKHuJokUfQSNq90XMARDzd+7OEU0loXMnL9f2ven3T6g4LiE
	ZTcX2kgqfcRWF6QPh3opfAeSb9u/tA+XaM0GrSzNYsrhfj2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k3e2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:22:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1357939a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344570; x=1788949370; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I3c/ez/BMeWoUUBSmRfHIE4MlPNloLAq9rhccCmFjVA=;
        b=LPGpV4EOfk/7jN+SKjIPlzeo0otFUSP4R3WChul/nyGe0SEg04Q2vZbwf6Mz/1SdPB
         CwXn2pa5mnUPsG5OJM+kX7m12VzlrdiPmNOP2R4orsW60KJVeinSPCdB2SOOrJ9CfSRm
         t0eKdLTZyGJ7le3FQ/wIVBuZF6aFJlo0MDhnkh9ye7KCsRTWb7F4HHRNyGNt6Ih0Zwym
         sqZZvpjHMgoaNjNulBA9+jBgA3vRoeJUAxindN3YKBbgQwGBeezPDl15jHuASp33XVxT
         Dj469cZwU5KurokJJcXBkcFEBm+mPRwD80RRqnFCfsaRxfOC/ZaBGlZVz1897oXOeekj
         v+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344570; x=1788949370;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I3c/ez/BMeWoUUBSmRfHIE4MlPNloLAq9rhccCmFjVA=;
        b=KmcKfY27M4mcSHNQ95e4BQ63WKZdxyTOKl5pE7rCZZq+FqMLlT/9xkuNjwRmzFOQGa
         oxVCpeCk8RL354fUVloPyiDNnaxHHw7v/i4iaMQy6NoNBQK7UjBk2mIdc6X7ET9tFE4F
         StYDy38yyP27qmi+ysU7ve1H2MnV0sGsdJgEyVhyWyeT4rdFPanKn8/MPDPojJFttXqt
         rR760+wSzdtEKQj7MQQWgv0FvixjdkE/FLs+uE8tPrECfc1mNshxU/8ZEErE42meRQXp
         pKROb6k671tMUM5DuCX4Kj8nADiJcA3Yb93i4laW7Oo2mrt1VVHbkoG0xAukpbmXvgnQ
         zJ/g==
X-Forwarded-Encrypted: i=1; AKwUvBxH8kOPbp+fNXJR/0qw+qtIfWWLmUKzL8bUzN7GhsCjDBI1qhVU0wasC79InpiT0odOiAmkrI9I3tt1H8U=@vger.kernel.org
X-Gm-Message-State: AFuF++kLNnVGrdCE9EgpapgXZJNz74f2SznJ9xtuR1mN96FNe19ZROmZ
	t8eEa09Mz4V5/QmuRsH2AesvfXA/ufWg/ayOAVVr1gkB8BWS4pRzeZdX4YgLPaU8NRVc5AXWgsM
	erg2MebJB/8Rm4umorCHPgPh8miqfCPPCXabTs7sJpHBNVUrLlWNHyy9Mh3h/KsEKhGI=
X-Gm-Gg: AYBFou2gmhMw11OwXUfeBskd0Uhcgp/uCFmTlHvicqFKR7MU4QCk8M0LFiHeVhEpvpL
	htY0Z4eL45QzLAXgWM6haBYJ+6fLU5PSE8HmCKjwUsSHaPkBJ0nvhBNWzNaBYNrL+2pfkitvXOW
	99kJy/YooRJR+mkF5gfICDGRF5kN5wvEkMYjr3vyr+xwiFnlm0Vlu/XEpm+bPqAS/z5mS0vUJHA
	qGJptcscRLjYeJChZyB5brGjaM+HRSMvmjxZVOoRvC3GiFRpYz3vtLqZvwSmhpQq1fsbCwFuuXl
	WFP9KG0DUZGoJTQp7Oc5KgtDio97gC2cXrYS1/d746kPhAdvMm6eEU8d3umtFQoWf3ZvPMgVS2Y
	APOmrcXLuA/1fHmuGH+OAYeOw8Br0IqmY5dKFPp3Vm20=
X-Received: by 2002:a17:90b:544b:b0:398:b1b8:4719 with SMTP id 98e67ed59e1d1-39af650d2f4mr2411394a91.29.1788344570521;
        Wed, 02 Sep 2026 03:22:50 -0700 (PDT)
X-Received: by 2002:a17:90b:544b:b0:398:b1b8:4719 with SMTP id 98e67ed59e1d1-39af650d2f4mr2411345a91.29.1788344569996;
        Wed, 02 Sep 2026 03:22:49 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c0530sm5054861eec.3.2026.09.02.03.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:22:49 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: ipq5018: Add MDIO pinctrl and
 enable MDIO/PHY on RDP432-c2
Date: Wed, 02 Sep 2026 03:22:47 -0700
Message-Id: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPf4l2oC/42NQQrCMBBFryJZm5KkbTSuvIdIqclER2zTJm1QS
 u9uqhsXIjIw8OH/9yYSwCMEsltNxEPEgK5NIV+viL7U7RkompSJYEKyLee0166psOtLxrdVY9B
 VHbZ68DdqFUimQG10bkjadx4s3l/sw/Gdw3i6gh4W4NK4YBicf7zkkS+9fzyR03RFDcpoKerc7
 l0IWT/WtzRpsvTIooviE1j8AgrKqLWKGSlZaST/Apzn+QnXmJayLAEAAA==
X-Change-ID: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344568; l=2235;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=5EDSihuwvQgWSY+SPpNz6/lXB4qk7JQjbpKZPFbUOT8=;
 b=p9rWahbJldYJ9KGSr3NiLl0el/J7zXEw1/Tiyu8uekCG5B7CmimI+caSb7VZzhExR8UswICGe
 MgokSsjroZECwqKpwUWIKQFtjb1AHJ08YLg/tZdoIzJzTy7/3y+6T+6
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX5BNR5Cye2LsH
 3z9y6fPvnTnLtmPU2JpGec5cJ7Tl+ObI03pLTpKgcAWDGD3fNsFm5WTb5ceHsf2bDwgstx6g3cl
 TSUhKLzLvMHgjdixql8UZyKSPCs0xU12vOPOi4q4FkIVNz8IldVbDYO5QniHnSh4IUExFe2I+Xr
 yHvqnNwDJPotCS+50V1XPVhakvJDU44k5EAYkRZcexiq7KyXvhNLtHEgOmNRr39dfPchx1lVTTn
 Fv4PhcH1NKWeXj1zozv/7Ai1YI3Ae4+2pAsBYeqtUeeB2j/r5frYhq0DruB8Mqk8BkGEBVr7NeZ
 LYAoYrlkXocRnokNgc+Qqp6CFUvm+qdAs57wf/+hRNFLVhasCse7Xv7I37PuM9AjUSfeeEjLfPc
 WV0QCztQHPzzuGvgBVV6yWzB3EdCoAZQd0kk36VDsAX/5Prbxw98BD2oqzOzYOkFFx9IL7iBubI
 3oNnoIQDtaqozO4PxTQ==
X-Proofpoint-GUID: cTMhBr71ejveneZn7YBj-B195skvDAtp
X-Proofpoint-ORIG-GUID: cTMhBr71ejveneZn7YBj-B195skvDAtp
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a97f8fb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xAUZ1VDASE2o3DBDBiUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfXxZ02KZRlodOv
 GhcLyz7hcPipI65+EsH07f9SO+UdkkahcQTV9Bl8PmY3pQLZlnBW/CtBf9JECKbKpUXJmweSjs4
 7mXL79XbQcX2iruGVgpcX8xSu9vCoJw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

This is v2 of the series enabling the two MDIO buses on the IPQ5018
platform. v1 (this series' patch 1) added TLMM pinctrl for the
external MDIO bus (mdio1) and is still under review upstream; it is
carried into this v2 with a clarified commit message noting that the
MDIO pin configuration is identical across all IPQ5018 RDP boards.

v2 adds a second patch that actually makes use of the MDIO buses on
the RDP432-c2 board: it enables mdio0, used by the SoC-integrated
EPHY, and mdio1, used by an external QCA8081 PHY, and describes the
QCA8081 PHY node on mdio1.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Changes in v3:
- Enable the SoC-integrated EPHY MDIO bus by default in the SoC-level
  DTSI, and move this change into a separate patch.
- Add a blank line before the `status` property for improved formatting.
- Link to v2: https://patch.msgid.link/20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com

Changes in v2:
- Patch 1 (pinctrl for MDIO bus): no functional change; commit message
  clarified to note the MDIO pin configuration is identical across all
  IPQ5018 RDP boards.
- Patch 2 (enable MDIO buses and add ethernet PHY) is new in v2.
- Link to v1: https://patch.msgid.link/20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Luo Jie (3):
      arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
      arm64: dts: qcom: ipq5018: Enable mdio0 for SoC-integrated EPHY
      arm64: dts: qcom: ipq5018: Enable mdio1 and add QCA8081 PHY on rdp432-c2

 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi          | 21 +++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

