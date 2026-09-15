Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3774A5C2B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473830; cv=none; b=EVrpuSg+dL6o6nWSrCgH7uUXqE2bS1+629PA5kSgniUnSCBQaVR1143CDN9ue+g8I6x/oVGLYMv9oHLWVPem9Dtgt1jwPhECg9kB6ESIHRCLNM41VTbOR0K24153mbYf1J0VbMx8rLdc++Fo19fybWy6/MgWhCNmBssVIX2M1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473830; c=relaxed/simple;
	bh=aKuI8YLaa+odlL6NCq6DFE3zoTnZcP4u/fXtvuWGG5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VZWZRgOCr4w/hsSSQqQngw+Rahmjm2afUDHnlnYo4j3uOg+BSMB7MHy950UNpjsjsLlDnmw1Aq+aXmf8vfKH/M63sPfpKZXvjcv0jscrj5rW/tzLpItD8w8tGY5I2XlrhtmBTdQ8U2StquYYdSb8/YeZeadq9MSDuR0OpUW6yvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWpwtCbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXaObCEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWpwtCbz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXaObCEg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hPxR3742113
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3iUKWMqrkMjcgQnlSiEijg
	CyaIZFaqaX8CYpXtif2m0=; b=kWpwtCbzwGPI9YZtlcKKiVs3nJSXVSML+yIfOg
	qzoOPcFzksSop3A40LCtQ9dEOIxj82YU4Otr/S8Rm6M29Wp4M8sfoVBASEmsmdc0
	p3/vLo6+l6eSSAHGqEWQNDsVY96XL3FWDSxL5bBPHBVVSIhF+lzLJv7EuleLKkU9
	QvfUi8x8+WUd+uYgZEGKpwsTaNrcbqmXBHHbBNteIjmvhoZX9oDy5j9RkE6HwO64
	C9fn2/8iEsg3kIRzN71xkNKIjKGnq9P1/1xpsQgLEqWpfzYbwV+r5xZ5ovnWy+6S
	+IpLwGnENIg/hBODqD6wQbSklGC04+OQ/2ZSipYbPAjkGmEQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux1m8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:47 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-455ad408573so7927489fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473827; x=1790078627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3iUKWMqrkMjcgQnlSiEijgCyaIZFaqaX8CYpXtif2m0=;
        b=MXaObCEgA7VIhwQ+lc22n1Y07yzQ3sYuN9pr3JbGPdDgFwyco6w1kQkvSz3I/lQJXr
         Y24tAnTqDmvQKWdh/RxE6IHZGAVXl8zEGDJI6wmQz7ZJSdZUz82DyCyE2DREPva4hJ1m
         zSAyNJwIvjIDNvAmNvalcfgZ1MCbtplfsVcMennKg7sRpnPw7E0f7JUERupmYc+MeYzt
         a+q1H/7yj3Bl1r7c2O7IAINfHP2cXovBeuxqsdTRzTPcSA/jtVHsFlUdXlVJok/B0cCM
         U7Zrc1KpT/L3DND6zJZTfIAPk6v5if+OyXl5kqK8nh2237fKbuPVzsgUb25daRImmI4k
         Yg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473827; x=1790078627;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3iUKWMqrkMjcgQnlSiEijgCyaIZFaqaX8CYpXtif2m0=;
        b=bDSXVkm4XXgyfugPM799dHbR4GQjrZC/feXiMYaNG9yNueLp0IOaZUlIU2FilduNO2
         zEEg4qHE1fjs5Lc10kBVIPIhuhAFnYJG8ewm/MZgXohzBqDtsFtiICCDJlMDDeWxiEIF
         xVhPUbMwxOlqe+LK+9RXi7LaKmkNdHf7Mg2JO8T0lrpHRq1T5990Wi13J31V/LmRBNth
         x35FezWclGtA6tzrsFHtBN0BqhUsAJvEo3pJOjWYzSVBzev4sEa1qUOzwPCpk9jBCPOJ
         M/y7VkoP2sh5LDLso+QNAS+w+mRjnTczp9PqEH/CQEeyL6ws/egaouS+UN6RoCqyjtBm
         TicA==
