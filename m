Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC2446AED1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390298; cv=pass; b=m+E7eTIJ74ckPxMBav/STTqLgn2/mK1xtBLURrl9loX4rQS07v1R5H2zvFHgod9iF2ifEvxDoIWx52Qjxz7fWrn7+g0kPz9uYW1yVsQ853D5WAlT9XtwURgzEEnUbLVI39/ZE/kylyFQnDxarAYctwcJiE+6tI942DC7nGT5ly8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390298; c=relaxed/simple;
	bh=/v97SxnXWUl3AzCD8i4KYWPlhfuArXwfYgURlq/8OC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgcLRj9rNsqasa4gBRQBp1wCEgWEE+WfbdKM+aZ3NN5ABJCTo+//VPNRgG4koUQe4DwcIwlAhRjTxNKjdRbxbyG0LYDxa5RPXPsir/N48ar3hdHu6A+hxjChmgwoIWGKrgFkpbVNz4I13ENLbnnTRi3oBm5sRya3eJLDJIq3YJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E+VK7vZR; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E+VK7vZR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1395335a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788390289; cv=none;
        d=google.com; s=arc-20260327;
        b=szp7tuAabjUgDooe3DGgTvRXQKt1I0xKR1s5tR/9YDyIY7DARIRodZ8XJYV+lLwAFc
         kEvNsehQgZ1uMCzWLWoPbFTNDV5dNJlhsvfvu4seVkH+Dd9EneFpJ0jplH5eWTbH2AJ9
         IVT4wL9IpAq0mepsF4odmYmEULW6l67GriKwyH1yR9vDIsD09d8UYfifUFJrbqwrmZpX
         lf9PO/LSRvl7CYMgJCrkmVDv9a05HFb0ZHdyUNBsZny34eqKmBRD/hszLLQQgjzQ4sBV
         rN7XtmyAncZRYj/5TtbYvzePTZlXp08RRjYnVXMZ2FbSOryffNQiq6oXDKVocty+QwMM
         d3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/v97SxnXWUl3AzCD8i4KYWPlhfuArXwfYgURlq/8OC4=;
        fh=Vogo4gj4lb6SJhOCMkyLPpkVSzZV4I+MKJDjIRpxiXM=;
        b=XopULfmBjQzWrnHyXiqaWjVzMTEjcwrQoYeDvhoF564IyTzeTQC70bxNWLpGsx9Zyk
         0P3LzL3p30AX+fswYGveiNUStpL/E6Sf4EVxk8F5ZqnI1Q9hhMuBSV03BYmawIFgPk1J
         crHqUW1AuMt3MjWyvIudB/SHdhxVbfcd3bGG2UfOZzoPhC9lNS4wXtaYiYfrh5kLSYKo
         yd+sEOde7H5w1/1xwb86JOWlS+is5qhCifAiqnRrF926L56/lO2BCkMSzSF4UzDiZKfG
         N/DXemT1/+0k5nelklqerAPBIrLi6aBHHWxbR0czjZ6FOKewurhzkfI9YJLAeaotu46G
         tTEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788390289; x=1788995089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/v97SxnXWUl3AzCD8i4KYWPlhfuArXwfYgURlq/8OC4=;
        b=E+VK7vZRF+UAaweMQupmYJcDtfYBCXTmfbly6iB1bEIecnOxjhl3ZGTJP85kBzzba3
         BWfclCerpJFce0/ObOT0+5u57AMR/Ld9bNfttf5t/9uwIDH79+wsNfQx99uMrcmOf2Jy
         eNVS1dcHV0YsbgjWFwjiYQ+vhiQacebt0Y1RkeIwA7K9xYmQpAnK0T1k+hBuK4ROQzUu
         /0UR5SEGv192wGNrPfOX2R/ZLK9UPTjV0thLrPUbgArW2Uq97ld+4RwBGpp7rjRLxbsJ
         RoRuAKKT8D6TGBjkWFf4IHUUSb+ceyqI8uTKL/ns5wg/GZJORktsGcT13kZ+6ae7n/9C
         WaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390289; x=1788995089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/v97SxnXWUl3AzCD8i4KYWPlhfuArXwfYgURlq/8OC4=;
        b=SJQEnuHg9tfZoMo5NIPd4jPOuNvXoSbZ6MukdNChdujNxACz5W1T06+hCKGueEaqwl
         mZC5mArEhDCzuGbZkCnXHOV0GPfP+lxx4+XHTMhX15QzfJKG+0Cw7qs7AmWqzUZ/6d0w
         V2NUvKVTKf5uAWhSLUBk0H0W9W+pQVMkArP3juRJxZqaFFo/lGah6XgUscXpkbcrv3Qk
         Bnx7F+f6zhNHVmZxDlBysDlj77f2G42MI4VZvZWPJnTjIGkN/bkSIdI1DyX0uOBrv9j0
         +W4zY9kMYJKaBHsbjx3Ihvq5uJE7GBvoaq0sH1uaLGCSGQwLr4OjCojgI66PFMHzMpvV
         KBTg==
