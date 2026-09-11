Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29B43F4D3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109352; cv=none; b=UhWNCuYC+lGu++F6qO0uhfr5gs5D9aSMvHevUqtg5zTxrVE7cQAcX61zAwWLcZXWADbVVyJGkV+fR4XmRAENKdSa9kNjNq91r61rHCcdj+cdUjPMQgMhXhzdgfAmEf1BQ9+ugmoeFLBdsdII6qXH0kO33yYSbRT9jarANBKf1DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109352; c=relaxed/simple;
	bh=NULX+1XQ77Td2Q136fRdbK92n4Z0ZUyf9pgBdD0Rtt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jiro80QNpeCB+3YQjnm1azPUCIsjxj2aZAs7NXK0/CF2eX5TIChbHbjHeayGzISoFZ337tzcWqH4Hd2aLtqLWCun6EDFUYQA+AqT1Ua6Ly8+LR/6AJCe3xsj2x6ZIm5PYqcWrlnnlzrKf4lyETmeUjjx4RC9xSbJch357R87a5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHPGnHFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frUURjx9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHPGnHFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frUURjx9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kRQ73909172
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vy8W88a0VFCDOKzf5fdSGU
	EkZyr8c6w9FqVojwlSvyg=; b=hHPGnHFZHX3t6/S9pveWfpHtrgF51Bl1fKlRHe
	MuFdGGRlgkKFh/28ssx24jS++0bqHe53p94gar4+gr8zLPn+YAtTQqojJfuLXyba
	4roFJ6NGU0ElhL/MurI/2W9EhQWH8S4pnQkTVGGe8inLHIf6ruEpB/aC+m215mtq
	yYRBmwRgchelgMnB+xdb9lSJ1MrEjUsANbOIHpKy537LXpRAdaqAxvXMVXTpJh5x
	1kTO7MA8z163sUXxV/2JFqMIXdnHr9E1PvgRI+sH6NV+y9U6pi33/5R0a8OqF4Tj
	BwpxCRen55Gvbs9ehw+vu6DXsyH5Qb/3W0CxYq7QdUX0w4vQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q1259n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:49:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso610220a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109342; x=1789714142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vy8W88a0VFCDOKzf5fdSGUEkZyr8c6w9FqVojwlSvyg=;
        b=frUURjx9iTqwzYKMEjXoH8ijIu0DtTWL3H29R7y53hM2OXu1hEwDgoeT+3oUiiM5Hs
         je96Pp1OSybzlHl6F76J0/OwZhae9cFNrzB/I4y3rPbbjVYZBXEQQk2tQXkcxNVhm4yZ
         OYCrL5opSNDL/9E0e7WOramm5FKMktE9EOK4NBSKZhNWuOs5x/zdqFhtrRaq2pRGim1s
         VN2QZaPk06PRTS8NLFWbIY/kuxfVnjb7bMdWK77O9lcWM7jDW0RJTbpEShvy9Lhbnr81
         312tPX57ydx3NkuTNvQvDs5CACLJI3fbVEui5NXFpb8Fg8zYpexkz43oBlrSpi+UIWlo
         lmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109342; x=1789714142;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vy8W88a0VFCDOKzf5fdSGUEkZyr8c6w9FqVojwlSvyg=;
        b=XtfMEoQENmOkcXeflhbu1a+W4ie3zh6HQxOxFMtmIXl0nTOB2PzW44yAkhtnZEHZPV
         Rt/tANjWcyaJIYwzWsYtRZ5r6VFI2bVxK/uZ+TDW8hOD3D0/OBWu8xSSXKxeeuof+yXu
         HDbfJtczB4Uk30EHpM+NBUpItlC6gPOQ5E6Ift2kmoYC4S72oUrCRKxnmthV6HcLdZWy
         jh/J1N8gBADtenx05q2CyHR5g9Aoa2sJPwsWLeRGmxhX2KDPlX4fXO2hOMkmwIQ5nB9L
         vE3FtYihRWlgcJZdV/tcaZ7SjUAhRSo6KjL88y50IgxKWvXbsczNoNAO72kg8mMTTGaZ
         MfNg==
X-Forwarded-Encrypted: i=1; AKwUvBxbxq5TbuzG3YY6FY61oCTMbqby92zt2yMPDPUCNOqSWy3QbtyfAgpywN9EetbxBOZT3vfBmUKkgpOc7ks=@vger.kernel.org
X-Gm-Message-State: AFuF++luucH6VPT5zAIliX6fwcP6Z0nuC8cQv5ORJ2DFe8KtB9i3/oeH
	8U9yVk7RMh4I6NnQCEXIDEQ31Z/0zj50AmZZsTUMEsefrchucmv7U5EM+z/DbEub3hHqGHxJyAk
	Y74gFfbB3P+A1IhgxoK5IXtT0/UlTkhQvj30MHtJGPtix82M/lHeaH4d4TeBpndEo+kk=
