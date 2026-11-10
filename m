Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794321891;
	b=FcLCHlvrVBY3SjGnW1IzIr1vacXJXWvXPlei09DgXmp6qrTSnPJnNNZow8assSZm6/H0
	 CJrnGl5LlrgFa0Lfg42EPWplCvWGhaziSj8pK3wGA408GGHeDvft4nhy1gjpM0fzZnxSd
	 nf4CID6mtZUmuIW16YVQ5Xrwlqs3zWaWHPTNENSH72qvfC9s/IkOG+L6G8VasbSLa4klq
	 nAILHkrovXKT0XE9ChgJS5ru/woKXXzNK+PKNbPZCUzgCH63GqrbUh511VRniU7rV2jU2
	 No+4aFQ5Tt5T6jiZ7YrYR3MK5EjdsTnhbkvSjOLE/ra4mP7JVg5wlmijIiaS7dNxJeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=moeKZ6s5YDC8ka7H6MWH72Yzji4NuAIlVn7AGJL5KvU=;
	b=wl0zUWUY/dMnryZ9L0sUbUwNPtOyVZdwmQhsfBdDCoWOjnBl5FpoawR1sgxgLUvKheZw
	 oHQiuJqmeM5viK//Dl4UfARfQjDwSkRxQbJLVv1rgGmX0y5jFL1DKE2pGLBK2w2pmBZzA
	 1YfGsIvWTvy03A6k7p2lQlieTp6zLsj1S2+HnOzfE0+JDcNCSNBTiricFCkOBQeCseJkp
	 7dWodsKYlPc3sX+gKVqOO7ADCAmMeeIhng0PUtfTuUz17NMoHj1cVZuTgxgLO8SE5S/IB
	 7HoTtTyXcZxVxiqVJrdW25T9R4mbHKIHs2ksp4E8yFnWdOTXMUdexYppj1m1rbpBcaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k0yFLZKl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC7D60A260D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC7D60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k0yFLZKl
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso3715383a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794321889; cv=none;
        d=google.com; s=arc-20260327;
        b=RuU+C3PbEQvMj5QUDoJfBwwT6/Xyr7uBE/oJBy2GlyEraHsXmiIMj807MtUvSQzucD
         qWHsi8yUB5cOP9wxSHYCiM9zhxFVi806luRa0cYxlZOliONo1npP6+Wu2p4kl3kh4wVo
         TKrzyzkSun3WXmvY3DV4SnCtK1PDVS5hnFYbSl/S3aGonHkOiLVjPEH5ty3PDQla5OQ8
         Z0lC9B8+ekFH4eVKaHOU2b4nO8WlddkoikehzsMsqARNSNbTRyolf7w6jqfjmGTxL3Lv
         OySD7peMSqq67LyHMz/x8ztuwslBbWrC/NycPffUjBX54WURaGyXJtC2c2zVMR2foBtR
         pfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=moeKZ6s5YDC8ka7H6MWH72Yzji4NuAIlVn7AGJL5KvU=;
        fh=ygdHS9g5KCW2qnLuSBExNl94sCMyg/u6D3hVIXZ4++Y=;
        b=Yi1PbyecmZXtkq7GSmv2JNOMBiZLU3O9dtEBbagMVGmzLXpBiXhbyPC0oRZi4AvqSU
         ZpH+XpRMjuJsZe9JAnnjw7PZDQg1kLFoZqrNVqhUU8twzZHxQlqU607ouCRTWEgPtqPC
         ylqfsXLLqTCHhxXjzqA0hY7eG9HK3VmqIYpl6ULXlILLJcb6bc5+NbeiWk3tsAgcSF6d
         ottLKTK4lbZC0blkDmThlgeG8eUXxkvtQfZf6L+Q/JDnyRcrmVZzYq12bc2/z26HdSYx
         labrOAEdPPP6xRedsy86NJDxbJxJXnsAve/ZzWuApQYCnO2ofQcWUNRnbWnQDXaL7FHA
         +ffA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794321889; x=1794926689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=moeKZ6s5YDC8ka7H6MWH72Yzji4NuAIlVn7AGJL5KvU=;
        b=k0yFLZKlG1wQFgfj9z0ooJQ7IihGAZ88XWoDgVpZ80fz7dqJSvZ/AC5b2K2bhtRjA1
         KZFDlBnKFSYLhgls1LSE3fzS5CXdve+wvmHxLJ72XQ+s0Sp2lhAplTeLi7EWlOXf/kN/
         FjMnMKtiAdi5FZyhBGdF1gMm/rlDgKupB9ZuHM947SYfrubz6rMbrTw1tGm/VeWoBJ/p
         sNasieSKRi+MYlyMt5MqJKNhyhZY1LwTdpgW1bKvwl5CISU9suLCPHIjYZya9oA3JyhW
         46sh2uKsbDHrGxjli1ozccKvMPy7mGSptfBq0EDpCogMT9ha37gpWKQ9yaMXIlGpLnNq
         rUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321889; x=1794926689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moeKZ6s5YDC8ka7H6MWH72Yzji4NuAIlVn7AGJL5KvU=;
        b=whfu83V+vHYfVIEE1yOKkeelxw8+xZUgvEalIPekmBwm/t4Wyt6Bt/hIim2hIG9+OX
         Glzq+fxA4kNM0Iiyd+v5wOpLVL4+ejJmt8S//0VES+aY8svEvKfPgOQMaOqbslKzs82i
         eXDvyWkbrrEaHV+BbwFgMr09dPvkflIgpqMLMdjjtYbXrAWOEDW1jgx59hdE2zT3lASa
         3AKgBSRWFNxa3Fi2Q4cQNV4DZOTawBNyTewWS5eWzKNqqiru8TR8ywlveuspp6I5fq+z
         2DLj4tm/K2Zfq5+h3iZQK/ePhiN2jBITKoe6Ai7JHjfKnTOp8OmZbkOTqeoz9SC/6Fwz
         wRRA==
