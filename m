Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573885;
	b=diWLfjW06DASP9rvoPUOEthqk1gc5wM3MJYLW3/8opv9pIlSXmO+R4NB+v/uWSZGVWVn
	 f+bNteth2QP+AMm8wwYTO0RZxQAi6c6Dm6wSgGX38vpLaqsC8/s1f9uUvt7QTYKlkww1U
	 TeJNb+rQpDPnmeHZL24KB6+o3z/rVXxtNUn1mv26buc+S/jd7XzFaHGhNoS248P5sgcof
	 VmeTYq7ba7UDKkhnc0LI4sXVoldydkegCaapOw9DtZHIy9AGiyD6IT3c7vK4+nT/O0QKW
	 /WnBZc9Kkn34AJ5irJwMmo4irzfWegw2nWLwbOaroMKvbhQqRDAt9gcNQ0P6ge6yKrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573885;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=qP1fDgmD+0/GNcLr7ZQxR1eYEZJ6oOSkEBBpvgi4B/E=;
	b=AUwjFyvGQ4wRcxl4r3H4ZP7vFsKRA2ZNqIa65l60etsbJGILZ4DpkLenEhXHJGd82saP
	 d4QunEeO8tlfAPYweHw+z0y9ePAzsPR1OUO68W+dprL979jsFLgRioHTPwMZJFhKBKo85
	 rif4RCSGgMUeiX9hfLDS5p4ysoCzMryB0Pb5MLlvyo+pb/zIq5vTlsIHATL6NMqonnpJL
	 zjvp3u3krfqaqy0P7vgkoARBeaLyMRsV7Sl9Dhi25Gk2peNujdBP5TyGaeEvw3PywTcap
	 4a8I222LjQHLtoWFide6C3lOH0pDzKJ89xOyDapTp0QEC4V91svhKfP+hOX0kQ8oWbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PcgYB5G/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC52C606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PcgYB5G/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1DF1F000C6;
	Fri, 13 Nov 2026 12:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794573885;
	bh=qP1fDgmD+0/GNcLr7ZQxR1eYEZJ6oOSkEBBpvgi4B/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcgYB5G/66zWN5QUDcsz466xPJ41iFP9yaBtiefYZAAQd//IVnNCvKTKO6qdr0DNp
	 O199jH0jkONotIDaYaLokN24J9jXGte+AApsy+hDkd9qbhqG+hIdFXm+RhIRMAdLbb
	 Rsgbo7DG/58nAgOg4HoATbRciQShs6Tv4dIYIeFVtq+zcCHePJh72IES76J34SNXH1
	 EHZ6o5t5aKgLW3Ra6ntqseLLlBBgkcoKK0hF9vfF/J4SMnBtx6/MP3991JVUqzJ8eQ
	 diZKH4L+INThlaiqgm5lrhwP70Vm88AIQj5dMTLM3nVwIWa9kSG0vxh8sv5EeswWQg
	 vs1uCyAnY+pTA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 990FA198003A;
	Fri, 13 Nov 2026 07:44:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 13 Nov 2026 07:44:43 -0500
X-ME-Sender: <xms:OAb3aj9wtmg3oXt63DlqdvAHyCeduo4TT0vPS9dBk0N69Asxbni-Fw>
    <xme:OAb3atUfOuh2DdP_XoYdkVNGkNvu009-5CFJNOqT3ERkjxPKAWdzAgBF51VBYmVHj
    f29MTsUpSwIkAivcRbe33UC7sKLR6HEZ02BZC7DtSai5_QiPGYllw>
X-ME-Received: <xmr:OAb3aoZ97faUwvbhIguHKon_mjXW4u9xKxFNc4MgpbfEJhR-7g_IaP5XRmI>
X-ME-Proxy-Cause: dmFkZTGp90hbmu9g2nv6Qpwl0ey2IoaItGc4CUAeqGv1xSwtx27bHHgLe816J6e2LwkW+M
    Oqhe4ZnrU5jWuzElELI8JAakEw8ONWTGPSM843dswrFPae6cLUFc8OnNdE5Wy8p/rfSGUb
    RdyPlZOnd0QOFvDFxSZ+Q7sXbMqc8z+f6lgqMMNOzwTx2oup4TZ5JPMLFbpyY0bFkvCUs9
    yx7qZMcgICL9TwSRYVzqEnTCNsKGb1LfBaPc4WMNzwWwCwXztqY4tWSjIwjO756oFybA2m
    wWRg4frOGH7VKyi9cmvO0C/sBS39CRAuyoEXV83pS6BWp5427weow0xhtHCOzoEuBraMZS
    PWs+JxnWGRyRFQASl+avgvDVS/tEynB2Zk+FuBD9RySJZqNCh3tP2TzAcCB8z7J0yN7DRR
    8jBLcsxTM07Hh9YkbJgGvnngbF+qgLYIKhTFbumw280ufWA/XPpwIdq+sgom4Q/7IHN8Em
    XIjd6ZqgKzKma3NGOxFgw8O2gGOlqlj3JMUZHe1TEv0VXFVefvlhoorPiyIge/G4WhVwqP
    P80h31eExz+rnliKV6X+7K3gKv1TfSFW6Kd2MIkyCJUoo13NU2Ei1eDA5TobE6MUDf6lv/
    4LOFK5uUR1px9ego6rPeurQzEjwdvj8j/uyJeHj12LgJ6tUjY/Im3sjQTVQA
