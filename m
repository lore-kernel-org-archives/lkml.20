Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002525;
	b=lWqdIyGH5Y6w+cgMbFDsBuIWbW0VveZOzMSDLhHqip0/fNF4TnzLxMGaPhdrHrHPSuMq
	 n9BjoJGcUKbhfFlvZbxQmrN9viYbEAHdLYXL8sxK19S8n9N04bL7KqvKGRHHh9TwRaBYq
	 AQUWtDnXU27XzmoIekMxs27jvHBY8huEwf8f6GbP0FfOwyKjpBKE8AlWoGsvcdCmb2eoT
	 XtnthLTUyUwyWYNAkxhkXPEMwsESTdVMlFVR6ReMmdE0squ+B3HXxWeVVtvBL0GZ/yJap
	 Zp19a6QepL1v2RtHN6TMQtP9ezD7t4ok2JTSMaDhTmwd2W1k+o5UMQEPqtGg+tc2hIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
	b=snEu2VzdbXVPSeytob5g8cLJS5ylianzsIHEFLCzSIt/El3ic4J6B9gn7jQYLQCsvPpv
	 lPcz9/Oa2O6t2S1zfxITEUOZEfw8rptAjoW17yUrvSt9RQwZvh5fwB+KUjf5YHAVhwJpp
	 +6QzI710AqS1sAMp9/++cYeFfqrl2FJ7HDSE2yKV9Z63RTy4gr+Lx851+BmnKsBHs8oVX
	 k5yh6dnk9FrV6otPjAMtC/mfzjZUJ9g5vI8T4+cjaS8aHMbVjPB3Yg+zunOMRmD8BoCH9
	 AJQS1L+bQdDBoeqQQIqvMqOtD6ODY9Rrr7RIL64I7li8j1RiEcrwcFA1xkGx6HezfDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0L4edZR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb9Ev+QF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116D606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A116D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0L4edZR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb9Ev+QF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JN5Ha1292156
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 22:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7yEuGiHrl8v2KO1Qgqcvsz
	xhl27VpOHCTIq8+dICIGk=; b=i0L4edZR3i/ni09UBm5ll8dGWzoybXYNQLNY5V
	vvjWK1712HYivGRWMj2Cr0tQQOVbdsYWGpi9Ro8Sdx9Q+FzOA2IjcGre3pVEBvTN
	yKxbUZv/autEtk4P/XkFKPl7FkisApPEC8XEpZrsTOt8wKXrO3w4owjazw5HnVbU
	qbIhobFg3jsbQNh+rZmmCm+y5+jU0SFsOvy6+0UAtJYIz1lvMWNWtwLCeyBOJdbc
	B56m5Ok1h2o6OM73xtAi9rK+Nfr1nZh+627PEGtr+WKjYbqUp5WYGNFVC0TnUtjW
	5L7Qgr0ZTEr58tCvpNvXtTcvtM9Fcvz+bRvSTkj8mgqCHo5Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsn0e0grp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:02:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so993602137.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002523; x=1794607323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
        b=cb9Ev+QF3A3U18mKZ9b8pMXoOzWDMSDM7qKajSNWixIqxQEvVigNNqodq1IgEGPFjF
         ou0zLWFZyG1lZh8YadUaNgorBNdceTCEVO9/bAiFn5vb740e76kqOS8rUz1cLxtOOPIv
         /H7YhGlt0JNHJkfaS3xLnWc/ejbmiptitqbytPa4r3dt/EsLyHUt8qdQSNypIK0d8voI
         B2kXcOl3xIKEEt7WsN8r2ROHQBa17LenG1OJGnzm9ged61p4O+eTkc72tZubEN3oWIl8
         zgIdAiLlRq0arosfmqiRO/7P7VIiQaPVqs++d/fxm7sqmcRevNGxV9zDkoh4vWOyluk+
         v+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002523; x=1794607323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
        b=tlj6kQ7gFpWgN8V8NeQUwykOFr6HGO4gVsml13baQq2UEEIAYRkuG8MkrCYL3c/5GU
         wGw8+Wg7X9JPsFOpuWYI/R2Q073L6UTmg44EsP/hdHWmAA8qeCsk5iRX4iUAqt8fHhLY
         XCtlcaKcGHlM2krypi7680LRZVkzCZIoNE9H6RKy2X9Y7V4DVJpTuaBbl01b1s5551mW
         RmpCL6G8gPbIS+K7mQLMmQ3EEBIBOsKOFq0s7FTTE6D5mcUD4PEPhUEADilFEmsYTh5W
         6yosbloTF4ItuYkJTgjHZE4Oi9IcQ+x2qHGWnPhgY2vsMlbrfNV9w1DNEkyGdJKrgsUc
         L9Og==
