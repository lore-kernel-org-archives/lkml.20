Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEAC2D2495
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519211; cv=none; b=GBWYFr0FJ0Bheyiky1mJK5iLcxsYke6XwST7vnSeCf4qqBWkOU2OEgCJabHRJONbNbqPpBqeKU02DAMBGeXDJihncpHjEjZ7xHapFYNoD8kaO0oWPOYSMqlLt6JWimWFLRLpo1NnC4zyXasNyvt06uIjyF5utsutL4uT4SwsPqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519211; c=relaxed/simple;
	bh=ypxLGmLSUVWG8ECnUHxLHNQFJhs3awMzBdST2RGLXwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5bbziFxU4Cy5svvrF+F8/ve1G0EHFqtId21FrUSeA8IqSZWJ1JxyUk6XYsZX837q/AFKT49fdyW93Lqgk7SPjz4UceM356qedCpiL2KWmVNudYiuopSMwsSnhW5Xtf1yyn1RDyDPZMSuWHyHBItLPUk1WjFAN6g3VllaMgTsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMF63eRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alqyOtwr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMF63eRP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alqyOtwr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZYgn081083
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyZ/ISVPeawgOApKz8uzNwBVah0yPiq8aZnDnOrBQG8=; b=dMF63eRPOCny0i6x
	12kY6Jh44DOsaaAHeLL5lX+CxhP+dYSYm0ZRKW6bpHd8rx9XoHX0AH32xe4hJgFf
	kLrQ0iq+6koY/F6TbTH+gwC72sHa2RKuqbOEggM1LHExgdySWWUGSQKPSPv79w8K
	ccqg+ayKx8UbR+zFa0larLuvQspylHSkVzGuQJ/CcMPMbYRX+2QLuyq116eRLcSi
	o6eX3+jE7Ackj04pZuufwvjjJNKh+jEsnRs1yUS3Du1RQIj0usFHuvKsv6b18RPW
	0y7aNqQkLzhU+Cw3DN5zdUnt1IGR3wwBaL7PcSp4hCOD0HPrw9R9/Lls0bDSrsX7
	hKEZxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagehjbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:40:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398bb9a6408so1305443a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789519207; x=1790124007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyZ/ISVPeawgOApKz8uzNwBVah0yPiq8aZnDnOrBQG8=;
        b=alqyOtwraEWKhf6HBTZNkGilXe1ZLmbWY+Ngx75+kD7poIZSo3e+pmMKLROOnV9/hv
         Fr48kls+AzAF6XEWTsjHxkPA4Hg6YCJaY0FkdBoDUgTTkhyeDHklokV93MjNVsAjFo42
         oLk0FrXRl+LmePjLTnXCOPfSymYyOXIBIwrJw2hgBAj/GfccyPk1XFrgZM+PZBQueiT1
         UjD8IGMUn/la2rbdopLTUuX6LxwGwY2WQF3oQsDLZ6HPZGy9MFtAq/+sa665BhkUmb1m
         PVunf7WWTDDzCKyIHG72DhOay6E0ifMI3gyefG0qNfDYTv2Kc2VSBfhm72uyalOlN7fC
         Vf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519207; x=1790124007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyZ/ISVPeawgOApKz8uzNwBVah0yPiq8aZnDnOrBQG8=;
        b=H9vNosOHsDLKfAAGNC0xSok8c1ohvVN2ATfLkKQCEUst7K/3Wsvt289YeVQUyo9EDL
         puODOTiGy9FNN6hanTfslx9xBXd10d3tlVzH+XRtg0cdg4facudNNtPvJV77jXH7kSbM
         8lkmkE6G5aWjFGqMASxyqPjWerA61kKuDg0idxgWd8QHC2XZPc1xUe0MF3QUzLiYWvOp
         ZfxJdXd/ygZ6xffWgcsc510oomSJIuin5Iob1qVBDjTF414a99kG02KpbnitfD4iN4KX
         Ox/FOndT7UuSZLyNRybV+Iv49Y05j5264JF2EidOoSlehtd/N+qXVRGXQIGxLK6ORRDz
         taDA==
X-Forwarded-Encrypted: i=1; AKwUvBzog9Ar9/8cIxn6DIQuXqAUbnq1NaSovSXPf/vQvRzx4SQgjiK4YwjRJaWDPc4j2eIrCGeSrrWXiIHbEKM=@vger.kernel.org
X-Gm-Message-State: AFuF++k1dp7wrTNm6DWamEp0Fnxv/Fdlp7lzc70Nl9vfRQEHM417lY8h
	oWwYMNLssdxE7YEcaxyQfs0m9Wl2Rks+tRVmc2iOVm74BkaBiFMA0G4SjtB/xcSAIpZcB2cRivV
	0H4fCgFSZFtxJC77fKaN1QpbrDYojkxRTdJw3A/60PylVmH41TGJBOt9v8mBdiMVBF6M=
