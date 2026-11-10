Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315484;
	b=L5TyxgucxSeUCyy6hup2K36Y1U++bYUI4G6DWR1377tVSqWZx3QNkgyaBf5Z47032RzF
	 fDYHV/Z3wSSE7RFiiSOJq3L0v5CzYs/fbkFvVAXnNeX42qcVGq61/xh3I5jaVMnEsIvOa
	 AuW2S4SyJj2F8YcBKupG/YXDrYshV939MBDbTC0Q5D7BnYV8JHTAKhHjM0FD+W3nLiIIU
	 C7rAlNL4GCFhMEHbaCz6lH4jy9Rm9rpPl3x3qQng41FLP/YNEl9nL7JUXr7fyLLp47/K0
	 z3PiWDfEtKtqWfo+qi+9LrBLDEA0502BO3l1CYy3LpNUn79DqxLK0AgRK4/hZe0ABpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
	b=eAeX1knLpopUh45jaGS208PX3Hdhsw4kAaH8blxZf1jlX4ifonfkzLXS4YCxnquo6J+q
	 ++G3OHpLm4j08ip/JICFuPiWyMuKQ6N66cQqFGS2AlRz+I01kLIRg23WUnMzG3ZwbQkf2
	 KvKRyjuCS7s3HPR3OaNdnjJ3mzco3cU2COl3eYFLcIkPK+73PIWuvTThMXc7PF3BwI+/w
	 1CNu4hf3NIdrnqPmL8duWDDxjVL9Wh+YUHkT0DgBHOAkl5JZW1VErTS75tKDIg7IUatGQ
	 h/iWmVGwq/MxKQGvLUvPHrLr/kQ/gINR50EosUSryteGpa6g2OZ4iSgHcOPJo50ncnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ej7q/biG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kStwgFTq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69660A6F4B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD69660A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej7q/biG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kStwgFTq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAFO73178179
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=; b=Ej7q/biGRMdxc/8K
	26SADomgPfH7/zN0Bz+Wg02ndgQG/eVGnlUb/1+O9MBiI2xSMNFpRDKvCJ1Wkwlc
	akY++Rr7krpNp2RHoZiyjXEveYh5wzbLhP9c3BZ25RnOQSNN7yUVbquuPeCuYozZ
	Iee1Gq+XFKbzFPtXW8qSG3VvQx9F/pejVtu1RoRrVeADRkGgzQ1VnYOCOcRNSizk
	uxLOZWwWHTyrnz2GKRt8ym+1y6uCNDVfV2y5UTZackoxfrkXZhT69aGDvQOkYX4D
	yQVN7CL5FiCQtp3UWLmQ1SKhHNT48+aADLE3G2zJfgVqNUzmdyC9LUmf8EKxTgmR
	hQVt9Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrvya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2ca2a4489so385030137.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315482; x=1794920282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
        b=kStwgFTqzUi8BGwIfr4Hp41RYzM6lGJhzucooM6jN9TN8xBOJANaUHdV/rppAhpOdH
         KUlgCJcfyV8in2osHrbly28MriK6tc4UXDxf+pgXUAzLvZMVsB0ZdR2F1Z9hwr6Dc/af
         s08mxm/LeDTIc+rmW4WSsQx/DtOFjXwe/GGFjlMLqy7fGMGm98izkBiFhhHIk2dSFE+6
         uXVVd5mQypVUEKNsZ6s7nXvqSVKlO06VnvxtH8JaMep3n90xD0lhW/s7Kmh+93+c7RR+
         ELraBqyXF0f5l4cdWJtI049TfCg+YnR2LWRviIRMVE6wTLpMhT5gmAjKvr5fYwyE8Skj
         x6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315482; x=1794920282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
        b=0AbmMelFDTLw1p0AbZQuyB+Z/faT5rCYu6MTmWrW+7zQF+nDDaikYAgiPJgu5VFD7Q
         Tx1NuNfhgauGWNpor+ODu4p6xlhsR+s097d1+3D4xq8QnDr/p32+VFahwI8HtYC22zIw
         bAn9cZ4V4tmFXvLfg1pG4Sb5PLOAxALGxLxoEsAt3W5twurfJAveMRPo27k751VSmWE1
         PISlzBpKcAMXp+kRaGwgwea0/npOTWeJE2f0zZpuAFgAHl7TywUa5wUbJHJcUqtiBkV+
         EEGGgC6BV1OKh7gMywIPA92fmia0Oxf0u6hn9Ihyjw9oV1ZyeIvG2kvTh+Fjt3h62iCP
         BLVw==
