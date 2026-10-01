Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E48D5221C3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869296; cv=none; b=JU2SlH6wEAllA9EtCkpopZ/MiVIMdHdTt3NhjggrRg1E8hutmGG8DxW0Sno40bkPmZn1vZrJ4/0v7sCQXTHgSL3rUFDLfyxqBLwjjf/I0CQmtpVIHaabWGFo9/xcG+3f+rJllluXGIScpGs4IFy9i9arTVgN2Kazedymfw9GYr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869296; c=relaxed/simple;
	bh=1T8xmr4MRs1K3j3y5oIphPuEh0OlFxvQsp6Pm3flkh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CInPTtZdR/OJxxTSNJdDy9ePnoYPfTPCLgZU26Iu+osm/vmD6bRYvSsN636L2rmu4JlnUts0LqWm/z/ouVaXJHE/yk4M1gnNG7PKPuYpGA9Cfg5SWS8mah17zkdoWjHYrIj0pqytK+kYYqjFvIu0KR3Awn0iRqOUP/ifOC3x9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqvrWO88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6BlS15C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqvrWO88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6BlS15C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Diec03776302
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdipUe3szRwP8xuz1ENYjFx/VNsMoOJDQRWi0Y0Wyzs=; b=JqvrWO88VHVsMk9U
	J/h+jWsXTyObVyTC7PAe1QXm7rIsT4mUYUm8B3i8CeNEvMwzJJ2LSK0R3nafhQtd
	uQV3tQ8n5TJsXoUkxuM1CPz+G8vI1qwR/rsI7jy+fodoxkp+Znn2F9eO+GrapoL6
	IhjYFgmtwdRHmQCcxjcjKn8qCCQj6VB12UBsmpee4Rfo1Cy+6YFyQNrcGe/JIKUQ
	bUuBzdIy5dfkjGnOJbq+I76/53aQgls1LtGnyokh1dFYFEhVJQQIPOUpGd1fqGjU
	Rqm3K1rtL4uSQtvvLhESajSHVtbE/MUF8Jhg3yFZM+Co5InKiJ1By03g80sTGiIw
	41kAxA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b9790-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:41:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso64045495ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790869292; x=1791474092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdipUe3szRwP8xuz1ENYjFx/VNsMoOJDQRWi0Y0Wyzs=;
        b=B6BlS15CKResFtFZx5+W7XwYXaanUB9Z3VQPvEg6OPPEDtlftYgTlDaW1mHUIgwWO3
         Jul0llp2pBNHwbW1dEDxVim/7NgJ3nkjUoUwwl97Bvr0qSNjPFEQvRq3z+2sprF/DusX
         LcbWfv5zvvJ5qbc6PdRA47n4FNMlkvPYdFVZoi5hPYnJlE0SvOXAq91/EkFqw5ofBB7H
         KkXmzRMKEj9jxvWsF1tCuqGYSl9+ghw3NgiofWXYznMcXHlFzsNNnkZmJptKH40qLJ9L
         Unl0qwTa56LLmmCmyGTfydIeMOZMhAdiTmS0uLFCm49o9B2YE/yXkvt/f+9COJ1IvRsV
         mQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869292; x=1791474092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdipUe3szRwP8xuz1ENYjFx/VNsMoOJDQRWi0Y0Wyzs=;
        b=pqa2NzgNaRoO0ukcUvM5SJNUouMuHf5TyFgEAOFLGVu5tszwt9LZw/WIBg0OVIh8Ux
         Pr4ClG8cnuoxUTWuqH0Yf7hnz5TDCDNzmd7TWtdQy1EipfZmEo66HIDzKHYAenILDXfm
         5+EsZ0fLtWqf9Cg6kXGnWekO1AaykqumHlzihoRpzDPr7FMo8+I3dn+QN7JKxa0sPLsz
         oC6NphldFwg52G2fWTCh/1kEtoFoi63VkDUyGTciF4IVMAGzoBY4m+izbRor6tCl3tkl
         hlx1wf+Qeb0CYWzgdpEu1t3+0peYvQtoUnbVah5cu6kFJMcHmAbeXjeLXMT/tqbULDIO
         PkkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT+EjXwpBxtPJReDhxs0hnI/obG3MRkwJ2ZJnQ+m5QcZOtB7z522n8GNryhJv5V+H+VSG1KpBL9XnpQZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGNNM6x4B3Z4pYcX/UlKRVkfFVXlCdjXm9iAd8N0w1G/DPEn/t
	+3z6sXUYNKvLdaAzBvjOT0xxX4Mg7wIk9L1r83lrw013cf9+kh3XdONUl0k+WWzikJ1Q6TCujuI
	mcdswgmPrcjHYeNrgoSj2Dyc74kV8gqlK0yMs2HGEd+ZMfkSnuGRuAZWteEh94f2jeB4=
