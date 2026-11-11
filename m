Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794429916;
	b=OLieHPG1f0qxZ4VuxhT1j1k8fKhw91ugJyZAshr0l+mM5NDXLl2e200fx4IvLHekFFJ2
	 J+3EY/s3rS5r0t3T1vHg+N4iiBo0NIZMzopoNIj91eKXMwAgRPAzu9yrUOf953wRA5z6p
	 gZ5+i24mD6y+8qi7/hk0IFU6IWRuWb23h6i6rjFoY5u9AUUMG9LUW/2P7Q3SqS+D20tDs
	 rLQOhtkxeZ0KPgrN1DLpu9GoC5cB5lSHV1cgPIeAIZubZFSE7ywB3akFkOfFbdXXjhQSb
	 lvAgc9hTet+K0KVnupo604bGlCMJ5jXfHF8uHNJ9NNl7JhpCqNLwvX9LP2w+U2e97MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ejReHMBjl59d9ux/+j0JWqbuls8q6pULA6fL9qb3kCo=;
	b=UmYQ+mOiRdnl4oIUG6GDr6zt4LOXWtg14bY5jwDubO6flvEhY51/k2DQOawG5oijC4KK
	 zHwh8b3JVHYaB4Gnjga0sHcMlEd7cXFWsZa+VKvuwFgzP4dIiZeZUvau0KFZ92Cm59nlZ
	 MkIj7ETQIf+uFWs5+O1weOuinflO6evbzuFJ2BANVwaBglPJ6XOs3plaPaY7HuiUF+t68
	 1Ocm7MChaNEkStxZGRY8p9OA9zy7q/rqK3+6fAcQZO6q0XXKpYBtiY/SP3lTQhe3xIl3U
	 kJ1vpdtzN881IKm45i45bUvigL0K2nhoCoUtFwl5WclAaggmm0EIco+jgSIosbyJqyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q1KyT0qI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q1KyT0qI
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so2331cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:45:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794429915; cv=none;
        d=google.com; s=arc-20260327;
        b=iNtbzhH9VYJUWfB9PwASsirf+yuKaFQhhghetqvTW7tGizvKd+ZlNoNwagClv9/RFu
         g4r5Pz2M9iJHNpK9NuSY/fu2jRX1Tbmz/jE/OgWIhLJoTT55EzRqPFFRqNg9vyY9tgiJ
         2aK3ZRaV/EQcJv5/Z1Kri6Ko0od8aHIlcFyZlhKJNJKipHK332u+IRoGGCtmKdMLd35z
         1dPjU8jMm7YUa/x5Xf7nmHoOMrKI/TWsIi9iTYEx3EWD0fj2Mf9uSwS07d8AGVYPkqHT
         6biYCJaeEEmeRDWZrpmfT/HKJF3esE60NEy2fG4008R2vTq15Tr3X3zWcDmlZBeqNKuv
         Up1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejReHMBjl59d9ux/+j0JWqbuls8q6pULA6fL9qb3kCo=;
        fh=yXtfyJ4DXzVd4+t4DLKv3gRR89qMu8mT8uugFcmAeHU=;
        b=dFCVqDa8QpVJQBMClXtXGzBtL0asqf75dySPGZ5PEguXo8Vaqp04egnTJHgnWLT5px
         m92UivvUdPiHYG0wZBrPuKHrEf5+UpsWpJpIVRBGTbr3gQ0EuJKIAn90jaz0+bCr3p1j
         1rj1EhaQZi4RMCEnw6OjTAsJYQdVvNVNhjgvdkSyDC3WnDU4COTpYhk41zjMRl07vAPP
         4X6z6rVlKslXlckx8Op4BTYIqrBCEJHFUkodDYNI8jIXlVfZ4BPA4m5CZMxQtHf/BwrP
         VS8S4TDonUDjpaKsNTiA6/V7/IKK1ZqnvFE/R/wluNsH8w5D008A4btEczQUzQIvn8jX
         DLDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794429915; x=1795034715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejReHMBjl59d9ux/+j0JWqbuls8q6pULA6fL9qb3kCo=;
        b=Q1KyT0qI1jokqu0yPiN+vNrClyAIKDIN3WoZGPobyfjrxhypjqeSm/0D2J768QUBhW
         eD0wY7Cs5FYTj89g9gFYnpZq7loRbG5eU4YyJ/hxKkrmZGd87ybk48rwOJTNhp1QehtI
         lY9bUAHdhVzhLWBFomRKm6p5kQdPdLl2oPilXDE2t1zsCHGZEjqZY0TuWVqUaN0ygQcK
         nuXIFcCIPcdFTftmItrHGyk48RdDVXVjQhL/WIVNPS0vlHvNJPCJ8I6eReKs7nJM6AdF
         4Nd5G36l8uQktpGPq9OMKaoOc4JffXCGdiBpKXlbEF2htDjOQFuXOSNHQBuXGUjlFrM7
         jFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794429915; x=1795034715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejReHMBjl59d9ux/+j0JWqbuls8q6pULA6fL9qb3kCo=;
        b=U1JZ5WyTRGYoJo3uByidr9+9n8WPnpFsxf1jvI+NNb4+YC/jhgybZEyBzzTFtMHTwy
         ld2MLGfnLe3xcvY+ez/Ps3xOXE+hN27ebwfcALejr47jb9tABdsvEbWCs2KnkX/PG+9N
         LRZVWOBgXBi8tE3JzCnyBx7YAnVLmG29U9OB2g8LypKVSq+eAviq0mtkMMDIsBksmWrP
         s3vv5IPVHB/LKxnvHpRbDr4bZRc/zZ+11cgjkreGmv3vBg1wcEr+UQ4lmciOH45gcYp2
         AyALcWJDahqJIt+2OflQypLn8fFgvM8BVTenMoRw+wtxSJ9aUZwvezrqjbJOIJ+T1lZV
         MJZA==
