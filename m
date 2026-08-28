Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BBC3C5DC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905501; cv=none; b=k3SXHqRJ6zyUYsPqKo2ZQMmEueT4g2Y42ciwOaIgQr6udR7xgN9oWdPXtzf+2MoSfO1l1bm2hJV94BplncO6Nj58TOOVEhM6UrO0Uw7yfVud5yX6eAkmU341DZiLx+icfwwjemAknMOxkY8UkCaoLxKEqUO9JYKEUzIdqgedDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905501; c=relaxed/simple;
	bh=eG1NrlwTSo6Hf+u0qoyZJN/TXCHHdJNVCgVOQtL2HuY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GA0Mgz+DErOKxwJuFuDAp9SFVO0iO56YXwG4y24Y/rj8O0oj/FfnrFT4q3gvwzdimVQ/ZaQIrmcFvmkMckiI0+Nq09vCMTisz9c8i0ZqSiWYkEkHqhgXNcglgXNqxiiUo05rfKGw2hCZ0lJ/NP+AYDrwAh03vERMn7gnocTKVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7tqRaD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFYDCnT+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7tqRaD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFYDCnT+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66sO82196980
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11XbxNNO2qPvMjMN3jHL8aRzRYMYkmm/3RbuVRza1y8=; b=E7tqRaD5Ol1i/KEO
	bp6i3rji6SMlWZQdMzas1PpoEusUM/y5NTs4aDP6zKHpusDq8q9i6jEmYUyUJj8B
	sln4zxjS7rUm8DSkRZgsqCpNjpRSUvgcnX/5DF8Zs/UWfGsiZ4mvu0V12wgtUdHu
	PBuXzvV3cHKF9+QrUDwGfkeg1KlTBkYweo5ceLXe1gHHaPZeC8WrM4neoKKSFWMq
	Ad4efeXr/+7mpg5WmsmusVzNGzOLUiJitJ6sLl7beARS1nZrrf9ZCFJMclcWqbck
	hk/Z+XAUOpW5E7fH1UnJ/nwvuHoaPbncFkrJptycu3fa5fIJ1D5EiiU6bouTo8uH
	CmgkNQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxrt8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:24:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso9785955ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787905497; x=1788510297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=11XbxNNO2qPvMjMN3jHL8aRzRYMYkmm/3RbuVRza1y8=;
        b=FFYDCnT+tH2ccQtJ/00WV9auuoMsug3Mk7pohV5IcOzBFjNx23iYsnT558JMKHNdCH
         qdvQp1PNX1PPu4z0go2YzgU4sr4BnoflV8u1dFZyOOwbSLTaI/uMv8h2w3Cimz78prCV
         k/VUvuUj5CYWNagDblD/mQzPrEFZt2a5ibDP42+ZMMKZwbQhFy8T1jCLs1uOF6H+Cufl
         RF4RK3ZbH8NjU2QYw4wjHF1p4Vpj0n5ELgEgA9yrz+07L7Jgkkxro9uIlN3E3oB/P+Po
         uhP6YSCcuVk3TvoSgX6slrkArThXDZYV9vhgNyeVsK7yKEcy8TWneJKMo3cHGQdp9jER
         bbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905497; x=1788510297;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11XbxNNO2qPvMjMN3jHL8aRzRYMYkmm/3RbuVRza1y8=;
        b=N2veoQAt13iBKQLUbI3jT/+CUjyl0PGH4kwIAXA8zT3f0MQjv6cTwLfD2m8xegvo5V
         KhEptkn/8trKpmP53cHxa8HYkdvV1NFQqo9LZWTI+Thk3+1IEdbLeQWV1SevReq7B91U
         LOqryLpDR89VeogMqNhKMirUUMpUUxny+IOjZU0/ukifLrq/4R19TTvF1Alf52V6+t9D
         Y4IjK4+B2ckfUaDoPtC/d/V8AWHg0DuM7DOTCsdY3kfa6h67k6/pjMtiffT37DNMxXjI
         JjuBiu+mEbKXS6NaMhyFGdNJdEfsVRVraUpHz+rqCYfeLbRvNCy83tpvkkX3Z+wkw07G
         kLaw==
X-Forwarded-Encrypted: i=1; AHgh+RpUnDfVbBPE3HEaXVrSkXmr95EqZmfnqhsc/hpMvjDk0Qk1e1W8ha+iD2IpP7L54hjXZx4TpJGqk9YlSqY=@vger.kernel.org
X-Gm-Message-State: AFuF++lTkuv55weSwsFSqKY9i81yrxpRT2QXFyEgIB4qbG/l7XCKdP6N
	TAzFmO1cnAeKSnYm13Qh+kYWdsF7q2H5Auv6XpSNoicyip1alQgYNMJqMlZdqpICSTkvifYjV1f
	OfbfynCbchVBODEMhhsvycnK1JFMLiJ+zAaeb8JS8cAZcDSUzxLfQz7AzW4r9d1OnZmA=
