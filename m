Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D4E284B2F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269002; cv=none; b=aWteGLkD5DyZeDo11WzLadfQQmnsRMwVPWXuK/0hlj53tkUxk2bN+IQYzgtddUNS3YAskvLR3iJ1JkJVvOQR0Ehdw8UoUIZex6Spv7tvOqmLdlL+4rmm0wWhr6uR6DTPE1bApEG3RC/G8hfU0kqSXogho1rc12qVvW8/W5/a04c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269002; c=relaxed/simple;
	bh=BIvWPicuV2iWJ14S2btq9YUnV7/9UjuIG7+E2qxadXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcV0kBb7d75xjwitz4EonMrVxZRN7BZPIZmv/p8gu1imkZqkZEgzLsgp7vdmmq/hGd4TCxdQloGrq839+C4CWOYlSyePzjVK9jED2arfalDDuYpERY/liZESSdHcTj3CmAu/42F0uLIZw7EjOIT/MQ5JoyKr6sJRVGzq+RHjugI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqlaU/y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkTI2Q5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqlaU/y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkTI2Q5C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdJJ1767349
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=; b=pqlaU/y5IhnmH8OL
	SpzuEtRad3J3e8wEZJvHvoKfOyYf5fT9FKXiKlNJErmwM6zJYI3e2zrRPPOxUN4x
	BnaWC7SrTB+DEe6xHZ7xm84fa298hw8djONfpPZabpCb2zCYM5XBfsozwZPPVvdw
	9BdbXSn+nuiYul4lm9kE7jVNQg6dnOYTJ7XwBz2MuAbVOq/nUozlS564F/88UGD9
	+Wb3AaklOHIQCdYHAlXmg0sWqHVMG2OCVxejJbrNpIItaq9dMSjL1gR8T0nQH0S1
	NLvdqvJperP0DrwAhIYYzj1MqNiowIU+3N3ZrUakoVLMg/epeAhxwxeZ3xooRHrv
	WUVQXg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx3dg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:23:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so121243e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268999; x=1788873799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=;
        b=PkTI2Q5CJmEr01wfc/aK5Qt3f/8/mATlMJqawjGqc/3oYPLDNaflARpHzN8p0aAE4A
         d6YyNev1yBuvs+gwEA1ipzNlR1xRajjpdZsa0s6Ffr4JKUWgwjKZBUjp/4oCjh69IPoK
         oc7Mc921K4t/i/R6SP7KJMdKtSlEPwPZynovQMCi/Itm9iUNwlH8lAnYEMZPCKa6GrVY
         USZC2tcTiHueZQPdIKoNMV/Lf4sPaYlr2aMzKzLTKXZ50Clo2FTj3DJwsUqv0MEcO3+W
         VX3qYwDRovqOli0B0Ryne4a+2TrGpq2uDL10BYGREFqG5yf0uYtnT+dexZmbIu/UDI1c
         jWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268999; x=1788873799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=;
        b=TLFOVO18UP5bAFjUYlNma3Ug4FI1QLgxhHBnGAeYIrmdUPoS0AGYbh+MpYOhaIU5cg
         MofmdgSTjThQLk6vFGuCAZJjSZp2N+su9HRZ3/u3rRCzIVcWxK1sQFpAdxUEst6ruKwV
         Yg1WnJu/fMr4E6Ha35gLO21Yc6dPRK5NdSmcI+9SVhvOCVno1JR1gMqm8hUoANitMZ3A
         KBGeMAFp/Gs1uX0hCETdp1duHZ0/2uaqf9PHeaCuLMcbg3iOTRkXcFNoWzB1M68l/EVH
         yXe7c8S9CaB8+1Jkb/cKhodHqZJb+wcw8+MKL1NDleMEwrc5xt+Kcl/1tyUqfOphwpQ8
         Vv8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpwODyahgmDRELurFFlkFlIi1bQo5yJ45FKM6e3q6CCLRBDri23hfQCyRO2dyIPs99Z0luwcGEybGQtkvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n97ywVQSgwFOVoet2JOhT2aIdrvapH0lRgo1TRgMXrKNBwXl4I
	XB2IiWvsagmQekjlCHetYxTU8ZHt9bZOI2k6GamMPjvp8esshxe0ZOA4BcClxeIoTvgvZ+T2yig
	whctH/TfOCjeT5TXZTYcwOx1OCb4XCkohhqf3rqX+dGZDG9TFcNUb2yMOzPuShyVCr4A=
