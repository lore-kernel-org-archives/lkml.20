Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E697640DFC8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116900; cv=pass; b=uRLYd5m3DRa/amO7X/jORLuBqIbcv0Ld+OL2BszCncTSW6SeVqNbp+RGCy/u70UyjuR+7d8KDNHUvd2orBhJER+kgsGos0iBGGTnD/gloshGo2+xKlb6vHU5KkV0NJXi08vo+RqmGYhiZSE8Mo/PthKpMwDtxOpeIo86SLXkSC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116900; c=relaxed/simple;
	bh=XMksKNqknHGvAxIQkpO2ziabukN5n22iaTUCcWfVNCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPOM0HgsAK2QHbx3+js8Objhf87i/e/KYD2xfwJ4dYERorEqYHb9lqVKi07EXtLfKC6SaDtO1Bg2DBud6sHulsT7tI+USnWYzbsDgZ7er9q26o5ZcdN4p7a57FLiIFEtALXLhiyUcBJ2SxosJZtI0u5wEd08eLextFvGITzQAtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAdZCq6Y; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAdZCq6Y"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so165958a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790116892; cv=none;
        d=google.com; s=arc-20260327;
        b=sFRlSqJ+5SCGFg+mnrRfUIQLRPI7sh2VIP+kF5N6LsBqXUevAJY2n4OCmIkuVKAWOx
         8GT3Lt7WSZ1+QrvVAxbLgcMU5bywvKBHfN9kYDps71vrgaK8goXjlKVTQakWXDThssuX
         p7mir1TJ+KqJnrEYZcgbI8ef1RYX6z8kortsWOS3FiPU1MZ3+N4mpEY11v6frxeNflpJ
         FMoiW1FkI6HNhEtTKZTQAsJlvKkJu6IFxBzr9KBjhwFNljRr72xbzj7WPgRK9j4SCuiI
         y76G9HOD6m1MUcs/MX9HJfrwq+mGCvqCDEg6WMPsz8ndO07RrC79leg65Z3UYEeAsDVM
         hUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EifBlIWLbbiNu1pyTH5rLVkrLNZbYLjk13b2Gi+S+cY=;
        fh=vP7hP3ygDMDyLkF7BcT2ylppigGBBYpFNhbeXdcdJuw=;
        b=K7CDpCNto5USY2JFMZpHOuU1R8JBSlZ8BzmLlSqpyV7vJCdZIqBXmxfMiVNKrU4ZLp
         FxLnhV6I43i0lQVMxfQmSKTC7eUv4rP1Fu1QICIthEdYic8ZVdMFGfFZdYqA9XsCSiyk
         HxWKNB3kk+2Oic3BQagCHlHmusm/NuW438IK6a57+44zzbkpVpucjsbL++TfqtrQ25sC
         r8VOkid/A3N/yZKiZSPkbdWjbAN7IvHuF6+q8KHoaG4Ahow+nqtVPPmRbiWhx2QfknaM
         j/SbpebpAghWqjoTEo5XvM934dhRDuPtKOHVH0sToYEYMhuZhvgjQ8DwEqL788rWuKE9
         zm2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790116892; x=1790721692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EifBlIWLbbiNu1pyTH5rLVkrLNZbYLjk13b2Gi+S+cY=;
        b=nAdZCq6Y3nb99AlXrAzEH6iyWM0tz9i1kwlJqyF0SJZxBBkj9dL6I+5EDfeUMcwASY
         pEvL6J9rfc5cFG03Vzunv0qitINC8DAppGHNMzUJPd1o2b9fzTZ5MU39p4wK+46Lx07r
         kjW87AUluoaVe7KI8fS0Y2WwDvbS+glftP5SiAFBzHIrTvzlwPm36rxSc2r+GL5mMKgu
         MdZImC2Zu2nHwNp5TOOpyeT6w2eENqMiBFEH3/lGeXNrNha+RGl2v86A3GrmwhsrqmcC
         CcjUqhcffeZ4FgMcjSM5PM3hs+02v0G7B8OzE8i1JKqJ9xRnr++5vcAQIE3KwG5oQTRH
         om9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116892; x=1790721692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EifBlIWLbbiNu1pyTH5rLVkrLNZbYLjk13b2Gi+S+cY=;
        b=mD5bYLZGaW0qhNshUre/BBuMv1DAmmOlOwh9C2SsBCqFM6+k0qIOEC7azjf1mtGhsz
         uLTvS89gnoG5JqGeTXVIT2Gj63jV6jX4qI8D3HtUMzzjv19ZlfHghvyrmUuqiSoBXzZR
         nQoGMj6uzYuNp5QQLi2dkm8jb3F1wsmglJJ4GTHABGgxi6Tbvnm9YOGHVcsDRgLRWh9H
         JPHqI/Q4C/UkCc/uk35bhC5zwPpp+PriySMBkK59r1HslZNVjUCE2R4gqLmdVhD/csdK
         ojSVoKmSj1IE8Yor5AY+LYhtKbk3C+BXqLQepU8S2TfDAsF7FctZH5qb14cFs7V6v38f
         ljLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfGRaffBDfr3pGyOimqd2+nTpCJZZJW9+0dcLCCYiA3Wz6vSprrfULWd1YLaqIZAdkEzMdOU1KuF+MzXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n2h6dFwraRaRogZvJ0qzLSLhtFscSZCULqjBBqD3VJN7wu3Q0R
	FyolaSwDgjIS9xh/8WQ+AeBzTksT9GB1qDXl1BKRIuFXh5kEHeEzZevW1uRiXXfH4lHA1jG/lCP
	Wl/hXKY1xFUmQBd6eshyYmFfe5hq1nSc=
