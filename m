Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794058883;
	b=bg3vp807D/foGyh8wFznC+CjsJYVoPuyYPG080D/N/A+r2dG84mzsR7LQAkQf/bwko/O
	 L9awaM9aUl2lGNWNf+DC59UzUSfoDa1SML0UJhYsrC+2vbbU4IxoBwGDLrQbNmvefUVyX
	 9T3ljM/EGU1CvJk5XZm5Q3SfQgwfBWvigf/ZYWq8U9OeSFp+t0IWq0Y9u4Xfi89NZ5ir+
	 xeffx1iMqspfjjsmrZan8rkuTD3s/HssS1Eo2R0wM/+l7V20rlFYTJbop1Vu1Rpub/MU/
	 bujJP1VF8FDrr765dfUKrWnvCVKEMHHiu596VoJ+YkcXdtZU3Y8Np5vkpQYKum5U8jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gFu9cBDaata/nEmYtOPDFMK1VmLefD8wqznSXlq1hIo=;
	b=cInpi9tsxrWTYGY0kFs0axhJu9mWvIf1xxMgLH4gT4PGFvmlicsYc/CYGGTYfj0E3ShL
	 CgNbeweCEegzLuCGaXZ74mrsiqIVqYqU539uhOFMPBS1Nc89WuJy/cawSJqbwN6kHEqbw
	 ZJSEyBvwOu3FsNOK2IFKx9foijbBmvv8l72XwfKyFEkqVXq1W4d53kgK5h+Khgo70G0uL
	 qVtz7I9ALP9i/WBOeQwvDHKe17ra1+KgZBBDmc3utug0bfVhBa1dbgKss9GalVrGJPQ4O
	 SRWU1PlymCSKS6u2tqX9M6+R/lzXevZaDusgLFBC1GOX9jkt6v5EgLqnIjKh2xFEs6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aZJNMJmC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55042606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55042606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aZJNMJmC
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so2684a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:41:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794058882; cv=none;
        d=google.com; s=arc-20260327;
        b=jUnh8Xa2OUaGDAkc23+Vov05WDVROZYMZe0T6E4cD9klNGcRtcBLyvvnIOMwNJUuFI
         dSu9MpO8VPMjrdlprNS6ghtlDAdJsBn7rgvVyZXYJgSTDdUVAODh/2KIjfkIbhjqNoWT
         oQf712WSWMAEJV1YleqvoIVi7Lf700NXjQxvsN+vAsiqVQCzeZnOrcur872by2+XGPpK
         Ln6IYK/47/OnfU1DWciXz+tpDIg1gpj1YqP1TjwStEKF4kyMuiTDlSEoJUl7d1oTJmvX
         T6xAxPxJAD9pzutQcELKV0wYyuia7yQPKsmqrbBKEmzyqocixAE4bANSge1NHCzh34XT
         zBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gFu9cBDaata/nEmYtOPDFMK1VmLefD8wqznSXlq1hIo=;
        fh=uA7yQY0LRPnZ0XqjElhPE0UBCvK0wdaOitDAPRuOaYw=;
        b=BzsWH7I+diwSMA2MxoX+IrqCZeWgYqxppEzr2E11RWxzVmoCr5qiwli/go/iIgR9tc
         qA5QaBnFBnZD0UT27PIWQ9rm6+HBjCB+RMDlbZDeJSsKbFbANhFGXnow+uZCrknNBxzH
         lrDiag7r4qmVFnir4PZUZz5qxJbVr1cLC3q3cZihDAmDBcjvZon5U7s3I8cxe8y5lVzt
         Qx/bERIgwPrLtErgVqKBZkjXjz+j7LkFO8otgweU9wF1H6bN5DuGkcBTz3FDuDzKvaB2
         Z1qS2dzNf9sBda0XBdXM7R4YH1z4OPNw2jW0rBV8ihbGxPuMyjzJlHFoqRujbprTpLd0
         F7IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794058882; x=1794663682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gFu9cBDaata/nEmYtOPDFMK1VmLefD8wqznSXlq1hIo=;
        b=aZJNMJmC1uD7+9h+uMPoR4Gy4sufzN0oXwQsjMO3vXTfWRiIS6B0sQLdEU8Rkf6Y0U
         s6i1UgfUUfYuu/rPun8rDlckpAUK+XK5uEkgAm/71liHMa66Tj6rhT0QQwqzqeGEVOB1
         l/SqtpR2p80+zsH32rE+pEUb3YqC+5eRlAqJrN/4HyD+fB/jGMuBgm0EYyJD4Zpx1y4Z
         xleKgvLQ173LBntzGlrxPqqu1GfysnrlmsfJD89qW73wr8QmtkwjtWla/64+9ItNp/6R
         WP2rKRrvS+DEAmsqktO8pAFqAcNUdZJOB3ELA69a18Y5CGlTbwIOsaqW+R6sipy4dQpo
         iCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058882; x=1794663682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFu9cBDaata/nEmYtOPDFMK1VmLefD8wqznSXlq1hIo=;
        b=Amz3jWnN189Bwg7T4fV7ZtqCmSIjQqAB8gt9V9Ft2XlKGcW1HvUrd3GfYP/z7vHXdm
         FSb6toHaLH9aVjIBHWVfS4g5apN5I7Ua3LUDtq+q7Sdhs2C0A4nsUCD0WU4PRbOJfQ5I
         WMaMxk4KhVo6pg905xm4YaZTvmflqTWLrz+TnxXkneICLgHfKIs0CloiY5eR9XO/bIQu
         tssCH1G+1L0W5Oq/e7EH26Nkh6mqDbUnMEDBN8GgPP3Q1DWGXk5D/uDdRHcTD2ZlvBGe
         N5Wt08bwS/X7uvoWP0LfJGX7mlY3Lx3eSnZHWrlVWj93bGVpUOzNp4gzImRm11Jxk1sQ
         7T6A==
