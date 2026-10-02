Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DDA439F75
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937618; cv=pass; b=Ia0KN1hJfyd2GiUjxsXGB2dQc/InZEIYGlS6neNtZVjw78YwF29ZggbaDjfgK6KTe2euYETMzaPmK4j1imsV3/hREQZmqEaNzpnqFHgx2OSYoct+J1L9TZjJpkcDR1LlB3RruMOyZBEPQ6wtbCR1N3dnidl42MgCkmzm1aMeawA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937618; c=relaxed/simple;
	bh=vavxIjTwCBZOVb/LPQjm56SKHMFhwdOAoimT94wdeSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUq9hcU8BP6tPPhbS0KRqHx4J6XDouj4dJC/27UG5fg8sfBcnJ1EBfmKwMixKg3ZvSZtqyPDYc33VfotqnroJx4OXPdaz8cziXIJBnkhosgIUQv6sjQ/eGNcmcjf1iXBGTKrHjz3uihldpqkVa10teW2SGNYuzzMD4OdjNsBqak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkEFhlab; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkEFhlab"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e2050feb1so494092766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790937615; cv=none;
        d=google.com; s=arc-20260327;
        b=S8fZ5ivI1/dvS1d9MRyS+uMgsO3Y6LYMJBqdj0zqNN1PyP0Zj+9iiLF2skQMbGNWX9
         HfgodIFFG9H3Ei+XnnU4ymyZj2ZoFAMN79R6MYIAnJrN8dox+bzi7fDz9bnls5wy+6KY
         zig0SGwRdFDQjFCdk0wtqP6TyGZchtYZNECnJmTaindF4qlKywy9WyfFkrFOE8oFfYe4
         kdKTcGRiU9RtIPm+mTtkR5oO59q1q/GOGs/qSO9fYj5q5wLd52P3GUQiJkFcq8gekWAt
         7KWAv3JFG/sbbyS24GzMzO+eQBfsGbnHBSWCw+tGON+VYLjdfLrUKLQnm/6kQ59Z49yQ
         d5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aluc5VLd/GgszPlfBHVygLWYzMV/6IhocC43q7cYG8Y=;
        fh=VMQs3bqQkAwtZTqQKR/QZGt7dsTBgEu3ZZS64UgbwrE=;
        b=nLbiHR97SfXvFk3vHL1lTdO9qsXh21llkQ9s2oq/wcwQKy0F1sUrT6xSwBP8Yxmezf
         dP9f+QRDib42FP+k+RSLRwtfeihA6g7qdLR6BtJnFpfTD7eWAWfn2re08CNS48XKD72W
         cVD/G/SmHeuTKLBDhxxIqKeDdHidevg9kNQNvyHKh02dbb56xSaWY4sXQB4Mgn1YN+94
         c7KC//Y6JT0wBbZXcajL0ykKukAO7OoW5RCYkA7Rp/IUf7kptd43OD+yBkSJx6csqo3f
         8uPd4lrThWmOZwZ9qVapklVnesbLeIqS7XOfj4R70j5R2LrMBrkE55JiWaGHNSlCcL96
         5HJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790937615; x=1791542415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aluc5VLd/GgszPlfBHVygLWYzMV/6IhocC43q7cYG8Y=;
        b=IkEFhlabPmFpC1Tlwe3N7oLA3hJDj3T7AQ70M6wl+fP3IlYD9uM3UaGbLJ8V2jExHC
         4Apj90P/6wYOEpvy6d5Bp5qhHtpWRHf+6pl+EMJAk1mXZGNO0QQYGQ//aMVwqarlXTcR
         JUAHvlUAQIizVuK4fedrvnh3DTTdXZ5BiguAEP6wMhrk+ity0fihM+SV2l+FqFnqrFTb
         msPw81jE8PvJ5mhl2LGSJZEOu3/HcYSWIYyGRCloexk3XwBH5Zf9D0AZuR4hqD3olMyO
         JWx1NdZ9x3nkE3KgBLOh0SpSclsweMY0nG18Rbz8lR7aOICJJtnOUZGeQI9hE2OmcJcb
         5zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790937615; x=1791542415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aluc5VLd/GgszPlfBHVygLWYzMV/6IhocC43q7cYG8Y=;
        b=yV4dGkLw8A75lhtsc6T9o0PfOaLFakm70ZhDjDWKCrrTUG4c+K7EdJcQ5ZFJg2EFpi
         LNDgx/LY/LCcHOmdT58YOLv+8WbDU4sFatnSDO9yhdxiDZW4Uk7oxvy7z2GUMKAf+m5E
         /WPEJaHYjs5qAv6D4bOsHbP5rdd59/giLfajzZwfDhCYnH+RAobRUTmdg3h5d8T3qQpG
         SiLzb5wl54/jrqd2COSzmvX4qFjz5blL3GlsV6vpyqf91LWt+DCACMtfniN0KoD8mZfs
         jsvy9A5pEK//7eBRyUhTX5y8yo2QUAPY4Q0hzzvz2jEakHRP3M1xItjgsu0KS9zu6Qxb
         n9/Q==
