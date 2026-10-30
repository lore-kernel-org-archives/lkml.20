Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380546;
	b=y/fgeL0DCu6En+hYncGqNvj3KfmpDwT7tEJxJb3mWFQsal5FL+ch5rEJi/AkHROnbbFc
	 KOOkO3dpLmW6Wlud5q1wY26ZHJ4nLs7U8JizM476HjX+T5BJI5Suc4C24xLU1KsFOA8l1
	 VlqEbxCoKEfwGsWcK4jHRsOEebL4ZrGZWt3W9lV9ZXIk1Vta/4VtjgdleZhgLZ4S9E2gA
	 weFJoRMsacLw64Ul5jyc8Kr+ROBkdR+6GIzSvOkvvoeaSDA1qvmgEaPWFiSacCDLgksY4
	 emOvkcBDShbal0aX+4UnBmL9q1v/yjIwwyqNHEYMxp4Oai+h/7lXDywGeies2GjhBdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
	b=GAHMBjI5EYy7MQDsmb2Tns3koguOZ33ixTqOYP3BQBKIp74+NsBu8/a7R6BicgnkVAWG
	 0TYbVFbfUg21Gp7ufsJDZFbvMBIg96DdHnDDcNRL2V0CzquPzTGE+jYOxOjClrxGt9Ung
	 dyo0cz3G+R7zZk4H+gcecAvq9mAiObIN2FTWgpwkI24pyGUh4WpEJ4+Ic7BJBFV6wfo18
	 GdufpaYvKNUF2dyr55aWBEFc7t8CmZEdDo0qU13C1Hbd4QC9l1d6g3otPmdpO1S4wAv3F
	 E9G9Fk8yLb5mldDh3tWN7+pRZ//wdk+9Sq/IavA2eesx+zjSBYsVdkQ71KqxQaUnpbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok7kjFAE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0021606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0021606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok7kjFAE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERTA14142004
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=; b=gOg5RBwV3PekfPEO
	+oPNR0MVxk61KNp0EZqXCjntTL7j4cVnSVzh7z3b9qxaJWwQ/YhTjpy4PWVFXxsk
	8ofXm9Ev2QDaCKCRJ25ySsUt6Ld7Y0MZnUaM/dpFcTXfVq/ktbtB2SNXbFtEgZVL
	G0phIgX+21A2uq2glFvBM/JAXw6P7FZLJtzmdHRCtGVpORuCcknmE4OgOw5JtLcr
	FHYGSxMHu2ENa9koFK3nCZACjRCEwathVg+HlRelK3XOjRG5GqEGdT3+dya6XfnS
	hWRi+3hpz9x/oRkNoA2lis9X0ApSlHymkCPdxOPcquezvNHjijLBzKBg/lRtPUGM
	fygoGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qv4er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:15:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1156351eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380543; x=1793985343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=Ok7kjFAE/wMO26XgBDa8NLGudqIFB0d9pWAV3FNdTnipgS6t4j8XPRPPtwhrX+eao7
         yyneli2iiFW8FSBteIJLYXVkC4r8S05aaRuQGMsWb/y9HiMC1SXoJUW2cqQDQgGiyNg7
         fOtvGbAtRZFRkckMZUv54GhG/DbnjmM6QLYDnwlzKTQQ4hWwzOgGH0k8/hYLts7RHmrV
         b32d34GyTX6+psIY/+zvSEIZbw5s9gFUP/GiehpmhNj70EMTOnbcfQtSieMS/oUhgH+3
         oWtEB7dqIEn5wX4J9y/EgmCmNlWgwcNS0/x/mxgJJf9EDdn238m/ep77upDv2W8eUmsh
         ppaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380543; x=1793985343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=k8M2JkZbn8UfpqmNkENzpWrfvqtMLdqW1WTh+S0S2vkWJorg+UoRPMd0QNLuETJokN
         4BnAy6wLc2le5/BZqVh1z5y/Qq1krW4BVjgigCqTvwEg4T2G/1V9i4YMzSqtRcqqnx0m
         OL0j1JPKYudiTTQ/zHRrAGp9KRSeFjrZkhIYJm+B/PW2nes/Hxtl3bPRV6GFt1Eiq0md
         RUVrmxTGj26oUekLvKTZOzPIzJqUTjvhXZMKpoLAh0bPPdX5TWJhO4FiImpyOkzP5mrQ
         Ps+ZYoUlpAghod/wuSFJsY3Wn+iCmATGvUHPYkX6N2sWx0a6f0HvWv3p+cWO9oBRvln0
         Xvdw==
