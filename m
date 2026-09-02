Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66076233954
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329051; cv=none; b=NAKgRBWGx3Wf156KmiEh8GVe1q9u+4XqZNLZJRmZY8ZvZRutrEoSumjgafCN1BjABeW3XESa6IO6YpOCfxvbGlNVDy0DIfV/e1FTUkWE70xQexosDQhWPASei2f/2Rb3C37GHw69G69wUGrIXxA3SC6wubgH8a7djmFBXU54EOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329051; c=relaxed/simple;
	bh=7LJSWkmq3ppKNYr+m+kgGvPZvJqaRSt1SjcTvIaHnho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhR/mmvOREas7oCKIlsHQQPON46IcLJEy5yiqG3IT3QUwIVlWYLS+xinE8hC2wODfsiV5EPRhRRjEZYEHMHMjslX22H/TEcNhb7L+4pufmzvvPa0/2VwzbIfkcOS5mNWyJ/WFu4VP6Jkuq6QHjZAdhEAt2IYUfWe6tDGwpoHv6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReBNEIfr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAXV4WJp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReBNEIfr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAXV4WJp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YKOk1076178
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 06:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ET/maoaamnCBnWTRUAQoiVjvEy49DBpiUkyDUca7+Q=; b=ReBNEIfrdyXShGa7
	p52DjJb4zJvnMmbhLP3R++XNz2S+RTWimhKws1LkOL7F3YU+49oYQ3y82GN+U/Ap
	ckTP2npv/CD8JCgLcWyluk5CW6ilPUMkzWz/oQgXE9pyW89h+fSv6GtRDDBIFlHv
	mxm0Gw7QKGWhixiISU0NKgiMIybKWlG7Idup8SSgngOpK6PiSEgLemD9iL3aM+Vi
	UM1jmLWr0cdo5YLUuCmKIaULlG4HQ0RWgShiayrBlcfB0OM9H3minMzM1I8sXH4V
	n02OQzNaK42dHVh5roAXskSBFUQ+l/ska6ei1LXMycVdOHpSlo/OuV1hRICu2rCQ
	PUBPYg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt3qa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:04:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so980222a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329048; x=1788933848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ET/maoaamnCBnWTRUAQoiVjvEy49DBpiUkyDUca7+Q=;
        b=UAXV4WJp+IhidQ2Q0LnbQFnBQX1YdCkpmjNNm7Gm3em4PWEQnKcNPb8C4L6ozwxhib
         iRGXUPZRX/JCRjT8X19XDZxnbSLmtzvHHQPmqBfK9RzaqzBKuv+73qAtPhpJV7tFuBMb
         k9CNBqU8n/a2arG1kKRAF9EJJYpiASU1EfvtL4N9rFlRdeZmTdLxdILrHZmuZqY8CcGv
         +vOhgBFkZPOghHCnNFxCdzgjBi6d05nFV2QaABBPo/+OMPmxDAIFlgblD2sAiXQuOHVD
         gpqbHLiubjrY8M5VExKikUiYse1Jtmk0z91QHVac7aeZUL/Ut42JXYHNbpPiXEr9TEYv
         BYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329048; x=1788933848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ET/maoaamnCBnWTRUAQoiVjvEy49DBpiUkyDUca7+Q=;
        b=p9f6qGcTyF7NOpRfIgjRFSN9G343tTyjznDxMrQqAGz4SWpOrrVN88CnRjqEvEcIF+
         vBnLCnW0x5kBVYyghlTc6itjOGtCk/Lcj88a3dsNQg93evfT4M1nvj3w1R7xdLilBg7L
         +Dxj2KOTeET3lWhtGiKXw3Zrg55tE8IuqeQ9m0wgJSuOb9SRmj+8PW3IMr+6ce3mKIFR
         0sjj1umgsnm0bmGZQgKj4kgpTM95ShbDgbeWlqBYoMLuxSqyhEESW+6ekLvc/Lk2BMxz
         MT1/irozm822XtbXmx1D38av50H8jCuFsMTAOwPdpXtahD2d4GSH0qtTeExavUr5KaUc
         Qg1g==
X-Forwarded-Encrypted: i=1; AHgh+RrBWgs7tSTUPU0QTVcq3L4WX4BXvlXj+znCwwXTRmbgIMxhNzh8Pyb73ldAiglmXjbq9yKmUEV5TL7/bU4=@vger.kernel.org
X-Gm-Message-State: AFuF++ndii/nFFP6Nw4jTTpJsxQlQnw2MoD9I6+AOKGRAQpfUI8Ulj3j
	c3zIjcGT2ZA64BlX64JJ4D7gvsjmNTD4sOYLdHDOSFInorEbJUJTs8Q1Jv40OkbovSZ0hAmyZ6U
	3XBj0wv40s7No1xULtM3l04rPhv/QfdJX2jd04tjXCDEDwMP5uYZXc36fkETbGeALOvE=
