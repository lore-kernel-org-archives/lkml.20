Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997323;
	b=ouywYsF13OtZwXn8gCyOIU3Mw4SyBHy0/I8YgybJhpwHvXjefB6uUfYIh/9XQb/+tfiE
	 2uF5vW4IkpXvRTHWpZUbPbUahXjxbGm469WdHqB6tzXPqM9QgwFaoaWD8rN7g5yssKDFY
	 oBf9AB3Sfm62QOXqfvHOObNFj3YSjNUH/VfUPsvByw5JXv8BdU91r+XEnNhoPuxigt9AF
	 tN4YzQ+Cwef72rSTF3+O5d9xZ8T2aUy7FysE0/dKfcYQlsb/5sadUkQtjKpWnzMERV99Q
	 UKuRCheN0m4W2WaKGdrdFqL699yjgeuKdNWgvRkVq5MOiOfrJg/VRl315ByGu6tU2aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
	b=dvVg/ovBAdH13hl0XScacXv7xY/U9QQ0FOlXrtOxSb7vY5d+hOrc4t7SvVFCBT6jHP71
	 AZrMfbyk68yn56DRYU6RHo6jWB2krMD0cFPZv/DpdPQM/Jw9pAYTsVg1XlnonDVVXEJbx
	 IxXuI1NN9UgNAmpKC0KNasYdjsZ5O28X6b6Y2O+fKyl9VoOUjS5e8WAEJScFqHIFasAhM
	 8ldE9Xb3ZFOCwIy6jXwYaWZScDs5O/TLcNp14qVzpbedgSanjXqCoYZVxQddyRexZF5nI
	 BsEUDOOjy1eR8CC585jJ07/8jZTJkZbVsFXxVX/7Dcy/+0AkrsrObKlwVxsE7O4Hb8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bEYIwf/H";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgVki5Wy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1833606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1833606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bEYIwf/H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgVki5Wy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b4lN1340483
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=; b=bEYIwf/HuLuugK+4
	f/v0zBXJeHH4oNelfp+4L8Aba2LEzen+zqGJsgS68v5/SrQXERUIlEY7xg0XF8Em
	ksvEBfxY9y+7ytRl0mPJZBiU35NW3+MRC8XQDCCcjLmJy1+mgyl88QJ6zwp6kV3d
	ppFlZWtyElUZWP6LThosNYdXZ5sX0cLxJHMTsLZtrKtcqNQUpa/rUiE3yPA4gY7x
	Xh4fXXi6Tg4wq3wgd7a48NvxplZaoJ1IgHtTN3KsIf80h5wEwPSqLmhbbBMhTBOl
	az39aRswkWQT/OgAqw8Axepg+gw9wRoyKBAzP4WtQa0tTDWedXKpnWkyXxB+PdzE
	GR4deA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9w08m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:48:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a04491c56so2421013eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792997321; x=1793602121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
        b=WgVki5WybWcW6sEL7UvSDBc5Y4kn1oIqQWuqf9BBxjWi65ygpYa7axZautqx4H373G
         rkoMBz/iEms0LGG+FF5DRRIkXzqyitNtN9aeOJqNOX6ANiHcDHS9MUsxyb7jUYdBXARt
         vF7xOfIZGJYYOenzXV8EREfqrSrSVLH/XJVQupjcwFKye6YnWz340Y5mviM/NojkBXpE
         rh6/AGd9y/thKy3LghiwyUEJP539bFNpry0DoTGu98f6T1bw79a/hVHN4iSwFKdR7uvb
         HrfQOXQFA3XVbtNrDhcZY+KZgemh7aO/qskKtcpv7QCUhcT0KHDusOdRPtkuXPlcE8aw
         IJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997321; x=1793602121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
        b=m0LrN2dE/fjNvKpeLlE6XOrARfs65mj/KL15KtNQgtnlQ460rv9xyq6QG4MSTc871D
         7ENJ9DOyGT+oERPjY9MuPtEPcZBuwAt0PWFGULCY48419AUBKOH6391fC7S3/MSQeDNP
         naSJOl42s4Vv8ABosAYzvPNHRmvfCXLxsQRFW6qkg7PCg/P3B0CExCMifSPd8Kn9mXas
         Q4DjUcxOiMy5sCyMF2HsXQw7oO9UcNSqtTYoo4IUnMmpiNsmBHleVlLaA3PcPNwbn2N6
         kpNjL/owY/C5BzLQMInat4FnPHnKvLO39QtuE3D1xm1toRNa6BYSJLSJrlAeXspmgYfV
         Rorg==
X-Forwarded-Encrypted: i=1; AKwUvByiLNecryFiOLts05O4IxZZKyM18R2/j61/3r3sY84YtyDyVr6NXMHcMtsvf+IQjIO4NjWg8pOXtME4dLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcDGj4lLb9ieDwiNyg2+ZXVMPR6nWVuqPEdswHkmnxirhhHt1T
	2zTVt0a8hBKUcghJjH7gvoSYgJFpzfPKVEnVVspYCTeRebPYN5Acx6CGz6wdTEVdXqelJZBTO4S
	kMBRYIxma3IsgexHKTfjKPSc4lwmuW4SeRTE4wwJiNzje7NhfRCIYhvsc1KbFzqkgb7c=
