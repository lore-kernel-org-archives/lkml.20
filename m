Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDE23CAA52
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275727; cv=none; b=DcYmMMxkr2AdQVEu/C7edu4DOc5xa5oD4ZfSEvLeyJ4EdIln6acmrgHKH1uXq9Q606Lp2BAycyYXSeZPRmhnbIwz0FqUvZ1zjEvFbf6S8DX602QjIrN8KIHJ6MOL76d8QSUMU6Z9PDzkvREqLChMfFMy7d6yLpMhs9xmlx3CLmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275727; c=relaxed/simple;
	bh=EkyRhQuPMwAhaoX9kduyyF5/JKDntQkvvetRV/W6idM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUWZKJy+3MAk1ss+EChLaatW4+cNWD5YHxay98LtWwlJ+PC+Io7Emp3g33sSDWoO6sPfyCauIC0e3IGrgF2FlHadmO+Knakt+XGRCLWGXNZLMRePwr60D/XjpSzfXZq/2uqEtEqrJqpzAk0yUSnmnBSZ3mv0LFxfs3KhBtzEUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2i9BEKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqYs5HZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2i9BEKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqYs5HZO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eD9Z3269509
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 08:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=; b=e2i9BEKJXT2T9yZT
	6DC41KanW2kiXVHas/w0ggKtZvcHIK4MurGvsLuW6KHZO/jowXmRt2Svn5P3TI6I
	/NSUCnlFxeBWZnvkH4W1FrQxtBCgIe33LaUQIu9NKKeKTEMq4twly0g55GkNSJGW
	q2Cm9U3IJeEcNWTKAS/hgdxa8S7GodV8Qmaj3d9QeTzI4TVv/Yr6gpt/YLzBIxcL
	1BuOayjPTk215rxrsRZ6+IW3OBlQ7AVwUgrIBnNS/NvB2KxcXHswKF5FcEV9RavM
	nNZT0PPhY3aUlarenXMEx56FOp2qMixU4ItrlW9sFRHROqzaQzwPiDeP2jHQlQuq
	O9Gpwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkuk2tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:35:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c768885b0so2022808b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791275724; x=1791880524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=;
        b=ZqYs5HZOKhm5yGXGLoq8iFdS7pnEWMQTZFv+HixCWwedHXvsLawVosKLhU1AwbmgjA
         lSHxI3rIkQh6ANTa5kjbV7GyZspWU78Fa9W5HM9NZ5Bbrr0TdbY/7YfxvSovKT7GkUKS
         gjidqEupkG+kHtqfvFJiCqlBuHLuM+OoEc8zZyOJZk6DAa7gbR47Wm62Y7OL/wBZ/gzB
         njYqXpD3xG2OEgyujygqpuSZNRMrT1dZvKbvbKCBzeEfsWzvwpW03qzMv7vbHfpt7uxi
         70RulMHLfhDDk5/TrrRFwSfp8NVJyKEqabULBZIIk0PUdoSINumc3nilRMlJvi02CnzI
         iQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275724; x=1791880524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=;
        b=ag0Xu+jylelB3qDYOqEZggMkgD9C3k4RQ+366DQG3Z+UZ2uuYWm0WzeVblu/z080Pk
         Z84Cgd1ROWV6xnNZdiD8a2pAWWvf++v8dZ0KNfGNgR8gEYmK9V9cFF426CBvGR0g/NL9
         +bN3A66f6+V35kdMgP/IKE2US9ve+/xMpAjCr5C3t+IBmqjkarOopqqg3Zg24ZkFzTPi
         GiD6c1nqav+zTkzovp0zmolVgKkkVfWXP/3Hs7WwTtE01+LOHgpvqcD2Px0xN8CjvYei
         CmocLtrcZLKVbJzeARJoC9UHw4A7diml0QlulBu8cd/k8Eyqjplc/iUksSHzbzAg8SL1
         N/MA==
X-Gm-Message-State: AFq9FYLVrCuShpFS9PfjwOG+xQJM7ZXb4Q57LKo1RyD2csc7COca6rlu
	jal1wrtSpPy+l+Vf8QuHmJH2EqcwVfzAyHEw8F/WxS05Ms+ktylA2UQ4mfA4KZn9Qu/8BGM6Fl1
	/1dUx9kH+vWs3sLDwda9e3rcSB9Xdjc7jaADuwOHMKHUjl27I6lRKcZ8F+mhcq56gk0E=
