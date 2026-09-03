Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAC31ADFE4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396509; cv=pass; b=G+1XNQ0w0ys+r4c7w/pr2bv/fPP2JzVtqovgP0PwkoZF9dzPJ3Vc8d9UkPRC1b6WxyU2yUUiFGvU+4EEZekYr/s2gbwmEBsuKiwLGIffC0mz34av6vb1R0BfrwTpxKqsD2kSNHzK8DtV7/TDEh7I47f8/LC0PSSeV4ipLt9/4RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396509; c=relaxed/simple;
	bh=pcMbVHcQmHfSQ80hXIs00Z5K3jn7dtMrGjSap6QOZNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gelqy0VhSgWwA07vn6mfxjbAsQRD7FWwxNQ+W9dW3ZH2RRSoeABCmNYsf33ItL6lud7RNOrs5Te41Lsk6FGI8GSUOuulKbHajDl3caE7umk5rFG2YFHffCBJdkSLaumpeBrbkL7z9BUZbUKQvUGN8PvSrir+C0cRe2z35ehEA90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYPeR/7u; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYPeR/7u"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2664776a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788396507; cv=none;
        d=google.com; s=arc-20260327;
        b=F904A5l7UnInWa/dx78bTJD+NQ6jk5kl8mRoNWbLez1U3dAEfAyLhZx6LaW2cofGxr
         4yvUT9+57o6uBWUhpP0NPaxtoSxdIApcfvGusEwI2qN1WovGOWmQxpL64CAipZck0lQ0
         YDb+ApmPMy522SqoYuGcEZamWk2GN2uJYQq3hJpdAUEFwv5sQk4BQJnzTqS+h46MkmTM
         9H85qUEJgqhAahENlNPDeq0wwcdLEO+ABUFAEWphAh0L8hYWdJgcUpVjIReL0BsQ/tay
         lNjOscUa7Q7EnP/CPEMCG/dPflKCuvoGS6WKBt+HlLrn3IyFKIQJbtdzcmuu0bJKNcwW
         RujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pcMbVHcQmHfSQ80hXIs00Z5K3jn7dtMrGjSap6QOZNE=;
        fh=alF3D8+mZwnLwJfeqWWYFZJAuS+7RSR4+ifJgVfrGjg=;
        b=fq6FPuTJ26LikWCi4u7O6JRaXi3CS1if8wpUtyLMurnCP9YsnyXTK4fUyT+D6DY2y9
         7Uudltmz3YSHdRlJs2LPQdh/6a3O1c+NMAmYTQCuoPPlOjEMyMcY35kY9X3JQbTUWGbj
         ThpqLS643Og2+f+PRnpG3SHN0mLBzzCWSUmS1CCuOqEHmk0UgT3ga+eQsfM7DfG0fgRI
         55S2nq8UXcPaQ4c9OpDFBjMhaC197zAmQTMKBd1Eu0voZmzj4rKa6xLL365h/Ts5Bu0N
         e0GgJOx56OSLlrhK1xN85Jo+ysoB4uNbCqhNBx0XUM6YUhkJ+g9QdYe9J4/8I+rsWhhH
         986Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788396507; x=1789001307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcMbVHcQmHfSQ80hXIs00Z5K3jn7dtMrGjSap6QOZNE=;
        b=dYPeR/7uEMlrn1zIOPnWEPkg3No2sxKEbTjj5Kyu+4BT9aLyKu1Zcc6EVomS97p7IA
         mFtS7b2ZZi026IUtk7uQTXN2WWBjijejMW2ebarW+IcuFxKzFVXULBUPP0Ca7s27/tPW
         PeRo/Ko0jDMS0GhPdwyvHZGsBOG6G2fOaPMoFsPwi7R2FE+tGkBqZhynF9PbA2qffagM
         SynwLkbXI1ngJdS9clV1RiA2EgcTsj2wb4cTyRJ2cnVhNXmnj49yCH7T95ecoVc5DQn4
         0zkzYYIjwUMEMWslJlJi+5jC8WNgYtbp9pgNVFfka77JW5wTJaPiA09suy/Aq5JAolNM
         akCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788396507; x=1789001307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcMbVHcQmHfSQ80hXIs00Z5K3jn7dtMrGjSap6QOZNE=;
        b=QbnCHL6PpaQoHfiM+00ISFt+Siy3GJkn09y0L9qcqcDbbCj81n8dhkumH08PoKXv9l
         mvm3CCuNCpLFfY/xVx2QBuN/0AsRzkCy/37zBp5m00GJ8IKU7X2NX0BtJ0EMAEOYgC5/
         GqPaQicgX4P11RPvzkgGvi4nevN0s9cmoJAhitzu9wmhve1JTnmIDkBTP+AMervMSovk
         Y2zwhd6cpeW+9KcFsWgKmxPMcYl9uPeJ3lhCgf19leAgStp/LeaSqa0SVuH0Sf1tep66
         pWKOH+3bQJ1uc6NzuR1pG9IsWkY7NVpJ6szZKY8TD54dbFzTb+k/LMZJ98HpXN0LhcXP
         hPfw==
