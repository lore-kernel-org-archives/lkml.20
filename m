Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79164D4868
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063521; cv=none; b=bWofKabKeJ08zK7BPibbrtmUS87qlb5raQJ27L5Pa7X7WAnAL5Yi1wX87hVdYhZSxOiIVT5QTG5SktjlPlyCeRbe0SIsyA1vqT4fG3UMCVD2WpaEUs7RHAiEYzr8Osi2BVjfjluuqxCP4BdwHehdFTywx30dKPSf9+6yQyrtq5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063521; c=relaxed/simple;
	bh=tUsGnjxAQluXhBWdn1FaaRX8piLBvySN6gQbGp5kPpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gq38zP0MTTXq9P80I4rhNvzBQVaQBFQOWzyuPk10Cyq8+XEnBiW/dI85yBYUfeghjXJg2QkLNcrh/SLNZs3P2kw2KwT1aiwzpLVPqCSzrjJOPcHVmNz+0b2hVj8qm4WHDmacgNJDCjCp40wF8Qn0mmHndUSAD3ckthvAiiMcp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+OfKJCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NINsiYCI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+OfKJCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NINsiYCI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6ihwo2165598
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LahEUqXBwn8jG0TicUBeV2md0fZYZ7bCFAy745Dvk4Q=; b=h+OfKJCMK/D8zCjj
	P4uR4AAFlMj0hMhan7iCN+tMmBMkt5AzxdpOaLyJNUX0M7tX684kjZx/lq2ro0O8
	B+N2mJIOKoSEl69ibk3WqQIpFalHNPTRQ8lTbIwbJ2wg6+Qk3jvN/Rv8pm9npwVl
	kJkyB5D+z4Ntg/d+zW37VofRiTw61Ca7QJb1rgN1JjQVKRFyY8ZJkh+yODQmxRsr
	oqZ5tL2ArDPAvCXchA172UJA44TUBog16iOCZj6SCamiSkwM6rA2KplA7fqBRqiC
	+7m729fMsgKAjp5lpiWTX7ETUByH9t70rLbbPBpCwYSlnzHo313n3M0QTJPwO5Ua
	j0XsEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetw4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so602396985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063498; x=1790668298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LahEUqXBwn8jG0TicUBeV2md0fZYZ7bCFAy745Dvk4Q=;
        b=NINsiYCIMmZUA1Kghm9NMaxwn4DDUK5tCrzvIH87RFVcHcY2PtRg+fpSV1cRyx1JHR
         yycfrVohBJAVE17J62+Nf1ddAnoB6Gzcw1nUJIoOy24cpakqv7Jau85UgsRPP7FzIPPQ
         PofDpie44oG5EBFFYIe/rEI4gugQZydPSNkC9cRuocJr49psfGg2Z4noFODucJ8axySP
         Kffds2jdzkgp8ayqraJiKwnvDT49z1Bsyjc3qNLA5VFrRwRstiepnNcyBM3K2zUt+kuu
         pa5NGfyO+E0nXV41b0zwL9XdE1mZ3Ss/hEnHTQfXF0pGAbedPmDwRJ02TeeHhOqM5PFi
         ZlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063498; x=1790668298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LahEUqXBwn8jG0TicUBeV2md0fZYZ7bCFAy745Dvk4Q=;
        b=1lj9FfCAHjuT/4CSVlV0/2blMd4TOjs1A/UK4A2jCcwKJhe/jSBU60Fo0R1pUHQGL1
         rqIsxNTPVKvB4Vf3qaKPTfrpb4D8laGrcjQ6yf4kMoIl7M4WXgUuvr7SPwOi05smq+FA
         te5VhBu2Y/zMMzu3BmwKjBDATO4+5UqlePd02A5XgQeJfIxQ+w+L7803sRgzNnjfxsn8
         Yk/31cmpkDhF76hbxlzJhHlpmqJWDtD6NpL9hQWTli3D+c5gyQNDf1Q/OgNol1UC8SvX
         gc/K51OljFrobqETpoN6NWCnzhq/QUkBTu640BBBKarE1xgzKguoUV0nSIPL0t+2XbzS
         hvDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3RyrMLf+AI4Qr4zHkfgoG3EIfjG3obQ1S40S+RtxMp2uuUibiapsYd0evYervMDl3UN45PQtMqHu6AXw=@vger.kernel.org
X-Gm-Message-State: AFuF++m6MaOwD9uBKsPE5I411Hg9Fiq6f56XFPrvEdtiQUxivoTxt3kv
	IpI6EDUQ2zMcFXrEUEX4EZUlC/fv8XSGKmAHpTiIdfitlsWBDAI5C46Q7P/AHed4o7qTAWt6D9p
	1H9clDSm1L1GTvxkfTaRr0/0pwvy1VnorGYh7oZy2X4bwOdpoW134hfqpmDY47oKVemQ=