X-Gm-Gg: AR+sD13d9kcvoLvVJatDx/B/tfRux4OYKtOiD0OdZhKC/pz1PbNqH2cHhqePohEjeeq
	yJOgobyeI7CABrXXEspoqoWfGSNTQ8WpA9cAbzNyjrIFVvCZQi6rXEADaHqfSOoSQVS7E6X9/Lo
	Swk4qBNWqSO7vBg8AbzZCiC8KF4xFmcSRp7ktEmBa6q6v18bf96BYE9wlndpi3/nfaf/jxBESfU
	8McrFpbH3ENLjKGjWbiWr5uV2YnuJdJZ5uaKaTNyTVJynfWvrBTGTTGw8l/nsaZrmCUI/4UGZ/r
	U5FkKKrC8zPKesPj+PWjIy398eukr1AkqN8gWC8mlA2kJpCm8ytIShcC+k3heAI8pNrVDkcdhMd
	/BJifn4cYMCaW/FOyzm5E
X-Received: by 2002:a05:6a20:2591:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3d9aca491f4mr3675124637.3.1788329048037;
        Tue, 01 Sep 2026 23:04:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:2591:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3d9aca491f4mr3675045637.3.1788329047539;
        Tue, 01 Sep 2026 23:04:07 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d036d0asm528281a12.27.2026.09.01.23.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:04:06 -0700 (PDT)
Message-ID: <fe4ff38a-a102-4ff8-a745-6ccb115e33ba@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:04:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] Add Qualcomm extended CTI support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfXyFCDf6nbvU8l
 GTUD5h8CHuZGEWyw6vY0iXyO3dJdmaBMowa29V7+EwU4TMAtu2/vHgae1/hE7sJE0Ve3EmnHzd5
 Qnv7/g+DgutGOS5uF7mKY/Yaxr33saZp+S7kqdlmzIue+IZ1WjlBDfdufO43+oRFt8Zz/YEjLsD
 s3GRaUaUyMol61XkvGoY5ZWU33Rp1lfdd+i8QX7jP9s6yd0khfTZ2cBwXY9qHu46jRETaach5bN
 8P0enLUQplcR5O5ajXyzPByPjAeeYYeq+5K7Pxe15zwfX2VB8Dfrn4pUrU8CTuZwzgpYOqcapPe
 ZIuSFoGHFmdN35qs0D5fM9lMpDROixZBHtcRu4gid/VGOOC3Ds/9Fani5Y9TRGaEHEXCXovgpex
 lHBfBSAafXzThBOcem0P8peQ3YU2M4f6aeuO10fOPogf9fwyCiwlD4jj6Krr8qzJbgiSNc9nIZw
 Bo1aa+046tb5ud3vQ5Q==
X-Proofpoint-ORIG-GUID: MeKthIfLRhS_7bpdMWvFKKhWGoYcYum9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX1LBZPmBXOmG9
 LuF/CXgGreA5XsJNCgMkS06BKLO3dc0wnr3Sytbtk+kzJXl5PX7JbaQtodzGUshCj1fo+vl/R4h
 QLMtt6PBhr7JIK5/J0i+TtXsBsYYB7E=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97bc59 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZywOREiRFUGGO-y_rKIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MeKthIfLRhS_7bpdMWvFKKhWGoYcYum9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020051



On 6/15/2026 8:32 PM, Yingchao Deng wrote:
> The Qualcomm extended CTI is a heavily parameterized version of ARM’s
> CSCTI. It allows a debugger to send to trigger events to a processor or to
> send a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs.
> 
> Qualcomm extended CTI supports up to 128 triggers. And some of the register
> offsets are changed.
> 
> The commands to configure CTI triggers are the same as ARM's CTI.
> 

Gentle reminder

