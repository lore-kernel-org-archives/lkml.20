Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720E237B02D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784004; cv=none; b=sHnyDRSRBZf/I2kIBRjpggspb+X1ZMsH8KVCcjzQAqvJS76Z1E6Wx7haauLAE8r+BjnVmJ3dQ7qC1pOFRquVOMYIlAud76TOqo+bX4ZOiSqnH0Pj7kVVoaqrpeExlFxqVU/wf36L9JMluATy3v+gZSs1gjPo4YyxShTBHCVU3ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784004; c=relaxed/simple;
	bh=/A6D4v8ejedcMyPFP/qMNPaXrr8vdxHrFJElSqNRnEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roQ5ScAK5VKz7YonyR2MlHIYVNUYsRA723g7cN/rCH7VMs2W/OOddeDQ3HlFPsuVk7qofcTqvZAtLUvbSrWQcIExsncoJDfvjeXMrYohlHVS/HHlsGgOxLis7Sfc91s53eppeqs+EBgW1ZCo7F6kJrMRJmSCDmewBukc0q11AHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=d8vriQtM; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="d8vriQtM"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a860e532eeso52034897b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790783997; x=1791388797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMxQ9b6X1p34U0/6ooz+lLlNpeyvqyp2NfoWFlwIw1I=;
        b=d8vriQtMPsP6YqOAez7mbzjaB8HqhW9/tWO7SDzrOD6flKdAUC5cPxDbe5WwP/+yTU
         1uZMQKlmxd4Ymjo0zt1QcYRuLpMa7RpXo0SAFDfliFle3c0dv8CxeiGH03o20mihOy/y
         95DUJ0JGzbVGb+Fz0MpOILgE76hU44vZwGx3zmWocNho2b/oHvH8Hoqf4h78tQzuMhZC
         GMDv0KmcH3EVoXV1fJS9iAwf6o1rCvaikh5B0u5f1egEj/k1Qmbv9jyrI/0rg8ftkGyu
         1AoXCZY8ZOPUM58Mcrho+QNb3Tfxb2Z5nfubXyKUYyELIb1/PJ9pzxI083Z1RiK4p1UX
         tSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783997; x=1791388797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMxQ9b6X1p34U0/6ooz+lLlNpeyvqyp2NfoWFlwIw1I=;
        b=vq534uVFhIhpp7zXfCd1ysakx7Iw4EG87w86dEUbFQZtQnRsCFr5Ads/U2FZ37SNKt
         u1WIiUgh/Pj0cDv026I+mjUXNE+vg86cZQoUbuBr8/ZmsYdtxSSnBJTMdB9if/2fKrZ9
         iaHlKf3apPHwfBQwrNnDxqcpv4FVHcykdIzGcg0Hq1qMc7/2FFzggRSHNo4FFCG6oXeA
         oV+v7CBeFtR/T2Em1257FhlMigh7mBOrn+32C9WVoNZ2f5zUKQEIVishvIHoRvgzxCet
         eeItp6dp5NtjYQKspgUCc3KGRW6j27lXM1vLkzlVRmrwFjz4VCS7oNpKB2XVqxyJU/8D
         WBpw==
X-Forwarded-Encrypted: i=1; AKwUvBwXlD0uyra0rXTVqpc0jj1ZIT618f5f9I6zB7kl3Im7lmtBLR8fYX1VD11bYL+VYj05n4x/ROa7qlGBLyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKasJu8XLEwN6GBQUexyL1sYoKBdrCpXiV9BeJv8HpnBEiPwWCR
	o+Zuce2Mzh3CpJ/a0Vh105T5ofd326q1VdFAqN/e5uYjUXLepzq5ReYtuwGZqXuoAfY=
X-Gm-Gg: AYBFou2CwMpA2fV9S9lFfc+TY7lcA9VhcP50mZW6LRs95GGQmCp263weFUCYOIm1d6I
	kSGK7FLtx3+yzlX3j1POz0WWRBJXs3+RDP3kwaUQsUeFy9+FgKtlmAj4/cahRIZwrKiaPkfIh5b
	VE3QTJ5kE7kKAavXHcVvua92tu4+z2mWxougxDxP/5KDHK3Ak90baqi7IszNOKp4FsQG7uBSRyb
	HETwRZk792MFKIf1K6cIkUtGCITRlZT9ILYTbPtwecqTEQmvtgQFcJijI/78Wyhds+rSek6VS4e
	Lj7+LSD/3fa0sBAGxyf3HbhXafROVxoAf5mlsV85Wvg7houpX14ohugP+XQ2DdN98aJvTToD6ks
	wdMbbkVr/OjcKSnzga8LRyBy/SXdKw/ZiAB0rRK9MqWjqp1pPxDgbJoV8+5ESx/MBlY1gcSBZe3
	+1R8dlI1tAJzF8RcJOOcq2gF3gVhDrC9YcsNZL4DmgJU1BluKqURLRC6juaDp6NBlE24VUOMLTM
	smenqFYFj2fzsBnOZ+3zLAt8Rfa2bz/Kf/30Q==