X-Gm-Gg: AR+sD10NMRXAWXeyTeueMtbQuXEL8ixSJb620SB9t/tdZErriQuKhjLJLPlw/kpN3Lb
	GDkrisNsF6DWI/QQscRH+SJaUtQPZtUEwFPmuF57Cv2Ibk2d7bkv8RmT1rsRZXc+9PeNSOEJnfl
	HYN/FnI4y+0WxlUp97WSCCnviE5T0iCak+rhCf3LBWgQyHZhddO5xLl7Zywlxn1v4ys1dwnFiK+
	DK44AdaFRhaeZUL3s4qjeIJIHeuMbMhFvUs4Nlfs3j7/oeIaYdzDJS+JMQqjBJa31L9thadBJ7W
	ly6PzhPXUM5JdAqyYuRTeCIZtYwXBkMwJh1nfHqZh4abl/K9It4OHNcD6Fqa13hlvlMw4mNJIb8
	DQ19MwcYRipQ8ccRVL/eUdt0/1bc+
X-Received: by 2002:a17:903:2f0d:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2d74e07003dmr102115935ad.14.1787905497064;
        Fri, 28 Aug 2026 01:24:57 -0700 (PDT)
X-Received: by 2002:a17:903:2f0d:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2d74e07003dmr102114855ad.14.1787905496507;
        Fri, 28 Aug 2026 01:24:56 -0700 (PDT)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784845sm3991921eec.2.2026.08.28.01.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 01:24:55 -0700 (PDT)
Message-ID: <bade420c-aeb8-4bdd-b0cf-3ade17b21c18@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:54:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
 <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
 <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
 <rq4echpblosddelpjmcms4ezynohrzfbr6axfjtonhd7ptn5mj@gj6ecmqv4ows>
 <15957c47-f8bc-4d92-a6b4-88c9a546d807@oss.qualcomm.com>
 <vfj4efaef46cldwve4bk2rat27atpqtfyliewkbragm5wyrchj@ke5vcubecfui>
 <29ca6303-4368-4aeb-b82f-039aa252780a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <29ca6303-4368-4aeb-b82f-039aa252780a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3MSBTYWx0ZWRfX7LausLSoxUBQ
 uR0M9oEllwwHEXxeMkrJNkVj7vfWQC383oE0ZDhujVIIp3u0h0RaFJtiUppJ4x+BEajhCS1hwkz
 g0kShQlL68qj+skBJ1DOQHtdyVgErxXhQWG/b85CfdXAH113lcdhYoNXnEEVF5mefA8k1Cknz1a
 fMFZTvM+450Y9yw0FgX4yI9+BZiNQaf88X4ZTHnU67X4b8bIifR55KFL3CLxMQqkG0ovKyFDRa9
 o5xeRzb3k7+yulytfcYZvzQ4+2rG0SvSFXz+pjSqYD0e8V0moV2podwqK5mtsb7CyvcUCIvhtFq
 NXjRQPstTIaMAy/E6K2iwzPE8swX5dxzTQ03yr/bjPE9/Js0iCCdd65Q0VldduQSPxSKTtn+7jH
 3r+NiZOJMb8yp+EFsplYj/xp53D9T6XSHuE0gyI2XctK/sPZW2GjuhPNdhsmdivDUGH1VW23l0M
 8rzQwoYQw827CpEanYQ==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a9145da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wZjUPTm7zW1cFMT4b9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3MSBTYWx0ZWRfX77g+W2OKGt3c
 yzgoem6A1EML6DsAKdH1uRYQsfEHLAZwNK5tUESHi7ZbVpmJlduNBcJ5KuGuJBW6rqs67HOFGTH
 LpuTOpMIQ4QTSFXg888yYZeAGU6jUhY=
X-Proofpoint-ORIG-GUID: TKmhbIbmiGWb_qETS4nT5Hjuvak4JOV9
X-Proofpoint-GUID: TKmhbIbmiGWb_qETS4nT5Hjuvak4JOV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280071

Hi Dmitry,

Just following up on this, 
I've addressed all the review comments, Could you take another look when you 
have a chance ? 

Happy to make further changes if needed.
Thanks for your time!.

It was great meeting you in person

Thanks,
Arpit

 

