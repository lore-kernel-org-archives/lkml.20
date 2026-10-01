Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31DB52D2D9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878182; cv=none; b=BNSG8ltox1vG78b4wQNwm7kd7hIAQU2vJWiaCbZbOUH/nQth2xfZA+ohDQQ5F7zFG40C9ZFG8+VWP3owjU5fUYf2Ijb3cR2A5jkDQZF3Qfdaocr7F5wulygWRV7btEjh2LqFylmYMTMd9DwEa0QN+XbqeBpzPSAPxp6DGw4HAbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878182; c=relaxed/simple;
	bh=OGVMUSNiTzwBKMN0PU0Km5dKvk9yGtdNENEkqzcnGYA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bjfkTELkUdC8gi6OiWFvitDAReqe4erWP1q2lZvIPBfzdTshJXRiIqui/2Pg4wxq/xuK4GFIDyEwsED9fwJF0Ac+ODlEp4k2rbnEtOBNDGlVrnbATCTm8e76Ia/41fpx4jHTrkzp79+5NbciEnSnzQNf9Xm0MjfdeE+/75KcWMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKdRi2yu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLSJZ2/F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKdRi2yu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLSJZ2/F"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Fsdt13512253
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 18:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9uXDb4OI7XH/Jm42mjZ9uKZxzZj3a/tu0y6m6HKjOE=; b=lKdRi2yuep1oHCGO
	Rg5+jkSakdSc4JS9gjY2OsNjvS7HlidXFaWLQOR9MLQC0FqG0b9LfsNTtGJJqrwi
	xPU9QJPYizmAIbdV/zASeRBsVuHQ1vLGRJCgiJnZowDWpxA56XvA+dr19PgfXClc
	Bc1ElCzn4eOga4BBMgbikr/wD4Lp15IAs7d873NX6YiSOQyp6HAY8BfWbCw0c987
	AN77QIuv2KBR27A6jPDGlusASz2MEun7RxVzGrqYuVxq42pPcTsrsMHd1byWnmWl
	YqoYo5GDYVNVbKcCKtu84WtawT5yNncW9KWq0MiOK5dNgFG4eRGJ0iqd0QpSwtDh
	ZYKaHw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk9gk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:09:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34afa104860so4441025eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790878174; x=1791482974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9uXDb4OI7XH/Jm42mjZ9uKZxzZj3a/tu0y6m6HKjOE=;
        b=eLSJZ2/FtBIoHB9FKDcii5yI7VofYO2BE0JxWQg3Pl3blVp99t9Dl6bfNN3Kra9NVA
         Ozynr2czl/4hxZaaq7z5sgF9cugEttDxc3aiyhCwJNsajRxUwVXYvMSlQiWYG3A5Gq76
         Wnpo/M1wBNyPBH1b7tIK5IPBcslLbFNeDsHOXYLZE/gPPjNF7LxrGPsc/iIrUXpku6Dm
         eiaqubHzpyfGaTyesU68jge1jUQMIXD+T4OBx6YH0lLXxAzWy6oT9wnOwmQGjYjSlRSK
         0cWiOW7WgtDOYiWEV+mT/kVGU9M6w8dG3P8nVfDMJ5Uw5i6jks2dFczhoPiJbD4w9LYI
         WL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878174; x=1791482974;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9uXDb4OI7XH/Jm42mjZ9uKZxzZj3a/tu0y6m6HKjOE=;
        b=XrPdMBmBOmKFRmZGR3cmKQCd5lHpDthKbIynNssM5poEpgP+jmzamPFI+bxJMxmGrX
         O3jVOp5VQicEaP7vZ11uTgavBaLvAGgc66+mQMVUbMSPCf5yrX15qnY+i0OfK667uAY0
         OyNmMtHwTtPZz8v8guW7PHJo+WvjH1Ehm+O3FhxE8WJ0eAwu1LMJDZsLZEK00KDgrjXs
         Tuw9hlCvmua46L5YtxNmYn++LA72zRzTSVi8zYsmEqj8p+SPYw8rJ1do/8ZprrUOlvhF
         lxdt4V1rjDSvPzb1Q7tHXyPtNptOCumFcPXiQk+AwyJI2dvq78R/WI7k4LkE0vJWv+IV
         6KJg==
X-Forwarded-Encrypted: i=1; AKwUvBwxkumVtw+vSfHMPxjyhVfXo8VhPaAhXR1JJe6aJBv8rPhlhTFEbJzTUlFtvbFm5UoxM4ON0HQv1N5UQjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJedUcDb9htoL369pL8Rkw9HiIpI8V+PQ3EMkvBUh88r7qyYFEr
	IkbGNdJ5oK1texw4Jch2D7Oo5r06qcpnsBhwCpso2ufYmvD2I6Y4cRcQ0mtPUT9mBJwatXFuj6L
	hqwjgi8ldnYIfR+9648tL235iQQ2WxLKEtc3/cIk3LPAnWgsqFNbljGsqOtv24clKZn0=
X-Gm-Gg: AYBFou1hnHf+INrfxCUDjStWyavADsoQCoWOtMsx2kkWI5zR32zJjHkiVOl8Wg4QEZa
	xFHqZYy2HkKtVFJJMC/SMakyvnrm3tgGhW6kR9LW9DKR9NiHw6CHeUZqOYNv+06q2Lca9KWsKfA
	NHn1d48k4DjKyBMDkfn6RZoVIunGFpb+Lz8A6RQM9kExukdkRurIa4RFkdr1mzCmOyEZvzpwOxV
	QFl2ta+ZtP0Y2+5Ebh1Br4avCrlIbGo7X+m+1S9ZSF/ZEYsVpXla1sQ2PnNym7Xb8DHpXOZwfw2
	7QsvlIbKp3L/qzcfhpGSt2rWMKtVpVHDGggIOep/HUUZ58Dp1L/GpImtpd3HjqWmTOyGofFGZbO
	0HOAtP/H+K1hiHeGPE1BynebUZRY=
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr51785eec.16.1790878174024;
        Thu, 01 Oct 2026 11:09:34 -0700 (PDT)
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr51739eec.16.1790878173117;
        Thu, 01 Oct 2026 11:09:33 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.247.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f308fdsm107784eec.8.2026.10.01.11.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 11:09:32 -0700 (PDT)
