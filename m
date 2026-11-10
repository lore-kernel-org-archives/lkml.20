Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794324709;
	b=UJDyhH6Jw7UY1VSKQR5yeQkuTUYozaQJOgG02sod+JVls/JS4hmR+kdT7Q5+qxufCaWz
	 JnociMU7u007I8MWIoIHJ6+erO+ma2L3r6Fca56BUzcWK2DE/LjsguEarpkiT9UPXnO0w
	 8+IfgkL97/T2YdA4zZcBtkkfjYwuyHw+9HMENS0n76P1vARs670+zvCPdDUgQ0i/BfrZS
	 ZHg4g2ErvFQLuOvFYfyGwOG3tapayS0Bt5vawe8RjK6QLWnKAf3SFN5jYoQ0GY4dvubrB
	 1FNA43UqTt2TakIK4x0l3fm7rp5iG+R7jRl7jk1t2CVn77pDZc9iDxuSlm1f2igeNqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K1/d2NyIuCP6NUn/LZuS44tPxEN2bj+/f16ojUcHMk4=;
	b=F793L0Oe7wPQY46tKs2zL8f/0VunfkHL6hdw6JPqrXMh/5bVq9oiLdpLIAFXSV2l0Zui
	 qZaGZQ+KaXuvhvkHxf9j25pq1aC9k/dkV2qrMpwvgCerw5zKKjd3GVnfLSHRHwJAv/KSc
	 /WKzl2/1jttW2zHIKdmx5rFvsT4CmMYYmFMGMCf6HDwgCz0Z1kT1nu4/DkZGpDAEgM+/q
	 +2Y1xm/LgstKKyP0emGKBApeBVYfoJp97AteFKHaKfucLNke0T3muUE5iWv4Dors+GAr2
	 0Sku9u1hD2hjnM0T35Menaf0E0PT2tL2yc0m7SyF2nGLC/tHamToXFspvAqNeGKNvRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOnALV4R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5760A261B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D5760A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOnALV4R
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2db6408cfso1188798137.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794324708; cv=none;
        d=google.com; s=arc-20260327;
        b=RxNhpKwkqVrN007KKmjMb5NTWmtkNULDVT3hFPOnuxgUGWGE7wwflKIrAAiivy0sHI
         xgMnGsAcMcWJ0i/3gYfXIsgqIlqXqnCqALOWlBPEjJ0uRmTXntaotzJesRi8SjxDBILH
         LCM8DCcuP0z/wWtZeK3AvgbmQCMKOgdNjn6CCL6b04EtKxyOacuw0PrwfoJbq2G++2xP
         RZUvzfeAP95JOZ1F/0ELj7kytyIw30gvvUA0RWiQ7f4PzNL1X9WznYAhwyXniR5En/oA
         pk4+7e+kBClRounU6h/w/gDSKE8XTMyuWMWJ39dLZYPCtZe4mpyWwbuMQwdnVq1TZ9I0
         5aOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K1/d2NyIuCP6NUn/LZuS44tPxEN2bj+/f16ojUcHMk4=;
        fh=6UKKxqgO6aBmkkK4BFZZL2N9U3dEXADBK54E3NAMIp4=;
        b=jbHVd/OM9ydXnoC96ZnjIsm9VX0Qb+1HnCn6z+rGOEMo8LDPIEnjH0M9TaE4Qy5Jc8
         fNOMBsjdHS/3t9GRt1tPU14U+KRvqiO1ectGpX86Cw6C/N5WqjNBZ7gLInjUOqLF1tIv
         oTj1sfeIpOelgGLo0IY1X6C9eJ+gypTICaHlHPQftzJ+JCdX6h1/1iWtOAsIq2tG/8oG
         DB6V0NuwDu0DkEq3z0kndND9jm0Z0zj91X/BECm6d7S5BGEHeQqaxWGX7LvZfFC6Yk2O
         CnObbHm6Hh3MydWR6M+w0tmL0xJY7r5QajAx0dG/s3ATEnQd4esa6rKmdZgZFwx3zcqq
         LvRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794324708; x=1794929508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K1/d2NyIuCP6NUn/LZuS44tPxEN2bj+/f16ojUcHMk4=;
        b=sOnALV4RabTW7TXx7rjmDTNsf5tHHAYmUXJwgfUDq5UM5W3BHjN5iBQXvAvIlZdHDT
         RunsTaxFGOmPsBVI/UWUQRUU61lGTeSOTV7Ls4oDevMfljfbDaejNb2p5o/je/oUzQVN
         ODiTECjiawd9dA5ApJKl1GPG+snrlUdzTJMDx8+vzHyuEIH8h5PdZF+FRvrol+Yj/3gJ
         vRHo4q1oHwQ11AsQGydfRlFpUdIMf33G3Tui7lBp/+FbxkDoWkLiGS2AisC+jeSvVL+J
         uMeijdhrcOXb3WUOVkGaNpFRye90vYvFGNsOPsPzp+zSZMQDurT6HH2hkHYZo/OmfCgj
         omvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324708; x=1794929508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1/d2NyIuCP6NUn/LZuS44tPxEN2bj+/f16ojUcHMk4=;
        b=JNPuNcCx04xx/xM7y46HDoNvxvmk/TxYWJiq2J3ubkp4apKKyfrLrOh7t673V9CUYo
         xpOh3eP5gF9OspP6aBVvAYlpq3mmZE9Q1uzpoJSQIQSQ7QV8BVFDrv/UiMQJhOStvdcn
         Cmbu/qVcV0+LtGirnQlocrUTBRb5pmJV7lpTk1pvSKBzPAnP2tdFDhRv5Z8mRtDjLOXH
         /3PAi30nuw1AM1xEKnQECr9Av9iMRZfWVU4p82TQfZkJTDo/B38V1mG8ERbAZoOrrftJ
         /dXdahDxLnFse7noaQWzEnciQENVzbDLtQ3wAV95+T+fqB7xCRjAJGOj64n38Pr7eg9T
         d2Vg==
