Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022653B05A1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909731; cv=none; b=uOPsLS/fOyOYLAhFmj0+IEcdJIs6S4jTCoQL1cmSqJVqnyKQSKhDbXm8x8hUpHcMJ7nERMN4BB/5cpfqyLvzEPMhjtLyJE/YIo/GL9kacsOrKGb4cXcj8KPoCIjAFYUo/7LgQfb64rWVtFBLQGwcO3eyPMz2azQXyqXFx4Eer6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909731; c=relaxed/simple;
	bh=0VlPrtAW1Ag8BlC1d0E8ecL937a7RijURTVfk62h5LE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L6EwKK1F66KDzRQdEy0zTFfPFvhQeVKy/SpeXGobeJ9EEae4IGtxS1/cvrXJbKGjy7kzd5J5SRVSlvi/aAk90Q6K91DzUx0SYihDlb/epAd+dPfnfgXjy64swm3aHhFgfZeC0q/OleFUur1GpKZbnDCGgFO7wP66qGwx08TRRAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/cYGsZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjKXpK1r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/cYGsZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjKXpK1r"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66SbR2761897
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEjLtUeX92IN9RVLRhP3Y0wezNthc8ZyOcZGN19DtsM=; b=A/cYGsZWYJQU6iYf
	5xZNCmXzU3YvEqkK1EYaMpHABp0JY3FbP+cnmB8m5WpGp0YlRci4aPYTgv/fobuZ
	JN0drnLD5nTFHS0vPPZMJs9cZ4eow9rUpfTNbqnrd2GSI8/WYfrWkwif0mPr+sq1
	JSm3AgAqGrZNMFnEb3tYtNCqvqnT0xDtr+TzYuQPyQVHZgxkX2tlU6Sca+J1dxiy
	EolH2F4XRHsBT9RAFeP0PUJFSCgPGv3291mrT6EXCag2oSnycIeSkX1Po/wLBkAf
	aZjDxijXBZtPjdMNQa6vMUp2SUw19skIywMwXMeQSsn2Wvc8cJB7QqK/YWrOu8N5
	pcBIcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p8y1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:35:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2115130a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787909719; x=1788514519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aEjLtUeX92IN9RVLRhP3Y0wezNthc8ZyOcZGN19DtsM=;
        b=PjKXpK1rVzAOSgweck9IIgf+3oF06NPO+mfMTObbQNBZ+4mEx7mofses+ijLiWSpFA
         /qVG69lYmd3BgF9IgB4PtrsQQLKok+F2LTmALM++9L8p9bUAawP1Sbl9L4OVMRbHntdU
         bTznNtuU0qeQiE+zm6Bi/DgVoHSKbEZ7+stcrmImTn6kAunqo80rhWU561JDslMJe9aH
         26ttH93syuCu5dhub7W3djLaG7PO72aJAT+rmpolzQPAYto2KLuQsuWhN3dlvj6fg/7h
         CCnCYE9Mm02L3haiqvQ4Q+GJsvgxYACsw5T2137ZzoFfnOt0nIVQ1cFeG5jXKaZ6xqQv
         Rh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909719; x=1788514519;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEjLtUeX92IN9RVLRhP3Y0wezNthc8ZyOcZGN19DtsM=;
        b=jfU7Ef6Tu4PAImM6G2FIbE9mAhHYkwiq0mkImEbGdkHYue2Fl87tDiV6R0OZwM1kKW
         SEQ27MdOm79+7eZ7/dGI8lFrvRvJzT31FfOG0BLCNZEoyMaVmZ/JmDgdM4qbh/gGNQkv
         g54R/lUkKEHtfx4sixdT2cFmm7tS53QxMs+TlsoOS3lg2H1FB18dP19F5rx4o0tsxYG5
         zCQ1jjdQnMU8CmhlCok12DKbwugaej5irfYVzIUvTjRQttEZx9yDDHO0TpD8wh8lTdD0
         LNx5NpZt9WooNRgGF67rwCWU+IDCDwzLMyFQOsxo6i2u3mfFUqZ5LzLh9o/4wRaGA/Hm
         4EpQ==
