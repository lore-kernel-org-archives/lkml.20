Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67253B325
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693932; cv=none; b=CKt67UFgHdnn6lGXsMyghiFKxjX1wNW/APfPq/LiRt1CQAayb0feIzneNy6j5+byiyVvPQ89CzLHOcYktpzchOQzNyDBAgOKYRHgKt4/21eD6zn8BtVJ29bS4jJa3tVOnEnzu39MMBRP/4jjtF+FOmLIFKUFwxAWwz6Rr2aPDZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693932; c=relaxed/simple;
	bh=EqAVcdyv3bdh5PWijfipsTsljh3WRwAlRWBBEdBJcZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUOykCfdMh3Td2hQg9JsuP5AbsTiD802P+h7UCjXq1X5PwDnzMXU2nM7M23MW11lqRN1Lz1bc9/FXLxVhujnZS5dSiZ2oIOfhDDKOOoaXFYVfnTHNcurZVVQE9V3uUF+Z4OojWDdX3k5CAWIRuBqUQeGhxVMglJnkdoj3sqJAfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6+S91ec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3Mp7Dry; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6+S91ec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3Mp7Dry"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqrOd351030
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cfew/DLGWZ2OWSHmGvnAzyCDWtCayHiP7Z8vNY3IhS8=; b=h6+S91ectDgEyORG
	S1jC5DakWLX5QfDmaOXupVyAUzAGuOXi88d6bBwKqvIQGCsuL0YIu0GSI5K1dDyv
	J8bOw0UDSh/3XHF9GvSrmnSntzt5mkMJnVkDNApC/xgYaA907OS93mW0HS4eWo84
	/ezJpFIWlELErhW9JlZLMVPLlsWf3H6SfamIkCmxuEtq9utV7ic+QELL9ySiwBsu
	eVInksBK4gqmVApUF1aFfQ0+RaL0LrZoA2ObNub+uBefTLRjEALsut/maBO9QbB7
	n4Iuk1yq4FMubDnE2lSgErY/P1CdAPQh85Hw0JGmgDvEaMLlqdQV+YecfhY2koSr
	i00vmQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkkf28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:58:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9123be39eeaso88475436d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790693911; x=1791298711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cfew/DLGWZ2OWSHmGvnAzyCDWtCayHiP7Z8vNY3IhS8=;
        b=c3Mp7DryE6lf5INug55hBEZKzqaeciJzfTFBKGnNP96nAfwT6SRjxyQnxHNzn7WnhM
         xRdEZLJMV/RfewuvtqKpsQVQ+YJtLoJUer4FY9ti8kjlpDvtKcZqop/YotW9axgfGxvr
         bWbLhYQdQKAhuuGEpI1uzQ3TjgOF6TTq7EfQ5F6JHBZ8175dIsVTVs6C1mxNZLkL52bm
         yNoRTdSYB4Z80oHKbg5D3a8zuFVI4N2m8OZSDuu+3fPAVEqKsDzhE1OyyVtNFrfIacP/
         yKg04supWUBfXLg1L+2jgfhP2GPliaMAXceWUMOcDZa5VmXTABMtuOS/yAaQj39ATygB
         0OQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693911; x=1791298711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cfew/DLGWZ2OWSHmGvnAzyCDWtCayHiP7Z8vNY3IhS8=;
        b=B4LGExCmLY1/zuZShRyzlkYl6ECwN91IS3zRFnPrhAQrbjs75As1xjRysWUi3Orrkp
         Zce5rmcGdtAdRNZ0wXJX30JG6bz+G2Ht0E2dkL/vjpY4L7qkXzrpJpvl3m68mnQRRjOH
         U+yW8vnLyJeHvIA4086bRZVi1LgA4wSZCeQ1Crpi0SoGa9P5t4cGFsTP9Ug3IP2+hhdp
         EY1Rqk/bvgJFEinxIa6AiLBCNqFqczk134vyigFtzAC2aBCpamhvnGi3xJYLc6DgfaA6
         n6GAf6Zmks3MJyfDSRB1rXtzbF+C33htCxBvbwHOhL/1LA4BAwqCy4+tKrDjRsMawqc4
         2Whw==
X-Forwarded-Encrypted: i=1; AKwUvBy9/XM0MU68ZfGg6GDmwFefWiAlSG2VQaUR90RjTHsaMoYXkknwnNrWC9323SHBHEKyK3KGzR60pqrLv+0=@vger.kernel.org
X-Gm-Message-State: AFuF++l69u8y3+05A+eaTauNNRuVl+E8qg6P285cyGPNfm4ZA+n9/Y70
	4+gG5RY9qU4Zh+Xd8LB0DWH+GimU9+9tiravgfe4y+iwMZLwy42uzVEHzqXb+DWozMfWkLYZBge
	2bBgOlSV9h4uxCUjSOHgjI5obX7iQncuj8chjadfQUEoAWswbjiiddvhpj4JZH/P5FTE=
X-Gm-Gg: AYBFou36jsjVkRIeEqkY/EukDXFSsB1ruywHcD/BQ+VrD68pSEmnR12sIBzl7ibrc3I
	WwC/0hF+NhPs9etrP/L6uScBj4r3a9LV9BrUPQ/MqyKOXxkS2hY4dfkQOQuFeDqjwEr6DSdUqRh
	NcguF00tb7R2WZ0+r6k3zYXBmeOZbSUJiDjG3QK63f1k2nW2yO8tdjX2XQGvWuI7fgFiC52g5Ql
	jP1h797TJEzCobXcFJOq9PscKNt6C5nYgwE9+vQhiIuVHWvth4/7qnVkuFtvJhllWYb5pGfiPmc
	m5g5tOq0Ga73Xzr6wj42QjHuceYhcmUvVx6B66HMX8ZOT1GJm4v28FwFx5R0LdjF5DIBL2FwBX7
	rkhf3EGRW0OBq7a081JgDdfe63nZl3aAKXmRP
