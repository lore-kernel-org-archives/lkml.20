Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59939449B1B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386483; cv=none; b=pOllyh2odrBwxUZRV3GHCIbEwWRsAaQCtdtKJ8e1DvWyrYSX5Ai1DqTNJ1gx1R2f1gLMd/vmEyYrWE6ovSi+KoMxgosiQRGuXeP3DoK8jWGAnH2zurJ61DxwP9cdvaLEM5v+0e5fwvp+n1ZmfxnhIi0PldMm30bB28FB7tfnzZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386483; c=relaxed/simple;
	bh=E4ohnOIq6zfI28XKOV2bCDtgBX4+Hdvc9ipS4oTiikk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRZS0wi3PLjdvjY6pFw/KhC9jkbV+cRrK/9qKaOtUUFDMXOBJHUFD8lkKAlIoIroMjx9+nm0gc3OPUBmLHGAUhBQUl+NvDK9xW4lSYsbtp6CXk+EB7PmNNAyjl3MqN2N7kQuuifRIPAOkU+6JbzaQJs3d47J+qeojKGL6WHmH0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=l5MB2Zef; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rDKaeYhm; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="l5MB2Zef";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rDKaeYhm"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 5BD41EC05FF;
	Mon, 14 Sep 2026 07:48:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 14 Sep 2026 07:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789386480; x=
	1789472880; bh=nhu7V+ysH98/aFNClZZEmMq7xZMdgb3VIE7Ho88hbAk=; b=l
	5MB2ZefBlmvesAgmegSkrGLzkzUf2gH3U5D432D1ny0V7nL8YLSkYuZ2D6ATxm22
	avZ/TjBHt/j9LQS6NcNzFeryvg3sRc9+6JslC9ScUOGGcMybxmuVXDS1IzeAcqwe
	BxWxQsQ9LxiPEwg4TtRWRNf2MOIfqVWwfEfAFBcE7+Foy+w3y4N9s3nitkqlnU8k
	95MZggqPBOXjOkUVju6CO3CLKAQ+LAkCZo0os63UhtnQkkv5v4cgN9NBcUMsNbCr
	4ZSo37ulhtbFZoXlVgX5xrD9ywd4rR+8HaPJhJfXlYJRzlTDquL6Ee98q2bZNHgP
	cg6gmjMhv9l/1zrbBmfGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789386480; x=1789472880; bh=nhu7V+ysH98/aFNClZZEmMq7xZMdgb3VIE7
	Ho88hbAk=; b=rDKaeYhmXC1vA6tII0/v2IWlw45I+CIz5y+PyQJko5qMA88e5Pc
	aDlfHl98tvjK35/OG3hY309WAGZwAiedhf3uJHnttdmWMRAhAlnBo39G8mm+Sf4+
	G+NJgo32lIBOZRgpAlp6j4eV9Q1LJpO34KO14inUbwM5J6QzEmQpLRfHjkTzPtFi
	ZJM+CRK/kuOjftxhvfAR41Zyltqt1LYHwTScalS7rLZqoiAxGGqOp4OCGROcc1iT
	9RBmvbvrWi4CSPDBhrvl+70wRdu3qg1GOo7w3UM/WmSV2a5MZ1nj1ajVSnbqcvki
	boST5mrvwYoZGlekP04PcV1p26cWNgl9DlA==
X-ME-Sender: <xms:796nahitoQWg6_0Bu4nPdqdhLnV-iNvZm4Grd3wXJvdXcCstg7WFMg>
    <xme:796najr-GVfeZqTMBjxctNrIBqVWwmhrnOhgvRFujLVYHMpCzFYWRXg9kepb03Edh
    x_Ecepxo8ysOg1MLkZL2FJsvL-QTe48OiVBjCpkDPZbvsX1Q1-Eznpi>
X-ME-Received: <xmr:796naofsKemcZu_CAW9HAOOV3eqUWUrXyee77KTxNrsiIArkK0tUeQH7HAI>
X-ME-Proxy-Cause: dmFkZTFYcUDJMowE9JN8nz4OFx+gVOBEBH+t8GLwIW5cVX5aQlsigM3WocSdwL8FChn2PE
    lm1yyhomAKAJMsKZ0vvOqI09MOV52VgTbuJ2eXgyibnylHJIBIL41ORpFpFRHfz6VdI8Kr
    ViGFqPZEuxqogt0cVWqO5e3fxEXI/CNRXfQ15Mf4uMTo2wwuFNQlHQ4gOggsEb0117tCyF
    zUoiwPml+9T/CyB9dpoVPqfZv4uaL+ABItxp0DoeXXWIbjrFI4Iq+8/t4v4Bz311MZgpQV
    I7ssRm+d+zUxAOgskWGBnF1dhbKa8MKw7VBGpWOsHDCxNJd2YafXAVeIGPFBy3duUVW5fF
    HPh7v++Vv7JUwSdVperfS+M7kvVowFLBOvvFJlH/bI2I/ou9RQvV4BO8kM8aFY+NMzf3IW
    /6saKp/FzRF5O5qfv9I2rZLSvlcLyUi42irbeRCBzChi1NM8DzeN61fKNtpfGro1EEFaqz
    KSo9NbleERAQ7LXogIoLaK0dCmjibUiLv1CrgN+v2tQX+pCyACUgXPeX8L7fPy59WOd0tC
    +OB8xVe3L0PCXcwfZgJ1oz7BxBu67aZS1PKe444p9swprWoir/EpwI1bN645lL0isBZCA4
    DhuD6XPWZoqTqHNTo8CRWH6SaxTAfq/u/QxDNY292I031PqUzEVNpJNzT9Iw