X-Forwarded-Encrypted: i=1; AKwUvBwRgDnRRm305h+KgW+1kPEZmilY/FQba0uimVc7seBdTfcKl92Nb8vxmOE88vzM5CCrtq9yRxWpjEkD1D8=@vger.kernel.org
X-Gm-Message-State: AFuF++l8E/dHfOhgZfkE8p1fz0evfY84NCt1goGZz+p4hTrlS0W38yXc
	5p4w4/V+Y+eerXQN/mtJFAtIHW6iUF14ED+LHrRQ72Q34FkZUdP+91vQJiZSWjDK3yAu8w8hB2p
	t+9ivftuM7wbULi+tiQfeiYEGI4G+1Qs0wsFJufeJ
X-Gm-Gg: AYBFou1UElJy4itdqDVyBOqf9N22/y6Oy0iSr2v+IgLnpwwxN1lG4MFXlmPC4BZv6Sv
	z9G0SMEkAPr4YluIFQPeXMzc2Cf7Wk75iSPA4emfA7wtCvUaKXjCGQ4pE6dFI4LzwlwrGjJpcyE
	Bxc5JFMV3VxNbABsD8hTs+rhiqopqnaPxvPm8TJzTA/VPSDwfEjHFG7K4Ve/lN2PhyFPwBT6ZRy
	1oMoq/jaWNIIyxa98KH+s/nKTxYqnvc0KL+/9h0teMkgl7fhmX1wW9+lvDcaJoLM9yUR0aZG+Mc
	ERz+OolScxe8E7CnVqw1FuAodlUOe1aVmI+hRefoTf8SLsz+2g30fpfvVMegL7R+/JfxVDXERU0
	T7tCzk3Ti5x78mM8N9eD/LmHfAJ/jDH80tbXorCXh75NufCk1/3zzKfd9Lq89Xx5JP6fjbv5MYv
	rhpm/GGmI0tqjO
X-Received: by 2002:a17:90b:2649:b0:398:d6e6:4671 with SMTP id
 98e67ed59e1d1-39aee249be6mr12032469a91.25.1788390288724; Wed, 02 Sep 2026
 16:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-sockmap-lookup-tcp-leak-v3-0-b998b3d49d07@rbox.co>
 <CAAVpQUC==6KEBs3XgFjZ536mJ23cbHma8HuiWMu1DRc_=YYOHg@mail.gmail.com> <20260902155216.4fa23444@kernel.org>
In-Reply-To: <20260902155216.4fa23444@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 2 Sep 2026 16:04:36 -0700
X-Gm-Features: AcwNN1UkbVzkWQ8FDXuwY9XPS95VYwqDS1NMCf7kWqvgYjJkEoK_LkIEshdICok
Message-ID: <CAAVpQUAWjBuF1Rgze0Vt_XvkUT=Ajw-F+Kh+s2iHk38c8iAapg@mail.gmail.com>
Subject: Re: [PATCH bpf v3 0/2] bpf: Fix socket leaks around connect(AF_UNSPEC)+listen()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michal Luczaj <mhal@rbox.co>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, Joe Stringer <joe@wand.net.nz>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 3:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 2 Sep 2026 11:58:49 -0700 Kuniyuki Iwashima wrote:
> > > Several BPF socket helpers acquire a socket reference only when
> > > sk_is_refcounted() =3D=3D true, and release it, independently, by
> > > re-evaluating sk_is_refcounted() again at the time the release runs. =
TCP
> > > connect(AF_UNSPEC)+listen() sets SOCK_RCU_FREE on an established sock=
et.
> >
> > Due to several bug reports, we are now inclined to forbid the
> > buggy transformation.
> > https://lore.kernel.org/netdev/CANn89i+px52TtJy3S9=3DuHxGj3s-WueguRo1Z_=
4FxO=3D02KLmwmQ@mail.gmail.com/
>
> Kuniyuki, would you be willing to send a patch to do that?
> Not sure if anyone else is planning to, I wasn't..

Sure, I'll post one like this with s/synchronize_rcu()/-EINVAL/g
https://lore.kernel.org/netdev/20260804015349.2353056-1-kuniyu@google.com/
