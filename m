Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770611;
	b=ox5nMm+3mWbme4Z/JEvRsqf1hRoSydXjtVwRqDk66WUhqM04y7vY7LK041HITht1VpCH
	 /uY7KWatcLAEr/t8ICrt4OHG9t/10yBK7dNU7NMJj4NM9zSzY7QMXbzqaN2SYMT8MnOYd
	 yfUmcU9CP5HMooJ906vMvq5EXMH0STyea+WV24+0ZKBSKPiGqeu0+fzOuLY7vPaI0Ocis
	 mNiSGXtrCRfYAwlOHLrxQqJnNTLAIeNjQsCibs1hySO1wj3flGU+fHFPdaJ8S1VUzoQF+
	 0pgpfa55F0/VB9eOUQhifKGgm0w5psj+xFLRKgc+pyJQgcJGSuBgT6HJJBrJNSwFeSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wEib0Y+2kLPgm132I+m147pUgMUJUup0SEsYYd+28aE=;
	b=Qazwmef/C0y0XIAabzoMx1dJoLudSgwXvDRAye4MeyjWmnXRrD8htoE8Uxo+mBmhuNVk
	 cs4KjAtRfcdPrfAsBpq7ZN9RYreTV0jjrlQV0pfqSwFbGBiGNVOSLBxaQiG5CIEPGfKaI
	 eLbFkk26Q1BUCFfxSXqX7krzJDSgUR+7IOMRBqclbQfQNw5rWi0MXH1cmUFpdnsafp6Q1
	 XV+WkNi83ZGw8y4Jc+vCVEDDshOKT6qnRLLm0B1WHDTJ/Wq/3A2wKJ1WidOTIvXR8hVjJ
	 1aOlBwpQlrrqgjTzwQylJUlwoTxRmryN9bj7aY82rWFwH5FxzPeiC25PM5PAb+OCT9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Axl4eJlq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q07VQv0c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36FF606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Axl4eJlq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q07VQv0c
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5xgm2109280
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEib0Y+2kLPgm132I+m147pUgMUJUup0SEsYYd+28aE=; b=Axl4eJlq4JmSV5Nh
	CWrFPLRELRd6FKrOU8CB0vBf//x0NAAfqKdY7UOe5IsU05hpJoe5OUPfa+ElbHhN
	NX2roGFzbJW69/EXKrcC1ziyGe2HjwnuC7lC6Nda6Zdxl0ByFBQ9O2Abbdorly63
	x5tla0+7ch+rdPiHbOAiR1kBBUZDTxcV6hzXid3+mi3xkGd1IFdy6lxKsBO33WTH
	qrRrb82WHpfiLq/VBib2W0GMikNBFeLASYu5h3INpkDxXcUsdgnjIK7vGb9K62Ch
	SgfPaUBEIDPq3XsSOPW+pNUeSTzw5B/3u64yWHKf6B+A/hGCrfCnaR75qdMi2Mb+
	QKa51w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4cqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:50:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so232340585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792770609; x=1793375409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEib0Y+2kLPgm132I+m147pUgMUJUup0SEsYYd+28aE=;
        b=Q07VQv0cTapG/dgACF9PdvjifXu6+9F7StzPY27pgXMNkAV69hjYu0j30ppeYXcpIC
         Xpo1anvxntZgPVdfGhukC4727fxD2cLq5V7qf9JrQ8GkbnUrFmexHu9SPcGMf6vR0H1j
         EFrAuW+C5NndseWcvO70Xpw5sbcl/Ihv+HldksV0ha7Juw9hpryWdNmKImtZRA/IrJLy
         BzmXMkq9Iyl+/47Y6EBvxPCrbIOxj1QXCijzR2BOiR6HzbCtDUQPIOQjxynZvHBVMHHp
         PWCmGyclU+yqXgTWtcwXXCuG3nI943pUR9XHC9sBrIG3iiVwUnb6QhNFtr/TqlVspt+R
         +ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770609; x=1793375409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEib0Y+2kLPgm132I+m147pUgMUJUup0SEsYYd+28aE=;
        b=IMwBlQibIoCuM4HHWFZjXTJQEDqB4Iy4AnoOtwOJ+a4MuRAC7llv1f0gTfJDUWgxvY
         Xiksn4ak8gvaGWyIa9unj539JwKd9sVEGClBUkSW2UNe6lvtM4zMw6/OsvhwZxXVbCYO
         cBAH9Gazw6Z3iXLQdB14pNq1Unx6rDITig5DyscxpR2aTawrhrx+1vTOj9Z3CBxzucdJ
         VOCnH0kNXeH6Mxqg0SGr5iv8LQafczxdRnNKxS8JKIqGnau0szctK47SAnUQBmalIfjS
         YZcuEBFWJC/l9HXu4eBZMTGP1qeQYWxYa7IT9QZEYmaLxKAB5mCmrVEoREY8/ju9Exk1
         XB/A==
