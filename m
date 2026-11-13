Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794547871;
	b=phq/kIRFkCZMTGhw1iLubyWCq9+npSXRBswPgXPbFRvqOMUWghtsAZZf/g1sFryLyKaB
	 NWtZsI7TDrOMCEg0w9zjH8/E75f1kBoydSz/fn04c3ujBjQbmoA6u3TnF+EsbX4MmW+Vv
	 vYmOtj//6GOWlvgJMdlcwivXzS9BEvCqLMbCaQDBwfHNT1OKK50/qZmKUMbklap7A8ADX
	 +ExtpJkllyCuKkNGJ0oTeoBR6WsDtU0x+c6dmxUK6vM1gaR2Cm7d/R2e876jttT/U3OPT
	 gck7IRXHC5Akk/PIJC4EzI2kni475l57a2Tk9F7n8DQ0xYsl+E0POpoeaFpkVKVnRPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
	b=f8NQe1zBd3ZBj/siFofP7Pj7KalR0gbBuDkjDG28VAg32HvJwCxX/Bbk1Jjla2ADI73Z
	 +Q8drSjJ8ICTl4J+sjyOoLVPxWeMCTGoXJ3GyJjKAzaTym9K0ShM3ZEV5HX5JSyEPp9cx
	 LJjmW2Xve7sn88ajaOTBbq5Rqda0gXwp6e/mv3UQhlrCw5kF+5VILfX/GALy8RdB3eO2A
	 95WS/7ZVLUvh9Ie8w9OG0z5+jbODPLhaxjBMkF2WxVmpPpAyq9yI0O20KvspmN+YMVy08
	 abW3OAwVI8tJdiBlJRaCTdIeRqql3sdu0RwlEyKULvcptbkN7OBmtjP96wMW16+RHGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="VTU/Umv/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D54606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D54606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTU/Umv/
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso4585a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794547869; cv=none;
        d=google.com; s=arc-20260327;
        b=NNM7at/o0zEflVDN1zhPlp69VXt7AduO1GfztbkYWyAzQ8hLl6qv4nYq1tb+spVEM6
         KXMsFpnz/8RNolEjMQoQmp4ELURAC3TdOx3pOM8t+MyelGCVSM7hgvagTf1ZgEgVJ61Q
         EUnnrQfN66uelE3nat+rljTN+yKshGJgptdSZ/5319uPCYeDMYz+WHz5oYLEQp48v5f7
         YjfmG3R4rbl55PQllxnrr3pUT0WWdKF28oFYzlGcdn8SXzzVc9NurAUCRHtKHVxaFg8o
         juup588d7yJ08ASHhLY+VYs6ZDGlBjZaeT/8IztA5WnRshbPUUpqLGnxEGxsmci4bSGt
         dCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        fh=CQl5lJ2Bg5oLkkMNnxIa7Zk41v6+eHdSx/tAAT6c6ik=;
        b=fT9SiVaMNwmb5q0HAtrKMLNg/CKPD/nF1GiMf2GUDpij/C0Jfvaw4EADY/aPIStdlJ
         YXs3AttsnwdFzMjD7ZqHCnGlcBAy9/FoxOmQqu/D9gBvOUNrrewkNAcH8QVZbBqLZ18+
         HSSG+B5W4p2fXnpZxZDOtAIcN2zLka/7dETaz3XB8mBW82E3QMoPCGZPUZZFExEvx1Qs
         yWob4in2h0eQvuzX+ikw66p7Odie+9T4wG/3OkqNNSVp/pjCnxtA/hJl/otWexfKmY84
         pQ/zb6OeAdpIfDT5Rt4vD3QpBZhyuglmGMqlv/zF+U4rinanaBFT+1AiSV5Cc6ocVZo/
         Vl0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794547869; x=1795152669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        b=VTU/Umv/XxRmtX3d/XSHHHzSkVNlCjGAiWWmvRpYtATJbDMspOvWRWvSyyqUeqeGeO
         Q8uCINspbjVgU1zSuH+9UnHcqxv8cjRjT4BNbJxmhaQFB8TeexUJIOYqLp4e6zCgNF7n
         GqWGMPJWmhxv2jXRWVtVDAZqa1EhqIWzuIWQ7K3QsEysQ+usM5G4CvZUur47OQUqnPpY
         PP7Up96FsigDTcgDAk4n7JTplwxHbQe689kspsrS0geT7o0ItGIgt0vez+TupVh2sN/m
         e+JFPSRT2SGGBWIOmeouwuXUS1RYlIiX34y+UZSFFdexoH4xWaCTbeVKnfpyGGT5KVCu
         Qs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547869; x=1795152669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        b=P5nXOFZO+NCre04BJhGBRW+phxReghld7q0+w4dqDW1XPSZOXw2tYDdsPyQ7vcXGNR
         y1y8z20XSGatzPu5K7enOaBnP9037q6c61ohBObe4Uypa+ZM2UcapIARF+u6P7NFJLe8
         KFJEQlu+v7lJ2e6If7rz52u1/jLaw7MUYDbMctcfaJPUAPXm6Z9KKWpy/y9GzwEtyktY
         3+9NxHPc0lJ59gUe74TLNZbMg7u/BMLLAYPOMaMb2MrmWN32hLnx+0gtjqVavW+Ljpco
         tX3fM6BnSJ46ZMqIFeKGdHPpY7gNPZFlZVMSIQmr9klejuYK6RcRStFyvMasY3bio7Ob
         LjkA==
