Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327401;
	b=Jpyy2jhXjg7/FA2OBKkzVjpMO87siDQG4BDOBuluUrRu0GD+70eS9LdsJdCX1sI82EIH
	 MEzrTkWWksnBHG3Mld8AQpVVHiad5xA6DIEv0Q6OE75SWc9qWFfzMgWfiQGvPZ478Dnxt
	 wH0Zafw3xTzR+/IcNO7ZeMSretotMQdsPDdqeyVR2zaZjwQhPnN7nAf8v5RE86grFnWlj
	 TFpEGmVnOKhJDjwV6fR7y4RsDbS5VSRw+sECTvSPcYmQ2Xtx+9lbRUHDrYFoTWgPG3B6R
	 EgVqPYmr+FcsJ0+MGO+Y89/iLtZ3Lsj6QNhHBbHmw8nrII/7zdf450EaxNM6L9quuew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327401;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t/2MuWYVBhNCrWHxBkQfWYvbU9j9ZMayABUoxRH/r90=;
	b=XXzR7i8QFC49/k9J+XmXfmpMwU+gAoOkmbegD0QwlKRJLcAd7e10wCJ/el7dhI7tBkDb
	 UE+5qHygAQ7jjO8iB0Gn30l+OMugVNF9p9lvRQC+bq46ElEPQaArJ8As3hmUroBwSv2Ev
	 Uu5pZSP55U/0fMU3ptEXA6Tq0ai8zi6Ccxq0bKwjzoGi9bHVvhwPO4UhHLLeNXEynlK2e
	 ojaCeqGy7xRdPpBG2L741SDCjVBWDyCWlpMCukM6tqQQoqAvU1xELVPn5Oo6kUMYOOpwR
	 0GCfkqBYMSjSlgOf5dKaINtuteKDc4+S5yi5jT7ECLxboUmMw4wGW0sHsATps+mFZSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgjQ7b6Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22346606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgjQ7b6Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AA11F008A2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794327401;
	bh=t/2MuWYVBhNCrWHxBkQfWYvbU9j9ZMayABUoxRH/r90=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GgjQ7b6Z84JEROSbvsW1NEndXwpDWmRJ5mdiK0eU50fDHy4S2q/4x1fnZM9peLwEn
	 ZmB7VeDTwD7CNnPWJkKtIX6OPYrwC/4nwt4t0B5K/Gyapwig1ADFvptXyr8zatX4kR
	 xk7Qz/a4olH9pCPm6U+Ws3I4BDq3fyyoDwTUwKLQny70Mpy316Co5KZZ3wvKrJ3wTi
	 akioaTVIzkGHEOo0dJcUu7a4EvYFXqk0VX1JszXvYsLZnReYIz88ULmV5AOnuHcj23
	 xh2qcM6D+FuL63WiuCnwJ8Lo/IvIP/nHiexKLWz4uZsaPpHIgfJBJzp13LGoWWrosU
	 hhnMljyw0UiwA==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f259cdc86so196482285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:16:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8DqhLXfya/7+LZlS2CQjhBwn4RpWvHPehH8NFGDkDkMhVbAysOLikjO1Nho47EZiBAoet0fCOMjs7J/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C0NzV+2d6c9/4awcqGHbHoa4akQkgKSi+yZcTQ7O6BIvE31zy
	f0ZtEKxNC51BEe5mXlno6EC3S6y0lfoRsJzyl/M+GOgjnr4/9fhyJhHeTaSVQsRb7fJxBzGLp/j
	cvj/Q1yNZaPnQ2oft8AW8EQOydZtJS64=
X-Received: by 2002:a05:620a:414c:b0:93f:353c:6bee with SMTP id
 af79cd13be357-9479f2e6ba0mr519311385a.41.1794327400308; Tue, 10 Nov 2026
 08:16:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
In-Reply-To: <20261110054836.1515030-1-senozhatsky@chromium.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 10 Nov 2026 08:16:25 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMW4T+0-UFtPUi5EDdvP1b53=0Tpasx7kc5ZkdbqHW0Og@mail.gmail.com>
X-Gm-Features: AclHuK-dt6QyaQbEWS9LvYKZc0TVuyB5CsV5lfGXmiKwVChcOCfSsn2FOyFBdvY
Message-ID: <CAO9r8zMW4T+0-UFtPUi5EDdvP1b53=0Tpasx7kc5ZkdbqHW0Og@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] zsmalloc: redesign object alloc API
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 9:48=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Both zram and zswap already have per-entry structures that store zsmalloc
> handles, so allocating a separate handle_cachep object per stored page is
> redundant.  This series embeds struct zs_handle directly into zram and
> zswap entries and drops handle_cachep, saving 8 bytes and a slab
> alloc/free per stored object (2MB per 1GB of swapped out 4K pages).
>
> It also folds zs_malloc() and zs_obj_write() into zs_store() so we don't
> take pool->lock and look up object location again right after allocation.
>
> A simple zram test on a 24-vCPU VM
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 165 fewer kernel instructions and 0.7-1.8% fewer kernel cycles per write;
> lz4 single writer +2.3% IOPS / -2.6% average latency;
> 24 writers +0.9-+1.0% IOPS; no regressions.
> Memory: 8 bytes less per stored page.
>
> v1 -> v2:
> -- addressed Yosry's v1 feedback (too lengthy to mention here, Yosry
>    posted over a million comments, or something very close to that):
>    split-ed some patches, squashed the other ones, added handle
>    alignment run-time check, added 0 PFN defense, etc.

I will take this as a good thing :p
