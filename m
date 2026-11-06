Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793993709;
	b=4eVj67AUv2CivIRVTGgJDGo7iajZgRGAhIteQCigN3I2wl4LqOaEwq/nEim+jpZFngJi
	 cobqKYgYdBpgWrF3Lz1CqOF0/rqXzUQ8BNGkZKOG1EhZRC0kL39jaRa8G81eG9Yjyt7/c
	 F3A1Rs5UB14UuaJoCgle5okhkulridU50Bbr/kVcqbtewG+oAyISrsk0qLwd0GszHJIHi
	 geLW0ahq+Qzyl7ur4GDN2kTzCJbPfJVj9iiA3z5Mje6oCeQFXV0nszbUTE80yT7LrooZ+
	 Cw/54/z20cQYTjZIPHQVFda9q+EOkX0dDtIwsVMQyZtygD5XN3qhAwgM/aEX+WNuCEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q7vyGlLnuMLmDSPrNx6rB+c9l956aiB/10KTU6MI1Js=;
	b=2KScLMu0lIhhWKNRWzS0ZIqtdxEg4jqacSj/YI0s+thisqsXqAcmN3yy8E8tPio+up2y
	 8g8MEAmxzyYUO0k0+L6w6fxxFxF5Q7s0ZO6FKo3VTc6wbVuIECqBU8zX8VWj+60IpGKOC
	 /XszNMrW4IHU3YUQ7jayXZ4LWL2zQQTuHj73NKGK4SWx+craKm7Op+lOWhkukVvYWjvdk
	 BhhM27kOu6wz56d2kHUqv1+rh0jy8VpS9ceTkLuQ+0ChUqU7OHmJNJLfeUZv/7F2q9ry0
	 Kucl8U4MrFBlrh9QLJpO7CYZlLQXyWzYnsCyNu8U+x8Znm2OlhnL94ub48nStCui7jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="I/tRShSy";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D700A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I/tRShSy
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso332a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:35:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793993707; cv=none;
        d=google.com; s=arc-20260327;
        b=JIaI1zecyl49GmBTheDAQ3/0HXXbp0ZAZmyCvD1wse9n9gvWTbNaphEsO+ib4sx5Jb
         9T/yQHDC4WeWzuOpqac5JDZB3hH44Mfz/rg1PvxtM3+PQIl17QrwmaRe6Yw5XSrpX8F4
         CzbALKka8tdQwTeXEJyrJUKZRoasRuDuQUt07dYMAYruwF1oz1R7Hr08liMJ9MxmkGq4
         Ur1/67ONZvxSkvvY6S6rAPs+0NgPP3egcsg402P+Kqkd/8aZsybpARY15W9VxsQ+0Nvd
         4kmq5ZJ6F3UoT4ZbqBBX0VvU9R5fH5Ib4WKttGUsTIrQtfn89qMYtqN9zkqJcKcXBmgF
         4x6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q7vyGlLnuMLmDSPrNx6rB+c9l956aiB/10KTU6MI1Js=;
        fh=OIreoyurOz3XNVvr3VBmrgA6YFxSBiOFdjg+JMlDqqw=;
        b=pwyGuBc4fR3eSEtjj9YKb6fc2sS+cnzpQyT71SfAhPbP3jBqg8Vk0wpq92FWfSb53H
         IhGN55zq01r4LiTQw65U8xgh+gnLOTRECclFd6VMFq/71K2QByLg4t0H6MVPP+IIZj1h
         qrZZHrxRY/SVH/kpt+N1r+vDY5n/UDgMLtpWm9PjIh7QxfJB4JAEWLmxG+SW2orSYKqh
         8OZ/zTAPpBbUeisGWtYrhkIQ4rRvjRjEpHcvXBouW5+cdbpIUn+MdGUBNAieCgBM8Nuv
         Rt5o8WXZ4nk1RBeSyZpT3YSg/crY7xhJ3PXbtFE3ULMgTYnFq2Akpy2zKNdHi+5o5z5b
         vlTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993707; x=1794598507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q7vyGlLnuMLmDSPrNx6rB+c9l956aiB/10KTU6MI1Js=;
        b=I/tRShSyPFMarF8NTFFwcT9jKuVSd5Ix/iO9ZoKiRlGYgaAGtvcTJaqF2+vyUFCnGh
         hjCB26ZqbAliOhn96qnvIFzTzM3aPncPrcyRgkniS2LkVC9Ir6PNTgONm5iB+jgwPWWS
         xZA59D8oSEHJ+dtkqPDbmDHqBcFymceCQKtkBaaFrwP/Ziu24SQU7DzUCm73S91e81R/
         STLOmGu/jXo4W7rTdN0wdOjEoBwJyZBvwaLvhPE/jYWVszePwRJPzmSSxhc1kFDxEpsP
         WavjYGRUKrO//5G0Rzctjs/aQfdS/EBvP06EnzzhimgOa+GIjRFn7D29kwdOr+06+rTR
         U4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993707; x=1794598507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7vyGlLnuMLmDSPrNx6rB+c9l956aiB/10KTU6MI1Js=;
        b=XlZQYbA7pWThIa8zSp31vI098sfG74AR1sJHRszo+LV6rJlY0nODme7ug3Md5xeO5a
         kePwi8j2WtPtIZ87Bg2DiXHt4yIHJIoMa8TXzLIsuYNB/gGAKla4fXouGyMzWnr/zjI+
         Hb8LNaipkubxqpJKkkDlaToNaSmHYLnI5l0M+A86WNbYOXDi5qjEp6uLGNfp6DxXswmN
         W5Sqw83atOP6qg+W2xWfv6lR1zI+JujDiYPD0TvFK0mm9SJoOwRz1eYvCeaEFJNXltct
         iRvstbbG4W8m7l72tRABVecnLGvgvZr+q2XxoH2IA2E3xj3sUqccciI4PB26KLTxETh6
         hvAA==