X-Forwarded-Encrypted: i=1; AL+hErFaxcmzntGT6s5DjXiGWiXV102/+sXWW4M5etKGFInGlO9p9ks/Rm06IBimwTZxVELilHMws111qABZ7ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g2E5QyovDLdksAfBIir47ZJz6n/3dZkAtPqV243Oxln31FvzU
	JtvkfLHAuh1kTfGx/Hu6dCIVFm5ZX6gkr5l2aRbDV8DaQtkzUrwo8/6RkelSq3dxAUMiDAQ2mCo
	aA4Q8mIppIOwkHhMbI2vQcQI66hiUAlCJm2jvnJOrkXbg2rWoMeZGaepDOUjsBOTNMcM=
X-Gm-Gg: AYBFou04y2sQ5UURlXCu65xN75kyd2G/VgLrbYEvfb+fgTn+uOK+5neW0xSNQFvtixt
	xJWhXq2jnuC4Ar7MFXpLOjXheaPXO646mj5QQdktci8w8A4ZtKOUT2SDURwZyrogxUyg6fivto4
	PYzly5PAvhCmlxnIRM/K+WnzSbCxXHS+tZfGDpB8MqTgH61ODkAi00n9m7HWRtjbXK5TE6Myhg3
	5VVZHqrpyIC5PEyf34ELYtvuabAJD72WNhjZDzOkWyOjaKQum5k4IywfFw1zImQ/xlzwzGbOW83
	GlnaAqAYZrDqokd8dGj0DowxRIG3ItfAK5mfSPEjIFfCfy790+edsoNUwd+mb7foqvghrsUtnWp
	90yibUiXNcCu5TxyII7NpZlnYL6b2gM/dhHI7BBcYPaMa1LF3n6bkgv3D+zvjVop4TSKDsw==
X-Received: by 2002:a05:6102:2b9c:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d301ba38d7mr715664137.11.1794315482069;
        Tue, 10 Nov 2026 04:58:02 -0800 (PST)
