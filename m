Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598046;
	b=fUHxfWx54fOdVlpCgNIS3/MquS+vZRZ7DJ/oWQ7B8/kcmicJDfWHMl0cx0gL85TsUUGZ
	 nrkrgXF1LWlodq4n5DU2VbQGRZlH8CtgTIy6GmTCwzXULEYZRQcUMfKty5HEK9X/d13lq
	 Ei4SoocclIfJPObpUcty8Gsrv5/2OyfXxREi57BW0Zoe2pXYhvHjxMBHYZ3Q/mZRxTFYW
	 3pTxVTHkpZOgMW0nvPcYRV/G27yXa7SZkCc1qhJ4u56h9mLoBuFG5ZE6UQVxh27GdaUrn
	 q+yvv8EXt/wSw67cq1EaWTvJyg5QR5Tex9QA6fNKQocuojNOcCq4yA58S9bVJENgiKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
	b=xt2PnKYmk3bFlCiz6PXA3hfcqIoDzwgTgNmgGs1/M0rrOq+L6uQLHG1URyBKvSkg7sci
	 DGe4L5w6AFUaqf2vBaZz+ZEtBR1CSONT5smIlOMLQu4oacVFJdRyCIrLU3AMx0ukMj1g0
	 bLnn2y9VcACnf2fBxCLfKJPai50eRAbAhszIPwrN9PtvWjWhkuO7kbq4SP9rSs9gv30Lt
	 l4Dzuu2iSVjKy9yEap3H/fqt1h7BxLLKqb0BWfusoi/q7TB0dYDNorbXHU18wxD1c8wxZ
	 WLqiQ02iKZcnf57efMRtWgUnwLrYUT89OEM6YaCgEKcPU7cAnR/4Gb5ftfCoJOpd8xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gL8jZDdW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F435606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F435606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gL8jZDdW
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1169a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794598044; cv=none;
        d=google.com; s=arc-20260327;
        b=M2QrenSblRH3khm3+1PHnfcWuluHp95wsfSVtRONRDJ+Jva0fhJVzbBYa3+PfgDis9
         dZF174aR9ApWW89apsDAwLCTsMtq/2wXS4DvkHlRM96AcljAVv88OeodrsyQ7I4adMNA
         SejfHAhFCCiROOcyu81IOkW4a66U+6X7dgqo4sIb8FyeITwBQXQv4h7THB8rVBMoyeql
         LpaYPoNbN0zi1iGmaYfpImrz8ZCkJK9FTpUomfVqZ4dvSfOx/GvzptIqFgFBlLLlUqj0
         t1VS4PpmRZS01pP8dsNTOlNy2UFcYiowCSYXqG9wdnTTZLIc9a8TXXU4stuJ+RpSXhEa
         9QiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        fh=dot+l5z7l7ADqv9hGrIQDoMtjV/7X32oEXF0vPtbyR4=;
        b=JluElTU3pNHMd1N6JoHO3B6xlXuDwo1qK6D++uhKPozIDWiIuLTDqRXTn6Q5AmXEHC
         /8882XsFSJFY5s28zhpaYtcTOb/KiqNFnIdELg6PbS+x2GrZVUjAVJbPtwQV9I6Ebc9q
         DisqbgUPJo/fnfCgsQsr5m48Z4GZBbBvzVrtllqgHOul3m1sHYGMJlg2BSW80UbHpaoD
         Ys8ShMvbJ/uSKSVz1YB/ZkClsc8CfGcAkvhvQe9QmXoMWBpVj31PhTcxmZ62YDr38tvS
         ekU7hvq8k6VOioJRx3USF4IhiToU0JtuZd96JXpmbgBZRteNcNy/aFmhT4tGxQ+lYZfB
         ETzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794598044; x=1795202844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        b=gL8jZDdWoijYOUqqlj8DOAFvK6zCt6P1zN7hO5bgTFypZZ4sQKlyeApMVL5tn//P0M
         6kW3UYi9iCdBDhHfk6wKFTzI+2CfsAFBw7Rqv9Vk1nFOxXNXN/aD1X2E3ajfnJ6UGuBm
         glDsl536MTl2iP4zdDhrwJ/LeGsb/n7BT1C7dJ/ov1VxHcpDm2TAmCZoixEJlYoKVorI
         ShfqoCaCnn5MgtpAfxRcrwijJhRmF2tjMYr+EO4otzUnXlUcb3HThkZkliJTv9xT5miG
         cFjd4sB1mm4TKPqC2fzbcGlemMbI6HKTVpEDf72EISt32sXh2M3a08l80d0nxf1IFaH4
         Jg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598044; x=1795202844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        b=kmT2fGL0fXtNSL6ZjkiVyGDiEd4oRrxE0cxr3t+QdfhU6ixaWSz3R7LOY8jZVJT8yx
         NjPSdccdKgF778RQ73Pj6V/43LsuB+CJE0vjFL7jAHCeTrsc7AZndCa2VJYpTdTXeN2W
         TWotsLd7VFjcRLeqDB2oJlyNqinkLljpJBgHxe0Iy3VORTMwQsuLFc/2H2x7gjKPr7YN
         pKjPBrPNGGDst3MaRDLA9k8mn2cgk46a1hc5Li2vn+5QxhkRk0Rvg9XlPrqGeRbGMHha
         rpGr6uYBnQ15t/fbbPKkL5KQz7gYaGo6lTwM/c3iuV/mdDG//M+5/peUUsNtZsJ6mUe2
         TLRw==
