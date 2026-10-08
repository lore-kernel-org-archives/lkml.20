Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9011485925
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452085; cv=none; b=fVuyu37gr+UoPNJQST27IRET2aKtwxyBJZvmVCVVgsxTbG56A0qWE8DGcM8V76JO34O0Qu2lJFJBkDierNjbM5iD2GOTsyMl78wuosRYe1roEr2GurC0MKjxr9S/9020skMikaqN2PiUd6Q+1v0mYYBJSRBiFtboAHn+qgeYmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452085; c=relaxed/simple;
	bh=qDTPagCMKXfXSQoAQtHPcRyFuFiVXChd3KWcBOa3Mv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWBrqpPIe+Pu+X3qBLb0BYv6WF6wJlRk/YuMmpRULGv/bVWZnTFfXK/in4+0IcWegf/EhV9endzGDzA2kyKICAl5SwnPc+rqq7orsGJwpdirjTEkK6dNuRa2O/iDZR8LtHi9SP0kB8Qpw5NikUiEqeCqcY7QDcEqTid3+rugON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewtkd9Vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GF49fWzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewtkd9Vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GF49fWzk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KdjM2686707
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=; b=ewtkd9Vv03MTGYw1
	yJqi99u4KX64v67wjKlDurhKecn+nlTJlKHFcpY5y9zKLUqGTl4KIP4IuYJhZvbQ
	Z+SSJ8secrzcFE5ePquEgmOE6RI1mYGzT8Ajq4yfHkXl9nK6/BWEdzgVQGzQllYY
	QY6pUoLYeiM2d2kIsho1zEJuFiRBDNNYfHSXgy3XfjVJFZnfv96iBGEZ+upHW9XH
	jS2TzYBehdQzEg38TBKCKBieMi8kOLnuNCpYll2XysIdx7+0L2PD5d2U6oEkUiWC
	YPftL/TO3NGVF9qkSSZpuzxQRrBwtiUR3d5uZr0lyTfwXDkf1JCEJeCvinFWQPvL
	giRHng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe427yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:34:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e61a8eb087so18948685ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791452081; x=1792056881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=GF49fWzkVOfWOxt80CQeCe60UVV78GoBjHdoZFQPoj+pk3FgL8ICTSxMCvCa0HAXLl
         uTkAlAaHmQ+akMqPordZav3hlatIbZZMxkjteKq+b5gknbVK2pPxzIAW8sM/MU6RGZBJ
         Nf59xIbLFriVR8uzEXnDhGVa9VOGVe/0gGbXbw4Wa+/2/QK+jhPvd4i11cdCJxNLybJZ
         O8KH+J+DHD5U/RUTcyurvR0oSB0J/JiKp1FxTmQRGcTdkiOWC/kPJKAZfDQ60e62OsjC
         c6+ZUkImYuLaJs6JUm/76GXDBHCGewadozrW+PvFOgfw5CKavZDVthbuYjI++NfqVe7x
         XcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452081; x=1792056881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=1EKHQMmPuYYfHtEI5tDdPWiOPjJ1QKdcv2vo6owxrwUac8prPU/7MrjlH9Xw/AzL2w
         SUK3fSBThfgVDKw8+GfIUpkVetcn6dO/ZX1JtlP0D0lqE5hEQ5bVMHJTiUo5AryueUcT
         1J6Cgj7MIMekJ9UT8FeVUMgWpEwWOdTFfreih4jlDXPnfWPO+03jJsuE5q4G3HYyDMes
         LVCc3f/GC8bnShjh2t4tXpHNivKQVKzvszsAUYIH31Pl93OOnxOjmA/MwZcF4U7AkHCa
         yq4pxcN2Pcv4CtvDOSQtWbIiW15HcLmFfg9CDnB7yzc+i8GxAqJv5K3wm9nN0+TEPtvI
         f4tw==
X-Forwarded-Encrypted: i=1; AKwUvBzCdvjDjcjmsrriP1qXCFNwH02wjttw33lpjysuRUv+vmG872gkSPUHwnktkbExRLplp1SHVO5e1WSITo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqcXQt+Me/ZdNu6anmqnuxznu5HU8b8Ft4rWP9Ztb1+DcWhaQp
	zF8uSEH18l3dsYADzMEc+rDSlw94pyGXHUCzeA35vnvErGaj7aLNoHMuaT/0g/caqOJuLfve2gD
	YrFZXOJ7P21pgXVccceXsCTvW7kZPzWjTbVLLxhofjLV8ZDy0fTh0i27u5L9srbyQnWI=