X-Gm-Gg: AYBFou26dZaJS8Ef/Jz0rfzeEs627g34GcxNyOsqhSFFT9B4bPegxlhr71rZHBdMM4o
	EvI5xHpVhharK9yFRju/JFiNKDM2BoFtf/7h+Pn3B4Qi3a8QqjrV8yTbxDx/vIrawn4+J4Te9Nf
	/pXMUJATsh2wVqhdjthD95afJJYg1hSp6iALPQbub7/ROQ2DCRNTyZ+EE09aKoRLSD9ruhE872W
	ji4jZnfFL5pogaXmok1KJiZ8YvRHF/aCb1cdOoiCALDjm8xeHIZOHgDy7r4nVf32yVcfbXMq5d1
	ncRee6anwXll/4k3Rm4T4qd1W6ksgBhzHXh2XerCSYU+g303Qq+LjaaH6MPjqP+MXXKlgSwj8Xw
	y8/4OdazAHe/+xf7nu0+5U0zfzPFzCVDrzBSj8sWewpYwGfiaf566hQGseZEyWg==
X-Received: by 2002:a17:90b:3b82:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39e1e47ab2cmr818816a91.3.1789519207499;
        Tue, 15 Sep 2026 17:40:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3b82:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39e1e47ab2cmr818778a91.3.1789519206954;
        Tue, 15 Sep 2026 17:40:06 -0700 (PDT)
Received: from [10.110.88.91] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a93f1fsm2753661eec.11.2026.09.15.17.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 17:40:06 -0700 (PDT)
Message-ID: <b71a5f7a-bc56-4b56-a656-e6f592f69936@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:40:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: iris: add AV1 decode buffer size support for
 vpu4x
To: Bryan O'Donoghue <bod@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
 <aGtbqVizOvw2VPXXiZjw3_w4n5h4O_4wkkJfwPzsgvQDBxysF1c_3DMmtB_LQHSoYG_qPxZl0wtTZA2ysCC_mg==@protonmail.internalid>
 <20260914-add_iris_for_maili-v1-3-09df2b54c317@oss.qualcomm.com>
 <d8c1d02b-d03f-4b3b-914d-a0849936f24d@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <d8c1d02b-d03f-4b3b-914d-a0849936f24d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAwNiBTYWx0ZWRfXzSDFuR6RITp6
 fuvTffGzhMu7Hf5ruElAjuV6TwXfHpaH3pZflEq1WvAjoGUhde44oaErbQgNMXwFnI3kG0JbbZQ
 ZibSqSEunscadtKx5PDEscoydaZ5J4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAwNiBTYWx0ZWRfX7CzE487XevTS
 fBAesa/d7v2pduCBviu/BmiiN2DyMxrvBPnTlRLeEbTxDAAlz5jYup5fcD/9NC18C145fAUbiwN
 IzjISt63zlV4uOSExU6UKhVu20lWjEpI/j1DQ9A1SjIhpUAauo6npLcGF/6eYQpPgbE8RmYkFh+
 T5LRMeF34tKcec2sJuEobpqDqkohXeHNzi6UUf9lcC2v5wZ073f/tP7hCZPog1CT93Jj63pah+f
 m4IH3vH3zb3KIih77iupCfOP3IDeWYbYpR/TQe6CEQiX7fDMG6gvqc8J1VQh37h+u7DJBkvV63Z
 HiSibyahEu387DkFBLWk7/vKUCNtOFJTx/f0C5tCA6r5JJmOwnMHb+n+xLtFemu+W5eh7EXhAQ+
 VcKgom1pJKTrbvOWJOklLLIdrXDvYFFSB7diRCXHA/4b4jmCnG/L8tql6TIrsu91sTha7cNz7we
 XZ3e/s27kLHhnnuJZdg==
X-Proofpoint-GUID: _ZwKhUZRjBCD2oEepOumdGSbGf95AWFM
X-Proofpoint-ORIG-GUID: _ZwKhUZRjBCD2oEepOumdGSbGf95AWFM
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aa9e568 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gG53d2m2E3KGUQgWRSkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160006


