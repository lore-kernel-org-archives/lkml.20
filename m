Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A919D07E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449595; cv=none; b=F3ZRPJ3GnLvu8kg3KJRXngkI2fyWRrF7YIPAU+De4YgGR4Z7XOwRF8Bb3EQxn27CHZus+w7vcXCJaqLpAZZW/aRbeTYTVdx3iXoXA+Pf4Aii+FgRPtNvheKkl3C92570slxsLqLgP6q3CNSENEAEYzgx0ugVOoE6M1/TFQpEArw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449595; c=relaxed/simple;
	bh=gNcrHum2h1i2kbH/WlpN4W1849JxGf0TTmLYcZ1KnuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBVBaC92Ojbiulw7pIG4hNzsUTteAGtB3y89P/esKVMzXq1XzOjFoLx5t61MK3UQq9kNu3O12TucwLbI71xwoZHSQGzMo9TAV++eFf/ky/bPyFcCSeL6xXQzf4PGXdNeFYJEX3ekqls8fz2JuoRWYEt+tA01r3Qwkzkp2YZSyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=OUqpzMmO; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="OUqpzMmO"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-939b5ded99dso406662085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789449592; x=1790054392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lEsdiGwvz+hN4Uya5W3W3ek2drBfy1jE28a344uCWRE=;
        b=OUqpzMmO25Fl+87v1LLlDKTdA2kIZn3fmOLs0cVl6ft8sVjpXT41CMWDS08o7LqM5n
         V5HQV6cnszb5CIVbsmv/sDLnantxrZRYXKBt9sJPsJq+F3ZKb8NvsprTxyTkDigYEyhi
         D/xabZGF8685UuBXDxj3BlbqkhfXZa0BIWgVvgF86I0zKgnB8cfPsT757usqTXPdUcgr
         jI3YBPfMEli3BoLzpfwpq3u+VjStd4e+D3a52iRhJUPqWIAU7kzX8tZn+FUoi9AZsQ6l
         o+r2j613A8hFAMItvxjvqKjl8wDj5oisjMMOCg4ywgxTUrMy4YaO+q2OOYs7l/1zULte
         PqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449592; x=1790054392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEsdiGwvz+hN4Uya5W3W3ek2drBfy1jE28a344uCWRE=;
        b=wWlcyNNeW8/ZhjjhQgj2UVJ8eBx/+4nP21Wzye36XC8yL6kEdQbtAx09DvAVCq5ViG
         gWd0MM/4cb9bsEArjitpK51JbIU+uSFPiU4UagktugbgZwMYDs2QNGffwU29Qew/USML
         1dwFFt9W+Yk+i32QVb9ivsuYAqaIbF7W1g4HkU35RuitOjGkV91JMAqrlcJXU6XDyjBQ
         TopYYgKDUaikDjs6RaCd2mUI0YpP4lIFkLn86y8lKtdC4EM90W+PYAcebP+4PvZR3zC1
         HUSBXgZoPLe5jhQzzE+bVIzNIWQ02gJJyt1s0y0W6oP4jAha6r+4FKgtJVqoZYGk7fI/
         T1qg==
X-Forwarded-Encrypted: i=1; AKwUvBwlnuDZ+8HLieBghCLAIPNMb5FanujXMaeQpKnWcsKdujesJjJNo3pdLzz10F1FM40P+yGO4t5+M7CgLE4=@vger.kernel.org
X-Gm-Message-State: AFuF++nK0SryY1za/eI45oZvFUPqqgNq04i87t+nyI/emyo8zrrUt2c6
	QkNvSUFHZ2EQ62X1iF2giyt09NHCWp/Z1xDoxkoQASUcMH3g5eMcC595qTu4vqvlC7w=
