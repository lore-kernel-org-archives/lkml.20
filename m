Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779860;
	b=NO3YUogibzOAUtDvWQ0UAa/rhEhuiXNWQNmLw4RqVT9JddVYXiaisbSULKLwsWSVo3c1
	 0fZ/emoMl/mLWTKjUHeougCeYVQefgClARLp9HZJCKsMAXRgChnFshvNOQ98ha0zqG5/B
	 WpWmXrTtn+DwI06AK5WHd8Btc/4qod/wwbRkB6b9flD0rR8vs9mi4s7A4Jg3FTI3JtxVB
	 xvAhIXwyn6MrlBdFxN3En76s14i+y4PXIemNbfqYWUdQ3kgnFieyfJv8Gt4PkwIxgAwgz
	 wJ+ZrGIMcgF+QVhnbys14Fl4xxiz8TlmiHzbXEnkhDMQn24R7GzNag5FcC5KqNXdr+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=;
	b=LVtSex6KbOeUzJ57dyKnw0F8q6Cas2K4Sw87kQuh6yHxnGu6UG+NiA50TsC64YNzCgO2
	 TlifKGzvA8bkz8qOwHsX+4w45feJ9OaTK/HKdUuRTYzDlgrzn9SBiA1+I+0mhc5qsr7rx
	 S3UH1NsdFNlpck8W9exvmi2AdyjaqrWFOJb0px9DXaEuAYJnOatN0YZcluMaNyPtKatjR
	 hsIV2i0DlH4LRd1jaAEaM61VPzClqvjS9szGVx5LW0zhHvr2hMWjCJ7ASXxbPFCna1wfE
	 Na1WN+0zHcc0pWJakdz9fe47B6cNunnYYb2WB+J2hfMlNA2YIh/9srz8xMP1yoIFuTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BWQ/2s4s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHg9+hWo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA1606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BA1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWQ/2s4s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHg9+hWo
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46vSpm222109
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wpjASZFX8c34eRfTv9obdd
	qQTOa+9xegFnCuM4xKtAk=; b=BWQ/2s4s+KWDyptBlco3xv/2WfNuaBYidH8YHv
	ZCrsG9i8r20T6JW773TwIS2iITemH3ME6CN9vaeC65OieUfE/Issdbsw/Qkp4zBS
	CItfAbgbnnsoPizoqxyQZXNZHvq5O/Xls/7PIjmFV9xJbekdcbtKLFpLIMc01+Li
	l+FyTTibKYCX7w4JMa1tSDqlysg5Ilipl3qmmZaBGXl3NAY3jxJMWeronlsgaOkj
	F50cNMiCUAPLZzNUD804LXbpWTZHLOXB0WIa3fBKkA/V+4iDNKwKJumqG8w/dzDI
	Gc+iyEmXQIVbSeEE2H6S36MBo1mORNHvJD8ldZ/h0TMQoktg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubkhv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:10:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso719687a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779858; x=1794384658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=;
        b=VHg9+hWokpw9Zgx3cAnIkBG4jYuLLG/zL8CFxHIV6VV9OkeNnBWykk2y6RFkVauyL9
         IpiTutD2tCeZiejPolkZE6NETqFqxeqx6i8CgMY3PysMKqZnnaEm9leak55uFRTr0EJW
         X8mzPamXJeC+krzkA2JB76FHr3/q1heaSogUXe+3m5Nc9uBoyf8xxUm3T7wz0+8FSQ9b
         FBl1+zOn75b1nRV5pOKa/ZneNRlp+6phH2m1VN/eQ1pOrc7xUv6c2FyjUOqgxnvlyj5X
         AEdzILtajDeAeAi2x04Vmv/0VlNybjRK9R7G0sjT6wOv2E9JSlUL3YDRhDtFovug1LZT
         tfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779858; x=1794384658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=;
        b=QB88TyEVANKQ+GduPolnR+f6sVAVCBOy8cPKt6WcH4rQYM8rwv93uX1rgpyGZzjW+o
         HSPdNojQGCexIJzAjAggLL1ehrYi0QHt4ythcJAz4CoRgk2iKux0kodch7GSlBhBfc/c
         78AhYL6ydI2FSnU686TrKx1Gldxztj74bSseACQLNeSDflNcfObyc8eRldjOuySh4X4L
         DXf7dTnwBxbZk+Dq9OBvvb47SW0151CHGxe9TMLmhqEc0rYH9rg0E4EsXAtQZZYUWvRq
         6VMq0jzuiV9jIHwK53BkUYcCC6YhcJ5vpAiQG+9diNr31lPJM3K7LVXg1l+ufMSI9UXd
         fIvQ==
X-Gm-Message-State: APuU4Z+CjF7ZwBlxNpx5vFZ97IiEtrQ167Ho5Ldy/vv2BOL/Wah1M2W7
	QFV5O8mTUU/aUl9shglFnhbm6vcgZeJaGoy5AO+T4m9N1WYtzVaYqEidHpbnRIuvoovCiux7ZhQ
	EtNt8yu9+YhDGSnh7rfKPn/UgCAT6w1W0zRtH++qjAG3NgN2xsqvE7y4OuLMFwqKc3MI=