X-Forwarded-Encrypted: i=1; AL+hErH9o7/exNub/fGFjITFAeg21xKh2ADdJAbaKrQbGvX776/tT0reAbSJpvk0sfkV4XQPnyhWEaJjcqC3Tbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TuXEWBbcOvlgQopEvP5He8DD6GQHvN3A4Va7+eUUo0wJCVDra
	uM6wXhD2sMF5AkBqcEMNUe74y8cSeBNHMO231JxEUV8/gaUq2viU8K7jc6Nza96jmAZ/lNRdjzA
	SUQspSIcvvwKI3d8UHeaX5reg0Nkake951Ji25JBX
X-Gm-Gg: AYBFou0/Mpco/svrGMWqWFQMfVetRKfpEbeEH5PJKuQf8QpFtLo2laHKo5+3T7DLw5x
	Bx+FeE6+Lhjh/eV85D5NokptPktwWFerABHh/PgA9cCXf4oKDQzksycolZ5DiK+WoVxTKCxUZe8
	iy/ldG4w2GytxVko8yt/lyBSUZppw9kmzXYeBI5CdGHygm73ceaFxjC+KK/pNu+avQraS3ThbD4
	PtvpOEcH1L7dVf9aKOVcqLSnYnHWrcqO0khFBilwOweziaHtfcTC22vi+rPAc5D1QVT7Cf0Rfdm
	DEdwVDUc/8H3YZJVUeo2E3jyzo33gW28Uhp7L+kJudoh/ANkCiQpAFXAup1JGGla6WX2xAyWV7W
	i2mJOPxqdK/mLy8A3cqA81QImuL7d6uPn3TU=
X-Received: by 2002:a05:6402:50c:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b7c82ccc67mr31403a12.12.1794547868632; Thu, 12 Nov 2026
 21:31:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-3-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-3-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Nov 2026 21:30:57 -0800
X-Gm-Features: AclHuK8G8jI-cBJtcQSxvGp_Bq701GaxLVhNUpqBJGdSCTN97QaxO6J0E1uIQ_U
Message-ID: <CAHS8izMaAv6gX1NeJR+QCf43CL+DC4DgePRNNxSLoE31jxHU0g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/11] net: Add memory provider capabilities
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
> The core treats every memory provider as unreadable: installing one
> needs header split and no XDP program, and any page pool that allows
> unreadable netmem takes it. An AF_XDP UMEM provider is readable, needs
> XDP, and hands out whole buffers.
>
> Describe providers by MP_CAP_READABLE and MP_CAP_FRAG; devmem and
> io_uring keep their behavior with MP_CAP_FRAG. A page pool takes a
> readable provider only with the new PP_FLAG_MEM_PROVIDER:

Why do we need this? I thought whatever creates the pool actually
shouldn't get to pick whether the pool picks up the memory provider. I
thought if core has configured the rxq for a memory provider then the
pool is forced to take it.
