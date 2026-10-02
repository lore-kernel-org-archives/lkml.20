Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D67C48034C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941037; cv=pass; b=nmetl6y4vcbgV5sEJZS2Vn4fIZksBZyyj4ImOFptjS5bOqBJbbIxyDD4P4uEKWFNSiwN0wbrunOkLq86j1COesoYj9IJ/Q7FXGArB7cZnWEBsygQz4TWdGhXv94StuVwGmunvaf8x0ULSYqOhi02+mVGno9rNGrHbfvgAvUPGSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941037; c=relaxed/simple;
	bh=lN1hhMdriyj7QPcla6CJIPLYTvYL+HzR6XTrpS85sv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Re3ksdPB8O4DHlUT1Clv/S1iueYgYTwsbjke2XNU8xwXNMWmjhICZLFHqoFxLb9AXjONjJedIA8GlA14Q4UemSGVnNa8+LHqMhzfBCVaf9FJS8uZyKjBy9ZUvIsPu5fAlqOssiZhnavRrqOSlWVtYlVxvUWcGKwgcXanHyAQsao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOxm3lBh; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOxm3lBh"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so88300571cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790941035; cv=none;
        d=google.com; s=arc-20260327;
        b=BOOC5rTKHlcLa56pQdV0/Co86HdJwzJMklLlDPyjvRVu0KTAsvJ/JYshe2IlnG5jUg
         Tf+MODaL/nLRX0LoVcVMQiD2CX7sEE7yvE5gkimUgEDu59q8zj2ftc4OAMhvLHOVqiet
         zK5o+GTT1WewPm7Lphub2RHBYKPjlumcWgHGCYwsfsiLPJ2caqigKTwvP6McPd9ZQW0q
         keWhOuqlEKyH3F6KIwMzMDRp7fpTPoveHk1oNsIZW80BG0aHE/R3MGWv8lN2yF2ZnYWf
         plpZ75TCv+q/wFjX/pKU2j7f7XsI3tMdWuGIsdvbQh+vOiZcKkuSJgpcSorJAsQ2xUJh
         sF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sNFw6EjaVpez377CmXHJCYISmJpkLOWj2a4mkkpTO00=;
        fh=bZOHvCm+EDqRPhtNJ3LYCHVFOyoezCffMW36ycuO0cA=;
        b=XLrxMy2RZSOw4GscH4L0zX7ISiV8SvXN2eUPEn6o2a6NutvjxVLP5yFmRAB5XraEMs
         MDAAtE01JVHaQFpTkKt/aPner1GnmtGQEN3JKqf+RZ6rQXxg0oz3fJyux5sokQff7NmH
         bnauofPEjz2cfKBoWMO+GIoagppIjT4Txy1Sz9+a6VP15oXvvQK4Jgrx3zJkXwuuMI0S
         nZfVjgLMKiWKgJozCPZH1NAqVv0Xae3HuIK4dIrKib+fPCvphT8xgSs9LNpe1Gw8C/1A
         mjJxWUHvQ8DRDT2YQv5T1Ix8cr3v39xxFhzF9ABFNsLIq4Mu0BtYIfLtxzNxD6oKvtWT
         dQ4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790941035; x=1791545835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNFw6EjaVpez377CmXHJCYISmJpkLOWj2a4mkkpTO00=;
        b=lOxm3lBhcOMupkYwjD+meejO9XF0MKqtFIwKE99SPn7gnmFKRDO40jNo8I3ojztBo6
         b9wzCD2cw5yrnPVsZDQtPe3p2f1TSxbCjj3Sr2sKK32Z3apQ5Z7pl6+x7j7J4/IQdp2C
         EXfu9BduyuN3AbQXTDDYqsTmb17oMyd8VMzLWe5I+BVUKnejH3A3Zvo52YeXjpTZKoHH
         mXiBST7ngy+Ck90xLxEtTN+ccuNmSDdir8zyliz3CqI6ggVk9ON/+MpwI6SZm3si4B3W
         oj4KfcWOxkkuzgTp3svVTIU6lesxF4zzxX0Dt7bS5DDlO2DYiH3ZHEXjc19FzJbdxI32
         m9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941035; x=1791545835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNFw6EjaVpez377CmXHJCYISmJpkLOWj2a4mkkpTO00=;
        b=KQ6oRsPcsUdaPN8nK91k5YtFoywD/byry4GdQXFfAszTZ6MAJU6Cb9Mx9RkY/IzznA
         cCCONP7PhNgZlI3tDQ1HF/3gGSSUr2rD7zrdm6wgbk/OeOh6B675U+R7KhTmuV9Pcf7f
         PPSCBkUTuGcDt3PDmroYe7KixOxwuW6Ef7OM+ikKQri4kroNCjcQ/x8+glzf49vdD15Y
         V6L5O+hilV157sU3LMbaO3xr0/HsNsUiWz+yiXSm5BYeap0jVGV1Xekzq80Ty1ymTfjZ
         12YZY8PLlViDFWuPnzyIPG2oXhUPTMkxOzTe2PAaNs8sabzdYeLeZbvMpdTG3pvJGdy1
         Qpog==
