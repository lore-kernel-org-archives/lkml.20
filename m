Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777386;
	b=hvF9pxmIyMz22KL16sBDVG2xjiAlT0VpAsJqFLF3XGz5Y5XhrG6GPDzipNzOy+dRRyjF
	 nReTujFndlIv6YYU5el516s5/mraHG+Fl70L5/9nRGK20BEuEuMpN4BF+9p+xplolZBrv
	 26ZXGyu61BHV2htyc9S82YW8LA1l9/3E6d295a+CYcXFkgvTQ/hMKGy6uyR7APpjp10e4
	 xN9tjQdGhhzHSBUkC2/4/FxrMOGzF+/OQNPSMOSJhPiUalGLD0QAo8Ujj60xn34DhGjt5
	 BXq8Uxs2ILwkMzW1iwrkZiAIIkoRfsbCHnciuJ28b9LNngAaP1pDjcKPVD5A0KeCjbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iRO4CLOqPr9uH1kpPT2qDteaQ0RfuYPf8MimE0o7IGg=;
	b=j9SuhXRkK+lMCyLqpSgGTHnFKjn4/N4NaBQGRKXIo5MSlvjpXmuk7yPrUHoFN5qURwWf
	 3izdzQnHbZGGpuqkF8/44cA3E+dap1U9daKks46DQDuxJpSOOZURSpSvm0a96H0tS15bk
	 0c0yKLKmd1DQajcQdV/8EeHKgvPpTsVsHwPpBQ/bVa6tz1HPsx41SfcpAvJREfWkBJ67Z
	 mP16nl+FrJEPx5wjX8dBefQ8dkFKgAWvhgL3J4W+qB50zbB+XIQDCCe3ixPCiv0Chgrgy
	 ceW3SUvDq9AWFtq2ZhLf+MckGBXnELoJYVrzZ+gX1AWj95ClOe77rzNUF6i0rCAiqKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUyNB7La;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9Yhasrh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2AD606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUyNB7La;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9Yhasrh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46tKJh3335342
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 07:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iRO4CLOqPr9uH1kpPT2qDteaQ0RfuYPf8MimE0o7IGg=; b=fUyNB7LaXHHn++Zq
	OXO05Aa+1jRNb/72u+kvt1YTzZTy/0A81MpmdCO6r4gP9C315M8TYoUpSEtTI/Gd
	mOd0jJDQD0RfpAlhdwayQBG4bTrnxoF4m6/3t0BiOrinj2+dA7kWvONTa8kL6ekH
	Ma6wIcfVdhOiBnaB5ArSUiGJ6GyhDwUXCjbB11G3fRdmdGz+zt8Q7jvZgJJIopUa
	6Lj8Be3GTIotUQT9GspOkj76cy2MseRr1rOsx93aLqqZUgUZz8boMKx0xwTfwiGY
	cSXg3c8AwZ6YXsGWCoNKiURC/C1tbCiEj4JcRxdUzvzLdGOzpP0pNXKDhMX1iPxf
	w72Smw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbtse4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:29:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5476f5bd009so1243661cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793777383; x=1794382183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRO4CLOqPr9uH1kpPT2qDteaQ0RfuYPf8MimE0o7IGg=;
        b=h9YhasrhFIZARQBS2sErF5o7T6LC8AHyMjKWqE1cfyU4qdQzuN55E87DvDzbC2ECGI
         u0u/6P3hrGoM+88Ss8wBssreB6RmhvCU/AgdYWjh6bZ7d1844Eo+PtX8o86MGTsTuMv6
         +OFX0lF81m906WOzRRZifgP9t0tdO8xn88E9J4rv+rpcmOQuPbv4A4nQtW8407j1gnqv
         VCWo98TgyHOVBufLfFDHGovm8JRcJVpJP6ps1HJmSFutHIZTXVDD+Zu9peWAD5UolfO8
         R650/BLEI8PsKFyT0xohpZsjHiVmIsP5XxRac3mcxa6Pnb3sGJGb/RlgvoDnCBlWU9rn
         p7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777383; x=1794382183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRO4CLOqPr9uH1kpPT2qDteaQ0RfuYPf8MimE0o7IGg=;
        b=zkcJ5El1RpXcmjRdRx9odaBma3X2c46GLl/Ano7p7ajzPgTqtMUwHsGxGCq51HyexA
         Ya87fnN+AeC/ozYhXpOR4uFAEU6u5jnRZyKaGv5vm2fJXm/mMYfKApydZc7zErlmQvvB
         gz5D3iDf2leiUXwbrok8gh3dHitGGkLFrUpN0GYRAvUP5Fk9+fITjH21muMET4hORdR8
         yQCiXntW4Opg41jd6Krxjr2InsbcZu7+dLy+q1SfLbkPJgyYMXlAfqqLpRoYp1kp2fOD
         gxtsd6E5Tyo78du5Mm0CHdfestAxpRdYKyPsO78sDweW1olPA7k+N8ugltCPOLUteuqv
         UauA==