X-Forwarded-Encrypted: i=1; AL+hErETZfGaIyQumDOy/dHItaQ6vLcBS3nvPufkzKoDCwzeCVBXzbffM44wovlb9nCGCs5PMPM//iitcOifZgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Svp4dVFj4Ph4r4jk36sEv4iXPfnMw+ph7pRp/rl6na+u6Q19b
	yxr1JbhHHIlbCpfO9zt9/DxqcslrtsfV3R5uXGIVWsjdcBvEEyuWYCf9sb6evC92lv6PZ3TebMq
	7JeafBsPpTVpRGS7G693rjKMx16V9bQKfRByOBkeb
X-Gm-Gg: AYBFou3HRcb2v1O1djVivhjQvE43L/2AMY17SgLedw6R5X5r0lcLf84CRtzw5CVcy3B
	06mI/JrzVTXv0C7bfCT59PseI+FdVaDhI+G+d5OtWQAuHXknTXidC7FMNmJkrIbGsVasNGu4bQ2
	ewR0ybe17rxVp1Aqcmv3oNHllSAGlZLXpeIr7Bvnqk2K3ZKwS/6OAyXUmlVLq70VR6AZKzFlbXI
	TG2bnM7UmOgPznUlDer8PVOX/s3NXuWhPWQXCue7AvnXcFfxceQ66x/9xn+MBjsG3AVbfUK+8yt
	Z4awucdyojaeGLUBB7COX7x0UqF6uHEN5yBCnZznmHcF0QxanrWY8Bz/wBqtzIo18iWlHmJ/0Fd
	GaEzNCXR56PN43/HN01aqEdCxKlOzwGA7JZlK0HLpH7E3Xw1E6M5j2OR33SSmD8jHS8Q=
