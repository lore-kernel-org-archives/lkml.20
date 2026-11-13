Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556415;
	b=FQPETKnAlyXUI8q67t/Qs10875adsI97TxO75IL9Nu9j6xstJ3iv6xFo5EiI0A3rjCOT
	 Dmq7Nvt4DPaJViZT6IK/hhm4dx4NTflueN0CLTrNnnQzLhQxGKG94SMVxFHpsTWIq+Yo6
	 WyIRIao2hAohHZZ5hUrWlfzk9Z2G7I44gHaej40dOgJ+4D7mcFPlub4Yh22MKxdPPZdf8
	 S1RYwX5ffIHUbd4GLx/lFYWEO70ut545syXFHXKBHLK/przc/D09gsQ+FVvo0l4XrXjXY
	 +r6Qsr2rmVwSzIaG8PTdaE7E0ms8Umqsxm8iXG+IGzc2pg+NuItVb6owNcpeURHL/Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556415;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pbc+EvL/kolpX1ANyxGTDhTo76dtFAMfqxanhYSvQ5w=;
	b=SJowIRFVAJstH3rpLs/g0T6dcAYjPznvGSQFWPmzEVbDBT52tYw7cGXHda8YL0y2ZJmy
	 4NSNI1xvPXbcaQoEXxa3v5nfBqSotOgzfHnZWM+rKdOsdpPSZOmthL7kuO9DWBMr3ZjDm
	 LeQaQbv0ReBdq6JcAfxxwglyjcN5jbapXDP1imcZnJSY6U7r0nP1J+87DuHZBL6A0ToOP
	 GKNgODrr9Sl9hC/1WUMeZCabWGOv/yzZzdwDkUqP+3cawLKyy3LGTWEgcnlWB3qHoLofm
	 o1DEIwWSwiShU7wiWSGIW0Z/dwl3WS3s5NiFcKHWwDMgVbtE3W2UgL78E4LmBr1072A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhnsFX9I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57CB606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhnsFX9I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2A41F000CD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556415;
	bh=Pbc+EvL/kolpX1ANyxGTDhTo76dtFAMfqxanhYSvQ5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FhnsFX9IqOEqzm1fK0sNBHyJwBPNMf7/T2Q844/+KOgoLeRNe8Uvwfk9UXjYEh/YU
	 0kFmgr6oVnS1TSt8tFJ59Sjxc6VvtbE63GPPevSOCeMjYSxs43SOTb7iewSByFZ+mv
	 DGBmS55zCFniI0Ijg8MJ77/SzpPDL9UMtQ1XtJLIRf/jvOvF6C8KxR6OK2lXMktE6y
	 op/KKva/v0i1zEkZ+ynGkafR39WtxXETbErAR/lbr1w/XSzlhHTzigeWj7MDfoJleZ
	 mArTbVKENievzAd9bOUpgyIq/HDeNZ/yPdD3KcVxOl9GiTuFBfGcGTUeL/fXt5EgmS
	 Xp2Mqnwcwhtxg==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so733131f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:53:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFEp2kQ2ynatX6mrHnNa+qUQnaXB2u1D6vOQ7/F2tsuIDN91omsWxUZ7SReCu2STty03gYbCPs67mn8wTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JGnJxWAB4yK+dLQ6uGCk1BmZTgvUcXngRWbmD6U6EV3v3RrSO
	+f3UJGMjexL/4+SzhC+mFMOIC2w6c/GrJdsqpfmw7gmqukUBpqjri3lClj0IporPLkkC+iXZZJq
	rJ6mkJieh1bax8li/StldJ9ulNtVkd0Q=
X-Received: by 2002:a5d:5d07:0:b0:48f:e879:5890 with SMTP id
 ffacd0b85a97d-49c727d1ea8mr4317788f8f.32.1794556413956; Thu, 12 Nov 2026
 23:53:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-probes-in-lrsc-v3-0-a95089852a17@mobileye.com> <20261112-probes-in-lrsc-v3-1-a95089852a17@mobileye.com>
In-Reply-To: <20261112-probes-in-lrsc-v3-1-a95089852a17@mobileye.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 13 Nov 2026 15:53:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ9hBeHV_gwTgRpJTYLm4G_dNgdD3Qy6W7eJjpox=YUEw@mail.gmail.com>
X-Gm-Features: AclHuK8fCN6hKllkO0ilkI7l-Lsw-a941NZB2lA8LguINRyjsCRWTEqXNvF9Gng
Message-ID: <CAJF2gTQ9hBeHV_gwTgRpJTYLm4G_dNgdD3Qy6W7eJjpox=YUEw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: kprobes: fix out-of-bounds read in riscv_probe_decode_insn
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pekka Enberg <penberg@kernel.org>, 
	=?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:02=E2=80=AFPM Vladimir Kondratiev
<vladimir.kondratiev@mobileye.com> wrote:
>
> riscv_probe_decode_insn() can trigger an out-of-bounds page fault
> when probing a 16-bit compressed instruction at the end of a page.
>
> arch_prepare_kprobe() safely reads 16-bit parcels into p->opcode, but the=
n
> passes p->addr to riscv_probe_decode_insn(), which unconditionally
> dereferences *addr as a 32-bit probe_opcode_t
>
> If a 16-bit instruction sits in the last two bytes of a mapped page next
> to an unmapped page, the 32-bit read of *addr crosses the page boundary
> and faults.
>
> Passing &p->opcode instead of p->addr to riscv_probe_decode_insn()
> (as arch_uprobe_analyze_insn() already does) avoid reading past the
> instruction.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-812af091-20d1-4915-97a6-741f51e07=
022
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  arch/riscv/kernel/probes/kprobes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probe=
s/kprobes.c
> index 9e2afabf94e8..63ee5066def5 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -85,7 +85,7 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>                 p->opcode |=3D (kprobe_opcode_t)(*insn) << 16;
>
>         /* decode instruction */
> -       switch (riscv_probe_decode_insn(p->addr, &p->ainsn.api)) {
> +       switch (riscv_probe_decode_insn(&p->opcode, &p->ainsn.api)) {
Yes, using &p->opcode is correct.

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 GUO Ren