X-Gm-Gg: AYBFou2FzncZ/Z72oZJ/Ox0AsuPy/xegqEP0Gld5ZXcIpqL51PB2bdHBKnnsrHKNwre
	1pvpOsWYCEFHV5iuCdVFxp2fq3VOA+7dS7crdbBfKj4gs+knhn2EsB6tU0TJHiJ8oQnWhufwtjc
	O7nYTDPxntHYaIb21MmO418j7Y7iXwvxkOB8qloo9b0M+0iM7gW8iN4NgyCj15OsBhWTf2RrTOC
	2FoLVX1p8ftpfDffIcUi2yK0yXGpqiLlpcSwr6djQP7AcEgLkVArZdh3NdsvuCqBS3tFLWXQugz
	YFc1aMl1rOw+27e4wiwz9yknu3PjnLOyJW9xq+DYRB5Lf5Tl0hC9BeenHnis1Vd4rEhLRy6Zsal
	DPkUz9mQb
X-Received: by 2002:a05:620a:468e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93c15d9ca6cmr456936085a.20.1790063498356;
        Tue, 22 Sep 2026 00:51:38 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93c15d9ca6cmr456932485a.20.1790063497826;
        Tue, 22 Sep 2026 00:51:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:13 +0300
Subject: [PATCH v3 04/13] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-4-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tUsGnjxAQluXhBWdn1FaaRX8piLBvySN6gQbGp5kPpY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN1kS+D2XRkQuCNZtJEwWCr3TKPNBIvEnXx9
 JD4KZbkJBiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzdQAKCRAbX0TJAJUV
 VlwED/9dxy1P+qFvBxdiqeGEeAcXMkBXz9jaHuo7Sf6nPZ97RSnyy6RkIXINh5+ZZdOQYTXaa7y
 V7l+6ATN+PgF5n7acDUJKPjvRbhybVGNb8ELTWk/vFD7zOVRd9947F3n5bRNShdwKZAwQGgM6UT
 e8lll47S4zZIwVWWMi4UQ9+4LO5vninutj3GniBlbcckKwoqhDZjd8Rfb0OlJ1/T1qatT9LpggI
 vBKNn78HutAFwirOkMJ8ppSUsSYqt7H5AxHEMBqaHSi8oOG+1Q1riyUJO+Lqd0Bqjv2wMy1vgHY
 eUy/EbWOIADEbPwxFWJCa4BXVU1vXhHh6ZNzhYuw4KJ48iFKI0ZUJz3FG61BJ4KzbHt46P0uJ6+
 J/+YVLweT1ggGGWrAz74j0+/7mg0PYfqmcmdGRYlsalolnkoZmjajbfYdhUqAIvsAUzttOfiuLH
 uggsnZuaOt1r/2rxYvUEBKbqCLe1pJ22Uc7iIuz3ARq3NesHLQIAPvbn8wupXqqCBJnsqNCG/1Q
 nSZsirvZOMaNrMcpseTz/1v5SdwoI6g0HnFXjGPYZw8AqG3OMb8kiTkJkyqRshi/gadoVBFZPeW
 YbpRTelfu1MUna3LNpuhoVsTj/3dEVu++UcGy40uuZ6RpY5myyS66zDSKCT6n8Gf4XURt71W1jW
 fx19mCpuIDqnNPw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 9-CI2x0SHN46Q5AxsukSoHk1sSdmXc-A
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2338b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9-CI2x0SHN46Q5AxsukSoHk1sSdmXc-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXz0bx+EZblAjn
 O0LeDK/ZugKxrELkndrnSuqFVfDku4JxT/JJzmo5s7q+/R127pb8wtKhziQs2fw61vx0sMSy554
 oTnn+Ygiqh9kcrYl0H41YpMgvi80FVDDb+aSvQ5pEDkwfG6ccjU8MJq4RJXwxFP0QvIlVdMN60F
 v5xBkgwq5nAr25c3E4/HIspgQGXhjHzyS9KCslXtRMFzw5oH6t54+Jcw1DuR3ilxDziBSnu+Mlo
 rLpJSNjHJ83KM7fvBJ8skZYe1wGlCMwKZzLQEEiyFwM7A4H7XIgTiepYSTu6YwVO1h2diot3SBq
 V970ryV+H2LNFeRVyv8B85OKRKYZeccCsbH1j7ggn0XPvocDZDLAcUUzcsxKTYV5sFQ3aE6Yb1h
 3dwoRr05Iy8gTnovuiyK8wrtx0Cy53fUyf5ftjLlH02lMbr6g5rcpaHEvdPPYOTzI8JMhWt5we+
 FB1GnY9tnw2z+qeXF1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX3Qly5EoNe04I
 jhcwug4RGpUziWzDKRnhJiFI/mMr948CR3P+0a3ccUNY9LMSwyzJ3dJjDI8f+b+NIGs7gJVS7Aw
 AfeXcGYrGxHacIcnotCGcGK/KaHsXiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ad62350ba670..f48e6bc35006 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1093,6 +1093,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0

