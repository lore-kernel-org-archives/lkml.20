Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B535AC14
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586677; cv=none; b=Vz82AYxbRFGp/KJhfZxYTJY/lx1p4Tt9kmJhPBvTwELf0QdCHcXeyNxuICqoftbRkAozGFnKiWDIjp9PQdLU8ZcJ3HOx6idMaQCjnEHPha51tCaF60q82rjOAW5uEhKyfNwrD8yJkZRSxpLW0AVYsw2CYlBE0hOMWo07zuse2R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586677; c=relaxed/simple;
	bh=t2bV+J7yQGAh8QlD1zm5r+V9wMPmlwMAn8PlZVKY1jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zpo2bvJRmW4VBoxxn8HoY9Rp8OfDoMsHBEb2/rNSkEe1+Zd/YF+PSUSy7Q4wq+4i+9AzaNQaCvgqBIKbr/sFWjxlhSXc/n+un/YxaI32kIo3Uth9kLcHGtRk7Jg7T04Fzl5b/AZENGNi/QwSglTWOPCrS72V4YBtso/0KeXSvA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z7mQmQQt; arc=none smtp.client-ip=91.218.175.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z7mQmQQt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t2bV+J7yQGAh8QlD1zm5r+V9wMPmlwMAn8PlZVKY1jc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790586673; v=1; x=1791191473;
 b=Z7mQmQQt5XEcyW4cCAXjzYJMSGaQ7aWkhSPucj68B/NzyTdvNt8m7UJDSDcZAmtwxLPuT7aH
 Ryb+/b1/nOLqGlx81w8EA9HGttWMV4QkZzTmjXVUHKA/4Y1DuxfL+nNupbGuMKV0mzwUP8iamXf
 whLA/8yc0dowa/UnFIFAzhxE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 65f31ff16b613622;
	Mon, 28 Sep 2026 09:11:13 +0000
X-Mizu-Trace-ID: 65f31ff16b613622
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 17:11:08 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Carlier <devnexen@gmail.com>,
	Dave Young <ruirui.yang@linux.dev>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] vmcoreinfo: export SECTION_HAS_MEM_MAP
Message-ID: <arovLO37djQderTB@MiWiFi-R3L-srv>
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

On 09/28/26 at 10:48am, David Hildenbrand (Arm) wrote:
> The crash tool currently hardcodes SECTION_HAS_MEM_MAP, and makedumpfile
> needs similar information (although still relying on
> SECTION_MARKED_PRESENT, it should switch to SECTION_HAS_MEM_MAP).
> 
> Let's just export the value instead, so tools that work on vmcoreinfo
> will not have to guess.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
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

It would be good to add one section in
Documentation/admin-guide/kdump/vmcoreinfo.rst, e.g

SECTION_HAS_MEM_MAP
-------------------

Indicates a memory section has struct page array (mem_map). User-space
tools should read this value but not hardcode it since the bit position
could change between kernel versions.

The code change looks good to me.

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