X-Gm-Gg: AYBFou1tKvrdC2HYakUVSkns/y+x/YfUlfrWBCKEtpm0Mtil40x/vlvJp7VpMT+j7nQ
	AjDTWbuxfAfN9n6CeUrIc2oWRhSoiKa/LSP3SCsMItWWCT0EsldCANuC7RKLNkoMMZaE9t0K7zK
	+h88lorF19qBU97c6oqrYG9CwYoaSbyM7ypzvSWwL+LYW1CGR5la05svzzD8q462FsFnoAAHgt5
	P1RGfFniWs4Lv3z0jVcE+wzV7m7eOQ6e9RzMrT8yzeWcwgHj4YgV+f5ZPjIBw9NvJ5akwprpUuC
	ZvmG3a82bgEos3ARUUAT7YIIff+IjEhA7ecB1TrJXk0z9MN1bXDQ/Fp9P/yUxdOgb9i5RZVx690
	WRskdzaLfLCJiu4rmENBkygFBZ7U=
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850845ad.2.1791452080635;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850655ad.2.1791452080181;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a46604sm22029495ad.72.2026.10.08.02.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:34:39 -0700 (PDT)
Message-ID: <041edb78-acc2-4832-8500-28db58db1529@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:04:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
 <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
 <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 56QFztjVEj-Afw69PApqQ1CuRWyYehm3
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac763b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=k_whtCd4PG3F-9RvoSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX1jgI5FeKX24F
 SXJMS4i6PFOhwHeQJ6A/nW3mTcXMTzmWVuvPK7pfPnH5wo2W77jb/XLfY3Sl8ucBXub6zkTBncd
 u0nfcW4Rwo4MdlbpeSZxdJ7Y/s92ZZA=
X-Proofpoint-ORIG-GUID: 56QFztjVEj-Afw69PApqQ1CuRWyYehm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfXx5tjayAv3Qs0
 4EXRS9Drk9aGRg3JYKjaZRKkcAppRnIgjcmwGeHfToJ6nq4XopCvzRGYHfRKDIs65gEVucnoXZ8
 dd8x3y+iWrpapDHg9cGHjTeNsCeqsuhuuAQ8wwGRNMXx/LvGA9ApxPfM1TgLFCve/mlVwhG2Geh
 DKU/ZmQ+Cq3AXysZPatlQKe0Pgkb7/OE/sISL9vDu9JJ55quxuFyNWU7MbTHbaEWGZiI1AUz+RP
 oWwRVip5aSxphwfwx1PRNDJPiw/j3iMyjeXR/R0Ah3Ro4lr3dAcbZOoyLN7c1jaaLv4M9Zd+FWO
 0aPdPEABhgQYxbodGzfIi1TdOF4Pnnh1sB/RUjzo8g0Am0QQ679VVX8yJOEcNnrCH+TdaQIIQK0
 v4WzGrM1Bk3Ncrx0WsMxzLDiOYIK/WYhh++uB25rplpDrjBZrF9344TCSceAUNgeOrgTsoUYJpJ
 glTsh+BBFaU4x8YGRcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037



On 10/8/2026 2:16 PM, James Calligeros wrote:
> On Thu, Oct 8, 2026 at 4:33 AM Ajay Kumar Nandam
> <ajay.nandam@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/4/2026 11:33 AM, James Calligeros wrote:
>>> +&i2c3 {
>>> +     status = "okay";
>>> +
>>> +     speaker_right: codec@34 {
>>> +             compatible = "ti,tas5770l";
>>> +             reg = <0x34>;
>>> +             interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
>>> +             shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
>>> +             #sound-dai-cells = <0>;
>>
>> Both speaker codec nodes reference the same shutdown GPIO. Is that
>> intentional for this board?
>>
>> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
>> GPIO requests are exclusive by default. So I would expect only one codec
>> instance to own this line, while the other appears to fall back to the
>> register-only path after the GPIO request fails.
>>
>> If GPIO181 is a shared physical shutdown line for both amps, how is the
>> power/reset ordering expected to work across probe, suspend, and resume
>> when only one of the two codec driver instances controls that line?
> 
> We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.
> 
> [1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com/

Thanks for pointing that out. I missed the shared GPIO proxy dependency
when looking at the DTS nodes.

That addresses my concern about the shared shutdown line.

Thanks
Ajay Kumar Nandam

