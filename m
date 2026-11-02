Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612410;
	b=h3vJakO3uthWRYHK9A/cbVNR7BKrAScWqtANRLGcEe22O2YzKMYtabNGrS5tdonI9bSK
	 5HRPYho07/Dd9qAEfzEUP26NjlFaWJ5KJFaxfmMmUELSOkN1s7XkRmdXTLxQYoKslz11J
	 eOtOXKS5x34zLnV2kpxMdQLQL+5H4pN903ScNaOJzrLk5cDrmx7cK1Yt62TEhlKlZUUZg
	 1QJtHIHa9ThKMmM4W5a7CsZFU/M3/SYs4gKWTUX6TbGmxACRXO9gE9A7sDwRCkN20gI7E
	 gIeeY3j/lms5dYKE4mVZsZnC+v6+ePPBBxtt7d6ksps5dWCO73fwu6QqGrsff9Mrdyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612410;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8aDvlOYrK7UWy4XuJN0OZX1n4c+MlDIjC9XuVai/qps=;
	b=hBhRJrCx+vWKINZQHYuxMgY6kGvlJbIRnt3d9m3DIfRQ/QIR/66eeyTWjjbGIg0fcJNU
	 bk6+Jounp7IKbP1iaj9/JIJ0WaKcN0JLH/IJM/o4d8JYURKrVwI9oIFtnsaqwXEPlGnpU
	 /mYtfTttG2LHqKvUfrlIknJ9rrBYvqGMzUAq6MG0f2ZrqxC97lIf5eAg4GS2B6r/sH8dU
	 sFtXn2E5LPIjdKolIXYtB4J8eqwtEAqsha3Xy9nbNXJMnjVpNWC5BvSIrdCkITn5bXEuO
	 S5sK//6NlEX3YvWod9W3Y6UvX50oOYFip1R8GfLliN7NsVkBpZs05e+8+ATfe3CviyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jp7hWoRL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B4606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jp7hWoRL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EA51F00919;
	Mon,  2 Nov 2026 09:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612409;
	bh=8aDvlOYrK7UWy4XuJN0OZX1n4c+MlDIjC9XuVai/qps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jp7hWoRLLokcBTU+Nh9VL2w2I6BUtr4iq9bzn3PgSAs2RQRE4xM/wzghX98yYTiks
	 7yLXrGRh57e9iJHXwqsZJJy04V6H6x8rwnDp02ZUKV102rbUjZCsfQRHdYiDbfjYFh
	 IzmWT7iLlB7Eo+n9mUqIiGMVU16MFLHwoI/vl2aDPXjVZ9qHrAlLziezBTW7Vrra0U
	 MHPThO878vP0QvnEdV3yLlglh4Xe9OjxeNzp2SazHcSLkPj6k791X90HkrYQ4c9HEn
	 nksRt79q2UbCJ8NMwOd0C2S70JZ8Vt0ogp8jMVDE7bPMwfM7pyDSG4xsWzcCqeXUAL
	 GqlR/yYIsCr9Q==
Date: Mon, 2 Nov 2026 09:40:04 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Songsen Yang <yangsongsen@insta360.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/vma: fix NULL anon_vma deref in validate_mm() under
 mmap read lock
Message-ID: <auhYlOz1OmBSWLsx@gremlin>
References: <20261102074414.10902-1-yangsongsen@insta360.com>
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
In-Reply-To: <20261102074414.10902-1-yangsongsen@insta360.com>

On Mon, Nov 02, 2026 at 03:44:13PM +0800, Songsen Yang wrote:
> Since commit 38564710f443 ("mm: implement and use vma_has_anon_rmap(),
> silence KCSAN"), validate_mm() decides whether to walk a VMA's anon_vma
> chain with vma_has_anon_rmap(), which re-reads vma->anon_vma, but still
> locks the anon_vma pointer it cached at the top of the loop iteration.
>
> vms_complete_munmap_vmas() calls validate_mm() after downgrading the
> mmap lock to a read lock. A page fault on another thread can then
> install vma->anon_vma via __anon_vma_prepare() between the two reads.
> The check sees a non-NULL anon_vma while the cached value is still
> NULL, and anon_vma_lock_read() dereferences it:
>
>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>   RIP: 0010:validate_mm+0x143/0x2a0
>   Call Trace:
>    vms_complete_munmap_vmas+0x201/0x2d0
>    do_vmi_align_munmap+0x285/0x2d0
>    do_vmi_munmap+0xcb/0x190
>    __vm_munmap+0xab/0x190
>    __x64_sys_munmap+0x16/0x20
>
> Read vma->anon_vma once and use that value for both the check and the
> lock, as the code did before. Under the mmap read lock vma->anon_vma
> can only go from NULL to non-NULL, so a non-NULL value read here stays
> valid until validate_mm() is done with it. Keep the data_race()
> annotation that vma_has_anon_rmap() provided, since a concurrent
> install is expected.
>
> Only CONFIG_DEBUG_VM_RB kernels are affected.
>
> Testing: on top of mm-hotfixes-unstable at commit 989bf98b512c
> ("iov_iter: validate extracted segment for bvec alignment"), x86_64
> under QEMU TCG with -smp 2 and CONFIG_DEBUG_VM_RB=y. The race window
> is too narrow to hit with the syzbot reproducer under TCG in the time
> available, so a debug-only mdelay(1) was added before the check to
> widen it: without this patch the reproducer crashes with the splat
> above in its first round; with this patch and the same mdelay(1) it
> completes all rounds without any splat. The mdelay(1) is not part of
> this patch. mm selftests were not run.
>
> This issue was analysed, and the fix, changelog and tests were
> prepared, with the help of an AI coding assistant (Claude); the
> submitter has reviewed the change.
>
> Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
> Reported-by: syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6ae78418.6552420f.2a0efc.005c.GAE@google.com/
> Signed-off-by: Songsen Yang <yangsongsen@insta360.com>

This fix looks garbled.

You've no guarantee of what is read and when, the ordering isn't a thing at
all here. If that were an issue, you'd need to use a READ_ONCE().

The fix is also not correct. I'll take this over.

> ---
>  mm/vma.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index 4672d4205..b674c69f7 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -679,7 +679,7 @@ void validate_mm(struct mm_struct *mm)
>  	mt_validate(&mm->mm_mt);
>  	for_each_vma(vmi, vma) {
>  #ifdef CONFIG_DEBUG_VM_RB
> -		struct anon_vma *anon_vma = vma->anon_vma;
> +		struct anon_vma *anon_vma;
>  		struct anon_vma_chain *avc;
>  #endif
>  		unsigned long vmi_start, vmi_end;
> @@ -703,7 +703,13 @@ void validate_mm(struct mm_struct *mm)
>  		}
>
>  #ifdef CONFIG_DEBUG_VM_RB
> -		if (vma_has_anon_rmap(vma)) {
> +		/*
> +		 * Callers may hold only the mmap read lock, in which case a
> +		 * concurrent fault can install vma->anon_vma at any time. Read
> +		 * it once, so that the check and the lock use the same value.
> +		 */
> +		anon_vma = data_race(vma->anon_vma);
> +		if (anon_vma) {
>  			anon_vma_lock_read(anon_vma);
>  			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
>  				anon_rmap_tree_verify(avc);
> --
> 2.50.1

--
Cheers, Lorenzo
