Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAD5125AA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 00:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791417982; cv=none; b=KpJZI2VsNfVNpQfizyC5pwlFCnwwIUR/QqU02+qMd5n5gSG89zoxffB9LBifAUZW73n7nfDUu6+vWdx6CxlRI1rLNFpyCNRn+RstT5ZjONisMKp4/yXRLfBAkMJZK9WjWJg3T7PS2WVgbz9LtBsMHk0dQmsDNfofUbA0rjAQ4g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791417982; c=relaxed/simple;
	bh=DrtkP/EDagrCAnx7kdKO3J0H5Jc/7HTMUHnMRinMpkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVpC+s0rHamUmhTF4PcfTiTHFRaOffSumFhWIHf4t61VZvfIqXbryq8hbNCGijg/UCTbtsk5KtFTUnYGLtL37vKGcIWUCVllrAonhgtE0M/HSz/7UrPoKbzsB096F06zvaTIp8lu9+G5VdqNYrLFOSuBbnsoMMgLO+te2F2JLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASlTytu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrucklLg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASlTytu8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrucklLg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697LtZDk976741
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 00:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bU4cMr00O4p75b80sWk4BP8jsdrjwNx6YLTtrRbn8zo=; b=ASlTytu8WlkXf2of
	YgWAqcSCSbV1PuOb7N4hqNfzUMplLfR8y4H/jDnGTu3WzMsSVQaCgPVGpWzVB7aI
	1PIARi5dAyOOQCjHtDqtjFGaAqrhPqgJkVxuD9hqWtT96yyOtgitBBU75/+7U7nW
	cKc/X94VTNBKq1ZD1pNUQoYyXFwwmq5PtqYLGK/J0ghMPGrS71gcNt1bWk/mC/Ru
	QsLcGSwaK+y3LZXifqM8MfhziA6ztf6ESJuCTJoKxV4nyCZ27hDRDfN8acHMkRAE
	TOXKmVjZnEYOGTsqlAUsKQzXF+55H3RKSeXoyGNV93KseSTQqkPxgQAlg985MqWd
	wWaL5Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe38ap6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:06:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so83019c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791417979; x=1792022779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bU4cMr00O4p75b80sWk4BP8jsdrjwNx6YLTtrRbn8zo=;
        b=VrucklLgGgQv+ZVHDCUg+B12B9Mf1pNBQlzYiJpoDXwB2Zkfk2NoK+JF1frAgevMBv
         kRuOEGzp/Ak3Me7rgxXPeqtpQJSMZrzWOLeOu0fmszC2gxLvyB6PdC2CBe2Bmbvn8wl7
         reNW7WLvXAJO0uqA4oS8PBgdqOlHjNrSWZrZJQo3cnN+qIkjnFAZw9iEKYqyOoABkw40
         0pU/GwQCGZMrMlEFRzz6zUnWntvgQ89d9kYm6X+3Vi84WumBkifm+a40oVES0Ogf+nzn
         7/BFBK3I2CxBdaBADCgxZMwWaUK6CCeM5uCOjyAQP2BaAjBUOUm4Q2zdDA2TjuzFkZe8
         zkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791417979; x=1792022779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU4cMr00O4p75b80sWk4BP8jsdrjwNx6YLTtrRbn8zo=;
        b=nmQcgx387986Wi3OQI3cO/gZVZWxW0N9nNmo2B/yuuuOvPFEGg4aGgPviwxABkW/xI
         84e0b6pjkLuG+wfKMoFbA7mYnNJdeGWyGOa5mDld3LNnvoO6XFC9bzkGIHc6LKanb8sM
         PV9oOISE3+Ou6X7Y0T/DsRvY2L1JFkW74KYRj1h79RdOcILVqwtwTIr48VrynTBs2p8u
         rUihiDZ+A5y8lFxT/u7pgNgX7zpUppwfEI+9C4WWAjqoArDr3asGZcA+3+juysyjP8Uv
         eBqFy/IdqQ5fTNxsV9I7V+FTfnQN3iSUbb8Yyqte2TXn1hHneQSQREirKmA7e7TTUWR4
         kzuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjbWdHJ9s4m2W8k3Ukl+IHxbqN4U9agjHWaR6BiEcb5MA0yKMjG1YBK25vxE6GQNmHgtQHi1cyacRwoDs=@vger.kernel.org
X-Gm-Message-State: AFuF++n+abmWsG1Ztt7r6RYxjB5891L4lXOTOmWisSxOc6NJncnJHOyg
	7eUHc481T0Dt73eiVbF/N0cbfWXjGwRq0fdZ/Om0AMdwiPPB07LTMICn1TwGw221EQ2d6rHqrxT
	FAecP09V+aRwgrN8FW60/5Z1YxcsrgyfLBnVWkQYHLxLOEW74yttWEo3nvfv0ig7/Dig=
