Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9838F230
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427840; cv=pass; b=Ez/vUZrSyccgMI+7m3etsHO8t0K/FOtlKL3kKCsyZ/Vr1ig/o2CLbvAUWpEjcDNVA6eKXPsdqqpO0Chuwj+Tpf3DyqgXZIJ5IpaF4ceh3rkNrpNk4DtiYdPn30qmdokNlvmOJjtm/5UcoqOzgK4VXgXf2lHLL4zGH6XeYuasHD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427840; c=relaxed/simple;
	bh=RZ7AYDpwif8OjK59BGFRZwWIVN2HIHDHT/0jIXTGwRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOo71f01BDsgseUuvCOTOH3Jk6uaolFr+GfzgkKru+cRty5GeA+VMmbwg6LNhB5I8CtZPSOp7UIKr+QzWekDxCZAvrqErokn1z+35Dcv7u2+0qy03wDRJbRUeN2ANHrG4qxshfD149qJtLgugQ618+BFa16m12+Di1nn7hy8Is4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=l2kFqhsP; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="l2kFqhsP"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66fca0709caso3747856d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789427835; cv=none;
        d=google.com; s=arc-20260327;
        b=p4UKhssv/dXCawC23ueyzheqOPTHFAUhkflW6rW/cW/IPHzJblMKNMdCjWi2dAp8k5
         4zP1zw8eIgqEfalz7PF+h2nKefdptWSOUc6R9BXBIrdR9vhojecNKaJA6HWYxkJqdmoR
         UShvkrbZ/9hyoD1Zd1fiE0EdvUkSMLIwEZUrLZKAz+nBSDJGdz7NWPyc6YIN0B8cZZ5P
         6gpIc9QyroNFq3jHX/nVtsylDLVc0ycsXIpg0c8xl1nDGckQdbLXlfl/biztZrsrNPmt
         GvZl5Aym4/9xrIMqY6m17LXcVHYg8wvNPhKigWNIdFKKHGZEyFRNMOf8Esos4abyYn5X
         gH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rPKM73fBOFsSjy59aqqxc7UWTKxXfj0ZC9NrA+w1XGc=;
        fh=01nEyt+gKkchofnWjJoZzUQlSmwPsXJmTzYt8jnwJC8=;
        b=YWIZ3pscgnb8X+1fLt0RCPEyONeRq0h+nLBXWtOJk1rZzHf6olvOMOS48Qxh+UgfjX
         VIM2VGoU9okgd9N8LiGcWaSt9xBkfHKxW79b9KCD2VzZhY4hkVQsgLvT4Xj0Y+7n/FPx
         9ZbPQeFu9uOeRU5919jKCntr+S1oA5Pnafk2iveUPv20JCYVybzLxNtyQYTKTmf3e+X8
         SKLC5SHySkmAn5FcOQVxDe4P8bzP8IZyTukVMPrwOjpVERAfcYS2j/f1M/jyKIwDTqUg
         1WkCPJlY+Qpgrcya0sTuwYj6/TNJF9pdOKJwQIBSkRYT/ZvTNgg1dz3Zil1Ia0thp07D
         3UIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1789427835; x=1790032635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rPKM73fBOFsSjy59aqqxc7UWTKxXfj0ZC9NrA+w1XGc=;
        b=l2kFqhsPWgDIWu+XPDYhyJxexBhwOUk+x9rHFkIoAaA8mHrGKU427uoulyg8NDLaMB
         BHLxEbwk17ESJ/z84reeELq1wvXnKL+gBgCCyKy9tYaakKPIlNE6iO+2LG++SLP5cUTX
         DgHEDHSiWATwnLQ/yef+Q12ZSEhLs1nQIN0jypCW/glMf+4TsKnfnMiLf6Vmf1sw7f8h
         94aUOjf9o1lcb5B5JsLfVc9qV+WV7JyT7Mwr2Mp3DxYriHupK0PRV0UL7NN3mCoB6Y+W
         ofO3yqLep79rWzxEjzb+ZePijbMSnq8pJHUebmWtExeTBdh1Gei+zVjkPlatAR9r4PWv
         6xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789427835; x=1790032635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPKM73fBOFsSjy59aqqxc7UWTKxXfj0ZC9NrA+w1XGc=;
        b=1b0LnOz4osyJ3eO/mkoGM9KB31XqSbg1srWzrErCk7tSyaJ8PNuWq1WWC8+PHU6KHX
         FrLG8Q0yfu7Mp9slF8eeiutGoDtuPeeJtEvSZjz/NLe91z4dmK4tjDpLmqMvhTkxDij8
         Gm5I6DQ8+TKB73Khx2rDDQQyMeWV5HePHhszGfRDoziKhyI1x5eWbVmBFfjcVNMoG+mU
         Bx2o4FkctTmRe24RflLyIc9jMPf5B8wEyJxbdp3IBzYsn1Lt9UdUJRdtMUHOudxEvs4h
         c1CelUh8ayrnCjisPHCmei6wnVhUx6/MVqpFghgULVLIWUuRCoWiC+2cEqqlipdluusX
         3pyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0KjJwlORObK4iQXbPa3X5Bk/yRuGeKXz8qZtKXYkRLx1+8e3/djYeQYFhqSGe1Vz72PDsQeHWpdjaan4=@vger.kernel.org