X-Forwarded-Encrypted: i=1; AL+hErGOfwMSq/gu7Eggw+y537CdkcB8COPdfq9RhkyizwBPsE3imXbPP+WWRTpjda3hR4WfRuyNkZ3mZCWwFn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XIRZ8hjm1IN+nCCFazdSAnonT27j9/pl0P6f2pZBwU6m6ZuBx
	4dxAzHmRGGHwVQwdA+Yl2WxIt2pTWb7lygjoMLxnZDLy+n89UiZkic6LVka3wrjQmg01Y8Dl+3l
	p/1oYjFCnSKHv4SAEOqY4UIitYMHmN/Z+9bhrxeQr
X-Gm-Gg: AYBFou0rVpE2VJO4KgIIO5aglTlGSkAO7r7oj3SUuC9qo8Wja6jEz2JEP6iDXtilFbF
	U1kvP3At77EJqykhtAQRdBw9T+ljsxPiRuX9C+FwC8uEHzEURpC1YF9dLxSrdSpeZ4/5CjbiEBd
	zGZ1uqRQOYiXsEz1FrIlSNOx729/OBEXT7r2+pF65LuVE9Em6i4Dg4yGI1enX3rkIrmXksvTgVt
	ThErYpIsThxcsM5iqVosqNuTGNU44++Af2C/Ko1pRhmwPxpYDLaUtb4K7emkM0bBcEc0TxW+Kl0
	knLqkRilfnAKXYuqngH42K7bdBwhcuyqrUNHYaUWXszTY7sM0osK6ZZ/aqUCjyKAPAnX5tDCt6c
	x2wyJyjl4NoIYFmtfFT9VWApgtdtOJRr29sKOLCJw/ilm0PT5Ks4etqbUu06ghTeCvxMh7rrJM7
	c4cBhVEklHJCFzpHojbxl48bQE
X-Received: by 2002:ac8:5c84:0:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-5598d505571mr488441cf.9.1794429914175; Wed, 11 Nov 2026
 12:45:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev>