X-Received: by 2002:a05:690c:9990:b0:89a:63da:fa90 with SMTP id 00721157ae682-8ac93318690mr7925077b3.75.1790783997212;
        Wed, 30 Sep 2026 08:59:57 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdada3294sm380647b3.47.2026.09.30.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:59:56 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:59:50 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/mremap: fix two issues with MREMAP_DONTUNMAP
Message-ID: <ux7od2uydetgsu3dpy6mmilhqm5phhnk2ioxn54w3nb3feohxf@2jqovoqzfs4n>
References: <20260920-fix-dontunmap-partial-self-merge-v1-0-6ffb556f8f8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-fix-dontunmap-partial-self-merge-v1-0-6ffb556f8f8b@kernel.org>

On Sun, Sep 20, 2026 at 03:13:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> The MREMAP_DONTUNMAP feature is highly unusual in that it permits mremap()
> operations that keep the original VMA in place.
> 
> Historically this has led to a lot of bugs where non-obvious interactions
> occur between existing mremap() operations and the original VMA.
> 
> Commit 397432cab17b ("mm/mremap: account mm->locked_vm correctly for
> MREMAP_DONTUNMAP") fixed an accidentally introduced bug around
> mm->locked_vm accounting, but this wasn't the only issue.
> 
> And thus history repeats itself, as it turns out that mm->locked_vm
> accounting is broken by MREMAP_DONTUNMAP yet again by two further cases,
> and has been broken ever since the feature was introduced.
> 
> Both relate to the fact that VMA_LOCKED_BIT is cleared on the source
> VMA (it has to be as all page tables are moved):
> 
> 1. If an unfaulted VMA_LOCKONFAULT_BIT anonymous VMA self-merges it
>    clears the VMA_LOCKED_BIT flag and permanently leaks mm->locked_vm
>    pages.
> 
> 2. If a partial mremap() is performed on a locked VMA there is a leak equal
>    to the number of pages not copied.
> 
> (Both for MREMAP_DONTUNMAP operations only)
> 
> Both issues can be fixed by treating the source range as distinct from the
> destination range, which is the definition of what MREMAP_DONTUNMAP does so
> is appropriate.
> 
> In case 1, simply disallow the self-merge, keeping adjacent source and
> destination VMAs distinct.
> 
> In case 2, split the source range ahead of time, so accounting is always
> correct.
> 
> Both changes were tested locally and confirmed to fix the issues.
> 
> For the purposes of a backport, the fixes are kept distinct, a follow-up
> series can add self-tests.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> Lorenzo Stoakes (ARM) (2):
>       mm/mremap: fix locked_vm leak from MREMAP_DONTUNMAP self-merge
>       mm/mremap: fix locked_vm leak by splitting VMA for MREMAP_DONTUNMAP

Hello,

Apologies for the double mail. I did not hit reply all first time.

I am seeing some failures in the proc_maps_race kselftests after
this patch was added to linux-next. The failures are in
test_maps_tearing_from_remap and test_maps_tearing_from_resize. I have
attached some logs below

# #  RUN           proc_maps_race.maps.test_maps_tearing_from_remap ...
# ==== Tearing from remap ====
# Before modification 
# 3fb317e000-3fb3181000 r--p 00000000 00:00 0 
# 3fb3181000-3fb3184000 rw-p 00000000 00:00 0 
# 3fb3184000-3fb3187000 r--p 00000000 00:00 0 
# -----------------page boundary-----------------
# 3fb3187000-3fb318a000 rw-p 00000000 00:00 0 
# 3fb318a000-3fb318d000 r--p 00000000 00:00 0 
# 3fb318d000-3fb3190000 rw-p 00000000 00:00 0 
# 
# After modification 
# 3fb317e000-3fb3181000 r--p 00000000 00:00 0 
# 3fb3181000-3fb3184000 rw-p 00000000 00:00 0 
# 3fb3184000-3fb3185000 r--p 00000000 00:00 0 
# -----------------page boundary-----------------
# 3fb3185000-3fb3186000 rw-p 00000000 00:00 0 
# 3fb3186000-3fb3187000 r--p 00000000 00:00 0 
# 3fb3187000-3fb3189000 rw-p 00000000 00:00 0 
# 
# After restore 
# 3fb317e000-3fb3181000 r--p 00000000 00:00 0 
# 3fb3181000-3fb3184000 rw-p 00000000 00:00 0 
# 3fb3184000-3fb3187000 r--p 00000000 00:00 0 
# -----------------page boundary-----------------
# 3fb3187000-3fb3189000 rw-p 00000000 00:00 0 
# 3fb3189000-3fb318a000 rw-p 00000000 00:00 0 
# 3fb318a000-3fb318d000 r--p 00000000 00:00 0 
# 
# # proc-maps-race.c:1081:test_maps_tearing_from_remap:Expected 0 (0) != capture_mod_pattern(self, &remapped_last_line, &remapped_first_line, &restored_last_line, &restored_first_line) (0)
# # test_maps_tearing_from_remap: Test terminated by timeout
# #          FAIL  proc_maps_race.maps.test_maps_tearing_from_remap
# not ok 3 proc_maps_race.maps.test_maps_tearing_from_remap

# #  RUN           proc_maps_race.smaps.test_maps_tearing_from_resize ...
# ==== Tearing from resize ====
# Before modificationB
# Locked:                0 kB
# THPeligible:           0
# VmFlags: rd wr mr mw me ac 
# -----------------page boundary-----------------
# 3fb30a0000-3fb30a3000 r--p 00000000 00:00 0 
# Size:                 12 kB
# KernelPageSize:        4 kB
# 
# After modificationB
# Locked:                0 kB
# THPeligible:           0
# VmFlags: rd wr mr mw me ac 
# -----------------page boundary-----------------
# 3fb30a0000-3fb30a3000 r--p 00000000 00:00 0 
# Size:                 12 kB
# KernelPageSize:        4 kB
# 
# After restoreB
# Locked:                0 kB
# THPeligible:           0
# VmFlags: rd wr mr mw me ac 
# -----------------page boundary-----------------
# 3fb30a0000-3fb30a3000 r--p 00000000 00:00 0 
# Size:                 12 kB
# KernelPageSize:        4 kB
# 
# Expected stats:                                                             Rss 808 kB
#                                                              Pss 86 kB
#                                                        Pss_Dirty 51 kB
#                                                         Pss_Anon 48 kB
#                                                         Pss_File 34 kB
#                                                        Pss_Shmem 3 kB
#                                                     Shared_Clean 696 kB
#                                                     Shared_Dirty 84 kB
#                                                    Private_Clean 0 kB
#                                                    Private_Dirty 28 kB
#                                                       Referenced 760 kB
#                                                        Anonymous 104 kB
#                                                              KSM 0 kB
#                                                         LazyFree 0 kB
#                                                    AnonHugePages 0 kB
#                                                   ShmemPmdMapped 0 kB
#                                                    FilePmdMapped 0 kB
#                                                   Shared_Hugetlb 0 kB
#                                                  Private_Hugetlb 0 kB
#                                                             Swap 0 kB
#                                                          SwapPss 0 kB
#                                                           Locked 0 kB
# Actual stats:                                                             Rss 808 kB
#                                                              Pss 98 kB
#                                                        Pss_Dirty 59 kB
#                                                         Pss_Anon 56 kB
#                                                         Pss_File 38 kB
#                                                        Pss_Shmem 3 kB
#                                                     Shared_Clean 696 kB
#                                                     Shared_Dirty 84 kB
#                                                    Private_Clean 0 kB
#                                                    Private_Dirty 28 kB
#                                                       Referenced 756 kB
#                                                        Anonymous 104 kB
#                                                              KSM 0 kB
#                                                         LazyFree 0 kB
#                                                    AnonHugePages 0 kB
#                                                   ShmemPmdMapped 0 kB
#                                                    FilePmdMapped 0 kB
#                                                   Shared_Hugetlb 0 kB
#                                                  Private_Hugetlb 0 kB
#                                                             Swap 0 kB
#                                                          SwapPss 0 kB
#                                                           Locked 0 kB
# # proc-maps-race.c:1050:test_maps_tearing_from_resize:Expected 0 (0) != compare_smaps_rollup(self, &orig_stats, &stats) (0)

I'm not sure if this is inteded or the tests need updating.

While running this selftest in LAVA, there seems to be another issue
where the 30 second test timeout doesn't seem to work properly. It
appears as thought the test has hung. I am still looking into this. This
issue doesn't seem to happen while running the test from a shell. It is
probably something to do with how LAVA runs the test.

Regards
Anirudh Srinivasan

> 
>  mm/mremap.c                   | 87 +++++++++++++++++++++++++++----------------
>  mm/vma.c                      | 19 +++++++++-
>  mm/vma.h                      |  7 +++-
>  tools/testing/vma/tests/vma.c | 10 ++---
>  4 files changed, 83 insertions(+), 40 deletions(-)
> ---
> base-commit: a3d0117e02bfa1c3bb6c50e7afe42bbecdbb3459
> change-id: 20260920-fix-dontunmap-partial-self-merge-74a98b1d5a65
> 
> Best regards,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
