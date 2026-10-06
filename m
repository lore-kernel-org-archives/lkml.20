Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F16282F18
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296539; cv=none; b=PKtDsRDYUFcbb8wcA3GW42sS/0+gyax8C92YKnaTtF7JzYPjAX/v0W0B26f02U0bOEXo6BJz3/1vrHwxSAX9gZRrTgavEndv/qPYD56lrvRTn7TiK2ECHz2E64o/86JUtBiL2s7yzDJsdOgtvyyTJuxi5Jtmy8rh0SMxVu9jUlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296539; c=relaxed/simple;
	bh=WKAf6WQmm1tEH7nqcq0kd2klPf0pVwm1HCcqvO9wRus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9Q+AmpxrCLxOow/w3Qdk44x5pVqF6Me2MIoDNMyuNll/7F/H2AzGbmTKM5BZxilqJ0+4xY/k5TW4xcu8tII+GvzQYpxdIFYTD4Hr8ZMOGB18Mn73z7rkHfs22hyAc+nkBWryNfHJTtz3rUFNq98qp0fbTQ6jQ1q+NRGWRDbLko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2OWmxG8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rz27Eho5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2OWmxG8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rz27Eho5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696EBDkD693094
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 14:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97a5UrakWAv4t3YGKHHug98oReETYUquuDQhepwEIdI=; b=I2OWmxG8O1Rt6zSV
	/eIcwM7Rcf+CyvQpRPiD305IfJe/pKH70ZmxHzDQvNtQ4dNM7fDf3GLJ2I6D980q
	zVGsNgH1+OgEc7i5sBnIV60Pc7dl2p2jV1FZAZ7cdcwRh/hD3CL7JP7aVIvfCB5V
	Lw4KvgKEBdwgiQujLc+GLhQ5e9ybWtTd3kgEALI9b8wFdzcRqXO8pm9ujDJCQsoH
	CbGG0dBJCHMYr4UJQLIhjheX5/6YMseayCfVGvG1npJpRB7fPPAmHaktnxa9AF+M
	9ZK77TFjubwNavBuOA1AszipHGasAxxlR2gN0Em4OfDq1oa1onRsDX7LUBmwE76S
	D06NUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdu90y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:22:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8886059d3faso6101314b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791296535; x=1791901335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97a5UrakWAv4t3YGKHHug98oReETYUquuDQhepwEIdI=;
        b=Rz27Eho5KBwzV8xMcHvJs6+gcyJGCJz+VMjIzJvz4SUKMTlyD+0lgHrt5SxpfIlEnv
         ta+P+05WFr/UdpSzmb83RRYLD742TxGYUiz0aimzHiZT4JITeNxOizwQui/AbcKtsXI/
         NsyAlozXP8rN//MDxeyQTGBNz6qt3EOTkBH8ZxcJWgg3xW+lrgOXtmr9Qlao3A0b9ob/
         k/vn2L4QEibMsBaxrNApJXTIgvFgiDYDCabOi2aLwfCHEW3Y12akMH0my6UHy71Cu4+y
         XM337aGvdZydk+R3SuLqhy5LL1Zt+C1911dz3YswmqPhVTlNvUVU3NbHZJX8wZItuZyb
         m4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296535; x=1791901335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=97a5UrakWAv4t3YGKHHug98oReETYUquuDQhepwEIdI=;
        b=VaDJ65aObQ/Q+e9jRYjU74wJ1AYK7171ZAkfB9CWJEuTZ+n5/i4gu47rcYQ2ELup8v
         gKqpUNYNVi5UD45JJrfmJ2KhJ7K2Y3STEHs9FrVV8y106MpPg9y98h+dSt2RhBP6e+je
         K50JBDU6NQgMsUqgoVkAsM6n8I9F/Uh6SnnVQkso3QFQhWsHCafg64vN4fKR5LJCCUYc
         dDkhMnhSEhRJAdkJSHAk2wv8T79Gn7JTEJRsYj2a4dhgMbn7cFmyNTn1TEOTThzNO2Vr
         r+Oo5wDybCjgcjrpfwfcxv5eByKae0dhfpAWsDAKG5DjOJih2KKlm4OyurpiD2E40fLC
         U9kQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDGGq74faW3wp6bBOA81vPjIhrCPCG+2YZKDM+EnuDwOI8zleKD9LX2AqIFiRdDfUQ5XbnZt9Nx/x6Yok=@vger.kernel.org
