Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2573B37CD3A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936063; cv=none; b=hWcZO7pHSP/V3BHhgYHgmaaiQiTsqONCeklDLH3hXm0h8lVEXGPcAAjJ3IwEwppxJR+hoCW0s+q/13FG+9SbxZMHu7CLQsSIgI6KTX+QS50jDrthAVSGId7IrkSoOGczVODXH+YjVOaUI/4v4pYT16l6NkNNcc81JOjLYEVGa3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936063; c=relaxed/simple;
	bh=ds4eWBvPCrweP4Fb8r8NtlV+3o8YiZUPMnyIIVFzDJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uJNd/URa+TcQmbh5JYPPDLxuF7W0fHG839wExRG8gDrUfdreDSMQfIumcXd4YCK5yfZMVXpnP85h4LiKJi9ZlT4lx5PRONDBjLKoTlZRiO3YYJi9peO3QYC4d9JT5vH1N/rPi9DhHVsMkUsxHGPFrgdCNAF03NItNp+ZOIKt/1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRud9QuV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITu5WpCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRud9QuV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITu5WpCw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893oxAc3771179
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O7JhDSt8rTXrZoSLKAtI07
	K2VlsYQB1Zhvc7cO8q8ig=; b=PRud9QuVNSMu5zjN+URhgfdQINXoxBWgAoTAwI
	l7yVIyVyHYn5WyWdjKek9Mw3MMqpLea9M4nfZ81BsCvpreymdotKQhipdIazicMF
	RaAPFHRC9RpS8wMRVJuGOMsPSWZWVfrdMNC18bswI1ICqzLY9lzwTXYxxTAIfFWG
	HR0GSRuUSXR8xpuQ3PQVtzRrY6RJkvSWmwCwFSzYMsiK8MqNaGed+LHIGnO/FV6Z
	h6CbShaDEk6aFN54Rr9qPzIiTb4g+fErdtv/ZZ1bUHQrlvYi6BzAmIE53e2fZFvD
	p0DohWIjGLAlegynMnF5AxDawBkF2ypchYikn12Z3SGmDldQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr0jtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:41:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396638f9a18so4637415a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936060; x=1789540860; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O7JhDSt8rTXrZoSLKAtI07K2VlsYQB1Zhvc7cO8q8ig=;
        b=ITu5WpCwzQ/xS73V1zQrYTma91aJAhn9Qc7vsu5OCJcQ0eUnpbRkTm++Nm3I5mRwUD
         OAt856KplMwyjRl8lK+7xUhUEb7fWPf8sRc0gT2sn+DbOQ55BpF5U2dtRApAhMP/66AC
         //Yg50L8GtuncQI4mQNlW+M5LbGszmg8nYMPZLKyI+LFhK+U+s/6AcpCQm8YYEglIz+V
         7e0PLqsKOA6NDe6qpxhUY+DhMjV/d4m5UfHOIxZOYoMNzQmfydIPiNacQVZb6XsiaiPJ
         +OVuYQQKezIFaLb72SDH349OPbdIrhoWu/JQrT2voiVBy2dVHa5gWTcGuB0vsofjAczm
         6ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936060; x=1789540860;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O7JhDSt8rTXrZoSLKAtI07K2VlsYQB1Zhvc7cO8q8ig=;
        b=dIIl+frHpN0wjMgoEQYZaVbg9VQsvGEP9snjmEWVJB/jpqqkH2faFtffnh6cyasOkX
         URd/8pS/KbQy+jw2pgiAoyqu3TE+wZiFmFnGEn3mGeMLLyxHgM0zvhUuGi2UKN8EuTbu
         u7x2onwcF3DjwEawDSQNi7KaFostg0AnQg8VZTquGK6h1eWszBTlBM+VMHudjTyMEfcw
         csLG/SG8PZk4hIVCv8/lSjyGUvXvfW2VRm2A3+QNCxsJ9k/KFW7t8uZs4cHZz3y8j5R6
         OyWvkNMAXpQsCFAYI0bifWpYZ1h3wg5fvIHWDt5zrdKGIiUsA7YtArM4m7cLmwU221kp
         n0tw==
X-Forwarded-Encrypted: i=1; AKwUvBymMS1kPt05xeqA5Nh8NWyQxKeOUJl411REtAkwvj/R7IJW3P9ofuOud5FN0qgaQu9gGzc6ZIoxRzvnT9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m4WGeb47gfcj/0t4VR3PKJth8APkFhvX3w6npRCbp4fW1ZIzZ5
	pkWbeA4aKp8DS2FieEqXQ72QWvg4KNp+EG2rO3t+6ZYk7c43AloPxOTuzw9WXRA2csGmo+XJwBI
	wqyYTeoPP5VYcPylUmTSQNksNuK2FW4c9n6eDuhqTE5Y6oDnqMvXzyUyv28MiXzbCbYg=
X-Gm-Gg: AYBFou06rVI0/FYFUIcl++O117LLr+lsFcmBNKcP9CniT8HmX6rMS9LRv/ViBQpQH2B
	gCscozI/RbN/D3E8rKL5lTgxOj8i2PINftVyTRttXmEqPwQDCHI8FTCilSHLxZofq8PcMO6t6uv
	PhObfbI34DK5shYH1No+FNdZCst5mP0OjYxhuWsgwM/4JEmRJPEPPq46qPjH4U02N4LihAZuBVo
	CVpsVlA2NCsp4nhGUAg0aW/Q1RmP4qP4RMEQlOin877ofT3cKf+gpESkooZedHIvsoiN/qCTTyu
	Bu0GgNg8YKjP1TlaZIaQiS785O2HcqOnJSblWau/+wLWP60b9T7GLkulSL3zhdUnq0DpqKPKd+a
	9gsBtwK+gf4awziJDOmVdnCgHvAHqhVRM2ZgrEkNQzWz5vY4gh+2JECFkR5pZCR2w