X-Forwarded-Encrypted: i=1; AL+hErHFj5CxPScRTcQPCkY+J1ug/ll96AAxYg6VSrM6jDEvd7w1N5CyNwdyniNJX1MWghqv4FB9/s8g24XyjzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l0smFMGXrqtE5Ro/7OjqqS6a5YhelU6UPtb0n9cpylVkQiL83
	foK+VtlKJ27nT9h91O9i5vckbHdVo+KQkun26dxjdGrm82JaIaF0HX8tMZogkxT0rZXE7+ehhdG
	lzKcJ2awFvW8jR1zuvgCuPs4ifzd99jv+16J2MM/0
X-Gm-Gg: AYBFou108ZHntuvLFfaU2BlLlMFTO8JcZ9QlsXVwRI4Ivy/wwNjATix/VQuXmn2zdaj
	To2qKbOJfA7t11uFsx0kjpG+2Jnh+Lycp+FxczKnrVdMKKDjpNVx5tFmx/+qmTC5dthlegWvJEN
	AH4yj0y3QJMFp7obk+utEhlgLueSZvp+jZWfAtQe906w/Ng6F/vad2kuRZV/yNTAd9q9XtSfVny
	6bFd3pSl8aSmznpxBeVsFssMbVXO8TS+9+mKjhnnUfPGS3yFvJ/fDiokZO8HULVQchPIbLo2ito
	f2Sn0InjLhNaWIPV/Xj7Hu5V5Hoez0y99JYaYiVbPAmcana61kYGodE2v2xHQN+lBzLlSaU+DJS
	FgJR2nnbdgOcz+NS7aZmNwLXI3kaRnw5e+IdU
X-Received: by 2002:a05:6402:52c5:b0:6b5:70c1:650c with SMTP id
 4fb4d7f45d1cf-6b6fad0aa01mr52745a12.4.1794058880853; Sat, 07 Nov 2026
 05:41:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104042521.3979880-1-almasrymina@google.com>
 <20261104042521.3979880-3-almasrymina@google.com> <auy0aaY0-g32aYi9@devvm16445.scu0.facebook.com>
 <CAHS8izNrM+iaT6OOJVoZdVp00TkNRhFe9ucCVrwaUWL0oQS7Ow@mail.gmail.com> <au5SPWdVCuso8Esq@devvm16445.scu0.facebook.com>
