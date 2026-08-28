Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8C3803F9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920679; cv=none; b=dq8+bBc82GJOLwMcKTmReiqhrwkOwNIkV1LKRyqDfAqmQSCYBiAL7QQl9aZX1xn7s5Vx6jq7a0al3tLtXPrssktsgg98Lfg8vrXt4Q8y5mYI9PJjlStwgJ4TrNHEOnkkTuD/C7pjs7pw1XO75/pDt3GVyF9Nf5bC4jO+e0jU4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920679; c=relaxed/simple;
	bh=Rjx3VSh+IlsFGXPOd4PqGFgEuLCZfA72s0nj72PPUOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=agjEpLIbyXzr7r2aAZUq/qrc9S8ecX5auhPLHBxp5q8oC0rKqBMQxPhbvzyUpBlTRToywtT4z9HM1dWJabCVZYw95RaTHjsDscFibuilzevm8e5NNCmDZlrbBmQYA/kLs4DUwp6lVzbVVSLHlhKVP531/vKs00gT5P1uPeoGYRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QohzRm/C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaU7BePq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QohzRm/C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaU7BePq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA82RA3064163
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PIoVaCrEQeYK2SkD6sBo9V
	cjHFekMXJ6nFY5Daw1Wkk=; b=QohzRm/Ch8nwvVTlQ9b7Z5baih/L/hK3P/DpRu
	rZKID4IgLW7tTId0PIL3FudhYJvMQK1hORwApkhgMNucGkn9Guq065iNOk/n5kqa
	FOYlVsQwQLRfyQTF3B+X0t9QLMqCnjP24c3nF4tFEkCUUmxqTU9V9EDmxYwCEDJO
	DZDpTuKvVIrQgKvEIe2oAF08zNqdQRTft2jrcGFZ2N+hAuodheuXoyiVSUUAq3KQ
	kwEo8ri17eWr+2Mvn1hweOmf3VS0elYgh/aTwt9z05YEfjBdriPGk3RAQNhfrwNY
	BAt6kyl2m4Frl+j/XI51yLAhjpP2AAIVPYUr9lwgOsQj60rA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n1n83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso9842081cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920664; x=1788525464; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PIoVaCrEQeYK2SkD6sBo9VcjHFekMXJ6nFY5Daw1Wkk=;
        b=jaU7BePqR8KQkgBK4g6RyfGblM9TBrX5d3MMtaYbVtzfCSzNkbFksk0mBe6smwGXhW
         Oo8ZoHOrbkqzXopyLIchZTrhcTuTVKxK82yfncMLVtY6QdKKgzQptq603OPAYvvNC/ya
         1Hc8nDvent98CothD4GJFiWINt4wfOpHYl8EEG6LHOfR1ee2FyB9tuGGGhhofWJPar0E
         HGKJmHOQT7/wS64Ee2TYHJpmi3FToTwSqJT5mVDfLvXeDOjjmoi59UGw9iZ+8unb8nIf
         uJRW3PYlcX1rrWtgIRaAIIttl6EdsAkh1h1rpUAi6yTwFOb88PHFoazxPY27YQIud5jE
         2Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920664; x=1788525464;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PIoVaCrEQeYK2SkD6sBo9VcjHFekMXJ6nFY5Daw1Wkk=;
        b=ZO4A3gvB8inX7T2BgIas3PqcviR9T6f/+Q3174Zz0Q0HXp2cO+bT3plfNB1B0yETND
         Y1Gf5O1PvtUoimTLT5iaNni8zQaMhJqXyTL7UV+NquibL2Y6l8gi2Q/CGs8Ebc3aJUhr
         yHLN8BAxIxJkBOE3J1Aa0mup3CdUlrYgSyCczTpPqnUYW62H/jqeYldEtikHqa954ZWO
         XbD+C+3ZW3XJ5pmNC8CUEwJbX/Zg9iHEYkUbAjQ2V8etBhcXXXGMb4adz2eX9vOtRQ2a
         X2mxEc2QFV7yuBNO6bZEzq7tV4MSwrntpl3992L4Mir0Os2Zas9LYlBdw+Opt27Bc6Yf
         884Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Hydo3XpCBTlJlCTE6sIcbIE+k1vZli8VkNGZ50ZH0hxHD44VJ/jT7UKZ49O03zLrKb7BoJP9T5rfwjg=@vger.kernel.org