X-Forwarded-Encrypted: i=1; AL+hErHBL4l+PGc1doLHauduvCQ0xSoeXd7xK40xO+3EpU6NxfQd89Ds2sbP0MOPn4HJdeRtZAuxogK2h+mtjhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dRT3J+daXdsxxzVG8uNIeCYDTxFBoPk4HPK8tfWCrSPHJOcwi
	uWXf73+r/f6gh5hPCfpW2yxCJwCqoO1m2wpItnsvn7jb/om3Qb4P7ZOE+N4VyXLCQDa30yEe1gc
	lOYVue5gnR3IqbQMXLcVTdELlbCvBaAoT+KK5bw57
X-Gm-Gg: AYBFou14Pb9kuAYQXDCSSRxf39agxQ1S1j1F26OF4PpXGGQlFt1g3to3JFQ3Nm3IFxc
	1kuC0QsO/xhj+ImU90M7+4/QDLDMKvmUMlQLOOS9XViLlyHfHvPsSwig/kIDhDloKtFuQeYtoY0
	kK4Y4Tm45UMSu2Xmsap1twhdKNAArVyfpcgxjtZdgcVGdn/QghjQ5CVHukEzsXWiz4PtxB4e/sw
	XBNoP6TAfgtggn3Lfb4pJs1qDdJefIReSDMi1ZxRrXQGKeC3xFWUIOvxErTV+802S6zvATa8bpD
	vk64S/yXtZ1aWik7o17m/j1BViTdyS6KQjU1A1rxsjws9exH7ILNOhK7iH/Z/W/LtVCc+LwB5/A
	4ri+7NApQ6/piMfop/jyf4PVAzjo/DVb2dE2NK4RzcIxQWyz4ABCkYlbpLXywOXEDXt4=
X-Received: by 2002:aa7:c60c:0:b0:6b5:5d24:5d90 with SMTP id
 4fb4d7f45d1cf-6b7e064b605mr11515a12.3.1794598043562; Fri, 13 Nov 2026
 11:27:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-10-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-10-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Nov 2026 11:27:11 -0800
X-Gm-Features: AclHuK8F8Y_DVnfmHCZelVEZmvLdtuJXie3zRJu-e7GqKDc7mN1PxeFQiqOooCY
Message-ID: <CAHS8izNyMM3pSJJXZga+OL6QMHFgnF-gu-+vzk6DO=EC4CLfuQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 09/11] eth: fbnic: Use netmem for RX headers
 and XDP_TX
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

On Tue, Nov 10, 2026 at 2:22=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> fbnic reaches header and XDP_TX buffers through struct page, which a
> provider net_iov does not have. Use netmem for both, and set up the
> xdp_buff with xdp_init_buff_netmem(), so XDP_PASS copies heads that
> must not leave the RX poll.
>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