On 9/14/2026 12:42 PM, Bryan O'Donoghue wrote:
> On 14/09/2026 14:00, Wangao Wang wrote:
>> Add necessary buffer size calculation to support AV1 decode for vpu4x
>>
>> - wire AV1 into iris_vpu4x_dec_line_size() via hfi_buffer_line_av1d()
>> - add hfi_vpu4x_buffer_persist_av1d() for the vpu4x's persist buffer
>>    size calculation
>> - add BUF_PARTIAL to the vpu4x decoder dispatch table, which AV1D
>>    requires
>>
>> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 35 
>> ++++++++++++++++++++--
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
>>   2 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c 
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 
>> faebb54728660cc621f8822dabf2e44ce8c55c58..55996fd0d14c385ee63d2577b3e6d71b51d9e541 
>> 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -1833,6 +1833,8 @@ static u32 iris_vpu4x_dec_line_size(struct 
>> iris_inst *inst)
>>       else if (inst->codec == V4L2_PIX_FMT_VP9)
>>           return hfi_vpu4x_buffer_line_vp9d(width, height, 
>> out_min_count, is_opb,
>>                             num_vpp_pipes);
>> +    else if (inst->codec == V4L2_PIX_FMT_AV1)
>> +        return hfi_buffer_line_av1d(width, height, is_opb, 
>> num_vpp_pipes);
>>
This needs to be updated to hfi_vpu4x_buffer_line_av1d - The line buffer 
calculation differs for iris4 av1d
and is lut based. Without it firmware session error should be seen.

>>       return 0;
>>   }
>> @@ -1856,14 +1858,40 @@ static u32 hfi_vpu4x_buffer_persist_vp9d(void)
>>           HDR10_HIST_EXTRADATA_SIZE;
>>   }
>>
>> +static u32 hfi_vpu4x_buffer_persist_av1d(u32 max_width, u32 max_height,
>> +                     u32 total_ref_count, u32 rpu_enabled)
>> +{
>> +    u32 comv_size, size;
>> +
>> +    comv_size =  hfi_buffer_comv_av1d(max_width, max_height, 
>> total_ref_count);
>
>> +    size = (SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA +
>> +    AV1D_NUM_HW_PIC_BUF * (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + 
>> SIZE_AV1D_ARP) +
>> +    AV1D_NUM_FRAME_HEADERS * (SIZE_AV1D_FRAME_HEADER +
>> +    2 * SIZE_AV1D_PROB_TABLE) + comv_size + HDR10_HIST_EXTRADATA_SIZE +
>> +    SIZE_AV1D_METADATA * AV1D_NUM_HW_PIC_BUF) +
>> +    rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
>
> Ah come on.
>
> A routine, a macro can't accept something like that. You have two 
> variables and a ton of constants.
>
> Plus the logic that gives you this clause may make sense to you but, I 
> don't see how.
>
> For some of these defines - it looks like they pertain to headers, 
> footers, offsets etc they can be reduced down to some sort of packet 
> header type thing.
>
> I've asked for this type of reduction of clause complexity before.
>
> Please take heed.
>
>> +
>> +    return ALIGN(size, DMA_ALIGNMENT);
>> +}
>> +
>>   static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
>>   {
>> -    if (inst->codec == V4L2_PIX_FMT_H264)
>> +    struct platform_inst_caps *caps;
>> +
>> +    if (inst->codec == V4L2_PIX_FMT_H264) {
>>           return hfi_buffer_persist_h264d();
>> -    else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +    } else if (inst->codec == V4L2_PIX_FMT_HEVC) {
>>           return hfi_vpu4x_buffer_persist_h265d(0);
>> -    else if (inst->codec == V4L2_PIX_FMT_VP9)
>> +    } else if (inst->codec == V4L2_PIX_FMT_VP9) {
>>           return hfi_vpu4x_buffer_persist_vp9d();
>> +    } else if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +        caps = inst->core->iris_platform_data->inst_caps;
>> +        if (inst->fw_caps[DRAP].value)
>> +            return hfi_vpu4x_buffer_persist_av1d(caps->max_frame_width,
>> +            caps->max_frame_height, 16, 0);
>> +        else
>> +            return hfi_vpu4x_buffer_persist_av1d(0, 0, 0, 0);
>> +    }
>>
>>       return 0;
>>   }
>> @@ -2163,6 +2191,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, 
>> enum iris_buffer_type buffer_typ
>>           {BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
>>           {BUF_DPB,         iris_vpu_dec_dpb_size         },
>>           {BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
>> +        {BUF_PARTIAL,     iris_vpu_dec_partial_size     },
>>       };
>>
>>       static const struct iris_vpu_buf_type_handle 
>> enc_internal_buf_type_handle[] = {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h 
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 
>> 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..c7020931a642f0484b6f84af7ab51242e1845458 
>> 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -116,6 +116,7 @@ struct iris_inst;
>>   #define SIZE_AV1D_TILE_OFFSET     65536
>>   #define SIZE_AV1D_QM              3328
>>   #define SIZE_AV1D_PROB_TABLE      22784
>> +#define SIZE_AV1D_ARP             9728
>>
>>   #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
>>   #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
>>
>> -- 
>> 2.43.0
>>
>