X-Gm-Message-State: AFuF++k15ks3ANQM+y5lNqGoZbHAf40ABGhwjNg7KWcl7QG0MUfQSEzg
	mJYwW+Pxv4aJ4CPTjuX+N7594zzTUyL9BJI+DtAXS5PzfoozKbzQz0CYJ6zxeKe0DJtb8yoAX87
	95kWoXb7y1K5YmBLgvo/9ODQoS6qSsGMXtJRs4FQ73g5d3oupb0NrZ87xfka9vzMrPQU=
X-Gm-Gg: AR+sD12S/ju8F0tnINxRWfJefxgu6Og7CqFaf7QdQ5XISHyYbPOQBhaZbx9l7xnHhfw
	RGfIKj28R3t1uyU6TaXY91vmA1ZHc9UWNFrPD04edAolSMZxgHv/oZzWSfmnk8ze1gzSB5u1fpM
	qg6zLXvRHUUrWmN7ZDMOxep6x7JNVbfNUO8FlcoOr7iFLMXsTAoFBG6KfiZQ7tdlTIMIUuRFpDi
	WR0fxPNeOatl+kU5V7uoZtiWm+V34BQVZPMKn3SoelHq6/DM+OQpdtHhZeIF1a2KR0JDQElTzEO
	49Zkw4k8egW7+hh0pI44MC4xxHv5lgbvDYMMklIGBwNJFUsAO5nWTzeJ5yRJmpAIwnZCGyOf68W
	tkZE2E0k=
X-Received: by 2002:a05:622a:4d4f:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52fb94eae2fmr77319311cf.27.1787920663880;
        Fri, 28 Aug 2026 05:37:43 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4f:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52fb94eae2fmr77318401cf.27.1787920663189;
        Fri, 28 Aug 2026 05:37:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 00/11] arm64: dts: qcom: Disable Inline Crypto Engine by
 default accross all SoCs
Date: Fri, 28 Aug 2026 15:37:19 +0300
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP+AkWoC/yXN0QrCMAyF4VcZuTbQlU2nryJetEmmkblp04ky9
 u5Wvfzg8J8FTJKKwaFaIMlTTaexoN5UQJcwngWVi8E7v3Wd7zA2yNnwQdMNWS3EoUxIML6RpQ/
 zkLHhPbG4dhfaGkronqTX1+/kePrb5ngVyt8yrOsHzDEueYYAAAA=