On 7/28/2026 11:14 AM, Arpit Saini wrote:
> Hi Dmitry,
> 
> On 7/22/2026 3:57 AM, Dmitry Baryshkov wrote:
>> On Tue, Jul 21, 2026 at 02:35:42PM +0530, Arpit Saini wrote:
>>> Hi Dmitry,
>>>
>>> On 7/20/2026 6:35 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Jul 20, 2026 at 05:37:25PM +0530, Arpit Saini wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 7/16/2026 11:21 PM, Konrad Dybcio wrote:
>>>>>> On 7/14/26 9:21 AM, Arpit Saini wrote:
>>>>>>> Hi Dmitry,Konrad
>>>>>>>
>>>>>>> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
>>>>>>>>> Hi Konrad,
>>>>>>>>>
>>>>>>>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>>> Normally the backlight EN pin is controlled by a backlight driver.
>>>>>>>>>
>>>>>>>>> However, this panel uses MIPI DCS based backlight control with no
>>>>>>>>>
>>>>>>>>> separate backlight driver. Since there is no driver to assert gpio91,
>>>>>>>>>
>>>>>>>>> we control it via the panel's pinctrl default state..
>>>>>>>>>
>>>>>>>>> So this is platform specific pin , we need this to enable/disable
>>>>>>>>>
>>>>>>>>> the backlight.
>>>>>>>>
>>>>>>>> Handle it from the panel driver. Also please fix your editor to prevent
>>>>>>>> it from inserting extra empty lines.
>>>>>>>>
>>>>>>>
>>>>>>> Earlier I handled it through panel driver, but this GPIO is specific to our
>>>>>>> Qualcomm Daughter Card, it is not going to the panel connector.
>>>>>>
>>>>>> So is it an enable pin of a voltage regulator maybe? I'm having trouble
>>>>>> understanding how this is all tied together, given the panel driver
>>>>>> uses DCS commands to control the backlight status
>>>>>>
>>>>>> Konrad
>>>>>
>>>>> No, it is not a voltage regulator enable.
>>>>> GPIO91 (WLED_P1_EN) is the enable pin of the WLED driver IC on the Qualcomm daughter card.
>>>>> The WLED driver is a boost LED driver that powers the backlight LEDs.
>>>>> The backlight control works in two parts:
>>>>
>>>> _that powers the backlight LEDs_.
>>>>
>>>> So it is a power supply.
>>>>
>>>>>
>>>>> 1. GPIO91 must be asserted to enable the WLED driver IC itself.
>>>>> 2. The panel's CABC output (a PWM signal) is connected to the WLED driver's PWM input
>>>>> and controls the actual brightness.
>>>>> This CABC output is driven by the DCS set_display_brightness command sent from the panel driver.
>>>>>
>>>>> So the DCS commands control brightness via the panel's PWM/CABC output,
>>>>> but the WLED driver IC needs to be enabled first via GPIO91.
>>>>>
>>>>> Since GPIO91 is on the Qualcomm daughter card and not on the panel connector.
>>>>>
>>>>> Dmitry suggested , it is not appropriate to model it in the panel binding.
>>>>> The current approach of asserting it via pinctrl default state in the board DTS keeps it board-specific.
>>>>>
>>>>> If you have a better suggestion for modelling this, I'm happy to follow your guidance.
>>>>>
>>>>> SoC (ITP Baseband Card)
>>>>>  ├── GPIO91 (WLED_P1_EN) ─────────────────────────────────────┐
>>>>>  │                                                            │
>>>>>  └── DSI ──────────────────────────────────────────────────┐  │
>>>>>                                                            │  │
>>>>> ┌──────────────────────────────────────────────────────────┼──┼──────────────────────────────────┐
>>>>> │ Qualcomm Display Daughter Card                           │  │                                  │
>>>>> │                                                          │  │                                  │
>>>>> │  ┌─────────────────────────────────┐                     │  │   ┌──────────────────────┐       │
>>>>> │  │  DLC DLC0697 Panel (ILI7807S)   │◄────────────────────┘  │   │  WLED Driver IC      │       │
>>>>> │  │                                 │                        |   │                      │       │
>>>>> │  │  DCS set_display_brightness()   │                        └──►│  EN                  │       │
>>>>> │  │        │                        │                            │                      │       │
>>>>> │  │        ▼                        │                            │                      │       │
>>>>> │  │  CABC output ───────────────────┼───────────────────────────►│  PWM                 │       │
>>>>> │  │                                 │                            │                      │       │
>>>>> │  │                                 │                            │  LED outputs ────────┼──► Backlight LEDs
>>>>> │  └─────────────────────────────────┘                            └──────────────────────┘       │
>>>>> │                                                                                                │
>>>>> └────────────────────────────────────────────────────────────────────────────────────────────────┘
>>>>
>>>> This is a nice diagram, but it shows backlight LEDs as something
>>>> completely separate. Usually they are a part of the panel. Are they not
>>>> in this case?
>>>>
>>>> I'd be more interested in a different representation of the information.
>>>> What are the _actual_ panel inputs? Decribe those (and only those) in
>>>> the panel bindings.
>>>>
>>>
>>> No , Backlight LEDs are part of the panel, I will correct the diagram for that,
>>> and regards panel bindings, I modeled only the actual panel inputs.
>>>
>>> Hopefully, this diagram will clear this.
>>>
>>> ┌─────────────────┐         ┌───────────────────────────────────────────────────────────────────────────────────────────┐
>>> │    SOC Card     │         │                                  Display DC                                               │
>>> │                 │         │                                                        ┌──────────────────────────────┐   │
>>> │  DSI0           │         │                                                        │      DLC Display CONN        │   │
>>> │  ├─ DSICLK_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSICLK_P/M                │   │
>>> │  ├─ DSILN0_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN0_P/M                │   │
>>> │  ├─ DSILN1_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN1_P/M                │   │
>>> │  ├─ DSILN2_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN2_P/M                │   │
>>> │  └─ DSILN3_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN3_P/M                │   │
>>> │                 │         │                                                        │                              │   │
>>> │  1.8V ──────────┼─────────┼──────────────────────────────────── vddi ──────────────┼──► vddi                      │   │
>>> │                 │         │                                                        │                              │   │
>>> │  VSYS_PWR ──────┼─────────┼──────┐                                                 │                              │   │
>>> │                 │         │      │                                                 │                              │   │
>>> │  LCD_BIAS_EN ───┼─────────┼──────┼──► ┌──────────────────┐                         │                              │   │
>>> │                 │         │      ├───►│  LCD BIAS DRIVER  ├──── VREG_DISP_P (+5.5V)┼──► VREG_DISP_P (+5.5V)       │   │
>>> │                 │         │      │    └──────────────────┘──── VREG_DISP_N (-5.5V)─┼──► VREG_DISP_N (-5.5V)       │   │
>>> │                 │         │      │                                                 │                              │   │
>>> │  LCD_BKLT_EN ───┼─────────┼──────┼──► ┌──────────────────┐                         │                              │   │
>>> │                 |         |      |    │   WLED DRIVER    ├──── VREG_WLED ──────────┼──► VREG_WLED                 │   │
>>> │                 │         │      └───►│                   ├──── WLED_SIN1 ─────────┼──► WLED_SIN1                 │   │
>>> │                 │         │           │                   ├──── WLED_SIN2 ─────────┼──► WLED_SIN2                 │   │
>>> │                 │         │           │             ◄─PWM─┤◄───────────────────────┼◄── CABC                      │   │
>>> │                 │         │           └──────────────────┘                         │                              │   │
>>
>> Perfect. So this is LED device, it provides backlight to the panel.
>> Describe it correctly in the DT.
>>
>> Think of somebody using PM8150's WLED with the panel.
>>
>> For the panel bindings use only actual panel inputs. Think of it being
>> used on a completely different platform, without the DC card.
>>
> The panel driver already handles this generically. In ili7807s_probe():
> 	ret = drm_panel_of_backlight(&ctx->panel);
> 	if (ret)
> 		return ret;
> 
> 	if (!ctx->panel.backlight) {
> 		ctx->panel.backlight = ili7807s_create_backlight(dsi);
> 		if (IS_ERR(ctx->panel.backlight))
> 			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> 					     "failed to create backlight\n");
> 	}
> 
> If a platform provides a `backlight` phandle in the panel DT node 
> (e.g., PM8150 WLED or any other backlight device), drm_panel_of_backlight()
> will use that external backlight device.
> 
> The DCS fallback is not created in that case.
> 
> For our Qualcomm display daughter card, the DCS fallback backlight is used.
> 
> So the panel driver is already platform-agnostic:
> 
> - On a platform with PM8150 WLED → provide backlight = <&pm8150_wled>
> in the panel DT node, and the panel driver uses it directly.
> 
> - On our daughter card → no backlight phandle, panel driver
> creates DCS backlight, GPIO91 is handled via board-level pinctrl.
> 
> Please let me know if there is another way to do this,
> or if I have misunderstood your comment.
> 
> Thanks,
> Arpit
> 
> 
>>
>>> │  MDP_VSYNC_P ───┼─────────┼────────────────────────────────────────────────────────┼──► MDP_VSYNC_P               │   │
>>> │                 │         │                                                        │                              │   │
>>> │  DISP_RST ──────┼─────────┼────────────────────────────────────────────────────────┼──► DISP_RST                  │   │
>>> │                 │         │                                                        │                              │   │
>>> │  Touch ─//──────┼─────────┼────────────────────────────────────────────────────────┼──► Touch signals             │   │
>>> │  signals        │         │                                                        └──────────────────────────────┘   │
>>> └─────────────────┘         └───────────────────────────────────────────────────────────────────────────────────────────┘
>>>
>>> Thanks,
>>> Arpit
>>
> 

