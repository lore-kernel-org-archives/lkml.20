Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F3E52ED54
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868937; cv=none; b=Yx7U3xf+lhpelaI8vjxAuGGo8EFbahUqoNr9b+KN4P2G6mHRXvBuBcmKxpBLL0scFxqZkfT3HzJj6VZ2nXQ8Vk3rt5wR+NlY3BsRwx4+YsPxbwdnPG3tAh9b5vqOVifwpL4dC92e5r6qTj6L0/40dEUhZAdQrvw1ZQJxLAVoyj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868937; c=relaxed/simple;
	bh=V8LzZDNRSHpXsrsaJgifKvrZ1bSHxrIoEEGNdKI1KyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cI8fD/ZgkZ4iHztLBKrBV6eTf4PcsB5W7nQFlFRD7zHo2sZGH+HyniUThMzW9LJjREB8lusubAB3LzxJqP3TP9czpzKmgJzCATdGrHVdpEXQmMqmIXW/SK/8IFRsSpO0YICnPcE0ZjofRhHIDCmhYBMFwMyguVfyfhAVlbRBmrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chlGU4yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWD2u7a6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chlGU4yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWD2u7a6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjsFg1304109
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WtuAM6RIWKoXNBxbiMadF4vNcNAmXDJaNWBEh9E7+xo=; b=chlGU4yKa2fEbgAg
	dK0YfsITx83vLtMxdpl1E7LgsSHqh10viqnUYsn6ibW3m+1eeZlIM+z60ZjmPdm8
	sUsKNKxsSJQ5gF9gG14t1v9OXWPgU45rzBe5rurf42eBbuWp3QbuYEF+jG+2mQEO
	kz6r2zNqIMOnXtRuz73YDjF7L8OzBfSnIyf8yfYUAVz6pThJkuWyPWzCd4MjQxJ8
	lCPSfK0Q6wnC+aOPmvc80UoOAi4EaAm5vOexw6QXvZiMWXwfsl0gCyIbt4TMuvHM
	Le5FvJNFyfj5Z+6z1g4nJArRv22h+PstweSsahy2sBYzXlYJt+7LNJupMsbwvDNl
	cs1xbQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5cryc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:35:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso10462100a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790868933; x=1791473733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtuAM6RIWKoXNBxbiMadF4vNcNAmXDJaNWBEh9E7+xo=;
        b=XWD2u7a6Zfo17opz1cpxppLMT2bDofNcrLkndkRmGLLULSEknw4TR9v8YpzR7DPYEm
         SWGungTFTJutx3zmGmor0zEfLB5HNQ0YpVO54wxuKtFEHrkxA++1DS7kE7QYvIfVJyw0
         9cfz/rf5eCQRqwtgRCvZusv3hjI1lSbv9lUqWRBVPZLV84Rvkd9JHgCjJ/q2OBTGGVEg
         BHakpFDNER5Vr2CfWNOjY7UGZATUf9Q4zyc0SSuKScuE8oHT9qzgr+juqRASXIWCdvfr
         lhBncmbYUek2bEcWk18nSQBCBytf1sIyFgqagL/ENPCSfwitg547EGjHzQokspBppqlb
         vALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790868933; x=1791473733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtuAM6RIWKoXNBxbiMadF4vNcNAmXDJaNWBEh9E7+xo=;
        b=VQki97DXLbRkxY3vwXJOx+hFdT7CEbvDQvWZ7kRZWaH8yLgRA5qPBWWq3Ikxg+LrEW
         FycgYq2vERxB34ZMd0V+LWjGi0YZlzYGlATOJGjmY42o1Gagh0gclO/aDd3Q5bTNWS2W
         /+k4AIaQKBwq7xLdhjZtXMCXzxwvGUA2N/mM4a9N8ZDe77291GAramILpxva/+YpwpSF
         rfRnoY2CA0XRNtXp9NlLuanrbzgSulcAhvxfSH0YSIfAocSUU7FyxOwfYN2HWtvDVdcF
         mhjA07xHj0QGg92xJ5uuOniUJO/26S+30q8P7Q58AoAkP2Bw+1u0+1gRM9oRlhZa9vqD
         2vLA==