X-Gm-Gg: AYBFou2oicHgcVLRVhlYjUnLU5n4ctZoKa4Dqu9qmpP5TRiQStGC/DX/DGuZm+nwvSX
	8Uhm0I00HeXXQai7wkUAm0fCSJCLy5K1NAtLMfhJTXIl3aJIodaX2CKfbEzoS9n6Bz3ShLNcN/z
	NDsD+65yMyp91I2tfWjCmtt+JWGU2LBHKkdLyfaF4uaSYMsPhNg8cTOICufjFMdkTYjJ4qHjQBv
	v5knSJrRuqRl9C8GiczDF7VYthQUQIyfRk5Ku3AorYuFnwAFU2ERDPZcUqFml6jXMG6eBsLZD+3
	pZFPktYu46YAnudzzZj/whpLGTEU6Kkx2hfVy4cMP/8s+EuaRiHbGNJ5maWJxcO4jFn8yJlPOyu
	dK3IdkHAld0SvjIuHK+HzgHkwBP8eqAp6mLk=
X-Received: by 2002:a17:90b:1651:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39d9bbf93c5mr3645242a91.2.1789109342220;
        Thu, 10 Sep 2026 23:49:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1651:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39d9bbf93c5mr3645215a91.2.1789109341780;
        Thu, 10 Sep 2026 23:49:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b759d0sm4360102c88.7.2026.09.10.23.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:49:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/8] Subject: arm64: dts: qcom: Add t-power-on-us property
 for PCIe root ports
Date: Fri, 11 Sep 2026 12:18:51 +0530
Message-Id: <20260911-t_pwr_on-v1-0-a482d185f1f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFOko2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3ZL4gvKi+Pw8XQMzyzQTU5PUpCQjYyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQDvSkYIbAAAAA==
X-Change-ID: 20260911-t_pwr_on-069f454ebb23
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109338; l=2349;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NULX+1XQ77Td2Q136fRdbK92n4Z0ZUyf9pgBdD0Rtt8=;
 b=mQSfYIN/+Fl8IReJwtQajAQTTlANqdXh7FrdymEAd8DwUf151NLQaXm4qwF0vbZWPchd3XydX
 QKeifVEHU6mBVwNoiIi0wAZ5V5foZjNYQn7OUX1CGe2WxLFzkIKorYd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa3a45f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fm6EAR0vVewXWd2bb8wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX0UppUOyydtD3
 8BcKyOBmlG8687qCKSZGvW0b1sNxEQqUavH9VFdPq8a7JXOF5a9VdkGnzGGEgfrmUZhT1GUAXt/
 FQasp99ZWFnVLEWMsHgg/CUqu+wTou8cDxGld6jOTT1z4bSa6rqMck9Bnq3or5nRsKWFVxMsw7y
 Ppt7DRKkuLESCxQKBJRgybkha0ilj94AQXv6w9vQN5HkHgScQ7fWoG1n4n9EePQE0/3XQZ14P1W
 cCZEKB7MVaJbddC+9NeCTLGDu2lJupy7Gcmwk1jcVbWvMI20L6p7mTQdKvSw/5Sm/5CxHT1tT8y
 nrda8rRwbO273mR8AiOe7lHDjzv7sKIi7u+Ir4XGpBKz05k+F8vfDEjndyEpjJzFGXBV/J8htFP
 WBhWkC7J11jzCRqu5T1O64jnc/IjVKV41xLLtOyNGuUjyYPEDHLN6gsCg4jPGVpHIoER0vl5Fy4
 GyCHVYdgkse3Fw/zJVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX/3CJsxIkmehU
 m+uPlZlKRxoJsCIgOavo15zbYK8hg2KZuH1HW1e3iE+twQi8IrO+vqLsMypLb6dues5T5/SlMZI
 vRUg3TTJYDtWMIWdS3IbPmbbBrgiDUY=
X-Proofpoint-GUID: mjw3lNiXAipSjAIShrtIVgud-vNs-tt8
X-Proofpoint-ORIG-GUID: mjw3lNiXAipSjAIShrtIVgud-vNs-tt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

The Qualcomm PCIe host controller driver added support for parsing the
-power-on-us property[1] from each Root Port node and programming it as
art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
this, T_POWER_ON was expected to be programmed correctly in hardware or
by the bootloader, but not all targets support this, which can lead to an
incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
behavior.

This series adds the t-power-on-us = <80>; property to the PCIe root
port node(s) on the following targets, so the controller programs the
correct T_POWER_ON value instead of relying on the (currently incorrect)
hardware default:

- kodiak
- lemans
- monaco
- hamoa
- glymur
- talos
- sm8750
- kaanapali

[1] https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (8):
      arm64: dts: qcom: kodiak: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: lemans: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: monaco: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: hamoa: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: glymur: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: talos: Add t-power-on-us property for PCIe root port
      arm64: dts: qcom: sm8750: Add t-power-on-us property for PCIe root port
      arm64: dts: qcom: kaanapali: Add t-power-on-us property for PCIe root port

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 8 ++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi     | 8 ++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/kodiak.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 2 ++
 8 files changed, 34 insertions(+)
---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-t_pwr_on-069f454ebb23

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

