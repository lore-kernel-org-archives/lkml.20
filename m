Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803243;
	b=QNSRddAiykxYr3Ji/1V3I7vzCU89nMpTeZK/UglsvkrT4SYldlT6cgOZoR5lkIleK9pE
	 5IWj7wiw0WepHCmAhIeYx/DGF6vIL6NFchuyHYtTZCQIh+n3sOARgNnyOJa/UKp0cdWi6
	 1PunFotAlHxNUOz7V582l8rLJoW66yqI1FwJu1j1YB9/XXkk3GIJkscwdhNZQMUByCzXv
	 IDmuMqF6KTN3r5DB5+D/v5YKt2lwOYs35hymUmAQxfbSOX0UrFmrmG8hi16sQ1x2j5Ido
	 sbcPdsDeIZwEGgILSr2WtNPVVdfJy9Np7fgNPiFwwYzFLks3Fxt5EBU8KgK7VPvuA7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=;
	b=AUxk+dIsC2nuFFdJ+Ur2a5rdWCtQr5HyA4koHR4W8/PMIrshZV/4c7h/fjDqG0zBLHHh
	 /attvLR6TntGtFyFH5QGW/yLXfKakqq0bpxRU8bHnocNXxIG1QqSZpUv6zDId6xa0TpyU
	 +spFg1qjTK+GfNKQolefZmO9mFajkrk8Hsm8jfbovxzwbs0EDhzxppaDWd6hlPloFQOz9
	 Sh5+MEzw2Iare9ti31dTj3SbpLBnLzub7RB+ifFKJ5gfSjlhcDq6MR3sWuqs6N5sOBeIT
	 5akVg9IBLeLoBQhuEeuVFAukVl5J8hYB0RWjQmH4UkUCYSHhoOWcVrcFHKnrVCWN5og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOGrOIDX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aeElI9jo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEF4606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEF4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOGrOIDX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aeElI9jo
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba3RN1700497
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YUThmGPJuRTY+/MkH9mkmV
	Sk815/jCpzFpL5hSBqw4c=; b=mOGrOIDXbtFnOB86NQYAgCbaTeI4aalIaOy5bV
	0e25t/v0ZZnubehxFyZz6kuW3u/45zn1JOqJF4OYjpE5y3o+hwSd9swEmBtEzb4x
	ELu9KGYib7JdxaZxCF+S0+uGH3qw3v3gH0IDwlPKKf6O1XQU8BxtgR2t6hsMVyxW
	b6Ou2yYWRNzmdlLHieANXPKqQ+Yy7rl/BcYN9YPHMNYAAzt9jXLrzcVwhdreX40c
	AvpzDl70CJ1gxUsD2Y3poYh/UmigA31x3DmVtKelUAzKzBfbTNIxV8H3C5/sl0Dv
	gPMeaEsRRP2G19M/I9Ee/fAqOR+STHjQi6oanKXzfpWcWeSA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pygrw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:40:40 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99063f4065eso86614241.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793803240; x=1794408040; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=;
        b=aeElI9jomig4Uv/VzUxsBNlZim0N9kZWBUckTrSTLtisH0hcH1U3sSOO/fliGc3h2A
         2pi5Ctlz8O+kWxmVgLm4KggiuUTUZBHu2YOZOKDelUeBlgDagDfqKuccSr+OhjkP3AjG
         VWzcGRcl1li+G089QsOuOGrYHTLPJWYlt6akMAbg2inY0tStbDaK8un7LOtlQ5i/UeWS
         efUYoRmLjRI7Qewz8DMN3h4AgkoUmZIdJ0SqYgtBryFngDnMGPPbPL90sKuYaPHy6EoE
         0tVGrJ31iESn8CdsXnUC6rpCfuoDCSiPSni+3c5NClwrJ/Z4daDkdJgShzf5FYqpJFH5
         svIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803240; x=1794408040;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=;
        b=leoW/oncNU3apa6gqJFVdkwHcmO8HurAqxxVsGQa1KI3FKiLr6KlUEBwtvUN15oOwO
         q3aSLKRZDdhnCWNVay5oGPX7U87PaqZjox+xSj5AaoesRGlzOd2VoMBthSJYfm8zym41
         E1RDgZ6dzsjqHi5VucMWCIQESTA11310XPuBEbLrOT0I41AaMfcJlVe57zCrH/JWwlsE
         DfAE0mvsDzRps/VVbVJjuzOstkz9ssnvzGUydRqrg4bCG6H60HFXHSfR4MmHCoWqkRkF
         7kO2PEmIR6x5nebTBD1krE10NW1QlKnwz4V4m5es+CTz8XHX5MinLR3gV2mxbja9iqmg
         QzFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYnPSYvHWTjlKjf0HZJq5wqFhfCFFsx8p2egvFY6fRroVqOBBTVg/C836mae8iAacrprSAyLsyZ0C9iMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w8AHNUDfYoqNLRXNNs+TZ/FghJCknshnfbdUrK2PgrMf338VX
	RKaxBf7vIMqrBbhsDEzT9Q9yAfEOeHXBR7Qyf+qtZCny2NwwotwFODt2ddWi4ouzZTOCLBJrYHR
	AkZGJmoRmJvB8vVjp/veyynslsCkGQ+QF33LqPTnGcZFHe/vTlvBf7mhhVzSUDrq7Tx8=