X-Forwarded-Encrypted: i=1; AL+hErE35dCQN5+UER01wLuxqz4uiEUcFIfDmQSFhwzeyr+5kfZjEd/tUvhV+9C+mqoMDMD9KaiXjP+M+Sgzk9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z88JEk/dt7PoylvDOTrmBuk1ijoSuN5EfB7rK2ieE4EZp4hm5Y5
	+98+7KwcdYsXq+mstBE/zZOVf7EiGtPact2QttrC5rmIYoLXCeQtoIbugEPWbOKv7y8tFZ0RXVE
	vU9RgynHfgnjuCHbHfC38B87BxafmJ8uZ5mUJzSieqipSnVLPHcBXtt+65chBSWGX4Vg=
X-Gm-Gg: AYBFou3SVD5lbmJgpJIIlBDujrdIbTG3RaV1e7oeNbPMl9agqN2ky7V0QfidMLBsg0c
	OXMMGPS+ATs+HsbexCRZUjz9BcG2aepIiSBxotI9aCUg8l2D2m/Ywp7EEMEc6UqyOB4r6A/KZNK
	r1acAugPviQuyV/uhrhNQ10DzR+sMig5vU7Ypwlbc/Sg4XxnOHUNy1fmLTW3h2tG2v+QUlph33h
	cEsO54Jf8di9rlJA99Ll0FuAPDD4gs81hnCndwl2oaIhYBu9fR0yYPviiHP7bNBMu0qf0AXwMhj
	feeE36l1dK1mFrQ3yCY06B2lqOZn+LEwO32KVH1sGccg5Xqc0jlMRzNKYtEadtuO047B1t6to2G
	nGo8+3OugXQYDOvW31ycuiZkq6the6llxJgEMMKD4cto0OoPH2HfdGaDnjA==
X-Received: by 2002:a05:6102:32d1:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d2a12f2ea3mr2331134137.1.1794002522561;
        Fri, 06 Nov 2026 14:02:02 -0800 (PST)
X-Received: by 2002:a05:6102:32d1:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d2a12f2ea3mr2331120137.1.1794002521849;
        Fri, 06 Nov 2026 14:02:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:00 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] platform: arm64: lenovo-thinkpad-t14s: Add support for
 the Gen 7 EC
Date: Sat, 07 Nov 2026 00:01:51 +0200
Message-Id: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAE9O7moC/yXMTQ5AMBBA4avIrE3S1l+4ilhQg7Eo6SAScXfF8
 lu8d4GQZxKoogs8HSy8uAAdR2Cn1o2E3AeDUSbXWuW46VRwJFcgWTRlkZVJ17dqsBCS1dPA57e
 rm9+ydzPZ7X3AfT9++Z90cAAAAA==
X-Change-ID: 20261106-t14s-gen7-ec-297593bda0fc
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=X8BfmvpE8W7+B2t4IJID/uS+mnVleh2clOpF9Xw2obo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5UdDjlMhFo+w5WSKkPrkrk+l7CpPlWADNeq
 I1iEjXex7+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVAAKCRAbX0TJAJUV
 VhWdEACS/USlBGnUt5PP9IL9TAcO6sJr1IknBqkK0SmE1IfcRgn8wxVxGGncBrEUKS4ITqqP3Db
 5lvEwB9dLa5Z8Ww1rTDriz/D7YdFoftjvKfJwFtHzZieZkgKahhUAIcm617g1AdHU9kILP3PzVL
 JgnEAi6Cs/G19V8njZ9oNJX1agC7gfijJqGkg8GQDVRpc0RfmBG33ZOlEd7jmcRQegM2dhTdaJ4
 5/qt/9bNQ1Cr06rMGwnVGsha0JUpNeAD2YKejDR9ZIUAk0lZgIMNysCqU8K3/WgwUOD1QPm3f7M
 AODyrwLhcpCIzN9mGWyIFJEP2/PJyALm0xz1TNr5R1/hsVlcrKW1UoxSpWFCXrD+IMkQdozcpbL
 1wMGHZUvKrRTW/A0L4HhkdGj96UIrUWd0BACPZiSOrFnxfZAvMh5Ub6OuZaczAHiGXpC55HWiT5
 rOIflvDFpXWVuqMwEoJDTEv5noN1VviR7pO3KapCuyR2J9gPpRl1RReuFs3tFIPWgLlWEr+JIZx
 joX+wrHb3Uc9FPTtHHvIV+a26zJF02NPSjo9b/qWvzU/zHA6GDPZ5MYCusVYmW585pHUl2OE7ff
 6alck/OwziocUisB479c5SwqeCFlKgcXC658z9DhGRIkBmk+0K+n2CsgO159oANrnXLx9nWLMY6
 GB8xlh5XYYFBUEg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: lsTCgr-Grqvqc7-FUDaCNw-NvN-HLRMZ
