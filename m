Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D734F352C34
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004461; cv=none; b=su7SU7vZAYiqQ4OpfykIvqL5spLpwcG9Vb7Pmli05f4TxtBJhDOY006uqALCwd5sqi/V/wpaH+8SaxbYwa3ORx0LgOjQKvHwOxfMo8ryvv9Ljmk8STDv3W6rRE9ekckILVYstDrMpm+9zXOY+iqW3T4ihnaaPMoaocJzQGGcbYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004461; c=relaxed/simple;
	bh=IHNui2Edtj7RfSDakzU/n/5qDlIVockIk2fUBsZ73XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uX6xgFHowEXxA+oTD9chbC76cdgcahdxmyOQMU8x7rg03R5FYI6x2y73A7OsnHzmHBpyXOLhxPpyVB6CMK/ql9N6jRJYoSaR3hqitmhrLe5+CcnsxTnI3XeBWZEIQhAN/Gz+8v7CFjU0eu0GdE+obdcER/EOb1CpoRjikB1A6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWkjTE5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PheGodne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWkjTE5a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PheGodne"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb09o905401
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=; b=QWkjTE5apijBfBE6
	nq2/otO/V/2ZLXOJPZ4IhjF77TvAVYeXfGJUTZijKqX1/2YBFj1G2Mwaeg4hRXaH
	oyrwWf8p3v6pXFMhsvyj77wSgTE2O8VB+tyvWIC3ekuA3HUMbUlu7/u3P6hKd+3F
	p7PXrJZc+LrUrH7gKmsP9L+8ZKTVmzSpwGBDBWZvY72qPo5b+6gcN/zQNCvVTLjc
	jaCu7CDfvNPy6WBQpi6MoeLZmnERpP+02zz7TmorU5QZsket1NbHfmbPEQ3/wPB3
	P4R1MgZVWBVuOsBEGzPLwEqvuQIVEVUBHlkO7IrlQoAbU+tLINl9aMQeiGAQ8E/9
	hBRu1w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p35ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:00:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so6202950c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792004450; x=1792609250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=;
        b=PheGodneBM5rfVzJcOCJwtNlKHopuHRyeYt5G7uYRAnfKGS2MQltd1jgJ5eS48IBDp
         0N67IWppscayaSeKjJ/NgpJihlOV3biM/IF1HNCf5Nm2XP2z3ANsvyZz0obyga1OFg4m
         dIh2JfHz9rOnUQTHSFL90lRjs9ChRsP6dKGFr1rVlWmPjtXCUICcJYQixm9/meUGREuT
         vDI/PbSWBxdk6bca3amrOo2lDq3gZqQrO1grZ+torGegiFfh2rI0W1AdnCRHJfWuX607
         AMPV9vtMN6D+mIq/I3lcwjUEQKNUYJuQJ9bTmnIVAn2ctN5GARQZfX3aOgmy91vcFWJF
         x5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792004450; x=1792609250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=;
        b=gCjKgvrv3pXKV9AbOyJJ/1pLuOoEnI5cRjQUDLWOU4jkUM6Gaoe70hYAFLSFn9e4Zs
         U8eIKq8zSYgOknnsPJf/6wjD4jyTyTOXJzUCiTxbHmc+XfJeFaHUGJcN9UHbKyvNybrw
         5s5cP4wVbqnsY0VfJ8CLePHBLsI+L584k1G8oBQVsHWiP9dlFyIpsqZ58im6C7xOKjny
         wIj5UC1u0VBk5u6Buj1V3TrSuE5gK4FglHWKjQF+zIGWdep08MS9x9G1XMEJXfbmjNq8
         iSALx/Ou1HosLSMkdiVivNif9H1lTqhodtAig2P6riMoHLZpnP+3kSCYxkcAgZxbCqUw
         I1mA==
X-Forwarded-Encrypted: i=1; AKwUvBy1zL1DFhRSlgQo0XKzXm51GbZTPyV+ZKLdVnc7b+fga67rjNpcqFqoOyYW4GSpk3QhV88jVrBwY4ez57g=@vger.kernel.org
X-Gm-Message-State: AFq9FYImI3aYDck+rV2AyUWW2wLDV0YID9gosZoaY+7ZFzVkSAFrAl18
	w6zp5MmSdrapD35jM8H9f32tuKPWngZ6KTxexny54m7uWgIGABWlwwjc1DuJUuEEYP8D3qXkSNA
	6zn8onixjJRai2o+wuI2dR9dKVWwyzIlOqNotHPRbREW3a/R5s9gEuWfLRhuU0j83iWk=