X-Gm-Gg: AR+sD12g7GoFTkIZp+wtc9VUz38SrS0zmx58FNbg4jEaa7iLjR9lPISvXu7zo8+NQTe
	aHR5ylf0sLAEzA8L9rQANNQQrgk6LDm6VxlRkFWA0569JyOItzU0/FIVca9dPZbIs7Ct/zvW8ty
	v9/MuZM9r9i+ZYoofW53zrIpbBSYDx6TEWaXsbwJV+QMZl0F5kobamIINsNBPZIN9qgi/gezZvX
	iT3f+l4wjWNFdfnrzYwU5QCDp18+iPZ53WBUhFhwG0bkxDe1DC135PS6TFhKwhdYYbUihVWJOjm
	GsSwHt5bMqP+EadWisXkYj/nrnS0l+4MRRg4I96QTpApussEIiBgAyWymIBrq3o501xQ19qozj2
	qnmTva+tgY15Lm7Bgv4tOfQ==
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830142137.1.1788268998965;
        Tue, 01 Sep 2026 06:23:18 -0700 (PDT)
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830117137.1.1788268998314;
        Tue, 01 Sep 2026 06:23:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b34sm2867117e87.3.2026.09.01.06.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:17 -0700 (PDT)
Message-ID: <f328d93e-2df6-4c94-b7c9-cc0ad6158f46@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96d1c8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=B9jzo3DVsI2-tMNqGVoA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX4AlFqhdFIiJo
 cEBJoU7HgBJi5fXp+jP9Wm6JAIBj14cxxOh0lEU+Wt6HMdjAAg6OYNn93mN84k9u6w+v+JbpXBR
 uaZ4ldYeHFJeU1fNMkZIIuRXYHTz508=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX2kxitCHWvS7s
 5X8Z0lb7z+ucPCeHH+ceBI+69DDstO78tevBgffRUZZZQAZTBnIjNBX+xDI7+k43fCN6HZysu5P
 A9w4MbD2QVw6zkQjFi3N7TlY4F+G19mAtYFsD0fNSgrTIybe5cy/M65LaEQ4aI1V3o45GT9DQi6
 DlJUsLJmqGiDtfdfMLnk+70BU0uXJs3aewcuxvJlnsNn34AuzBTOhRSmqKcU6AVPA0b9mCJ5vHZ
 mTgei9xvGXOnpXRmPqRauYL2lpsc2jN/byCYyZXu2TR3DINf5XhZ8AepID33dvX5mP3Y/wR6XYd
 iCzH2nl4jrgGggMudda+5DND+Gah9ZUv5vuUJnKrIDYid1qFGwiDwLnZXj2fcrNOtdOnWKXDNW3
 YROJJViKTbhKFZzFp1ud6r2gRHDOsa88QC6dU8q/tg6yfMxGFPZbJCR84Ch0nT9ghDizrcqEBUM
 3vM2qqVKHuHuvFK5IgA==
X-Proofpoint-GUID: DdQcAT814jXDA0ZWYSb9Fe59G0yHLYAV
X-Proofpoint-ORIG-GUID: DdQcAT814jXDA0ZWYSb9Fe59G0yHLYAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.
> 
> The PHY outputs a 250MHz PIPE clock routed to and gated by the GCC, so
> register a fixed rate clock. In addition, add the register/value pairs
> for the PHY initialization sequence.
> 
> The PHY requires a 5V supply, so acquire the regulator from the
> devicetree and enable it on power on and disable it on power off.
> 
> The code to acquire clocks and resets is the same as for PCIe so no
> changes are needed.
> 
> Power on/off sequences for PCIE and USB3 are similar except for the
> delay timings and USB3 requirement for the PHY supply.
> 
> Lastly, the PCIe and USB3 pads are muxed so select USB3 mode in TCSR
> which needs to occur before the DWC3 USB3 controller resets.
> Otherwise, the SS link doesn't train and remains stuck in RX.Detect.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Let's register both PHYs (#phy-cells = <1>), but only make one
accessible. Otherwise, we'd need to alter the compatible to access the
PCIe part.

Konrad
