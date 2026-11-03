Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736374;
	b=pDh6VgvQk1fvRmVzMymv7Z1HtzBEKC6nyYJySDD6QShZI+tAcG55eMIz9C7yB3qRFAFd
	 QjP60+NIYZ18YWgddNA1NR2gsZun0dXUKhJE1d7S1a1oNLrWDg6lBIA2CRuGfwm0FEAmT
	 fEVEBfjXwLJKd1xuO9Fu+0/vsBhHuX2qRAXR0juzaphI/rAqP27++dHPLUFVbXsmWmO4n
	 1sqADWF1A1PIMIteG7yIXFgrcssvQKmXdDVuy+ZO62+3cMC32YXvRYJhs8EpKB/w3Lagd
	 AadEHUtXMzJ+Lq8RvUEx/wCmRysXkC985Wt7gHu0PLMUzuP3jkH3EQia+Zgp67jOSrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
	b=G3ueHqFMcyqNZ+Cpz5NRbmMqnPsMCPbcMBJw6n/84Qsbvk3NNJvyel7iHeKWb71CWmUi
	 NZNSS5VqNKT3R5VGL9kDQDl8JyB5eIwt98eV2m+8M7CWisRon6My0ryQD0vbjbA7kkgKB
	 /1LO8omo0cUgtAX4B13eRyNSGhh2swY+VYtRHXw+OM9ldsg8BnaMESw5ar499AQHLtHJ+
	 AQ+6nGwLDo65PikcVYPWbpaZJbrHC/4b4DrTDdpVCoCPiG9NMUnbotHt1T2GMJsHcZ3sD
	 V7XT9oJ5tx9NoNRx5yQWdnlLTkrJbIFfjBr/A597LSPdG8ooEKUI1ikHpp9ZTET7c9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTPtOJ+f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUjeFRwu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95083606D824
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95083606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTPtOJ+f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUjeFRwu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZgO12587141
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 20:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=; b=dTPtOJ+frAPEorJS
	bZEoMEy5MLagE9LydR1o2a5KL8mOWL5LJGPzqQozeomkGsOkzzPZfAU1TZ1I20jo
	fAzhG+f5J6G5mWL8NWHg2NcmWT6SvcdqLZK184nFS2ZCg4Tgt1EBpIEFcCoX7i5z
	U5FsxG9HRlL3OqhSE2ZyJkx7Thy83SSmbuSc1q+cEnZNz+U7a0U55AtObRsyYvcX
	2xI10a3ohK5rNmDnMO9qcKPSNLE/z9OxIUFADrdcxCCyloKtxvy6pJkQuagPm+iO
	0oEYWbdgIStIQLWe8cOtOVmyB8RC2N8psgTGg+uPgC4qatSD7jAvAsoRc+smEpzv
	1qIIuA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbrf8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:06:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf71bbf197so3531587137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736372; x=1794341172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=iUjeFRwumnTO7C4i+M6RvgCYXOdfIWovdu7k/uKP/4gkQQT3SO9jzivQls+UTvNI6S
         rgUq05Yja4QeEFZlIjoXp8EnQ2yY6DCK2HPjg9tzNJ0mYJCIaHN/divs0CCEE53pc5G8
         UzWW7S77IkifsxLzpdLYjj2mhLZM+73yRMxGztohsusaV3nz6dCV89cyTPP59R0BdFeJ
         jmh4L+Sf5o14yYycRTDq3/OnuHO+/7YeNJZSdUXQ/TE5eGBO4ZAxwuBc7eyJEOTIseOw
         vdRgk6FM2LjGHKDC2uqwxFxXO8C6gCkxS1Ta+t8bv/v6TyRhNL2G/ZNs8QZ1Sl4jPNH4
         mOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736372; x=1794341172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=BgiBbbZmHo5HXyO6TvP2SMvnpiVWLysBBJ+WGq2ZN9yqX5QDHD6ap5ANjT9iMkkhx5
         Zl7JY00f+g4938ToXmNlnni8ITnaOuWXI+GUecOtVdRDJvpnWmQ2G6RAkFWwcVd1tpId
         e2Ufjjj3v3u8CQCdN0bFHDI4XzknN0xWm+QJXPM1jFdCX8c8I74PrKtFmq1sKcWP+Pf8
         QEwwva69nhCFYqU1trcHshvC2J/N6tBq941yuKt3O7oqt90eVwRhHtuh54l7xWO9EzZT
         uXWyI2bvEDpSfUYfCUFvXi4Pc/v4XFLclR++HqgWX0no/dxLnlrceVVcAHKSYTD7AB+2
         r0tw==
