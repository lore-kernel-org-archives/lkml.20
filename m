Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2B48D899;
	Thu, 24 Sep 2026 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261336; cv=none; b=mIv8QpJvZZNFuo8Hr3n+Tz41ZxjwABSt8a17dgm4nEKHu4OnivXMz6EjPXRJtp3MUUZMV1FZ7X3q5DOqtlc3d+QlzmcWqV+XtUW/xIKY5uPWlhhjTBsuFTbImwYX/UAHuen9JU/Mk+WqNz6lhFomH330eVFkLAcpEEPj9pIwEWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261336; c=relaxed/simple;
	bh=R0A9Q/UraG0HaGTcXY95SXCEUHN05hdm3bxqYvgmHpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCXVy+12Lis6kt2i8frnDM/8x/BInSPkdrK77cC66IgnguneLQwX7nR3oYMiGeMxeLsK8k1+Hn0caQLsqz+LXrgBppzG6PzbBWB6+GFS8hPFrVQ/7M/8kHA7hbvnlsl1SGa//2jY3Z/OP4wqSIRLVur83ZwLRznb0x/8SxGWO6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0JL6yBI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0JL6yBI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3846F1F00893;
	Thu, 24 Sep 2026 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790261328;
	bh=b012HwTafCOVaCuUGrAweh7h1QCw29A3QVykxf150y8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=F0JL6yBI6PmpAFZN//cPjkdaY3LWt+XMRI/vU0BfAJ080LqroZ+WDDGyMJ1rpO2Hr
	 M0TPOaPBt87OYaXZkIMVwbDinjnP1keKojD8OjLLO8dcvI6B+atyMNv5xm6Ou0taHJ
	 /f70seJ4HlFRp53w0CjAQ+Rdz82IleEPiBYxcW0XraFwqJg+jnghQksKZx/ULtuG4H
	 du7LV2t15HIs1SBPLrI06RhJnrnjgIWlK/FUsMQ2DxZEN5dahlAdGKwnAOYYOImNGs
	 hodBem34iE7VdF8bbe52PAtqAxsEZLrT4cm9H05sFZK5wpMqlhR+ezh/4neeogdv5f
	 vuGL/Ec9Ki8Rg==
Message-ID: <b71909f6-4192-46db-b974-e6b24d097821@kernel.org>
Date: Thu, 24 Sep 2026 09:48:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 0/4] EDAC/altera: Address sashiko reviews part 1(v5)
Content-Language: en-US
To: bp@alien8.de, tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, rounakdas2025@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260911120627.2634225-1-dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260911120627.2634225-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping on this series. Just wondering if there any comments for this 
series? From Boris's comments on V2[1], I thought the series is ready.

Thanks,
Dinh

[1] 
https://lore.kernel.org/all/20260814021511.GBan56L1fI-AhQ1g39@fat_crate.local/



On 9/11/26 07:06, Dinh Nguyen wrote:
> Hi EDAC maintainers,
> 
> This is version 5 of the patch series that addresses some of the sashiko
> reviews for the Altera EDAC driver.
> 
> Here's what changed:
> 
> v5: Fix a missing } in patch 3/4
> 
> v4: Rebased the series to edac-urgent branch because of patch
> 9868f5c077df ("EDAC/altera: Use parent device for devres in
> altr_portb_setup()") will cause conflicts.
> 
> v3: simplified commit message based on Borislav's comments
> 
> v2: reworked to only includ true sashiko hits
> 
> Thanks,
> Dinh
> 
> Dinh Nguyen (4):
>    EDAC/altera: Do not allow driver unbinding
>    EDAC/altera: Drop __init from ECC setup paths for re-probe safety
>    EDAC/altera: Fix code leak on dci allocation failure
>    EDAC/altera: Fix use-after-free in error paths
> 
>   drivers/edac/altera_edac.c | 60 ++++++++++++++++++--------------------
>   1 file changed, 29 insertions(+), 31 deletions(-)
> 