X-Gm-Gg: AYBFou05gG9GlVg7Y3n25iHfiHGXpZIa/CWERoHGKrSSp3Fe13rVEEFHIQiItdy5j7i
	UxNUfyXsAkGa15xJ6GqeuW0Pn6AgVYQZA3ZDSTQk7f0wH9ukRwy/6AJ4wv9PTbgwCTFyhfd2KCv
	CzDYcdQPWZW+foJg1bAqzmUvxcQjj4G1viJZbZwek9sEE0ph+yz3mLY6xRIAuR6zLZgEem6HOTr
	0XNy0Oc+WppH9vwBJyc0OhF17P1PTXm7kf/0XlRoCTnnAzuuyDFd29JQHRiJQmpGLWDuVtp1WUf
	NMuo2aJeO+dO/XJsxplt1gVrEqn/RQ4TxztuGNmXJO4XF8+vObM2NyUsvJUYJzeazxPRa9ayu+M
	yKygXTILRUUD6OVsjuwrHZlNgerjiBsvgbRsDfW72iwuewc4F+//zwKhkrGAHzewIIQoB9Q==
X-Received: by 2002:a67:e9cf:0:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d2726664ebmr541522137.0.1793803240085;
        Wed, 04 Nov 2026 06:40:40 -0800 (PST)
X-Received: by 2002:a67:e9cf:0:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d2726664ebmr541510137.0.1793803239544;
        Wed, 04 Nov 2026 06:40:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181085sm4381946f8f.1.2026.11.04.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:40:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:40:26 +0100
Subject: [PATCH v3] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with
 defaults
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
Message-Id: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33N0Q6CIBQG4FdxXIcDJI2ueo/WBeBRqZQEZTXnu
 wd20U3r5mz/9p/vX5AHZ8CjY7YgB8F4Y4cYil2GdCeHFrCpY0aMsJJwJvCobY+91fim7dCYFlM
 lVEFrUREmUXx7OGjMcyPPl0/2s7qCnpKTGp3xk3WvbTPQ1PvDB4oJLoWSe05U0YA4We/zcZb32
 OzzeFBaCezrVJT+cFh0uBSkAlJydqA/nHVd3xDCDUgRAQAA