X-Forwarded-Encrypted: i=1; AKwUvBwfNab/tw/GVwE5VbF0Zzj1h8tPSJqLWScqomNdxMmQvpLaZVnCeMkj4t+qXNRVOE53LdZ1aWdZatlAsqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EK1ju/1eJs1C4QAOeeqflkn1/nBKewJSPLH0l76t/5Oi0MVEy
	onaOIIQVoXcuOgnalNZMnWTefplQifSAh4cYIhq7bHAHXMUnjCBlL4INHBwDbQdV7X1F6nRI56r
	7Q+xuxb5/JlG1s2THPUjXlGge95ya9CSFRHwGW61yvCkvq0+7ytQn9RLi6HvvBEENmH0=
X-Gm-Gg: AYBFou1obtt9scHZOIPoLxnptZ/QGXS6CeTnNSfrYMU5f5D21kFlM3Yvvjh7xKlq+xd
	y6z0Y4/hpc2qP+9Aj6t74MgVg1l3RYumkYGPjqYZqYaZQcXe52g4tephIsJggdQNrXru7p6LCDA
	3NWJbti1J0Qn3ytqO7idClfus8f9+7r83WW34wbkkLguQxJn7y0k3SCbPE52h1CZLGhXG45x+mA
	GKS+J9IP/ITVIosLNUCnSH8WsFDgC3m02UDBzgsVamLeS9z1WVCSl2RcKPa0IGgnDWXmQGCnSej
	18yXTWwojSkozha6SIsTgzJGZqbrme5p88lmDqV7x8BkaMBJKGPz7IJC42Dwv7raWcjPQCDDzIZ
	TbOTew8IplX5KkzmRyesS6qc9K5EQssZWHBk/H6FyFlsTP0seX4/2Dj6FUgYKOLfq8HOX
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr2474380885a.6.1793777382980;
        Tue, 03 Nov 2026 23:29:42 -0800 (PST)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr2474379085a.6.1793777382531;
        Tue, 03 Nov 2026 23:29:42 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48b3b7sm40379466b.66.2026.11.03.23.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:29:41 -0800 (PST)
