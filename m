Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082139;
	b=W5j7+/cBzZHavPbiEdj2c5/TvGrE+ucsqZFWvZaghvtRJMAWXzraGzVcWJVjwf0iDvpg
	 y4Zrio963Vtt2Vnf5t9AMBjYjXjaHO/X4X5CO76w9aAel/EsviB0IxDw+QC6UNcWKxRUf
	 fjki/YEn08wphHaJHDOr8L5qOPyUtnfE9fZJ3+1X1ENxnaMjIE3IMUrv+b3r6farVcWVm
	 f1IbZVjCirOdvOyxaGtsm//ziYOW1wr+BjdbR9Rh3vnUOWNxeb/ltyjJhezVtI/6aMbqv
	 30QEMuc13TrJHJW9DvoAt9zLne30/XkJfY+xJ1uWDVbgoq0ts5A58VGmTc/+wZkIq/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
	b=tvtKr7NR+OxqnQmsGLpggIpT50D1sn7YJhNEEC5DTQOdWNi4HLAm9TCahVuJq9jP3gJ7
	 YtpqSV8jf9nCggRHGuW0gBJP2v3LHLEePe8/B2aI5TRGGZGtZFzCft+91TtwWNzoT7Mjh
	 ZYdOkUZhaLJqE/aS/udq07ikd6LEGLehcYWzirEcvzE6Qvka08zJfRmc548uq+nuX9bLi
	 hV3Y7mukT2tljGBW+YWipjDLrW0d/PMXAtp0LtNckhocEZvhAkinYVUVyPusY9eXactSG
	 NL907hUnrJ4rGkcnNmeH3UIuSzCfGK3wRxoO6FwJ6JzoYrsbicvaNDuroVmMg+SQ6Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo7AZp6f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIG68irW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70205606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70205606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo7AZp6f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIG68irW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5iCvY403997
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=; b=fo7AZp6f3MxcfLqm
	cmr8GEfUPncYo4l+FTY1si0CTrFwIxCyAIujaHf5lhwiBJvJ81GX5rKkSLxVliOb
	c9DREBO2BLC7X15GM8aXZ0iGQ/m9VqEC+Tg7AxNdJXmewMFmvzKj0b9w66KI8Elp
	ou86K86hBNNMTnrVDd/NoMbAUrn6Rwi0h/A5+ez7xAi8IcqldGnQ/WeF5RzPXTyr
	uZTS0het8nc6cOgIonhhEJ4QxMx7U1Gx7KHb43mWKPqYGSizskB3b0qUVH0fwAW6
	u9VAFchs28V6oHADq9cdZZjq0Pp49xohXNa58S1AZXGJBvvQ6LUDRfDuZRviF2L9
	4C0ozg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t8412-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:22:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e869e00005so61798485ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082138; x=1793686938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
        b=OIG68irWumdoQjVhk0a2wDNij88TpZiTY4EI/MU9tLqDvuS0I6/q43D7OXY4aUXCth
         GdZhwoWyARcBXIEodIdcEXuxbxgDTAjLYGBsGjp7BlfbjSYG6Au9PHa/blZXvz6MIhsH
         ViOOMJvQw5cM9CbPFyAtzSYOOw5bfBjDUiMvczu+WFguRIlkLdr7xAj1cxCCCv1Hq8WQ
         MrjlbKwi8ZUHo8anZqd7LuUSdr8YNALXZ2R2Ajn5vFlOx4iQ4jTqlTaYy8EnWYHivTd0
         jpjkrOOivGNyx3W2qDBTVUPieIpR0NChp/ZihVpC2MGAwHzvRaQQ8X59mpxRAUmyB7ug
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082138; x=1793686938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
        b=brJox9uqTaDSKEyMTxIi8rIXYSyLFXJ77MgOdiRs0yOx8q6C+LhQ4U20FdteE7DSvr
         GVfgkDSIzYvIwUm2+phpsM1F7Qd/FRqtBKwoFtQ2oZMK+UWsS59FwVlpNy9y0WFfEdke
         TsPCcAFcDRrHg5I/oA8XhhGh2J1spmr8mQmxe9MoXJyEVLsEniSOb5JrmgnvgUOCycww
         ujmWFRVfjtj95Ljbo3suOBdKLlA3QVCOdmMWaY8+qZQ6TyabYuu2Tpf5xqrn/OxY1CX9
         DDmk4ZLRIHocpH59tLFrr5GafixjbcphdxDttuyHQASm/QrNr02oKE4abdLeByN/iIwm
         IH2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2fRTPtL1Oo3FAKc5b1N0ADkGrQCsD0RuKkwGHJEjPTRG1Xqk77CNEuOUT92OahEbTKBlmoIFc4575ai0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvwjoZFxC1ZZ2ouQujcPkWvSZ7YdC8kAtD8WW06Tvs97cXvzfs
	DC+3hFFIimZq8Widif/pQXnEIA5FHgRYTk6pwcKvjT3abp6YDVHUeIybGIbBc7r9bWdq3Osebd2
	9z4nlQJaQL/wCWl9i7jjXkKA3CZNuRqJ4R1qHXr4spIuEjKMh56c9+W05QkwprU3Mh5I=