X-Gm-Gg: AYBFou01hxJfcl0b1imn9WNV05gN1ZnZ2HU+cZ9kW0lbWVIYzDgFOG5UJIKQ73smziQ
	SsKbPh5BZLaGdmXbUEW1hwoMiaX661Xu9Fc1GBiptDkI29jw7oRogCsv+FuuYdoAf10LmpPpHNp
	CbE2rDWarLf2otFIZYqDJiwv7gZUW5ocpBqRJRvUJbs8Dn3XwN8OqbDt2RQze6x6igc+F1LJcj/
	VQcaFkrXUQq2mlUFqUT1tGFpr5Q6WOuZ+egQw1TIQ7z1ylWpcu0vlRuVTWSFq2BiYmplv2cP+ha
	hZoAv6YsVYmrPwPk76XH1S5FrkT/aHAPELS+CXdVk4tp6c4vKTvEWzGbrLDR7F/iMQLuuyFOt+x
	0gLngb1G78aeQNQoqr2rWIdUpTvI/d0BukQ25
X-Received: by 2002:a17:903:2f90:b0:2dd:ad73:c98d with SMTP id d9443c01a7336-2e2e4b4c6b6mr40600405ad.37.1790869291540;
        Thu, 01 Oct 2026 08:41:31 -0700 (PDT)
X-Received: by 2002:a17:903:2f90:b0:2dd:ad73:c98d with SMTP id d9443c01a7336-2e2e4b4c6b6mr40600035ad.37.1790869290901;
        Thu, 01 Oct 2026 08:41:30 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b0834esm12975265ad.51.2026.10.01.08.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:41:30 -0700 (PDT)
Message-ID: <47a155fc-9cde-48fd-bb02-31a7d3d9e8dd@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 21:11:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, deepak.singh@oss.qualcomm.com
References: <20260920-qcom-bam-dmux-vmid-ext-v2-1-ef5ca2178378@oss.qualcomm.com>
 <178996250211.2160803.6013516663876593386@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <178996250211.2160803.6013516663876593386@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2dZPmHWET2LhJyAvHmp6Z5x0AwFJDSC4
X-Proofpoint-ORIG-GUID: 2dZPmHWET2LhJyAvHmp6Z5x0AwFJDSC4
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe7f2c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Xq0XWdt-4rZHMzWQs8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MiBTYWx0ZWRfX4uSnD3gvHirx
 nhjF/Mniv9HICbvFP3Hv5t/cybtaIP/YOTu4ike/L0LqTBwj4Q3l33Vr18nvWmuD+djK8cYdKF9
 gUoIoNzBv5jfmm6/zY3AzBMRb3RJHcs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MiBTYWx0ZWRfX5h5ZKgf8gTrM
 QLnaZ8zLetavq0JL/VTQ/krC67vJwmmecXclBzLaFXgBavRksjxSZxkMugWN3irioTPl5WFK80S
 pVzq2vdJ/hPm8fL7kVniOw46XAVK6x/pYKHxgneo24bRI+LGrj5hanMrbu1D/2RPU13O4YM36v4
 PnzYnEWvSCSZy19GRKxDB56oQBtOd+QDHL4S7AaFSPRKZ602V1dB0OWE5WdtF2hfxYmQi60w0OZ
 RqFZ6lrHzSB3cqO1rBmz827lG0do1LEUQP8MPTWtmuDjE2kmgqiiePB4IGwgnihsCVz5Z0clkRV
 fwD3eZMB4jtqgswmogPgcmfiTY4uVwT0jF+8SDPZc989IrtenqsiHjAWpSoMOW0X02PRzlFg8qV
 RtOAN86WGtOOqt4x1ZpVaPUdNZjZVrKfWc18rSxnsgUgLWlSPXdCLVW7yYfAGT5eWdOnbchmLTm
 x5VSuFAlTB94cBPCFqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010062