In-Reply-To: <20261110112546.261415-1-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Nov 2026 20:45:02 +0000
X-Gm-Features: AclHuK-ZSzUbXpuTPMxX4-S9gb3Y2E-tjBJBsqLyAoT0xCfZuwy_cCHQcxiXGC4
Message-ID: <CAJuCfpEUVDVZ53Pe3uzUVU_=4V3vipCLqY8jo_CC5kA_ZJSnEA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] mm/vmalloc: fix up vmap error handling
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:24=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> __vmap_pages_range_noflush() and friends can install some PTEs before
> failing and leave them mapped, and the kernel callers do not agree on
> who cleans them up. pcpu_map_pages() and kmsan_ioremap_page_range()
> roll back what they mapped before the failure, while
> vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
> __vmalloc_area_node() rely on the mapping functions cleaning up and
> do not call anything like vunmap_range() themselves. When the same
> range is mapped again, the attempt hits the leftovers and fails with
> a warning in vmap_pages_pte_range(). A leftover huge pmd is worse.
> During the retry, vmap_try_huge_pmd() calls pmd_free_pte_page() on
> it, and the x86 implementation cannot tell a leaf entry from a page
> table and frees the mapped page.

Please note that there is a new function called
vmap_pages_range_batched() which should also unmap its incomplete
mappings on failure. This function was introduced by a patch called
"mm/vmalloc: map contiguous pages in batches for vmap() if possible"
in mm-new. I think it should be handled by this series as well.

checkpatch.pl also complains about "Reported-by: should be immediately
followed by Closes" on some of the patches, which can be easily fixed.

>
> After discussing with Suren and Ulad [1], we move the rollback into
> the mapping functions. A failed vmap leaves nothing mapped, and the
> callers no longer clean up after it.
>
> Patch 1 is the KMSAN part. The shadow and the origin of a range are
> mapped by two separate calls, so the rollback there has to cover
> both. Patch 2 is its disabled-KMSAN counterpart. Patches 3 to 5 bug
> out on an unaligned range at the entry of the three range walkers.
> Patch 6 only flushes the cache once the mapping succeeded. Patch 7
> adds the rollback to __vmap_pages_range_noflush() and
> vmap_page_range(). Patches 8 and 9 drop the powerpc and percpu
> cleanups that are not needed anymore.
>
> Changes since v3:
> - drop v3 patch 3. The clamp papered over the caller bug, a bad
>   range now BUG_ONs at the unmap entry
> - drop v3 patch 4. The reworked walk (24bbe1c56f63a) propagates
>   the errors already
> - drop v3 patch 6. The walk below checks the range already
> - the map side checks moved from the pte level to the entries of
>   vmap_range_noflush() and the walk, and became BUG_ON, in line
>   with the unmap side
> - rebase onto the walk rework, commit messages updated accordingly
>
> [1] https://lore.kernel.org/all/20260915070001.113559-3-hao.ge@linux.dev/
>
> v3 link: https://lore.kernel.org/all/20261026080329.140244-1-hao.ge@linux=
.dev/
> v2 link: https://lore.kernel.org/all/20261019054531.87652-1-hao.ge@linux.=
dev/
> v1 link: https://lore.kernel.org/all/20261009063619.112313-1-hao.ge@linux=
.dev/
>
> Hao Ge (9):
>   mm/kmsan: undo the shadow mapping when the origin mapping fails
>   mm/kmsan: skip vunmap_range_noflush when KMSAN is disabled
>   mm/vmalloc: BUG_ON() on an unaligned range in vmap_range_noflush()
>   mm/vmalloc: BUG_ON() on an unaligned range in
>     vmap_pages_range_noflush_walk()
>   mm/vmalloc: BUG_ON() on an unaligned range in __vunmap_range_noflush()
>   mm/vmalloc: only flush the cache after the vmap succeeded
>   mm/vmalloc: undo partial mappings inside the mapping functions
>   powerpc: drop redundant unmaps of failed vmap mappings
>   mm/percpu: stop unmapping the CPU that failed to map
>
>  arch/powerpc/kernel/isa-bridge.c |  5 +--
>  arch/powerpc/kernel/pci_64.c     |  4 +-
>  include/linux/kmsan.h            |  8 +++-
>  mm/kmsan/hooks.c                 | 21 ++++++---
>  mm/kmsan/shadow.c                |  9 +++-
>  mm/percpu-vm.c                   |  5 ++-
>  mm/vmalloc.c                     | 75 ++++++++++++++++++++++++--------
>  mm/vmalloc.h                     |  6 ++-
>  8 files changed, 94 insertions(+), 39 deletions(-)
>
> --
> 2.25.1
