Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF74AA1E6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567073; cv=none; b=ruXS2t1Z+HJNw8TqVNSH3WpH6RnJrqhnraTCiuEEazt2/uZQrURFU5UWAr+ggoCl5oOuCtlxWcJjidWrHLGsrkBDLIMduYVRuWWDZWsFAm0XCWEE2v5anWXDIRuxolaDGr0T9Xx7gCOiySA6zOS4uDtw88HERUqXhewTgTyScHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567073; c=relaxed/simple;
	bh=k5W0zjS7CwXnvjPVXGCX/DoYC/ezZOX79HkT4Hgmv9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUSPnCL+II7XbAe2LR1/3/lBomZTsa8OvYde/i6kc69HRsKcnQY0Rda0/ZP51LgHMN+ZkVsLjA1yF7rbMh1NYDVkLYHbaBVb0z9/rn9UP8vTUGIG0dO8yzaeiHRAWss5C5YJdVOimxLc4MHhtpTI2fupKWzBgBkTNglarVcad7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Mi55x4CB; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Mi55x4CB"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db0aso9124286d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789567067; x=1790171867; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgUHPiwSi16km0SbObf2vOYCgqHRbxyVwtkEbeNTtkE=;
        b=Mi55x4CBpoqhvTMyVVz5iCrVRj/v9TPyIIjcaIg//Oj9tJgfjrnl/LM1kKOMfYJOSb
         Zoy6pY/D5XNuiJlatJxbEOLVKCP+r2rJeP/nEzI/UR76453FyqGBgejRADtvtRMMq/3I
         hxAQDIKTy9wjI/O0aGYwg1aC1Gk1FesWgj/nGT+4Q+T90Klx6AkYsEI1eEs9rRIzM8dC
         F2ilwcBDBwxxNoz7jwpWE+XCYRAE213GvrbNGPDHDFR6zcS1IgXhZBE3wUwhiQQt5naH
         WJ7qJ9+qFBW2QcJg8QWAfAQJWSLPlxLXaUVepjU1qDEvnk995ZKy+FMwH57fYh2t+YAq
         MYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567067; x=1790171867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NgUHPiwSi16km0SbObf2vOYCgqHRbxyVwtkEbeNTtkE=;
        b=d2SbnRX5iEhxtujpCCkY8HscrlRdKsufOBNfzR9pGGQJPZsc2w7fwxdIp2/0c7d+3k
         mrgQG5R/+UAhou53R2CfuUUMqWY4XfDBZoO9DW5jsAvdimpJVtdAOSxJxxi9L7Uov/Sz
         dVXG3hoR9uDxtCY3SHK2OwQ/JFni91CpmrqBQQQNFD59rO9XwFznY6XIPXXIjMa19zOd
         kjgtvtkrcXE3xX+31U6Sg+yhuEzLXTlyTvhAkZbRuE5j8XUtGiGjwZzAfQ5g0p6Qf5M/
         v15YadKxApzwihUj+S0tyyc7+XnviMHJE/26HPRSxOMyajrtjOqCGEdH7doQa3J1eJ2L
         U2dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeJEN6Yy3azvP7FiYA09K9Mrk5cbxf2sEaYAAPsiTJM8wElPUOgEJQx6ZGPeGuANUADIlCRaxyvUeFg6U=@vger.kernel.org
X-Gm-Message-State: AFuF++nexKUDwmLYU0CoX38TO1gYWNz6LH1x74xxFPanMijNNgFEOzf4
	yt8VnWFDZgMR+S2iFZtfQKZL7t8ak2bmxnFicYxH7k26asknEs0ciFNWPCdU4hoTk/Y=