X-Gm-Gg: AYBFou2pFNTrFkP4yYG60bWoRyvdD/WBivisf2t539qo0MHRsmeCAsCktvQD1kErTEc
	3/J2xQrEs1RYM6mjoR3suFqlSZL32OZZ/01QryFtbxtWrcPzDqpkbCXagpYVN74W+xxRailkypD
	wrjvOIteZbxhCzBUDjtdXvPkW+e79bbjwKRHSVod48GzdiUfosUrrmpzAE+eeVCOoIImTMj5jXd
	6ab9RmTjM4ozy1xsgplAcZILX9d3sOSQu1idfoFx31AfbVZn/hIRSlCk9a7H6o3+2VoWh7gBgMO
	Dn+6qeWWAZnRib7B/LxJ/ZhAS9MfXF8t4OSYPRpQYmoyQKod2Cd+owSCb8lahelcdfxeZfG2XKT
	9dUdc9JhnkrYiUxcTKSeDYWS+YAIslg==
X-Received: by 2002:a05:7022:4381:b0:149:1feb:6da4 with SMTP id a92af1059eb24-16206f07244mr6679668c88.32.1791417978848;
        Wed, 07 Oct 2026 17:06:18 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:149:1feb:6da4 with SMTP id a92af1059eb24-16206f07244mr6679616c88.32.1791417978106;
        Wed, 07 Oct 2026 17:06:18 -0700 (PDT)
Received: from [192.168.1.133] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166216f39sm11898472c88.6.2026.10.07.17.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:06:16 -0700 (PDT)
Message-ID: <0f4b331a-0c5c-41ca-ba8c-d3a4cb89900b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:06:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] usb: dwc3: Clear SUSPHY before issuing core soft
 reset
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
 <20261002000741.450793-2-elson.serrao@oss.qualcomm.com>
 <ar7-H4Q9U3sNou0Q@vbox>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <ar7-H4Q9U3sNou0Q@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac6de7b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XizZcgsUtJyPTJarKMYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX4eaxAiWg19n+
 3b6gwj0YGXquZwh5ZWihNl3HsEIqPhs77YaBgSyO3NtTkRPZEaBF4aNG8buW15TIE4iLpu8wnG1
 G0s/6651jci1/6/0uY8VR/KUyYLs5Hk=
X-Proofpoint-GUID: lcHUrtrsSZMiVOmLvs5BuqRExDENSqKn
X-Proofpoint-ORIG-GUID: lcHUrtrsSZMiVOmLvs5BuqRExDENSqKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX75v3G+xUyyom
 r0ul0oRITL9vmqZh+We/7feNOBIG/AhFNOMi77Ozvd9bu/T40CSRgJLaHLgGFzdt6rxE2aluEDW
 8UCZTVo/Ow8AVn06hGVNSbMugJ5Cru1z1Ne3BUV3Y+td1uwHFuIzBYOWMSEgiYlSjMjZ0JmL/ZR
 43T4o81tRKcjYcezbew4Pk1PYWSb5n4IOFT/o5vng0AqPbd8C3D91+geP+MT6lcOZ8dYdCW1Rry
 YhPh/fvwMPNXMVsjtl1uf++MhfcU6A/roilwG2/av5OTsnFG+1FSdcBPgxNV5gAWQ3mB9PT71ja
 xV/XDhyMsI+8yaTnVUKP5Mthop5IyIbTOd+MRGyobvnLRZyZNJgaGuMIiZTFmjn8Uxb5KyTALUA
 aFeaPYuorxgq/g5YrjY4ohWxLG0H0U7ppuuvB+rYlhly1sGCPDqr1CVZ8cngflX5g5o9iGnQvUS
 yjvF10t6tGA+C069ctA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080000



On 10/1/2026 5:48 PM, Thinh Nguyen wrote:
> On Thu, Oct 01, 2026, Elson Serrao wrote:
>> The controller clears DCTL.CSFTRST only after all required logic has
>> been reset and all PHY clocks are active. If SUSPHY remains set, the PHY
>> may not be fully active during the reset sequence, causing the core soft
>> reset to fail to complete.
>>  
>> Clear SUSPHY before asserting DCTL.CSFTRST to ensure the PHY remains
>> active while the reset is in progress.
>>
>> Fixes: cc5bfc4e16fc ("usb: dwc3: Set SUSPENDENABLE soon after phy init")
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index fd5c2cd36c59..282a853c364e 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -332,6 +332,13 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
>>  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST)
>>  		return 0;
>>  
>> +	/*
>> +	 * The core clears DCTL.CSFTRST only after all necessary logic is
>> +	 * reset and all PHY clocks are active/running. Clear SUSPHY before
>> +	 * issuing the reset so that the PHY is active.
>> +	 */
>> +	dwc3_enable_susphy(dwc, false);
>> +
>>  	reg = dwc3_readl(dwc, DWC3_DCTL);
>>  	reg |= DWC3_DCTL_CSFTRST;
>>  	reg &= ~DWC3_DCTL_RUN_STOP;
>> -- 
>> 2.34.1
>>
> 
> Most platforms require SUSPHY to be set before soft reset. Can you
> handle this via a pre_soft_reset() glue_ops for the affected platform
> instead?
> 
Hi Thinh,
 
Thank you for the feedback and suggestion. I will explore that
approach further and evaluate whether a pre_soft_reset() glue_ops
hook can be used.
 
One point I'm still trying to understand is that the programming guide
states that DCTL.CSFTRST is cleared only after all PHY clocks are
active/running. Based on that description, suspending the PHY during
the core soft reset sequence seems somewhat counterintuitive, as reset
completion appears to depend on an active PHY clock.
 
Am I missing something in how SUSPHY is expected to interact with the
PHY clocking requirements during core soft reset?
 
Thanks,
Elson