X-Gm-Gg: AYBFou33iuUwV/546lhAkMrYfY+PgFZzhms8r7PFpKaN8T3ZUe/a6mAuDUf7onrMlOl
	ufeXPLcUYkWU4XQQ42tfuMjle+q4+OqarcKBLLwSEdpSpfyztHLLGlsda1fRtUWeUY70gJK/2Ft
	GxkA4H0R6oTYcDIGQeC1Pls2yhI8Q/r7Uv1MHiKS+U4uBek5Vo00UrFPsXzwPjLYN9aR8B3MGYf
	jlhjTLKGE5Fpxtk69cOQgMfEpIcoIzG6lIt0iGxzw453sK5rELGps7XvupO7zGxbLCdr4Xcs7xq
	+SWXvVyc0sJm0+R/1wxYueSf6fTrt0LchuS3f4WryTt5wr2kF7bdTlBvsHbLyUlQiC51vW/OKm3
	MB4asMAIZfBK5Qsi+tEHWJLUWAPNUk50nH3EiRPjoJz9CXwbCi9Pi
X-Received: by 2002:a17:90a:1609:b0:3a0:8050:2ecf with SMTP id
 98e67ed59e1d1-3a080503167mr173387a91.25.1790116892014; Tue, 22 Sep 2026
 15:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922010333.1226537-1-ihor.solodrai@linux.dev>
 <DLLGYV7DI406.JRNDNAZ4S29I@gmail.com> <ddb3c0eb-2a95-4af8-a9b9-a0624d38a7bc@linux.dev>
In-Reply-To: <ddb3c0eb-2a95-4af8-a9b9-a0624d38a7bc@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 22 Sep 2026 15:41:17 -0700
X-Gm-Features: AcwNN1UI69p9OfuPaja62sel_0aSwzvzcRKESR-BvjHad32ywPLzgeMec1HUoDk
Message-ID: <CAEf4BzY4LQ7TDCpxuVDwCzLZDr6gDYP44UwLEjqtcdRBj+bT_g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 0/6] bpf: Scope callback arguments to their frame
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nicholas Carlini <npc@anthropic.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:13=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux=
.dev> wrote:
>
> On 2026-09-21 6:55 p.m., Alexei Starovoitov wrote:
> > On Mon, Sep 21, 2026 at 06:03 PM Ihor Solodrai <ihor.solodrai@linux.dev=
> wrote:
> >
> >> Neither has a local fix: both arguments point into a helper's own
> >> frame, with nothing longer-lived to anchor them to.
> >
> > It's the same problem as a pointer to callee's stack.
> > check_stack_write_fixed_off() deals with it like this:
> >    if (state !=3D cur && reg->type =3D=3D PTR_TO_STACK) {
> >            verbose(env, "cannot spill pointers to stack into stack fram=
e of the caller\n");
> >            return -EINVAL;
> >    }
> > CONST_PTR_TO_DYNPTR wasn't spillable before 7.3, so nothing depends
> > on parking it in the caller's frame. Reject it there too ?
> > and then no need for REF_TYPE_FRAME complexity?
>
> If we focus on the nasty bpf_user_ringbuf_drain() bug specifically,
> then yes, check_stack_write_fixed_off() change patches it:
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index d62c0f74cff5..f261423e9282 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -3668,7 +3668,8 @@ static int check_stack_write_fixed_off(struct
> bpf_verifier_env *env,
>                          verbose(env, "invalid size of register spill\n")=
;
>                          return -EACCES;
>                  }
> -               if (state !=3D cur && reg->type =3D=3D PTR_TO_STACK) {
> +               if (state !=3D cur && (reg->type =3D=3D PTR_TO_STACK ||
> +                                    reg->type =3D=3D CONST_PTR_TO_DYNPTR=
)) {
>                          verbose(env, "cannot spill pointers to stack
> into stack frame of the caller\n");
>                          return -EINVAL;
>                  }
>
> However it doesn't cover some of the new test cases:
>    - user_ringbuf_callback_park_data_slice
>    - user_ringbuf_callback_park_kfunc_slice
>    - user_ringbuf_callback_park_clone
>    - user_ringbuf_callback_park_clone_then_slice
>
> (not counting the diag message diff)
>
> The original suggestion that came with the bug report was a
> cb_dynptr_id field in bpf_func_state set up in
> set_user_ringbuf_callback_state() and read in prepare_func_exit() to
> release it there.
>
> The cb_dynptr_id seemed way too specific, I didn't like it. So I've
> tried to figure out a feasible generalization of the problem, and came
> to "verifier can't track a lifetime of a ref tied to a frame", and
> then to this series.
>
> I think we need to decide whether the REF_TYPE_FRAME is a useful
> mechanism in principle, and whether it's sufficiently generic. It at
> least covers the cases in this series and more.
>
> For example AI also flagged for me parking the vma argument
> (PTR_TO_BTF_ID) of the bpf_find_vma() callback. It's low severity,
> which is why I excluded that from the series, but "reject a reg type"
> wouldn't work there AFAIU (we would break many legitimate programs).
>
> Opinions?
>

It does seem like we miss a reference representing single frame
lifetime which we can then use as a parent for all things that
shouldn't survive past the current frame. There is a separate fix
right now to invalidate dynptr created in subprog's frame. Seems like
that one should be expressible the same way: local dynptr's parent is
"frame lifetime" reference.

We can even relax this "cannot spill pointers to stack into stack
frame of the caller" error, potentially, by just turning that
PTR_TO_STACK into SCALAR at exit from current frame and let program
verification go, no harm.

So for me it seems like a necessary and useful addition.
