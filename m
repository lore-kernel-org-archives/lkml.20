Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D433D300E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180374; cv=pass; b=brZwaGkpAozhD6NhZfMbQuNzeBw0X+Pst21nffqQBZvjDS/9jZLliyRM+x5C4yd8U/+KQUH/zQO6VzHb7AcanjlfK3AdrOZWl2a03F54hMb+y1Eg16TCgp/VwqLNRvM4Kg2nTNkgnFMG4NH6OOMyWocldP4umOZnkc/2BR4LIyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180374; c=relaxed/simple;
	bh=aKy0WhmuZ0KSTA2scN/gWrfv9TWutXxLU9SljZLRv3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRWaVbuUuZ1jz7tVnAlzPSUh/feVCqsfPHeUltj0y9t+G9bZcfn9g+iaavqV7iiPBaUIuarr7Hl+qdMUnZs7uyAAJZqVUv80duCOOTo342IzVC2ANBiNrgXfBdFhmkYzPvZBLsobgR9PTHIhiEATbnBJ4bRVNWfiOOcSkd9iGgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZugPm/VX; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZugPm/VX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so275403a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792180371; cv=none;
        d=google.com; s=arc-20260327;
        b=OdBZWnBRRrpRsrev6Ryp02OuY3q+zRF/JnMm4cGWzkUeYrahFf4s6nDgYScm06I56D
         QEPTBKb576tmnriorwpqxP0PJxZXxJwuS6aYzgZYglZTSao4fCCDFlw76sEFhXPF/ul8
         +IMqhOt9le/d7bC4GlIIfHxPxeGS2VO368ZYRErzdVpaQvQhyee90gPHvfU5Ha2IHHwC
         NUjb8Vm4RAZUPmgDqHhKYilRdZKrid1XNd1f3e/S8ZiqoAqh73BRQy+Cq+yduCO00Bk4
         EJL+ra/oXVu6Ii6Nn+wClIsmtnKg77/IHlBK1IKtPibw8KAulWF2FQ8usTVSyjjcUdAT
         0w6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKy0WhmuZ0KSTA2scN/gWrfv9TWutXxLU9SljZLRv3c=;
        fh=i/cFU5IUIcjVmwRr1f8+Ubed1RFfmEkHFbnP7sENxOc=;
        b=Km7IFeRi9+l21xs6zYscU8KX+h/JIFzCRnKUHnglPd/bA8TZZLb4BvV7T8KVheAxCx
         BeeYmYgGB+25QIkhT9OlMCyGsf2JAHFec9875hPtnVbnh2v65jYZRsM92PkYxfGNEhGi
         7Hnnz/aa5CVFnMCvANeVlRQid5gL4Oa/8F4ilwQOrl6Hi+7lLeifl2b1YxOFu/B6d2Ri
         CTa00gdZlIwabekrpzik7x0Ked0ZwrvcqIxkvbHtPnMrAfESiuJj2fgBvlwlLeeMl7+Q
         2eTSJ5KzkAn1yFwy5ln/Ur8Dymkp0aznr/OCerCsv3x07iTdu8/QXwGzBAPW6TacKHRR
         aP+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792180371; x=1792785171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKy0WhmuZ0KSTA2scN/gWrfv9TWutXxLU9SljZLRv3c=;
        b=ZugPm/VXd59lSpe2cfl0srkX1DsKn/fdwvToZIlIMp8oIs+fZSrQHHhCs5ukCSIMDF
         8GSe/dE+fos7ltNXPE1C9hwszMEN0HvjkKw8TSmvv4bkIACGpdVNBzPppUfBDqA34PBs
         kdqIlAKc2BaJ3VCYw+xkGWRVKZ/4YW7RPb2G/tHV4hTblCBiXxsXnAwrnD8RH22nwCZk
         DYHxwzQoRwpQ5fk+N3zrf6HYrqtB4Ox7MlTHfaBvZaclYMw1f1wYxsUL3HSmHrfeIFZK
         9aPIzF+FOV3kA0IWaxcQlFUpMNouG6MFmQssGEJI15bL4yfG+HxBS3HVzoP/5ToQmoDb
         5ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180371; x=1792785171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKy0WhmuZ0KSTA2scN/gWrfv9TWutXxLU9SljZLRv3c=;
        b=WGvYon7aLlPE7GpjJoBvCRKDETVCBdBGNmvGBRaOY6UQ9QRLFqshDhsOXao7dvXmjN
         QPl3MYnfmA5p9CQtY5C3V67QbuDG4ybJBJe6K6p9ZmUwdC7K1ZPh5jGej2nPFOO/wIt4
         CquH/mL4RT+p9cdShDLmmGvntRIEaNG6GBfBOxrqwbFO+NHfuKVjOAzalhTgKPf4hXmL
         7XIDsRWfgbIDbItGQLPhgRc2m1ivbuiT4kRrk5j/JlfVPD9yG1+N7iIyNzi4M5BPeVv/
         b+M+tadx+FJF+Za2mvK0RaZBygFM8ZtZrvKYTxlfojHlMRGn3u9D3J4tqryxVW4kpy/N
         TKiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeAEbIfJUeFOhrp0ggwPgrihrY4q3XNx8PP13LsaDx4JfXdAigZQKUH04sbu4ePj/EH5cQ2F5tD2mPrAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYITifnKD7tVuGHdpKX3Vg7swnyvxKhbnr7zIAduq7KmEbgGTJEL
	L06NjQUo5dg5dq4hvJB9DlcLsNhP/i2bgoH7C15vukQwdeUqYEhZZuUEIVXTKpFtLf6kI/VJ5+w
	WFAUCL/4BSAstmQuayn9c0P/wz/hMuvc=