X-Received: by 2002:a05:6102:2b9c:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d301ba38d7mr715642137.11.1794315481593;
        Tue, 10 Nov 2026 04:58:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm58422365e9.1.2026.11.10.04.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:58:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:57:42 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
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
Message-Id: <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
In-Reply-To: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3980;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=65njRLBqDnUyMSob9Dpyv+KJXmakPkOeCvlHFYhe1os=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xTQbHWfK+D3i/RoxLJyMDJ7NZJC8pDAy4fvN
 hxuG2J5vXWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMU0AAKCRDBN2bmhouD
 19TrD/4m1pyWaPmrdxKPoimQkBa9g+ksohwgck9+Sol9aIyua4pkoOf52KzBj81zXbXkjzV3g8t
 Y1KRFZJQmYwpCgVlqL1195hs5em/cOz4hpqFxtqjSNvtop23nMswZ7Ipdr106yztLpwwUP01Uz9
 mmnA9byL3NZ0Y1iPybiQuTdkdu2ScRNZE3HEmlnzcJLh6s9ERkDG8OlrJHQ5ojrkAiq+PxndJ/r
 E6GiY/9AmbEtN6Mqz7TyxI1ODYE35KqESKdF/dxZTd5/jnw4pc7tnKKrETRuit+rOgcxCtIp3NI
 8XAYo7oiEzmeaeOQyoPm3dsq1mtjf7FJwa34nzQbwwf+vN8fMWZ1F+phcTdHHBZQTSGkZrruCMQ
 0wUSG6eW8+yJJOtSDTonlnnXtvVPi26mJWaBFtL0dRGnTfuX6Wl0Dl23rNdfKOOFuX0kyOuM3CG
 QZKPqTbj5B2TQxTEtrqXovvCMKmlpzRlv8ME9X/IQmN1FiF5nTF3nrxUa0Aw66Oi294bhM6UfY7
 R07DRV5vWuxcdmV2VP/PfGIOB/Uun91n3ePgK5a+WnyhSeHT/z0lYM6j9wJdMkUkB99RM2XSZtf
 XAEnx2X9wun9XCBv7tZ0JLHdojtUXdMpaztffXJcgSw1/VAJ1p7H1vfzVZHZkQ4F3wzYBtvpjjc
 cFle+ySOKTeKmzw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: MQm2YcIpjdmydeXx7x7wjzr4PnRKNx4y
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af314db cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NuhE5ioKuPUxyzsrWcsA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: MQm2YcIpjdmydeXx7x7wjzr4PnRKNx4y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX9acnLnQ0b3pd
 NJVjqbdZaetMTMtbqslUidqneczJyV5ve1vCjwECUHqNIt7Z1tqnyBWfxe1QYWnrKoZIBlb+5zD
 +CwH1LMN63/e4+QjqpdEvV69LEVzmhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX2WuZNAJf6eXT
 rak5mcIaM0qWNdVDc/jrx23gj29AXHMtkK/TShv5bNqb8My5VhVrnrtwFmVePIuY6PkI4LwqkNJ
 XoYWeYiEuRRUtAhrZ9KjVM8USzWvzzH9z/cjXHfEDvgv5SZXyXXLkOHa/0SdIe5htQGlwkUrrLR
 aSkU3juMupIE23zSMwEJIj2x4ZKpkBMJwoa8S/i2bqtYLfR4E3Zznm12XE+GiPtDhaOR09Ns9WM
 JtifQYfmaI1rYfn74frsE0Mhwf38Qt0+8GlVf2bFot1lSsa4Nt/Qb/Ilu/tA7opzWOqn1fbNObO
 KKz9kfoXZeyiHJmr2O0AT2QeYXZ1n5SlGLgP5ZsuPdojlxnf/9taaxX8GczwkJgqVoK8pzXfIam
 rk+73nvMGTbP5ePw5rw8IBkGX0EkRlPoThBZA2s0tlAqVoh+zNwpT2qoSUMBSzB53a30LrUjA0r
 OFG9kAEj1rWqX1FTD5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100051

MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
 5 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 906d31f1ea21..d3adbc7406b7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -87,6 +87,8 @@ &clk_pwm {
 };
 
 &mdss_dsi0 {
+	status = "okay";
+
 	panel@0 {
 		reg = <0>;
 
@@ -109,6 +111,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &touchkey {
 	vcc-supply = <&reg_touch_key>;
 	vdd-supply = <&reg_key_led>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
index 5b34529b816c..fe333ed489b5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
@@ -133,6 +133,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,ltl101at01", "samsung,s6d7aa0";
 		reg = <0>;
@@ -154,6 +156,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-gt510";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
index 3d6d9dd3b8a8..85d1cae19a66 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
@@ -98,6 +98,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,lsl080al03", "samsung,s6d7aa0";
 		reg = <0>;
@@ -119,6 +121,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-a2015";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default &secondary_mic_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 71b5c98458ff..65de798201eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -337,6 +337,8 @@ &mdss_dsi0 {
 	pinctrl-0 = <&mdss_default>;
 	pinctrl-1 = <&mdss_sleep>;
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,s6e88a0-ams427ap24";
 		reg = <0>;
@@ -359,6 +361,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5a00000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..7d351cd15f90 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1634,6 +1634,8 @@ mdss_dsi0: dsi@1a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1668,6 +1670,8 @@ mdss_dsi0_phy: phy@1a98300 {
 				clocks = <&gcc GCC_MDSS_AHB_CLK>,
 					 <&xo_board>;
 				clock-names = "iface", "ref";
+
+				status = "disabled";
 			};
 		};
 

-- 
2.53.0