X-Forwarded-Encrypted: i=1; AL+hErHmZPKuzHSSnLXiffWuv4aJltWywS9ql/Ug8LLrWqizygf8Dg+xcj6HU1e0i/MWh1wRsznCXfKN/Ve1ZBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8evwB64h4NnebxIJbY9B4Rev03MTHQN1plTGmZo4hi2wueMx3Q
	UnPuQV572iB77tONHZvGw3XHqENS4TzBv74EICevnpoOpbEZf4ZNWLXa7eSL7HPfSFJa9m8P8gP
	oaNCfHNgUykQRQFDhGKa8Teco4NRCJPg=
X-Gm-Gg: AYBFou1W4kXM6rCuymiG5joCItHOKSq+eRzp214L88Zi5LCTJVApaMQgiqNBofWhgW3
	IClMX4b+qZDD+liaWVjW3wuydF5p9etdvnUaMwDNJlqmPnZ0AebHbu/Cm2veT2gGqi6bEEj2e6L
	6cxkuKEFZU/wxpzA46pBjqDaPBFnc41Phy3pJalmRBEcg3MhCaAgLWYeCicGAsnP/LutoD2h9GF
	R+16usnWmWBC947fXCrCTI/Yp9fQKz5WZ/HmXQ1vauCyPVyqj5dDmO1xK5V2eTpG4fdbADH/R06
	licV2mmCrFILtHgPlKmCUfcOXpKwwQ/qKQ5bbLRC6yxtZ8v0rNl3XvmlB3yCOde2sK5UOtx9TmO
	CkSygKRIk0yAI4TAnSOZrl/F5ADolsGDS/bPT7El7ZEOIYhz8PVGCIG3qjbGnT879j9FJknviWW
	fZh0EPYsjqLUEz6X+NE3JOF89LVAAn8QlMhgEu5A==
X-Received: by 2002:a05:6102:1629:b0:7a7:19aa:8a88 with SMTP id
 ada2fe7eead31-7d301c1ac50mr1147212137.35.1794324707817; Tue, 10 Nov 2026
 07:31:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108161149.2774119-1-bestswngs@gmail.com>
In-Reply-To: <20261108161149.2774119-1-bestswngs@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 10 Nov 2026 10:31:35 -0500
X-Gm-Features: AclHuK9iYVUMVhjgMP1YORbw_EmIVcS02-pRhlLXyvezE7vMUFhkCvMgT7r-RmU
Message-ID: <CADvbK_fGfv2k5rB1Q4Q-OwzJicXbKzs1ofW48F2prx6Z15CQZg@mail.gmail.com>
Subject: Re: [PATCH net] sctp: reset stored flag for each association
To: Weiming Shi <bestswngs@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wei Yongjun <yjwei@cn.fujitsu.com>, 
	Michio Honda <micchie@sfc.wide.ad.jp>, YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>, 
	Xiang Mei <xmei5@asu.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 11:12=E2=80=AFAM Weiming Shi <bestswngs@gmail.com> w=
rote:
>
> sctp_send_asconf_del_ip() walks every association on an endpoint. The
> stored flag records that the current association took the single-homed
> deferral path and therefore did not allocate an ASCONF chunk. It is
> currently scoped to the whole function. Once one association sets it,
> later eligible multihomed associations allocate chunks but skip
> sctp_send_asconf(), leaking each chunk and its skb.
>
> Reset stored for every association so only an association taking the
> deferral path skips transmission. In an A/B kmemleak test, the
> vulnerable kernel reported 210 leaked objects from this call path and the
> fixed kernel reported none.
>
> Cc: stable@vger.kernel.org
> Fixes: 8a07eb0a50ae ("sctp: Add ASCONF operation on the single-homed host=
")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>  net/sctp/socket.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index c7b9e325ec1c..ed91ceff45a9 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -771,7 +771,6 @@ static int sctp_send_asconf_del_ip(struct sock       =
       *sk,
>         struct sctp_sockaddr_entry *saddr;
>         int                     i;
>         int                     retval =3D 0;
> -       int                     stored =3D 0;
>
>         chunk =3D NULL;
>         sp =3D sctp_sk(sk);
> @@ -784,6 +783,7 @@ static int sctp_send_asconf_del_ip(struct sock       =
       *sk,
>                  __func__, sk, addrs, addrcnt);
>
>         list_for_each_entry(asoc, &ep->asocs, asocs) {
> +               int stored =3D 0;
>
>                 if (!asoc->peer.asconf_capable)
>                         continue;
> --
> 2.56.0
>

Acked-by: Xin Long <lucien.xin@gmail.com>