X-Gm-Gg: AYBFou23rjAVOe9DlSty+AJepgxjtVwrj/JILPcRnypGzEdXqQgNoS+9CTXxEj7wbWQ
	xtnUkK3rlIZQjzvMJxy0r1FYnLA70S2Het8XGyVvB9DsK2MfO3Gb9Oz/paqNmj3hNKvdmeIb9U8
	mEuV+OXYSoA+GK/Aft9EE9VLDiUHznKjPFdkP1a0SuD/FuuYhjhL2NvWrmw22PtdtMfheJgVWsw
	oMjTYyxxLcNCHB/rIy01bwoemQr8xepsDwVSpgIqd1YvcpuaNIQ5Kc4SzmjRueyCZCXiAhOH6Od
	Ylrq/AsJcQ4FNly1UJY1gfrsPzeIGobeLS/R5WgYkdHJ+NnNALivhjQEb3nJLoLeq5m3SiENzjz
	me9qtEn5YZKX0FhK+ZmrFtylah/eszNmEf04yJ/vgIbQoKKxZ6v93gVrddUNAWM0=
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr21715206c88.47.1792004449303;
        Wed, 14 Oct 2026 12:00:49 -0700 (PDT)
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr21715140c88.47.1792004448426;
        Wed, 14 Oct 2026 12:00:48 -0700 (PDT)
Received: from [10.71.40.138] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm47683131c88.11.2026.10.14.12.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:00:47 -0700 (PDT)
Message-ID: <ff4fac87-380d-410d-942a-a48edce70397@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:00:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split header
 support
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
References: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
 <as9XUbOfJazEQ4y5@lore-desk>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <as9XUbOfJazEQ4y5@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX0lITvqsGSLXz
 ZBo5hcR2zNw6c4TqNBuMNblEeIqjv4uUCk54je/36qWYxyB5FfipCZmDyQXaKhyi6jTRTzT/MaN
 vWem4Yg0m0cOrzH+3FCghkSbs1dHXM4=
X-Proofpoint-ORIG-GUID: 4PUKzELj2O-duZI17eEdO_JQpiLtkIia
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfd162 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=uAmjrx48wFnj9rB13rsA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfXxmiVscVKEIwK
 Cb0oSqjeIVi8rI2AVNrmeIXfZ5gMVZlE7iIeRqlxZvAOguPSOsIbHPcACkqd83V1sLMkkgR8N4O
 hISttlyKRTq284pLbgiN6z1g56CtD8ueKcepiGap/OaaJh4OVu20UYY5roBayWnzTxs4kKYe5GT
 QoSyclUgapLLYegYJxeD1ge9I7UVIY95ZyPqywIXc4Il629EGxrUu1mT0XEkmwGR4yHfQhMvAXc
 0+9TmHkCC338A4jVbXHgnVM9Woh41dppwF72GJOrHFUs3V0o6aWEsZK3vSbAiePxbvM6hCHs1TD
 YTTVF4yEtQw66mNL2i4wXkUtZvUZohKf7bhV953517OZ86NU9AGNvtAeyqoUwHrlDBbiNyA/0Y2
 fWO6ZQwsd6pHDNNwxZzanXUJEWb6ypsr96cgO4bQltbmmPqMfZCz4rlSXLomafY3vGv0rwLTw9g
 0aWaCMYNvgBd/N5K7lw==
X-Proofpoint-GUID: 4PUKzELj2O-duZI17eEdO_JQpiLtkIia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140075


>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> index 6719ac6e395b..65ac5403ec58 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> @@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
>>  
>>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
>>  {
>> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
>> +	u32 rdes3 = le32_to_cpu(p->des3);
>> +
>> +	/* when FD=1 and LD=0, HL is RDES2[9:0] */
>> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
>> +		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
>> +		return;
>> +	}
>> +
>> +	if (rdes3 & XGMAC_RDES3_L34T)
> should we check FD=1 here? Since HL is not defined for the case {FD=0,LD=1},
> right?
>
>>  		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
>> +	else if (rdes3 & XGMAC_RDES3_L2T)
>> +		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
> same here.
>
> Regards,
> Lorenzo
>
Hi Lorenzo,

Thanks for the review. dwxgmac2_get_rx_header_len() is only called from stmmac_rx_buf1_len(),
after the sph_active && len early return, so with split header enabled it only runs on the
first descriptor (FD=1). I don't think an extra FD check is needed, but I can add one if you'd prefer.

Regards,
Sagar