X-Forwarded-Encrypted: i=1; AKwUvBwQixhTAEc7qO/H2ZFc9vDiAjP7TVWn3Io3pOA65bvELuWdM1f1uZqEoIy7/yJvzpGfTPgRA1B+x6HXUSM=@vger.kernel.org
X-Gm-Message-State: AFuF++kescePKmAz+NCiiBGS4nxL1n/QdU+d9bEuwzQQs8wjSnO0FxBq
	SdNm4M4bfPU0W3D5PQCLcp++CbI+AeMAaks4o4yP8Jd3TtjPEmgdYP6qHdceKG7K0Q7gI1F6zbu
	Q6KvGwaMu2dfKKa5KuDtbLttxG+Q15rucLNsH6f4qv/6DI/uvoygHHEpkFFdtq1+F0T4=
X-Gm-Gg: AYBFou0qniQ86pTVQFYsdhWxUZTwglgASnFT3cTEuuuiEjiFBq9a/zzfGZRv5h//4yf
	EV9YBGQwbKEOkCOfIR2hnsJmdZrQsXkWq4UV/E0PmakgmIYKYLs00hom+FsOTfYA+HZXddOFM3i
	dYNW5B3y7OhW9lYQ8EJSS7sFCbAGcBxWKOF0BWJpxrNsMQjvveKs6iQY3bFCTEgdLo5zUrwI/ES
	PhQv1BChg1dgu3NAzspWaFAT7SewRbvUHCtx9CaWhQpaR39TdeRuT4GUGOJR+T0vdSVlDJLvFnj
	yb7dGy1i9IRi0Vslrs4g75E/O7//AH2dtdexoTCWLeCg1RloBOAU+bUFKoXvZ7mNMVjFMh8cPyM
	BgWnJb+E=
X-Received: by 2002:a05:6820:2918:b0:6b6:c0bc:365c with SMTP id 006d021491bc7-6c54076f315mr4194721eaf.22.1789473824394;
        Tue, 15 Sep 2026 05:03:44 -0700 (PDT)
X-Received: by 2002:a05:6820:2918:b0:6b6:c0bc:365c with SMTP id 006d021491bc7-6c54076f315mr4194390eaf.22.1789473821773;
        Tue, 15 Sep 2026 05:03:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage
 subtypes and rework generic parts
Date: Tue, 15 Sep 2026 15:03:26 +0300
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA40qWoC/42OTQ6CMBCFr0K6dgiUCuLKexgWpR2lBqh0SqMS7
 m7BC7h5yZe8v4UROoPEzsnCHAZDxo4R+CFhqpPjHcHoyIxnvMzqXID2BJOyA2BvPhKk1jDfCIJ
 0Ro4eKpHVXJWqOErBYsnT4c289oFr82Oa2wcqv7Vujs6Qt+69Pwj55vt7LOSQQXVqCy5qlFjmF
 0uUTrPsY2ZIo7BmXdcvdjZnjeUAAAA=