X-Gm-Message-State: AFuF++ljN2tpq0IwmYbu9nPfKG4ly2IF4IaF0mc/goM5Nt/PHPY3JU++
	lesC/ueoJOXohNXi/rFfGBpc7EjDMgUSCmXgq/jXhUvN8cV/GasTOwHxLEJ0pvXhzFBPE1Fv5mp
	aSZoWrTEuf+n1p81ElAtGdZYpPiU5fL0yVGZt8dlJ4v4WMTxBcDshQYcJ7t730VxukkE=
X-Gm-Gg: AYBFou1n7VJCBrX9K7TBp7l43DYQ9VYxfW8U2JbBOJY7f/Qmw4KSBpyeGWWLzDe2org
	UJg4bhfRYVf4pfeSLXI0eO6YLL1Va+QtPCLyKxIQHV4kK/a4v/DIzS+12sfTt2jNsgzx0yc4Dh6
	lghwB+/jmFJ950dt+AJQ7NqYkCFD/uAjEucWYbwt1f5DE/QC4PlIbo2KL/rFGllBwxs8r0/g5cH
	YJTG1QF+jMBPf7E72ghuZiQG6Ms/PR/jzFk120hb+e1q7GfQWAVAS/pQhupZQU5A07oKxRtVfO0
	HgW3ArLQPD6aDiFxIz70OvqflDrXcoU5lb7/tLPA4/WtRiYjovfHUgpmA7UUo5jEsp9L86Rpcij
	cpcjwLuKXPpOpmZmKzSLJ4ekY0Ak=
X-Received: by 2002:a05:6a00:2e07:b0:886:9eb2:a9aa with SMTP id d2e1a72fcca58-890dbb8c48emr1339035b3a.6.1791296535299;
        Tue, 06 Oct 2026 07:22:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e07:b0:886:9eb2:a9aa with SMTP id d2e1a72fcca58-890dbb8c48emr1338997b3a.6.1791296534698;
        Tue, 06 Oct 2026 07:22:14 -0700 (PDT)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b995sm5077532b3a.4.2026.10.06.07.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 07:22:14 -0700 (PDT)
Message-ID: <a3f1a0da-039f-43be-89a3-ecb5df28bc1d@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 19:52:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, rajeevny@qti.qualcomm.com
References: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
 <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>
 <20261001-private-wooden-chachalaca-51aa57@quoll>
 <997cefa0-384c-466f-b318-077939946768@kernel.org>
 <cebrka4ya7u32ntiya42yx4txa3uryf5k2di234zm4enz3a6vy@xhily6qqmevo>
 <1cd249d8-0a26-45e4-8263-dd4a120fc89e@oss.qualcomm.com>
 <54da53e6-66db-4357-a00d-da27fb936117@linaro.org>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <54da53e6-66db-4357-a00d-da27fb936117@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1NyBTYWx0ZWRfX7ljEtq16LNO7
 f++1z0F7LKCTOl2FeFZ+2mt7N8YVgwsIjvDEAJ67cTqK4Vfw+HFout/7A9gVY55YcfeALVGVaUZ
 orjysMmGJwbw8K1ip/hMXwgNxziod2Y=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac50418 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oPQ4ZL9H7VA3A5lk3HYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: rPcObg9MXUZl01m24EuLV7MZ03QTUL_R
X-Proofpoint-ORIG-GUID: rPcObg9MXUZl01m24EuLV7MZ03QTUL_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1NyBTYWx0ZWRfX+c5/xXjZzlSu
 HnH7NVK7MR2m4z+etYzSFYBr0uXu7jFBrKFlwfApUCm5toUSWoVT0Zf75x6QJtRHiWfBAU9Rnit
 65BXjSVw0wwPKTk5TU0WgjhnizMb8eOwmtSfG7WoZUndlKUhgfYJh116comhnAoryH3OBq2bzIT
 TlmRQWTa43KGR0IzVaWGjCRGF1YkpsR7CGXUvn4Dyu8npUs5xOPHRoiVtuV1vV55+6XtbyL9P7a
 tDq8+OLUStK3qUEZAW69MKarP1hf2zP7u+pe+aGfvTmsJh9+squ1qtAfZShVbcliuDnSA+Xy8z9
 8RLIz7IpJNoyj2ldMErZzvLTvD8oZRcor/oE5zIRoCTwB2Xz4VLy16IAyt3Ef4LLVSFJH7gfjKh
 8A8Ot4alovSL7oTytigtwhYy4SRPvbuSKCfTs9/ReMxgskH2B7uTtlnGwwhcGXTSCI4FnW1mGBa
 L9qHzq6IUh0CVaaf6Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060057