X-ME-Proxy: <xmx:796naufL9uE9Mj5woEUD2SmDXmm_rvJZL-mGpPSlUG1e4WVOMVro1w>
    <xmx:796namcTIkaiyydLJyIfWlIJ7MFQmJmo7D25jhffxVpg2jLX-jlGUw>
    <xmx:796naspNdJKdirZ481GEzlfiNQ-UnkB0SANiszav3T1jnWx7uFq4Kw>
    <xmx:796nauzlfsZtMmoYj_a1k0l1GPPCArGSFTkcohmTtdmmTuJKmwwnlA>
    <xmx:8N6naqmDAzD2Xx4pKOtBKOkHD9AxLr8fnjsJmL0rcXRXoAZrVLx4Nc6V>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 07:47:59 -0400 (EDT)
Date: Mon, 14 Sep 2026 12:47:58 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v2 09/12] mm/collapse: open-code collapse_single_pmd() in
 its two callers
Message-ID: <aqfeuAPx3lCKSXtd@thinkstation>
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-10-kirill@shutemov.name>
 <DLCTWPIN1HRO.2HK4RPZ43F301@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLCTWPIN1HRO.2HK4RPZ43F301@nvidia.com>

On Fri, Sep 11, 2026 at 06:09:32PM -0400, Zi Yan wrote:
> On Thu Sep 10, 2026 at 8:02 AM EDT, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >
> > collapse_scan_pmd() and collapse_run_pmd() each have a clear locking
> > contract.  The scan is called with mmap_lock held for reading and returns
> > with it still held.  The collapse is called without it.
> >
> > collapse_single_pmd() kept that boundary inside itself.  It dropped the
> > lock on some paths and not others, and reported which by way of a bool its
> > callers had to carry along and then act on.
> >
> > Open-code it in the two callers.  Each scans under the lock it already
> > holds and, on SCAN_SUCCEED, gives the lock up before running the collapse.
> > khugepaged's lock_dropped and madvise_collapse()'s mmap_unlocked both go:
> > the code dropping the lock is now the code that wanted to know.
> >
> > khugepaged's walk carries on to the next table while the scan keeps
> > refusing, and ends once a collapse has taken the lock from under it.
> > madvise_collapse() re-finds its VMA after a collapse, which it did before,
> > and now uses a NULL vma to say that it has to.  It still reports the drop
> > to its own caller, from the line that does it.
> >
> > The lock is given up and taken again at the same points as before.  No
> > functional change.
> >
> > Assisted-by: LLM
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  mm/khugepaged.c | 102 +++++++++++++++++++++++-------------------------
> >  1 file changed, 49 insertions(+), 53 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index c26907300c23..9bdf12128357 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -2857,28 +2857,6 @@ static enum scan_result collapse_run_pmd(struct mm_struct *mm,
> >  	return result;
> >  }
> >  
> > -/*
> > - * Try to collapse a single PMD starting at a PMD aligned addr, and return
> > - * the results.
> > - */
> > -static enum scan_result collapse_single_pmd(unsigned long addr,
> > -		struct vm_area_struct *vma, bool *lock_dropped,
> > -		struct collapse_control *cc)
> > -{
> > -	struct mm_struct *mm = vma->vm_mm;
> > -	enum scan_result result;
> > -
> > -	result = collapse_scan_pmd(vma, addr, cc);
> > -	if (result != SCAN_SUCCEED)
> > -		return result;
> > -
> > -	/* The collapse takes its own locks, so give this up */
> > -	mmap_read_unlock(mm);
> > -	*lock_dropped = true;
> > -
> > -	return collapse_run_pmd(mm, addr, cc);
> > -}
> > -
> 
> Sorry for walking back on this. I think collapse_single_pmd() can be
> kept and still get patch 10 to 12 applied. The reason is that by looking at the
> code after patch 11 is applied, the collapse_scan_pmd() +
> collapse_run_pmd() patterns in madvise_collapse() and
> collapse_scan_mm_slot() look very similar. And it can make
> collapse_scan_pmd() and collapse_run_pmd() internal with only
> collapse_single_pmd() exported.

I gave more motivation in my reply to David:

https://lore.kernel.org/all/aqQf9hSy0iNjnL6t@thinkstation/

Short version: scan and run have different locking expectations, and
the split puts the boundary where the lock is. It is also what makes
moving the scan to per-VMA locking trivial, since the caller owns the
lock and the engine never touches it.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