Message-ID: <1cd249d8-0a26-45e4-8263-dd4a120fc89e@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 23:39:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
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
Content-Language: en-US
In-Reply-To: <cebrka4ya7u32ntiya42yx4txa3uryf5k2di234zm4enz3a6vy@xhily6qqmevo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA3MiBTYWx0ZWRfX8K04Jj5Fl/t/
 i0KwyYidBCPPo7cGZFgQx+lwkdsHvvPYJImKWlvxutFw6EBGrj5VwC10gtyfS1TieBctoSgzSVy
 KhRfD0SRHBv+t8x2ULNqpJaF7wQKpxk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA3MiBTYWx0ZWRfX83wFrj76fMDW
 WqhlopywmD7pgNImw0WssCgoR3yZB/ZVt5vib5IAf+vapZK3be0cyu+M4XrF9fbqPPK9NkV4bxk
 fO4A9BWBXr19ewmpE8Fa8rtiIhCiZS/X7/scLMEVtqou7is7/prFeb2K/F/Xm9r25oiUApuoZof
 4P5nblBfTdJ9QBZQ3qWFnK01IV/55cyGl+KUS4WJ6auX/gi5N/rEAFf/F1tmAFQAIJ81miPOz3U
 RDFgJs1/QohtJ+CuhaHZ1X/297KyxhPpgaA5e87ctoJzKnD2zQ3iWki2yxN5u466mFhYFodv4r1
 U3iLtye4q2/myUtwTpFRFr/DylsTloRJT+xmBqEUNiTiaL+gpjhN4cv6O2wx+Y2ISh813RH1nfa
 /KzUXcrr4Nq8ICrplKLOBdmG1ZB7NNfRBdPFAg5y00q8dSRiDrbkwvrbjxM1pXTqQCpJxOZkH7Y
 Dg7LKPANMXonY7j+XKQ==
X-Proofpoint-GUID: G_l4gFZ1GOpvUF2tcqSdPIg64AFE6Srt
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abea1df cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=wK/bf7D/7SIwH/zgYCzwZw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7E6vT_6_9trQ-LPmnsAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: G_l4gFZ1GOpvUF2tcqSdPIg64AFE6Srt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010072



On 10/1/2026 3:25 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 01, 2026 at 08:57:52AM +0200, Krzysztof Kozlowski wrote:
>> On 01/10/2026 08:55, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 29, 2026 at 06:42:20PM +0530, Arpit Saini wrote:
>>>> Some boards drive the ILI7807S panel's backlight from an external
>>>> WLED driver whose enable input is wired to a GPIO, typically modeled
>>>> as a fixed regulator (e.g. vreg_wled).
>>>
>>> You describe something else. What's fixed regulator should not matter
>>> here. Which pin is it in ILI7807S?
>>>
>>> It seems you just want to represent GPIO with a regulator. This is just
>>> confusing and typical downstream workaround.
>>
>> What's more, you basically REVERT the review YOU RECEIVED in v1. Really,
>> just sneak the same stuff 3 months after like the review never happened.
>>
>> NAK
> 
> After discussing this offline with Krzysztof. It's not a supply (my
> fault), it's an LCD driver. So, the best way to handle your displaycard
> seems to add a gpio-backlight, reference it from the panel and then in
> the driver check for the backlight's max_brightness level. If it's 1,
> then you have to send extra DCS commands to control PWM. If it's
> higher, use normal backlight class controls.
> 

Hi Dmitry, Krzysztof 

I have a few clarifying questions regarding the proposed approach. Please let me know if I've misunderstood anything.
 
  panel_backlight: backlight {
      compatible = "gpio-backlight";
      gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
      default-on;
  };

1) Adding gpio-backlight and check for max_brightness level if its 1,

   If we model LCD_BKLT_EN using gpio-backlight, the backlight device effectively exposes only on/off control (max_brightness = 1), 
   we can't support the full range of brightness i.e 0 to 16383 (0x3FFF) 

2) Adding gpio-backlight and based upon max_brightness level of 1 , are you suggesting to register another 
   backlight device that can actually drive DCS brightness. In that case we can actually have the MIPI DCS controlled brightness 

   If so, wouldn't that result in two backlight devices associated with the same panel:

    gpio-backlight device for enable/disable
    panel backlight device for DCS brightness control
 
   Is that the expected design?

3) I previously tried modeling LCD_BKLT_EN using pinctrl states (panel_bl_en / panel_bl_suspend) 
   for the enable GPIO itself. However, Dmitry suggested modeling it as a regulator instead:

   Link : https://lore.kernel.org/all/qkhgg5x67sijiialucvzac275zhpjrtt47a4udjpyzmgvilut5@dcrslq3ai7mc/

4) Modeled optional regulator wled-supply: a regulator that only gates the external backlight driver chip's power/enable, 
   with DCS remaining the sole brightness path in this current patch , the panel-himax-hx83121a.c does exactly the same.
   
   Would this can be the preferred modeling for such panels?

Please refer to this Hardware diagram I explained earlier , 
Link : https://lore.kernel.org/all/bade420c-aeb8-4bdd-b0cf-3ade17b21c18@oss.qualcomm.com/


Please let me know your suggestions.

Thanks,
Arpit


   

  