X-Gm-Gg: AYBFou3lm8C2+okHvx6vxFq1AmkTGKkSP/OEn6IGy9ens3e0trKzqgBJ+++9X6Gaj2f
	itSp1Diy9AZz2/7N+6eeFdVnBn9Kij0JH883tV+hDiJ3cCduUi8JYymzu8Aod1HFo4JbCWdHkNg
	lobU8n4jwHpvnx4XLYJFmkk5t390bfOjHwUa7klhE6nWQKqTRgD9m9mZJzyc6YXgjAuQgxQ4GxE
	+5ndc9NvVhyqRooZ1sGKDDU2kwNMDw0M2F67lMZ0YrLukNtS/ZsUeMCo45tcZw7SE39+ggs31Iv
	sCoIG4Ach5CnmIZbYofW5IShNxOT8C/0mXZ98uRiL0we0ew5Zaxuc6aboPIz6JJvn851aZEohvC
	OlniVfDYmvwmlysixh2useYm31k0cMpLjTusjyT7PiR6e+fqjYUAe55zEoV/zdgPQdoU/QGcmX8
	YtHl5A9VrT2w==
X-Received: by 2002:a17:90b:28d0:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ae895743ddmr13951547a91.5.1793779857755;
        Wed, 04 Nov 2026 00:10:57 -0800 (PST)
X-Received: by 2002:a17:90b:28d0:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ae895743ddmr13951518a91.5.1793779857187;
        Wed, 04 Nov 2026 00:10:57 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:10:56 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v4 0/2] regulator: rpi-panel-v2: Add vcc-supply
Date: Wed, 04 Nov 2026 13:40:46 +0530
Message-Id: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIbo6moC/22NzQ6CMBAGX4X0bMnSUn48+R7GGCiL1AjFFhoN4
 d1t8aCJXjaZZObbhVg0Ci3ZRwsx6JRVevCQ7iIiu2q4IFWNZ8KAZVBCTs2ozgYvtJBZUYiaCxQ
 18fZosFWPbel4erOd6yvKKeTB6JSdtHlurxwL3u+qYxQoSFFWVQYNT9qDtja+z9VN6r6P/SFh3
 PGvnLFPzn1esiTlLJEp5PAnX9f1BR9jGSD2AAAA
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=2273;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=TDZPbLRwPtzDhDZDJhYBIn/7Vqee9lBuOpCJiBezBFw=;
 b=bLOTJ/+GihrKe/nz6Kl9UqFPMs/Gyul5P9lFlVm6uUeFpi9zp+tlQZa8/Gc/o+/DuxwYbBPme
 f9sm8Vv0qTrCICNn3/M/aUeM+Hruo/rOaxS7/9Jq92wuJhi64lvt29u
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX9UxER8OSLMrB
 mMnu/Kn4F9LWbwutafp5Ix8VgLp4ioaoWzj0UOXOf0xODFlXizIdWDsbzFofkjx3I718RYUZxkh
 a8siBbxnxrdvxhowQeK8thAPCakpvok=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeae892 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8 a=JfrnYn6hAAAA:8 a=hLbFB0PV-noiyqnaVYIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: X1b9rfHUxlDpF9_SdElbC_09m7XzLprd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX42o0dgBMmeGy
 dkG5TGEB0uwCA5nsFFpIYfODkvV0KUjFXkQyEqY6MSJWkkR3arVqeImQ+Mr4qdxUUVJ4NoftYoW
 KIypDwNob8HOJgikpDpr1FG+XplfbqLSf1X6ojyHLDK6JqehAKl4mUiZ7ZU3Jd++mdCaIct6C3Y
 4QoNHzF6fgs+sp3ZFJXq+qp8JVyQgOp48LClGF8RLWZFOZb0eY65XS6D521gs/5nio0vplHmv7h
 AEBcC189f2FOzrfkmR/eL04BggknSxk0CUtcwtV0MwHssRNTvGniwhrggKt8I7gffWK+dL0dknK
 9CcnOHuqSNTLfP4ImFx+FZjYg2PcWjT0t62x0qKbZqp0vo2q0Dyaf0n+9/RDaN1vtVMmv2GFvEN
 8z7LsSIkOQ45C5DZiU0rFFumdGyrqLTGqdQgM3q4T6n+jSUobV4mICT/b7qNoP8FPR5Dd6Un1Mf
 R4VJLStmiCuLshOhGOA==
X-Proofpoint-ORIG-GUID: X1b9rfHUxlDpF9_SdElbC_09m7XzLprd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040032

This series adds a vcc-supply property to both the dt-binding and the
driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property as an
    optional property.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v4:
- Rebased onto the latest regulator for-next branch.
- No functional changes.
- Link to v3: https://patch.msgid.link/20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com

Changes in v3:
- dt-bindings: make vcc-supply optional instead of required, to preserve
  compatibility with existing device trees that do not describe the
  supply.
- Driver is unchanged from v2: devm_regulator_get() returns a dummy
  regulator when the supply is absent, so an optional binding needs no
  driver change.
- Link to v2: https://patch.msgid.link/20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com

Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add vcc-supply property
      regulator: rpi-panel-v2: Add vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  4 ++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: 5436a50a0b44b448f965e928507b5159059dee57
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

