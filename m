Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E4175A85
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571242; cv=pass; b=lOkAytgF0JGqvNyiuwMFoX9FMhkd5VIihwv/wLR2ErTqM4aIgLUR1h2ZHBXuL99LHmz5xiq8AHNiTGuPjGcFOQQn7CItYjVWqNG3TSldgzfmxkFPDvjCg6U8+9XxOq9S+SsxogViE+Hmk01SEz7hjSr3Whz7EdE9nyvHib2xIPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571242; c=relaxed/simple;
	bh=P/Hbu0V5Vc4QgElq6BDPyNbu7w0tz8nmjZRMAFRdhVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+u2wxwnmBz8747dCJYledURqldv8JhQKCYR+VODp34q9NUEIkG5SeLq4ndpTimfyN7z/aDzGMsODQu832AIPBZdWcC+mk1L5u2jir1fRfQPxoM3DwMAZLrQbkA8x4q4EaqtHFxAgX16RLUsxYvn8MFz41kd2TRtZd1oMmiBJSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfEhKl0I; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfEhKl0I"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1337559a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788571240; cv=none;
        d=google.com; s=arc-20260327;
        b=kD1uYdGH/DAhpY6ym+rXsIFvvkXRLWkRy8OYl3OrGDlaGOTMpiS8NeIv2hKFsYRm3z
         rypKan0xX0pprQIJ3dyMGmqNsom3mf5YJwa2wSA6qiMYQ91BU3S8rLYPHWdvxSXyv+Vn
         r0k8r0INGmsNVd27eauYVY1ruY0N2/KmUD7Z6vrNDElbh1Sph11vM8cNAjfheWl44CvK
         QmsuXTM7U4qTha3uQm+W341qn+8oYuJ9OI7O+gvvAEo66jatuGnHZyni4it01bhqi5dT
         CDzxTwfxroH9SmA8GuXrHi3fZL0KesqQ9iPuYhE5ghT2xr5tGU7p7xO2cIsqReIIE+fr
         qFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P/Hbu0V5Vc4QgElq6BDPyNbu7w0tz8nmjZRMAFRdhVQ=;
        fh=NwR0NWGCcZtf51rsFqsY8JVPMdcFfVkQFaYXgrdWtwQ=;
        b=iCRKVvGkcgqUpowaQ36pu6KN23prSSwtbGgCdXCNIyJJdnxaB9AL2Sgf8cUVo9F1nz
         CnsdoVxKy443SnSyyXATiAzr1yq6dfut5QQerbjUUspKUBt1ZDZW8o21/SZrdtN7sfkC
         TvudRoSTV9wLr0Q/FAC44/VZe4I5a+VeRO/AAloavl+N2AH81tLZCTf05RoyaqzK3WxX
         YTLUqQ/7sl51jE7WnGWg3EQl9PlaA4yQfjQkEh58P6mBzuZwaU0kBthSAx7xEb25Py5J
         U3MUv7BwD7qCjQYTJxgMD7MLr+yn/ULhR4GysJgOZSDH3t2n6OkbSl5tqEfJZ23b7qoZ
         Hx9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788571240; x=1789176040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/Hbu0V5Vc4QgElq6BDPyNbu7w0tz8nmjZRMAFRdhVQ=;
        b=gfEhKl0It9NqgR3w8+wejPtXZN9sOx1oMaFRAYr2TmIgv9zIWWQ0zlN8C9Y+ji8YT/
         xqN3aUaYFp0UwVxtWZ9IqWdp9ADMLkdqiR77ZyZnoxvn6OxkCiBHx50KtjSRIeTYpyeh
         gCSOi2IWF50ArN+eYejmr2Y+bbcfauLDFpOptdZndGV6tSCNETtVadfRiDpUNUzYDiP1
         tB11vRwZrrV6B+t0Ks52C8lzxwaN05WvOhTTkdXcTg1UnS1KV0PhTo6lO+QWPLn+fTw4
         G9xJIvPDgs8P1/DwNdoSjS7Pza6QcQRzaYk0ZYdKrJRVsGiNE5XLpJTCT/qxbz0nD9kG
         kx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571240; x=1789176040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/Hbu0V5Vc4QgElq6BDPyNbu7w0tz8nmjZRMAFRdhVQ=;
        b=jCU+Ct5nAFwpOKHEJj9jQcmQgGA7iV7IQ8ZYSiZggfxPz3jxK2jM+8KkYlfwUiu605
         umiHfFL5t0XDoffuHGe0e2dxuIjVX25AtdIiMd9U4h0NgrFRC5ISUjqQn/7nxyIeOkES
         WPAraMgVjO6ykCiHWkp8PjNYBGbVFHybHFy0WAGz4qRiCRffxGUJxeK6eGfLchR8xuqR
         FrMgorGKZjLJOWIe0B3an2+skh5jCQh8DcaqntGpBX/IaRs3DTb+Mx1uillbQVdmkw7s
         K4cBGWMB42nV4HbBeLMHsVlwTUbdr2dTFiyjxuoBROaRoQ7pLJjPOLeOVYPtobE0Z8DN
         KNaA==