X-Forwarded-Encrypted: i=1; AKwUvByBTHzUq/JRIp3nlUgdLRjksIf1ELlwLrHr/4j9vA3O92HCGUVyePorKilaxgwAssPIJBUg1QUOfPxPce8=@vger.kernel.org
X-Gm-Message-State: AFuF++n1I8gpFKDLpTfabRexreSz1yWh7W6CwNPyaUSpBLweTob550zY
	UvyAoc8Nr4UHXrVxkMXVq88RXLhKbGuPw88nt3ZcYPC6R3wRWotKnF3GZV4R5odLpdj4IzHQvMy
	LWny8sXqOvo9ZgEA8ypGAFAUrLZaQi0c9uRZrZ6RIb7UCmBFvTPGh7cTGyFg3xWP2UCU=
X-Gm-Gg: AYBFou1gsmKAMTKhafVN2vCGXoTfD2mYh1r1zSgz2HKYWY94jy41Vw5nJIEanz/28H3
	LAqqUCZO78EyA6Nzx7KGXxtAiOpj3cth677G8O0O2QQ17LnF8Buv2z/DaEk6PMXCJeFxu+teAoP
	WCIUd58YSuDei+c5davlqKtVESrroxOkYKT6qNnHEDkCtnUX9euUpqme+nAFA06Pq1klC88t1HC
	LTQhfgbSZ8nwEbIJa1KJbl2xa8xJB4UoN7vwSmzTV/V9rwex4H2wh/XyEPFs4/obg0xWD6Efo0/
	C4Z0eVQD03Fbr4gsP3N3KZv8EkCMrjLYe6kLHDODlEMiCiCYWl1or6Da7VuvA+GsU44hUBRoVS4
	D3ptcHwHvt1cpsk6adqwEz2ikwXsjigCmIG/P
X-Received: by 2002:a05:6a00:a253:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-8874ab8ca2amr4090880b3a.22.1790868933297;
        Thu, 01 Oct 2026 08:35:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:a253:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-8874ab8ca2amr4090853b3a.22.1790868932628;
        Thu, 01 Oct 2026 08:35:32 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888197ce56bsm1306006b3a.47.2026.10.01.08.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:35:32 -0700 (PDT)
Message-ID: <6c02394a-3b89-4949-8e6c-5063ba1204f3@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 21:05:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, deepak.singh@oss.qualcomm.com
References: <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com>
 <178996250389.2160803.17277339384338088713@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <178996250389.2160803.17277339384338088713@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MiBTYWx0ZWRfXzld26VAFvGaB
 xecFBLzjYgFu8BttAJw1KYObZiJounFHjFfkl/1xbth/P5bOg1cDEQMGLWyymjJ405mBEmetxKR
 txzLZGeqhc1mBh+7DwUIPy6zbAVood6ICZJFf5Ll8PTZaT35ocIPkNcopGBQHDdPIidOajj9nju
 iyiEW+wpwAHwPbqlBZ9frdr6PrQs4yMoGDiZZPaF7ptSoFeB91PZXwEUv3HsJfa+bophYnJLKri
 bY3SKD5DA8DgGyGYho36/W+HxkmwhGLFtalW/lN8zWHxKZfnaLHYQLtuo44zxe75I0Cjc1V2uxJ
 PaONuMwh52sSXxgfUiX2OUXKkghTs9ZbjR6bj5WlgMZwuT5sY6we4MgslXPP8IrKphgxQFLW95w
 NZ4Vc1zoqoROSN0xGUIlkyLCMmYR08ABgF2jpeYBUg1unL3jzhk9WhPBOKl9eD+hHAyhk97ACT8
 RYMrYTym9ITQyfZ+afQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MiBTYWx0ZWRfX8fnS50gicxbF
 iZ4VjWxLNq8IGyY62cIIoAc4yEQdNoMbGJjcPXzxy3u8P7wYhiG9jbcgbdJBSBsCwBcNRg3naLN
 iLWyNFIte468xblW7rwHnZBTIQQIpw8=
