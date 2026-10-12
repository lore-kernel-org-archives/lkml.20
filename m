Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E41442FCD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796077; cv=pass; b=ADQMQbiBqzGViFfUfsR5VTA3JwAjwBmMNpqfa1ujop9Iy8BFJDlB6ninWLAdFGQg3DeHWIumRClhWtPVkyudJ1EWSSmswqwJBU/dmt9EPmMAsDYMtADngdw+eSvRigj7qk6SQP5Cqq3UifFKBo+09lXnXITwz78vW5/K+f8N7EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796077; c=relaxed/simple;
	bh=uoYQfe0OtM5hwQLQXZ1/6Jxu7DpcKxEaksYbMdB7Lac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DI1kvNgYkvqgTdIhfuyUqdSCVZNrMInw9XGhyYVUbSjBMh7BEMSgRN3z0Dp48t31EsDR9P5p1XTSmVfEcb/Lhl1TuUqFiFxLEpYgH4Fn1oK6ImS4PhC2kyfRIvVe1bb/4jQyYbYvK/1sWS7QoIwhF8xzBRrXrhogrwEvyOBj1Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4AeciHt; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4AeciHt"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-899b7b55c89so48232b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796076; cv=none;
        d=google.com; s=arc-20260327;
        b=kkFDctokxoidsIYCc5PFsY7TPfsSwBGo+5z42oaFMWzKHNj0dEyL/2RrmzEnvw3+UL
         3BeF7LWUKpYl+6TBDFiXByk5dEmA08ZYi32sRXi8bt+abfjfY1mjn9lj8QdOv15VS18+
         BUQR0sFXXWUYv96P6U9FemNcLbt/DHJW9sV3R90M16e/Srg7xl2yc5Jbk7nWNd3jSZp6
         u3qkRy14OtEir7Q6VA8ZBn5KrPK8voOrGFtWNtpWeO06swwYhRVGYkS1KgQqwvqziIrR
         WzP6nLS0mDkc2ArPf4NjN1Z3aLBVSOb/VMAeiqRQseJaLG6j2ObsBRelLRxqJFDTUa0E
         5dOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWCVh/HhawcXmZOhgfv/ReufMzsWqc2yp7GplBGUnLk=;
        fh=fLVqIg4zVK0FnwgQXd2U+P+6vCR68h9kXoKgSCusapI=;
        b=O/msTXOtjh8Boh5sBm1vib44n0eWjwD5qwzVFSvqCcm+a5N8vibvrcLKzBImBpq/et
         IsulLeuMJIHE36KLDNrBsneJszV0+HxDVeCz5Rh7udzlt33BpaR+IXXLtCaArhnyvRWZ
         sa9pkxYw3+rtH8/Ddw+0I134NHcyqda/y87WfKSUNsKzQnaW0Ruh49kgerP/mWSTTX6p
         rG4xqz623t4EMg7oXl4o5GHtbmY0dD+/yECVCCNIYmy5ZlyQw9me+Cle2W27bXFzFA5Y
         DSkqeIkvQJ+GvZIo6i3V7ZZtvxZnJsfkH2dS/bn9bnHOHpl+f6uZvOJ0gExjFLKuOQHY
         qw+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796076; x=1792400876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWCVh/HhawcXmZOhgfv/ReufMzsWqc2yp7GplBGUnLk=;
        b=J4AeciHtAslMKoCFC1QSz3368wzkWChaHfo7vhcAaOnvM+xWSz3mESJoM6PCGwzJJK
         vABo/RNrM7bztg57rwSz70bLqGw5WU+91mOl7D3xILUZbBIO41lUO5i5yepkZlFCbnND
         qFNdEZNyGXn0p7dq/AeBidUbecXD6jnf0k7M9uj+I+gr8E2E/LJ38uzTeSfA/+sF3uSR
         8vE2r7nAabEKfcUmKeVJsPGlAotUI+i0jIdhrC0QMvQ1ur08wEUq6R+A+95TGCE+dkF9
         pWwrwh6OKuBmpgKgrHhwmKQuiM1Ff5JFLTafRQL9U9ObAuLevDAvFR1E/T8ERmTLB3JZ
         cM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796076; x=1792400876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWCVh/HhawcXmZOhgfv/ReufMzsWqc2yp7GplBGUnLk=;
        b=mWkXa2RHh51Klk+mepvuvnSaAY9tGJqtfReQtpgDHR/npIu6OLSuPM2XtazSsCV6Po
         5+to6m92JqZi2vhLnNe/l6av+fHzSuP9TiprgHciQ+xYYnvBridNmr4VmverpnkjrWrs
         hYo6Ms8JYc0qqGvQD7uJ/3J82Y31tVGAnHBzjWgAs87SqisfWkSmis1FAwHklr+nZm6B
         kpe0KYlUzVcHtI0nUjUPDbV9Sexr3YkG+5BFPrn6P+3/KiEDR7RQ1rC9KgCxX+GGK4+R
         6qgUWDBv6etPpizyIiJJPQWOCBwZzKeqoWFQzGv3SO595Wg04GCOepq+xQhQcRxPbf/t
         TLmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm6Dmz9Jos/MlU8x0W1XCyrtaNCAKzNuI4enE4Y2oYeV4InbvTrwsVU+D94OoXX4o0lrDU15JU2IYYRek=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHKQb1IoPdwvNT034bHsiIy4Shd7HGUVMgKRy3ggZvNCFC+5C2
	YWJCDoJZ1EuQ/c95MrVQaXbHfhvr8dP9buK7w51r3VeCZ8OtZsCC5c2gTJiA5wwpFtb5uEdRplV
	b9aXtmlW9F0i5EPJTh0dHokCAPT3cilg=
