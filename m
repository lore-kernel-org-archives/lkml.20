Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8DC471D0B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340860; cv=none; b=DfyYHOeg+QcEBRcQWctY5bKWAzINAklendmzaURjCMai850le2YdOK+Ou0f4fukDgWUmeOD71L9KLAqaUjGwXbLzKVvbhCI+YTK68FXdBfJ+qJ8pJu+jZGN2Q9Zov6rdQ60r8BmFLmqC8ieSAVFfictbHVvrhdEzdEO77dRZCOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340860; c=relaxed/simple;
	bh=CdPpVt3jhTVkM0bzeDaDuajKfQ5z2AW/BLT4e8Y0CzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rg5AmU+/VJeu/65W1l1qYH6LYnGeUtNNPN1BmrsXtuoyAxPgxaJaSoksc6I7qtHRZjglPI3wVltJ8eqGQWrwXEz95bEaE25ekxf1sXV6mTihIip5YB6+yVu1Nci33d5Hky7DHdJxZSTZHDLGiBWWzI7ueXb6q349eFFedQNpRO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izmCRHTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifg64bMv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izmCRHTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifg64bMv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PCrBCO208408
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=; b=izmCRHTGtblcKxjS
	md6gN1qvEAI1vayaSIvug+//PSzlC6FCs++LfhC51DU/9qRYIwBTRqPRNhsUVt8I
	6sBmjLnkhsYCyWVVChyYnsnglyg+HunoOhly/o2bPYUdqLe3a3O7Yq3L4ySYCVDE
	FoNDy1g3x8f7TdOohqDI7EmgEIHcaojbXpSzKF4JcD1Luh91fAtwa2Ic+W2cI084
	SFXIFL4Ljd6AnK5H68dpekoXwiqfeZfSiOrANqYSaF/H33JfygeoyoPRguLekPNJ
	E/roQ/IgWTGAr6yStIh1FeD8FlJcNeNhirIIxxGvtsBANjrLTZZGYUCqROFavXrt
	gw358g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898uhfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:54:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a0b6ef90fdso891076a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340857; x=1790945657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=;
        b=ifg64bMvbp0qA++xtfBkNRTNBSrpMrPue4o7TvKqq1OkTaCvyAYvwgxJQbl8Wdvp4i
         hoHwTeHF6LgCJ11/L92IiARRQFp0EWgsErd6CuG3pXPsnpSEksT+zVwLO+PbqK9Nmssd
         nxcHiHRXCMbzqVaQXtcLvbn1uX9I3Hd9RtlxvN+YG8NQD6Aq11ziqX0iVnkQyEw2atH+
         xOt3hZm+06dWS2ah1cwflLUf+D9VDqOKeNpSJWX5adHxfK5yThbYOMsDZD2P7uzhizk7
         V5OK0mAkVytWhMOowalGcibfRxJy6nisEY5UpK3Dk9NGPIMvV2rM2qq9im8kAlVLn9Kp
         1tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340857; x=1790945657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=;
        b=eFYU9EmUYPoPPDIW0yh6d5McpjseZKVv7Yqwlr0QD95JAC8HBogDsLGH6ufM01Chjq
         W6N63X6OdBf0F7i+Guj7JMVRigMU1WRd6SIFV4K/06EQuESOqeW87ddJ1g2nSuzbY3PO
         VucFC5XRKCAzxkqiOrLAnC9aECjC7ZCNFNEXuVXqm3Kf+2tKqhNSGxBoTB7V+fzGnDlj
         WfbteTiN7+xlyLlCHSS9EraAmBCso3EhtU3233EY6XhbXk466mrh4oFRJvd5THewJ216
         at9mSyuNM3/hN+sv35zj9LzZpLZ6dEowtNiMjCPl+qfIMJHzBcKQwFJtnxk5qxWbRtMC
         N4bg==
