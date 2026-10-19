Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421643;
	b=yWMNjxELje5Uq+5P+z7LsuTVJIJCVYoMTYCPulz2lR1xrBoceLr6AzaFWf37I5Agp6kA
	 2fU7gt5WwObvNJsb2VBXFvr9D+ShCv4DEti/725TP9CSgTjKhIxTh3SCdfc67YsmeLrGZ
	 FpJPGX4CHSj8QEcP9mDWc6+bgR5n+Oyj66B3ezgk+u6M83J7Q9vzapiOWme55Rfjzcfzv
	 27qpAm4q4HoVzCyheAugQuVJlIToHuZzMnNyd9d0jFMLN9xdoOC7O9BaZxtZEPntxh5p6
	 3YIag9/nxADBO7XdjeMV/T9MKvEo6JwtskxzRT4933nFU3TfDDRi+3MsVAM2WXhiO0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421643;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
	b=jwhAxuZIKHBnhcAEHrhWaKqfpC5R4xHPgEwYQowpkhKGwuE8bU8IfsCHra3DwNFlv67b
	 ORplnKf8rtaMpy8NXKB9TYeHTntlUI8gK8uUXcoUmp8RGiaq7JT49ThbCaEcFLjVBBa5G
	 a75QaeT0fKCXReuqhJCdZKW5BHNshF3V75zxG2jnSI3E4BRbq1xJ3SHY/cUV0nBPVgDI6
	 iZYtR2wm+0thbpnf2XaLx4S8vJFxW3Py7R/nHqXDrIaU//rw47y0P1St+3QMJWtEN9vJe
	 PTT//pkNX/BsES1FB5dQD8iM7gBywZWIEdgFxPRyASVF6CP+RM4dHS3dIejWLpK0uVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbjU3ILD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94910606C178
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbjU3ILD
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BAA3033E1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421643; cv=none; b=RKsKWGm1KD4A+PHS88oF+sR2byKTlRHdqidjHOHOedQYeykrx3V91zcEnzOnw1/zi7f3SAr4sVegXm6kmme2mkUHiY14eZYApruxhVNpiGFQDuIGF9JbuZUY5o/6M/9g8rcs5/dQX9EIPRQho8vGlnCwZeEpMLtcZhlHDxHbYgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421643; c=relaxed/simple;
	bh=iTgrOGbnyKTihKA/yOPRSWcSu2GJAEs2AInH7inLQ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFnY2WDFr5f3uXL3MGGyq9Sh5Ztnf032/59O3tRw+fOAcRxJTRh49qq4Vxt1VYl3fm6/xiONfzNgnbeI1S960YlTJMOjYudraZ6GJnruQNYu5NxhBKalrzYp/4QQkSPNJtVwY1DTnZLy8gCg4JkyFqwo4C+X8IZTXfpuwn1TIx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDzs1drh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbjU3ILD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0X8D2774543
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=; b=JDzs1drhI+XmFFj7
	A4+OLzDU4EJ3oOZ9o/jS+ZurSZEMV8nm3p4AfKzDQwCSY9Ifcb307NYxWEV/ov8E
	F5cITVq1QE0dPN2paRQMgTBlOlAgYDG4OtcZ7J7wz29LDE6muDYl6QYKT2K2k5vz
	BfrrBy4xTwNvRWgmIpFmrSPRspLtq9eLPOsLEHZH6YjOzqqA9JA/O6WFssI4xJZ/
	aE66fi/08ND7CQ+y3z7ihVJw0ZNoNATb0D041Mydw0qX9ydRXxHUilr2rEgpKbTW
	18n7TedrdF4IbsulGl39gtRf9kA0TGUvLI+kgfFOJsmx4+3c6zrSf7l1DqpTQ9cA
	Ah7IhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3bh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so60077885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421639; x=1793026439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=NbjU3ILDHlf5KyCKvu+uEQ4Aq5ydAfBKqaufzI0ZRGqzOmlZaJ1CyNGI9rjlDYLGmH
         kNyp+hefIgBJaP2lTxucXLc9rB0Hb7H8YcsYkpfRJcg/AR/Zz/w6w97jAaIYA3OB28jy
         nuWa0bznfnxCAkukFe0yqkliSTGSyzeNkO/ekIAwz4VL56b5OCes0k8H6nPe7Q9dS+pr
         JOnUXG50aFNHaY+z+IHpZAycKunvQGH7Sg/i8nnQ+e2YTryl4DvDvsDYpqj4Is3RecOB
         uxrJabFMXY+bTE71aiUDcC2ijw6F+LOvfDhnRO5VPAmD/6ArMbB8pX+xEMssnR32Qxuv
         6WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421639; x=1793026439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=1ckJxCEdFKpGU3R3j7fjGvnbjoLGCRFgYXbulLICUF2/C3p4TAk5qdK1hnke5lOYWS
         IMjGW55jp+yj4s6PnQbDGYVOymkfDTAOlCSUcvPRuM9ydml6kIeisihxeT1hSmVnJLs4
         ypdnUl2K6nIApSlWiPAARn/R0GYZmQugV9Hf1yewnj8eDwEnvyJbWkM/SXwMvAABBKNi
         asdsnCaxQgn/x+2WCKpqFCdO3ymEsHbZuJP+urmSB5WH5hx53ItQTOFbFyZcLqZX8XpF
         YNaJVTU5HgFJQyGfU/+rlk7SrRWHC2fV+DYU3EccbnCZ/FuBYNO9GQQM5ydrOM5ZDHHi
         SqLA==