X-Proofpoint-ORIG-GUID: kQLIWa3z0ChbMu2PzN3Xon7Kl4m_ILLr
X-Proofpoint-GUID: kQLIWa3z0ChbMu2PzN3Xon7Kl4m_ILLr
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe7dc6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lb-GL4qFdiP8F84B88gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010062


On 21-09-2026 09:18 am, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential
> issue(s) to consider.
>
> Critical: 0 · High: 3 · Medium: 3 · Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] bam_dmux_probe()'s err_disable_pm label
>    (drivers/net/wwan/qcom_bam_dmux.c:938-942) calls the new…
> - [High] The feature's stated requirement - that the BAM descriptor FIFOs
>    also live in the SCM-assigned region - cannot be expressed by a…
> - [High] bam_dmux_remove() revokes the remote EE's access to the pool
>    even when the remote has demonstrably not quiesced.
> - [Medium] bam_dmux_assign_dma_pool()
>    (drivers/net/wwan/qcom_bam_dmux.c:770-830) validates only device-tree…
> - [Medium] bam_dmux_assign_dma_pool() accepts any qcom,vmid in 0..63
>    (line 786) and stores dmux->dma_pool_perms =…
> - [Medium] bam_dmux_reclaim_dma_pool()
>    (drivers/net/wwan/qcom_bam_dmux.c:832-852) only logs a failure of…
> - [Low] The qcom,vmid parser in bam_dmux_assign_dma_pool()
>    (drivers/net/wwan/qcom_bam_dmux.c:783-787) accepts values and property…
> - [Low] Binding/driver validation ranges diverge for qcom,vmid:
>    Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml constrains…
>
> --
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> This patch makes qcom_bam_dmux look up the restricted DMA pool referenced
> by memory-region when qcom,vmid is present, and hands the whole pool to
> both HLOS and the remote VMID via qcom_scm_assign_mem() before the DMA
> channels are requested.  The pool is reclaimed for HLOS again on remove
> and on the probe error path.
>
> A few questions about the new code below.
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index cc6ace8d6437..c81e668d4e96 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>
>> @@ -762,6 +767,90 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
>> +{
>> +	struct device *dev = dmux->dev;
>> +	struct device_node *rmem_np;
>> +	struct reserved_mem *rmem;
>> +	struct qcom_scm_vmperm dst[2];
>> +	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
>> +	u32 vmid;
>> +	int ret;
>> +
>> +	if (!of_property_present(dev->of_node, "qcom,vmid"))
>> +		return 0;
>> +
>> +	ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
>> +	if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
>> +		return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
> [Severity: Low]
> Is vmid == 0 intentionally accepted here?  The binding added by
> "dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid
> properties" declares:
>
>    qcom,vmid:
>      minItems: 1
>      maxItems: 1
>      items:
>        minimum: 1
>        maximum: 63
>
> so qcom,vmid = <0> is schema-invalid, but this check only rejects
> QCOM_SCM_VMID_HLOS and values >= 64, and 0 is forwarded as dst[1].vmid to
> qcom_scm_assign_mem().
>
> The maxItems: 1 side is not enforced either.  of_property_read_u32() reads
> just the first cell, so qcom,vmid = <A B> is silently truncated rather than
> rejected.  Would of_property_count_u32_elems() (or the read_variable
> helper) be a better fit so a malformed list fails with the clear "Invalid
> qcom,vmid" diagnostic instead of a firmware rejection later?

The value range and number of cells are validated by the binding, so I
would prefer not to duplicate those checks in the driver. The driver
only rejects values it cannot handle: VMIDs that do not fit in the
64-bit SCM permission mask, and HLOS, which is already part of the
destination list.

>
> [Severity: Low]
> Related: the binding's numeric range 1..63 includes QCOM_SCM_VMID_HLOS
> (0x3, include/dt-bindings/firmware/qcom,scm.h), and the prose note that the
> local execution environment must not be specified is not encoded in the
> schema.  So qcom,vmid = <QCOM_SCM_VMID_HLOS> passes dt_binding_check while
> this check fails probe with -EINVAL.  Could the schema express the
> exclusion so the constraint is machine-checkable?

I plan to drop the sentence about the local execution environment from
the binding in the next revision, so the binding text and schema are
consistent. The driver keeps rejecting HLOS at probe.

>
>> +
>> +	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
>> +		return dev_err_probe(dev, -EOPNOTSUPP,
>> +				     "qcom,vmid requires DMA_RESTRICTED_POOL\n");
>> +
>> +	rmem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
>> +	if (!rmem_np)
>> +		return dev_err_probe(dev, -EINVAL,
>> +					     "qcom,vmid requires memory-region\n");
>> +
>> +	if (!of_device_is_compatible(rmem_np, "restricted-dma-pool")) {
>> +		of_node_put(rmem_np);
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "memory-region must reference a restricted DMA pool\n");
>> +	}
>> +
>> +	rmem = of_reserved_mem_lookup(rmem_np);
>> +	of_node_put(rmem_np);
>> +	if (!rmem)
>> +		return dev_err_probe(dev, -EINVAL,
>> +					     "Failed to look up restricted DMA pool\n");
> [Severity: Medium]
> These checks confirm the device tree text (memory-region index 0 is
> compatible with restricted-dma-pool, and the reserved_mem descriptor
> exists), but is there anything here that confirms the pool actually backs
> this device's DMA path, i.e. that dev->dma_io_tlb_mem points at it?
>
> Attaching the pool is best-effort in the DMA core.  In
> of_dma_configure_id(), the restricted pool is only installed when the
> device was not claimed by an IOMMU:
>
> drivers/of/device.c:of_dma_configure_id() {
> 	...
> 	if (ret)
> 		of_dma_set_restricted_buffer(dev, np);
> 	...
> }
>
> and of_dma_set_restricted_buffer() additionally requires the node to be
> available and only warns on failure:
>
> 	if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
> 	    of_device_is_available(it.node)) {
> 		if (of_reserved_mem_device_init_by_idx(dev, of_node, i))
> 			dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
>
> rmem_swiotlb_device_init() can also legitimately fail, for example:
>
> kernel/dma/swiotlb.c:rmem_swiotlb_device_init() {
> 	if (PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> 		dev_err(dev, "Restricted DMA pool must be accessible within the linear mapping.");
> 		return -EINVAL;
> 	}
>
> In all of those cases probe still succeeds, the pool is still granted to
> the modem, and bam_dmux_skb_dma_map()'s dma_map_single() returns addresses
> outside the assigned region.  The commit message states:
>
>    "This ensures that BAM-DMUX mappings are within the assigned region."
>
> Can that hold without checking the device's effective DMA backend (for
> example is_swiotlb_for_alloc(dev) / dev->dma_io_tlb_mem) after
> of_dma_configure() has run?

Agreed. I plan to check is_swiotlb_for_alloc(dev) before the SCM
assignment, so probe fails if the DMA core did not attach the
restricted pool (e.g. IOMMU present, pool node disabled or pool
initialisation failed). I will test this and include it in the next
revision.

>
>> +
>> +	if (!qcom_scm_is_available())
>> +		return -EPROBE_DEFER;
>> +
>> +	dst[0].vmid = QCOM_SCM_VMID_HLOS;
>> +	dst[0].perm = QCOM_SCM_PERM_RW;
>> +	dst[1].vmid = vmid;
>> +	dst[1].perm = QCOM_SCM_PERM_RW;
>> +
>> +	ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
>> +				  ARRAY_SIZE(dst));
> [Severity: High]
> This assigns the pool referenced by the bam-dmux consumer node, but the
> BAM descriptor FIFOs are allocated against the BAM DMA controller device:
>
> drivers/dma/qcom/bam_dma.c:bam_alloc_chan() {
> 	...
> 	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
> 					&bchan->fifo_phys, GFP_KERNEL);
> 	...
> }
>
> so the FIFO follows the controller's DMA configuration, not the consumer's
> restricted pool.  The commit message says:
>
>    "When the BAM DMA controller references the same pool, its descriptor
>    FIFOs are covered by the assignment as well."
>
> How is a device tree supposed to express that?  Adding
> memory-region = <&pool> to the qcom,bam-dma node does not validate, since
> Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml defines no
> memory-region property and ends with:
>
>    additionalProperties: false
>
> Without that binding change, do the descriptor FIFOs stay outside the
> assigned region, which is the access the commit message describes as
> triggering an XPU violation?