X-Gm-Gg: AYBFou0GwwV6C5Idb6vzR35JjELZ4IJIDcwD16T0G7NKdtaeSO8Pdp2K9h5L16dKDvz
	KMCXyM3ToiZNhMFhFEwRwBDYZkZLqXL60emU4bciGmRhGj/4DAHTWD1qfpoav06AHP991ic1hk3
	AIFcugm2N/gLW+0P7NJqhG9ihOQZJzRadc40Kivj3n/DfJvQTBA1+c5uXWDDrDpq+DjKL/6NISe
	+JmA1jb/FGy99NQqnMh0JMbtFlbcIIhVWiZaonZnvVURkhksjdCSkJbQMy5F5RDa99ewtGspfXo
	3BUB16W4ZQ3vcm2iaf4wwRD1E8peSUlyzDgTf6w9LQG9FqsM+YzwQ7jT+RxpI+pPePX75H7QXBB
	hPn3Qjt20w/xOavvhyRQqJQ3W85MFZFI7
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr72075685ad.22.1793082137705;
        Mon, 26 Oct 2026 23:22:17 -0700 (PDT)
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr72075355ad.22.1793082137217;
        Mon, 26 Oct 2026 23:22:17 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm4003565ad.24.2026.10.26.23.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:22:16 -0700 (PDT)
Message-ID: <92dc14f4-edf3-4112-88d3-1b93aac677a8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:52:11 +0530
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
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
 <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
 <20261026130559.GB3598537-robh@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261026130559.GB3598537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0431a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=zuAiZn09hdMMTQJ27doA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JyryOAN3AZ-QzFcJ3cIC2gzoVWiRZOyg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX2G5h7W7VUiOe
 zaaPOfZdF+KmwZPSFXvNT88dO3BqZ3ZZBgzV8800ycvAaJPvOCnHQiYFDQGIectWWIana6xAzHN
 u9DVw1DSavUqmKAmgZfM6Htt2d85e+g=
X-Proofpoint-ORIG-GUID: JyryOAN3AZ-QzFcJ3cIC2gzoVWiRZOyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX5Dr5MyT3AIEm
 Z/i9Gi9+zv6WGKqsvwEpR/gwsMzHxht6zF31f7JSoXhiTj7DsbQD8oj+9lkDj3izoHycO50cVJz
 tXoVCQ266isbgKedpVN473vtKDut01AIBcpkIxJxAmRItIwm8h8yIyQfiwyxd2AP0JfaQ2NXgpL
 SazFc371fvl2TxDyWbMHiZuiZ4wAQrzZ3r37vmZ0AN+b2RI4OTTgJnLopc8NNKYaN+/XhtsxO/J
 QfCjpJ5He6ZFpkUO3C5hrg9gw5O4xoEas+hUjIDxPIPtlMjbM8Td65GqVjTf/f4uj/fGLKAVIiq
 SGqUaqlYq5S6m7En3ZUv9soimDERTdB0t/ZicXBqbM1Etu5AKfDQJ5BuinkXZPkZNqFdtIeU5zT
 pcN74ml4bGktKj87Am7CfrvSzB0iXcsS6AEvCAY2G7nmtDynalMH3eC9jzTm88X43h0uDav9NEK
 QfGjmRyVtzN2/wzcEWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270025


On 26-10-2026 06:35 pm, Rob Herring wrote:
> On Fri, Oct 23, 2026 at 12:05:50PM +0530, Vishnu Santhosh wrote:
>> On 22-10-2026 07:31 pm, Rob Herring wrote:
>>> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>>>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>>>> arbitrary host memory.
>>>>
>>>> Add an optional memory-region property to constrain DMA allocations made
>>>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>>>> for the remote execution environment are managed separately.
>>> dma-ranges is normally how address restrictions for a device are
>>> defined. Why can't that be used here?
>>>
>>> Rob
>> The constraint here is access permission, not addressing. The modem can
>> only access a carve-out that is assigned to it through SCM.
> The reason for the constraint doesn't really matter.

Ok, understood.

>
>> The soc bus on Shikra already has an identity dma-ranges covering
>> 64GB [1], so there is no addressing limitation to describe. dma-ranges
>> does not reserve memory, so allocations would still come from the
>> general page allocator, outside the assigned carve-out, and modem
>> accesses to them trigger an XPU violation. It also applies to every
>> device on the bus.
> It's a bit awkward that dma-ranges needs to be in a parent node. So you
> would need to put the device in its own bus node. But if dma-ranges is
> in place, DMA allocations will only come from within that range.

Thanks for the correction.

>
>
>> The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
>> provides a dedicated, per-device region, which is the setup it was
>> introduced for no IOMMU, with firmware restricting device accesses to
>> specific regions [2]. Stephan suggested this approach on v1 of the
>> BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
>> same pool, so a single assignment covers both the descriptor FIFOs and
>> the data buffers.
> I suppose that since the memory region is dynamic, 'memory-region' makes
> sense here. If firmware determined the address of the region, I'd
> probably feel differently.

Yes, the region is dynamic. Thanks for the review.

Vishnu