X-Authority-Analysis: v=2.4 cv=ffA4WEQF c=1 sm=1 tr=0 ts=6aee4e5b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7rjXLmKk895soiuU5V0A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfXz81DQN7wYilo
 /RbV+6Xf/HqQWK8YdkhTKXPsyD5FiQDkhyUY0wUAtqKgERjsVVmzOoPyf1abrVThCOv48TlPAzs
 HgbXvGaMvFn1qlRH8cuXMYKPTRhBFIl086N0HxJx6zWn8ovNd8FVSMLydFRXO4dVONaalbmZwd6
 Jjvyx02qbDKmabP/jy7AG9K2KIS0OgGAjRZkNV0ydaqu1lr2/tMPzoBfMntGsjogToe7ZQJoNNK
 5saNnSNlZIHEKVtBns0Kx6lWaQj6t5zlGngE1y08us1DuV/PdfizzMGyIGImfY9J3BAAylzPbff
 w1uYofhT29aA4Gv5vEih2QT5t2yv2Tp6do/u2Q7tRZoVSEWvpB3GkbKYuA9cvPOxi7/Rsa7fhKm
 597dwUjADfckIV+nY/6GgyV0/2SR3DhhDy7O+IcX77zw7KS5a9OlCNgSU7QAFIdCLInlkgufFxf
 1GIMDvMnXRhTMixcJZA==
X-Proofpoint-ORIG-GUID: lsTCgr-Grqvqc7-FUDaCNw-NvN-HLRMZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfXwOXA6feXjZwq
 5a4uss1rvk9qw0C+Dw2FAHRfGfgVXKKFKL15GYED0XZOyc4S0J5k6Y0OWqJ7ZprQh2w+Yh2oLNa
 GlItzBiPOooteqfgWLM5fEKncZ4A/dg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2, Mahua) has an embedded
controller at the same I2C address as the Gen 6 one, with the same
register layout and event codes, but it speaks a different command
protocol over I2C. With the existing driver the EC never reports any
event and the LED and keyboard backlight writes have no effect.

The Gen 7 protocol is taken from the ACPI EC accessors in the Gen 7
firmware (RDEC, WREC and QEVT): reads, writes and event reads use the
0x80, 0x81 and 0x84 commands. The firmware also describes the EC
interrupt as edge triggered, active low.

Patch 1 adds a Gen 7 compatible to the binding, patch 2 adds the Gen 7
variant to the driver and patch 3 describes the EC on the T14s Gen 7.

Tested on a ThinkPad T14s Gen 7 (LCD): Fn+F4 reports KEY_MICMUTE, the
mic mute and lid logo LEDs (including the hardware blinking) and the
keyboard backlight work, and Fn+Space changes are reported through the
LED class.

Prepared with help from an LLM-based assistant.

---
Abel Vesa (3):
      dt-bindings: embedded-controller: lenovo,thinkpad-t14s-ec: Add Gen 7 support
      platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC support
      arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Describe the Embedded Controller

 .../lenovo,thinkpad-t14s-ec.yaml                   |   4 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  24 +++
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 176 +++++++++++++++++++--
 3 files changed, 193 insertions(+), 11 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-t14s-gen7-ec-297593bda0fc

Best regards,
--  

Abel