X-Change-ID: 20260429-qcom-soc-kconfig-1b9b31d9702a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p8GWd+LZo6xbYp9ZyzCcCx0yLw7NoaI+cPAfAFUemgo=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGrrQ9zIKyKsIVfJ7bndpRgMBWu7uZcvhYtzMTI3bDb+GHXdm
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJq60PcAAoJEME3ZuaGi4PXI6YP/2JC
 DDNNrk/Q5ZOAwaG4T9Amdayf/NjGT8Vz1lzXJDuO+Uc98RSDlztt/ITPc3Cce7WoCrCwyjjzGHj
 TzKqMRR+a00PSNk1QUxPtCaFVPW0e3HVY2W0ZwB9sf6X14/zVo4bLZhEdSf3w41ENItCyczRFyz
 DL7Ge2WFbHcLeMZCC15T1bJ248fEZzB5fqYseJK716FIJAeFZ5XyOwkn3vfxd3oqswd5YiSMzh9
 IKa2o1bo0SN0U1+L/kSFuuMDzh9RFFa0DP7ZQfWDYbza7ppyBUN2y+2DElc35kVzNfOjVQSRx3P
 UZl56XDpec1zwxHSzIjIw+OQcthmClz8f9avig49JAE92ChXRYwB1QdOXUlSq3xXZEnRRz8+FCc
 ENz6qniC2ry9WDOFBM7aqIv7noxMcITZvvRdFJXvAJlZ6pDQ/BvoYS9UASdLDUoQV2sObrzcsrJ
 E0Xz7BK1JIleMYDaW+IC1m/xDIC2XHdPuKf6N1qwwVcRAFXlywRpDQIjFTFfyiC4/ImdABBwiBF
 ZY2JtJZfTGovx0XUHbjuRlFogavZbSRn9abwpbL44KI34yAK3Z4JtiWL+gsyWwVmnje/A/1O50e
 fAHv2mRF1yPt3m2aGVTgiMptO0vG/+9gZEQSfY7hZ//VdV9UOmBRtwTBBN3ZzqiHSfIrPQx56ZM
 Q+1hZ
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb43e8 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=P_Rs_jpJqzNIsTW6RbUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfXwbR/9QQiTY+h
 tnezAUvJgsoNiUZWcsAc1ZYc0B5nYlEXblo2Wk59yLDwLGAHwK+Lnj5OTzB8PRMQq3qdR3ZzpKl
 vq22cjthg2pxT1D8kTJw3NxFOP9d7ysGz1IBvQ5LCkUTvH5N7VGPJbk5VhOsWAIUgcKlf9EndjA
 vlDuDQXEIYpD6GdBnEeC+TCASCQFZeN+R9/AtKVRFdFtDxyMNTfloEYA7kiQ2mGmo4P9l5NOlOx
 Xqz8+AtwQZUmSBwV9JixK1+T5pw7hl9gW7egx/TWw4pCWPNJVjrb74PROG9fUTEXOT+3c1JfnuJ
 LHCiaZFa/6VrYp0ML2bsixk9rGGQ+E/fSyqMHtyfOwWvH1J12wTPRkAN+fhlbUtNAuihYAi/gcx
 Klatbctc9pPX94hzv2PHRk1vCdzwXZHgJ6xxe3hiopJnvbo0+o3L/NsND9ye52asn5kUuudfLwm
 7naBL968/V3QVbOBjKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX6hjj7fF9T5EL
 CCuhG1YwVHzS12yTK1F8PASklfLkkEe6KJpPbtRe51MrHmMlWv06Hc3hzlDGMMouj2dCmx8GcBt
 QSdDkYaOVnVKsS2uDvtDPtTLtluoRps=
X-Proofpoint-ORIG-GUID: zwPYHDBMdW_izVtWf6nMT-2kIv8otP4J
X-Proofpoint-GUID: zwPYHDBMdW_izVtWf6nMT-2kIv8otP4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040058

Several Qualcomm SoC drivers have defaults, so their defconfig entries
are redundant.  Keep the few options which choose specific choice
different than the default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
No dependencies, this can be applied as is.

Changes in v3:
- None, just rebased/resend and dropped all other patches which got
  merged

Changes in v2:
- Implement review - changes in individual patch changelogs
- Add tags
- New patch: soc: qcom: Avoid SCM and SPM for cpuidle drivers

Make important drivers default, so people will not have to choose
obvious things and few other re-organizations.

This matches my other work for Qualcomm drivers (clock, interconnect,
pinctrl).

Best regards,
Krzysztof
---
 arch/arm/configs/multi_v7_defconfig | 11 -----------
 arch/arm/configs/qcom_defconfig     |  7 -------
 arch/arm64/configs/defconfig        | 18 ------------------
 3 files changed, 36 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..92cb615b76c1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1133,17 +1133,6 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
-CONFIG_QCOM_GSBI=y
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=m
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index cc93a32342af..8dec2a56f169 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -221,16 +221,9 @@ CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=y
 CONFIG_RPMSG_QCOM_SMD=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=y
 CONFIG_QCOM_STATS=y
 CONFIG_QCOM_WCNSS_CTRL=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..37075de6c727 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1546,25 +1546,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
-CONFIG_QCOM_AOSS_QMP=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_LLCC=m
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_PMIC_GLINK=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_SPM=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
-CONFIG_QCOM_APR=m
-CONFIG_QCOM_ICC_BWMON=m
-CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20260429-qcom-soc-kconfig-1b9b31d9702a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

