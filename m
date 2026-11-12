Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472366;
	b=S5fiaoUkIaE5QpaMRGayx7REyrOwAa09hgjzerY4Cu1TtN0XgOL2w5VwLNWJbw6Skz9U
	 vYVkFUIwsOpMXin24cwmX8zjLLTrQODf8A7ju5VXnCnRZKYqQS9weemwYi23mBAO8Ak7A
	 J6TtcJ/lhHR+o68qZMQXn1Pdl7l+Pih5ONa1LTl7Of4+F5htmeJ+62M549p1QH15H8q/I
	 7nShzMpyjX+PT9eduaf8HDybxzx+rLzAMARYTF0lrpTGozgw8dZESL3Y/78AtzgBbmYmC
	 D+vLo02p1EhF35urGAuMUnysv01ZBTKAZnAvWpUFuA7G9XR5hWGlPybqiogHTA+T2FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
	b=znFu4ObQcbFSKkdcf9XGOYJqWb1DgQNSaxRsBYzM4uLadiNqITRyRhmTPHqQOQjU07tF
	 diw6XqVjgI+4hhlk1mDRpSTJsrVsFMkTLM0baklop3Sg6iIsZqbvSoca/PuuZdaVniXkW
	 DwVDXIC7LUW9bB844WCS7YUuX32ViVxPtR+bFmHEP5pfvjvQgNYD/Trmw0y5qH+EuWDGW
	 dV9oK7GoKnNzyq9nnlGwNuu2HTAHdzUgUJMWjF/K/HY2UEcZyaTBq84PG6d4gKTm+c5xy
	 P+sDOIz+A+pxlUQ1omjOtYucCBSYkxzmlQXZGeOh3yGoMODKXkWX62+zbRx9Wed+e3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjZZzhPX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1116C60A5BD4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1116C60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjZZzhPX
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so4614281a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472364; cv=none;
        d=google.com; s=arc-20260327;
        b=Xv3aEkddiH+cn7nF8p95ccjAm7XzQ30AuY37jw+e4GbBKuv+BLKvPf41oMSMXAIYT2
         0QijQLN9wkiSokplFb6D6NkIr8/iM8RBiumaJr695R7MXjmR2BxV2GLNYOHx284kB4zP
         8HkBhr4WwG1cniJa707asW75HnmFFAYp4yIT72lLfLYkyk0Du6ZMcrXzJ6JUPtaUtRQj
         pKEtjaRSa0PuwmT4V5ug0E/6bKsfvIyg+FaWZbz1cCBHJtUziajXRb1qmUNndxXjQYMu
         yHao/WQg5bZNaxr0XIE3pTF4fTm4Cjfbb31sGoR9QiCgy7dBNsjupZ/nkZ2wwtf4W1Jm
         7VCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        fh=bBjVsmBQvl/vXGAgXzr2Q2NFN2Wt/GTUScDvxEoGnKI=;
        b=peyrZOZGXjGsbVCfhDqAEXYohyCXOjmoAYzz2M8QTduFE5802v9roaarNSQ2apTpbk
         NL/YdUmsnGjbQkKPiDWlowXV7niUwAYMlwjvNDU04Eyy4e9N/5ff9v2NSzwuWHh2yytV
         9S0jBNQ2fss1d/5CncXDoZPTjwL470c/gFGPbLU9kC681RLFZhFyXSqkg7Wf9Io5kG8v
         OXmlouGWfIfh3ymH1dZJTvLo6Ms0/9PKtil6y4XbmdIwKtmBMeTwCZu9t5Zasp6EGt+6
         cvniCXm7XXsSsnlm6FKcKP2PxJlNwP88wHXCqJOCWEXRl2QVuFOrrkmAdR0lETLwZOUG
         hZcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472364; x=1795077164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        b=IjZZzhPXrQb+C82MzXH+yaFZMdw3I1fS6f+ZKPUlu4rKAv7YGY/A4npfbHZ01BDx4/
         vehtR2RomeLqZqfjL08oP+6ImriXxgfvzxYVKbLJ5TeraSk7AGdN2BqZCr8Wfl8Y6rKb
         hLv1UqaQKCKAPrnqdk/3nPwU63dOGY6TlaP1LNzhv3oNk0/OxVEzF2RdbLEzQ5w9cEX4
         CDX3IJKXBPew0T49m9+pPKYVvmv1QcvsMgpSfZrVqfxCa7YIZusZzdVD8FqruquU+RON
         bGCSzVs/dSbZYdxZLgr3yfjig8gMvd2nyMgu+eUgDB2zpv7w8KhcsyyzDz+XmXgXnOt1
         V+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472364; x=1795077164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        b=HNvY3bCS7fWh7eWFu4pVBsLhXHiMIpU6+41weeWQ+6D6V6rOUJnSQOMYuluUY3Ho+5
         xNk4YQM1d8kW5tDP1O3JuUgUwuP9pWxv1lPRP/QqWw1DC/dzAJkbP0lNdTsC6IIefFHo
         9svy3a8ViMwOIDAwvrmKug0+zM0NtjTq3eVIi0mmkg7k8PYo/+4cqo27biJ1XM7jZ/D/
         /tU31k9SmviA0HAXgZ2ZJTEDVBHQ6uFeOOsFqggAw0Yava38z2mi4wYKfxDf+GO2q0/2
         s4fNkA9r0hGKPCFGK/A0HDSvML+h2uE6etOECk4EpchEALzW3V2u9R1OHLY/1KD60zRs
         jl1w==
