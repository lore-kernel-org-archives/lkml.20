Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559D331EAE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135790; cv=none; b=PWo9fH6+6yo19tNK8o/QJnQ7DUpu7jnTmvm+JMbnVYo4zRPruNOZ3/OgJ22410liUEMG3j0Zco0kIAWKtSFOW+xMp0nSkPpumZanElim2/0evjEC6ZYNikTRww3nab1qv8s8pn6yOOAr3RnPaPJbIGq3sZBMfRQJXyaR3YqVfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135790; c=relaxed/simple;
	bh=8fwE/CKkLQBqwDNOvHotNuwhswsPeK5f4jYmO9oFJbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRvD/CpdxEms2Plerb82GR4c9i+cDzz+Aj05PdJHydKtS5WqTrTH2ElMoORkQOGb3cL7jFE5TMbV2OH78tUnxw8XXBV+ZanuZQnJCHygkHAVll7E6iuPI/7FRWUGLjzfDFvXQBoMqyeWd9SY13daBUACiC8JhmzJtbB+ishEJrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzBtSN2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0lX0P5G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzBtSN2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0lX0P5G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjUKF4041200
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iskblvIV/JjBo66wrPr3qOCymToWNOakKQIIxBq4R+g=; b=FzBtSN2Pbpd7xhPl
	ztd+31jDyrmQLUSpTio+l8WW0Il9GFKeJ/KPTXbDm0XiP5zWLL3IE5+Z0fkNF97K
	pmWDon7KMVKdphptMAG8D3htcV9/BU1/JGrVFoT1qkE6ufgyM9Y63vg90hKKfT1A
	cb1ZNeISaQoEVsxJIHd4KFYAXih9pvav5ooxWPu++IafhmEPJ3I3zOFm3aBtyBBi
	1eZq+yHf6Luw0CXbuF6TxaaXQU47urFcQvdQ6uWi1bzuGZ4G6MhB2cU9E2oaJPrA
	bvSTpnhw8rldBo21MzZ1MOeOYKBlHtSATunkUKeS4bea4OAHxwHBmnMeRYcvnJKi
	kTYZ1A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2c8et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:09:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104417215aso18977346d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789135785; x=1789740585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iskblvIV/JjBo66wrPr3qOCymToWNOakKQIIxBq4R+g=;
        b=A0lX0P5GOIPTQWeJQULeY1nmd8t7sY1H7AqVWahF6vFbQniHdgm1Vx8Ve0gzo+ndT+
         dpJ2/VXmZrgMwOYqW0HSG67Kg1QWcKXhWkR7MDU9HnCqeT4+X5ti9RqsBfJTJHYHxN66
         gBSG9QYi/u5yGlRYwk7Pb11953S5Ik+IqXJmxHxwW0gCP+tjsyR8zYniZ+yfpyNDSnnb
         5AzNX85jNnzzlgKkXf0zfZtA6oP8TTj3mtxVQN3c8a2Qq/UtquytE+oloSQLimJP37N5
         mQWn2BwW8vP4qD6/yb4uFLuoLAYC9ujMQbm3H3jUBMc6csqhWYWFp96nims7mmNvEM1y
         mqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135785; x=1789740585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iskblvIV/JjBo66wrPr3qOCymToWNOakKQIIxBq4R+g=;
        b=dSwsfOJUX1lqsRoEPW/6NF86jfeYhrvF+Eh6juyJc4qmrIOpScWtSmn4Jh8fEAtsWQ
         birEwC4+G1Bin0h8C4syL7ciGLMCRXWZhTnQQVeW/knMciGpRfN4dC6cX3xV+tSNpO44
         5F0NdDNZ++fa4CF0KRxGegxBTLHUW4NwX2OmeEpX3T7aN3UDg9AFaku1plDy+i3I5AWc
         AB56h/ZzwWvXbMS6vU9Y7lQ+EWXs9+2xvpIkyqZ/+1RSDDVMlofjdcOrymVWRn4jM0Rb
         gnCxEwycoUM1f4CVutoI12JJALlTmuRhDmywfD4cqCOCJPWKpcqkP5JAYj0BH8nskXjF
         mghg==
