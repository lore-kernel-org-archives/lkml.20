Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D18395AEB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413404; cv=none; b=BT611PIO2jWzoV20oRcLpEIsP3sqqYjuRgizI0Muz0x8tufiXaMtLCNEukC794ehcRYyVx9yN1omXlxduutxSVqW66ujSnOr6Pl+hYh/aX7NZKpxwWMLfYRIxVSeFpMxVzZkciYmmUgopOcn3n+mPqHTViKum4PyIo4Eo3e2imQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413404; c=relaxed/simple;
	bh=FEarbCRDykiRJXp9OC9bUj+CY0slHJEQmjbCY//Pl1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GSF/gOLE/6WRWkUJH/6fQNeg87qTsldHPQhFT4mnWicBP3/OA7ucA05XhhZSqbXfJTOHgwyPryqSt8ivjHNqsZNxKFBiIWXp/9qv9Ql0MbIbmGDlbGEl5iq8EFENP0hDG+gdVdLvnoe4YEpJFyuJtRusddCrbZdYteil2BV3Wlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFiHRLIr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFiHRLIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A921F000FF;
	Mon, 14 Sep 2026 19:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789413401;
	bh=gHCz+kSg6BwwMiiMcAh3Bx0/MRsaKSiHLq96xQ9SRWw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=iFiHRLIrxwtSAnLEHu7j2pIt0wV+yPEbC8/V86X/NhHlDccLufJcMZowJxkydqBCp
	 FSzFIQshgkNUPdUppvUzDojEcF04keL22GE+SyWqHa4yYY02ZwVQPYG41ogFJTfhF7
	 90b8fBISQzXIHATnyc+X9apI/CfYrPPHb5e6/Q1GiK2sd3PUMa0q/NRL+YxoaS0r/8
	 tq7KT8ebmiZoVJFyOspHATIZQ9zf1soPZ7jYQ6i7b1a14G2oKpvzKfezyyGHQyZtwa
	 w1ajjOPb+XnKd9h6y6DoZx6yc3anvtdbY81ZMFrdzjpMm8/Oc5uQCZZFKoSlZv+o8v
	 kjyg+duroiqqA==
Message-ID: <17a57218-6dcd-4369-ad26-3dac62766536@kernel.org>
Date: Mon, 14 Sep 2026 14:16:39 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] firmware: stratix10-svc: Agilex5 SMMU DMA coherent
 support
Content-Language: en-US
To: adrian.ho.yin.ng@altera.com, linux-kernel@vger.kernel.org
References: <cover.v3.git.adrian.ho.yin.ng@altera.com>
 <cover.1789141361.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1789141361.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/26 10:52, adrian.ho.yin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> This series adds Agilex5 SMMU DMA coherent support in the stratix10-svc
> driver.
> 
> On Agilex5 the DDR base address starts at 0x8000_0000, which is
> outside the addressable range of the SDM. When SMMU is active, the
> driver must allocate DMA-coherent buffers and pass IOVAs within the
> SDM-accessible 0-512MB window to ATF. Agilex5 REV B introduced a
> hardware SDM address remapper, but it must be bypassed so no additional
> offset is applied to the IOVA, keeping the implementation consistent
> across all Agilex5 revisions.
> 
> Patch 1 reports unmatched frees in stratix10_svc_free_memory() with
> dev_warn() and cleans up related coding style in svc_pa_to_va(). The
> list-head corruption from list_del(&svc_data_mem) was already fixed by
> commit 9119ceb76e98 ("firmware: stratix10-svc: fix memory leaks and list
> corruption bugs").
> 
> Patch 2 adds the DMA coherent allocation path and wires Agilex5
> enablement in probe: require an IOMMU domain for intel,agilex5-svc,
> bypass the SDM address remapper via INTEL_SIP_SMC_SDM_REMAPPER_CONFIG,
> set the 29-bit DMA mask, select the DMA path through
> stratix10_svc_pdata, register a devm cleanup for leaked buffers, and
> guard err_destroy_pool against a NULL genpool.
> 
> ---
> changelog:
> v3 -> v4:
> - Squash the DMA-allocation and Agilex5 probe enablement patches into
>    one commit. Building the former alone triggered -Wunused-function on
>    svc_setup_dma_memory() and left use_dma_mem false (inert).
> - Drop the arm64 DTS patch from this series; resend firmware patches
>    only.
> - Drop Signed-off-by: Dinh Nguyen from patch 1; resending with author
>    Signed-off-by only.
> 
> v2 -> v3:
> - Squash former patch 2 (SMC remapper defines) into the probe enablement
>    patch so the defines land with their first usage.
> - Rebase on socfpga_firmware_for_v7.4.
> - Drop the list_del(&svc_data_mem) fix already present in 9119ceb76e98;
>    keep the unmatched-free warning and style cleanup.
> - Adapt of_device_id.data usage to extend stratix10_svc_pdata (shared with
>    needs_psci_cpu_off) instead of casting BIT flags into .data.
> - Keep kzalloc_obj()/kfree() lifetime for pmem on both gen_pool and DMA
>    paths after 9119ceb76e98.
> 
> v1 -> v2:
> - split original patch into smaller patches for easier review and backporting.
> - Fixed the Fixes: tag in patch 3 referencing 5a0793ac66ac
> - Replaced of_device_is_compatible() with of_device_id.data + of_device_get_match_data()
> - Various commit message improvements
> ---
> 
> Adrian Ng Ho Yin (2):
>    firmware: stratix10-svc: warn on unmatched free in
>      stratix10_svc_free_memory
>    firmware: stratix10-svc: add Agilex5 SMMU DMA coherent support
> 
>   drivers/firmware/stratix10-svc.c             | 250 +++++++++++++++----
>   include/linux/firmware/intel/stratix10-smc.h |  23 ++
>   2 files changed, 228 insertions(+), 45 deletions(-)
> 

Applied!

Thanks,
Dinh