On 21-09-2026 09:18 am, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] SERIES-RESOLVED (retained for policy combination only): the
>    concern that the newly documented `qcom,vmid`/`memory-region`…
> - [Low] The `qcom,vmid` schema contradicts its own description: the
>    description states "The local execution environment is retained…
>
> --
>
> dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
>
> This adds an optional memory-region property pointing at a
> restricted-dma-pool reserved-memory node for BAM-DMUX DMA mappings, plus a
> qcom,vmid property naming the remote execution environment that is granted
> access to that pool via SCM. A dependency entry makes memory-region
> mandatory whenever qcom,vmid is present.
>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> index 33746c238513..5351269b0ab7 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> @@ -72,6 +72,24 @@ properties:
>>         - const: tx
>>         - const: rx
>>   
>> +  memory-region:
>> +    maxItems: 1
>> +    description:
>> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
>> +      The BAM-DMUX device uses the pool for DMA mappings.
>> +
> [Severity: Low]
> This isn't a bug, just a note for the record on an earlier concern that
> these two properties have no in-tree consumer.
>
> The companion patch in this series, "net: wwan: qcom_bam_dmux: Assign
> restricted DMA pool to remote processor", adds bam_dmux_assign_dma_pool()
> in drivers/net/wwan/qcom_bam_dmux.c, which reads qcom,vmid, resolves
> memory-region through of_parse_phandle() and of_reserved_mem_lookup(), and
> then performs the grant:
>
>      ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
>                                ARRAY_SIZE(dst));
>
> The pool attachment itself is handled generically by
> of_dma_set_restricted_buffer() from of_dma_configure_id(), so the
> "uses the pool for DMA mappings" wording is backed by existing code too.
> Nothing further appears to be needed here.
>
>> +  qcom,vmid:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 1
>> +    items:
>> +      minimum: 1
>> +      maximum: 63
>> +    description:
>> +      VMID of the remote execution environment that is granted access to the
>> +      restricted DMA pool through SCM. The local execution environment is
>> +      retained automatically and must not be specified.
>> +
> [Severity: Low]
> Does the numeric constraint on qcom,vmid contradict its own description?
>
> The description says the local execution environment "must not be
> specified", but the only constraints are minimum 1 and maximum 63, and
> include/dt-bindings/firmware/qcom,scm.h has:
>
>      #define QCOM_SCM_VMID_HLOS          0x3
>
> So qcom,vmid = <QCOM_SCM_VMID_HLOS> passes dt_binding_check even though the
> binding text declares it invalid. The 1..63 range looks like it encodes the
> width of the SCM VMID bitmask used for BIT_ULL(vmid) in a u64, not the set
> of values meaningful for this device.
>
> The driver side in this series does enforce the rule, in
> bam_dmux_assign_dma_pool():
>
>      if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
>              return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
>
> so the outcome of a bad value is a probe failure rather than anything worse.
> Would it make sense to encode the same restriction in the schema, for
> example with a not/const 3 clause or an enum of the supported remote
> execution environments, or otherwise drop the "must not be specified"
> sentence so the prose and the schema agree?

I plan to drop the "must not be specified" sentence in the next
revision, so the prose and the schema agree.

Thanks,
Vishnu

>
> For context, neither qcom,rmtfs-mem.yaml nor qcom,fastrpc.yaml places value
> constraints on their qcom,vmid / qcom,vmids properties, so an enum here
> would be a new convention rather than an existing one; the narrow point is
> just the internal inconsistency in this file.
>
> [ ... ]
>