X-Gm-Message-State: AFuF++lqOf1h2VlxhUcj2wsAdkEEjnBisxpsYr8Ctk9S4SgDsLVU7YnF
	TBblT7MWA1kVFnfO8MEAvRNz1zpyylreQJgEltgXE0S++PMpP+u0vqnEtDoA5jAP5UJyzI6nuYA
	2VpebCthRJNhrNsgiM0DIuO2M16+jezEbR9PD24ytvQ==
X-Gm-Gg: AYBFou3xzkyPtAOWeTuf4k4KpfuAozPsWa6ux7HP2CjO1qdLSkSkt+IWLz191NljM3e
	Te7RaJ17XxO9DFm5HHxc4AWMkgdRP5GcdlwEcLab3sYrivpiyYSNrcWWi7cqbFI7jTSDgYLH+1M
	pNDJPpssVtXZqOMXkGzESMudf15SrOovvvl8ZiZfjlWew0ol71MKyD1MlrwcpbJdKwbutMwr+Em
	x2Ca4C5Hp/AxysK7KFW3opcGg5liWjVqFEglwIizWxTY09Zamew3rsHv8L+Rr0+RmysaqEy72wS
	LHlXqG9EWBonVR05Oq2hjta54l+FYBCoeCL9udlSM7UpsIan2UJSx0A=
X-Received: by 2002:a05:690e:d0a:b0:671:2382:d57b with SMTP id
 956f58d0204a3-6714e00a7efmr1347187d50.44.1789427834988; Mon, 14 Sep 2026
 16:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914-b4-mmap-prepare-vma-flag-sanify-v2-14-7d9781ed5361@kernel.org>
In-Reply-To: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-14-7d9781ed5361@kernel.org>
From: Emil Tsalapatis <linux-lists@etsalapatis.com>
Date: Mon, 14 Sep 2026 23:17:04 +0000
X-Gm-Features: AcwNN1UnQs5y9ap_T4Dsaa6llmYZN4_govFYy7UyV78s5E1rt3VhMagl8qfkC_o
Message-ID: <CABFh=a7Sa0zMKssts1TVZ+u_x3roWcYVSmJF34K-W++oHEsbEA@mail.gmail.com>
Subject: Re: [PATCH v2 14/40] bpf: arena: mark arena_map_mmap() mappings VM_MIXEDMAP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Paul Moore <paul@paul-moore.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Peter Xu <peterx@redhat.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 3:21=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> The bpf_map->ops->map_mmap callback invoked by bpf_map_mmap() can be set =
to
> one of ringbuf_map_mmap_kern(), ringbuf_map_mmap_user(), array_map_mmap()
> or arena_map_mmap().
>
> It is convention in mm to mark mappings whose pages the kernel manages
> itself with VM_MIXEDMAP, so the core mm knows not to treat them as ordina=
ry
> page cache or anonymous memory.
>
> The map_mmap callbacks ringbuf_map_mmap_kern() and ringbuf_map_mmap_user(=
)
> use remap_vmalloc_range(), which ultimately invokes vm_insert_page() and =
so
> marks the ranges VM_MIXEDMAP, and array_map_mmap() sets VM_MIXEDMAP
> explicitly.
>
> However, the exception to this is arena_map_mmap(), which doesn't set the
> flag.
>
> This patch corrects this and updates the comment to reflect it.
>
> The pages are refcounted and vm_normal_page() finds them regardless of th=
e
> flag, and VM_DONTEXPAND remains set (marking the memory as VM_SPECIAL and
> thus unmergeable). The one effect is that NUMA balancing now skips these
> VMAs, as it already does for the other bpf map mappings, which is the
> reason array_map_mmap() gives for setting the flag.
>
> The intent of this patch is to be able to establish the invariant that on=
ly
> PFN-mapped or mixed map ranges may clear the VM_MAYWRITE flag, as is done
> in bpf_map_mmap().
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

Dropped some CC's as Gmail is refusing to retain them in the response.

>  kernel/bpf/arena.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 7b6847200b43..b69fe5e34339 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -620,8 +620,9 @@ static int arena_map_mmap(struct bpf_map *map, struct=
 vm_area_struct *vma)
>          * clears VM_MAYEXEC. Set VM_DONTEXPAND to avoid potential change
>          * of user_vm_start. Set VM_DONTCOPY to prevent arena VMA from
>          * being copied into the child process on fork.
> +        * This is a kernel page so set VM_MIXEDMAP.
>          */
> -       vm_flags_set(vma, VM_DONTEXPAND | VM_DONTCOPY);
> +       vm_flags_set(vma, VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTCOPY);
>         vma->vm_ops =3D &arena_vm_ops;
>         return 0;
>  }
>
> --
> 2.55.0
>
>
