Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B573F443A84
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390415; cv=pass; b=B44XE2OGNuh/jfyjgkhVj7LFlknXvIAmMr/mTAW/Be0GSGdbE9E4lMAKxZnPOxiotLPAQdz9o7biGPEMsfYKwCqYizTzL9zc3dN0WJyiydfTydmWawkoyEBllUw/+Gw2YmPXgSZUZbQbgKETXRLm0aRlOlJSZkGHKoSNolAkr+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390415; c=relaxed/simple;
	bh=QXO79iuzD6hxpf2i+Z0dPQolgpr8pZk2dfjP1ELM1rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXGKdOzTXflREOTgaCulANEBlTDLdaYQ5Ze6uWw6beuL39ZmGBkZVMwTT5xTBqZDGe4V0aDKj+WBG6g1AR8aEdXmTy1SAa7sUuD+VQNiYcLdyJb6Af7W7VSt+/eBmIRHy86SfSkUqpEAReDKtSDKefjjgCTDL1KNgBx7O1scO4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XitNxZTJ; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XitNxZTJ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1832310a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788390413; cv=none;
        d=google.com; s=arc-20260327;
        b=lejxoozRTo2mLe9f1VUiKHpBsdCZOFRoN/LiGpS20aWwu4c8zLVnnEkh5XsCFvSo2d
         85tv/HkexpjXEyhBdcysllHozezttHctI2BG1BWayaT1nb3sQCqx+GZ++TBPnPEdxPyU
         WpHp73hEfn8VewWPLmapX0OnsHzJcamDd99iM30NMDZrJJKhQ85Gmz74z7FW+mx8M5L2
         4ExCSGbg3aJVxyJY4hcvSwOJOWswavJANl1+k547bUtkUaj3vFmtZ6pt2EUfe4+Ce9jH
         8O42qNAKehHY5ESt/ny0llOKw0Lg9Z/ck5oVgN+RcVKYG5huXRYgu3JPLm24WQwUVrlE
         3cLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXO79iuzD6hxpf2i+Z0dPQolgpr8pZk2dfjP1ELM1rE=;
        fh=8v7hA/SUunpllpT72tzuXQ+ZJYB3eeW1951r4lDwwBo=;
        b=Hd5iKYIlV1vZISTvHIwgf4ExfQELitBNErKMNM9s5aM9vtj6Fp6p+1K78NHudgAlGn
         4zAUG3nH7aq8GB2l1lvckr4t8VeUa47h5lkCNtKI8TJz1mcKAMryYKNrrCMjJAU5rFto
         s8wM6+/oqu+lj3SGmSsNlhWAtDCkpDlELvcn4Mkajt2iHLsBQnGYNe7O6qPA1luggur9
         C4p4zBGdD6sjjXXKqLrpN+b374UeoPTRaR19cQvUZX4f3Vz8W9MqHmPjyToTril4Jr2t
         uQbpyMah/kOp85CI/mVI38xEIYYUr/pX4X0txhAlgGbyp0VP0lTNQb1+aLZnCCf0xpQ9
         TTGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788390413; x=1788995213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXO79iuzD6hxpf2i+Z0dPQolgpr8pZk2dfjP1ELM1rE=;
        b=XitNxZTJ09uvzoUwOzTftYhHODsEy6nLHo46uZbaIONoDW/z8eo5dJmoVuw1Wv7VXO
         JikoTn+0Xwwed0w9GgbXl4YipeoTlB/mZ2IFYGbPqgUpBzNWpJUweZOjWQ7pWus8rq+c
         YQYn2ltbPZkQ7wR6P4A8F7Q2NLAuRmhwJrTm+d4xmC1EEenqOld9yaxGOFmO3f5SmLjI
         52L08G1/pdooVZ++CucMGIj3vUHptDpZUHKyxPPs3c76/7EfmMNRmEY5iqkmg3PAN5xn
         ybPJD/DwG9Bb+2QxC151wb7nOiq/jZMivMW4/VmpxbV6Ls1GxjhuFowL4jTxG7hLxhVr
         yD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390413; x=1788995213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXO79iuzD6hxpf2i+Z0dPQolgpr8pZk2dfjP1ELM1rE=;
        b=ga+R4p78KypsYIs59ALPocRVp6LNUPxt55jGbfaLm055+NPBpU8Ldzz9ULNuBTKyba
         vXaEqdEoYHeP7ZqXVUaICHoPIYBReFsMI3zr4Yo6HOc4ftUgfJu06Eqlobz+Y7aO0RE7
         pJVSaOiT7SOLORL2e29MAifmU25FgOPVUYn/bBmuU/BsHl7QK3frOlyzG7q2OcopnI0r
         3b+J7+zKq4wR5XqI93jWiqmpwoFGmErdMg0Uz18/CgTzIrWUqfCOlKInEbq5v2GLtmqS
         Ek3aQrc1+/QVisp9j0eqZJd2RdA876Hubp8foIcbXI0ANrBN0QQgTsCFNi6a3HnZFc+a
         /NZw==
