Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771630;
	b=IxBnABJWuX38VsnxaJv5jKfuzU2uuEUQewIS2MwNbr7dBcOm98thDm9mdzZNRXT7P51Z
	 bnrTUhT8h+Lr8dBljsfgk66se8b9zQE3TL7ZkNPJErnzXtJzP3cLO65/0bZiSEC9nYAmg
	 K5jkjpqpm6UXafKLzz8OVHr5m3sp3SckNKtZM1VPLpeogjn5BUa8KFqkblNWdWOirrwSL
	 0F5X6IR6ftTEk9mknpxXlQWFUggBaUyrezJFUnOPW+CDtCwxZBYpnpiYbn2jjxIxQXLRM
	 gZWvWzitg1ZbAgKlaab6s4aNvrt2LGC8Pi9b6eyr1+i88RwIgiq8pf0K+BpZqGw2JyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/RT/WyKzm7LLtK3pAL7i1tiNS4yPoqapGsrijvnzVW0=;
	b=TCICxBRh4CgXHViLQFdKHPkpNXbrFV9ebYKv22QmM5XYS2lqhcn87u/XKiuuT60+UGhV
	 NguQHhjYgNpUl4QlG8E6rbL22mtvgoW+PuFepfufB3uu0OvnSlauT8wvc26T+Vu5uRU0U
	 t2a+2N8iNohrJBA+PnxvblpF37n0EiEzxSAv1H6FMoKrri+8fwEaILUGc/BZrDhdMQYUR
	 Rj0I2NJNc7O/hi/KbMNF6sjRMYKYtQfygcPubURTfUOHThbeFVu+hmJBwJovNgZt+Q6Mb
	 zS+zE5L7znpl4QvhOVkqzlrJz26ITYwzL6OPLFkfttoEVwmhqNFZ9d7hhIjJxPVmiJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nr/AzaKX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUlNjkby;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6CB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nr/AzaKX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUlNjkby
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6K5I2216026
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RT/WyKzm7LLtK3pAL7i1tiNS4yPoqapGsrijvnzVW0=; b=Nr/AzaKXr2gRCpNP
	y4OEAqJZwrNZusw6nLM0bIbep4EkQkkIk+rrbsT1Hw1MhzdSuzvHil7yNFYxX3Zz
	MW2+X7wk5qjWuDAnYi7wVWdWGYv1nl4/9HTB6v7SXSc4xi/3aKf4dqDk8Q8NeHyR
	Tx3PjrtlmWMUH247iupiaBv9yIN+nXpNRElgqGVdJ/NkGmELKd9LT92hEAZiSfSG
	zD/SvSfjEzfsO6b7S6W0LLyR8653nciVm8Hh4qekiTCE+vLVpIX/dmOim5GADiof
	R620xpKerCgz9SL8/7eeAAeheo6OugsMtFrib0cg1fo7jhLy558CfBMZ1BDmgfNN
	sCFyNA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc804d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:07:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc4149b885so933445137.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792771627; x=1793376427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RT/WyKzm7LLtK3pAL7i1tiNS4yPoqapGsrijvnzVW0=;
        b=ZUlNjkbyGzi7jNjOs3MD7uxc7BbmgcJKJp5izuRY9obFcmYF3NlakLDxAph1rCfmUO
         ghqKVcgQFB+aP8VLlv/gWXIZCVrIxyGLLGHzsxtJ/C4PjWPS+vQNmydfRogbRLZDlICn
         E2+8tcGiCLQZNs4bNwHY10BnlJrMrd1Taj5wMWIH78QaiiBfpmTB6QTF1lReRgrlOvAf
         +7/FWhuxdCDsJwMbbRNzCPi5QfolXlwcSF8O+lXr9uP1smQE+KZBS/NOVL647CS4nZ49
         6uDyCZK33NOHJ7W/7ORSMxu0WKjdVoOmLGZZN46wHUfObjaooWxyiwCdzqxhfYMkI8R/
         lMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771627; x=1793376427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RT/WyKzm7LLtK3pAL7i1tiNS4yPoqapGsrijvnzVW0=;
        b=BU5NXhRmrx6UyeVrljyC72CjUkZntyvf7qGTxKGxHoKDOxoisgivyJTX+YoVw0IwnP
         knw6DeMhorFo33J568BhvXxjwjCCB9kBMwNDJ690gLCD+0E1P6ws8JZJsnxeirtB3lXs
         KidYARFieQwq39Q3L9nrqztbeZgsmur/F5vMb571Dr5Nfof0EAqR3/52RzdSrTGYh0mv
         h0OJUyLZ445WjZRx/gZEs4QLkUf/K5fO/bSJMqxA1blMwYoagaZBDfW+jyWZUAVDc7+M
         bz3dwZkB4VXbB+BXwl4FNDHxJOWGKiOb8F5Vxr0hs+tU0isjIOYaPinisZEULVnEZzf9
         NK+g==
X-Forwarded-Encrypted: i=1; AKwUvBwIdGsZ1rktOqHZeHcR0YL2fswMxJnOSMmTIGjiCRGqxVYKwHh8NRTTQUL5fyAca25gqEMHSG1LlXOigTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIZu+DZLeS6iKKneGV6UVQ4MpojkCZnJwPQyS/LQw4BA947b8l
	Lh4cJuBRqSx+kUI5SbSY8I4lkxUXNOA1299vFquhLF/nHYOAUSUUdUW1ck8v8mHisrrh2lMcBcj
	rPwWR2OXVWQrDbWe46XUNELXc6QqbwxAjNp1lziH54i7KdA1WIZGmVBKZT3IkJNpPOu4=
