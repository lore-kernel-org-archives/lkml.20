Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183084DD6C6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788897; cv=none; b=FXoa950j3JpWcEG7lnIO/HcfoltySEy31d4M+HqQ4pzLBM7LursyXF3n2A4z04CVNk2vH4DSvJUznYj+QuIQo3zXGeLvH4VjdJIy+b8RYXlF0fkTV9ifw4i/yEXcJ9iw4EET9ci5n7KMCCF6qyC1n535cLRar9ZOUJVFc1Eo8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788897; c=relaxed/simple;
	bh=YcCvCxAQsX7Pg0cBF8X84+iLbVrczDX4JCUsixhyXrI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VWx+oiLCUBTH5OxzrIkingRQawngNvn5SwXrkxbi3GREh2J7PsyOf1O1exTCionBD310s9m5poLVtW2vjaF0kWZTjxwm7gw7rkRRDgps+qmJeA5uem7AMwYPk9OYx/0Vv/BMhDKm7sA8rtVnZ2PuYFAhUKxLBh0pnn1IB4XrZ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aH79ozgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+3l/WWW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aH79ozgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+3l/WWW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdFC63554655
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aJ0p1MDlzOMPT/wNMA/R48
	M3AI8nfhKu/DapId5EVH4=; b=aH79ozgQzlb0bJ9TP6MIVlOEGUK7KF+VXrzhuf
	K+iRGrqEP7ZcA4esr2kcZSH8x33xNY9ybXklReW/LvHv4p43zdZrnY29NTAxyMs0
	dCCsZZUoN0CtElTG6Ypw3Dy4WQSlgKfDaV7IBRTCRGUCSPVdKEAEF44YdHtz9fEx
	X5k1qQkLFRpvws71PD5sxvthuYNUjR32CzIVWLHOPRNxLFcxUdopYUlHFpi7KG5o
	tlM5yyXgfyfnarrazD2aBVk1TAbt0P9rItf9q8xTin6jwp2Trh8e5nKywDE1DUm9
	tEr2lapIpkLiL1DYLlgxor+mVHg/0tbSGB0EMrlw74wJ82xg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw217bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:48:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so6219035a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788891; x=1789393691; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aJ0p1MDlzOMPT/wNMA/R48M3AI8nfhKu/DapId5EVH4=;
        b=N+3l/WWWZ8XruIsrc1WMvaOMqDq6c4WLeSJCZ3fzcPJXnb5Tm96eCep0yvRGPaSZLR
         D18zdn3KrtwOaEDToUoDcD8VPiFWf7Usm73Ail+CvUQIXpaQwQipYfEe1FBEwCpp7/G/
         LXCTMfN3RPnWZfHCr3WCtW4+bEDKK8ckPRy0yAVLex9nAegrQ1BfktBF7iBf0brThd+q
         URCBWNjgwGKlcY0iboqDxBVrWk8gksrWGP+evlDuBmOcSKhOqOMU5U9dGzOEEJsKgn2Y
         SVWrshXP6gPfcGBk+VuwJZ5hXmI1qVw9lcPFQHwHnzZebmoh1gbh6MsrjbXOrkSzSvd8
         DFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788891; x=1789393691;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aJ0p1MDlzOMPT/wNMA/R48M3AI8nfhKu/DapId5EVH4=;
        b=MbFr8jhj0+MJhVGDf/YD91kNg3IzSwD1Ap9TP7v/lb6o+nRDDWvqMKvMvlULHlGIQZ
         IBHyHs4A7yp7/Zx3yjSbRJVWckeEvrViVDq1vkjNEgAJj2esqVpQrNsVoeKzBC+9Qa8W
         lAKfX73Tm7zPkh+G80KBWzOCfHN80iLyL7ngpvZxv0sixN9Rg3DDhdEogQXRvM7f7XJd
         lpWbRfX7LjuYvMxEzLAlz/rStPXqJBcCq/0CZeAYqXBcPIdedxbU7/iJ+tlKzX72JgZq
         tPq3ViwpckKWZdb5/Xa44GhuD4NVHS6NDeEJO/GG3AsmbwFzr+QUE8luGfNh3pW903W1
         KcxA==
X-Forwarded-Encrypted: i=1; AKwUvBx7gaQk/2OPavOh/vNkbn1qQNjVlNATm1CGLVktxvnRoPksir/JDw08nbNi50xW2Z0ZflciZZSbOrReHHA=@vger.kernel.org
X-Gm-Message-State: AFuF++kdNrN+hW7P7mq7kWY/HCgIykLkbkwN4bKP3r2lq2S1dVEYmukP
	Yk6PR9Fd+0CEOL/vtSA1eeQToGOe1Uxf/yRyqroK4NTx9Yn3i1iK9PrZGcNh/yx6S2bVPRu/U8f
	XjQKoBTSszvp+YoX46xR0iE9VseBGiKsV8QyX+2nJbyxvEEXhjmMBCjCoKtdxFZJoaJE=