X-Forwarded-Encrypted: i=1; AKwUvBzIo7vZ9I977gkyL4x1Bbn0bT2CB2rRchNuk/CjQS+SkL7tPjqMurwwOq8/JvSnv3RA8bCZyfjRuUwkh5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWNzf6lWLVrSu8cQpiRHEajE/1Q1ddMM7aPRwzfqKCslpy2z28
	oI0smpYUbcDiLPjLstfB75wVHwfah/Zw9MOJCeMeei8kl5poduLn42cHEoC/1IKjE0bqFyKRi2P
	e95vTpSaaRM0UchQTBWl0816Hq/Y7/2VR1leyUFBztZRwjh6DRf9Fls7TSaT9SMaPIoc=
X-Gm-Gg: AYBFou3PasFzEijoJo+2ZUQsrC020ItUOb/SIyf1vt+qppxZMBk+G6mncBeEiItdYFq
	fflx2fLXUjxAbsTl772j1jhZc9XYHr6KRJGIQWs81HyBZHw2o99ULmKetZ66X+4qcUa26Rh/DK4
	DtgdgwHO8ob6yUqVBbqTf0wVV22ygSWq7P88w28LZwhU/w6xASVlmErRXob7y9dRmA1qVYFQDUk
	X+S24yhFhqJ2mOmhUrr05LYRRuu++JkpSVnmMB0MsgQs1zDFHS6qdQdVNsti+9zJDBWSSRSI9oR
	hCNQQTeUR45+8XvdFYzt+ViG0l4bEuxMLHgjffmUhH5CtW5LJ9T/LZonDvDyOibPz1vA4DcNw4b
	YU+z9b0tJdK+gdj17MjhGov77a3E0IkFtifr0jo6mcIuufw8Pq64mqdoU94SexulGkf3ZkMqjcM
	UNEAAkxOlGMC/zCcS4iYqsSeQBZAsyV1eZFG+qiCie0qt4f3qoJbbFzAPE1v1LQnK0
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833691eec.16.1793380543179;
        Fri, 30 Oct 2026 10:15:43 -0700 (PDT)
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833632eec.16.1793380542666;
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Received: from [10.50.42.16] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8607711eec.18.2026.10.30.10.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Message-ID: <ba4afee7-5c3b-43fe-9703-9cd42e0fadca@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:45:31 +0530
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
Subject: Re: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
        Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LY-Ts63zkEJWJZTynKOKeZNHRL5V0F99
X-Proofpoint-ORIG-GUID: LY-Ts63zkEJWJZTynKOKeZNHRL5V0F99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX71w8+yU4FuaG
 yugBiCbXAj83f79dCXk6own9bbekJqcWH5WFpv0dd5MgWDQRXcD4qTXrE7EH8smz5sb/ySrwl3Q
 Vr1PyXDFUMs97JRXQnYVhY8qu8aeZbUpGh3KL7TZO8fAkiUsAcbWyP5sYUTzjJojVjw3FTJtReh
 34CRtpuQZFoBUTJkdfD5cXK19pZPQcntd6GcTuhP+SP4W1MXoQ+HbdGc2gGj91opzZ8jDYfazye
 tsFMyP+4dQ9jXNxs5hMdffOYOK53epQmXUst8hA8jnnlEzTUY9oSWKkdi9I6hgDbOnp/yWUxtpS
 RJlXBH9iAC9Y3Uzy3EU1J46svy1m/BGxCPi+TMtqR3wYjvbD26m+VA9v794wLw7/klcX7d2Zkw1
 0nmN560UyOb7wOn29no7eTodAjz/FQb1VhsJTRnGdGj6YpEWemX75Vz8guEyahlRM403cATBWl1
 i3OaHpnVOMvNBZ77G7g==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4d0c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=-Elna7LzL5zmvItKdG0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX+KwitCmptcgd
 TZzNAc4ZWCqD0EoPD+2eoKNYf6ztj6WZt4iuM6mlMAFcFJ5gKDkfYJEGxICWAg33XoQihBFvx8V
 VKKikhhF6Vlp9RCsCtX18UYsD3xRJVo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

Hi Yin,


Reviewed by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


On 10/28/2026 5:15 PM, Yin Li wrote:
> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
> is defined as 16, so the check should use >= to reject index 16 and
> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..347a5a6d6a1d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>   
>   	lockdep_assert_held(&mpam_list_lock);
>   
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>   		return -EINVAL;
>   
>   	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
> 
Best Regards,
Srivathsa