X-Forwarded-Encrypted: i=1; AL+hErGc44wvdkmAncgBVK+Qqt8Qga2/UQsmv0xf6kqHXl4SMDXjQyRefj5HqThObGjVY3DgJW/CGakPk9jjXf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Duj09SMx+iAN6bdpbku/pNdAYfwYMkgNmb4h/EM/trrzTHUzr
	7vfQ/gl4yjjBGOKxD95j5ClvhMA86NtLMDLKuFLFHBWx+ltO9N6Ugl467xwyVJ6hs3O87RKfpoJ
	E6OxdnoJhx5rtrDhxGSYq8ZNXFkxUHUY=
X-Gm-Gg: AYBFou0NwydDNabGnL+jrpHUFEY7635mWJNWG7iwcaOGLYbi6kHq47wfNS0s2doUFmY
	lmREu+9Tmn9HsZ6TYo/nbdK9PxVK54wvTLAM/ApnftzFwG6thGx0RvO6OyhEUjRh7fOblIQoQGH
	4EDpo+kGvCdt47muv1k0JHi5gvBfavTZkDUykdMGNgqwQupMovCoateM08JeoBELXG70Yc2lOdo
	TzLZeAnp6IVxkQCsj06laPWbNrlhzgxhZ2uhaqYO9CAR+ndCICKv14fWDStcfUHQHR9mZ8XZZ1l
	of5Xjhb1MmzKPxgSYWKVGrfr28GINhpJZzaG3iQU65Ktl0vhkvTxozGyGqovaz/FC67Lg1IcDdT
	oPdrYoR1nfBV4kfk5jvsaZU9Cb8Z4FfHcE+BUeMvzz0SHM08+7GxAg3tdY/3ShBZkNuv4qYE=
X-Received: by 2002:a05:6402:2711:b0:6b7:a357:375b with SMTP id
 4fb4d7f45d1cf-6b7a3573c70mr809364a12.40.1794472364208; Thu, 12 Nov 2026
 00:32:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-2-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-2-bjorn@kernel.org>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 12 Nov 2026 10:32:32 +0200
X-Gm-Features: AclHuK_JmHtMGasdG1MlcgZSR9JInf5KlnPcivwlvNEZTX0IPHWZAk1Q01MwQ2M
Message-ID: <CAHfVqdVYBbs8zu40nEaCDvGVNeXHe2DXh0dGxEcgL3kP8S8_HQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 01/11] net: Get skb fragment addresses through netmem
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
	Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 12:27=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
>
> skb_frag_address() goes through struct page, so a net_iov never has an
> address. Only unreadable memory should lack one: XDP and BPF read
> fragments through this helper, and AF_XDP UMEM will back readable
> net_iovs. netmem_address() also returns NULL, not a bogus pointer, for
> an unmapped highmem page.
Does this mean that skb_frag_address_safe() is practically identical
to skb_frag_address()? I assume highmem page is the only case where
non niov page isn't mapped.
>

>   *
> - * Returns: the address of the data within @frag. The page must already
> - * be mapped.
> + * Returns: the address of the data within @frag, or %NULL if the CPU ca=
nnot
> + * read it.
"CPU cannot read" isn't accurate, I assume that in iouring case the
buffer is mapped to userspace.
>   */