X-Forwarded-Encrypted: i=1; AKwUvBzOa4EYGv4fX8L/rXD109RWsF2KxC4BbsEyL530ZEbzCnqpPJQCXqLHyb+1xh4iIuGmIphQbaqiSNlsSu0=@vger.kernel.org
X-Gm-Message-State: AFuF++lGw82CiINBGahcLykfczyMngwei1Qpvi3yDbWDJXQ41WKJKLOT
	f4Znm8fV4qT8iON9RnEmPVjx+qzud1fhpeTEJ4JvofNltUbKkufkYMhn9UoyPeMjaQvIBk7RXHB
	k7Zhiug3FBWzKbQUjiJz+ZgWVgxOvtEo3IiiIFMIdpRrRsHHN3AnPtjJH5gJG6zKIuqw=
X-Gm-Gg: AYBFou155mfjyAHB0wt/Zc/ETZzPUdIECqPcZURWudEjFWfEzcN4Cpctz1G0kboA1n8
	uVd+E7MTCkWTAraSWe4+viSSPSuRkZuRvlTpNaH3sgiarXl1fzLapC/FHWNN8HAW/hWl1KWIi33
	WjRxC0fwzsC5roUKioIMVrjHlw0E/I9QVZVsKTFTmhcuaAW9U3+QkLrpVO00Le1MrE5v0sVZDgS
	6ZvbErM7e/IQNJpUQcVkpARpfcQHXT/syXZ00gitu5BX5Od31pW6Lys6EkIXVSl8rRQBYqGFW0L
	QT1vOWLMyby2W02MX/Y/uHgdhQYXRzxRpCBtoEbAhk+Spp5N7slmCX7z0JmMsQp0sNjn/qHKX2+
	01KP0IHkB8hUmx67fkky75OJqE5NRmvxHxA==
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr5199236a91.59.1790340856658;
        Fri, 25 Sep 2026 05:54:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr5199199a91.59.1790340855905;
        Fri, 25 Sep 2026 05:54:15 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm839778a91.16.2026.09.25.05.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:54:15 -0700 (PDT)
Message-ID: <14797f32-9355-4b81-b805-af4d8d8ef5f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 18:24:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/19] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
 <bbf66d18-0587-41d1-a902-32686f66fa76@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <bbf66d18-0587-41d1-a902-32686f66fa76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX5yDQogInp8eK
 tiGJ98Bx8vWz6qt71abYXQ5APjRXeCjh1Pp56pummxb4iohox6HW+dyc4rvTr4L8kohx/YxJ/rc
 SUzgnN1xdKYqV/WoHHlKpqpFRuKpZWlUZDNlKIVbEAT7CH7O/OVLmtMx8ERX89hciIgHjbADJqU
 VauT7trBLDoto/8xHeLb4+3Su9wGmiJNuJTPDLbv35IxmXN7qdg/TxvdAnmLK+LKAmIXa/M5ZzZ
 Zfd2kQhcVSdU7jwwCmOxRtYgsysfKvdfdH0SpU4ZffQLf0I65/H+ZUZrKuFdKA09w/DQObjyIzr
 9gjMV3pXYWw9gJRFmVxeF9Osfr3iilMa7RFO5ftfKSuuKTdONNiM4b0/EzDLaiH8qLwQuAhbTfW
 aO9flzBrySzMbTiIhjBzaOo+8J+F0/mvooMfmdippePR5czw6K3c89bcYSXI8jmumARN5Y0B1Zp
 eB38rTHCcdSMvWcltAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX7ezZ3ARtoBCG
 uYxarTzTGq8q4TZdRvd2znH1SQP3GsyHOs1+S5ES1KS7Zd7M1W6jyrQRrgXCMaVFJOh1Y7ok8yb
 E7gtYn1FkN3rY9JUNSYxZawp6leiB8I=
X-Proofpoint-GUID: Z8lgCjCJoEvnEJx1zCQpeM9l9vq5f4N8
X-Proofpoint-ORIG-GUID: Z8lgCjCJoEvnEJx1zCQpeM9l9vq5f4N8
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab66ef9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=iB3hNsdZaZMRGRx/E791SA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZVrMA9eccY_vmvRiiCEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250051



