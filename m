Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103129;
	b=eUr2N/98fyH22c1RnNk2ts5AuUs1uvz2f+/5BHUoc/iu8LaqUoss35HOtMwcdKEGSUF6
	 DgWD421nGsK/tSw36Hv1zuV9QWA/jRppqmPuoOwv0IIt6BLkIl31j/b4t8UnjX17Yd5H1
	 VTUObT62FxZzCoLPZTxSQa4V2bx9fu0IPkRrT0oV87YuG05DT2pnXlCwOGI89yzYFhrft
	 nbcOLBqhhq24Ej16S95mRHZkTDej+xKC1LP29Trd6NXebJBJIFZieTsoPpNG+iWkSw+5r
	 iS35urQBS+90W0GwGxHfjQyOowfxc6DIu4yUlELGAnwy9xxJSTsEy1FCjaTQFfSPbbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103129;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=myKKudY9AElKYbxGQePv2vddrjcLrdPLn2/PF00unVI=;
	b=0U6zQwR8C71bG8+OvqelonZndjSbzP6iYdmNjIGxFRzsTwlaV/DZZxCWQ4QZC/duDmgP
	 0EDOy6+KJrEnk70csoHuG5bvzNjXTh951R/uKqSraM/wExxiBSFE1RoDvOmk8PqlU9F9S
	 bLSF2xkxo77AB1wVKD55T2Zeyetw9/j882kRPTrPVY0M+pwBmOL45JfZz9AX78Mc0LqAY
	 7IPKaXY5fP4cTveBL75z5cHgKLB7SKjnmfQIlqs1StFngulmHUzrn+jaqDxEX/q/ZqHdW
	 FImV6Rp5pw9bCHyU5cVaOoeZDSulZRrAVQee4lDgNnb9EiV7cC4Nq2o+v4gEjaDb2yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSiNfkNt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSiNfkNt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCD91F01828;
	Tue, 27 Oct 2026 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793103128;
	bh=myKKudY9AElKYbxGQePv2vddrjcLrdPLn2/PF00unVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oSiNfkNto50HpECdbPp4NGFleAT0D4SKsshX0uko2eZJB6zT8GrhvZwDORPPoZO1O
	 xoMmi1MpobaU3S1/V3e1SmWrZ0sIdU9VZAY254h7KadNFc2qru+jwsxPh8U9Mz/RrZ
	 Wxg/DC7xiRSwJzmvunn4aTQ0QSZUbzym4BgCXVM5LuzT05n8iPNoLmbR0Q4U1upEmP
	 UwzgCRwi4tXRk2uHvnq8umLXgXztSStFIN8ua3QCCmb9yOc6Uoci2uANmdgPQBkNJG
	 zLvBMYa8SsQH2rWgRIY6DJ6IaXFHB+5HQZg+2LjMmMrrnkvcydWyIe5d2rOxPC+92N
	 gCafwxHFsOckQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id B3BBC198004A;
	Tue, 27 Oct 2026 08:11:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 27 Oct 2026 08:12:04 -0400
X-ME-Sender: <xms:DpXgapG0meWIN0OM66ofji3vvc4hNVtH0drLydv1KcNIs3ErsZpJ8g>
    <xme:DpXgassn_lZcNXJFSd8gXX8QhsKHGrp27KDHGK01N2lkLJsMN-kA-SA6sBTv8Mneb
    CuMRL_aJzmPFEkIodcySUV_VxtN9HCoV6CjJbVJGzh5hDgWtimhgNeM>
X-ME-Received: <xmr:DpXgatl5ve32KSZ52FWmLf7pa8yRPvWx_n5HehD8GDPXoMiFRmAlNElLDRM>
X-ME-Proxy-Cause: dmFkZTGe5tge3hMEKwWY8gQags5EmqESoYDA0+zWY7IvA1d+/F6MsE3Cn1soB2gZC+4C8m
    AmdeqR6xBlYdjHkIi1+xb2TKsxTiKKv5qUEaP5dpCSOsLFN98khIIpouApYCUZ9iaewTN0
    hT1CmGkfdX9omvnjCFWDGuofhrU50LyeRF23rClfUeUbjui0PU0B5qFKnfogAY0cVw9+6O
    4l2HB0vw+6RGJXa4SsnIhqMXtV9Neg0umvLPylEUbt52l2DRcdcEZf56++DvuebVy5KRjg
    xa8UyxviWzWUZZykb0Fnka1ej9fCGRTSjDsN4tbCgsE4rWbtQ4MqGo2ev5BggJ27hNHiEV
    L8ibXBG14E1YD9USjV1AJkkSV08UoWz2qtU7PPRmtKgS3ApkHJBirZCYH0ppodUqAdwlIL
    69W31hE/Gs9Y/AZ5W/Z5yKU8cWSN6msM6P2mpNzDLiMPFopbpJ7fKurotK6JPMvwtTzs+x
    CceVUI8VFllI706r169j/JZsf045pQEb/pwr7oaouDKNI3rsdfX0ZepQ2zVHs4CQOk6zY/
    VugIsLjXQosrDDGEfECKAx0oj4ODRX5noTPyeL3FIjBHTxHUsQjH8ohCl1+RbkTNnO/dqR
    jw1e2R++h7DvurnnFSeIGznQ/jdZjSoxnKgmRQCZrUCh5beAl3uD4bGaZQuQ