X-Forwarded-Encrypted: i=1; AKwUvBy2tez+Vxv/kakMQt0UaR9DMMZpnJ30FyFe8XnwyxCWskCPhNucXEwoApoN1NSw414OHYr9Ed5bLyLOeVA=@vger.kernel.org
X-Gm-Message-State: AFuF++mJzCjh9E49LdIDq2IPx2O1edW9WUVE9hF9AoOxcTADI9BwNBZk
	QQbKQIj4xqcP/0GKRDrgfNzTx3DDEMaEeDlaIIAd0SJGQ/PGEqZHTpDDKL28e6X90eRktOGIoST
	SBYbZxShv872m04kCanNWcXYhUO7nc5I=
X-Gm-Gg: AYBFou3CTsXeK1k5Ognb8m7T+kMoKss6lJZTjC0yDrVIYHZKsswf2Qe+k+5m2akuDr2
	saasyG7nGISn/tBWNBdG6roJOQj3Kgtip4InWAkZwSQ5w9Kf8gCHd9C1ZAbb8G/I3V6NI0vhgIc
	GgwszozfB1ZnOZrH+/drYCmXQ5E3CGPvmjJl/92F6T+2Ph855ZLE5Cyw5UMgVbmnyDjB440fdwt
	nr+tOflywGvzx2Y/Rp1D5RS31mNi+oNHg6tG8z7PJzqj+GVP/YMKN31VEyvGvXn1a3aH5W8L0vD
	xncoRHGm3FoDNdwQNf5Nj8M/hCmgP4NoLdwpy0WzjOKYUXOeyru/DWlMy4y+z/AmTvgsQjwafOl
	DVNqEQKTYI1EbVVAT2cT3BnjGGmdsZfgK/wtkb5EL/gsB72z/uCR7
X-Received: by 2002:a17:90b:3b81:b0:398:9be5:b41d with SMTP id
 98e67ed59e1d1-39aee2650cdmr12358772a91.24.1788396507007; Wed, 02 Sep 2026
 17:48:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819122252.1782790-1-florent.revest@linux.dev>
 <DL27QZ6SEZKT.1CV2HAX4A3WI4@gmail.com> <CAADnVQLxi-R1KDUXJJjpq69SpV8UcNJVqBi7uicO=V0WhAvyQA@mail.gmail.com>
 <DL2S878KSOI5.1SZMLIAWMCNUJ@gmail.com> <DL3FIBQNP6AU.1HO08FMI292UX@linux.dev>
 <CAADnVQLMm43qJxuiHUuuh51wAL4kH0+fRoaM7YfbZEXT7LHn0A@mail.gmail.com>
 <DL4R2YXF9J8G.203VBANYFFSET@linux.dev> <CAADnVQJ+OJKmgaDM9B58g30M_-pkZgGmbDuvEWmrg8U_ZkxbSg@mail.gmail.com>
 <DL57W17T3VEC.1EJMWXYOB7JFU@linux.dev>
