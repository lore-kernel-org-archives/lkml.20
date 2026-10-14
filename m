Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7192F560ADB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998331; cv=none; b=d01wPnspobyiY9TRFu8dpcuA1OW0rPFm7W90OM1WE9pawdsJj7ukSinikRQulVSGz8DEU550iGifWGNqOnZH5oZW9vIj1v4lMhCLF7/pSrSMmjEkWifLW17jvMu3HLxttR9t8thh/kq0x/ugdN7fzxMt05vquB0zGUVozd1rTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998331; c=relaxed/simple;
	bh=+A9h+HrciS1jUyM1n3Niv63g7pLYlAidJxXoLzyQlhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHl/6k4g6Y99koAcPU29zZ2iUtAkCY9zTffj8Xki0k3N9N87CC0m9Oi0hb8keDpRmpJvO58cyXhCJ2tzIkt1OyRUhHi6XeWxL15FyL6JOjIDObqVhF7HEo7A0DdB1gYZqUPJ6APsolwCOpt+B0NAt/nheWAiQcMER/OkjsN6v4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDUHVz2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcIYGrEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDUHVz2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcIYGrEq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbH2N467701
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=; b=gDUHVz2X2N4nKlK1
	9d0GfbuuRhKnWi27WLFsjAk6144T6WQv4gFJE5vaspnGCxv/NKVLvoac51xnLLNa
	WrOF9bWbmyYvznGq87RYwgHAoyehPSo+IdczmyjE5DG+uxM1G2gpzwJooEtRVtFD
	nZF+ve/mSOeAKMeoVQ+NOyfLpO2Ph6IgP7JqenyWoduoIRsOD4wFmBYvUxZqXxwU
	niKX0iOgAjSRqTSBOjkxn3FrIoEtANSyGMplhabWpHmo62Oh2HxhKQHhpuuDX9vJ
	6YkcZ7fnhKbc3kR48x/j7sd3u0ryq18oyaGjDzmlDOSLQVUwXsWUFqk2bvs1tHJz
	T1fC1g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphkq9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:18:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so16668895c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791998324; x=1792603124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=;
        b=XcIYGrEqFfbWpDBVhJ/KxGC9djdguGflnpUDIxoK2u8QsKO1kSnxlIpLV0d3qzO5J+
         dcgDM/0hML5owCURkfdaL3Nwo7dG8PPXbTuPy7spwDIqHzVc00/PXBXmJG8unmZXTt0A
         Ok2DSIiVNdv7zvlfkHTpWvovPynW7FtWybcNKfnfZc1Mgg099/7d6oue2gjmXuP/4FVB
         Mz5lwbmcc+TSJ2MtGAg2co0RX/PCYbGRb8hBpoCBKgyw1oJYX131XzSeDKcQ+NvMZC3n
         GOo6sPjppbXONDCkBNGRbYXmZk94rEAu8s9jP+7cRvb+Y7WAkW56LI31sKwVajt7y4Mi
         0STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998324; x=1792603124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=;
        b=2ioBbo9NXWmHW019d6YknWnzBO5MS75UtHSQDKPYGDeR0HIj0gzqh6p8PIi0opE/ef
         MzKYMNBy34GzX9iCE1rolYZo03Oc/xIAm/Fmx23hNj8LHd4Wnl3Trqee1EMSYmtiuDM5
         VYqdcBjNl9LwbQMhknOTreguh6jqK2/MS1ugVJh83djXHLn+4t1qtlHGWYsDWURAryKP
         eHyWHw4P3PYulzNpAFACxFiuU8CelFwqFcpfeUGtT9SZZyCRJx7uBKo0A70WeAd+JIOl
         jQrp+FYtLXNkc3kNhxf2POucViVkTUDeYSHoJym67UA7vCac1aWXY1nD8jGYSU7Od2NP
         KUpg==
X-Forwarded-Encrypted: i=1; AKwUvBzn6hzKfzCsxCZUisdo6ligKbf4kGmXqL54S+7BhIM8tJF8p57B7y6w2IJbRozcSehhErizmu/yhomeG4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqlkW/Sr6y7T8KECEKIINGMjfgweXI037jOURCb0EY1GDwboEq
	/JtUEavc/PqnAH1W9pUZ5REo/wz1nCQ3ysfA6wd4Jz7y3WaFQxk/qeOeuI6V8tmGgWAVFhT0SN2
	WzDt6ab9GxCBSdxabLcuDjiFzZJBLmGgIpgqDUBW6wtrytncUpS4kzTwJ96a9PPNHJ2A=