In-Reply-To: <au5SPWdVCuso8Esq@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 7 Nov 2026 05:41:08 -0800
X-Gm-Features: AclHuK8cj889GX7mHOiPklNdo7pHPkUF0C-SJejhfCxDe2De9Vg3dflK0Ya2AKE
Message-ID: <CAHS8izNXwhTybUHk3Zkh-cmp9CXz2m9kXt-NoB2huu5co1rGAg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: prevent mixing frags from different
 memory providers or bindings
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:22=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
>
> On 11/06, Mina Almasry wrote:
> > On Thu, Nov 5, 2026 at 8:59=E2=80=AFAM Stanislav Fomichev <sdf.kernel@g=
mail.com> wrote:
> > > > +static inline void *skb_net_iov_provider(const struct sk_buff *skb=
)
> > > > +{
> > > > +     struct net_iov *niov;
> > > > +
> > >
> > > [..]
> > >
> > > > +     if (!skb_has_net_iovs(skb) || !skb_shinfo(skb)->nr_frags)
> > > > +             return NULL;
> > >
> > > (a few nits/questions)
> > >
> > > Why !skb_has_net_iovs is not enough? (and if !nr_frags is required,
> > > maybe fold it into skb_has_net_iovs?)
> > >
> >
> > Well skb_has_net_iovs only checks skb->unreadable, which is not
> > actually enough. The skb doesn't necessarily have net_iovs if it's
> > unreadable, it technically could be that it has no frags, right?
> >
> > Technically we should never have the edge case where
> > skb->unreadable=3D=3Dtrue && skb_shinfo->nr_frags=3D=3D0, but I don't t=
hink
> > the code is careful about that today, and I don't know that I want to
> > do a global refactor everywhere we remove frags, which skb-> flags
> > need to be updated.
> >
> > but you're right that it can be folded.
>
> Not sure I'm buying that, but happy to look again if you disagree. I thin=
k
> the only way to make an skb unreadable right now is to add at least
> one niov frag? Don't think this is (ever?) gonna change? What does
> and unreadable skb without frags even means?

I have no doubt that we set skb->unreadable correctly when we add an
unreadable frag. I have doubt that we unset it correctly when we
remove the last unreadable frag (or we do it correctly for other skb
flags like pfmemalloc). If you can trust it, my LLM confirmed my
suspicion:

```
  1. skb->pfmemalloc is NEVER cleared (or recomputed) when nr_frags
becomes 0 on an sk_buff=E2=80=94and isn't even propagated in skb_split() /
skb_shift():
      =E2=80=A2 None of ___pskb_trim(), __pskb_pull_tail(), skb_split(),
skb_shift(), skb_condense(), gro_pull_from_frag0(), or
__pskb_trim_head() touch skb->pfmemalloc.
      =E2=80=A2 Why it's fundamentally broken to just clear skb->pfmemalloc=
 =3D
0 on nr_frags =3D=3D 0: Unlike struct xdp_buff (which has a separate
XDP_FLAGS_FRAGS_PF_MEMALLOC flag that BPF helpers clear via
      xdp_buff_clear_frag_pfmemalloc() in filter.c:4441-4444 and
filter.c:12740-12743 when !sinfo->nr_frags), struct sk_buff has a
single sticky skb->pfmemalloc:1 bit shared by both linear skb->head
      (skbuff.c:515-885) and frags[] (skbuff.h:2631-2632). Clearing
skb->pfmemalloc when nr_frags =3D=3D 0 would wrongly clear pfmemalloc when
skb->head itself was allocated from PFMEMALLOC reserves.
  2. skb->unreadable is cleared in some nr_frags -> 0 paths, but still
missed in a few others:
      =E2=80=A2 Unlike pfmemalloc, skb->unreadable only applies to frags[] =
/
frag_list (linear skb->head is always CPU-readable).
      =E2=80=A2 Where we DO clear skb->unreadable when nr_frags =3D=3D 0:
          =E2=80=A2 ___pskb_trim() (skbuff.c:2810-2811): if
(!skb_shinfo(skb)->nr_frags && !skb_has_frag_list(skb))
skb->unreadable =3D 0;
          =E2=80=A2 skb_split_inside_header(), skb_split_no_header(), and
skb_shift() (skbuff.c:4228-4454): cleared by Patch 1/2 in this series.
      =E2=80=A2 Where nr_frags can drop to 0 and skb->unreadable is NOT cle=
ared:
          =E2=80=A2 pskb_carve_inside_nonlinear() (skbuff.c:7139-7167): if
pskb_extract() carves past all frags[] (k =3D=3D 0, e.g., into frag_list),
shinfo->nr_frags =3D 0 on the clone without clearing skb->unreadable (if
          !skb_has_frag_list(skb) or if the remaining frag_list is readable=
).
          =E2=80=A2 __pskb_trim_head() (tcp_output.c:2020): sets
shinfo->nr_frags =3D k without checking !k (in practice tcp_trim_head()
is only called when len < skb->len and skb_headlen(skb) =3D=3D 0, so k > 0
unless a
          frag_list is present).
          =E2=80=A2 skb_try_coalesce() (skbuff.c:6365) and skb_gro_receive(=
)
(gro.c:131): zero from_shinfo->nr_frags =3D 0 when stealing frags
without clearing from->unreadable (benign because from is immediately
freed
          via stolen-head free).
          =E2=80=A2 __pskb_pull_tail() (skbuff.c:2894) and
gro_pull_from_frag0() (gro.c:416): cannot be entered with
skb->unreadable =3D=3D 1 (__pskb_pull_tail() bails on
!skb_frags_readable(skb), and
          skb_gro_reset_offset() requires skb_frag_page(frag0) !=3D NULL).
```

I already have 1 ambitious refactor on list to try to remove
pp_recycle. I think maybe I want to do the nr_frags checks in this
patch rather than do a global cleanup of setting skb flags correctly
so that skb->unread is 100% accurate. WDTY?

--=20
Thanks,
Mina
