Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200081F936
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517677; cv=none; b=GDs6RW9mgGU07ouoWL/OxpIlRv6FT0pYMQzUc71glI7Xev16FWfl7MpMH505Oldb7Pu8+xlANz8Ozcqf5fWF/u3Z06+B0Hp/8JEdidz3RRULEiIS+/24zTwlnofnv3euJKJUE/sRcWQzYRwKlsKdFxiiWyymPKO4F+xrj6t6pd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517677; c=relaxed/simple;
	bh=Zsk8ft04qdvSEdnEA4d3lHI/L+Z01W2/XK/UnHgaOSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kd9UK35G7t4ytnjK7WftjP6UGCqmMXDM8O6e2XXTss6TWmg8HOapjXwYp51vnjFZVsd/X/XiN8pOJX4DWF0h9l5UKrVoMv15HWdKRLRAq+KBtJ2TaLlt9bPjAuIXVrolDHuj/h7Ya9xtCdyXFeG/XDZgv2XUfElPKKRWPtq9ReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjNyiWAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDz87b5Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjNyiWAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDz87b5Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R4v2R52764567
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=; b=JjNyiWAOByR6I3a0
	891btXWw6iBzW1HUOVP2jwu42IVDOUz+PvRzocEzuPCJzovQidketxQn8gmwEik3
	TWuOJDp40dyQTqwNh3tz1j0HAlFz3Yef5qI3/ZlYRC8x05VS7Lc36FSUi0xOU324
	LERLxFnE9du5IhdTys6KRp9lViyhAPtUnXe5NjTOp05jvOQn6ZqiFhJ9NiNAnH0P
	UVdLJmdpfcM7BZFZMY4bQPQOLD6BkeXMDsfRJAzle+oaCirE8sBfPK90YcDdk8PX
	FrMZIcXxQQvcGz8qI2NySX557IWKBJ2v6RSQuV1hBPfcrUOjBSdDVz7+fox+C+fq
	/hW3DA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx50sb7ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:01:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so2058815eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790517675; x=1791122475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=;
        b=SDz87b5YhT2HO2Iq1qjVTA+73aQrzr6lzqThZcAQ5bZahqvTGvsrWv5UoHovu+pJB3
         f3ZTo3py85Vu7QQwFUI11C3BktdNbdghld4EV3tPJ30xyrveED5v/rRvW8llUu8meYMz
         THBiZ0Ium2ExVHiJ9SjyGeYJKs7i5HKAGnlL63T+3beDOv7jxyJDIx5tUxVdcF344ZSd
         EHrdxKvltg5DByRkhZeM03nFY8dKMasiTL9rZ5ige+u5KLzCnKYbKck0V1mrxjCcqVoB
         dSw1i8RCQuWWlISkwqPK3MAaq4lQvnBLWhq06PPYSOC7o1bb3Lw9IfoDse6A0Hw0pxQM
         ajIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517675; x=1791122475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=;
        b=NSRs1K0vX341zYmwYG5b2JXJgbBl5EnDK2Cfl/EJOKtlI4kWTZt89Cig5DXhilxUIF
         3/Xoob423eD5kzIch3w73DJFbAFxjdCMtl4Euf3W3AmIXScCchQh0SlXprtgoioWHjX8
         C1cUMuJhA7nxjp7iv53bu8cUMJNeFhsKlEIxf87Xe1+LLzLneqajtX64qqOFqKtUSxeK
         MRrfxgnePiudvVvfUqD4NCEEGnKLzj6DzghLYFN6ErMn4YW8v/J2SZ+fuyNp1uz7MUhj
         E9aeHkLGVwumeJZvvL1W+ifVqv95taIigg1aeFP9Y4nxc5HX6rrb6BskHJ0nkETR94fR
         aFjA==
X-Forwarded-Encrypted: i=1; AKwUvBx1vZsNvmaxwajc7oLQQEONGCxG+VvYp1AWDmXrTEyyVeLmoWpAAqkAbkB0pfl0WdKsbqjCJP0vgydsihU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW7FloR3PwikqdJ+XZvKp4h3vK/puPnyVmcyevzcf/AEJ/sNi7
	P6R+mvx7hjT1NOLHPleiVGFUFOx1eOk3gtuOnofrAu+X1a6wbAYtDlKpiqD4R3QI+ty0c75UjSK
	hWRZ5QnYoXZam8K2Y381WEVImohpzWOGO3Wa98jmJTnV1YOF8tBgOJKJk3u3F54AZUTk=
