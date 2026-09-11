Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13D34CFCF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136235; cv=none; b=uV0iGc/Tls+OvY46P6HTa8CE21nWKkmPJTCEKpV2pirw8haMEQX3k/39exgKfbBJq+a6b19SNtXg5rcmCWJ14vXObAdqirIsmm36G59YdZjBHchRcMyu6PiLkh4ckkb1DyO63Ad3CBdk6ajrCVKxAKj8GgHw1wXE0iwnEeCkvh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136235; c=relaxed/simple;
	bh=PdUThxGT2s2FT2q3FWPuvhvZa7Myac50FYCC25nfC88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHfQ08appMuJuTK93wJZwYlLFKhMgtkQLvUtTehXaycRcXKaOfO/wEaeg6mCt0PvACgePo2XsuTf4wHrQZbgBfg62vQWtOmBU8sgW77qMu0DPEb/j757wZfbENirBnXPg31zFvrw5YucUsWGIRGmeIG+GfTxXzH6AkR21diNALk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4RLqJvh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLMCZval; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4RLqJvh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLMCZval"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiUCA3686796
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=; b=j4RLqJvhcX4IcxuG
	WjvrwDfZ6upeNkpQuwG8cKwYk2XajN3wrIKcCmidK9S8QMvH5boSOSwwOFB2Bd7P
	wNDLKeipmBqut4PVzoFhOlgyxemzrrLjSgS6w0axvwAn1f3iNmgaGN02byFKKSlu
	NubByTBDPe51KzoNx7HI6kFyIvEKiO0vcLzYcdA0fZzKELlIXTJLXyrVKvkqOiBl
	cEl0lB0HJAm2U7CG8aA9VgceyBSSX1rNyX+JRdrxw43EOg6662i7lZKZZYlFfH3z
	SwXqR8dxT9O52tCahYfTQ+VxoNa+RaNG4lhvYit6+gsTTJrW0pu5PG+Lu6TlCHVX
	TcBVjg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbh2ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:17:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so1657509241.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136232; x=1789741032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=;
        b=NLMCZval7R24+wRks5lF7On9DRdTY6HSmlzxMNB/qXq7NXCrkE9uznx6RGTmR4RrOI
         QRJ2Zrw/rsuC/JVnWnbNzz9/Fhmtg/1K5053EsTYqWpkc4LCfRL2xBDFo+xTiLEWHGqi
         Un/IGZzasAZ/BwAc5pmI9QNyh57DQgPZ1gdyUcFE6cNA31JUU+p+lycRf02OVxb1jgX0
         6oikuDzzwVyQb1QkTbqJjbyHgXPsKguvvXpWAqxQ/9ekMD/MCVIdTPFjBh3KfamY3Lvt
         Fy5Tu0eLZifdF3pNKvBHubh/Xl6cSoIWBLwjOdgWOPsU7xhdVyCQ2kEuh/RDxqCRQKoX
         Z4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136232; x=1789741032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=;
        b=WHxTmZlZ+bYqV9X1c/cW9yTBKw7tMvkvcTM5oiGjskwQTtnTPLH3pMAVgh5uafKPmz
         weKAPh/AsKvhuK57YYzpfZYAe9z4eqqEkAuzT60tp39ZlCuTaOXurP/EuUMwkgyvmeSm
         TDLf66Mk4DMcrEP0UreQWHhQ4KP3jgSwsRTNcah1HR7IaJr0JvxO4ZyE8WqJuLlEm9lQ
         w431P46IVg+OawZln4txCEj+hqqB/WjHl2fsKTmEOR/beXavvCy9e/ahZ365oQxqazFf
         DrbDRD8bBKjzkAywi01kVzAYqj+9m0Zcbm54WiBXZPOIGVrcliQ1rFx0VFw0gGsE+JXl
         y3BQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLgMCqDxVi6zWwqLvaNommfx9Lj372m1QinTh5mMWY6+rZXKnv64x3CTd/pv9Q0xQSO+L/aCcDBUwg5H8=@vger.kernel.org
