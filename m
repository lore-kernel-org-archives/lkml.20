Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190910;
	b=qg0BB2lYbbUkpavSbAKCJ8q9DnTlLgVNZeiK8IQk1ZC7b1hauSyKyvxqJ9oQ1lvaEA/L
	 AHuZL4muZld4vsha0Xc9gs1HDCPs0F7vXiQFCeaNZXBJW9nDGDYTKzxVyTPazqXLk831L
	 9MN1ZrVt+KSkbKsfpm175ehLkHchxEutDzW6RwcyeAYx5uHx6kD8f/Z0d2rmqB7sKib26
	 gFYAUrVyEQofcZrtCBP4gia6zDM1l8U/LCYwQ9v1IpZbzruomRWsE3rqwdTLeJqmEPUaG
	 V6V7M8zxbysuZDtBaaUpkEFNP/+62CpkzNiQz5BXEHSLH6ezLsymTXsRfsK9tzBPewA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
	b=Z//+wkn/aODE3rqaZSwqrdih/xQ9ikVev86tKsM2C77eWJrXLsISzyr/+F5nbtpbWsAh
	 kqvzQ6D6s8st1JKXrzgjhyZuxfqB5Wurxl3zn5xvvracuFyUCfAgdrVvZez5CbW07oNiE
	 Pt79RJwVwFBP3lUyIfNUUzX1HjpYJxDTm2/njft4WDtBqCvuzJ0R+WTfWsplTZuvoMnDU
	 VCGBmtZEZjECM/spFWnIVXt7RyslGYFkgQHMit6LWGlkgzjxjdQd6Qz/Uk/TvLAJxloRj
	 veZZo1YtQ9M+aOCK16O8Im/4fN1Oej69njZfupj796+yBwgk6OW8nxL3prUP7wWUmFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwc1LhZH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0wFTqm7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA88606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA88606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwc1LhZH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0wFTqm7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4fh4154780
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=; b=bwc1LhZH42cw8Pod
	f/hrDrg+ZPh576kYlnJOIdh97mX4G4bjwj1+8t2nJa0bJFPHwwktQwrXoVznJ1Y2
	UtDYYgnyHtyHuUTUZkLD6jgObTrvyXW0EIJUOH6No8DGWQCfNVTRJ0cMTiXzI4mO
	HnVdUtPsR4a6VxwoxdxAfue/CRlki3JB7LS7JuzgTWrqTeXeBdPKb5ScD0lfuIfb
	DTL70WnpTvnkFmsWm18U2UNqhKGrs+FIIv6yJz9kHLz5Ds4kmA8WE1feLy7rIyKN
	R9Oc7nME1izXfF8JSXcROZ3MGPQCH3vhI0Lj9mUpfqpNkrxciMOlWy5Z6dilZGVP
	hahW8Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0t5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso44931e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190907; x=1793795707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
        b=A0wFTqm7P6zGBoFvzCF3hlZibrIFa0JqTR4RAxVIUnpsBOADslurzJzCXSKgHvhS1f
         bODpYknziYOKgwiF5KVYvVGeutkeJyM1kNyc/kzy57qXguGR69kFOgeEp9xsgz4e189H
         s0C6CfJcDnq2scQKMS+nqC0/RmKnzUuxS9p2awiWg+cjfuWPdxA5VTSq4jcKZ1c3rPig
         haHg9vQemkno6bcAsqedYLKw6+52bQ5oO1QdZvfqS9PqNpQojqv1fjLoDumKmQTWkJYS
         mMhuBzzYn/x9eI0/iYM8aSJciAiGfRyswfEKAScDEvTgoMXU5dZYKDtTULUyTuRDwApL
         aBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190907; x=1793795707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
        b=1x2+/zUlfWNgVfLFeGiR0rJAt8lTqYBIXwjuoMvLqoB1S4Ty3zWbArxV8e7X/zvN5S
         5YkZxP+FF/s2oGOGaPQ4TLTn5JdsIkcvGHam0rh7bZC3iliSRh4FuqFA3QsP8lhoYZqx
         FA/9P6Gw6X0G50SQ6+T4TnNL4B3FScNlBchudVn2YffeEtgs3JSwumsfVmhr43wZa1O4
         4VIJmmnPQTZ2GaE/X6bgSjMeb6Bk3QIIkst2DqOwKwjotBom5vnAT/4cml9bmhvuPsVf
         XzJQrlv63EpJjdgS6CbP+BUG5wdgm3bfQT2YYg1Es0m76rWr9oHLnePivisS0oib0lcF
         rW8A==
