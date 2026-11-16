Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841968;
	b=hbZ1y04qufB9Fv5R13+qSPiIlv4ghdwIom+/lIDi+XiKYAT+mwQvytM9xn2vcrdWw94q
	 fFc1mzloOvRTTdO9aBvgvuX3zm5ogLKYQlzGbwFdP8kTZhTBnPleki1LekAggQhNJLc9K
	 SvMU+mnS3jCs1yriWz33NpuVSnjKlg9WY628RrWFX6As9HohGSAdVNGO9DBUfbatDK01O
	 Bmej3jd5dwFeYOy87znc4OmdZUJ2SlSAYGg+jsuBHr6HZjIt69VXDNJaQy8rCEnOPgG3L
	 bh6DBHl8Czjmp6f2O7882EhbwkbxfqZD9kTcogSMZEqNS01jD4Br9w4I1zKLa+Vnv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JQJbz0+g2lH5pB00J5WNO9QkzcZ2ta2JczWJ7IFiNSo=;
	b=jT7JpQu8NKwqq9237SlFU9kwZ7ImkCg6kqX2SDNhie6nku1PM7qC/LW8CZoQU9CDzZ3D
	 sXD/ckDcA+5f7klNBGbUtFc4qurVVlepSxLF62GQY11p6AKEM0l2UluV37sDcSxDTl9WX
	 RtVlaedgJOQEmIdHhkzGUPpcueHJo7Nos5i6bbk0F85oKv9yM7KWBeKslCaOjmWligyFU
	 oOdwbsgkiWshzjasfsAoBl3zMsueyn/VOnvwLekjuSIFDO7qas3RC09SqIpGkZFSyYLeN
	 AvkCFiMAFllDpOyOtFJtZzNOeaaXiVCVu5GMSBKGupVlrt9rJC0gwfxxqnpMbiXh5xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COMCeF2g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436AD606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COMCeF2g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A1E1F000C6;
	Mon, 16 Nov 2026 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841967;
	bh=JQJbz0+g2lH5pB00J5WNO9QkzcZ2ta2JczWJ7IFiNSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=COMCeF2gVxBOIqseA4DrlRfHBB8N6I+viinf6+LyU6H8+R4iKILtLBVf5fwb/+QWJ
	 39LYitotiXu5WMcxLsoiF+pAeS/ZZpdGZie9J7af4Xpu3SnJ/Dz13Zfpt49gS06V3D
	 wOYcJSC/26FoOsaAFuG1aCOQ5TopMT15cACyCtuyEHiZJW/SjA7kz0JYTi44nsj8Ms
	 o+VeEke64isp7htctM/tnVRKDz798GW5JNygcivEDaj/p/QdPRopAoEElviyGQBFQJ
	 mE0DGNWPUE+ttt1TWwBeiCNhqlsVCH9+/rI0gjDpIhWbe+jmCfg1CUsBhPZ57NCXdW
	 P0YDVJAGLo2pg==
Date: Mon, 16 Nov 2026 15:12:42 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mm, uio: huge PFN mappings for /dev/mem and UIO
Message-ID: <avsbLgh-zBGmE4KF@gremlin>
References: <20261112125638.12209-1-farbere@amazon.com>
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
In-Reply-To: <20261112125638.12209-1-farbere@amazon.com>

Err, there unanswered questions on v1 of this review, so why have you
sent a respin?...

I also seem to remember David asking you to slow down on the respins
earlier too.

AI might make it easy to send stuff out but you're outsourcing work to
maintainers here...

On Thu, Nov 12, 2026 at 12:56:34PM +0000, Eliav Farber wrote:
> /dev/mem and UIO both hand large, well-aligned physical regions to
> userspace, and both populate them eagerly at mmap() time with
> remap_pfn_range(), that is with 4K PTEs however large and well aligned
> the region is. vfio-pci moved to fault-driven population in commit
> f9e54c3a2f5b ("vfio/pci: implement huge_fault support") and gets PMD and
> PUD mappings where alignment allows. This series does the same for
> /dev/mem and UIO, and factors out the logic vfio-pci open-codes so that a
> third driver does not have to repeat it.
>
> Two things have to be solved to do this outside vfio-pci:

[blah
blah
blah
blah
...]

Just way way way too many schloppy words. Write this yourself please.

>
> Testing
> =======
>
> Tested on x86_64 at 7.4-rc2, and on arm64 at 7.3.4, which is what the
> test hardware runs. The four patches are identical in both trees.

[blah
blah
blah
blah
....]

> Two things none of this reaches: 1G PUD mappings anywhere but x86, as the
> test hardware has no suitable 1G-aligned region, and the huge zero folio
> fallback in patch 2, which needs STRICT_DEVMEM=n and has no check
> targeting it.

This is so TOO MUCH noisy, schloppy information. Write this stuff yourself
and small.

I hate to say it but it feels so so lazy to get an AI to do stuff like this
without even bothering to reference _how things are done in mm_.

Be considerate please, we don't have time to read your novels.

And you've been told before...

>
> Performance
> ===========
>
> Unchanged from v1, where the numbers are tabulated; nothing in v2 touches
> the huge path. On arm64 the fault counts were re-measured and are
> identical: 128 faults for a 256MB /dev/mem region against 65536 for a 4K
> mapping, and 4 against 2048 for an 8MB UIO region. Against today's eager
> mapping the series cut mmap() by 95x on the 256MB region and 5.6x on the
> 8MB one, total setup by about 12% on both, and the dTLB read-miss count
> by about 80x.

We don't need a (schloppy) 'perf since last-version' update thanks.

>
> Changes since v1
> ================
>
> - Patch 2: the order-0 path passes the fault's write flag too, so a
>   caller that does not retry the access, fixup_user_fault() from an
>   ->access handler, is not left with a read-only pte.
>   vmf_insert_pfn_prot() keeps its signature; its body moved into a
>   static __vmf_insert_pfn_prot() taking mkwrite.
>
> - Patches 3 and 4: COW mappings get their own vm_operations_struct
>   defining only .access, instead of a COW test inside the fault
>   handler, which was not enough: installing ->fault at all skips
>   do_fault()'s recheck of a pte cleared under the page table lock.
>
> - Commit messages: corrected the L1TF claim in patches 3 and 4 -
>   mmap(PROT_NONE) above l1tf_pfn_limit() now succeeds, and nothing
>   fails later - and dropped patch 2's claim that uffd-wp can
>   write-protect such a mapping.
>
> - Patch 3: the commit message now also documents what the fault-time
>   range_is_allowed() re-check changes without CONFIG_IO_STRICT_DEVMEM,
>   where revoke_iomem() is a no-op.

This is so schloppy and WAY TOO MANY WORDS. Please just write these things
yourself...

>
> The write-flag and COW changes came from sashiko-bot's review of v1.

You credit sashiko but not David... Please follow how _other established mm
people_ do these things please.

See [0] for an example. Note the brevity and actually crediting people who
asked, so they know that their feedback was addressed.

>
> v1: https://lore.kernel.org/all/20261111113045.35368-1-farbere@amazon.com/

See https://lore.kernel.org/all/042795ab-e8af-443f-b34c-72c674c0ea32@kernel.org/

You were told to rewrite your answer, instead you sent a v2. This isn't how
to interact on-list.

--
Cheers, Lorenzo

[0]: https://lore.kernel.org/linux-mm/20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org/