On 10/2/2026 1:52 PM, Neil Armstrong wrote:
> On 10/1/26 20:09, Arpit Saini wrote:
>>
>>
>> On 10/1/2026 3:25 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 01, 2026 at 08:57:52AM +0200, Krzysztof Kozlowski wrote:
>>>> On 01/10/2026 08:55, Krzysztof Kozlowski wrote:
>>>>> On Tue, Sep 29, 2026 at 06:42:20PM +0530, Arpit Saini wrote:
>>>>>> Some boards drive the ILI7807S panel's backlight from an external
>>>>>> WLED driver whose enable input is wired to a GPIO, typically modeled
>>>>>> as a fixed regulator (e.g. vreg_wled).
>>>>>
>>>>> You describe something else. What's fixed regulator should not matter
>>>>> here. Which pin is it in ILI7807S?
>>>>>
>>>>> It seems you just want to represent GPIO with a regulator. This is just
>>>>> confusing and typical downstream workaround.
>>>>
>>>> What's more, you basically REVERT the review YOU RECEIVED in v1. Really,
>>>> just sneak the same stuff 3 months after like the review never happened.
>>>>
>>>> NAK
>>>
>>> After discussing this offline with Krzysztof. It's not a supply (my
>>> fault), it's an LCD driver. So, the best way to handle your displaycard
>>> seems to add a gpio-backlight, reference it from the panel and then in
>>> the driver check for the backlight's max_brightness level. If it's 1,
>>> then you have to send extra DCS commands to control PWM. If it's
>>> higher, use normal backlight class controls.
>>>
>>
>> Hi Dmitry, Krzysztof
>>
>> I have a few clarifying questions regarding the proposed approach. Please let me know if I've misunderstood anything.
>>      panel_backlight: backlight {
>>        compatible = "gpio-backlight";
>>        gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>        default-on;
>>    };
>>
>> 1) Adding gpio-backlight and check for max_brightness level if its 1,
>>
>>     If we model LCD_BKLT_EN using gpio-backlight, the backlight device effectively exposes only on/off control (max_brightness = 1),
>>     we can't support the full range of brightness i.e 0 to 16383 (0x3FFF)
>>
>> 2) Adding gpio-backlight and based upon max_brightness level of 1 , are you suggesting to register another
>>     backlight device that can actually drive DCS brightness. In that case we can actually have the MIPI DCS controlled brightness
>>
>>     If so, wouldn't that result in two backlight devices associated with the same panel:
>>
>>      gpio-backlight device for enable/disable
>>      panel backlight device for DCS brightness control
>>       Is that the expected design?
> 
> It's a great question because there's a large variety of how backlight is
> implemented, and some panels can drive a PWM to an actually backlight controller
> which uses external pwm. In this case we should model the backlight IC as
> backlight driver with only 1 or 0 capability and use the DCS to program
> the PWM.
> 
> So it leads exactly to your issue. So perhaps one way would be to either:
> - call into the gpio-backlight from the DCS callback, we may need to fix some locking issues
> - add way to "link" backlight devices so the backlight value can be propagated
> 
> 
> In any case the problem remains that both backlight devices will be exposed
> to userspace, which we don't want. So additional changes will be needed.
> 
>>
>> 3) I previously tried modeling LCD_BKLT_EN using pinctrl states (panel_bl_en / panel_bl_suspend)
>>     for the enable GPIO itself. However, Dmitry suggested modeling it as a regulator instead:
>>
>>     Link : https://lore.kernel.org/all/qkhgg5x67sijiialucvzac275zhpjrtt47a4udjpyzmgvilut5@dcrslq3ai7mc/
>>
>> 4) Modeled optional regulator wled-supply: a regulator that only gates the external backlight driver chip's power/enable,
>>     with DCS remaining the sole brightness path in this current patch , the panel-himax-hx83121a.c does exactly the same.
>>         Would this can be the preferred modeling for such panels?

Hi Neil,

Could you please help me understand why we cannot model the external WLED enable path similarly to panel-himax-hx83121a.c using an optional bl_supply?

In our case, this supply would only enable or disable the external WLED driver through LCD_BKLT_EN/GPIO91,
while the panel’s existing MIPI DCS backlight would continue to control the brightness.

This approach would also avoid exposing a second backlight device to userspace. Would this be an acceptable way to model the ILI7807S panel?

Thanks,
Arpit
>>
>> Please refer to this Hardware diagram I explained earlier ,
>> Link : https://lore.kernel.org/all/bade420c-aeb8-4bdd-b0cf-3ade17b21c18@oss.qualcomm.com/
>>
>>
>> Please let me know your suggestions.
>>
>> Thanks,
>> Arpit
>>
>>
>>    
>>    
> 