This is covered by a separate binding change,
"dt-bindings: dma: qcom,bam-dma: Allow memory-region property":

https://lore.kernel.org/all/20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com/

With memory-region on the BAM DMA controller node, the restricted pool
is attached to the controller and dma_alloc_wc() allocates the
descriptor FIFOs from it, without BAM DMA driver changes.

>
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "SCM assign restricted DMA pool failed\n");
>> +
>> +	dmux->dma_pool_base = rmem->base;
>> +	dmux->dma_pool_size = rmem->size;
>> +	/* Track the destination VMIDs explicitly for the reclaim operation. */
>> +	dmux->dma_pool_perms = BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vmid);
> [Severity: Medium]
> The check above allows any vmid up to 63, and the bit is recorded here with
> BIT_ULL() and later passed as the srcvm bitmap to qcom_scm_assign_mem().
> Does that work on a 32-bit build?  The SCM helper sizes the source array
> with hweight64() but decodes it with the unsigned-long-wide BIT():
>
> drivers/firmware/qcom/qcom_scm.c:qcom_scm_assign_mem() {
> 	src_sz = hweight64(srcvm_bits) * sizeof(*src);
> 	...
> 	for (b = 0; b < BITS_PER_TYPE(u64); b++) {
> 		if (srcvm_bits & BIT(b))
> 			src[i++] = cpu_to_le32(b);
> 	}
> 	...
> 		next_vm |= BIT(newvm->vmid);
> }
>
> On a 32-bit kernel a vmid >= 32 is counted but never emitted, and
> qcom_tzmem_alloc() uses gen_pool_alloc() without zeroing, so the skipped
> src[] slot reaches the secure monitor with stale bytes.  This driver also
> covers 32-bit SoCs, and the binding example uses QCOM_SCM_VMID_NAV (0x2B,
> 43).  Should the accepted range match what the SCM bitmap plumbing can
> actually represent?

