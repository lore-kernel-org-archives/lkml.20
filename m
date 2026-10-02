Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FC7357CF4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954894; cv=none; b=MO/9pcGz6y26ly/l4uIfV4i+l3n1OO/65QI/KAVBNc7vKHAHr0zqcO67Z9zXatsthmTXZ6CNik02g+oAk6rUVxVwBm20VO4eeGoVSUHnG7F4meSOSrtL835707TQlHI00CA3sZEyY9ZdqBNySqaiUSgED9JFt0iaazsYHN5h7nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954894; c=relaxed/simple;
	bh=SBJel+ooDz1gRUkPel1Y7M40DlcCPPj25e5QajwwZXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQtqO72i1wwfYHLbJQk/7uDy/PR/th+6J02rZAS3/e7FgH/rExTRUSNd/8fv52L+li2sd6kGi5O5Jdtoaew5ccP/aET/S2/OIHuET4nNXXbx6aQOjTPcgXoQJlRcqAkIql+7PNo/jEDDoCpCCkxf4JUkwd17Ulh1/KZn4XlFzSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CK99x9/u; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CK99x9/u"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2DF0143D;
	Fri,  2 Oct 2026 08:28:08 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F39E63F882;
	Fri,  2 Oct 2026 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954892; bh=SBJel+ooDz1gRUkPel1Y7M40DlcCPPj25e5QajwwZXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CK99x9/uXkjfykjfyQ0CVPfBcqtZ9StLdvj7pbREw+MQSQflkVc7QJKS4Dh7BvWQr
	 uexp/V0BBMrbfEBoW6njlQxh2GKs1wEm/xZjgjUpl27IJ5A2hGS04KXfUSOKvkB0hB
	 eWv/KHlw/1b1QwPre4m2xaV6lqUFBQMyn5tMdsZg=
Message-ID: <0e78cff6-edd1-4db8-bdb0-7ee6123b146f@arm.com>
Date: Fri, 2 Oct 2026 16:28:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry
To: Fuad Tabba <fuad.tabba@linux.dev>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>
References: <20260903182300.2706684-1-fuad.tabba@linux.dev>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260903182300.2706684-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 03/09/2026 19:23, Fuad Tabba wrote:
> Documentation/arch/arm64/mpam.rst is not listed under MPAM DRIVER, so
> get_maintainer.pl names neither MPAM maintainer on a patch to it.

Fair enough ...

I've picked this up to send on to Catalin...


> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     Found this while putting together the recipient list for [1]:
>     get_maintainer.pl names neither MPAM maintainer on a patch to mpam.rst.

>     arch/arm64/kernel/mpam.c, arch/arm64/include/asm/mpam.h and
>     drivers/acpi/arm64/mpam.c aren't in this entry either, but that
>     didn't look as clear cut, so I've left them out. Happy to respin
>     with them added.

I'd leave that - the split is so that stuff in the arm-arm is part of the arch
code, and things that aren't a buried out in drivers.


Thanks,

James


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