X-Gm-Message-State: AFuF++nqJBAuo7+A/RVUltJBSOF8ialqwlKwM+rkJAr6BMIFLUrIbtUV
	D0TaGxYspRkcmhebztgOxjdbdqrf2l/vdcYrhqqOQMNSiqTHj/eOcB28wOypH5NoUPOlwvuiuiy
	+xzlwVSDiL7xGlECKw4Z47pubpIqz/8BO2ILR92Mpy3Vh6aj+QqxMGaErJbCqLhf2djU=
X-Gm-Gg: AYBFou1lWfYAag1CUqLHD1sEf5h5d/vluCq7jP53k+xNv/WsmCS0VITrO+M9oBYH0gi
	OO8zggka432c2boXZDt49WH61e1OUjjzsQk7xnrSD9cq7HFnXDo98/N19/LPLl6oVc7RCWaAYca
	IYEh4rN6KCS24KdHz+YHxfbcK07zjtUe0uuSzyWtpoOqBnN7Nis2BQgtN2p7K8gsyKkqfdd4oty
	HFDNmswumefgr/SOs2LIknRrOgAXmY4HbkCKaUkfkBkUCE3NReNFMMOr2IQS7ZgkMXtRH+2fxH4
	PHYKn1R3gi9/lnjjEKZbpzdBYB9hJsX0QeJKd8zd3FqoHL3TedAWDz6GtVQDOHRzr5w1aZfpv/y
	9EFXxybjvpJCKfmTqjdUnYPbZnwlTsPxt9+P4DBbe
X-Received: by 2002:a05:6102:2410:b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-790db5f66f5mr4008684137.21.1789136231598;
        Fri, 11 Sep 2026 07:17:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2410:b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-790db5f66f5mr4008643137.21.1789136231130;
        Fri, 11 Sep 2026 07:17:11 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6687a1basm33854135e9.12.2026.09.11.07.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:17:10 -0700 (PDT)
Message-ID: <f8601f35-75ce-4419-b4e0-4b2dc162f3fb@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:17:07 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
 <CAFEp6-1+g+kpevwUyXb2+0M4H5NPtz=2bc-CRfzyhOukRAn7VQ@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1+g+kpevwUyXb2+0M4H5NPtz=2bc-CRfzyhOukRAn7VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gs8t-LGjMuLmjyg-RhXtzkxzUqu8lnrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXzNJW/mGhwF1o
 PjODdg+Knc1BdK26VYGurVNXpFEM/A1AiJOA51epTycP/lygkieCx2w9t4zHjo++j4+LreiaZuM
 Mq8KQBbSE23qomTLL6RCu6SjHSYIPMWqOtW4qHjahjzH0oGYFRrT6UJSgOgWr4jKiThUtErijLD
 yP2YXMHeHexxY/eeJgbYsHWMRbtLIhjnCuZL4c+QsdZVfwC6HJTSTmV9AALrQv0eM9Zv4D3bFk2
 ikpTnqmwdbENMGSquyyRlRAzYAO4FRhgxL7K5KYfbyvuxersU2JWYbkU7nmP0DSQqzA5MX1d8HI
 WRIHB7HjZZTr/vc/S8YuKpH7Zi1VAPziddmlnf4HDjthWfoj8NtujEz/Mro1QLWdW01BUZ1x0P9
 z6EzWPeD2T8sFrOGWS6mWgGJEw6deFbTUbFkW2VkanmNloP8Mib1WIs5s0RNN8o9m87C38F58HQ
 POFgvIoy2QMJnVVukOQ==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa40d68 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JnRjegRK6RYr0dtFBawA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX0rJIw2Gyzt4j
 ISAU+jfIOkVVWXc6yGAwuhdaULv6AkHRtsFCTUQKFG4Jx+f3L35QaRX+VX2PULlDHLxGgMwR/tC
 jEDxV8YT0kbuIW5udcHcEdPz1nsWMZA=
X-Proofpoint-ORIG-GUID: gs8t-LGjMuLmjyg-RhXtzkxzUqu8lnrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

Hi Loic, 

Thanks for the review,