This is a limitation of qcom_scm_assign_mem() itself, not specific to
BAM-DMUX. This should be fixed separately in qcom_scm.c. BAM-DMUX already
tracks owner set explicitly with BIT_ULL() and does not rely on the srcvm
value returned by qcom_scm_assign_mem(), so it will work as is once the
helper is fixed.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
>> +{
>> +	struct qcom_scm_vmperm hlos = {
>> +		.vmid = QCOM_SCM_VMID_HLOS,
>> +		.perm = QCOM_SCM_PERM_RW,
>> +	};
>> +	u64 src = dmux->dma_pool_perms;
>> +	int ret;
>> +
>> +	if (!dmux->dma_pool_perms)
>> +		return;
>> +
>> +	ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
>> +				  &hlos, 1);
>> +	if (ret) {
>> +		dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
>> +		return;
>> +	}
> [Severity: Medium]
> When this reclaim fails, dma_pool_perms is left set and the region stays
> owned by {HLOS, remote VMID}, but that state only lives in the devm
> allocated struct bam_dmux, which goes away once probe returns or remove()
> finishes.
>
> Does that make the condition unrecoverable?  A later re-bind or module
> reload enters bam_dmux_assign_dma_pool() with the hard-coded source set:
>
> 	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
>
> which no longer matches the real owner set, so the assign is rejected and
> the device cannot be used again without a reboot.  Would it be better to
> propagate the failure (or retry) instead of only logging it?

remove() cannot propagate an error. If the reclaim fails, the pool stays
shared with the remote. This is safe, as the pool is a static
reserved-memory region that is never returned to the page allocator.