X-Forwarded-Encrypted: i=1; AKwUvBzE8xVD2GF7fj7GiGjzRAQSVmKy6LLDOZ60V+cwO9qw9IWnDlyuzhcBrH4Oj99zExq6tdJsYtTWHKO1ipA=@vger.kernel.org
X-Gm-Message-State: AFuF++luLT21zZ8bpKM0NofCTmj6D8k8JudPnKicFZd6a1/arxJ4TRHL
	BnPdXvOv6whYHa1nYc5SPY5iMnoXJkBx7bEUA/orrrtfLFAG07eWupcU9YWjqDFag9HXFawVQEI
	OoyYU68OqHMX+B6fdN4MCENltCQubd74=
X-Gm-Gg: AYBFou2e20gG8NdHTAsbXAo0BOgQvJC5A17rIDHmSfVd3j8IpzdAW/fS1m9X3kQsjEm
	UI0cZo1emKAqTNDGB9xrFABL06dh9kybd3wxHdKoHAMeHf7tucX5wsF3TgKvMDpnCtHbakDWmUH
	QpZOgFjOAxLecrAJRwPn/PdjH3szCbQXYjG7+HXsYAByjaa/j71gekiKtNiZKVz5vc7nVVLw8cc
	3QbgwnqiaaRbEXKsCWcSIjcr3OyZxMHE7UNnp0CAl6j0MZVwuJYDAxOSRV+wgXbRg8m3a/JML8z
	KtG6Xmr0XDMidY9Sg9jHkMaIFwNbSBX01TL4RVtXwmQCVGnD3YAOjJp8mOtPce/hpcJfL8M=
X-Received: by 2002:a05:622a:4d45:b0:533:96c9:7ab6 with SMTP id
 d75a77b69052e-533cbdb4c73mr39682471cf.54.1790941035224; Fri, 02 Oct 2026
 04:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002044050.1277356-1-thepacketgeek@gmail.com> <DLUBA9JR5QHY.31UKYQQ9EYMDL@gmail.com>
In-Reply-To: <DLUBA9JR5QHY.31UKYQQ9EYMDL@gmail.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Fri, 2 Oct 2026 12:37:01 +0100
X-Gm-Features: AclHuK_xXspU51eUha2NYmeyNcOU_aQLhOQFxxEdwFOzhD_cXYtGDGcItbka9NM
Message-ID: <CADvopvZPO1gDMDhDOPcArjRJ0cPpSUZ5suMg-1kwRi+_-Xeitw@mail.gmail.com>
Subject: Re: [PATCH] bpf, arm64: Fix text_mutex critical section in bpf_arch_text_poke()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Breno Leitao <leitao@debian.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:21=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Oct 01, 2026 at 09:40 PM Matthew Wood <thepacketgeek@gmail.com> w=
rote:
> > +     /* pages of the bpf prog pack are shared between progs, so the
> > +      * set_memory_rw()/set_memory_ro() window below must be serialize=
d
> > +      * against other pokers too.
> > +      */
> > +     mutex_lock(&text_mutex);
> > +
> >       if (plt_target) {
> >               /* non-zero plt_target indicates we're patching a bpf pro=
g,
> >                * which is read only.
> >                */
> > -             if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), =
1))
> > -                     return -EFAULT;
> > +             if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), =
1)) {
> > +                     ret =3D -EFAULT;
> > +                     goto out;
> > +             }
> >               WRITE_ONCE(plt->target, plt_target);
> >               set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
>
> The lock hides the crash, but set_memory_rw() is the actual problem.
> The page is shared, so it makes 64K of other progs writable and
> executable at the same time.
> Use aarch64_insn_write_literal_u64(&plt->target, plt_target) instead.
> That's how ftrace_rec_set_ops() and arch_static_call_transform()
> update 64-bit literals in the text.
> It's atomic and writes via fixmap under patch_lock, just like
> aarch64_insn_patch_text_nosync() below.
> No need to change page permissions and no need to move text_mutex.
>
> pw-bot: cr

Thank you both for the quick review! This
aarch64_insn_write_literal_u64 makes sense,
I'll test and submit an update shortly.

Regards,
Matthew
