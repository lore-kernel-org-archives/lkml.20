Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1299A533593
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955492; cv=none; b=OjpoO9PcIdL8JrbsI4HqN4L6m3DW+YpdRFjg/QL9Y+VoaaPT7AvoEXfBoG9VxooOHhXw79CVmjsQFg5P8XbSorzQAgMZhry7yvIRVnFlxaTdsE7uDxqraWRkSQ2Nqqp9GXXCb1M+znOnpb4JtYVMbWdLCuRtk8ji3F82h9rt4kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955492; c=relaxed/simple;
	bh=WoXuufQJwpVROeBOuha7BT/MEfCYL7U8esxuxwmmdN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlGqhQdbBJAEnn4VQEE6sfpXlIu719fTNOEAzVA0ryRW1NHr/lneH1l5AuMd+oql1KMjdovKKaJRdZY270lhbLehOKp9njrg3//wvr70s3UgbpXhcgGNP+xYjgw63n8KqXcUEswA2xvFtbgbC964cQJxsK8Ia462++ybGPjGDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXbl6cvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkzsbaN2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXbl6cvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkzsbaN2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUQOS2960149
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=; b=PXbl6cvGNavKubQJ
	c4VnYRAWsmmvPrHSLmAw0fki6H095cmYWz8SJTzpGNMr5kKfaNGmVx+YnAfp+JsM
	hIQ1jPH7IQYKxELp6akbl/ndotvOkUKeyl7Vm5vdYujrrjOuBNSnJn0DzMROcML9
	7L9CUzVidjfnWXtGYYnwdOv6rgMEmv6X1pPz/aXnZQju08O7cxYK0QJWbdEm4UCP
	eLTxw+2JQhtrOaLiBGMifaiwbmINoJ5ZoK768VgAlOPfC0PgIXZ2mjHKmuv7h/MB
	AuGzQR0DNxVIgwSk5iA+01Kt9903gmqJnnXEBhecALJRBBrfnlOLfvfLGgMNlSDy
	RrZfBg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw3ybt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:04:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c6e562b059so132285e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955487; x=1789560287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=;
        b=LkzsbaN22hCPVP4VbwUjbs2TvpBnN7IA/j9NMmK1ryJ43t/2MKUH39oK0FU7Jcuapv
         741JI2ojxzwa4ubrR7+pvhCdKhvGsIhYAGbts9eh+UCmlSGrc30/TsOBHNSDQmi0wP/5
         mC5/lRm553X7IxUvUR1VSeaauo+qSbdD/Q08Mh7ZI9eCbY2Z6a2MFczQdvTBDK00OuGj
         MqRVZnCziJKd5IO318dNurphNgSjn0/RXpRiZ7lC5bccJ1U30qzaTsrO/8zr8/nBtBEi
         ZdKVzcHnI5qG8ueP7aSYYBj7nXT7yQiIDD/zoYpaGYvwQaCg5KIAyVqYiSuKL1PxP3yp
         hF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955487; x=1789560287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=;
        b=AQkxaebqdv9T1Fg2dq0GA9o6AKiT6abRpf7Q0uYaEOvvdXpzm27AoUisLkJCJfSOD2
         /hng9VWbofoOEvwe41nDNkMyVsLj0uuE1gF2cwmpfs+OwEAJnU87rB+8SGDCRl7wEMJA
         Ew6HVfEq/8mfRUE8MIs6qXOoLu6uvMisaUDPK9AXlAWNKYQHkFnECY6b6sgO6RyjEL3o
         RB8hmG/zwgz6z6/VfNGhbVVbeb9QLaSeEwXjU8LkF6mh/xe5tDAANqq3ZbQoa/FGEmJO
         le3+P1TvwqmZ0HBK+W9zgawMDN9kEgFhQLK5nCZ6Q5ikQCqGguKUAmWrt3asc9j677hb
         2AVw==
X-Forwarded-Encrypted: i=1; AKwUvBwa0h1jpN4jpM21AxIlXLgMYDbDI4Hu9xvrhT/BoWKdUuNc11dqUeRQVw8RxAoaDcXZvXnF040dKH1qXc0=@vger.kernel.org
X-Gm-Message-State: AFuF++nlWjjqL/wxPOHQ6DOAhAYudTT36CqvQxe+bEunmJEW3dU/hWlE
	QcRfxerZKQELcXenkINkstfTrN3h7Z0IHf94rRH4VLBU5cvaxArIBZqKrJuIRqdn+TAaeiyUAHW
	OdxvFuWrMba/uTnQJS7pQElxXHgW67uXfaVCe9u4HaPYDfqCT3kLrS8jAOIUJqEmsCig=
