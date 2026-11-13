Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794596072;
	b=jjDxMQkFzW6Ko1Kc0GoJmpDo6172Ks9rzDndYQ2wGy9q7ib3KMjDiFSBgK6o7NM3b9Q5
	 qKHH0Qf51ciIMtPduLarwGGh9g/AOCOCbcW4+nzcC4gyx3SFXWlNQgUwRPEwhJDNP4hzq
	 6PAthitD5PNHfJDOI7WDQhL1nes8+3FXHC4bPP8DPvU4FwN7/WVoS43BAhPAa7x+wkzlA
	 eMdHfdW53wisb3Nz+GiERbcCWtOoohWqCsLzZThVH0gY/y01TeWJG8OMvy+7lpxkGQshT
	 bncLp5lEk9x2lDqGSh37zhEYP56C7dDGG92CrO6HXm+ewIgnZY/488eSumnMFD3MO5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
	b=sNlc0VQ9/3mifLM4yhzeaypd7UiYBTdVAgpP7wta9yEnXOezZdgeWeApUDLQV8KCSMLb
	 qQETEESzVOKBzDBe26Npolz89xrEnWbn0O6GsjHnG4jkQ+YF+wQSr2YMDn2OSUjpSXeJ4
	 XollOgaCp4eoRdmLTiave37uQTD7B4U9nxbiCD0NtiGHSvKsMKiqO8FrpNLso1n2lB4bK
	 ZdQfdgSYK+zVfn/evC3yk+e01RfAFjTact6oE92+5LxyYcKSh8EzX1JjTcwcVxXZ3YsbS
	 ChwOcf7BffE5LJuWcLwgCwux7CNbpQTpHnsssVLkkDh3AfZgd37PpkaMQAtVAOkf0/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eisEEVVM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1274F606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1274F606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eisEEVVM
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso1360a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794596070; cv=none;
        d=google.com; s=arc-20260327;
        b=X+1XBSgrKXc8B41dSYrLm3TYpYMY1l5QmHFqtFOIDDa3Tp4qj6NeEIj995mWkXLlWe
         qukcIQhIDTuyeJsoRj4FdwaWGtHwaBEBrqYuIjAKYdVHwFIK9x5shp/oRXtT32KBK/Vy
         WokMp9cLz8IPuwRGgz1MRpIOWYoU+cpYsfvmtiAnsUb5JW5tgmlCgvU1y0r5c7DHRX4U
         QUmUQlzAswR0nxwVKLwmDEzFr8etCKel7LY0+68KOtP95O6aDu4ZEg7NPvDITbPyRnPr
         j2MS3dqwXpqWHaHM8CZwTV8uich1pL/XkXy6lpO0/n0LjX3GeM+mG5WmDTPDsedTbncS
         KRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        fh=f0bS/96UBYYSemyD1oqmvJpKQA2YxQMs4zl0nFN78XA=;
        b=j4dQsr28PGc59gHdO4M7mkK4oVaxQtK083uqvLjQ4n+BGfB3xSTOl4sYmhfbsNi2w/
         zcGQeiFSAfXmISFUpl5ABcnN0A2WUKuX3crsW2MllTQoS+OrADzGIMze5q/lYDwqNxdv
         8wJ7Mjzp1L/FO05PDE8RdnYtPtwpky66T+JUNov8GbilQKuU/slVBbXrvB06/T8C9BIW
         3O2BgTJAeGXuXmYjMfpH7hVqrEKVA5mXK47KrvoHZ8VJ5K43BXV2fSE8MNNfzxkfWoOQ
         4uy/MaiXOB8jlKtDzbFdg86unIcJuC2NWuvq9vSMvi3egOc9cBVtgsViEjPTOECRg2XO
         q9Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794596070; x=1795200870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        b=eisEEVVM8PCaj/Wxux+iAJmBT1k8bHNU35jNjvPdKn5A1HLZOH5LQ1EY3BcJG6WJSd
         zQJHCca5ZSW272RR8ZqEnxlJfsFyhdrMZusl8QaA4c9HP+xH6avVjT/oc3dDYcv5aBdd
         PX2GBBsx7FbYnffDffV/A8+nFo7zh1u9hueKZ40B79RrQ6sNRvq4xDRAPGyAjZ7E+JEP
         dHQD/L3wxxC2OFdsSm7Io+s1kd8AHRbV0NiLsOq1oDTCRUWH6uhuvzES4DspcfRe/mVS
         XpFUSQpVCuB+A/wp38W4sFKkIzI7LAQear5+guYAQ2EbAMwuzP8+PeaJ1TbqOdpbCAyr
         OtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596070; x=1795200870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        b=lVmadOEPSMq2Kb/mx+1Pj1P7ofidRzxFelH6Rsn1rXQ2UJ/54UNcBgoHaqCVO/x8iX
         UIauKHgIH39xjziQ4tjOoHh+US9m5gOJcH5uLmrB+pzPIh10FP7jlJxRRQP/crk32cic
         O1HF8n40p4VYIi5wguWfNCxfI2hEX4/iNqwI2jl3jLHQeGRAbzeGOq2tkD0aPqMms6RX
         s09leo0Z7XFxlYK5JcL9R4WneBP9y49nvXAm27gXiZ7CuvGTUslPD8WMNSqGix6v5kzx
         ETRQWKKjRniPLRw02R0Mla/uwMRyMVlapeSnp12yjCIFMO/waxS+Sngph4KpVBjq59Bh
         YMbw==