Message-ID: <a56ef682-c28b-42f4-b23e-25bf7d7879c2@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 08:29:40 +0100
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
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
 <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
 <179189473286.2132802.7434637844183959510.b4-reply@b4>
 <d4c11aa2-637f-4936-91d5-81b9d00aff0f@oss.qualcomm.com>
 <179377342626.494575.14471451763190105361.b4-reply@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179377342626.494575.14471451763190105361.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: isP845pX3IevRTzFC6n50ysnsVAA6j7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOSBTYWx0ZWRfX/HkuGW+7Smto
 j7/Tmj+7+Jr0iTz6nv6Hdgwm4ie6ky14Fb544kl0uWzzy6pnpGOZixXaI6xUfxkjLGhJxAuf4IF
 bFlhn9MTQatlYbZEWBx13qSgkrn/Ed/5vnM8DDPsiHZSgbJUDMcqUZVCmGn9ce/48mIFV6goDm4
 v8wpjHj1CWRN7MN9LjQCY44ysKdRoffexpDZbRHUQsClUkEv8yWdtWVU17ciPQ7q51gEoZU3knw
 QFyVgR0F4djckBiE5/kJ/bpvd4Bh1MsSbAK+p/TJUjiH8BDiUFC3AwxBJWJliGZvOMYuhw9ovDm
 yhbtuZa/TDvKYlY+FPEV6LR9XOMwv9v9+Pcn+RbJ5K5fvIXIAqehkRjrtnVZr0hWCEhvUGEI891
 c7V/ovx0b+SUVikbpdtC94gBMdZLeEhYh4l4vSiB2/w+sG5qgbOPUglcSLfnDxvsMBazeGm62S0
 u7jqUG1oOKfPK8gkpJg==
X-Proofpoint-ORIG-GUID: isP845pX3IevRTzFC6n50ysnsVAA6j7x
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeadee7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bXuMI6HEHXQEcPHf8MwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOSBTYWx0ZWRfX4DWsOD00KQh6
 4UufExNrGDZY3+k7DF9CBhBqJ+Uo+diejTmopnZx7hZyqlTedFcuQt+5AZZiSDM475K07BQQ9vD
 8ngiNeCciAnorsyua69vgffxccuUMkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040029

On 11/4/26 7:23 AM, Sivansh Gupta wrote:
> On 2026-11-02 16:56 +0100, Konrad Dybcio wrote:
>> On 10/13/26 2:32 PM, Sivansh Gupta wrote:
>>> On 2026-09-30 11:55 +0200, Konrad Dybcio wrote:
>>>> On 9/28/26 7:29 AM, Sivansh Gupta wrote:
>>>>> Mailbox hardware registers are 64 bit wide, but the interrupt handler
>>>>> currently reads only 32 bits with readl() at offset 0x4 (upper 32
>>>>> bits). This returns an incorrect value, while reading using readq()
>>>>> returns the expected value.
>>>>>
>>>>> Use readq() to access the 64 bit register and pass the expected value
>>>>> to the mailbox client.
>>>>>
>>>>> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
>>>>> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
>>>>> ---
>>>>> v3:
>>>>> - Removed references to an out of tree driver to focus on the incorrect
>>>>>   value returned by readl()
>>>>>   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
>>>>>
>>>>> v2:
>>>>> - Expanded the commit message to explain why this change is required.
>>>>>
>>>>>  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
>>>>> index 862e45e8fbd5..0b584d9aad6c 100644
>>>>> --- a/drivers/mailbox/qcom-cpucp-mbox.c
>>>>> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
>>>>> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>>>>>  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>>>>>  
>>>>>  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
>>>>> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
>>>>
>>>> This still retains the writel() later on
>>>
>>> This is intentional, currently the existing mbox client(s) assume 32 bits
>>> writes instead of 64 bits, changing to 64 bits here would require all
>>> mbox clients to be updated to send 64 bits.
>>> Currently there is only 1 upstream client (arm_scmi).
>>>
>>>>> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
>>>>
>>>> This will alter the indices of the mailbox channels, but it's ""fine""
>>>> because it's always zero for the existing platforms..
>>>>
>>>> Konrad
>>>
>>> I am unsure what you mean here. The channel registers are spaced 8 bytes
>>> apart. In the old code, we used to read each channel's upper 32 bits
>>> (channel base + 4 bytes), in the new code we will be reading the entire
>>> 8 bytes.
>>> If this is not what you meant, please let me know!
>>
>> You're right, please remove the leftover define
> 
> Hey, APSS_CPUCP_MBOX_CMD_OFF is intentionally used in 
> qcom_cpucp_mbox_send_data  as it is still using writel instead of writeq, 
> as we discussed.
> 
> Also, I have since learned that this patch has already been picked up!
> 
> Cheers, Sivansh

Ok, all is well that ends well

Konrad
