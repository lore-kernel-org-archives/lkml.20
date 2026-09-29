Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB80338A70B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790658318; cv=none; b=uwZTreJe9vjmOBixBoOjQ6FpVuH1g5E+7AxvYZCEygfP+ajIP+v3X3J6qUAGokRUQMBC41EELBCoF7r4f6ngcPsY+q73DpT8JsZIPG+rhYUifwxXsXwP3x4z6eY8SMNTmm+9fQiSAAdrw2zeOxOQWJRsZgm+avxyIBKQjfjQlhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790658318; c=relaxed/simple;
	bh=cQ/BG6TOBdm5HgzpeS1NDsUqN0RS94kKCnbqrv4zAnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJeMKPHQ9/UAMoQJVkzQ1QS0jSga7kFmcFGbrd8+GrFAc+yK9sSIMdiJ9ot6OsOKAoIYnUC4pTNs8qukvFOFqDtAr33q0vBYcIAECpGOljX8hk37vULvqh23ENMqWHCkcnde0av8PZ4dSppKKPnk7Xk08ss8VV0HJdqVyAPViis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=I3FEtuuo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="I3FEtuuo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 735751D31;
	Mon, 28 Sep 2026 22:05:04 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 285983FB90;
	Mon, 28 Sep 2026 22:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790658307; bh=cQ/BG6TOBdm5HgzpeS1NDsUqN0RS94kKCnbqrv4zAnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3FEtuuoavmCwBAEMoK1tMA9B1Ur1L0yeyx10PwOfwgFyiTnp8dWnjfXv+uqFlW+j
	 n8ZCrGPB3AfjI6GWGIl0Ebw8QIzlYHNWktuuiebUlFHglEQQA4vHcLPiplQzDHdIH9
	 ACCeaZGtWYOzIQVNQQenOnAl3PXPWT8z0lNDTvI0=
Date: Tue, 29 Sep 2026 10:35:04 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, David Carlier <devnexen@gmail.com>, 
	Dave Young <ruirui.yang@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] vmcoreinfo: export SECTION_HAS_MEM_MAP
Message-ID: <re5kf3b7352ycybaaj4hb377kp4pic5c46z3gba2623idg7uzs@mvvvg2djilfd>
References: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>

On Mon, Sep 28, 2026 at 10:48:21AM +0200, David Hildenbrand (Arm) wrote:
> The crash tool currently hardcodes SECTION_HAS_MEM_MAP, and makedumpfile
> needs similar information (although still relying on
> SECTION_MARKED_PRESENT, it should switch to SECTION_HAS_MEM_MAP).
> 
> Let's just export the value instead, so tools that work on vmcoreinfo
> will not have to guess.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> Result of the discussion in reply to "[PATCH v2 00/13] mm/sparse: remove
> SECTION_MARKED_PRESENT and further cleanups" [1]
> 
> This patch can go in independently. It would be preferable if both
> go into the same kernel release ;)
> 
> [1] https://lore.kernel.org/r/20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org 
> ---
>  kernel/vmcore_info.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
> index 5a417f8a922a..7833a36064a8 100644
> --- a/kernel/vmcore_info.c
> +++ b/kernel/vmcore_info.c
> @@ -182,6 +182,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>  	VMCOREINFO_STRUCT_SIZE(mem_section);
>  	VMCOREINFO_OFFSET(mem_section, section_mem_map);
>  	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
> +	VMCOREINFO_NUMBER(SECTION_HAS_MEM_MAP);
>  	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
>  #endif
>  	VMCOREINFO_STRUCT_SIZE(page);
> 
> ---
> 
> base-commit: 57e4ac91fc62d75d84b5a03827a19ceb4094ecd9
> 
> change-id: 20260928-section_has_mem_map-6205dc90a09f
> 
> --
> 
> Cheers,
> 
> David
> 