X-Gm-Gg: AYBFou3WuG2Z4Vahyi5e2aSkgHRsBRbl91Py5iGPA+wLeEcevIz63cmcQJONacrxjd7
	+tFpkxO5hGz1dBNLSGkYZXFzJ/aSaDcsCcMc9hZSXWntfzqUxxKKLavg1T0VfUjt30Yy9UkEQBc
	1QbkBq7/9Sav26LvFA3L3BGleSiCOgYVzKonbLNp3MPF/wFze7bMIh22XMqVaxwwU9eIzJEStLY
	kVV4Q4DOMAYezKwOPyuXzWofCf+KwqtylPemigafSwvXkic69Pr1iP7gAqEUvB7Y6FD6DlISiop
	h3JY7/9m93Fx9y///7ycd9iWFE+W/7aWNtLBTOB0/c/Yp4Uq+cIV1lZPcEhmrPRTtEEe0M2fzOW
	W5bh0OqWXdpGpfqc6tiCS
X-Received: by 2002:a05:693c:20c6:10b0:367:a092:3c73 with SMTP id 5a478bee46e88-369e84b1cd1mr8538769eec.12.1792997321108;
        Sun, 25 Oct 2026 23:48:41 -0700 (PDT)
X-Received: by 2002:a05:693c:20c6:10b0:367:a092:3c73 with SMTP id 5a478bee46e88-369e84b1cd1mr8538723eec.12.1792997320290;
        Sun, 25 Oct 2026 23:48:40 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm12718581eec.21.2026.10.25.23.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:48:39 -0700 (PDT)
Message-ID: <2df45439-fb12-4668-9b42-383d5975a902@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:18:34 +0530
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
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI
 audio overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
 <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fJdSf-CQqlGk3bs-SKa4vnm8jTpKBf44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX4odGbbywYFuO
 WufD+cg2VBalqgKJZuIp8PXonUNhCQ1zNXg2FPsDcFG/extPV3LA/Ors7kMl8VFbM9Z9UAEjoXz
 wxwZZOWnYyBAAHrYbYoO5uKv65nq+LS7dtoEcMHz3PxvYIy21Sr2dnh0itaCJXLDLsD7JvAoG91
 brg35GsHyaHfg+kK3zfn+9cd57tOEljEZ4q4xteTu/uRbMGRKoF0M7P+8+JMgtrihwhuBunx+k1
 V1X5KZgjtk0z7KEPhEsS+3L2JbeSAsNFeH6plKf0peQYrkUVNLOdFGVkgdcLCfXGKmMD7gbhAKr
 i7YjakvdYcEVdmf+cteKc+AbljJ+ZS/ubOGupNHauTtFEaKy2ERN9rD8bKRCLWd42rzXIIWSRZ7
 ylfQWndH/uihj2KFJfT7p6/4nFTzBAivJTYRyVc+E3V2lBJsK+nvZWgyGPYnryHkdntfQzzfvw9
 MALhoe9bXbNqjfx87Nw==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adef7c9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=RYTj8pPuvwbYsVMnchwA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: fJdSf-CQqlGk3bs-SKa4vnm8jTpKBf44
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX5ItoSOyTkCIv
 /RscFNp37qaZvY9Y+xjT5A0/4QxKeIadbu+60L0KWmnNA2jjt/+5kpimCGNH6Mqxt20cQgNs3S6
 /j4n4QfqFiXO+6axJDBKl+LNQN90qI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260026



On 10/22/2026 4:01 PM, Dmitry Baryshkov wrote:
>>   arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   |  2 +-
>>   .../dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 +++++++++++++++++++
>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 1c86e7e98f55..127c5c345eff 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,6 +339,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
>> +
>> +shikra-iqs-lt9611uxd-evk-dtbs		:= shikra-iqs-evk.dtb shikra-iqs-lt9611uxd-evk.dtbo
>> +
> What does this overlay mean from the hardware point of view? Is it some
> hardware variant that requires reconfiguration by soldering? By changing
> the jumper? Can one use max98091 and HDMI audio in parallel?
> 
 From hardware point of view, there a physical dip switch which in "ON" 
state indicates max98091 codec is available and in "OFF" state indicated 
the lt9611uxd bridge chip is available.

Parallel use of HDMI audio and max98091 is not supported.


>> +
>> +/* Board subtype 0: LT9611UXD as I2S audio codec, no MAX98091 */
>> +
>> +&lt9611uxd {
>> +	#sound-dai-cells = <1>;
>> +};
> This should be a part of the base DT.
>

sure thanks, will update in V2.
>> +
>> +&sound {
>> +	compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
>> +	model = "shikra-iqs-lt9611uxd-evk";
>> +	audio-routing = "VA DMIC0", "vdd-micb",
>> +			"VA DMIC1", "vdd-micb",
>> +			"VA DMIC2", "vdd-micb",
>> +			"VA DMIC3", "vdd-micb";
>> +
>> +	pri-i2s-playback-dai-link {
>> +		codec {
>> +			sound-dai = <&lt9611uxd 0>;
>> +		};
>> +	};
>> +
>> +	pri-i2s-capture-dai-link {
>> +		status = "disabled";
>> +	};
>> +};
>> +
>> +&max98091 {
>> +	status = "disabled";
>> +};
> Keep the nodes sorted.

sure thanks, will update in V2.


Thanks and regards,
Karthik S

