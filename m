Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949B74FC8FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793916; cv=none; b=lm9tBN4WIEa6Y5Zb58IZ5OlqFtgARGk5OZICFJyjyifx9OrhAuQ8mXTAsaL2c4dyWRrtqwyWE26k66k1u+fa5PMaaYsTjT+GbWc7Ww+50O3qxuRorCq4AUl0m1keo88upHjRubUWqzAmO2e44vp/sAA65tUT1vcli9uNBMSWnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793916; c=relaxed/simple;
	bh=nSSUhkg2+GYxqN+mkRCYxS29gRUsOc4/8D4olAlF0CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAV1UJ2MUr3EMAbV1oM1ZzsQ4Jkd/A8UsuaCNToxaeAZGeIE7RT1Y75ck12VwxRj/q1CSZQ+TKglxBE5/gpMD95Iue2dii8XG6QmF9I2VRNODbnz3ilZyxaCkGJOIAgqgSEXydnZy/xOOAvEce92xxC27UOhWqLR3kP3d/zf7fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GbtOsBio; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GbtOsBio"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B54B61476;
	Mon,  7 Sep 2026 08:11:49 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CF313F7B4;
	Mon,  7 Sep 2026 08:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788793913; bh=nSSUhkg2+GYxqN+mkRCYxS29gRUsOc4/8D4olAlF0CE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GbtOsBioJyZxF0GfsnSnGzJxwvF5IxvF1mYvzCCF2x0SPzAfq/TQzqgfKjFH6y/L8
	 HOLnEKYPQhxQDwdg0JQ5NAFB8UuJ4qhfzwbilXq4RpnnRilS1B5vzWdr7U43zzubzM
	 cG+HWxDVec5RkOP/CapDZFTYRmi4ZggkwHKTtkJ0=
Message-ID: <e6b84240-0e62-4899-ac6b-5935c86c15f7@arm.com>
Date: Mon, 7 Sep 2026 16:11:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry
To: Fuad Tabba <fuad.tabba@linux.dev>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>
References: <20260903182300.2706684-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260903182300.2706684-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 03/09/2026 19:23, Fuad Tabba wrote:
> Documentation/arch/arm64/mpam.rst is not listed under MPAM DRIVER, so
> get_maintainer.pl names neither MPAM maintainer on a patch to it.

I'm ok with this if others think it makes sense.

> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     Found this while putting together the recipient list for [1]:
>     get_maintainer.pl names neither MPAM maintainer on a patch to mpam.rst.
>     
>     arch/arm64/kernel/mpam.c, arch/arm64/include/asm/mpam.h and
>     drivers/acpi/arm64/mpam.c aren't in this entry either, but that
>     didn't look as clear cut, so I've left them out. Happy to respin
>     with them added.

I think these can stay as is.

Thanks,

Ben
>     
>     [1] https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fc320b373656f..20a6e70df83c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18438,6 +18438,7 @@ M:	Ben Horgan <ben.horgan@arm.com>
>  R:	Reinette Chatre <reinette.chatre@intel.com>
>  R:	Fenghua Yu <fenghuay@nvidia.com>
>  S:	Maintained
> +F:	Documentation/arch/arm64/mpam.rst
>  F:	drivers/resctrl/mpam_*
>  F:	drivers/resctrl/test_mpam_*
>  F:	include/linux/arm_mpam.h