X-Received: by 2002:a17:90b:544b:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39b26203e7amr47728876a91.15.1788936060561;
        Tue, 08 Sep 2026 23:41:00 -0700 (PDT)
X-Received: by 2002:a17:90b:544b:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39b26203e7amr47728810a91.15.1788936060048;
        Tue, 08 Sep 2026 23:41:00 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm35553014eec.4.2026.09.08.23.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:40:59 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Add Glymur QCB
Date: Tue, 08 Sep 2026 23:40:51 -0700
Message-Id: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHP/oGoC/23MTQrCMBCG4atI1qZkUmkaV95DXCTppA30xyY2W
 ErvbloQFdwMvAPfs5CA3mEg58NCPEYX3NCnyI8HYhrV10hdlZpwxgsmAGjdzt3k6Wg0BeQV10Z
 CbiuSBneP1j137HpL3bjwGPy82xG275sR30wEyqhSFoy15UkpfRlCyMZJtWbouiwdsmmRf4QS2
 I/AkyCxQCVkKbTEP8K6ri9YzgTk7QAAAA==
X-Change-ID: 20260711-glymur-qcb-1e2d2bc913fd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788936058; l=2402;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=ds4eWBvPCrweP4Fb8r8NtlV+3o8YiZUPMnyIIVFzDJE=;
 b=Hl8RU7n/KtbI16MDrn0jR42e7/34qWFWpwzuPKsw2XA05p4czi0G0CqzgzFTjvoVpvAmU7q2L
 g8A1+l/n72WCQDwk1hPHOTwoUJxSAJVu39hugD5iBSPgJrV7sQQoxWr
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa0ff7d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=emiPwNz2bb0dLlisEjwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfX7umwklglY7MY
 AIJyxTVS+Y61HAbxgrtIKIkuh3yvwQRrBPswS5VHC1yVieab9BWTzJpiKlBZpP0y9cs5WBX1Sl1
 TQsmhqFYvq/7hqY8H/4sW/DyMzwZ6Xdlq6FrfghdExuHByH96vqJasoGdBK0gIlJ6tpXDrM5GEo
 /uQIU5XN+X0JYcnKiYd59hx3vrEKkzVlM+EKZghuUJ+nKT/jVtMAjblB24oVY2eoJ0tVHEZ4jMu
 +91PLIPHUtMvLyICnxsgUbqkx/6ujXNx0GeyuCu07xjWrCcIWzpVEgEy/u1becwC9KVm7g2xBXL
 Q3oRIvZTsaIci8/O8Tio2jY+64lzsGAO2wKXZnqo9qH355/jcAYp27NUYShER8pZThIrB1j/YKA
 X6G+HQc37Le+JWfkRLjslXsOMR3oVJT0+FXWgIcxOk9KZ+K7LrXwAtM7pf554NkrlDaAYKni52w
 AClTZaPqCZINP/K0YVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfX8XAZoyLaEukr
 OaA6j3noGG5V5rLx40FKvquUB1vhfmlbXAdh3U6BN2vU0YomvT8GutEGJHaNbPIb90b6HkZH8bu
 gRi0F5Ok3mQnnfitw4I7g2v8nvbKso0=
X-Proofpoint-ORIG-GUID: hKSvQk6e_Uon9ekIqtDc6Ge5kopMkfab
X-Proofpoint-GUID: hKSvQk6e_Uon9ekIqtDc6Ge5kopMkfab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090073

Add initial support for the Glymur QCB (Qualcomm Compute Board), a board
built on Qualcomm's Glymur SoC.

Unlike the CRD's closed enclosure, the QCB is an open form factor, suited
for bring-up and power, signal measurement.

The base support boots to shell with rootfs on NVMe.

This series adds the bindings the board relies on before enabling the
device tree itself:
- Document the qcom,glymur-qcb board compatible.
- Document the qcom,glymur-qcb-ec embedded controller compatible.
- Allow QSEECOM on the Glymur QCB so efivars and the UEFI-backed RTC work.

Features enabled in the device tree:
1. Board and sleep clocks
2. Volume up/down keys
3. PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
4. PCIe4/5/6 controllers and PHYs
5. WCN7850 WiFi on PCIe4 and Bluetooth on UART14
6. Embedded controller on I2C9
7. ADSP and CDSP remote processors, with a firmware path for SoCCP
8. TCSR refgen and QREF reference supplies

---
Changes in v3:
- Drop the prerequisite patch IDs and message-ID since the prerequisite series has landed in linux-next. 
- Rebase on top of the latest linux-next(next-20260908)
- Picked up Reviewed-by tags
- Link to v2: https://patch.msgid.link/20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com

Changes in v2:
- Add TCSR refgen and QREF reference supplies to the Glymur QCB device tree
- Rebase on top of the latest linux-next tag
- Picked up Reviewed-by tags
- Drop Konrad Dybcio's Reviewed-by tag because the patch has changed
- Link to v1: https://patch.msgid.link/20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com

---
Gopikrishna Garmidi (4):
      dt-bindings: arm: qcom: Add Glymur QCB
      dt-bindings: embedded-controller: Add Glymur QCB EC
      firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
      arm64: dts: qcom: Add Glymur QCB

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            | 699 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 5 files changed, 703 insertions(+)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260711-glymur-qcb-1e2d2bc913fd

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