X-Gm-Gg: AYBFou1FuxJmekrf8VW0WgQJ54dNAGpthWHHfcquZYc7y39O/0f+3+VCGn49Kw185SZ
	zqWsLoFJzoUCoDCQzbkRU7U9OqnhPPOdeSSl1Kr3x4a3ZpkLRQQ9Xl6SuPxEuX2ajDT+4WkEcmS
	fr4X0qpfge2GrZAiCGCm/6h2IXlzZtAf5U1urTQa5TMGLyfGZ5oGABMwsUHDGEObOYdwNK26+8S
	5uLs07l/vs7TPI3gSLY/AK4Xz5U/p3exW0pBIk5a74oexUEPAe6/uCjRySNlVYY0f+gEYwjxyFm
	4LJQv7/vzi+/8atOKPWLmCxXt+Wx+JE71t75BwTHsXDJPr7MRLhPWAXzeUWWz6jDxHkYeh/DA/y
	4/BAxhOdqRoetwnsI2T/IKgqGVP60PHb3JusbwfA=
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10483782c88.37.1791998323780;
        Wed, 14 Oct 2026 10:18:43 -0700 (PDT)
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10483748c88.37.1791998323154;
        Wed, 14 Oct 2026 10:18:43 -0700 (PDT)
Received: from [192.168.1.5] ([223.230.101.206])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm62844317c88.9.2026.10.14.10.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:18:42 -0700 (PDT)
Message-ID: <3c40a4f7-b191-4a04-8886-7578fe3baee2@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 22:48:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] ASoC: dt-bindings: ti,pcm1681: Document the
 PCM1681 supplies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-4-0c1897f21ccf@oss.qualcomm.com>
 <20261012-aloof-cordial-starling-4accc4@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261012-aloof-cordial-starling-4accc4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: huVDkiiPMXFsHJW-idENolBlD20HkVWt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX/Pe/VK0xu4Sz
 mcYvdEeacaScXoaSAon397lcfb/hAAPd7bvQKTk0fojpHtVxVerggnPwsEaL62io9VVZ+Jw/0Oj
 ZfIEACuu6m3NOl+Wen/JZ4S4hlqizCU=
X-Proofpoint-ORIG-GUID: huVDkiiPMXFsHJW-idENolBlD20HkVWt
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acfb974 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=89gBhgtN2V0NwPD6rb2Hew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EeIf7S6Bmj70s5Vw-GQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfXy9C64Zh+e9wL
 c8N6+jQncZLzn+CD1ohDDmEijHDa2FEFDRFxtOtE8T0LPpqFfx0S516YqsBx7Dg2oO5ITtajiQ4
 n/Jsb7bjc6OSqMWe2q++imuTZ41bzIsgBiPwjVpg74nfiAl79eOM8m/TTtZNGsDHB3BZLuV3ncO
 q/hgGEyzukydPtTMwRB/MyItR6shBZn29KB+cHRCvSAYZ6cNihsYhtAydtoWnc/Ne1qlPSfYxox
 aikRfu6v9tUyc+qDIvNGCueHeRNw7I3EW/jzp++59xueT558EDUdQItXO1wQlP8vlk6zDi8N6qv
 PV4OrSMKspcCCxQPRaBds7//8ra9vqacMxwTFAEQbcu2q3MTOK1kCSf38d0ixqEzPbhTzOsl6Qi
 WpnUW8/ha/gqqpwEFgwPr8yx8sn2ao7vqYYXiDAvJaPpQQgOWPVzA0/gFXlR+bAwg+GNTzB0ZJg
 WkyogGLPILKNlIy+0Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068



On 10/12/2026 11:55 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 06:42:50PM +0530, Mohammad Rafi Shaik wrote:
>> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>
>> The PCM1681 takes a 5V analog supply on VCC1 and VCC2 and a 3.3V
>> digital supply on VDD. On boards where these rails are switchable, the
>> codec has to know about them to be able to power the DAC up and down,
>> which needs a way to describe the connections in Device Tree.
>>
>> Document the VCC1, VCC2 and VDD supply properties.
> 
> Property names in the bindings are always lowercase. Please see DTS
> coding style.
> 

Good catch, will check align with DTS coding style

Best Regards,
Rafi.

> Best regards,
> Krzysztof
> 