X-Received: by 2002:a05:6402:46cd:b0:6ac:84a2:bdc7 with SMTP id
 4fb4d7f45d1cf-6b6f841f217mr14162a12.15.1793993706782; Fri, 06 Nov 2026
 11:35:06 -0800 (PST)
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
In-Reply-To: <auy0aaY0-g32aYi9@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 6 Nov 2026 11:34:55 -0800
X-Gm-Features: AclHuK-YimmJxq_bYeOqoiBBY5YBRIbp3NSf1WfsmyuyA1JhOh5RN6kl5UkSXgw
Message-ID: <CAHS8izNrM+iaT6OOJVoZdVp00TkNRhFe9ucCVrwaUWL0oQS7Ow@mail.gmail.com>
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

On Thu, Nov 5, 2026 at 8:59=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
> > +static inline void *skb_net_iov_provider(const struct sk_buff *skb)
> > +{
> > +     struct net_iov *niov;
> > +
>
> [..]
>
> > +     if (!skb_has_net_iovs(skb) || !skb_shinfo(skb)->nr_frags)
> > +             return NULL;
>
> (a few nits/questions)
>
> Why !skb_has_net_iovs is not enough? (and if !nr_frags is required,
> maybe fold it into skb_has_net_iovs?)
>

Well skb_has_net_iovs only checks skb->unreadable, which is not
actually enough. The skb doesn't necessarily have net_iovs if it's
unreadable, it technically could be that it has no frags, right?

Technically we should never have the edge case where
skb->unreadable=3D=3Dtrue && skb_shinfo->nr_frags=3D=3D0, but I don't think
the code is careful about that today, and I don't know that I want to
do a global refactor everywhere we remove frags, which skb-> flags
need to be updated.

but you're right that it can be folded.

> > +
> > +     niov =3D skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
> > +     if (!niov)
> > +             return NULL;
> > +
> > +     if (net_is_devmem_iov(niov))
> > +             return net_iov_owner(niov);
> > +
> > +     return niov->desc.pp;
> > +}
> > +
> > +/* Return true if the memory providers of @skb1 and @skb2 are compatib=
le
> > + * for coalescing. For any struct page-backed provider (the buddy allo=
cator
> > + * or a future provider handing out struct pages), coalescing is assum=
ed
> > + * feasible. For net_iov-backed providers, the provider instance point=
er
> > + * must match.
> > + */
> > +static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
> > +                                        const struct sk_buff *skb2)
> > +{
> > +     void *prov1, *prov2;
> > +
>
> [..]
>
> > +     if ((!skb1->len && !skb_shinfo(skb1)->nr_frags &&
> > +          !skb_has_net_iovs(skb1)) ||
> > +         (!skb2->len && !skb_shinfo(skb2)->nr_frags &&
> > +          !skb_has_net_iovs(skb2)))
> > +             return true;
>
> This deserves an explanation or a comment?
>

This... doesn't make sense. It guards against coalescing empty skbs.
Too defensive. I'll remove it. Thanks for catching!

> > +
> > +     if (skb_has_net_iovs(skb1) !=3D skb_has_net_iovs(skb2))
> > +             return false;
> > +
>
> [..]
>
> > +     if (!skb_has_net_iovs(skb1))
> > +             return true;
>
> This also seems extra? The bottom prov1 =3D=3D prov2 covers this?
>

This is a ninja optimization to reduce the number of cachelines being
loaded.  getting prov2 requires loading
skb_shinfo(skb2)->frags[0]->blablah, which is not loaded yet. So we
check whether skb1 has a mem-provider that we want to check against
first. I'll add a comment and/or see if I can make this prettier.


> > +static inline struct net_devmem_dmabuf_binding *
> > +net_devmem_skb_binding(const struct sk_buff *skb)
> > +{
> > +     struct net_iov *niov;
> > +
>
> [..]
>
> > +     if (!skb_has_net_iovs(skb) || !skb_shinfo(skb)->nr_frags)
> > +             return NULL;
>
> Same question here about 'why !nr_frags' is needed. Can we simplify
> (or cover this in !skb_has_net_iovs)

Yep, I think so. Thanks for the review!

--=20
Thanks,
Mina