X-Change-ID: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=aKuI8YLaa+odlL6NCq6DFE3zoTnZcP4u/fXtvuWGG5Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQVT1x7HB/hN1XnpOOKJZTIU+2EOXBtq/9Yo
 a8ZLpnxSBuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0FQAKCRAbX0TJAJUV
 VkIBEACv/OsfjtWMvkulWkqQEfy8gVGBkkzN7zYzrZdWB4bZmU6y4i8+4QDVkT2wD1CQRMvfRaj
 sCc1qRn7lDFf0DXtsWbCbYh+rhqZbteEVEgPui+c9mAfgDh2VqrPloBDMUY6inoIeVgHNfSrgcC
 1RuOZ/Ke05T3wvoPF1v8BEawKAR3JBQvg/u4TJrB+wm87Lz1OC5ozfgapm5A/ODfM+U9/tqPvso
 TgQG62c4ceaXzgsD2pg1eYsibbuAoQiAfQNyvOo6zir70EIFOFd3rBjs7uclu/2OT/pkYc4Fli5
 iMvDv7Ey2dt4obsWYS2I4DgFXv+T0QyefuuGxOn6NOx0MMozm6lAaKLAdRQbDcm7g2EV2ybB+sA
 kbpsLTK0e13Lmb3+6uI74xjXYuy/YimDRC74GlmXoUQui18Y1rVL0yONKvLlgvTJpbNSgUyx9Aw
 b2xNh8QbKOw6Bh14yYRPvjqg6pqGlLPeYFpKVbiJzX8ew6oK0TQUzcy4qfAA+j1+x6+GPyO/okV
 9oeWW6e1IawmgHD48KHgZAjyh39Joqrf0O5uW/96rFT/paBra1zdiXXJ9dfNP6kq+y1bLmxk+fl
 R4XNehR4XPNUA4ekg3GZEc9e62Fy3NccNfnvniAj693gmn0TkQbc8OSOuZPvELeMPvE2XGK3n5i
 uJKHZUEjkl4Pq0Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX82paqWWp4YPv
 4+7r4caCOOtmrWfMPemY5AAc+C6w6gaFFLD3Ydtt+jSrHoju7s/1zDr0qlK6FihAPxwtcsS8JW/
 7PKM6osR3VbDKyUr+sc5BNdhJ6aoLbRUh2AbOucSAb+bLpKIa/GrG0At8gGnyyzgNS4IEcix/Qi
 gYftZyYIfGOW41Z+EuWFH6RU9Am9RsWdBMx5RAjvTE5HOmYAH+9/hlKJP3zEIY2zS2tRhF8GVuA
 p6ffHm+DGTHTa00ppdNz7IFyOp48X5CS2JT6WUVOFEP11c0jdSOWurJMETf2anGioWzYRdX2y4W
 ysnq7YtVnn1/xzNL1fREKi6r801580UGiYABNn4yjKrtSRZJ9XeZBZx1cu+MqijghroXgkR2Qj8
 8399+fCGsfBAHENFmsTvK19eCNR0oAmVTMRlyPwFrGLms1lb8JTpYprzhLU5aaQ8K6BFtIc2RzL
 4Lb/xGZYSkHu70LyXaA==
X-Proofpoint-ORIG-GUID: sI62s_0HBGfdGdCWrRA7wUQ70PdSAJo7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX2v0P15iiR0w6
 er8F+e/XM04L4O7q3bIhCiooZMbzBQzylQlQ9zOHO2jPsaVaQ8GI0RQb9yaozMGDrmHraVpEFSw
 ko6E/eb0BIjmwbjXI92/pj+RuyDml78=
X-Proofpoint-GUID: sI62s_0HBGfdGdCWrRA7wUQ70PdSAJo7
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa93423 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Ujb343AK-uRHTq2VCXsA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150174

It turns out there is a UFS variant of the Eliza CQS SoM as well. So lets
differentiate between them with -emmc and -ufs suffixes for DTBs and
compatible strings.

Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
files will not affect any current users as these boards have not reached
public use yet.

Also, move the sound card support from the eliza-cqs-evk to the generic
eliza-evk, which will allow it to be reused not only by the UFS variant,
but also by the Eliza CQM EVK later on.

Changes in v2:
- Actually replace (and remove) the eliza-cqs-evk.dtsi when the
  eliza-cqs-evk-emmc.dtsi is added.
- Collect Krzysztof's R-b tag.
- Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (5):
      dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
      arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
      arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
      arm64: dts: qcom: eliza: Add CQS SoM UFS variant
      arm64: dts: qcom: eliza: Add CQS EVK UFS variant

 Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts    |  18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts     |  18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts         | 155 --------
 ...{eliza-cqs-som.dtsi => eliza-cqs-som-emmc.dtsi} |   0
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi    | 421 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            | 139 +++++++
 8 files changed, 607 insertions(+), 156 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