X-Gm-Gg: AYBFou2P6cV4vR/oUxucHOI527iefPcrtBnYPSEhT4NjDPVo/69EA9jn5j6PhUiZbf9
	EeyENZ3eugYS3B1DJy2KFP/DdnIzP1oYsUG+v3qZqgkpsdhOhkzWkhdnujULfS0tc6Q2ORn4p6M
	oT1xt4uVNHiqpv1HkiTJDIdTzFtaJVCu1PMG/EBQ5IwHJSu+XWsQYNqQG0HY1rASFtcwMh83U7a
	dN4PIKkQbuKp9Grw4i5y6HuhbSgKGLZGpS7p2QdnyHPlFEdDnvaa459stajum5oLxHFQ/VrpcuP
	OXxR/utfJxB+7MsJhgMX0netCj1Sqji0+dYkIEhaMyuzwPZw5Q5E2eRjB5HCcziuh86ryiVNrqH
	mKVhyhNN/ief2
X-Received: by 2002:a17:903:19e8:b0:2df:8909:f719 with SMTP id
 d9443c01a7336-2e842aa4aaamr121044035ad.3.1791796075785; Mon, 12 Oct 2026
 02:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930090813.73901-1-q.h.hack.winter@gmail.com>
 <20260930090813.73901-2-q.h.hack.winter@gmail.com> <179110850671.434549.2584497019282941556@kernel.org>
 <1791424156.460.8ed76b88c7@gmail.com> <asySLDyakgLAKVdf@secunet.com>
In-Reply-To: <asySLDyakgLAKVdf@secunet.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Mon, 12 Oct 2026 17:07:43 +0800
X-Gm-Features: AclHuK91mSJQpkcAuNKP7lhbEE2Z9AzA85M0in2-CNT68_ZzPsH_JW-C1eG2BpU
Message-ID: <CAH78Gvt0gUELPSeqf348P4-B8E7RH3L3PhFdgVdjfK=WKEpzdQ@mail.gmail.com>
Subject: Re: [PATCH net 1/2] vti: fix tunnel device use-after-free across
 async crypto resumption
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steffen,

Thanks a lot for the guidance, much appreciated.

Your three points make sense. For IPTFS, the skbs freed without the
receive callback are the outer xfrm skbs, and it's only a handful of
places in xfrm_iptfs.c -- a small shared helper would be cleaner than
open-coding it at each site.  The two xfrm_input changes (set family
before the early drop, and hold the skb->dev reference unconditionally)
look straightforward too.

Would you prefer to handle the IPTFS and xfrm_input fixes yourself
(Christian for IPTFS?), or should I send them as part of this series?
Either way is fine with me.

Thanks again,
Qihang

On Mon, Oct 12, 2026 at 3:54=E2=80=AFPM Steffen Klassert
<steffen.klassert@secunet.com> wrote:
>
> On Thu, Oct 08, 2026 at 01:49:16AM +0000, Qihang wrote:
> > All real, and vti6 has the same problems.
> >
> > The dev_hold()/dev_put() idea assumed the callback runs exactly once
> > per skb, which xfrm_input() doesn't guarantee. IPTFS frees the outer
> > skb on its own without any callback.
>
> This is a IPTFS bug. If IPTFS frees the skb, it has to make sure
> to run the whole destruction path including all the callbacks.
>
> > The early drop when the SA is no
> > longer valid happens while family is still AF_UNSPEC, so xfrm_rcv_cb()
> > can't find the afinfo and never calls us.
>
> Assigning family before the early drop should fix this.
>
> > And on the success path I'd
> > drop the last reference before gro_cells_receive() is done with
> > skb->dev.
>
> I think we should unconditionally refcount skb->dev in the
> xfrm input path to fix that for now.
>