X-Forwarded-Encrypted: i=1; AKwUvBz7EkKf7sHeASOPe0vh2UuxHjW76wPt2tLMKPMzdfO6iILkTgr29fweQbD0PSmj4UGAIn2aQ5r4JOjLbfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy9SqLecmnyMVEPWaGQWsjlF3ojDxCj5KDRd+q/RVXI9nhrrNW
	VrOt2Z606zEBty+uZeHYXW56kHH7hZpjTPsticOm0aaUhDD25ZE7jsjhHbrTCi7B9mUFXwsgr+a
	laaKypfa3YNjXF9VqUK0yjafkOfhYdW9tyOhXGLQBN1l4hx6BKzpUUfowcW0lr3H4Y5RIYA6F4R
	+muA==
X-Gm-Gg: AYBFou0Xa7m24M8g1jsKF/0Zo4YOdB8hbqP8VFY4BZp3AKP0PNlNhj9dNERgNTys0Kr
	B7wLJaDGcRtN2whTerKLj+g0ncJrH03YE7S5UGVGU9R5K6p6LknhDfeX2JyprU6/AOT5uAnokOk
	Ff6MyuMT+xdSbkVyd9r519hlC2GRNcrvR11TFFbZ6layqTlqwMJCmHVO+WTqTQpBSFQQo6MGwhd
	bxBihTHTU0f6y+/VZVdexIXpKE4Om25JkfsZSqw9kfxSht4OUN+4qh+4JSXIH5tSC8rSTweSCbx
	ZaLZCe5zIlDMt9ODKnsC/bEgDXEYL16GEAFkbIswV8Mlurl0D/tAL/l1J4PvAWqE+dfUK6mA9Hk
	iuhN6dzIBgJQBCh/SsfjTI4FgIL9aZus=
X-Received: by 2002:a05:620a:2b87:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93f6f819647mr452036185a.59.1792770608800;
        Fri, 23 Oct 2026 08:50:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2b87:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93f6f819647mr452031885a.59.1792770608256;
        Fri, 23 Oct 2026 08:50:08 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d417e6dsm532407f8f.44.2026.10.23.08.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:50:06 -0700 (PDT)
Message-ID: <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:50:04 +0300
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MiBTYWx0ZWRfX9SW+tUKiUDyg
 0glzlsSlxXcQjKid2q8Gb0JBe2YA8n02j3Cc5UZZm1C6NyUFDCxNI19J+Kw8JBr2RdlBeeu+DaC
 MbCxngkaUMZ37SrxhvSjBbr3EPulcun+C2Keemuj1JeK1N1se5Pt9sKgZZ4Q3+ePIlgm8S8c/Oe
 towyhRR6SyDWEO9WnhaHCJ9U0He2ewPB/b5mQRgvkHwcLiMIgN774z7QwE05z2vULIkTxyLST3R
 9/PDZpWB8P+cSOuyxfGWEXkUgQ7J0i6op8c2nnJZx1BNYQomtKS+We1b4mWRb79WL/evFdsaqiF
 EDa/h6yEeSN53WKoIixpzmYsuX0Tjs7UoKNn+yp/dwDs9BJPT3mQCRJlcCKnQ3U/uX8hd1ZxnZl
 om8gOOBkElyGDzU4wu73PMGwXHSKv7nQY0bBJJCFVJPDEPOyV+NaXDFsPAjVh4QXovJ36ynh5YB
 rbZ2AYRgQ8Gg+TBihMQ==
X-Proofpoint-GUID: 5LqQhllEremir_m431MmHaCaZdF2GaIj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MiBTYWx0ZWRfXybV+wtG/D4yL
 mSJkYfDEbh+FWaIQis+ASuh/SpskmhLNgP/W2z5BAJV0pR/Agc2PnZGCJddU+0QzJb25aitANN0
 B+CK4WAdIqvt/zsMseirc6eCoRWGrCI=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb8232 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OtwWDPiBtiHqWltJD10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5LqQhllEremir_m431MmHaCaZdF2GaIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230062

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

I completely agree. I just don't want to mix the two issues, as 
requested by the reviewers. IMO, if we can reach an agreement on the ICC 
migration, that would be great.

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