On 9/24/2026 6:06 PM, Bryan O'Donoghue wrote:
> On 31/07/2026 00:48, Dmitry Baryshkov wrote:
>> +
>> +/*
>> + * Detect the firmware generation and publish the descriptor. Run 
>> only after
>> + * qcom_mdt_load() has succeeded, so the driver commits to a HFI 
>> generation
>> + * only for a firmware image that has actually been loaded.
>> + *
>> + * The generation is detected from the loaded image (@data / @size 
>> point at the
>> + * reserved memory region populated by qcom_mdt_load()) rather than 
>> from the
>> + * request_firmware() blob: for a split .mdt the latter holds only 
>> the ELF
>> + * headers, while QC_IMAGE_VERSION_STRING lives in the .bNN data 
>> segments.
>> + *
>> + * The descriptor and firmware data are published exactly once, 
>> before any
>> + * session exists, so the lockless readers in the ioctl paths never 
>> observe a
>> + * reassignment. Later bring-ups reuse the already published descriptor.
>> + */
>> +static void iris_detect_firmware(struct iris_core *core, const char 
>> *fw_name,
>> +                 const u8 *data, size_t size,
>> +                 const struct iris_firmware_desc *desc)
>> +{
>> +    if (core->iris_firmware_desc)
>> +        return;
>> +
>> +    /*
>> +     * With a DT firmware-name override on a dual-generation platform 
>> the
>> +     * image on disk decides the generation, so inspect it and switch 
>> to the
>> +     * Gen1 descriptor when a Gen1 image was loaded.
>> +     */
>> +    if (desc == core->iris_platform_data->firmware_desc_gen2 &&
>> +        core->iris_platform_data->firmware_desc_gen1 &&
>> +        of_property_present(dev_of_node(core->dev), "firmware-name") &&
>> +        !iris_detect_gen2_from_fwdata(data, size)) {
>> +        dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
>> +        desc = core->iris_platform_data->firmware_desc_gen1;
>> +    }
>> +
>> +    /* Publish iris_firmware_data first, then iris_firmware_desc (the 
>> guard). */
>> +    core->iris_firmware_data = desc->firmware_data;
>> +    core->iris_firmware_desc = desc;
>> +}
>> +
> 
> In function ‘iris_detect_firmware’,
>      inlined from ‘iris_load_fw_to_memory’ at drivers/media/platform/ 
> qcom/iris/iris_firmware.c:216:3:
> drivers/media/platform/qcom/iris/iris_firmware.c:161:12: warning: ‘desc’ 
> may be used uninitialized [-Wmaybe-uninitialized]
>    161 |         if (desc == core->iris_platform_data- 
>  >firmware_desc_gen2 &&
>        |            ^
> drivers/media/platform/qcom/iris/iris_firmware.c: In function 
> ‘iris_load_fw_to_memory’:
> drivers/media/platform/qcom/iris/iris_firmware.c:176:42: note: ‘desc’ 
> was declared here
>    176 |         const struct iris_firmware_desc *desc;
>        |                                          ^~~~
> In function ‘iris_detect_firmware’,
>      inlined from ‘iris_load_fw_to_memory’ at drivers/media/platform/ 
> qcom/iris/iris_firmware.c:216:3:
> drivers/media/platform/qcom/iris/iris_firmware.c:170:40: warning: ‘desc’ 
> may be used uninitialized [-Wmaybe-uninitialized]
>    170 |         core->iris_firmware_data = desc->firmware_data;
>        |                                    ~~~~^~~~~~~~~~~~~~~
> drivers/media/platform/qcom/iris/iris_firmware.c: In function 
> ‘iris_load_fw_to_memory’:
> drivers/media/platform/qcom/iris/iris_firmware.c:176:42: note: ‘desc’ 
> was declared here
>    176 |         const struct iris_firmware_desc *desc;
>        |                                          ^~~~
> . "$TS_DIR"/lib/common-end.sh
> #!/bin/sh
> # Copyright 2024 Google LLC
> 
> Proposed fix
> 
> ╰─$ git diff
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/ 
> media/platform/qcom/iris/iris_firmware.c
> index dfc4c184646c6..39558a300d38c 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -153,6 +153,9 @@ static void iris_detect_firmware(struct iris_core 
> *core, const char *fw_name,
>         if (core->iris_firmware_desc)
>                 return;
> 
> +      if (!desc)
> +              return;
> +

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

