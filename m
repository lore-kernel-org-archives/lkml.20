Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830792;
	b=1Q8ZNJyN96ETSUSpyI4SrEIePjZ0OYeKNPr1bnO49yz0l5pfowapfQqVvhGMqcWdniNQ
	 vduUXnRUo6HRGYnPeaMOHZIyYrAUBml0O53orazhM4/9troMrdGii5LXcG9ek5uV/AVmF
	 H4mJCKX1kV3PEg54NYfkorkoEnQMyjNL7LzdAEtYBzWyPpqj7c6AmvhfWyW5x6LbYFMU4
	 iN2CRlrVdH8Tp1Pq0mILUIwBUBJv5wHhjdJNCQk1X8a9nqwlPEWC7jTWoPjzxgw7ubtOR
	 bcYEzl+yWEvZn5sgp6ntqir/4yX8NhPOVX+POaP19lKV5D7ZMb/Nt+pdyZs3xqwmTkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
	b=ZpxcYBIm9PQlft/3g1n9yVnmFEBfLZLN1AWIUfNQ8MEmqLVVyHkQa4DD94HrscCSL87T
	 Q18mDV0jd0h1Wx9R7zRV7Xu7d/DyKl16bPUbzXLk7CFLjF9h4fqYv+5XIuaruuaMC9dS4
	 OdiOjnz9JMST6QG0YrRaNH6fCgnLQcmRZ8FF0vFalksaloQmw1Dz5KPemq2tkSow4JYCt
	 O9yKAgMzmXxWdiJnF6rEIsn8wSmaZ3aAio46dsb7ujvlkRiUboy3uzpyV8m/c1S3764He
	 bN8euEKT4595gWlzItJOcJna/h6hnaDi0NSta2MSBXaBMfTeUx9mEc3g1TrJrIternw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1waFYlH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etq4j8gJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15ED606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E15ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1waFYlH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etq4j8gJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1mnB1690336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/
	fVemLVYk=; b=l1waFYlHSGTWaKV8pcYoX0CPS4mxcsvQDIyPi0/+nQ7GJvpnP+N
	zGCTak4f3ddhLpjs4WqEyKaBKOUtICqvCfLxXS8HOjZT1jbaf6JqW+rvREK7VQ0D
	QHQlnJLRqKD5QeOWcV/JCUcEb066vi3nTOkZGZ8OBfSYgb4iNe/UjGaK4aFQdivu
	5UadOVYUdotcYxEVh97UOQJt3W0TNg6niWrsbW6vu/CRlf+ePT6e/Vsr7rN1+/fQ
	0auICp+vEWwosnVQG+1KVGPicMH4O/s0Q3eHFVRvZBJpaJ0j4i493R9ACD0/KQPl
	IcHTbwugVc4pXcBjPUHHpGFVvaqvGJFSNGw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc21wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso1318365c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794830790; x=1795435590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
        b=etq4j8gJm602Kb52XsWBCeLsdnPzn0XQsBJn6ioMSxlsQk+wIV7C/i+i69uWjbqulD
         /mDs+971ar3IdbXJuWBvMNQiv5kU8DdL3KqZY353eOxKWDfUWyGn4XW+NLDzWLNxunnV
         7QdG7GS+7S5HOh1bs3+SoHawKU6ZobWP6tE4CLeWXdvgFhHRV6cC5jEv1zXfjoCdYQMw
         RqzO/yysHJi5dauHVJtF2ImBAIwkN+pbCp0t41FzOkNGoAS4bvK4iOHV/WABSvDxyBvy
         Azvd4dyRaz9E7euEOg+jbl+fEXHDBBD6jA6zySXk8OcsMTUiPu/u+I6v2eBbiGrJF72B
         +ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830790; x=1795435590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
        b=UNSxlfOKV2H7yrrhOZ/VhtOfXK658GXxAB9oUFb14tg4M+/0iVz4srYXU+gPPTE2DM
         F+O3BvV0WflVyhmns18yfjYNnpYdC1Kp4i1XmAghknKCDKYY0j7LsPSO9o1JUUrzGuZL
         aq06iBGVoj0ul2kP07lHR2v5E3mPMVwfv6ibUKKO9Qr1h2NshDHs4s10MttNpDzyzu43
         PvXQJn2SsEPVJa1wVq8CF+kDUSJUJKgirqn+1bepcPTIud++3CUlPm9RLidiVRmwhQiv
         yxLGQZtg0PKqxazDOMXleCMVZs9igrDGQHel4puZ3nt1PiuBimCHJi8IPisgQ6arlCYe
         RGGw==