X-Received: by 2002:a05:6214:390a:b0:914:4601:dfd8 with SMTP id 6a1803df08f44-9144601e535mr213690316d6.10.1790693911017;
        Tue, 29 Sep 2026 07:58:31 -0700 (PDT)
X-Received: by 2002:a05:6214:390a:b0:914:4601:dfd8 with SMTP id 6a1803df08f44-9144601e535mr213689766d6.10.1790693910318;
        Tue, 29 Sep 2026 07:58:30 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d377464sm12112356d6.41.2026.09.29.07.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:58:29 -0700 (PDT)
Message-ID: <4b149801-0846-455f-83aa-a222219d01be@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 20:28:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <ca3c86b6-c837-4298-a1ab-4fc61a2f8a0a@oss.qualcomm.com>
 <artzWeUgTHvGzo1m@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <artzWeUgTHvGzo1m@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX/BZeuJ1e63Il
 W6vDkritQXgNXv9GK5PE0ZZtij3GHUusjrBc9zWU3N4GGCnyjCHGEFlSovEXeSzaONMYmV9q4nm
 yVrQS2IFtm93MAhwNMGtMBKE90fqd1o3CR957do1sQem1NB941vDwrqh/JB+QkuENNaKTIMw0p1
 URD6Dms6NL9mtLQoosxpPyEWR76+lm38bqE4XlJUAaec9Sgq0tiIAL+CPRoIN6D1WZqkSPdtrqT
 S2f5dhi/x/XeUV798jK1HF3ZjHwuI78JerQvuc+ftpmfhY6pZQakFq1ikxF4QUyDy2Mr4Y6MYT7
 kfRYPTUd5isjen7DIpYnWI8nuj2k6LIYl/6b4kqEIUEZQCZBNRCpShxRvFRnOitsSJTr7JN5v3V
 T3cuApIJDVxvSW70rByWx4bpZAoB3GEDrgmxI5u2GbEBy34Rtxzk17ZylL4bcjWnHQZhdr1jUeP
 PsFJxabvkYPN8t2l2xg==
X-Proofpoint-GUID: HU5L5FTgy_mPf7mrejvc6y0oAJPXuex2
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbd217 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uW-ob52F1wccIURrHgMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: HU5L5FTgy_mPf7mrejvc6y0oAJPXuex2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX9GyhNTuQxcM6
 zjEkoD+ETJazPqswbdJ/ZlCo+ELF7c8raLPZcdYCbt7lWQX5P6F06Lw7PXkrXUrir7LUQcaiGEt
 jZNl9RWmHsEn6eoNGN98UJetO+eafZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290059


On 29-09-2026 01:44 pm, Stephan Gerhold wrote:
> On Mon, Sep 28, 2026 at 04:02:47PM +0530, Vishnu Santhosh wrote:
>> On 20-09-2026 08:32 am, Vishnu Santhosh wrote:
>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>>> domain with restricted access to system memory. BAM-DMUX DMA mappings
>>> and BAM descriptor FIFOs must therefore be constrained to a designated
>>> memory region that can be shared with the modem. Accesses outside that
>>> region can trigger an XPU violation.
>>>
>>> Add memory-region and qcom,vmid properties to the BAM-DMUX binding.
>>> When qcom,vmid is present, the driver SCM-assigns the entire restricted
>>> DMA pool to the local and remote execution environments before requesting
>>> the DMA channels.
>>>
>>> The restricted pool then contains the BAM-DMUX mappings. When the BAM DMA
>>> controller references the same pool, its descriptor FIFOs are covered by
>>> the assignment as well.
>>>
>>> A related binding change allows the BAM DMA controller to use the same
>>> restricted pool for descriptor FIFO allocations:
>>>
>>> https://lore.kernel.org/all/20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com/
>>> ("dt-bindings: dma: qcom,bam-dma: Allow memory-region property")
>>>
>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Replace the Shikra-specific compatible and coherent RX allocation with
>>>     memory-region and qcom,vmid properties.
>>> - Use a restricted DMA pool for BAM-DMUX mappings and BAM descriptor FIFOs.
>>> - SCM-assign the complete pool before requesting the DMA channels.
>>> - Validate the remote VMID and restricted DMA pool configuration.
>>> - Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com
>>>
>>> ---
>>> Vishnu Santhosh (2):
>>>         dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
>>>         net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>>>
>>>    .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 +++++++++
>>>    drivers/net/wwan/Kconfig                           |  1 +
>>>    drivers/net/wwan/qcom_bam_dmux.c                   | 95 ++++++++++++++++++++++
>>>    3 files changed, 134 insertions(+)
>>> ---
>>> base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
>>> change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
>>>
>>> Best regards,
>> Hi Stephan,
>>
>> I followed your suggestion and updated v2 to use the restricted DMA pool.
>>
>> Please let me know if this approach and the implementation look reasonable and
>> meets your expectations.
>>
> Thanks, the approach looks good to me. You received some comments from
> others and Sashiko already, so I will make a more thorough review from
> my side once you have addressed (or at least considered) them for v3.
>
> Thanks,
> Stephan

Thanks for confirming the approach. I will address the remaining comments
as well, so that you can proceed with thorough review.

Thanks,
Vishnu

