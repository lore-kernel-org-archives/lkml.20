Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19D339362;
	Sun,  6 Sep 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788723552; cv=none; b=XVnzWsx7uSM9KRA+Q+MHwAUCfi0i/aiscs42zUtSZBwoaPDd27WnJ+zoLCtw09LZRlxHxZWbmJWHuRTOTdoFkl618UYxoGgaNYv3lwnm4Opo7W+5/7DHzSmX9PSxG6Qb5ETtDJo5JixA8NoA8++I3AJtDP5OQEX94fVtZp4x9no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788723552; c=relaxed/simple;
	bh=SwPbaSE+r+ad668efSoIxC0WMFREdoKaVVaUwRCmmZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1yWjUyVxd5lLjFiw89b5fNVfUlHWJ8g+opdti8Gup2MbG9lTjjkHEKSScGqs3UHjdVdZgVAha1gKHniY3SwdSBMbOkBBHBLSHmJWAvoBiMFnfuWLI2qlR8MxSRwRoe78jAAaA8Lzra5wf0SZ1Mwg/U5W5DarHosBWlzrMcg9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQNoTprd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQNoTprd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625C61F00A3A;
	Sun,  6 Sep 2026 19:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788723550;
	bh=V0dlg/OCZ/KvufmAUs7+NibuZAe4qcL98ZBaXdAOiso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQNoTprdzIABHeaY8m1+qIYrChSBW4YR5g56ND0IDGxjVrUjtu75iXcCInOb1364I
	 +wTB43doqgMJLnfBYJoSskumSgUkqMuUSGSIyoiPPsV5IWdYEYUL+GqtDQkjrs8b/w
	 R6nDfbG6LsyEfVITroBVaYZCYKvjcF1I8vSvuQf2oWbg1ZiodwnpaEcX1THbxmnSe+
	 IHQQ7ZglbTz7DzRXjtIv6JDrqgE4UHHd8b9zAX216R+bHlW31/yMX2GKkwGDEUCJoJ
	 YO213e8leFhpd/Q0nqRYPJDTLfgotLWQBIY2H1TusP0BQqbzqo8eIUTF+jNybiPMEk
	 M4oRLiEK08ijQ==
Date: Sun, 6 Sep 2026 22:39:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 03/10] set_memory.h: Introduce
 can_set_direct_map_range()
Message-ID: <ap3BVr5hHwA499gu@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-4-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-4-vdonnefort@google.com>

On Wed, Sep 02, 2026 at 11:47:05AM +0100, Vincent Donnefort wrote:
> While can_set_direct_map() tells whether the direct map can be modified
> globally, can_set_direct_map_range() checks if a specific range can be
> modified. e.g. if mapped at PTE-level.

set_direct_map are going to have number of pages parameter soon:

https://lore.kernel.org/all/20260903-execmem-set-vm-perms-v0-2-v3-1-949b64a9f755@kernel.org

so this check can be a part of arm64::set_direct_map

I wouldn't expose can_set_direct_map_range() as a public API and rely on
the callers to "Do The Right Thing".
  
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index 3030d9245f5a..88175c3fa751 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -44,6 +44,12 @@ static inline bool kernel_page_present(struct page *page)
>  {
>  	return true;
>  }
> +
> +static inline bool can_set_direct_map_range(struct page *page,
> +					    unsigned long nr_pages)
> +{
> +	return false;
> +}
>  #else /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>  /*
>   * Some architectures, e.g. ARM64 can disable direct map modifications at
> @@ -56,6 +62,14 @@ static inline bool can_set_direct_map(void)
>  }
>  #define can_set_direct_map can_set_direct_map
>  #endif
> +
> +#ifndef can_set_direct_map_range
> +static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
> +{
> +	return can_set_direct_map();
> +}
> +#define can_set_direct_map_range can_set_direct_map_range
> +#endif
>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>  
>  #ifdef CONFIG_X86_64
> -- 
> 2.55.0.970.g62bdec98f9-goog
> 

-- 
Sincerely yours,
Mike.