X-Gm-Gg: AYBFou1rjDhUsxfV+MUHOxm3fHPuHDcEE09HDctFXLFI/jOUVdZWosJkM67rBKRNKlT
	j8eIuv/PXVfH66M8/ne5KS2FOIkfEDO5+SK1+KPdt3Wwbrf2xpWo4NZJru9xsrxFDc8sRKR9ycj
	QSvFhy7AiMM30bJ4XrVphoQ48kHt8QqQcJxKl5MthtbV9H6A4ZVLvH5OvFrRZJcQVvunUNRGlPe
	aH6nNAlE9dZfzT5XyYZzr/1tNdOUmge2vG4uQyu+6MjMh7SuUDELAenS88gW5wvZSqxt9IW7qqh
	hlnhnyo7PLnl0JrxuRcEHaiiFwqf1aNcfe9hvJuUQ49ZXK7jBDm/lfcq4GLoeOSX4zqHK0XTTBA
	HKMCxRn7JtHNfpasIRfE6xrMh4GCI2Bqh0n91RLhvRkCImsl9I5W+bXo9Cieg/Dspiw9tUroBJM
	782YkGAom0mS5dIsHGc67f3nUTTVIDc+PBwQaZuXs=
X-Received: by 2002:a17:90b:3a4f:b0:3a0:2900:f55e with SMTP id
 98e67ed59e1d1-3acef3e9905mr462690a91.29.1792180371201; Fri, 16 Oct 2026
 12:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010224902.1232178-1-arighi@nvidia.com> <DM6HVNSP3USV.AJSWS289Z3I9@gmail.com>
