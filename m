Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783290;
	b=3GnzxE8SRQx9XLprl4LW4W0ys7np57QYep/XEZ+SGAg7UPJb4bYujLoBIfyR7qIkRvoy
	 gxxlzKrAkHhPzvipS3V3U3N/BElwmuc2renhggqShOj1xO8MEQ4CSArOF2tfhdr8ICxDV
	 aceKqb5SHcsXaCyHZ7rDOK+4R70fSQtZ5NvW2fH6W9MSKTUw8yRLPkSE6l6xZcPmBGFUN
	 RplY4VTrfFlJVOTLp56lRbjxOvc2fzd/Lri7CJYmDuF2dTnOLEr3WBaCDnacs6AhL8hMi
	 Jv8/n2UvgOgEI5NBpFOr3C7CSUMatofUPmHkFetqdkL+I+thudPu7XZWK1jDguyYNyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
	b=PvewabuqMOa3X//3FW+pz3fllg72wCDLGBkGmRIgz0oBbFlRPOaJtY7dtpnfsLxpQN/2
	 v4PrtrB0nrwrMYo/FDsyfZ7ApOA53wZMbyA1d9M+ZhzGFWwIvRgve6+MRRDDwvAVif5Pj
	 +DIF0oxK8v8nXLT5vtYQshxSG4uSBHQsQ0X23jFReP2ixvdXVi+3hpghdsoMd7fU8pi1G
	 sH+VHn4akVOXr8ViBKOD87xKzA4vAweWUAHFEu5CHBtyVVpEWiLNqhdfq8dYw49+OWP0t
	 QI23Gc3d4LdbFaT3+goOxrpDeM+Z2+ycsG6Nc+4QfzZZIf1siBHC2P28XIgGsNndkQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Szh/pzCY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TtMckRfr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DECB606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DECB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Szh/pzCY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TtMckRfr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KK1B918403
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dIHAyqbJuJM8xf+TtEAHAZ
	7qkX+1IxTcwMBz+ggyJ94=; b=Szh/pzCYqzI6TkPPX1DEi95U9EljTdBKKGbPKD
	SZwVsRTYslQaY5FRA3++Q/5jBvlXwq4HVUyPgXNdOyawhAJKMQX2D/fr9sCJ5bt4
	42UxcLLwHovmFRnVwotdSEQBAlV7i/W7Cic0VtNb8CDeQckMtI2MrMnjmYrL+FQS
	ByD/LFljdEgC1Y/tI9IqEDvm0sV9FQroxFPWkj+AeyoSYHVEyP7JmQmKMzcfVW4j
	w+3BNhiLhKRzcD/cWI7NXkNd+NSl5OVts31ajapLoVjccuvX2xQ97t8MmKvq7zEd
	52DytzliDoojXSimvM4Hd0tMhxR6mqOIwgv0srUJHALWQlZA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg99vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:08:09 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-844195cc415so787623a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783289; x=1794388089; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
        b=TtMckRfrXNA3Q1KwoR8Xz5rkE7HkU7+foD7JtKSn/qn3MRh01xgemOMexroUuulnXF
         YBHHXW5hWS63itZpZ8FADtnUWyvlSm75eavuF3pUUySX3+hsXKiSdSDCppDTB5/nxFN9
         w8W2gZAab13FtB8Kr8BQVKPcVYHoQJ29E9pwonDbnWlm19f0g61TjJS3NV4lXgCgkK6b
         8FshAD0NBsOlTWTNNw9GgiScPZq9rNnaQkQJDbP9z/pkog/G1Allcf9oQ7iMS4Ibt4MJ
         GkGE9fyV/QeJTIP3oMoCtMt9iptLILu8EocQAHDXL4EzJyw3/VlCkIWcnlqRnHP9qQlU
         2z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783289; x=1794388089;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
        b=ixwnAHezxw4J2BvGW+/Bc1ihXLZ9tkv2j8sotyi//ASD9RwdjgnwC62uuJGmp+dzS+
         24WQXYVSmTJvhQfmc+qoTZG8q5c/SiCN5ZsR2sUu+uvrNehmwki62GLCLbXCdjJjtWcw
         pZKjFW+HAbdnnEDOsPurB4HHE5cafnYxGBTsXp/CpgmPrjh0vd8nSExzbMZo9gv8YXsF
         66BsEaIDJcuuWIk4HJM78OwWCabSK5X23c0+0BSKXpvLVCBpJzONJAfDClgaA2uviarc
         K48TSB+qR6junwYsgAv1Xjl45rnQ6NJYJeIRwuSkvsynoCY0RWvAYkD22hQXLaOcO/tK
         p15A==
X-Forwarded-Encrypted: i=1; AKwUvBzex7RkT0s03JpT6HhIbDF5XdYeZ+WnAM4Fj13lfRfSlNWZxOF1fD0bt9Oq5TmOsadyIAWWRzqQ4M/T1TM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1tExPskJoMxCjt0fktyGieA+uDKxGj7y8BEYu68cmLwuMSQef
	h2zgANOh2LvjdSsZowMdxOlqTSN9fO3/uztk9aBiUTf8Ibi2fahfW31PfPvG0l6eEJwu0U0nq0Y
	PEVJHNEFO3KMwKAUwCiROOFndVw84vHrJx411PGtRie8XDboLNjjERjjYeQUOG4BHfEs=