On 9/11/2026 4:30 PM, Loic Poulain wrote:
> Hi Gjorgji,
> 
> On Fri, Sep 11, 2026 at 8:22 AM Gjorgji Rosikopulos
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Implement the configure_rx/enable_stream/disable_stream hw_ops added to
>> struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.
>>
>> __csid_configure_rdi_stream() now takes an explicit data type parameter
>> instead of deriving it from the CSID source pad's format, since the
>> streams API keys each stream by stream_id rather than by pad. The
>> existing configure_stream() path is updated to pass its per-port format
>> lookup through to this parameter, preserving current behavior.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>>  1 file changed, 51 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> index eadcb2f7e3aa..2512cdb16d94 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
>>         writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>>  }
>>
>> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
>>  {
>> -       /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
>> -       struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>> -       const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>> -                                                                  csid->res->formats->nformats,
>> -                                                                  input_format->code);
>>         u32 val;
>>
>>         /*
>> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>>         val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>>         /* note: for non-RDI path, this should be format->decode_format */
>>         val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> -       val |= format->data_type << RDI_CFG0_DATA_TYPE;
>> +       val |= dt << RDI_CFG0_DATA_TYPE;
>>         val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>         val |= dt_id << RDI_CFG0_DT_ID;
>>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>         /* Loop through all enabled ports and configure a stream for each */
>>         for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>                 if (csid->phy.en_vc & BIT(i)) {
>> +                       /* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
>> +                       struct v4l2_mbus_framefmt *input_format =
>> +                               &csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
>> +                       const struct csid_format_info *format =
>> +                               csid_get_fmt_entry(csid->res->formats->formats,
>> +                                                  csid->res->formats->nformats,
>> +                                                  input_format->code);
>> +                       u8 vc = 0;
>> +
>>                         if (tg->enabled)
>>                                 __csid_configure_testgen(csid, enable, i, 0);
>>
>> -                       __csid_configure_rdi_stream(csid, enable, i, 0);
>> +                       __csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
>>                         __csid_configure_rx(csid, &csid->phy, 0);
>>                         __csid_ctrl_rdi(csid, enable, i);
>>                 }
>>  }
>>
>> +/*
>> + * configure_rx - Configure the CSID Rx front-end
>> + */
>> +static void csid_configure_rx(struct csid_device *csid)
>> +{
>> +       __csid_configure_rx(csid, &csid->phy, 0);
>> +}
>> +
>> +/*
>> + * stream_id is used directly as the hardware RDI port index below. This
>> + * assumes a 1:1 stream-to-port mapping and should be revisited once
>> + * per-platform src_streams data (stream id -> hw pipe) is added.
>> + */
>> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
>> +{
>> +       struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +       if (tg->enabled)
>> +               __csid_configure_testgen(csid, 1, stream_id, vc);
>> +
>> +       __csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
>> +       __csid_ctrl_rdi(csid, 1, stream_id);
>> +}
>> +
>> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
>> +{
>> +       struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +       __csid_ctrl_rdi(csid, 0, stream_id);
>> +
>> +       if (tg->enabled)
>> +               __csid_configure_testgen(csid, 0, stream_id, 0);
>> +
>> +       __csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
>> +}
>> +
>>  static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>>  {
>>         if (val > 0 && val <= csid->testgen.nmodes)
>> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
>>  const struct csid_hw_ops csid_ops_gen2 = {
>>         .configure_stream = csid_configure_stream,
>>         .configure_testgen_pattern = csid_configure_testgen_pattern,
>> +       .configure_rx = csid_configure_rx,
>> +       .enable_stream = csid_enable_stream,
>> +       .disable_stream = csid_disable_stream,
> 
> Would it be possible to leverage the existing CSID configure_stream()
> callback to implement the stream API? This would likely require
> reconfiguring all CSID ports whenever a stream is started/stopped, but
> if the configuration remains unchanged, I do not think that would be
> problematic. That said, we probably need to address the current
> ambiguity between the concepts of "VC" and "PORT" in the existing
> drivers first.

I have experimented with something similar, we know in advance which
streams will be routed and active using stream routes, we can enable
them in advance. The drawback of that was that all the streams (even inactive)
will be enabled when first stream is enabled, but that is the case even today.

What you propose is something different, but that will require changing of the existing
api and verification of all csid implementations, i am ok with the proposal 
if someone can help with the verification of other devices.

~Gjorgji