X-Forwarded-Encrypted: i=1; AL+hErEqbTRDNabBjRQ80b5eNNuCkm210ulP/j57NNcUY/uCgEo1kjSKDNhDRbZtfT3mZCJNspr+v3UGZVRPXYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g++UpXmXZyJLHsNRzyze/Q6oeCW+8yyWQPu5gWwKtoNNaK1tD
	yEXNKFO4SDTdoYW9s91IfXJt/3iEVY1sCRikOtTfL7G5t8Yb4eaZKUSOLfHcD+uwYkgNBwBglza
	W3+4ln5s+v+V1TWIc1B/5FUnlOywCbmyAc7CONZk/
X-Gm-Gg: AYBFou0O9rPrhPIT6LMBjQyER50D7FQ9ki4vMOzDqCFiao4/i1iBE5yR1xwghLw8TRi
	r2MJHUkZxcOUR4a/FcJGAXdF/BiQd+6XCstaYnCEIRis3fMrgirzCf9AsU2BVcq7B0b7CKaezlA
	ATKihtgx0IH2He5WrpPVtldCTVKLTa8HvwN+YeVSCgbPmA73vKACSx8MeW8xMRS1NrXA/M6peyF
	xH/WwmaQl+4/H90xopg/rzlR7Ifvv77h6G7ughNYUMB73tV0GI46QWh3z/wwQS2b3edLB0bDusm
	RKdxHkRG+4LA+vkOjP0KS+7cVgDmvZWYalhM6XyPKhgbqmrRMW0i1ccIaTGE3hRs2nRUf4/dsX7
	xTC8i5i02U3wtiBbEqoXaYt0Ry3aGgAp3rG+tZCqHRbs9Grih+83gtjaqHn+czYmXSes=
X-Received: by 2002:a05:6402:a512:20b0:6b5:76b2:5e18 with SMTP id
 4fb4d7f45d1cf-6b7e0367708mr7837a12.2.1794596070008; Fri, 13 Nov 2026 10:54:30
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-4-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-4-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Nov 2026 10:54:18 -0800
X-Gm-Features: AclHuK8hJZjvI7zpL7vkOt-X_2SsoIeZHCGx6Ao6kGKYFChdzs729uK5-y6t5Js
Message-ID: <CAHS8izMhFEMu+v4zAm6VqjU=Lz=vMn58Ft6HKya1L-uNY0hL-A@mail.gmail.com>
Subject: Re: [PATCH net-next v1 03/11] xdp: Copy buffers with restricted lifetime
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> UMEM stays mapped writable in userspace, and it has a fixed number of
> chunks. The stack must not keep its chunks in an skb or an xdp_frame.
> Mark the providers whose buffers the stack may keep with
> MP_CAP_RETAIN, and copy packets of the others on XDP_PASS, on
> conversion to a frame, and on redirects other than XSKMAP.
>

I'm not understanding why that needs special handling. Devmem stays
mapped and writeable and did not need MP_CAP_RETAIN. Also, today the
stack can keep any pp page in the socket's receive queue for arbitrary
time without _RETAIN. I'm espcially confused you're not adding _RETAIN
as a cap to existing providers, but their netmems can be retained.

> The head chunk is writable by userspace, so it cannot hold
> skb_shared_info, and virt_to_netmem() cannot find a net_iov head.
> Drivers pass kernel memory for both to xdp_init_buff_netmem().
>
> A static key keeps the check off while no such page pool exists. A
> frame copy is linear, so a multi-buffer packet of such a provider
> cannot go to a device or CPU map.
>

Did this actually improve perf? I recall that when I benchmarked the
performance improvement, it was questionable.

--=20
Thanks,
Mina
