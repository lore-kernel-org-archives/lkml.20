Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBE93CDBD3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550774; cv=none; b=NI4FXKOikol+YrtcEx8l1/gX+8ueX12HNHzj1eMklD0pJyjQnM0br+YxaEKErbWndQSwBNJxupSv5kjLEi5Y9VRk2MPrIwEUdWmbk7Pe/riSk1etByCXkqTp/tPesz+1GUWO7M8nej8K0Q5VeTWCnYibeto4GNLxVoFn2f1GhbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550774; c=relaxed/simple;
	bh=M/5UBXmnLMfJ8K7WalD9DM822gsSfuVvJWMsXU5qNf4=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:To:From:
	 In-Reply-To:Content-Type; b=OlxxZe7Gnzl3wBFA9x+dppje6EVe6CNBkS+H5PeClnYILUIx6aBxHGGOQY/NAKWJEfw1kkxN6Q3ZjWJAIZTRaqqhgkX65RA8TkL7SqtCFRlQcEoHoJQ+U+jBY5xEQaxr7RO3F7ozwy1Yygk4SQ3psTvoRj0I3R03Av2Qlddve+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Rgz9v/eR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Rgz9v/eR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3275D1516;
	Wed, 16 Sep 2026 02:26:05 -0700 (PDT)
Received: from [10.2.212.8] (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A1213F86F;
	Wed, 16 Sep 2026 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789550768; bh=M/5UBXmnLMfJ8K7WalD9DM822gsSfuVvJWMsXU5qNf4=;
	h=Date:Subject:Cc:References:To:From:In-Reply-To:From;
	b=Rgz9v/eRry2Jw822JFKgSUzHTLBJLqJgiw/M9xxKO0P4P5+K9HuWKh4sOOBs5qfJj
	 U6KzcB/fCRE7O9OvjPKlrMrIORMFl/c1SRy8Bpn5sONgXc3JoW0+zxrB2sXOC7FsZQ
	 cstOAL5PbRzE40JL1GOxnhAxKLbx3xNpBkloFuJw=
Message-ID: <cfc17679-c8a9-4ac4-bb90-6b336bd91407@arm.com>
Date: Wed, 16 Sep 2026 10:26:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/resctrl: Allocate rmid_ptrs[] using kvzalloc_objs()
Cc: tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 fenghuay@nvidia.com, bp@alien8.de, linux-kernel@vger.kernel.org
References: <20260911160608.1091121-1-ben.horgan@arm.com>
Content-Language: en-US
To: ben.horgan@arm.com
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260911160608.1091121-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I realised I forgot to include a changelog with this v2. The only change from v1 is an update to the
fixes tag as suggested by Reinette.

Thanks,

Ben

On 11/09/2026 17:06, Ben Horgan wrote:
> On an MPAM system the number of entries in rmid_ptrs[] is the number of PARTIDs
> multiplied by the number of PMGs. The maximum possible number of PARTIDs is
> 0x10000 and the maximum number of PMGs is 0x100. On a system pushing the limits
> of the MPAM specification this can be large enough to consistently fail the
> kzalloc_objs() allocation and hence fail to mount the resctrl filesystem.
> 
> Switch to allocating rmid_ptrs[] using kvzalloc_objs() so that large allocations
> fall back to vmalloc().
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> I found this by testing the extremes of a software model and don't expect this
> to effect real systems.
> ---
>  fs/resctrl/monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 73413cb128ea..2d7df60973d1 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -979,7 +979,7 @@ int setup_rmid_lru_list(void)
>  		return 0;
>  
>  	idx_limit = resctrl_arch_system_num_rmid_idx();
> -	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
> +	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
>  	if (!rmid_ptrs)
>  		return -ENOMEM;
>  
> @@ -1010,7 +1010,7 @@ void free_rmid_lru_list(void)
>  		return;
>  
>  	mutex_lock(&rdtgroup_mutex);
> -	kfree(rmid_ptrs);
> +	kvfree(rmid_ptrs);
>  	rmid_ptrs = NULL;
>  	mutex_unlock(&rdtgroup_mutex);
>  }