X-ME-Proxy: <xmx:OAb3anqilD-3ObX7OhGkDhwPse2A97PzhEtdh4itOqRMv0pmR6kGAg>
    <xmx:OAb3av6BojrlFLQ87tKmMEscosazzjnyYPIbUCNvJKoItY0SltER7A>
    <xmx:OAb3ahUOs_XLDSGHYPAIa1gdlHy6kkl2pLyl2w-Bn8npHKMHIv5vkg>
    <xmx:OAb3atsnHrgXjGYqrBUWUK0BEyd-A5pJPA05K5CE3frAOORU3uxDfA>
    <xmx:OAb3amrW3uFWGlLwc1CgZ28jgwuYLszfIgsg-kUiyzbvsXIg2nhopg7J>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 07:44:39 -0500 (EST)
Date: Fri, 13 Nov 2026 12:44:38 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Documentation/userfaultfd: document RWP behavior when
 the PTE is dropped
Message-ID: <avcCRLX7unFGeaHf@thinkstation>
References: <20261113112806.109578-1-azpijr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113112806.109578-1-azpijr@gmail.com>

On Fri, Nov 13, 2026 at 12:27:42PM +0100, Jose A. Perez de Azpillaga wrote:
> "Scope of protection" lists only the PTE drops requested by the user and
> says the range has to be re-armed afterwards. On shmem the kernel drops
> the PTE as well (page reclaim, collapse), and RWP has no marker by design:
> the next access is a minor or a missing fault, and the user is expected to
> register for those. Document this, together with the modes that sync and
> async tracking need.
> 
> The VMM example registers guest_mem with RWP and MISSING only, so a vCPU
> write to an offset that is not mapped there can be lost during eviction.
> Add MINOR to the registration and describe how the handler treats minor
> faults.
> 
> Link: https://lore.kernel.org/linux-mm/856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org/
> Link: https://lore.kernel.org/linux-mm/avWnaR7VVEGa7yNp@thinkstation/
> Suggested-by: Tal Zussman <tz2294@columbia.edu>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
> this is the first time I'm writing documentation, so I accept any
> suggestions to improve it :) and I tried to follow the documentation's
> own style.
> 
>  Documentation/admin-guide/mm/userfaultfd.rst | 65 ++++++++++++++++----
>  1 file changed, 53 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
> index 97daea83b7f1..19bdac668f93 100644
> --- a/Documentation/admin-guide/mm/userfaultfd.rst
> +++ b/Documentation/admin-guide/mm/userfaultfd.rst
> @@ -384,17 +384,45 @@ normal missing path (``do_anonymous_page()``, ``do_swap_page()``,
>  the population itself, co-register the range with
>  ``UFFDIO_REGISTER_MODE_MISSING``.
>  
> -Protection is preserved across page reclaim: a page swapped out while
> -RWP-protected carries the marker on its swap entry, and swap-in restores
> -the PROT_NONE state so the first access after swap-in still faults. The
> -same applies to pages temporarily replaced by migration entries.
> -
> -Operations that drop the PTE entirely — ``MADV_DONTNEED`` on anonymous
> -memory, hole-punch on shmem, truncation of a file mapping — also drop the
> -RWP marker: the next access re-populates the range without protection.
> -Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``), there is no
> -persistent RWP marker today. The user needs to re-arm the range with
> -``UFFDIO_RWPROTECT`` after any operation that explicitly frees PTEs.
> +Protection of anonymous memory is preserved across page reclaim: a page
> +swapped out while RWP-protected carries the marker on its swap entry, and
> +swap-in restores the PROT_NONE state so the first access after swap-in
> +still faults. The same applies to pages temporarily replaced by migration
> +entries. Shmem is different: reclaiming a shmem page leaves the PTE empty
> +rather than installing a swap entry, so the protection is dropped along
> +with the PTE.

Migration is not anon-only: migration entries carry the uffd bit for
shmem and hugetlbfs too. Keep that sentence out of the anon part.

And please call it the uffd bit, not the marker. "Carries the marker"
next to "there is no persistent RWP marker" reads as a contradiction.