In-Reply-To: <DL57W17T3VEC.1EJMWXYOB7JFU@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 2 Sep 2026 17:48:14 -0700
X-Gm-Features: AcwNN1W8LC8fgwtZ-phigylO3GU4p-vuY6fqVwU-3N3iINKxrRhBVAdkq7Z11_Y
Message-ID: <CAADnVQJLNW=FqPrWq7MX28iA_Qsw_N1mT923WrVkoqES1ZArjA@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Keep progs alive until the trampoline image
 calling them is freed
To: Florent Revest <florent.revest@linux.dev>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	John Fastabend <john.fastabend@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jose Fernandez <jose.fernandez@linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 4:25=E2=80=AFPM Florent Revest <florent.revest@linux=
.dev> wrote:
>
> On Wed Sep 2, 2026 at 10:06 PM UTC, Alexei Starovoitov wrote:
> > On Wed, Sep 2, 2026 at 3:15=E2=80=AFAM Florent Revest <florent.revest@l=
inux.dev> wrote:
> > >
> > > On Wed Sep 2, 2026 at 5:57 AM UTC, Alexei Starovoitov wrote:
> > > > On Mon, Aug 31, 2026 at 1:58=E2=80=AFPM Florent Revest <florent.rev=
est@linux.dev> wrote:
> > > > >
> > > > > How about having old trampolines skip freed programs instead of k=
eeping
> > > > > them alive ?
> > > >
> > > > Isn't it doing it now?
> > > > That was the whole point of patching nop to jmp in a trampoline.
> > >
> > > Just to be sure we're talking about the same thing, you're referring =
to the
> > > "ip_after_call" patching done in bpf_tramp_image_put, right ?
> > >
> > > My understanding is that this only helps in the case where a task is =
in the
> > > traced function while a prog is detached. It'd make it skip all fexit=
 progs.
> >
> > Right. That's the one I meant.
> >
> > > But if a task is sleeping in a fexit.s prog for example, it is alread=
y past
> > > ip_after_call, so this patching would not prevent it from calling a s=
econd,
> > > freed, fexit prog lined up after it in the trampoline, no ? The same =
situation
> > > should happen with a sleeping fentry.s prog followed by a fentry prog=
.
> >
> > Hmm. You mean like fexit prog A called a sleepable kfunc and
> > another prog B is attached to the same trampoline.
> >
> > Then the trampoline needs to be freed. ip_after_call patches jmp in,
> > and trampoline proceeds to free progs A and B.
> > B is freed right away.
> > Eventually A's kfunc returns from sleep
> > and jmps back into a trampoline
> > which is not freed yet, since percpu_ref keeps it,
> > but prog B is gone, so it attempts to execute a freed prog B ?
>
> Yep, exactly!
>
> > > I have a reproducer for those scenarios that crashes bpf-next. I will=
 make it a
> > > selftest in v2 like Jiri suggested.
> >
> > Please narrow down the reproducer (sounds like it's a random stress tes=
t
> > at this point) to specific steps.
> >
> > If my guess above is correct the reproducer will be short
> > and deterministic.
>
> Indeed. When I originally sent this patch my repro was a stress test but =
when I
> found out about the above scenario I could make a short and deterministic=
 repro
>
> My only question then is, what kind of fix would you prefer in v2: keepin=
g refs
> to progs while the trampoline is alive ? (like in this v1, but I think yo=
u
> nacked this approach already ?)

I'm worried about holding fexit progs potentially forever.
There are kernel funcs that enter and never return.
Attaching to them will pin fexit progs forever.
While right now it's only the trampoline that gets pinned
which is 4k.

> or some other creative solution like having
> __bpf_prog_enter*() skip each freed prog individually ?

I don't want to add more overhead to __bpf_prog_enter*() wrappers either.

> Or maybe something
> else ?

Let's extend ip_after_call concept.
Instead of using a single NOP after the call to skip fexit progs
let's add NOPs in front of every invoke_bpf() including fentry and fmod_ret=
.

Then on tramp destroy patch all nop-s to jmp epilogue.

llm-s helped me realize that fentry has the same issue.
fentry prog A can sleep
while non-sleepable fentry prog B can detach and things will crash.

better ideas?