X-Forwarded-Encrypted: i=1; AKwUvBxiZw5xp+6E4yTPKqwYNgI4UpVrY5rA5oZjkXvSA3Zi44xwsdmJ43sEz731MIF3cLwuW4E1stVqtRfhIBU=@vger.kernel.org
X-Gm-Message-State: AFuF++n9umJLjYhoh8dMjIPUic+3DEyEIhVVEE7Z3BO9rSime9mantgG
	nCZRHvEEirS+8D1U9LBxovTWZSo6dDYFnLeELoWu6zbpyxhtYty9c+xXo/n5Gn4heqgiWejkwH4
	KA99de1GvjMMFQRPLI925cMg4RsKEPdahsJyyK5cL1dI7LcVfbA+rcADceEw/Y54D9MA+7hyYbA
	E2xw==
X-Gm-Gg: AYBFou1GrS9wD3mxUOGw7E4oks4ZQdz7vuVn4GAxn9mnubAtEPVTVrxnx4amun0MDxA
	2AUy2YNVXNj1G+fiySx2EpJwEeup4PMaEgPRzsnPzbs1gK9JWjrk4PLOtpBPHCsL8wcS7gVdtmE
	e88efpK80FdbV3Oa2Wf5G/N2/8JGzP553mOsItPQlZQvFrN8aI31qyOkg85DU+72gSxiDNtCgCG
	A0gSiqrp/ze5qgXFVVDenkOonjcOH+uG6qksw2IbebREUx2eTQaYBqrv61qMEivu0JlrUp8o0pK
	XDCVAMIW0OCMByZKEI4fGaBqShzcrQRywp+Afn307UT1YDU/hIQSacWngu/698YBLvsLVD1jq8t
	i3eowIMxa/rz89xuR2uXAJ4yUpHbqTCIG3xcdkunK
X-Received: by 2002:a05:6214:8510:20b0:912:122b:b97e with SMTP id 6a1803df08f44-912122bcfb7mr42132046d6.27.1789135785336;
        Fri, 11 Sep 2026 07:09:45 -0700 (PDT)
X-Received: by 2002:a05:6122:390b:b0:5bb:eebe:7ffd with SMTP id 71dfb90a1353d-5c846307c10mr5360849e0c.8.1789135720634;
        Fri, 11 Sep 2026 07:08:40 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm6426044f8f.23.2026.09.11.07.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:08:37 -0700 (PDT)
Message-ID: <684d02bf-e575-4229-add6-a0e45186f59b@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:08:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
 <e3000a66-3fa9-48d6-a82b-b4ff52558e5a@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <e3000a66-3fa9-48d6-a82b-b4ff52558e5a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa40ba9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iEnAxMS8pMPacfR5st8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: INiNw9NEiSxDY6U6XGtTy_EoLax6ydHH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NiBTYWx0ZWRfX8I4Bn+KGZ8ZJ
 3Wn6bUu6xy8P6bYvAhq7dHM6K6CPzm/wL+zlULgo+wVPy2wZ+ZITWH6AIpeOVPg4OExA4qutDWN
 JBQGtQM+ZaYDCkijbRVKbOcShsuzyZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NiBTYWx0ZWRfXzvjCkH4VEivV
 +crWs5jZYPlcps9y1gy75UB5sQTKg5D9OPNbIuuGaZ7ihh4kfFD8rDb7GZYukhYj50AeLNL+ZNe
 M6YzkyKlJieUnuEu28d+n6kclEb5rTpmK0qllW+XMFK22PhEmY33tD+y6riNgwNf+PWbSuT0J8h
 2bQ1vr4ZXx24GoEua7a2NEFIx43ku9zAhbdqc6YrTFNlyWTxUwjFoeOr+mAsyReve1f6Q8JrENn
 Z1ig1JC6yyrHQMvWEXU/EmdexJoaMtV8s1V4ZByvo/ABxPg8NaBIl99P024Oyjpm4ExH38fieE8
 JmqkwiWXepSbc20z9dKuMIMc5WV+NCm8MkFxd1cYi8v1MYrdFzfgseIW0kouac+e5VSIRdGQaZl
 VgmeVYJDqEEU1dBGPoea46jPmcqVIEAs4qCT5zqmWCxwaXEnr9KitrqELlIfJ9QxppVxRIGl+k7
 o3ZN2oSA/vq/5mjDUcw==