X-ME-Proxy: <xmx:DpXgasQ1EyxtRBs4tFiKL8tb9Hn_Y9_cB9p6DEQ5SXWv7itXQGBAwQ>
    <xmx:DpXgav7Y_iwdhRD6lPwDAiYjYRymzwiWwL5vNpdSwH-mETNsjZ8Y6Q>
    <xmx:DpXgamlH7FICF6lnNILH3u5xidPa-NkHHRAF8lynadF3sQqtQ870lg>
    <xmx:DpXgal5jGenzwm1UO_iCp-fS1b4AlC1TALorVMgfcXv_uVLHSAwGbg>
    <xmx:DpXgapx4HHMRpaZzmToEh90JxUkL7hrk0zETU6mAek0gaMBujEKHWGps>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 08:11:57 -0400 (EDT)
Date: Tue, 27 Oct 2026 12:11:56 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, xu.xin@linux.dev, 
	chengming.zhou@linux.dev, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, jglisse@redhat.com, 
	aarcange@redhat.com, peterx@redhat.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bobbypowers@gmail.com, bgeffon@google.com, 
	dplotnikov@virtuozzo.com, dgilbert@redhat.com, hughd@google.com, hannes@cmpxchg.org, 
	cracauer@cons.org, mcfadden8@llnl.gov, gokhale2@llnl.gov, mgorman@suse.de, 
	mike.kravetz@oracle.com, rppt@linux.vnet.ibm.com, xemul@openvz.org, riel@redhat.com, 
	shli@fb.com, jthoughton@google.com, corbet@lwn.net, pbonzini@redhat.com, 
	seanjc@google.com, sj@kernel.org, ziy@nvidia.com, stable@vger.kernel.org, 
	samarth.colleges@gmail.com, med08elkadiri@gmail.com
Subject: Re: [PATCH] mm/ksm: fix userfaultfd protection during merge and
 unmerge
Message-ID: <auCTv9O6F1JPyOAu@thinkstation>
References: <20261026130054.91461-1-lance.yang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026130054.91461-1-lance.yang@linux.dev>

On Mon, Oct 26, 2026 at 09:00:54PM +0800, Lance Yang wrote:
> KSM loses userfaultfd protection when replace_page() builds a new PTE
> from vma->vm_page_prot. Dropping its uffd bit lets a subsequent write go
> through ordinary COW instead of userfaultfd write protection handling. For
> RWP, a merged page also becomes readable without faulting.
> 
> Keeping the uffd bit and restoring PAGE_NONE fixes merging, but we also
> have to handle unmerging. An existing KSM page can be protected with RWP
> before MADV_UNMERGEABLE, so unmerging already needs fixing independently
> of preserving RWP during merging.
> 
> Unsharing replaces a shared page with a private one and should leave
> userfaultfd protection in place, as do_wp_page() already does for write
> protection. Currently, an unshare fault reaches do_uffd_rwp() before it
> can proceed to do_wp_page().
> 
> - With synchronous RWP, handle_userfault() returns VM_FAULT_SIGBUS.
>   break_ksm() then reports success with a KSM page still merged.
> 
> - With asynchronous RWP, protection is cleared before unsharing.
> 
> Preserve the uffd bit when merging, and restore PAGE_NONE for RWP. Let
> FAULT_FLAG_UNSHARE skip RWP fault handling and keep PAGE_NONE on each
> private copy as well. Unsharing can then complete with RWP still armed
> for a subsequent access.
> 
> Fixes: 63b2d4174c4a ("userfaultfd: wp: add the writeprotect API to userfaultfd ioctl")
> Fixes: 2d427bb01639 ("mm/userfaultfd: add RWP fault delivery and expose UFFDIO_REGISTER_MODE_RWP")
> Link: https://lore.kernel.org/all/20261019010934.697895-1-samarth.colleges@gmail.com/
> Link: https://lore.kernel.org/all/20261020055518.36087-1-lance.yang@linux.dev/
> Cc: stable@vger.kernel.org
> Co-developed-by: Samarth Narang <samarth.colleges@gmail.com>
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

Thanks for fixing this:

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

> @@ -1463,9 +1464,14 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
>  		dec_mm_counter(mm, MM_ANONPAGES);
>  	}
>  
> -	/* Preserve soft-dirty when replacing the page. */
> +	/* Preserve soft-dirty and uffd protection when replacing the page. */

Small nit: the period at the end of a single-line comment looks odd to
me. Am I the only one?

If you are going to respin the patch for some reason, maybe drop it?

>  	if (pte_soft_dirty(orig_pte))
>  		newpte = pte_mksoft_dirty(newpte);
> +	if (pte_uffd(orig_pte)) {
> +		newpte = pte_mkuffd(newpte);
> +		if (userfaultfd_rwp(vma))
> +			newpte = pte_modify(newpte, PAGE_NONE);
> +	}
>  
>  	flush_cache_page(vma, addr, pte_pfn(ptep_get(ptep)));
>  	/*

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