X-Forwarded-Encrypted: i=1; AHgh+RogBz7wdiGt20YI+LMtXZOxQEalk38qcWdeNqtNA8x3DVy7Ld59lCwELROWLbTFhUrRWPaL1A6smkTNDOY=@vger.kernel.org
X-Gm-Message-State: AFuF++kNG8ZHkLh5Wt6UCgFL8UAUXT1L6VI8ZN/+btHoZVBp9NQ7w72W
	icAYHGTgJGJwXG6lTcADIB/a9c6ddEEWxHg3O3XsVdcff1Cf3+5qIn6rMj/wfz3buTAFyjATZt0
	JAe+88FG90MxwDphfXjDuBbr30MSv7hSaD2j/l49+McGksjJ/Gzf1zPfGbvJEqfmyNpw=
X-Gm-Gg: AR+sD13aLp3uuuu9tu9Zgpyut4xAQzsPPdvjt5LEkxIfPro2U0Sjm00KZlzXiXZVX+z
	Vhl3HQoXgZj2yQq5ryiqV6ck8FxPc7sLZ2UZw8ihV5LDD8mVXV/Gf5b3CHx6ELuNYSwYWPNxhG3
	JNMvzD9k2lccVtMoIKDJGRUMLnVXZlH4UGX/onNGnjlQEuL+/B0fvGIePssOxsLjdzS3tZgBi3U
	QNLJAh17xeG/W9IGPaPNEnzPep8Rde+O9GCH3axe5ZXzKhUAQmiyPwFLGtR202oJWUAFTThbZho
	HDHIDwd1n1EKirSAtNOmasiToLqEn1/6GpTtn1Ah+gIUu9dMwqQIz6YmwcDMVpm2Gab35iArAFt
	xpwHGd3/KIpt/QGRniOjgG8KMEZkY
X-Received: by 2002:a17:90b:6c7:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-396d0e25905mr11540993a91.2.1787909718764;
        Fri, 28 Aug 2026 02:35:18 -0700 (PDT)
X-Received: by 2002:a17:90b:6c7:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-396d0e25905mr11540898a91.2.1787909718215;
        Fri, 28 Aug 2026 02:35:18 -0700 (PDT)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm4311667eec.24.2026.08.28.02.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 02:35:17 -0700 (PDT)
Message-ID: <ebc2b308-0a71-437d-9fed-e60d4407b863@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:05:11 +0530
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
X-Proofpoint-ORIG-GUID: w-Tfg52kpcePLWsBbcXk9hglS5D6WRcO
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a915657 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=wZjUPTm7zW1cFMT4b9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: w-Tfg52kpcePLWsBbcXk9hglS5D6WRcO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MSBTYWx0ZWRfX1Jo5Kev82PaE
 Hunh7P+fgbSUZYMy4/UC+vFClcVP1YgWVCT0QmOCcXwhwHGp8mzaBJ4yzYwW76yoAzqpWW+EnvB
 cIBC8TwgbV6Qi6YjJz2ivxwAIIBgRWg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MSBTYWx0ZWRfX/VZ02ykJTbEE
 zxr7Em/oyTC4eK7RK1ewYSdosoOkaqoko32TTGMUA9GzL7HyDyJpmFXFYAVcrlGnbHFDsvdjppb
 bb1MFqsZel0fW81zR0F8Tru2dIKflQ4IQMY3E6G1a3QuC4iOQC59QI7JrxGSMV9DpL+/sH5mQjN
 tCD9t2YMZqoY2owMvWKYC301e+5L6ZpWZhPBDQk03+uepdemn8ZQT7dIUpKwlZ5G/ZTpcpVP5fq
 3I6ErRO9vMuYOWeFkgCBGwbDRMHP3C5N3h1VJLjrBLtaGh2iRTX78/iA+NwJ2+NPvtvIGQU4RVd
 4E+KorQDvCLaI5HT1v0pHWv7yoCmgORnqNnzVkVSGna/XtlAMhOdAq/bCiZ8lX4EXNQRK4DJpNh
 7xjmZiWelEZKQUF/PrrQC/Rph39IivoKiCrxw5UwP4JTfePzTo7aA8bS5CNKEuRowB+F/yGCSVj
 TOxFYkFUz18d31z0ukg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280081

Hi Dmitry,

Just following up on this, 
I've addressed all the review comments, Could you take another look when you 
have a chance ? 

Happy to make further changes if needed.
Thanks for your time!.

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

