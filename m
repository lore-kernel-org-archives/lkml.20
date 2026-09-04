Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86313B47DF;
	Fri,  4 Sep 2026 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541263; cv=none; b=dZ6geeAWkclw0k/BwSI2RjqeOEQP29kU8DbEB6w94pzeUWlpGmkYmO14hrKY4X9WMhm1EA+/Q8mii/dpEF2K3ACuWdNA8rLFaGA53wYztJXfXav/W0Wh/74V2iC4wjXRhcGrYRUzp68yO068h9lj23OwqiX0VKShS76kQ9Phdcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541263; c=relaxed/simple;
	bh=RGHZWkjJxUEHYJxtwRhOiNDil71lm5pCZ3HGOizHOHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FpkCRsOKmdgA+rodzRi1Avpz0NOPfsoMOWATXoepUqJiEs1EhIF4wDGvGwAd//Ms1tGFizN7tcCgmQbHOdDZ30lBjvhFdzdso+NOv/T1bpyQ+Rr3N2yvb1b/keH7LxpDUOuRi8MzT2m39eHKgKwORwMgXMOfq4CJxDY4fmCmcPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5JTKtWy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5JTKtWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547B11F00A3D;
	Fri,  4 Sep 2026 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788541261;
	bh=z8I/bdfsFJJ9ZEIY1Swf6hTCVoPuUKZayHpE2OeGShg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=U5JTKtWyyWC0iAnYQKEnDVcmo5u1tt2nTxmUFKfPDcFwz3vJr2NUGR4PapeJmsaX8
	 JBDmFwjeYtfylFE0eK1Ju+jDr7eyxliEMNqHOyj3RcN7vNFXx+REdZzCav/pDgUSAK
	 AVavcC35YIBHR978Xydryt7dX+Lf3zEOzcOqzHYMUC86B8MvkU1DO942mKkb31fO87
	 wMdtC9D+Qm1AXYlM8eBcdEKj6pur1JJwYx32M05hyg9quHXuqDBqUMz1MKGmz8X97n
	 SNscJAz2u6+NM1EU7Fn01ErZIsz0L7rY3sQqEAaxQIZOAWTemdui/+NxXrwMo667bx
	 bxeD8iJ7UupGA==
Message-ID: <08064970-d385-42d6-9f0c-6c4382bd4ebc@kernel.org>
Date: Fri, 4 Sep 2026 12:01:00 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND v2 0/5] Add Agilex5 support in SVC driver and
 FPGA configuration and partial reconfiguration support for Agilex5
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/12/26 15:50, Adrian Ng Ho Yin wrote:
> This series adds support for Agilex5 in the SVC driver and enables FPGA
> configuration and partial reconfiguration on Altera Agilex5 SoC.
> 
> On Agilex5 the DDR base address starts at 0x8000_0000, which is
> outside the addressable range of the SDM. The SMMU is used to remap
> DDR-allocated buffers to an IOVA within the SDM-accessible 0-512MB
> window. Agilex5 REV B introduced a hardware SDM address remapper,
> but it must be bypassed so no additional offset is applied to the
> IOVA, keeping the implementation consistent across all Agilex5
> revisions.
> 
> Patch 1 adds the fpga-mgr child node and fpga-region to the Agilex5 DTSI,
> and removes the disabled status from the smmu node to enable it, which is
> always required on Agilex5 for the service layer to operate correctly.

I've applied the DTS patch.

> 
> Patch 2 adds the SMC call definition for the SDM address remapper
> configuration in stratix10-smc.h. This is a standalone header change with
> no driver dependency.

This patch just adds defines with no usage of them. Please add the usage.
> 
> Patch 3 fixes a pre-existing list corruption bug in
> stratix10_svc_free_memory() where an unmatched free called
> list_del(&svc_data_mem), corrupting the list head. It also cleans up
> related coding style in svc_pa_to_va(). This fix is split out first so it
> can be reviewed and backported independently.
> 
> Patch 4 adds all data-structure fields, macros, includes, helper function,
> and allocation/free paths required for the DMA coherent mode. This covers
> both the foundational types (dma_addr, use_dma_mem, dma_addr_offset,
> SVC_SDM_DMA_ADDR_BITS/OFFSET) and the functional DMA allocation/free code,
> keeping the structural and functional changes together so each intermediate
> commit is bisect-safe.
> 
> Patch 5 integrates all of the above into probe: enforces SMMU presence for
> intel,agilex5-svc, issues the remapper-bypass SMC, selects the DMA path,
> initialises the controller fields, registers a devm cleanup action for
> leaked buffers, and guards the error path against a NULL genpool.

These 3 patches no longer apply cleanly. Please rebase on top of 
socfpga_firmware_for_v7.4 and resend.

Thanks,
Dinh