X-Forwarded-Encrypted: i=1; AL+hErF/UB5i1VhLWLomC6WSSW2CJZMJK00avVvQbeZ4IKLHxgz92jKAyttM5nWtryqRoSd1L8E70WyWPz2eIEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GpPnLMDh0tqV5KyuPvaBciYnqqSu8oQ4vB/D+Uwp1MsqQojOX
	/46/yQTL/0craBYF/KlEWxxC+RFEGQ3fwAlLuTYF7dU5LMAkNsUeXFCkg99I+yDwdt+YxVvb0dk
	t5Lcqv4bVZtJWlJufg2EELOdiyDVJ8hM=
X-Gm-Gg: AYBFou07IbmLjx0Cl90UhSFfVkAs4QqWIOd3+DZ762KxYU1iu3rhfXv+rscaNtZI6Kd
	O0iZes/CpxQ7oVb8iI4FuV9ZdwyxuMDkdugU90KOHKvoq7FtzbUd4ZUn2hVw+D2IOG8FTw4HMdN
	Sfjm/qDcMWlqus+bi/9ss6/Kt+mYRV6ybiSXJTiJ99Hc0nRxPslouQVDrX2szC176iK+6lwbRlX
	QwZHu3D3sJcvegmut/ul8CwD+tlvT0LKUH424JTf5cJy+PwcHryBTiu/cLmK11EdaQ1S3bYHUAq
	seDKDtYO4+wKqFWNWfVOzyQpsYKdGMWhJ+7xxnGo/Xyc5jT4t0vMCYb8EmKMK8CaB5o8DytPoWo
	wGVt50X/yuxHSHDjjot6zlWUZE/qKRdocRt4eiAqSJsDOaI5UYWxLkGzQS1t1NqXOqbevYAh2NM
	TeuOA99f3grL/CKtzi+JGyjJzpUnWN
X-Received: by 2002:aa7:c1c9:0:b0:6b1:ce47:f54b with SMTP id
 4fb4d7f45d1cf-6b757243041mr1879154a12.21.1794321888769; Tue, 10 Nov 2026
 06:44:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611041404.befe64cd-lkp@intel.com> <20261105-trommeln-einspannen-radius-ccb4e174e407@brauner>
 <auygOHcuBba_o132@gmail.com> <CAGudoHFpNbxL13ZOWiyyLSPpmzXcB=e=RBZ8ZGk+Oc58Aad9pA@mail.gmail.com>
 <au2vjpu_yqNa83pN@gmail.com> <CAGudoHF3de_55YvdztPs7QiYs25u6nPEV=uMOzfr=bWmwof69g@mail.gmail.com>
 <avMQxhpHhIPM_6HP@gmail.com>
