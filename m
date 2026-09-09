Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0804D2D0C82;
	Wed,  9 Sep 2026 05:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788932900; cv=none; b=nLHntbH9wcCow8cYPxNQGGVgdjD7ecHm2kiy0cKoP2IApU6/jUsISI2d6IUmPst0DDN0DI/j+BVjqhLsvKfjwZYHoA14GquW6t41jBhYgj78k7gvQE7XAQyStVmIZEj+TO+RlAQ9kukR1tFZSFS7a/zkqfmen1bzGJBL/EVojLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788932900; c=relaxed/simple;
	bh=eEcV33YrEDuYrGfCJe967G2DMmEN+0Eo+eacY+aa+U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrB2Yaed3+vZ0fU4L39dNPc7fDK68/+8oWnv7s+RNdJwdEhAJqoiBCXIMU/GkERRRliBiC6y+uphSM3upfio8Lwzo8vMOsNWyU6/hSGBr9rNoIdLnKRkjt8X0IcwjkAB7GwdTgECzGcvnpsykcspBsv2Lqbq8jLH2h9wXEUGo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Jnvg9I7T; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Jnvg9I7T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ai877TlnF1A1wauNaxnBDKNCz5niaLrOXjrpPRwxxBE=; b=Jnvg9I7Tt8NzY6hlexJ5qHfM0M
	t3/Of1CpryhfATD9gPo2P/mkWEdOV8hV+sDP3WjqHvh/MbNsTzM7MPBlJcPTD6NkO6RS4W30rTRE6
	Xf+V5kM0hw87cn80CWBhO0UKy0xlqargg8hRUV82y9WdkIINyUz3ulDiEfHyfXJULMbxATZ7TRZZv
	cA8I9SmQu1p4J7ZA0lEkSefvUKF/t4EwrR60DUo3JTGNl0kkFhR0laQXb9V+XqM3Nc4uHPkMdIm6/
	EFEqYa3+JAgGEcEHnkGT2BoBJmMCNbspPxkBVwabn0sDnEiPsrOWr41F/RmQ8UDq4fY22+zrHW5oE
	kUeYtucQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BAM-0000000AosQ-1S9E;
	Wed, 09 Sep 2026 05:48:14 +0000
Message-ID: <83b9fd96-d0dc-4ced-97cd-287c82cdacbe@infradead.org>
Date: Tue, 8 Sep 2026 22:48:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] Documentation: kdump: Add arm64 and ppc64le to
 encrypted dump target support list
To: Coiby Xu <coiby.xu@gmail.com>, kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>,
 Dave Young <ruirui.yang@linux.dev>, Pratyush Yadav <pratyush@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jinjie Ruan <ruanjinjie@huawei.com>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-10-coiby.xu@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260909003657.1570544-10-coiby.xu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/8/26 5:36 PM, Coiby Xu wrote:
> The encrypted dump target support is now extended to arm64 and ppc64le.
> 
> Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  Documentation/admin-guide/kdump/kdump.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
> index 0bf2eb100a05..36ad6125c670 100644
> --- a/Documentation/admin-guide/kdump/kdump.rst
> +++ b/Documentation/admin-guide/kdump/kdump.rst
> @@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
>  ============================================
>  
>  CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
> -encrypted disk volume (only x86_64 supported for now). User space can interact
> -with /sys/kernel/config/crash_dm_crypt_keys for setup,
> +encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
> +space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,

                                                                  for setup.

>  
>  1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>      # Add key #1

-- 
~Randy