X-Gm-Gg: AYBFou2NW3JANEc3hQKNhsw3cEhMHpNLpeVROHRLV8jH362plXSpVVCqBDqAqSc+Hx+
	8+mCrPbDWgzUIqEWE6Ind839ASHJ15uOy/6Dtq3+yhN9lMYMkW/Jlc7sgpRkA/p64m7GcBWVew9
	bAE6HhefDxm+0ErThndRDfHwUqRXS4UegIKGGSQWIjOJvk94/ikWmoSsGHVLMM/KmYeWxfF7x0W
	jrU4SGwvKb6pPd7VJFnErmB1EdwRb+aaKxEhNZaQawOxlzvmhYxHBqbdB7v1MF54T/26sZixlZ3
	+7f7DIpa9huybyRwzA0iY5xMGw9OGfnvv+b8d9+32QoOsUJI69C5WkSZw++8puj6uTLuohOOegD
	Tyl5fllu1edVHWJQbf3mDrbrOodxiTbUT6POOQucEmBo=
X-Received: by 2002:a05:7301:b05:b0:33b:e842:d272 with SMTP id 5a478bee46e88-342705b97f5mr6074703eec.5.1790517674506;
        Sun, 27 Sep 2026 07:01:14 -0700 (PDT)
X-Received: by 2002:a05:7301:b05:b0:33b:e842:d272 with SMTP id 5a478bee46e88-342705b97f5mr6074660eec.5.1790517673774;
        Sun, 27 Sep 2026 07:01:13 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm12850921eec.18.2026.09.27.07.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:01:13 -0700 (PDT)
Message-ID: <fb7b898b-441b-41cf-89d3-1d513730a75c@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 19:31:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: add reset to SDHC
To: Robert Marko <robert.marko@sartura.hr>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260925191706.1579990-1-robert.marko@sartura.hr>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260925191706.1579990-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfXwu/LQ+0m8+0+
 v/ofmaoikjiHzs8ku24IIyq1xmPfdvQtzIZ6obGXfEZc4C3lvRvYkc+INc6D3c69tqXCF3gT9kq
 jRTQebwwSyRlpFclhAmrYo9ZQKO27DM=
X-Proofpoint-ORIG-GUID: woKRRBI3MBiL7SLiBeN88WHMlzTCehnK
X-Authority-Analysis: v=2.4 cv=WuK+otfv c=1 sm=1 tr=0 ts=6ab921ab cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=M4XmOyF+KGVEWXraXaCqgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EPIbeGyanE4VvX7pOL0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfX+2PtIgvNnLL8
 nnpo+CPvPf6GI990n5AXGXmlOhCDax1eqztivdYILjIZigC/k0ZEx+VDsngy++T+TUVa4I+ox+o
 44bGWS2mr1PXEGx92CKgslIuQfnTrekXaFKpTgVCEomQHOEx0L33p/91tbb+JbZznf99lNGZBdf
 ctyH2LA2El8zhYkDpgL5imbMEvLuOh4lP3LMTDdjg4nTUYcpRslWO/fGlGk1d/euws2DaOa5Ccf
 B26Y0ClPdA8FCN5/WAEwlVKZsAhsAUu6/lf6/qHAoYB3LTbeMCpTO4UfX3hily6T0Lp8esZJl84
 zDp2xw/mUmKn8VySwhAFoU7gAw1Zj+QHvv9awoBVI+R1C5TBdft29uZgxZdcra6oPDspMuQQDpn
 scB0/oAT+o4U7M9nENKQe8dOIsCoAh5wqCew/DsRJ5awlmdP9Q7DSUNceBVBtsZFTKhOJMey9q1
 Yam3VAka494U5xr8L1g==
X-Proofpoint-GUID: woKRRBI3MBiL7SLiBeN88WHMlzTCehnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270055


On 9/26/2026 12:46 AM, Robert Marko wrote:
> Add reset to SDHCI controller so it can be reset to avoid timeout issues
> after software reset due to bootloader set configuration.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

Thanks for submitting this. Similar change is needed for other IPQ SoCs 
which is in my TODO list. I will submit those changes in the coming weeks.

> ---
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 5a5bda5f21a11..ecafd4cda6e7a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -471,6 +471,7 @@ sdhc_1: mmc@7804000 {
>   				 <&xo_board_clk>,
>   				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>   			clock-names = "iface", "core", "xo", "ice";
> +			resets = <&gcc GCC_SDCC_BCR>;
>   			non-removable;
>   			supports-cqe;
>   			pinctrl-0 = <&sdc_default_state>;