X-Forwarded-Encrypted: i=1; AL+hErExB6xmAAuLfxUd42BnwIpPmSvMtsSbELpk4d19TGbjs+hKNRUxn5EeskWPZu1W1+eoiLBGYthdRM9Sl88=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CXE0Z5aWpxq948nI4LMnED9rYDuGtS7ZLy42W+3craR/POpst
	2+rWdZA8vQn5wtTMl8HB80snNySxALVQjbBio55Ep7to+ZkXj/uh4jnXCr7E3nAjc8HDksVB/vR
	IVAaNRM55kHPZAHgdMoFx5boRaaOFsMZYHF6FJB9DbD4aGvRgomNA3ulGMgY8pxgnUgCpGTbOuF
	I=
X-Gm-Gg: AYBFou0dl0+5BHfn4It/S4Bf4wj2jLAZR2iwqKzt/9x1uW07djReb8j4YqbEkrvrFLj
	xZlI4Qbg+NhkN/EhGspN8cwc5jwYqJeZhJLzYSCjPMhuinDorQWC+kHFoOX7w/9Jqu4SSPgrCH4
	4x9X+7n2pYDTcr3uPIkHtfGjLeuwZF98wrOdGQkvM6PmvxVyOtRiQD7pDPN4bm7J+haPY+0BRUA
	4W2Achn+bElRFCl5NYn0y1KZYU/qIzj5bXLKPopTjfHf9jusuMfCKXpiVCl9F3tdBm+EwfQoAu7
	HLLB85IVTfSY4M69vujXS9pHAvRwkoVwjhpIq+SGKJPonZALMTEAE048PxBtbE1yhzNYnl01abb
	orj2RqG1Rq6HO3oFukgGd2fNB0Gd5nv4Gf0NthUvFFFl+gRRl3moH7A+Cp2Ci2P1BDNAzGimOgP
	LmGA==
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr10975404c88.28.1794830790289;
        Mon, 16 Nov 2026 04:06:30 -0800 (PST)
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr10975389c88.28.1794830789589;
        Mon, 16 Nov 2026 04:06:29 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm36961530c88.5.2026.11.16.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:06:29 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:36:21 +0530
Message-ID: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfXy2qUg8jDEri3
 nLcJ1Gewb+J0LSY8lkYtHcj0uyWLBNaxiS7fqGy2JYj4bSdkLD8mDvMhg7W5n0zeOTtkPHL4Tkz
 RkgOp+g2Qf99dMcPPzHYY94V2d3Sif0=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afaf1c7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: KqlqYir3CEf8v6xZHatq1TNTV3qUQMNM
X-Proofpoint-GUID: KqlqYir3CEf8v6xZHatq1TNTV3qUQMNM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfXykRUSTTsVWxP
 bqHSO0OUjkNxGIflYjM1IUDKBYk+8QLUJ2YDScsF1U+ntcZp2dFay4hOykqu8JoKFnXciipv54T
 iPovsDnsJSdT0dDFwojpu3qxUi2lqbLvr1NqCpz+s5UB6FNLDQnoQcU14pqSlwUEfLiUi1o3Khm
 F3i89ME2r9Tcfjc4AOByqtKvlnPZndZ7FX5sVdr4u8vLt6wdeBT3ol96fNmOsV82fXsE6rdEOz6
 Xpyzah+BHsj3SZp1A6HlSr3pYy2o1U/haP/kJgW9GzY5+nnYoSv9k9wSXRMiLWilwENhqHv/hv0
 g1x4ZacsK6plKONWxNIkbO3klxszZ2A4JOXY4fPE0+Kx96zz629f62cWWybU8HkQIPwUyUuhI/q
 fCFK+D4Ba0Paw3a3E0JRxszBUDQiDBJpxSZ6Sp8xvix35EeJ0AwwGaLcVwLqvq3Lot+lB7BZ+oX
 BP0Jy6LO1geHRFdNAuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160048

From: Akash Kumar <akakum@qti.qualcomm.com>

This series wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [1]. v2 [2] split the change in two
and addressed review from Dmitry Baryshkov, but went out without a
"v2" tag on the patch subjects (only the cover letter carried it),
which caused confusion with v1. This v3 resends the same two patches,
correctly tagged, with no code changes from v2:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

[1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com
[2] Link: https://lore.kernel.org/r/20261116114908.1701258-1-akash.kumar@oss.qualcomm.com

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>

Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 +++++
 3 files changed, 187 insertions(+), 11 deletions(-)

-- 
2.43.0

