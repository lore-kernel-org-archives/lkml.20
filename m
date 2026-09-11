Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60DA485CCB;
	Fri, 11 Sep 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134877; cv=none; b=iIebTfD7DqEib5ki/Dy3cOKlcJivWHKtU9W5t4liGP0R9b7xoJWgtruMWliNEefwZQ22ZH1qpfiqS3CIk4V1gLiMr/BrH8wGCE+YFfb38eBI+lk/1LUsjfC3Rzg05DgZZpy1QLjB2b83ka/HEYMbdZm/Ze2bXXwtlc0nsiLa5Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134877; c=relaxed/simple;
	bh=jNaZSX41aWcJxby9EYz24L6UiyasIfnQPVdk4hbycU0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ejlTxNk/MBqDGqG8cWSZjPUUQehScd7+WaVkOuIu2cfBPVTDk1yMB9MGwDeL9GNbuykuMIWqECjVKKgzYtLRb6F1RZKVPRlydy92R9G4CnQxUmQaqP171S2NCrms/0k6kGEgaRAsNmez61H28PmkzIMvSRLdtzamYKGjt0n3I4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IASyRxe4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IASyRxe4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2631F000FF;
	Fri, 11 Sep 2026 13:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134876;
	bh=nIJiCJqF8BfHgmNB2edySSqGEsv7YxvDYF+XWyNpvg8=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=IASyRxe4A57CX8NSCJFRKEu7/fXVyzXDpmqOrCdBG2DEZX70YZ49BbnJw5YP2pH1W
	 bvQ5NJkXK4SzlQTc9Sr9XrpX7N/RzwP3Dm/0tTaxReJnUBwwztgIB4eEKCzFp6TXoD
	 TdmBUQ1gNh8NZSi9yWrFVVamKpwsL+kqlBxpGCneYA4fAQJHd5uN+QqbmGPvTPbMFY
	 OccQbflbPK7VFIJtUSNH6lUrTLfR7VKJDcLOO000PcZe+eGQ5Cc1+AWO5lMW5VWjIP
	 qdygNdmAxR3EgnMUGhgyRY9GIsIuDWXYCECuOp9BPvJfJSS7JPkm29NWnWPqQLq9hC
	 Hs0eyO/tHdHbg==
Message-ID: <399d0a7d-857c-49bf-8beb-76ce5530184b@kernel.org>
Date: Fri, 11 Sep 2026 08:54:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 0/4] Add Agilex5 support in SVC driver and FPGA
 configuration and partial reconfiguration support for Agilex5
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.v3.git.adrian.ho.yin.ng@altera.com>
 <5644e6cd-c8ab-4f3f-aa7a-11867d00446c@kernel.org>
In-Reply-To: <5644e6cd-c8ab-4f3f-aa7a-11867d00446c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/9/26 11:40, Dinh Nguyen wrote:
> 
> 
> On 9/7/26 03:20, Adrian Ng Ho Yin wrote:
>> This series adds support for Agilex5 in the SVC driver and enables FPGA
>> configuration and partial reconfiguration on Altera Agilex5 SoC.
>>
>> On Agilex5 the DDR base address starts at 0x8000_0000, which is
>> outside the addressable range of the SDM. The SMMU is used to remap
>> DDR-allocated buffers to an IOVA within the SDM-accessible 0-512MB
>> window. Agilex5 REV B introduced a hardware SDM address remapper,
>> but it must be bypassed so no additional offset is applied to the
>> IOVA, keeping the implementation consistent across all Agilex5
>> revisions.
>>
>> Patch 1 adds the fpga-mgr child node and fpga-region to the Agilex5 DTSI.
>> The SMMU is already enabled upstream.
>>
>> Patch 2 reports unmatched frees in stratix10_svc_free_memory() with
>> dev_warn() and cleans up related coding style in svc_pa_to_va(). The
>> list-head corruption from list_del(&svc_data_mem) was already fixed by
>> commit 9119ceb76e98 ("firmware: stratix10-svc: fix memory leaks and list
>> corruption bugs").
>>
>> Patch 3 adds all data-structure fields, macros, includes, helper 
>> function,
>> and allocation/free paths required for the DMA coherent mode. This covers
>> both the foundational types (dma_addr, use_dma_mem, dma_addr_offset,
>> SVC_SDM_DMA_ADDR_BITS/OFFSET) and the functional DMA allocation/free 
>> code,
>> keeping the structural and functional changes together so each 
>> intermediate
>> commit is bisect-safe.
>>
>> Patch 4 adds INTEL_SIP_SMC_SDM_REMAPPER_CONFIG and integrates the Agilex5
>> path into probe: enforces SMMU presence for intel,agilex5-svc, issues the
>> remapper-bypass SMC, selects the DMA path via 
>> stratix10_svc_pdata.use_dma_mem,
>> initialises the controller fields, registers a devm cleanup action for
>> leaked buffers, and guards the error path against a NULL genpool.
>>
>> ---
>> changelog:
>> v2 -> v3:
>> - Squash former patch 2 (SMC remapper defines) into the probe enablement
>>    patch so the defines land with their first usage.
>> - Rebase on socfpga_firmware_for_v7.4.
>> - Drop SMMU status="disabled" removal from the DTS patch (already 
>> upstream
>>    in 10cf797f3f8a).
>> - Drop the list_del(&svc_data_mem) fix already present in 9119ceb76e98;
>>    keep the unmatched-free warning and style cleanup.
>> - Adapt of_device_id.data usage to extend stratix10_svc_pdata (shared 
>> with
>>    needs_psci_cpu_off) instead of casting BIT flags into .data.
>> - Keep kzalloc_obj()/kfree() lifetime for pmem on both gen_pool and DMA
>>    paths after 9119ceb76e98.
>>
>> v1 -> v2:
>> - split original patch into smaller patches for easier review and 
>> backporting.
>> - Fixed the Fixes: tag in patch 3 referencing 5a0793ac66ac
>> - Replaced of_device_is_compatible() with of_device_id.data + 
>> of_device_get_match_data()
>> - Various commit message improvements
>> ---
>>
>> Adrian Ng Ho Yin (4):
>>    arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
>>    firmware: stratix10-svc: warn on unmatched free in
>>      stratix10_svc_free_memory
>>    firmware: stratix10-svc: add DMA coherent memory allocation for
>>      SMMU-enabled platforms
>>    firmware: stratix10-svc: enable Agilex5 SMMU support in probe
>>
>>   .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  11 +
>>   drivers/firmware/stratix10-svc.c              | 250 ++++++++++++++++ 
>> +---
>>   include/linux/firmware/intel/stratix10-smc.h  |  23 ++
>>   3 files changed, 239 insertions(+), 45 deletions(-)
>>
> 
> All patches applied!
> 


Sorry, but I had to un-applied the firmware patches.

Patch "firmware: stratix10-svc: add DMA coherent memory allocation for 
SMMU-enabled platforms", when built by itself produces this warning:

drivers/firmware/stratix10-svc.c:1112:12: warning: 
‘svc_setup_dma_memory’ defined but not used [-Wunused-function]
  1112 | static int svc_setup_dma_memory(struct platform_device *pdev)
       |            ^~~~~~~~~~~~~~~~~~~~

Looks like you need to bring this function into "firmware: 
stratix10-svc: enable Agilex5 SMMU support in probe".

Please fix up and resend just the firmware patches.

Thanks,
Dinh