X-Change-ID: 20260828-b4-dts-qcom-disable-ice-by-default-4d9cde057a51
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4977;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rjx3VSh+IlsFGXPOd4PqGFgEuLCZfA72s0nj72PPUOk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEBJetP6aN28ez1XNw8+P+KoPmG0mPx80SrQ
 0ijFAclBHqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBAQAKCRAbX0TJAJUV
 VnbMD/9+1B++b/1TqnoY4aQWd6FdbO2CpWKu/48FfrPtZlRyxrbN3HH5aPT756Q7flH9S7veiay
 IwifIeLoAkaSph3G7BLN1hIUu82dlQ+JGTHOaBy21jZdMsMoq4HgQy0XN+b75Tin9Zmy4xXsV8A
 8KaUnqW0KDGtYVq0oyV3lyWrOgBszlBV1VfQVDal8jj3eM+5YplasllQI2n/CW0hpeWKiR5yyMJ
 VSjwXes9217dGc2QqeteSK3/fr3yjafVoICHAV56mKIOP0tvNy58/gi6E6Yz1RfM1A6QebYYk2W
 K3eD4MJeOAp6hjhBD/gMAfivAXu45zKsUD2kNVBBh6aqLcXwEm6tFZkqO7NSnsr/kICSe57Xdfk
 LLkFve3Jc7/Z78xRLWe3GszOMyWmZH/i3KZFvWNwR5MCDBBmBtrSLoHo4x6Qd5APzzud+ftrRt8
 yikvlbdeAUqJrThVP3yZFApFs8wfw0m03bBl3A6DZppSqBdHMdGfuiuLLK6S38HNM7aaFocVaLp
 pJHP6MdvWiQuMcDCKKNMbSVCm8Uyjtolm5qxbTQDS81YqULI+veitIG0vcTU/bbUdpTF39DEmdB
 AJIN8Td6eUG58tfgQ2DIvt57rx/yvOqOjsTOT+0MaAvghfDz8ankQgWpxh8t2eRqg0BSwVTAYKO
 DdRLaFKsBfW9LZQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a918118 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JxKF5WyNfFDj0kmoagoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: F4L1kHOKPavRCnCtCqxbwqH20uTxQ2T8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXwRHQvLnQMpEu
 DIxEUiM/0X0ufTIk3orwlcBi4PJfhsiUKy6s6sk4xRgXRtQAAwQ6wvRkeRoqAGvKTklZORgQGfs
 pZHgJAC8ofnFRL5MzVUN7QAD3ASoWDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX8Y3cKXCa+2S5
 Xs/x2Tef08G6D8JQzSELBGb2eiXixnMXErxoAZeWvdCP0/6479TVtZwX6iRQEwBUCA30xhuhsma
 WhDEadpDyXcyg9ofWctpB7DbwWQ+XEBrcrGnZWYRN2vtIAOYN7UWXM2NSk82EHwJ1MZeYfwg9KK
 ucoIedxWgqnUIBJvgdhTYKiTity0zr1sPuJURfH2+h8oe9dpcvRJE2D7AW5IkjiWYyxlLGSEWpR
 JbI3DkvRJ12OUukwErp05wz1SigPkDEqOyMzH9hJh6c/mwxUz6JWb+bp5jSolpAEYuWjw4wKHKH
 +/yse70MWO9s1rCZV3810t3QpS1HcJaVoP74FKXIth42PwA7KHVaNiGJwYnAjL1MTsLw9ZDxdlU
 jqib3a3OemRFQvabuUtSHJqr2CkVr3wXPcmM8nBG+mMYv9zjG+4WfUrnSUOgvxBaNBwuoDTLvX0
 sJcIvSivqvxOahHWZzQ==
X-Proofpoint-GUID: F4L1kHOKPavRCnCtCqxbwqH20uTxQ2T8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC was attached to the Inline Crypto Engine and the driver
does not currently do runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

I'm working on getting runtime PM enabled in the ICE driver, but the
node should not be enabled on such boards anyways.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Do this accross the board, for all SoCs that have dedicated ICE DT node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (11):
      arm64: dts: qcom: sm8550: Disable Inline Crypto Engine by default
      arm64: dts: qcom: sm8450: Disable Inline Crypto Engine by default
      arm64: dts: qcom: sm8650: Disable Inline Crypto Engine by default
      arm64: dts: qcom: sm8750: Disable Inline Crypto Engine by default
      arm64: dts: qcom: eliza: Disable Inline Crypto Engine by default
      arm64: dts: qcom: kaanapali: Disable Inline Crypto Engine by default
      arm64: dts: qcom: lemans: Disable Inline Crypto Engine by default
      arm64: dts: qcom: milos: Disable Inline Crypto Engine by default
      arm64: dts: qcom: kodiak: Disable Inline Crypto Engine by default
      arm64: dts: qcom: monaco: Disable Inline Crypto Engine by default
      arm64: dts: qcom: sc7180: Disable Inline Crypto Engine by default

 arch/arm64/boot/dts/qcom/eliza-mtp.dts                        | 4 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi                           | 2 ++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts                    | 4 ++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts                    | 4 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                       | 2 ++
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi              | 4 ++++
 arch/arm64/boot/dts/qcom/lemans.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi                           | 2 ++
 arch/arm64/boot/dts/qcom/monaco-evk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                      | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                     | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                  | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts                  | 4 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                      | 4 ++++
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi            | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts             | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts               | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 2 ++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts                       | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi                          | 2 ++
 46 files changed, 162 insertions(+)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260828-b4-dts-qcom-disable-ice-by-default-4d9cde057a51

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