X-Gm-Gg: AYBFou0qAzbDuzkC9YpznIdac3w/XOP8z2nhTxYuLQODV3/cuZ8A3Mz7KVXGUuva8Wq
	qKWoMPL7900HeWB8bRxL4gtZ9mr018iWA3MrsInSkWQ9b/umRIT4FSQUdOtslkP+dRg7qizOAC3
	xlYVAFz2LAt4RTxnl6uigp7jWl1ByLWhnkqW2g032Dmw6hLeW09cycYdkztn6yjDzmYkaxhJVBs
	stvMH9qZbBoOYSfeIMBoKzMNeq/VlSlQW4IC022CEbvLFMBKM39DXh+3bgukaSyh12BkEyHOgl2
	IuOanffSpOp8qEbLhslOnJgp7KrWVdOdaI37n0OfAnQ4uj+QtlLhbqePWgtig4KQ3ybBLV81x9O
	TMTey6/TSLMRGAf5Z2DIH0d6hda4+W1Y=
X-Received: by 2002:a05:6102:4448:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7ccc2f58653mr1013128137.2.1792771627459;
        Fri, 23 Oct 2026 09:07:07 -0700 (PDT)
X-Received: by 2002:a05:6102:4448:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7ccc2f58653mr1013111137.2.1792771626983;
        Fri, 23 Oct 2026 09:07:06 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a9062d50sm15404525e9.2.2026.10.23.09.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 09:07:05 -0700 (PDT)
Message-ID: <559fdf87-368d-4e31-b754-897353898d7a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 19:07:04 +0300
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
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfXyzrnotyZkwa0
 J1KbdTY1P28P8nF/6uuWrfHb92BUASSqEYb0wMkzM4/Rlq3exGeRv1DLtMwocnjeWzfP3WxetcE
 4XJMlF8K3GCi5XvwI8xuGJx7yCB8zywtsvJCfHn537W/dBLCs2R+XpN7Ptg/hoVqLuNq3RNtahU
 vH0RrLeHS2g09JtzmThtTXhcLXmfRE5+Zua350S+ucYzpLHvaiBfn4uD4PU1qj6DjM6n/9HZypv
 Q5ED7489uc3nne1M0c2Dcdb7pdWPYjnvd+qBNb7yK/bHCPcVWqROUuO5rbZ4N/PZp2r/JRRdZn5
 lb3+jSB5x5YD1xDxq/St9szvrcqAdVCNKVeywVmevhCQKk/SE6PUZcg9eRCgyJIvm8fjtWvxWZr
 2oxrddYnT/0xgoDlmDOD5BFx4GTpnzImEd9ktSIRVGb8CCQlmm2MFSJKsH9cl2D6cVNUw6+kIy5
 4MkpW6nbfnFP+DbsTyg==
X-Proofpoint-GUID: XdD-UrUbeOQwUJrjxHd9ni2E-4IgP93J
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb862c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OtwWDPiBtiHqWltJD10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: XdD-UrUbeOQwUJrjxHd9ni2E-4IgP93J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfX06OdG7Z19Now
 WplUrAEUHxHpF3lg90bCqNjBf5bayqOJ0/TEm/yDGvW2msTYH6VUKOYZ0jFjy58kVpG4Kgt2sHL
 TPC/NU3yjobMR7v87ka7Y3t30VM45yM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230063

On 10/23/2026 6:45 PM, Loic Poulain wrote:
> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
> <atanas.filipov@oss.qualcomm.com> wrote:
>>
>> The VFE fails to power on when the pixel rate exceeds the highest rate
>> listed for any of its clocks. The rate tables of the VFE clocks are
>> independent and need not have the same number of levels, so a clock
>> with a lower top rate than the VFE core clock, such as the SC7280
>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>> still supports.
>>
>> Clamp each clock to its highest listed rate instead, and warn that the
>> pixel rate exceeds it when the clock lists more than one rate. Take the
>> clamp into account when another line powers on an already running VFE,
>> so that a clock running at its highest rate does not reject the
>> request.
> 
> IMO, this function has become a bit messy. We should split the core
> clock selection into a dedicated helper, as it is directly tied to the
> pixel rate. The AXI clock scaling/selection should be handled
> separately, potentially through the interconnect (ICC) framework (when
> available).
> 
> Regards,
> Loic
> 

In any case, I'll split it into at least two parts in the next version.

Regards,
Atanas

>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 2680a9914765..87096095b1eb 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
>>
>>                          camss_add_clock_margin(&min_rate);
>>
>> -                       for (j = 0; j < clock->nfreqs; j++)
>> +                       for (j = 0; j < clock->nfreqs - 1; j++)
>>                                  if (min_rate < clock->freq[j])
>>                                          break;
>>
>> -                       if (j == clock->nfreqs) {
>> -                               dev_err(dev,
>> -                                       "Pixel clock is too high for VFE");
>> -                               return -EINVAL;
>> -                       }
>> +                       if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
>> +                               dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
>> +                                        clock->name);
>>
>>                          /* if sensor pixel clock is not available */
>>                          /* set highest possible VFE clock rate */
>> @@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
>>                  if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
>>                          u64 min_rate = 0;
>>                          unsigned long rate;
>> +                       long max_rate;
>>
>>                          for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
>>                                  u32 tmp;
>> @@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
>>
>>                          camss_add_clock_margin(&min_rate);
>>
>> +                       /* A clock already at its highest rate cannot go higher */
>> +                       max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
>> +                       if (max_rate < 0)
>> +                               return max_rate;
>> +
>> +                       min_rate = min_t(u64, min_rate, max_rate);
>> +
>>                          rate = clk_get_rate(clock->clk);
>>                          if (rate < min_rate)
>>                                  return -EBUSY;
>> --
>> 2.34.1
>>