X-Gm-Gg: AYBFou1SZbnBenRt/M4PLHZPCEGsWhxpiqJW9tG7hVqgPoiexvJi4PRUANIbS6rGVwE
	eBg8zFUtgEh9wgVo12J4sf4gGVjqSjpll/aFKxevNW5opMS4uY8KoQ/R3eusGJk6ozerF4ugj9y
	XeXn/IZHdLWg+ULgt/5b7TlUZZP9WJiB8l2b0yfYmGPWSGrvm+JaC8y7J22WabHjwaJNlFO/Pew
	rjnQNNNA45FntRMDcdcNc7w82Ubzi2zXDSDfnJBg5Yy8/lTEDCIf2Ztq16yJhenzuYR+4Ctd2c/
	YTrIfyRgEX2Yss4puNRHp6nv9xAsgzsaRtUDeYPxqlnmDSNyoQUlCFNaZRNUMOHlvYZgSmug8Pg
	X8NUVORZkz16iG0pNHRxC17AZdLncv/bRRGVUr5+ilNLlpmQpN4RvvSlwhR/vSKPtim06h5Dk/V
	Ma8Rrl5HBwMA9gt/2UodamCHt69wEAKbkDj7kRIQh/iJBZvMb+2FI0BL5+dmo2GqGX4Nd06TdO5
	KpCQ1mTSwkklFvZ4qOkPC2oKFQ/ZMjrNPXlqMjhmTK+t9d7Ptpxzf8=
X-Received: by 2002:a05:6214:5902:b0:910:3452:d57f with SMTP id 6a1803df08f44-9123d7b5209mr61354706d6.31.1789567067054;
        Wed, 16 Sep 2026 06:57:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beeec67sm26377736d6.48.2026.09.16.06.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:57:46 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:57:44 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, wangjiexun@tinylab.org, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aqqbB_nFAOGenDhy@gourry-fedora-PF4VCD3F>
References: <20260912110832.3203902-1-gourry@gourry.net>
 <aqloB0zm3RjJ47m1@gremlin>
 <aql65IhMobL5Al9B@gourry-fedora-PF4VCD3F>
 <aqqTbGMJL86TzDrf@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqqTbGMJL86TzDrf@gremlin>

On Wed, Sep 16, 2026 at 02:03:29PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 15, 2026 at 01:12:03PM -0400, Gregory Price wrote:
> > On Tue, Sep 15, 2026 at 04:55:47PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Sat, Sep 12, 2026 at 07:08:32AM -0400, Gregory Price wrote:
> > > > MADV_PAGEOUT collects isolated folios on a local list before reclaiming
> > > > them after the PTE walk.  The reschedule path drops the PTE lock and then
> > > > restarts the mapping with pte_offset_map_lock().
> > >
> > > Is this reschedule path even necessary? It's pretty bloody sketchy.
> > >
> > > I thought the modern approach (TM) was to not do cond_resched() and friends so
> > > can we actually look at removing this?
> > >
> >
> > Sorry - meant to reply to this.
> >
> > Honestly there's so much jammed into this function i can't give you a
> > straight answer. I can take a short detour to figure out if we can
> > rework this as a whole.
> 
> s/short detour/long journey through hell/ perhaps? :P ;)
> 

Not as much as you'd think.

I did it yesterday and left an agent to validate it overnight with
existing in-tree tests, LTP tests, and added some new tests.

The naming could use some work (cold_or_pageout -> lru_op, bleh),
but new call graph / pseudo-code:

• walk_page_range_vma()
  └── madvise_lru_op_pmd()              [PMD callback]
      │
      ├── PMD is a huge mapping
      │   └── madvise_lru_op_huge_pmd()
      │       ├── acquire PMD lock
      │       ├── madvise_lru_op_huge_pmd_locked()
      │       │   ├── process whole folio, or
      │       │   └── return locked+referenced split candidate
      │       ├── release PMD lock
      │       └── split folio / reclaim isolated folios
      │
      └── PMD points to a PTE table
          └── madvise_lru_op_ptes()
              ├── map PTE table and acquire PTL
              ├── madvise_lru_op_pte_range_locked()
              │   └── madvise_lru_op_pte_batch_locked()
              │       ├── process one folio/PTE batch, or
              │       └── return locked+referenced split candidate
              ├── leave lazy-MMU mode
              ├── unmap PTE table and release PTL
              ├── split candidate if necessary
              ├── reclaim isolated folios
              └── reschedule and restart from current address if necessary

Looks like a normal table walk now.  Significantly easier to review and
doesn't make my eyes vomit. (there's still an ifdef wart, but it's not
mid-function anymore... so that's nice).

Going to spend a little more time testing and tweaking before I post it.

I've been working on a making more extensive unit tests for certain
parts of mm/ and this might be a good time to look at whether I can
introduce a piece of it.

~Gregory