X-Forwarded-Encrypted: i=1; AKwUvBwujhtg+h7fBwHDyPuX665+RiehaTVCivJtdy2In6Q/vr45IAhhlaXQ7X8O+ZAiFB0bDvX++XRrmAbT6BM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UuzpkdPzxGo5waCSXBgA/FruTwHAsoBbK5IZDau4iu5V78XOa
	5ttPFwKc1WFVW5fIFENZSUCBreWuWDoDnYphShGO2z1pm0/GI5o58iUEaNZLCiUZQmdFcx/KYFu
	bQvMawg92cqg3WK8C7ouhNlBnA9RcRGURYhiCRHlhKlK739eIhwrq6xjF3f4SHX1M3xk=
X-Gm-Gg: AYBFou1bSvxOnB5nyOkQlEEOY13VtDFWtpLLBPLtG57HM85lajzMaNH9krA12QyqAUq
	aYXT8eNin6oQLuDrM48L5uu+3WwlXt+Gqn5aKyaa5fp38nQtt2lM7E0vB/6VBKdKk3gu1Cyw+T7
	SsY/MA3EiAtJFiNuodWlXxKeipvb5VdWJf9rnjLOBOgd9oUBCUcQ08m5xKy+BfvkWqlWBtjMcZR
	Nwpl2JzjOOaTf1jTuH7I2uuy6kCEE2Gh43N3KixeU/VuMrnYSRqkKNXgManQro2zWqsBIfh2Ni8
	cy0iXSoKX0GDOkU0gtljQi8W0nq5X986jnmOWGHQBY6yzrHKRh6qRbyft1caWnL8KiwtAGW5wUV
	PZujGP7/u5kW4u/0UXmn5gFJOZo9+yVLZE6w620RA7M/Yk8GjHWT4mEWgCjcHyTleCfRhHw9U8G
	6+Zqp079Bi/f1Ehcqd87hVw+mazfyJsd8v8BvRA09sUopqf7Ul6IRCcxH00E7eHW/S+VxlKNtIp
	Q7kG0CF0coDO/o6fJcZFsacblLm
X-Received: by 2002:a05:6102:580c:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d072bc7564mr5895199137.8.1793736371789;
        Tue, 03 Nov 2026 12:06:11 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d072bc7564mr5895172137.8.1793736371275;
        Tue, 03 Nov 2026 12:06:11 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:09 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:53 +0100
Subject: [PATCH v13 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261103-camss-isp-ope-v13-9-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 4coLhqUpaLHl7gRXTw7zqsTApvzXzQPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX50Zx0Sm+65CO
 jg9+L/6toCKsplccuFnKaDWlFPLeZ6YqwSXZwvfOD7/bsTUBONcRLKWYk9+mjGtrwW/2w0q7T7h
 J5Wpubvu4Q+4nBhshm9NyUroCGZBNh1Z8i+ZBaU5k/OUhiXTSAEdnkDHEnA7rX+q5XWTMRTCF+b
 HsQ9uD8WZAdabxapbfTSos3tNHUd3h/Sdth/1zrVUL+/SpMu7b92YucQvU5bVs/Mk2QMLxQjSgS
 e76+ZRxpODiqvep3vcx8ckusOARhZDxO/Rzkz+JXOGYvgnlqXCB/dN1wqkWtDIt0jhKIhq78cy4
 Mpw4KLl/mYwZkn+yVriPu5+JEAxu04H+Ln0mbFQwXuZgE1URvstm5xX8xQvc4X/PrCnefCb2tpe
 tOdEeaw2hqC2wxaLpIjInwm0+Neuc53fKgHyfANOA6GemOqWcIlqjIDZ5L0UxZsXidKH0IQNZXR
 8lSSz5aepUqZdbs7Yjw==
X-Proofpoint-ORIG-GUID: 4coLhqUpaLHl7gRXTw7zqsTApvzXzQPb
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea3eb4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MWvNLhr-pL88feDBzY0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX7ulWJuElooUN
 RtprHAMGG2n6ihGO46Q2U9K4Z757LzRl+M7bmSNwiDALdzHUvGzFtuP6GT+YuUPfJMJFFCgPQZ6
 /VMfl4lnboBl+3kLQf/JqlfleGBDilw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