X-Gm-Gg: AYBFou1LRLhwvH1TBHo6UWUhq7lW2vsTndtSCnP2puNRqDdhMRG/kCNju5UAnp8mkme
	QTXYXeMh0VcSOgY0gdBislQdLRdeEcJ0UmvG4JzGNbqKBeFOI8lcFYfsLvfYKYIIzczom4FnTBE
	a+9YHyceJdQmqs0+KUUODFrL2Bf7gYZ2Z3IkzMmVx3lYruvhOpbcPsNcvlQ4vYW5VRSSupRl8jn
	SqUYf9GZbQTchaeOWB3404zfYl5wU5xADPraqdceyFs1TCmgKAyhCIJy9C9Z/O/5WwcAyfG+4TG
	jH4nt4RN3sBl+c6DkJJchw7E6P5G6v7cLpDPA+2A977j58LyZ5duHkBoHpMqRO9OOo8/U+EoBbY
	cqDhk9PO8fZyx7ucxGN7aCRiF5OPMwAeDo2fvt4hrbMSxdDZl4HzB8WystJVIWMQShjy8PCETXz
	GreIJVDns+GY2bJzzB/RA=
X-Received: by 2002:a05:6830:6512:b0:857:52f3:a5fa with SMTP id 46e09a7af769-85d361162aamr12702450a34.2.1793783288698;
        Wed, 04 Nov 2026 01:08:08 -0800 (PST)
X-Received: by 2002:a05:6830:6512:b0:857:52f3:a5fa with SMTP id 46e09a7af769-85d361162aamr12702403a34.2.1793783287669;
        Wed, 04 Nov 2026 01:08:07 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:07 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Wed, 04 Nov 2026 01:07:59 -0800
Message-Id: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/16moC/yXMyw5AMBCF4VeRWWui1bi9iogog7EoaREi3t1g+
 eXk/Bd4dIQeiuAChzt5mi1DhwG0Y2MHFNSxQUUqkTKKxTKeDvsBbc3UQhrdKMxNmssM+LTwSMc
 XLKvffjMTtutbgft+AFq/88ByAAAA
X-Change-ID: 20261103-phyrefgen_1104-1b4a2e9b7918
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=2118;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=k51MqTDW41CB3iyARbpzUvcgecZ+3Ncq5B/uspwZ0zg=;
 b=/Uf3U/8snPQDj1QVx/LHnLiITObnl/oE/Kcv9acMok7n79ZjF6k7AQ6qY2vodmPIUFkyp73JS
 3EVNn1M93wxD89fGAl1W86kDs8dxMACqJRG2THI13Z3M+L5OhNRgs9r
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeaf5f9 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zVOB84EVDXTtx2zVcRUA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: VgilV_MZLHdCWM7wzccpUv3l0L2zkAlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX6LdlAzja9S+q
 375EKOnYRiEM8BYYy4cMkB98dUb2QzDp2jy2wGq/zrPMoJj4NDKA6zqB4jNfV+Qt16RuIR52phN
 66KYUh+3/5XKY63Y6gWqhZqalGRuIXwIirQ3iEGo+FkS1/wYVp1OVqkPIBVpjIHWJgi9aSdaBcJ
 xW5RcPDGRR98WOxyx/jRJ5oXYaTrEZSma3pCN7nsp3rLcXlQTQwbZPnIO3e3wqxHijW8izjKvMJ
 QWyUEh2iZTEd+dLwgUkyskQg/sbwfQ+uE1aloulYr2yi3mrnod0uuBzu9iIs4cFeixW2e46ib7u
 C1dcGdsMM0600q7F0yN1XeV8+BJSVh5ut45TKaWsss9Nz2+00Sv9k1qQQrF+/bSH+vQiYUIePir
 Bh1og7/roYtQn3g1/SjUoeZ0CK/Jo7IozCV+Pgr39RWx1tnL9IGu2GeriEpzbl6/njUh6Nv7ADs
 0ZryxxvKDbCTPRiKP9A==
X-Proofpoint-GUID: VgilV_MZLHdCWM7wzccpUv3l0L2zkAlE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX4FERmWnwvGht
 Xa6FXyPTW1OSreoC78e4oJ4KMU66iAsvKMN56B8fRHrQykGjAX51vDXd7ibwg4DqDjpKPtrA7MR
 bfCnWJlhQ7z6txAJJZnf80Mu/NUDVro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040036

The PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Changes in v4:
- Add reviewed-by tags.
- Link to v3: https://lore.kernel.org/all/20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com/

Changes in v3:
- Add vdda-refgen-* porperty in all glymur and mahua board.dts.
- Reword commit msg.
- Link to v2: https://lore.kernel.org/all/20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com/

Changes in v2:
- Add dts patch in this series.
- Reword commit msg of dtbinding patch.
- Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/

---
Qiang Yu (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Add vdda-refgen supply for Glymur
      phy: qcom: qmp-pcie: Add vdda-refgen supplies for Glymur
      arm64: dts: qcom: Add refgen supplies for PCIe PHY on Glymur and Mahua boards

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 .../boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts   |  2 ++
 .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                 |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                  |  6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                   |  2 ++
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     |  6 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                 | 12 ++++++++----
 10 files changed, 60 insertions(+), 4 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261103-phyrefgen_1104-1b4a2e9b7918

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