In-Reply-To: <avMQxhpHhIPM_6HP@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 10 Nov 2026 15:44:36 +0100
X-Gm-Features: AclHuK8dFFD73mHOhMvH1NU4_XTmtwUs_i_ldKGW66HJeL7DZokh2ZM31ccn5Lw
Message-ID: <CAGudoHFe8XgtKZohfn0Q=EH0EeXozTZq+UPJKN0BEmLnEG2s=Q@mail.gmail.com>
Subject: Re: [linus:master] [fs/pipe] f7f4665dc5: lmbench3.PIPE.bandwidth.MB/sec
 18.5% regression
To: Breno Leitao <leitao@debian.org>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:46=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Fri, Nov 06, 2026 at 02:44:54PM +0100, Mateusz Guzik wrote:
> > > 6) Any other idea?
> >
> > The SMAP stuff is the primary problem right now. To reiterate: every
> > single buffer read/write takes a SMAP trip, which is very expensive
> > even on modern uarchs. Refactoring this into i/o under one SMAP round
> > would provide a visible speed up. It also happens to not pose a
> > tradeoff in terms of memory usage and would be my first avenue of
> > attack if I was working on this.
> >
> > All that said, one reader vs one writer scenario definitely makes
> > sense to optimize.
>
> I've spent some tokens on it, and it seems to give ~5% improvement on
> the pipe bench. Is this what you had in mind (in a single patch format)?
>

The resulting behavior matches.

A clean implementation escapes me and that's part of a reason I did
not do the work myself.

The proposed patch is on the uglier side, but AFAICS that was never a
blocker in Linux.

Or to put it differently, I'm not happy with the shape of the patch,
but don't have a better suggestion. The win is probably enough of a
justification to get this in.