> Changes in v10:
> 1. rebase on top of linux-next-20260609.
> 2. patch 1: Add a bounds check in cti_allocate_trig_con() to guard
>     against in_sigs / out_sigs exceeding nr_trig_max; carry forward
>     Reviewed-by tag from v8/v9.
> 3. patch 2: Move __reg_addr(), cti_read/write_single_reg() helpers into
>     coresight-cti.h as static inlines; add cti_read/write_single_reg_index()
>     variants.
> 4. patch 3: Replace the direct CLAIMSET clear-to-zero with thin wrapper
>     helpers (cti_claim_device, cti_disclaim_device_unlocked,
>     cti_clear_self_claim_tag) that early-return when is_qcom_cti is set,
>     bypassing claim operations entirely for Qualcomm CTIs. Fold qcom-cti.h
>     into coresight-cti.h
> 5. patch 4: Add Reviewed-by tag.
> 6. patch 5: New patch. Document the banked trigger status and integration
>     test registers added in patch 4 (triginstatus[1-3], trigoutstatus[1-3],
>     ittrigin[1-3], ittrigout[1-3], ittrigoutack[1-3], ittriginack[1-3]).
>     Also document the previously undocumented base integration test
>     registers (itctrl, itchin, itchinack, ittrigin, ittriginack, itchout,
>     itchoutack, ittrigout, ittrigoutack) introduced in kernel 5.7.
> 
> Changes in v9:
> 1. rebase on top of linux-next-20260518.
> 2. patch 2: Replace the "encode index into offset high bits" scheme with a cleaner
>     __reg_addr(drvdata, off, index) helper; update cti_read/write_single_reg() to
>     take separate off and index arguments; add u32 index field to cs_off_attribute
>     (moved to coresight-priv.h); drop CTI_REG_SET/GET/CLR_NR macros and
>     <linux/bitfield.h>; update commit subject accordingly.
> 3. patch 4: Add three index-aware sysfs macros (coresight_cti_reg_index,
>     _rw_index, _wo_index); replace string-matching visibility logic with
>     cs_off_attribute.index field check;
> Link to v8 - https://lore.kernel.org/all/20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com/
> 
> Changes in v8:
> 1. Rebased on top of linux-next-20260424.
> 2. patch 1: Use devm_bitmap_zalloc() with nr_trig_max instead of per-connection
>     signal counts; add bitmap_zalloc() for filter trigger group.
> 3. patch 2: Add #include <linux/bitfield.h>; move CTIINOUTEN_MAX expansion
>     to patch3.
> 4. patch 3: wrap CLAIMSET clear with CS_UNLOCK/CS_LOCK; move CTIINOUTEN_MAX
>     to 128 here with comment; fix macro alignment in qcom-cti.h.
> 5. patch 4: Make qcom_suffix_registers[] static.
> Link to v7 - https://lore.kernel.org/all/20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com/
> 
> Changes in v7:
> 1. Split the extended CTI support into smaller, logically independent
>     patches to improve reviewability.
> 2. Removed the dual offset-array based register access used in v6 for
>     standard and Qualcomm CTIs. Register addressing is now unified through
>     a single code path by encoding the register index together with the base
>     offset and applying variant-specific translation at the final MMIO
>     access point.
> 3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked
>     register instances on Qualcomm CTIs only. Numbered sysfs nodes are
>     hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
>     derived from nr_trig_max (32 triggers per bank), ensuring that only
>     registers backed by hardware are exposed.
> Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/
> 
> Changes in v6:
> 1. Rename regs_idx to ext_reg_sel and add information in documentation
>     file.
> 2. Reset CLAIMSET to zero for qcom-cti during probe.
> 3. Retrieve idx value under spinlock.
> 4. Use yearless copyright for qcom-cti.h.
> Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/
> 
> Changes in v5:
> 1. Move common part in qcom-cti.h to coresight-cti.h.
> 2. Convert trigger usage fields to dynamic bitmaps and arrays.
> 3. Fix holes in struct cti_config to save some space.
> 4. Revert the previous changes related to the claim tag in
>     cti_enable/disable_hw.
> Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/
> 
> Changes in v4:
> 1. Read the DEVARCH registers to identify Qualcomm CTI.
> 2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
> coresight_cti_reg_store() functions accordingly.
> 3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
> Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/
> 
> Changes in v3:
> 1. Rename is_extended_cti() to of_is_extended_cti().
> 2. Add the missing 'i' when write the CTI trigger registers.
> 3. Convert the multi-line output in sysfs to single line.
> 4. Initialize offset arrays using designated initializer.
> Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/
> 
> Changes in V2:
> 1. Add enum for compatible items.
> 2. Move offset arrays to coresight-cti-core
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
> Yingchao Deng (5):
>        coresight: cti: Convert trigger usage fields to dynamic
>        coresight: cti: use __reg_addr() helper for register access
>        coresight: cti: add Qualcomm extended CTI identification and quirks
>        coresight: cti: expose banked sysfs registers for Qualcomm extended CTI
>        coresight: cti: document banked and missing base CTI sysfs registers
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-cti    |  90 ++++++++++++
>   drivers/hwtracing/coresight/coresight-cti-core.c   | 153 ++++++++++++++-------
>   .../hwtracing/coresight/coresight-cti-platform.c   |  26 ++--
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  89 ++++++++++--
>   drivers/hwtracing/coresight/coresight-cti.h        | 122 ++++++++++++++--
>   drivers/hwtracing/coresight/coresight-priv.h       |   4 +-
>   6 files changed, 404 insertions(+), 80 deletions(-)
> ---
> base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
> change-id: 20260611-extended_cti-dd4971ef98fa
> 
> Best regards,