X-Gm-Gg: AYBFou01GLDMA2YqSZ27ET37VoMdY1qnaSxPOcs+rdXzemGLRDWbVqCECk5IeDsZTU4
	KJ1UpJIK4Zv76RX1WO7PZpdsRs0bmaLFtjz1UrBkjx8mYzh9Hb2A54GEXlo4z9BDe6NXevVvm+o
	ljMB0cCmlIQtr+m2+rYU+e1rnK1uC5YCaPTZDbFJRF8BYNCYipudiCeWE6sVQyVv/V8qzQJIkt2
	mg7z2Hi04oLuoud2aQqTdiHQNK/qkBerJsdpUG6yDRvOUpnbRMCmYa4YPhcrdILkxLge2+2OeuJ
	x/Nsrb7Ww1FSuhm5G+/hB6dC7eq6oY4rBOnZPGo44/jy+XEtueIzyMxpjT9675HEDrJk3KFx4aj
	Fkyi0EHwJkNk1qdfM9cWcXw==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr289493137.0.1788955487416;
        Wed, 09 Sep 2026 05:04:47 -0700 (PDT)
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr289479137.0.1788955486951;
        Wed, 09 Sep 2026 05:04:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c398sm745510466b.31.2026.09.09.05.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:04:45 -0700 (PDT)
Message-ID: <24e9c518-fcab-4743-8f17-e0f3d10ea64e@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:04:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-sony-tama: enable SLPI and
 IPA
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mWSLOqwRLsmTi2eco_KP--VdmKaasJpH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX92dRR0PnqbNP
 VVGmcxBJmcnXgwv4ql+x/uiGH2YN1pd584nXd6F0Q8NVsLDZtSqNpGXbp1pBoupd5GA3CziDimG
 UrgCYkAuvaCfKOWQgg+u5e8S5Mkdecc=
X-Proofpoint-GUID: mWSLOqwRLsmTi2eco_KP--VdmKaasJpH
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa14b60 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=9qnw-8MMG8a7AGiJb7cA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX+C3UqjNaVCEp
 u+WwCSQ2YQJeueY0xDwnRDtU2XVJoLEjr5ZDXjp9Cz2AgZRVOr5csu37S60yL+FKBQHZA0iAYdM
 441LPXivSW6FmuqSgCw5KxHABVdOlVMNfVb9DqhNpYXgAywwXwH+7/VTw1cj8VL6Rk1iBu+FCe9
 GzjUtSvNf7DrOxIfj7QahqqN/6wanGsdzXTNN4rsCSQlRTGsBsLAvGbqHVku3Ae3YbP0gfdqwXk
 SFar/IKj/heLHiAoozQJ189fgugW1iNvmOgAQLKI/dbj+UQg9Jx56t0V1tnkwtY9UD3pv8gATvj
 TRw7HLNCAH0cpVE7cVD08roOBZKfX35kEvc3khR/j0QSDjPwdoPSg2vi9HUWJV/rO05olqqi+v0
 jCvQeb9Z/SD9C4UMBc3iscmu3l5ISDCNwDRfKmtza0snNtrj3fpeKlDmvk5FxyBP8brm8/oUAn2
 m53VultLhD5t2JoeeMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090134

On 9/8/26 3:16 AM, Shujath Mohd wrote:
> Enable the SLPI and IPA subsystems on Sony Xperia TAMA devices and
> provide their firmware paths.
> 
> Configure IPA to use the self GSI loader and the existing IPA firmware
> reserved-memory region.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---
>  .../arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index e34c1dc35a05..1c61a274604f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -403,6 +403,18 @@ vreg_s3c_0p6: smps3 {
>  	};
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/Sony/tama/slpi.mbn";
> +	status = "okay";
> +};

Please keep the label references sorted alphabetically

> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

These two properties are there in sdm845.dtsi already

I think patches 1 and 2 make more sense when squashed together,
especially since IPA without modem is not particularly useful

Konrad
