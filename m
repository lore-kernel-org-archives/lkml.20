Received: from mta0.migadu.com (out-14.mta0.migadu.com [91.218.175.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3502499F07
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590368; cv=none; b=kOxBLAEL7JzOgUI/MNgO0mrZEmejKhkSPhmOqAZhKDMJHau+QIX7KVxMnVlxbDVb1bF51Rox2TkC4R2aEIk9txYJdBWrMHNHm0S3HxRmWRjZIWQvyuemKnOCNZ6Zilcf9ZD6bQk+OODK5ccO6pc/86prQKvx7bidXZ+sw5Wt3iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590368; c=relaxed/simple;
	bh=Q4xAGKPGxcoFFfuM4LGsU2g/MmZVXW7rF2LcsOPAOn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOi3g5br90LBMC46CHhUTEtH4dhtaItKO/J8k/u24k5uv4aEEqzIRDwve6c+ZUNmn4sUwnt7uxgjo9fe17Dil1sNxAEK/lDX+fhCuY+ezTk84lhnmZ+dDlmEL7vaAOoh7k1MJLfGiVtN6i7e9wh1U13nKOHET3WmjEFpyIGcQVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uTOWcWNU; arc=none smtp.client-ip=91.218.175.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uTOWcWNU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q4xAGKPGxcoFFfuM4LGsU2g/MmZVXW7rF2LcsOPAOn4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790590363; v=1; x=1791195163;
 b=uTOWcWNU/r1xelFwtq/YWm6xSxMGbfsSwD3fgLITgq2bGgadfDfDIGXD7O90FBnlCGGORbCa
 xaIz1KcG97g39CoLb/WNYG0LvPmszE2uY2Tqsv8az4ZeVr+UHqmYIyfXIMzfG5m9c2IXegHeheV
 tnxNkwUgWzrp1j6Ccr7goPXc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 52ca14a05b391034;
	Mon, 28 Sep 2026 10:12:33 +0000
X-Mizu-Trace-ID: 52ca14a05b391034
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 18:12:30 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Carlier <devnexen@gmail.com>,
	Dave Young <ruirui.yang@linux.dev>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] vmcoreinfo: export SECTION_HAS_MEM_MAP
Message-ID: <aro9jg5VN_CRBK7N@MiWiFi-R3L-srv>
References: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>
 <arovLO37djQderTB@MiWiFi-R3L-srv>
 <21abd60c-e71b-40ed-9506-853d4485cf4b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21abd60c-e71b-40ed-9506-853d4485cf4b@kernel.org>

On 09/28/26 at 11:14am, David Hildenbrand (Arm) wrote:
> On 9/28/26 11:11, Baoquan He wrote:
> > On 09/28/26 at 10:48am, David Hildenbrand (Arm) wrote:
> >> The crash tool currently hardcodes SECTION_HAS_MEM_MAP, and makedumpfile
> >> needs similar information (although still relying on
> >> SECTION_MARKED_PRESENT, it should switch to SECTION_HAS_MEM_MAP).
> >>
> >> Let's just export the value instead, so tools that work on vmcoreinfo
> >> will not have to guess.
> >>
> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >> ---
> >> Result of the discussion in reply to "[PATCH v2 00/13] mm/sparse: remove
> >> SECTION_MARKED_PRESENT and further cleanups" [1]
> >>
> >> This patch can go in independently. It would be preferable if both
> >> go into the same kernel release ;)
> >>
> >> [1] https://lore.kernel.org/r/20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org 
> >> ---
> >>  kernel/vmcore_info.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
> >> index 5a417f8a922a..7833a36064a8 100644
> >> --- a/kernel/vmcore_info.c
> >> +++ b/kernel/vmcore_info.c
> >> @@ -182,6 +182,7 @@ static int __init crash_save_vmcoreinfo_init(void)
> >>  	VMCOREINFO_STRUCT_SIZE(mem_section);
> >>  	VMCOREINFO_OFFSET(mem_section, section_mem_map);
> >>  	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
> >> +	VMCOREINFO_NUMBER(SECTION_HAS_MEM_MAP);
> >>  	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
> >>  #endif
> >>  	VMCOREINFO_STRUCT_SIZE(page);
> > 
> > It would be good to add one section in
> > Documentation/admin-guide/kdump/vmcoreinfo.rst, e.g
> > 
> > SECTION_HAS_MEM_MAP
> > -------------------
> > 
> > Indicates a memory section has struct page array (mem_map). User-space
> > tools should read this value but not hardcode it since the bit position
> > could change between kernel versions.
> 
> I'm not particularly happy about having core-kernel defines documented in
> kdump/vmcoreinfo.rst, though?
> 
> If it would be something vmcoreinfo special, sure. But not for basic defines.
> 
> "See the kernel source code" is really what anybody using this should be doing?

I can't remember who suggested adding this document. The benefit is
users can read document to understand how it works, no need to look
at the code. I don't have strong preference on this.

So I am fine with both. Or we can add it if anyone really complains.

For the patch itself,

Acked-by: Baoquan He <baoquan.he@linux.dev>

Thanks
Baoquan