X-Forwarded-Encrypted: i=1; AKwUvBxzqZt0uCcqFJAAPxthps35/YVwZJY7nppKJ6V2E3ze3I4EMpdeSQ3g7G2XBRJnMDWWtSXk121+/S9eH8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyHSFV5th/d1fDtJG3GJ/wKzlOcIOfwhp0I+kar001IySyyg2Z
	cvNe6tUFqwC9KdHqyqclLelw1E6tKUS3TfriUzu8NOSEfAYjE8jGpsoBBFZsb6F6XdoaI3icQ99
	BzlDbkL4D863TrL4XD5CuXZK+lXaa9UahcrRgHlrVtMdLrNmO3xpK8cCL2/ctN+cf4/4=
X-Gm-Gg: AYBFou3YUtfZg5mcvZNN/iFbTmq2H4qKakZghsURB0jghuBgxGNqC0WFHnQp+5svIyN
	Zt9kH47gf4TbMsk9X1A6TCUfgZAQl8I7NvamuQdTLLzZeFtetIEpKpYM4AupaRASxHJbU5E76lu
	RznUUPKH2+82f/Z8Ed1khXjegUltIvilrikLY3lvIaATMFUFYPX/3clBx4Po2dc1GbBb8IwR5Rb
	xn/CZvQl22S6a9DXUy+wZuCa+4LrdpLtVRXc6P5K6Jlxfk7zvzhPXibxlnHPBZH9zh+y0fYGXmd
	wGzaiAzVNPf9IESnO6/W817OSLVsEsGE9rmPnef4fMaJKkuvxbIIO66XSKUgqV5+1XyaoazyYzi
	sRSfIlV8ib5tM3g+PyvlTE0MH3AAvad6Gnom5+pHqGF4K41qBiHvNVLX7HVxEBis88eqwVVw=
X-Received: by 2002:a05:6122:4a51:20b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec4cc4da04mr663977e0c.4.1793190907374;
        Wed, 28 Oct 2026 05:35:07 -0700 (PDT)
X-Received: by 2002:a05:6122:4a51:20b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec4cc4da04mr663963e0c.4.1793190906915;
        Wed, 28 Oct 2026 05:35:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd649f69sm594674166b.43.2026.10.28.05.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:35:06 -0700 (PDT)
Message-ID: <132b9b95-6788-4147-9b0e-3b31af80a60b@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:35:04 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
To: Amir Hanip <killdeath104@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027205146.16384-1-killdeath104@gmail.com>
 <20261027205146.16384-3-killdeath104@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027205146.16384-3-killdeath104@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 84Ov9IZFiCGxvdejpDRDDJKrnH5d0Idn
X-Proofpoint-ORIG-GUID: 84Ov9IZFiCGxvdejpDRDDJKrnH5d0Idn
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1ebfc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jaAT0nVXb5hwA9ITj8wA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX7XsBHj7ye3n3
 7bgCntbzTBFpLF6rE9lN9E5beIKife2r6U5fj2zYpsYmqzx3NPVFdwfhXgWh82mMD3oaThIr0eh
 9NjW6PzdJntJFxWxSiyXaseTe3Zq6RGhVeO18Q7S8wVoO4Go4Nd0vDMx3DEO95HsiMvPphVJ1+3
 OcKWtf70dshfYDRH0IDDDkXdo1Sxqlo/+r3vtCD3Ce2cy051jObCBdjZk5vPwVju8zPPFvCGmYN
 KdTu7X4SWjqXba4Zwhv1VL4XNXyJfgCnHTFA2JnmaLFVVikbwmiAx3gBeBjW7qUjfY8ws57F4b4
 jtgEsDCXirtS4FZ+x4bATT3J0Jcd/h+k+5mCL/RPz+oXRMuHc4/OiXeKtYfBLrCqDGW6b5g6R3+
 8UjFmeoNJsNKAbzX41E2TjPlh3oQQG4y9UR80eEdoPN+SB+CChWlU8YIZ+ZvAPuhWSnrDVRmP4d
 AHZzCFRMVBs3agoQeiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX+C8bWvoBy11J
 j+uepgR6hPAGuxr6iSekkZwZLj4JucxevWEZGcjFUC5x6DhE7Ag1PJ4TYr7U4FVEHanR8cB9oPz
 z0mKhfasvK360JeZrg+y15aUseIc1As=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280050

On 10/27/26 9:51 PM, Amir Hanip wrote:
> Add initial device tree for the Xiaomi Poco M3 (codename citrus),
> based on the Qualcomm Snapdragon 662 (SM6115) SoC.
> 
> Currently working:
> - UFS and microSD
> - USB host (OTG)
> - WiFi
> - Bluetooth
> - Remoteprocs (ADSP, CDSP and modem)
> 
> WiFi, Bluetooth and the remoteprocs need device-specific firmware,
> which is not part of this series. WiFi additionally needs qrtr,
> tqftpserv and rmtfs running in userspace, and the Bluetooth
> controller needs its BD address set from userspace.
> 
> Display panel, touchscreen, and the GPU display pipeline will
> be added later, so the display is currently only available through
> simple-framebuffer.
> 
> Signed-off-by: Amir Hanip <killdeath104@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