> commit 724fa7def2700d51a7f0427d0de06c123b3bf8e9
> Author: Breno Leitao <leitao@debian.org>
> Date:   Mon Nov 9 05:04:45 2026 -0800
>
>     x86/uaccess, fs/pipe: copy a run of pipe buffers in one user access s=
ection
>
>     Mateusz has been constantly suggesting that The SMAP stuff is the
>     primary problem right now in the pipe code, which summarizes to
>     anon_pipe_read() copying one pipe_buffer per copy_page_to_iter() call=
.
>
>     On x86 every call opens and closes its own user access section, so a =
64
>     KiB read that drains a full default pipe executes 16 STAC/CLAC pairs.
>
>     The pipe's pages are not contiguous, so the copies stay separate.
>
>     Move the body of copy_user_generic() into unsafe_copy_user_generic(),
>     which leaves STAC/CLAC to the caller's user access section, and turn
>     copy_user_generic() into a STAC/CLAC wrapper around it. The existing
>     callers get the same code. (This will eventually be a second patch if=
/once
>     this becomes an non-PoC)
>
>     When the destination is a plain user buffer (ITER_UBUF, which is what
>     read(2) passes), copy up to PIPE_DEF_BUFFERS consecutive anonymous
>     buffers that the read consumes whole inside one scoped user write acc=
ess
>     with unsafe_copy_user_generic(), then release them. The buffers are
>     looked up before the section starts, so that only the copies run with
>     user access enabled.
>
>     What this buys depends on what SMAP costs the CPU. With the buffer by
>     buffer loop, booting with clearcpuid=3Dsmap speeds pipe_bench up by 4=
-14%
>     on a Sapphire Rapids Xeon Gold 6450C.
>
>     pipe_bench from the pipe selftests runs 1, 2 or 5 writers against 1, =
5
>     or 10 readers on one 1 MiB pipe, with 64 KiB writes and reads.
>     Throughput change from this patch, median of 2 boots x 5 runs, SMAP o=
n:
>
>                                    Sapphire Rapids
>       1 writer, 1 reader                  +5.2%
>       5 writers, 10 readers               +8.0%
>       all 9 mixes                    +5% to +15%
>
>     Suggested-by: Mateusz Guzik <mjguzik@gmail.com>
>     Link: https://lore.kernel.org/all/CAGudoHF3de_55YvdztPs7QiYs25u6nPEV=
=3DuMOzfr=3DbWmwof69g@mail.gmail.com/
>     Signed-off-by: Breno Leitao <leitao@debian.org>
>
> diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uac=
cess_64.h
> index 20de34cc9aa6e7..28208db6132c27 100644
> --- a/arch/x86/include/asm/uaccess_64.h
> +++ b/arch/x86/include/asm/uaccess_64.h
> @@ -115,10 +115,13 @@ static inline bool __access_ok(const void __user *p=
tr, unsigned long size)
>  __must_check unsigned long
>  rep_movs_alternative(void *to, const void *from, unsigned len);
>
> +/*
> + * copy_user_generic() without the STAC/CLAC, for several copies inside =
one
> + * user access section. Returns the number of bytes not copied.
> + */
>  static __always_inline __must_check unsigned long
> -copy_user_generic(void *to, const void *from, unsigned long len)
> +unsafe_copy_user_generic(void *to, const void *from, unsigned long len)
>  {
> -       stac();
>         /*
>          * If CPU has FSRM feature, use 'rep movs'.
>          * Otherwise, use rep_movs_alternative.
> @@ -131,6 +134,16 @@ copy_user_generic(void *to, const void *from, unsign=
ed long len)
>                 _ASM_EXTABLE_UA(1b, 2b)
>                 :"+c" (len), "+D" (to), "+S" (from), ASM_CALL_CONSTRAINT
>                 : : "memory", "rax");
> +       return len;
> +}
> +
> +#define unsafe_copy_user_generic unsafe_copy_user_generic
> +
> +static __always_inline __must_check unsigned long
> +copy_user_generic(void *to, const void *from, unsigned long len)
> +{
> +       stac();
> +       len =3D unsafe_copy_user_generic(to, from, len);
>         clac();
>         return len;
>  }
>
> diff --git a/fs/pipe.c b/fs/pipe.c
> index 4fa69192e6fba1..6f6041c94abefa 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -340,6 +340,115 @@ static inline unsigned int pipe_update_tail(struct =
pipe_inode_info *pipe,
>         return tail;
>  }
>
> +#ifdef unsafe_copy_user_generic
> +/* One buffer of a batched read, looked up before the user access sectio=
n. */
> +struct pipe_copy_src {
> +       void *kaddr;
> +       size_t len;
> +};
> +
> +/*
> + * Fill @run with the anonymous buffers from @tail on that the read cons=
umes
> + * whole. Returns how many, with their total length in @lenp.
> + */
> +static unsigned int anon_pipe_batch_lookup(struct pipe_inode_info *pipe,
> +                                          unsigned int head, unsigned in=
t tail,
> +                                          size_t total_len,
> +                                          struct pipe_copy_src *run,
> +                                          size_t *lenp)
> +{
> +       struct pipe_buffer *buf;
> +       size_t len =3D 0;
> +       unsigned int n;
> +
> +       for (n =3D 0; n < PIPE_DEF_BUFFERS && tail + n !=3D head; n++) {
> +               buf =3D pipe_buf(pipe, tail + n);
> +               if (buf->ops !=3D &anon_pipe_buf_ops ||
> +                   (buf->flags & PIPE_BUF_FLAG_PACKET) ||
> +                   buf->len > total_len - len)
> +                       break;
> +               run[n].kaddr =3D page_address(buf->page) + buf->offset;
> +               run[n].len =3D buf->len;
> +               len +=3D buf->len;
> +       }
> +       *lenp =3D len;
> +       return n;
> +}
> +
> +/*
> + * Copy the @n buffers in @run, @len bytes in all, to @to inside one use=
r
> + * access section. All or nothing: @to only advances if no copy faults.
> + */
> +static bool anon_pipe_batch_copy(struct iov_iter *to,
> +                                const struct pipe_copy_src *run,
> +                                unsigned int n, size_t len)
> +{
> +       const struct pipe_copy_src *r, *end =3D run + n;
> +       char __user *dst =3D to->ubuf + to->iov_offset;
> +       size_t off;
> +
> +       if (should_fail_usercopy())
> +               return false;
> +       might_fault();
> +       for (r =3D run, off =3D 0; r < end; off +=3D r->len, r++)
> +               instrument_copy_to_user(dst + off, r->kaddr, r->len);
> +       scoped_user_write_access_size(dst, len, fault) {
> +               for (r =3D run, off =3D 0; r < end; off +=3D r->len, r++)
> +                       if (unsafe_copy_user_generic((__force void *)dst =
+ off,
> +                                                    r->kaddr, r->len))
> +                               goto fault;
> +       }
> +       iov_iter_advance(to, len);
> +       return true;
> +
> +fault:
> +       return false;
> +}
> +
> +/* Release the @n buffers from @tail on, which a read consumed whole. */
> +static unsigned int anon_pipe_batch_release(struct pipe_inode_info *pipe=
,
> +                                           unsigned int head,
> +                                           unsigned int tail, unsigned i=
nt n,
> +                                           bool *wake_writer)
> +{
> +       *wake_writer |=3D pipe_full(head, tail, pipe->max_usage);
> +       while (n--)
> +               tail =3D pipe_update_tail(pipe, pipe_buf(pipe, tail), tai=
l);
> +       return tail;
> +}
> +
> +/*
> + * Copy a run of anonymous buffers that the read consumes whole to a pla=
in
> + * user buffer inside one user access section, instead of one STAC/CLAC =
pair
> + * per buffer. Returns the bytes consumed, or 0 to go buffer by buffer.
> + */
> +static ssize_t anon_pipe_read_batch(struct pipe_inode_info *pipe,
> +                                   struct iov_iter *to, size_t total_len=
,
> +                                   unsigned int head, unsigned int *tail=
p,
> +                                   bool *wake_writer)
> +{
> +       struct pipe_copy_src run[PIPE_DEF_BUFFERS];
> +       unsigned int n;
> +       size_t len;
> +
> +       if (!iter_is_ubuf(to))
> +               return 0;
> +       n =3D anon_pipe_batch_lookup(pipe, head, *tailp, total_len, run, =
&len);
> +       if (n < 2 || !anon_pipe_batch_copy(to, run, n, len))
> +               return 0;
> +       *tailp =3D anon_pipe_batch_release(pipe, head, *tailp, n, wake_wr=
iter);
> +       return len;
> +}
> +#else
> +static ssize_t anon_pipe_read_batch(struct pipe_inode_info *pipe,
> +                                   struct iov_iter *to, size_t total_len=
,
> +                                   unsigned int head, unsigned int *tail=
p,
> +                                   bool *wake_writer)
> +{
> +       return 0;
> +}
> +#endif
> +
>  static ssize_t
>  anon_pipe_read(struct kiocb *iocb, struct iov_iter *to)
>  {
> @@ -347,7 +456,7 @@ anon_pipe_read(struct kiocb *iocb, struct iov_iter *t=
o)
>         struct file *filp =3D iocb->ki_filp;
>         struct pipe_inode_info *pipe =3D filp->private_data;
>         bool wake_writer =3D false, wake_next_reader =3D false;
> -       ssize_t ret;
> +       ssize_t ret, batched;
>
>         /* Null read succeeds. */
>         if (unlikely(total_len =3D=3D 0))
> @@ -393,7 +502,16 @@ anon_pipe_read(struct kiocb *iocb, struct iov_iter *=
to)
>                 }
>  #endif
>
> -               if (!pipe_empty(head, tail)) {
> +               batched =3D anon_pipe_read_batch(pipe, to, total_len, hea=
d,
> +                                              &tail, &wake_writer);
> +               if (batched) {
> +                       ret +=3D batched;
> +                       total_len -=3D batched;
> +                       if (!total_len)
> +                               break;  /* common path: read succeeded */
> +                       if (!pipe_empty(head, tail))    /* More to do? */
> +                               continue;
> +               } else if (!pipe_empty(head, tail)) {
>                         struct pipe_buffer *buf =3D pipe_buf(pipe, tail);
>                         size_t chars =3D buf->len;
>                         size_t written;
>
>
>