X-Forwarded-Encrypted: i=1; AKwUvBytkr99GtGTtrJ520M1pHpkiGKufVaXBTRdNVnaw8KenNbLAFqvM2muBN6ERuH1cuZH8Zh1DbCKDOOjomk=@vger.kernel.org
X-Gm-Message-State: AFuF++knhBhejkkdCcs9owdol+C9rAJjBUfEk/+nlF4Mdl7Ax+DlBXxs
	l4TUgEgDghX+DAHZupuCeQUa4dX8wdh0oshVdziXomg/H+lktDvqTZj0J6kT1QEiFeYWhcLrCPF
	iXEFqqeGkK7br+RlmyBZ+JZI3vlP0PRA=
X-Gm-Gg: AYBFou0XGJCnQfGANoQ6uxuiATiAwhlYoHxxayQZDnUpEslNP40f5jL2mP33YCZLgrz
	7kUzAtneFFDO+QPKdWPbku0ZDFhh2ZyjuMOkvVsN96i6+xaR2vwA8dh1hXR2AWFtH9J9AH8G3zc
	UtjeFpn0TnDXINaKAzbGGCS/nWkA/RPHDqazKplk6ZYxkgjgUhHzAc8wU/UCH4Q0Y44ISGwI4Cu
	6xvfwt9+3MxapJ2SfbkOdsW/fz8IuNLyPzKPJZEEM5n1czZ9lpW1OaFXw68FuK36aqpKbFhPj+z
	WzXrXBUVXw1ne1ySGLY/pX+0YCl+pGXTbe8Pt38NApopQ0Uu/hPR5NRvtrc/adm88wZzvjyv
X-Received: by 2002:a17:907:6ea4:b0:c2e:3546:516c with SMTP id
 a640c23a62f3a-c2e4b25913dmr200400366b.43.1790937614670; Fri, 02 Oct 2026
 03:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002044050.1277356-1-thepacketgeek@gmail.com>
In-Reply-To: <20261002044050.1277356-1-thepacketgeek@gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 2 Oct 2026 12:40:02 +0200
X-Gm-Features: AclHuK9AVhCdx3zsz00yoixuqBqUrOwteFjJfeQNP6U0nNJc_amJox9UNxz5jVQ
Message-ID: <CANk7y0iNFFyHW5zfTOeX23K+gozOOKgEWWWyG7Uty9Jo+VC-Yg@mail.gmail.com>
Subject: Re: [PATCH] bpf, arm64: Fix text_mutex critical section in bpf_arch_text_poke()
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Breno Leitao <leitao@debian.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 5:40=E2=80=AFAM Matthew Wood <thepacketgeek@gmail.co=
m> wrote:
>
> Widen the text_mutex critical section in bpf_arch_text_poke() to cover
> the page permission changes made while updating a bpf prog's plt target.
> When a long-jump trampoline is attached to or detached from a bpf prog,
> the plt target at the end of the prog is currently updated before
> text_mutex is taken, by temporarily making the page writable:
>
>         set_memory_rw(page);
>         WRITE_ONCE(plt->target, plt_target);
>         set_memory_ro(page);
>
> Leaving this outside text_mutex assumes the page belongs only to the
> prog being poked, whose pokes are already serialized by its trampoline
> lock. Commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
> management") broke that assumption; it switched the arm64 JIT to the bpf
> prog pack allocator, which packs programs into small chunks of large
> shared allocations, without updating bpf_arch_text_poke(). Since then,
> unrelated progs (and their plts) commonly share a page. Two CPUs
> attaching to or detaching from different target progs in the same page
> hold different trampoline locks, so their permission changes can
> interleave:
>
>         CPU A                           CPU B
>         set_memory_rw(page)
>                                         set_memory_rw(page)
>                                         WRITE_ONCE(plt_B->target, ...)
>                                         set_memory_ro(page)
>         WRITE_ONCE(plt_A->target, ...)  <- permission fault
>
> This was hit on a 64K page arm64 machine:
>
>   Unable to handle kernel write to read-only memory at virtual address ff=
ff80008f46d5f8
>   FSC =3D 0x0f: level 3 permission fault
>   pte=3D00c00200ea5a0783
>   pc : bpf_arch_text_poke+0x214/0x238
>   Call trace:
>    bpf_arch_text_poke+0x214/0x238 (P)
>    __bpf_trampoline_link_prog+0x1c8/0x470
>    bpf_trampoline_link_prog+0x64/0x90
>    bpf_tracing_prog_attach+0x318/0x4a8
>    bpf_raw_tp_link_attach+0x104/0x258
>    bpf_raw_tracepoint_open+0x6c/0x90
>    __sys_bpf+0x134c/0x3e10
>
> Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management=
")
> Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
> ---
>  arch/arm64/net/bpf_jit_comp.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index 475e70653454..66fab0bfd3da 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -3338,12 +3338,20 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_po=
ke_type old_t,
>                  */
>                 plt_target =3D (u64)&dummy_tramp;
>
> +       /* pages of the bpf prog pack are shared between progs, so the
> +        * set_memory_rw()/set_memory_ro() window below must be serialize=
d
> +        * against other pokers too.
> +        */
> +       mutex_lock(&text_mutex);

Thanks for finding this and fixing it.

Reviewed-by: Puranjay Mohan <puranjay@kernel.org>

Alexei,
I am not worried about the comment style, can we merge this?

Thanks,
Puranjay