X-Gm-Gg: AYBFou0aRy0GTyu0nOxTDBq+QQ/7vMUprmgio7rWvfog0sit/0FbFw+B4ZMXTAv6zhE
	PL50zmzVO3VDVV0WHMnEusfBLw/cBAzOhCdcH7uAFlH1RuMhIxgpu10poByfO9s0IMu63s0TM4n
	ySUjGl6YZ9q+gB0N14TLyt+0/TCDFYo3ZsF6qSSVrE7WG99fIamNcQf196QsWaNTqUVkA3HVzO3
	EO2ZPpNMkBQ9dMSHtwuVukWwjFe84lcWZey+KobLz4ziE1MMtDQ4BcGPME6019klqVq4TH4BZfV
	PLGHJ2qS8j9Rp1OExH0J38fLe3JtlQUl6pohTJOHmVTM5n6VfpxaytmHAaErL/Z58GbUuViWv+9
	MZq2M5lCnd1oqjJAk1WKis/LgGQhu68EystRhfFgO4Arc52pXYto0KVLmhklUqxI/skrYOJUose
	mKIdUWtsLD0AkArTQV873/lcGMt6GeTM3g6/fTRa74ORjd9PtJiwWnJcwRE8B9Wj2eQWIEBft/S
	a6oMsBKBhtRq+x7cWSL7O83TCNvesQjhfSEejpHK7UdUr9d0WSIpck=
X-Received: by 2002:a05:620a:45a9:b0:936:576e:227b with SMTP id af79cd13be357-93a29939976mr829769385a.24.1789449592537;
        Mon, 14 Sep 2026 22:19:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e811b572sm1191802485a.47.2026.09.14.22.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:19:52 -0700 (PDT)
Date: Tue, 15 Sep 2026 01:19:50 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, jannh@google.com, pfalcato@suse.de, peterx@redhat.com, 
	jgg@ziepe.ca, david@kernel.org, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] proc/task_mmu: handle special PMDs in clear_refs and
 pagemap
Message-ID: <aqjS0xWes7fhhI9A@gourry-fedora-PF4VCD3F>
References: <20260912122822.3348978-1-gourry@gourry.net>
 <20260914214910.a22cfcdc250bfbb6b14edaf8@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914214910.a22cfcdc250bfbb6b14edaf8@linux-foundation.org>

On Mon, Sep 14, 2026 at 09:49:10PM -0700, Andrew Morton wrote:
> On Sat, 12 Sep 2026 08:28:22 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > mshv_vtl_low can install a special PMD from a PFN supplied in the mmap file
> > offset.  That PFN need not have a memmap entry.  Reading /proc/PID/pagemap
> > or writing /proc/PID/clear_refs for such a mapping oopses the kernel.
> > 
> > With a test driver mapping the PFN at the 1 TiB mark:
> > 
> >   echo 1 > /proc/self/clear_refs
> > 
> >   BUG: unable to handle page fault for address: fffffb5b80000008
> >   #PF: supervisor read access in kernel mode
> >   #PF: error_code(0x0000) - not-present page
> >   RIP: 0010:clear_refs_pte_range+0xb1/0x1e0
> >   Call Trace:
> >    walk_pgd_range+0x50a/0xad0
> >    __walk_page_range+0x6a/0x1d0
> >    walk_page_range_mm_unsafe+0x193/0x230
> >    clear_refs_write+0x18e/0x3f0
> > 
> >   pread(pagemap_fd, buf, 512 * 8, addr / PAGE_SIZE * 8)
> > 
> >   BUG: unable to handle page fault for address: fffff57840000008
> >   RIP: 0010:pagemap_pmd_range+0x3cf/0x6b0
> >   Call Trace:
> >    walk_pgd_range+0x50a/0xad0
> >    __walk_page_range+0x6a/0x1d0
> >    walk_page_range_mm_unsafe+0x193/0x230
> >    pagemap_read+0x1dc/0x350
> > 
> > clear_refs_pte_range() passes the PMD to pmd_folio(), while
> > pagemap_pmd_range_thp() uses pmd_page() followed by page_folio().
> > 
> > Both paths assume the PFN has a struct page and dereference bad address.
> > 
> > Use vm_normal_folio_pmd() and vm_normal_page_pmd() so clear_refs skips
> > folio operations and pagemap skips folio-derived flags for special PMDs.
> > This matches the PTE paths, which already use vm_normal_folio() and
> > vm_normal_page().
> > 
> > Fixes: 3c8e44c9b369 ("mm: mark special bits for huge pfn mappings when inject")
> > Cc: <stable@vger.kernel.org> # v6.19+
> 
> Why cc:stable?  Is a crafted test driver the only way of hitting this?
> 

Technically reachable via mshv_vtl_low, so i tagged it stable.

It's hard to make a judgment call on some of these - so I err on the
side of backporting.  Feel free to drop stable if you think it's not
worth it.

~Gregory