X-Forwarded-Encrypted: i=1; AKwUvByWl+BtNcL0kIKetZTzOPko4HtMf9Oeiiz7lLitxJyuI1W0HG1y5jk8F5qPC0vkGVToA6MowCM0V916ZOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXXK4FjBlY+2EjVleJm0szpJgPC7ItJMYmb7HaFWVgv1rjK1kY
	N+svbkMuWcAfSADN40gVbaMjDogBkTEzryyEQVoVY//QUAjngDDK76Px9r/8TysE8NOemCbVTbh
	3Uc4QPbE1lltascpU8Yqwk7op4GuASoHY3ut/EIellH2iLzHGbPbr2syJ86ROaWQ9rmI=
X-Gm-Gg: AYBFou3z5XUcqVpL7JX6NI1w74ix3h2wIFCng2rPf/pjnmad5kpLCq5QGC70EegWTDL
	wDTS0vlXF/7AT2M2KOSUD9TzmIstnAZY5qDfjylqgqiH3Rd491dFMnQZyAzcupaZXbbzIOqLAC+
	uuLmH3tWW7Y0i4h3b8CR65//ed1+Qu8UAIaf7ycUlLUsyuBO4YC8Eloc0T1ECd+22Np6cT0NTY5
	2bsdrCN+1K2nOezKKNAh+N3X1ekPbUEnMNXvRqjUSFsxyexD78BAuU155BD+s7bg5xm/0LNjYBx
	QzIf4/c0bBBFTgJIBTP3gYtbjJJ+nuHWtXpVOtt9Obw0j1IjSu/w8IP0LfYQ2OmBTBxGyCpyUmV
	qcpBSBCiEIN03SX5rRrl9kQ==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529447685a.3.1792421638793;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529439185a.3.1792421638223;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c7ff2sm4047490a12.19.2026.10.19.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:57 -0700 (PDT)
Message-ID: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:54 +0200
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
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX/8F+JFX7/cti
 1yfdg1ILtWyOTJm+47NKJbd9ZNDLuuDI7wAqbKr0r9ptkHVLAueq2qqSQ1wRJRAjyVAQsD0eJvx
 n4a+XH4apswfCNyrcixzvYLII8oYTsk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX3NVXQ4M3JR11
 bx5dC1ktMF5fKlZdo8QdEoI/U/MdBzyhR15iwlWgIwxRLIs6S+UupjNMX88vP0dCT77RgFTXgxo
 ELKdnJa9ohN6D41GifLglkax+jPlcE1YFGbpbdLm7SlDBs3w9PWzDEYoquCURgoKZFOgWEmBxH0
 xvH3ZQUt5/Aioyt89jM11lFLgnm2J2DL5xo140bI5lQv42uqOh9WB1reULuRyjbt6RYa2K3uZwr
 U50AGIWUf2rytwrh3tjk9PYxr95yFCUCHnotFcXjHm91+gTHXXMu8u3d3L8shsmzffDiGRLZGTl
 ZuDGavd9Od+NrtNpERe0FoghXFSZOcfQqHbsptlTaOl4WVt0IL9GheaytpWS0FxB5oNw44kEibB
 tJ7u9d+47jcKDahMpQPuQpslOcqtG1EjgOyN4vhS3wprOaFRFHvRLTBQh5BfYbdgNOizQfh3Fv/
 KrxWgJ0abTqrGgFI/rA==
X-Proofpoint-ORIG-GUID: 6JpbQTSjevD24oWmtbr5xdG_IseVSMeg
X-Proofpoint-GUID: 6JpbQTSjevD24oWmtbr5xdG_IseVSMeg
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62f07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=55-3qADWK09jOtsAc_IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---


>  arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> index 1e02578e4ee3..4809b3d8cfe2 100644
> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		sensor@4700 {
> +			compatible = "qcom,smb2370-bcl";

Like on Hamoa, why just one instance?

Konrad

> +			reg = <0x4700>;
> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2370-eusb2-repeater";
>  			reg = <0xfd00>;
> 