A later rebind then fails until reboot. This only happens after the
firmware has rejected the reclaim, and matches the existing
qcom_scm_assign_mem() users (rmtfs_mem, q6v5_mss), which also only log
reclaim failures. Retrying at the next probe would require assuming the
previous owner set, so I would prefer to keep it simple.

>
>> +
>> +	dmux->dma_pool_perms = 0;
>> +}
>> +
>>   static int bam_dmux_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
> [ ... ]
>
>> @@ -845,6 +938,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   err_disable_pm:
>>   	pm_runtime_disable(dev);
>>   	pm_runtime_dont_use_autosuspend(dev);
>> +	bam_dmux_reclaim_dma_pool(dmux);
>>   	return ret;
>>   }
> [Severity: High]
> Can this path revoke the remote VMID's access while the RX pipe and its
> mappings are still live?
>
> The pc IRQ is registered before the last fallible probe step:
>
> 	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
> 					IRQF_ONESHOT, NULL, dmux);
> 	if (ret)
> 		goto err_disable_pm;
>
> 	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
> 				    &dmux->pc_state);
> 	if (ret)
> 		goto err_disable_pm;
>
> bam_dmux_pc_irq() -> bam_dmux_power_on() does dma_request_chan(dev, "rx")
> and queues BAM_DMUX_NUM_SKB RX buffers mapped out of the restricted pool,
> then acks the modem.  If probe then fails here, err_disable_pm calls the
> reclaim without disable_irq(dmux->pc_irq), bam_dmux_power_off() or
> bam_dmux_free_skbs(), and devres only frees the IRQs (and the devm
> allocated dmux) after probe returns, so the handler can even re-arm RX DMA
> into an already-reclaimed pool.
>
> bam_dmux_remove() establishes the ordering the commit message describes:
>
> 	disable_irq(dmux->pc_irq);
> 	bam_dmux_power_off(dmux);
> 	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> 	bam_dmux_reclaim_dma_pool(dmux);
>
> The commit message says the pool is reclaimed "after DMA channels and
> mappings are released during remove or probe error cleanup".  Should the
> error path mirror that sequence?

Agreed, the late error path should tear down everything the PC IRQ may
already have set up. I plan to reuse bam_dmux_remove() for this, which
disables the IRQ and releases the DMA channels, mappings and any
registered netdevs before reclaiming the pool, in the same order as a
regular remove. I will test this and include it in the next revision.

>
>>   
>> @@ -879,6 +973,7 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>   	disable_irq(dmux->pc_irq);
>>   	bam_dmux_power_off(dmux);
>>   	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
>> +	bam_dmux_reclaim_dma_pool(dmux);
>>   }
> [Severity: High]
> Is it safe to reclaim unconditionally here when the remote side did not
> quiesce?  Just above, the timeout result is only logged:
>
> 	if (!wait_event_timeout(dmux->pc_wait, !dmux->rx, BAM_DMUX_REMOTE_TIMEOUT))
> 		dev_err(dev, "Timed out waiting for remote side to suspend\n");
>
> Control flow is unchanged, so bam_dmux_power_off() and the new reclaim run
> anyway and the modem loses RW on the pool while it may still be fetching
> descriptors from it.
>
> Local teardown is not guaranteed either.  dma_release_channel() reaches
> bam_free_chan(), which can bail before resetting the pipe and freeing the
> FIFO:
>
> drivers/dma/qcom/bam_dma.c:bam_free_chan() {
> 	ret = pm_runtime_get_sync(bdev->dev);
> 	if (ret < 0)
> 		return;
> 	...
> }
>
> leaving the BAM pipe programmed with a descriptor FIFO address inside the
> region whose permission was just revoked.  Should the reclaim be skipped
> (or deferred) when the remote has not acked the power-down?

Agreed. I plan to skip the reclaim when the remote side did not
acknowledge the power-down, and leave the pool assigned. This is safe,
as the pool is a static reserved-memory region that is never returned
to the page allocator. I will test this and include it in the next
revision.

Thanks,
Vishnu

>