> +Operations that drop the PTE entirely also drop the RWP protection. Some
> +are requested by the user — ``MADV_DONTNEED``, hole-punch on shmem,
> +truncation of a file mapping — and some are initiated by the kernel on
> +shmem: page reclaim, and collapse into a huge page by khugepaged or
> +``MADV_COLLAPSE``.

I would not list them. The list is not complete: splitting a PMD mapping
of a shmem THP drops it too. The next tool will find the path that is
missing and report it. State the rule instead: on shmem the kernel can
drop the PTE at any time while the page stays in the page cache or swap.
Reclaim and collapse are examples.

> Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``),
> +there is no persistent RWP marker, and this is intentional: once the PTE is
> +gone, the next access takes a page fault that userfaultfd can deliver, and
> +that fault is the notification. Which fault it is depends on what happened
> +to the page:
> +
> +- The page is still in the page cache or in swap: the access is a minor
> +  fault, delivered if the range is co-registered with
> +  ``UFFDIO_REGISTER_MODE_MINOR``.
> +
> +- The page is gone: the access is a missing fault, delivered if the range
> +  is co-registered with ``UFFDIO_REGISTER_MODE_MISSING``.
> +
> +WP cannot use the same scheme — a minor fault would trap reads as well as
> +writes — which is why it needs a marker.
> +
> +Without the matching mode the page is mapped back silently and without
> +protection, so what to co-register depends on the tracking mode:
> +
> +- Sync mode: the access would be lost. Co-register shmem and hugetlbfs
> +  ranges with ``UFFDIO_REGISTER_MODE_MINOR`` (and
> +  ``UFFDIO_REGISTER_MODE_MISSING`` if the file can have holes), and
> +  anonymous ranges, where minor faults are not available, with
> +  ``UFFDIO_REGISTER_MODE_MISSING``.
> +
> +- Async mode: neither is needed. A page faulted back in is mapped without
> +  the uffd bit, so ``PAGEMAP_SCAN`` reports it as accessed.

The registration is fixed, the mode is not. A context that switches to
sync with UFFDIO_SET_MODE, as the example does, needs the sync
registration. That has a cost in async mode: minor faults are always
synchronous, so "async -- no vCPU stalls" in step 1 is no longer true.

Getting it back would need MINOR to follow UFFDIO_SET_MODE: in async
mode, map the page and let the next scan report it as accessed. That
could be a future project if the stalls turn out to matter. For this
patch, just fix the comment.

>  **Fault Handling:**
>  
> @@ -486,10 +514,16 @@ never traps on its own ::
>      ioctl(uffd, UFFDIO_API, &api);
>      if (!(api.features & UFFD_FEATURE_RWP))
>          /* RWP unavailable on this kernel/arch -- fall back. */
> +    /*
> +     * MINOR: an offset in the page cache but not mapped in guest_mem
> +     * would be mapped back without a fault, and a vCPU write between
> +     * the pwrite() and the hole punch in step 4 would be lost.
> +     */

Not yours, but the "if (!(api.features & UFFD_FEATURE_RWP))" has only a
comment as its body, so UFFDIO_REGISTER becomes the body. A second
comment between them makes that harder to see.

Adding {} around the body comment of the branch can help a bit.

>      ioctl(uffd, UFFDIO_REGISTER, &(struct uffdio_register){
>          .range = { guest_mem, guest_size },
>          .mode = UFFDIO_REGISTER_MODE_RWP |
> -                UFFDIO_REGISTER_MODE_MISSING,
> +                UFFDIO_REGISTER_MODE_MISSING |
> +                UFFDIO_REGISTER_MODE_MINOR,
>      });
>  
>      /* Tracking loop */
> @@ -550,6 +584,13 @@ progress. After ``fallocate()`` punches the page out and ``UFFDIO_WAKE``
>  fires, the vCPU retries the access, faults as ``MISSING``, and the
>  handler resolves it with ``UFFDIO_COPY`` from storage.
>  
> +The same holds for an offset being evicted that is not mapped in
> +``guest_mem``, except that the vCPU blocks with a
> +``UFFD_PAGEFAULT_FLAG_MINOR`` fault, which the handler leaves pending until
> +the page has been punched out. Minor faults on any other offset are
> +resolved with ``UFFDIO_CONTINUE``: the page is mapped without RWP
> +protection, so the next scan reports it as accessed.

"Any other offset" is too broad. A cold offset that step 4 has not
reached yet will still be written out and punched. If the handler maps
it with UFFDIO_CONTINUE, a vCPU write between the pwrite() and the punch
is lost. That is the case MINOR was added for. A fault on any offset
this pass will evict has to wait until that offset is punched. The same
goes for RWP faults.


-- 
  Kiryl Shutsemau / Kirill A. Shutemov