X-Gm-Gg: AYBFou1rKta+9YF9CsILXRKY5RopaPpaVu4FkqBsfGdjpv2LKBxQhiNA7uWAJuUrWtW
	oXsg2khoFhRA8xDAMdAx55GtZo6BPKHn/uMD/SyS7HYWCqxkb4T4UBEJ5XjkeO5ugdId7fmIDzG
	rqrLaAjXPOaq00B1MlVKmrT2XJJTV/fivqe097+BOt/MVkQyjA1TuLwEY69jw1lonXZeyMDHbHH
	QVYhrpNb5TVh0H18dx3FwFUadDqu/5Ua17XF7imoVp5LwvxFCTmAiq/69DKhjjNefvFv1PGpvwy
	CQhsQtrKhSB+HY1FgIMLsC4YsDHSR+iKOEW1/O3Zd5txM0xPuZDJ+SfClva9IIeXkUsSLQmGic8
	2M29OYpW3tyuDSe0lcl+8ua/M/kE=
X-Received: by 2002:a05:6a00:1d98:b0:88f:9fd9:3779 with SMTP id d2e1a72fcca58-890ddd02234mr639472b3a.19.1791275724349;
        Tue, 06 Oct 2026 01:35:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d98:b0:88f:9fd9:3779 with SMTP id d2e1a72fcca58-890ddd02234mr639449b3a.19.1791275723900;
        Tue, 06 Oct 2026 01:35:23 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c79273dsm4462425b3a.40.2026.10.06.01.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:35:23 -0700 (PDT)
Message-ID: <c732b508-ee0b-43c6-81df-1070c8460bfe@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 14:05:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: defconfig: Enable Hawi LPASS LPI pinctrl
 driver
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4b2cd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rcwA5kG5DHYTcFEa1nEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: sdRQmVOoONOzZaMOi0AZonRW4WVbtVd9
X-Proofpoint-ORIG-GUID: sdRQmVOoONOzZaMOi0AZonRW4WVbtVd9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfXweaUWR78SnPJ
 aHRrxEi8HsLwEH7MJ5KllEEi3Df/oeIl/U5a2YXBN+I0MWJogY0pT9X8EyoZVPU+jhRAzWF5GT7
 zJaPORkq/w78AFs2prH8nB8MayGKfrU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfX0uaIh6ldG9Pc
 zd5snWB++c225pJwW5h+0gzHwTeQsbw/kvWzhSkjP7w0AbEcDwG23iLVG8FLj1Ijrng9FFlJ+yj
 72wrvQRffm9p0ZJgT6mEIwikWh38n4jpgXzUft+X+uhB2ebIa+REZHzWbLuz9A7pULWwWzHYj0c
 jI2hNorpQSx0KINZ9vWCGXDuYU1kjcXCLyXmdyRmQ+J9e4V6rekIz1dQumtTjEhegFqiaryNoI4
 e4dMRC5INnNBUQYJQwEQKKHwpzdbNdJAeBf22aESWNC9XBHB2vrQjNlrySD4PYF6dpBygXouw9t
 /yflvOmea8MzP/m46cOGyPCTBHfQE1rGc5bK0XP3IOB3Z5F3afl4iruL+B0PqbbcHVwIqmRRoSi
 59vrL2E3Vb1RD1wvzEu0HqvII2xw5fbOvtHEaTI3J/rWwpa8/zJhypUdy6u7Ob7s2C8Yd/PnFlR
 neDKbH6U6mkpySqzW3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060034



On 10/6/2026 11:07 AM, Prasad Kumpatla wrote:
> Build the LPASS LPI pinctrl driver as module, as required by the Hawi
> and Maili platforms to control all the LPI GPIOs.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Thanks
Ajay Kumar Nandam

> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index fce418fe6ff6..2a8e94b4d09a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -704,6 +704,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
>   CONFIG_PINCTRL_IMX91=y
>   CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>   CONFIG_PINCTRL_LPASS_LPI=m
> +CONFIG_PINCTRL_HAWI_LPASS_LPI=m
>   CONFIG_PINCTRL_MILOS_LPASS_LPI=m
>   CONFIG_PINCTRL_SC7280_LPASS_LPI=m
>   CONFIG_PINCTRL_SM6115_LPASS_LPI=m