X-Proofpoint-ORIG-GUID: INiNw9NEiSxDY6U6XGtTy_EoLax6ydHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110196

Hi Bryan,

Thanks for the review,

On 9/11/2026 1:46 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
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
>>   .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>>   1 file changed, 51 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> index eadcb2f7e3aa..2512cdb16d94 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
>>   	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>>   }
>>   
>> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
>>   {
>> -	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
>> -	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>> -	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>> -								   csid->res->formats->nformats,
>> -								   input_format->code);
>>   	u32 val;
>>   
>>   	/*
>> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>>   	val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>>   	/* note: for non-RDI path, this should be format->decode_format */
>>   	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> -	val |= format->data_type << RDI_CFG0_DATA_TYPE;
>> +	val |= dt << RDI_CFG0_DATA_TYPE;
>>   	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>   	val |= dt_id << RDI_CFG0_DT_ID;
>>   	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>   	/* Loop through all enabled ports and configure a stream for each */
>>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>   		if (csid->phy.en_vc & BIT(i)) {
>> +			/* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
>> +			struct v4l2_mbus_framefmt *input_format =
>> +				&csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
>> +			const struct csid_format_info *format =
>> +				csid_get_fmt_entry(csid->res->formats->formats,
>> +						   csid->res->formats->nformats,
>> +						   input_format->code);
>> +			u8 vc = 0;
>> +
>>   			if (tg->enabled)
>>   				__csid_configure_testgen(csid, enable, i, 0);
>>   
>> -			__csid_configure_rdi_stream(csid, enable, i, 0);
>> +			__csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
>>   			__csid_configure_rx(csid, &csid->phy, 0);
>>   			__csid_ctrl_rdi(csid, enable, i);
>>   		}
>>   }
>>   
>> +/*
>> + * configure_rx - Configure the CSID Rx front-end
>> + */
>> +static void csid_configure_rx(struct csid_device *csid)
>> +{
>> +	__csid_configure_rx(csid, &csid->phy, 0);
>> +}
>> +
>> +/*
>> + * stream_id is used directly as the hardware RDI port index below. This
>> + * assumes a 1:1 stream-to-port mapping and should be revisited once
>> + * per-platform src_streams data (stream id -> hw pipe) is added.
>> + */
>> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
>> +{
>> +	struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +	if (tg->enabled)
>> +		__csid_configure_testgen(csid, 1, stream_id, vc);
>> +
>> +	__csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
>> +	__csid_ctrl_rdi(csid, 1, stream_id);
>> +}
>> +
>> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
>> +{
>> +	struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +	__csid_ctrl_rdi(csid, 0, stream_id);
>> +
>> +	if (tg->enabled)
>> +		__csid_configure_testgen(csid, 0, stream_id, 0);
>> +
>> +	__csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
>> +}
>> +
>>   static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>>   {
>>   	if (val > 0 && val <= csid->testgen.nmodes)
>> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
>>   const struct csid_hw_ops csid_ops_gen2 = {
>>   	.configure_stream = csid_configure_stream,
>>   	.configure_testgen_pattern = csid_configure_testgen_pattern,
>> +	.configure_rx = csid_configure_rx,
> 
> Keep the namespace consistent and include _stream somewhere in this name

I agree it will be added in next patchset.

~Gjorgji