In-Reply-To: <DM6HVNSP3USV.AJSWS289Z3I9@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 16 Oct 2026 12:52:38 -0700
X-Gm-Features: AclHuK92INr4JCwk1GxOJAxDUUIr236c_xuz0zXWx3fjiZTY4wmHwQ-mmYgfdw8
Message-ID: <CAEf4BzZZRrD86ZswsB2r-swqNi7D1p52Vs=fQ9MXSgGATN31Jg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/5] bpf: Expose pinned arenas as sized bpffs files
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrea Righi <arighi@nvidia.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Josh Don <joshdon@google.com>, 
	Vineeth Pillai <vineethrp@google.com>, Balbir Singh <balbirs@nvidia.com>, 
	Shameer Kolothum <skolothumtho@nvidia.com>, 
	Himadri Chhaya-Shailesh <himadrics@protonmail.com>, NchangRoy <royfru44@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 12:03=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Oct 11, 2026 at 12:45 AM Andrea Righi <arighi@nvidia.com> wrote:
> > The guest scheduler can create its own arena and allocate pages from
> > that NUMA node. Those guest physical pages are backed by the host arena=
,
> > so host and guest BPF programs can access the same memory through their
> > respective arenas.
>
> in addition to what Josh said...
>
> That node is ordinary RAM for the guest.
> When the guest scheduler exits arena_map_free() does __free_page() and
> the page goes back to the guest's buddy allocator. Nobody tells the host.
> The host prog keeps writing at that offset into whatever the guest
> allocates there next.
> NO_FREE in the guest doesn't help. It covers the kfunc only.
>
> Patch 5 needs a 16M node (256M on ppc) to get one page into the guest
> arena. Arena is 4G at most and it's one arena per prog, so that's
> 256 guests per host scheduler.
>
> The NUMA node is a way to avoid teaching arena to use pages that it
> didn't allocate. I think that's the missing piece in either model:
> host allocates -> guest arena is populated from a BAR,
> guest allocates -> host arena is populated from pinned guest pages.
> As Josh said the BAR is needed for the doorbell anyway.
>
> If arena can do that, can the host side take the pages from memfd
> with memfd_pin_folios() like udmabuf does ?
> VMM can map memfd at any address and offset already.
> Then no need for NO_FREE, EXPORT, sized file in bpffs, 2nd kind of vma
> in arena, etc.
>
> The loader does memfd_create() or opens a file in tmpfs, calls
> bpf_arena_import_memfd(&arena, addr, cnt, fd, off) from a syscall prog

As briefly discussed at LPC, I have nothing against adding support
like this to the arena.

But as I was reading Josh's reply and thinking about multiple VMs and
multiple vCPUs (that can also come and go), I kept thinking that it
sounds like a pretty good fit of map-of-maps and ARRAY maps, where key
for map-of-maps would be either entire VM or vCPU, whichever is more
convenient. What is missing here is the ability to create an ARRAY map
from memory that was already allocated before, instead of asking the
kernel to do that. But once we have the ability to create ARRAY from a
bunch of pre-existing memory (e.g., from memfd), this can be used both
in a guest and in the host, and both models, guest allocates or host
allocates, could be supported with the same model.

(regardless of this particular use case, I think it would be great to
be able to create ARRAY from memfd for some other potential use cases)

One disadvantage of ARRAY that was mentioned before is the need to
bounds check/limit access for PTR_TO_MAP_VALUE. I agree that's
annoying, but what if we teach verifier to just automatically add
bounds limiting sequence (e.g., masking if value size is power of two,
slightly slower sequence for non-power-of-two, of course) for all such
PTR_TO_MAP_VALUE accesses (e.g., if map is marked with some BPF_F_xxx
flag).

Is it doable? It would be great, if so. Arena's singleton nature and
4GB limitation might not be the right fit for all cases, so it would
be good to have an ARRAY-based solution available as well, IMO.

Thoughts?

> and gives the same file to QEMU the way patch 5 does with the pin.
> The imported pages stay until the arena is freed, so it's NO_FREE for
> the shared part only. libarena keeps working in the rest of the arena.
> arena_map_ext_pages() is what a BAR in the guest or pinned guest pages
> in the pvsched model would call.
> What is missing: user space has to mmap the memfd to see these pages.
> The arena vma gives SIGBUS there.
> Something like this (compile tested only):
>

[...]