X-Gm-Gg: AYBFou3eEzG78snp6TM3hWgLECYJIPcFrBWH7rqItrktgX7XZWWhLmjbc8ww7djuR8P
	oMikSQvvu9h5d6am04U5vYxySqQ9CcH6vSlTucKPOIXqxufAD4SKflEk2bZzeao4uEijRBhX4IG
	ByCIunhuuASmOmJdFJboVbhFbhVPc0nE+6JnhCYViQYk0xFLgvksl4uZaIqRTfZsiI3PwqKg/MY
	q/ZiLiGiBAgkaMVDnF01TX6ub99rNhp6sUXUd6g6N9vUt2PWPqY3cihMizLQJwFyob2J3E79wV/
	LhZk70RFRMcuPPB9IjwSR9LMhOUa5VPSJ3OFW42zDZZSVZ7axc5zFPrU6iHjIs6674ij4WhvLoE
	Sq/IJsTe1irUj4iLgQ8yw7K4HesAsmA==
X-Received: by 2002:a17:90b:33c9:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39b26122fbamr32277871a91.1.1788788890761;
        Mon, 07 Sep 2026 06:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:33c9:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39b26122fbamr32277805a91.1.1788788890227;
        Mon, 07 Sep 2026 06:48:10 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm20826354c88.8.2026.09.07.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:48:09 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add subsystem LPM stats support for Shikra
Date: Mon, 07 Sep 2026 19:17:52 +0530
Message-Id: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjAnmoC/3XOwQ6CMAyA4VcxOzuydhPQk+9hjBnYyaKArkg0h
 nd34kWJXpr8TfqlD8EUPLFYzR4iUO/Zt00MM5+JsrLNgaTfxxaoMFUpGsmVPwa74852LLVT4EC
 nrjCliCfnQM7fRm6zjV157tpwH/UeXts3lCn9DfUglVTWKirB2VzTumVOLld7Ktu6TuIQL6/HT
 yOfGBiNgooFOjQO3P6PoT8MmP6ho2EKggwQMlz+MoZheALX4ehoNwEAAA==
X-Change-ID: 20260624-shikra_stats-3f01f136fb4c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788788886; l=3200;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=YcCvCxAQsX7Pg0cBF8X84+iLbVrczDX4JCUsixhyXrI=;
 b=ciE1q8B6FqruSzRsiulDQ7SB34xmTB6p0hk0aynOjW7qCYW8FCzejmnQpgZcelqZwVzbjAnYy
 G60kJWhjIOhByHoAv9L0Uh3YsWk+mdas8SZlmnTaSVhz/3a+JZ9Rb2c
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: PSQxIjKNalaRbbATm7RribK7CfbcJmVB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfXweWMmxBBstS7
 ccybZgnBHMwUlRsD78baWGNqrko65rM9ZVqi+SBqm/XWK7vzbs8n459J9KioJsfYQ+uFLiW6Ayn
 WBSEfFV6eemiUhNGIWBqpBuS78kmYHY=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9ec09b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9MvkJE27OKZGVTZ6eoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX1jNF/Ez9pK4f
 K11Si/NN8ze9ozDrVUgZTLuZa8tzjCXrYl823RhSbnJr+vm3toYT0d3IgfSBtNi9AJwyJqGqTyI
 L1KPJrKfIgvjYWG+4cnBLq8vIcTGPI1ch2paYOUh3dC7FpSpuamKT0SAubrVIpcrpqUhe662mqs
 cHr8K5Np2ziJQ9B5tqgumRi7FbaWKLMbIg04Rgxbm3zgn9TrWoSMebWpmbXYJiultZUpehyycjd
 yshz8l1qTjXNl+1xmaBuQlSKEuALwuhbxV+gW8DtT5FY9tGE1NCnAIqjNnKxxz5J1U55+V04sQe
 fAiDUAR81Nup78CVS3dU9GP5WkjXdyf5hW7M2NlBETNiW6dc47kU1hRCd1oHv7Ym4V0I2bRHLgO
 qj0k4aw/FFvwN4jKbk5CM+/OXN3hFmo2Vz7CjoTZIeNkqEY+C3ZcVB8cxFbJE306sY/tX2SMThv
 FFR5pPPyzC/5T6eBEHQ==
X-Proofpoint-GUID: PSQxIjKNalaRbbATm7RribK7CfbcJmVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070153

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c
was used for subsystem LPM stats since those stats were populated in
RPM MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Keep "qcom,rpm-stats" as a fallback compatible and add the bindings for
the same.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v4:
- Add bindings support to keep "qcom,rpm-stats" as fallback compatible.
- Link to v3: https://lore.kernel.org/r/20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com

Changes in v3:
- added back "qcom,rpm-stats" as a fallback compatible.
- Link to v2: https://lore.kernel.org/r/20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com

Changes in v2:
- Edited commit texts to better explain the changes.
- Link to v1: https://lore.kernel.org/r/20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com

---
Sneh Mankad (3):
      dt-bindings: soc: qcom: stats: Add compatible for Shikra
      soc: qcom: stats: Add stats compatible and config for Shikra
      arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific

 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   | 25 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  2 +-
 drivers/soc/qcom/qcom_stats.c                      |  9 ++++++++
 3 files changed, 26 insertions(+), 10 deletions(-)
---
base-commit: 4c9d9db1697a873f78d236b4ce304272206238ac
change-id: 20260624-shikra_stats-3f01f136fb4c

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