X-Forwarded-Encrypted: i=1; AKwUvBxckm4uuTfpWgV13I0qwujomIoEd0h7dxc/Gk2dbBY29v7yP+RvdOLafI6eBB5WxBc9LcJuA6pew5DKRzk=@vger.kernel.org
X-Gm-Message-State: AFuF++kG2cEHfCBUXnv6RqMg9UF3Ty49XLvv752Md6JU3hC4rccJ1cb8
	jGXaKtmQSK9A2FEc/qvv3HFYIxLqDyzSnERSDJe8vtAWpz9lerNFFbI5P+Bc/xb0HBg84XJPP1f
	AFAhPPzPXxNyyhB9qss7pXr8AWuNffhw=
X-Gm-Gg: AYBFou3qh0M0EZiXo3eF64p9OaVvMu1pn0OCZ5WHnULFQ3DdoXlBS/0owyzjauzEuxD
	PYk+CFb1Nv2v1mR/sE/uQul7Ud8Fq2R/SqNPEPn0bVUkdPPv/Cq+4I+PA09uam6gSmbYoNlqKcn
	hQB0hybsZosYrjxnIK9mbnrGNXmhjdfbYgovtcK4J8hxYmqGBLMkIJYXAOdyFGHVCWUxzuD+dxE
	J7opzJ+BwqmYtrlWJuwofgErQPRRkGVAUpUf4BmwyawxY246KrVg57Y33g68nPWL5e3nf6EVVTP
	jYWWqmHktLpoUcbGJBb7ztm9EG7ozbkJ4gMtoflP+8PbggENUah4HgJa2bMJ9kWC7C7SfpHUsE5
	tLSb4e0HH3dFsQsWGzs5cWoMejXDr
X-Received: by 2002:a05:6a20:9f92:b0:3d0:ba81:79b1 with SMTP id
 adf61e73a8af0-3da3980a0f4mr14688710637.0.1788571240105; Fri, 04 Sep 2026
 18:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-sockmap-lookup-tcp-leak-v3-0-b998b3d49d07@rbox.co>
 <CAAVpQUC==6KEBs3XgFjZ536mJ23cbHma8HuiWMu1DRc_=YYOHg@mail.gmail.com>
 <20260902155216.4fa23444@kernel.org> <CAAVpQUAWjBuF1Rgze0Vt_XvkUT=Ajw-F+Kh+s2iHk38c8iAapg@mail.gmail.com>
 <CAAVpQUATOCCc0N1jnfy2+tkD_zj1su-a-4+bV6qXOSzR7y_iQQ@mail.gmail.com>
In-Reply-To: <CAAVpQUATOCCc0N1jnfy2+tkD_zj1su-a-4+bV6qXOSzR7y_iQQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 4 Sep 2026 18:20:28 -0700
X-Gm-Features: AcwNN1UINzK3524FpZxXYWs5I9-HPFyb-jm4MKb0Vr_8_U4tRNTF9_M_llHPnxY
Message-ID: <CAADnVQKi0yji3iEepgwy6c9cXWhzJqGJ9-gg-7NXJc5Jj+bVeA@mail.gmail.com>
Subject: Re: [PATCH bpf v3 0/2] bpf: Fix socket leaks around connect(AF_UNSPEC)+listen()
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Michal Luczaj <mhal@rbox.co>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, Joe Stringer <joe@wand.net.nz>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, bpf <bpf@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	netfilter-devel <netfilter-devel@vger.kernel.org>, coreteam@netfilter.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 4:06=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.com=
> wrote:
>
> On Wed, Sep 2, 2026 at 4:04=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.c=
om> wrote:
> >
> > On Wed, Sep 2, 2026 at 3:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> > >
> > > On Wed, 2 Sep 2026 11:58:49 -0700 Kuniyuki Iwashima wrote:
> > > > > Several BPF socket helpers acquire a socket reference only when
> > > > > sk_is_refcounted() =3D=3D true, and release it, independently, by
> > > > > re-evaluating sk_is_refcounted() again at the time the release ru=
ns. TCP
> > > > > connect(AF_UNSPEC)+listen() sets SOCK_RCU_FREE on an established =
socket.
> > > >
> > > > Due to several bug reports, we are now inclined to forbid the
> > > > buggy transformation.
> > > > https://lore.kernel.org/netdev/CANn89i+px52TtJy3S9=3DuHxGj3s-WueguR=
o1Z_4FxO=3D02KLmwmQ@mail.gmail.com/
> > >
> > > Kuniyuki, would you be willing to send a patch to do that?
> > > Not sure if anyone else is planning to, I wasn't..
> >
> > Sure, I'll post one like this with s/synchronize_rcu()/-EINVAL/g
> > https://lore.kernel.org/netdev/20260804015349.2353056-1-kuniyu@google.c=
om/
>
> and cover IPV6_ADDRFORM.

sounds like the fixes in this patch set won't be needed,
so I tossed them out of patchwork.