X-Forwarded-Encrypted: i=1; AKwUvBwSFnxp6tsU7BIDtoalOqlM6qUW9Ij+OuGg26wj5KfeG+LhOsP6J+j1YgvBXoVEavU7LE617okOsebGa04=@vger.kernel.org
X-Gm-Message-State: AFuF++mQrUUVIboIvjoJM5FIq2BTfiGO1Fk6dHIH+kSk4gtfUBkOxtDw
	VZAbn9pjPeTj9id+PtWhfWsCzX3J5ckXzO1mdhkG/bfIQNiSFp+dCaxRCQsGeD28y+OqRn6O0x0
	VlE0aQzrQlc1riBTmRQpprnjpUM83UeKUsvh0Y/xL
X-Gm-Gg: AYBFou1F4Pq2ve5fHEekY0EWYcyBIyRMdcfGq5XNpZUJpB2Zg/8uttMlizTGULyL5Cn
	3jHP02f/Fb2fBkea6LS2vHZRMWI7QOSv5E9cytmfyx8+7Mm3e+w3ndZVVscZjbzfBWodgxKdfoR
	z3yLiTuS47Vc3ZfD7mnMaNUBxeD6sdeN2jZwiMj9ZJ0TlqKC/wMrE4HHyMyFAbgDO5eALdv0Dbw
	hjh9MLiwZ6IP1SVziS7FFzcYIPkyv4qVcpGAIeuWzlj3dTWBkVuM/MCiqW3Cztu6dfDT+/qarEM
	wBnZk6LZzIDskmY5GcOcFebWO7JXvUPojLP/4j7/S5bpkLCPHqzFDcoPR+bXtwxSgbKZhOlP82H
	v48HloqrlE2oKhsY00D7sEKWvsfLkX49em+DlXUNG0NvlxfYxx9ljXpnT+EGXTbmUC5SnDfdQqR
	dKM3BhE8oMx6I5EWF/HeG/Q68=
X-Received: by 2002:a17:90a:e7c9:b0:398:9bd4:d12 with SMTP id
 98e67ed59e1d1-39aee219f45mr11238909a91.17.1788390412505; Wed, 02 Sep 2026
 16:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-sockmap-lookup-tcp-leak-v3-0-b998b3d49d07@rbox.co>
 <CAAVpQUC==6KEBs3XgFjZ536mJ23cbHma8HuiWMu1DRc_=YYOHg@mail.gmail.com>
 <20260902155216.4fa23444@kernel.org> <CAAVpQUAWjBuF1Rgze0Vt_XvkUT=Ajw-F+Kh+s2iHk38c8iAapg@mail.gmail.com>
In-Reply-To: <CAAVpQUAWjBuF1Rgze0Vt_XvkUT=Ajw-F+Kh+s2iHk38c8iAapg@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 2 Sep 2026 16:06:39 -0700
X-Gm-Features: AcwNN1WMA28CGWvKALBaFm1vrr9aTSS6G_YD085NjQpsHnEJcUtVs3PqmfzqfQ4
Message-ID: <CAAVpQUATOCCc0N1jnfy2+tkD_zj1su-a-4+bV6qXOSzR7y_iQQ@mail.gmail.com>
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

On Wed, Sep 2, 2026 at 4:04=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.com=
> wrote:
>
> On Wed, Sep 2, 2026 at 3:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
> >
> > On Wed, 2 Sep 2026 11:58:49 -0700 Kuniyuki Iwashima wrote:
> > > > Several BPF socket helpers acquire a socket reference only when
> > > > sk_is_refcounted() =3D=3D true, and release it, independently, by
> > > > re-evaluating sk_is_refcounted() again at the time the release runs=
. TCP
> > > > connect(AF_UNSPEC)+listen() sets SOCK_RCU_FREE on an established so=
cket.
> > >
> > > Due to several bug reports, we are now inclined to forbid the
> > > buggy transformation.
> > > https://lore.kernel.org/netdev/CANn89i+px52TtJy3S9=3DuHxGj3s-WueguRo1=
Z_4FxO=3D02KLmwmQ@mail.gmail.com/
> >
> > Kuniyuki, would you be willing to send a patch to do that?
> > Not sure if anyone else is planning to, I wasn't..
>
> Sure, I'll post one like this with s/synchronize_rcu()/-EINVAL/g
> https://lore.kernel.org/netdev/20260804015349.2353056-1-kuniyu@google.com=
/

and cover IPV6_ADDRFORM.
