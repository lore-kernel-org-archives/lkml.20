Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16C93909AE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578270; cv=none; b=Qu2SjdLgttkpCxg/iMstglb5iu+GOkoqGmxFYgNCVbE3TraZNey4IzIpDxPXNY2eT4Fl7Nd4afa7A9TXP4paeB7C66MsQ5fkOqvZVRkDy6ln3JC451J/vxADuitaiAK3nmGJI5iUBuqq4aUw5/smV7UJl+/HNQdEgx7yZa2ve9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578270; c=relaxed/simple;
	bh=eIKla4S6a3D0MHGwhrlPCSrXWKbvb2Ko4TtW5GQrom8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZ5GpEQ56sb4UG8Vw3RbeS58Dg7ECWEwM/34ABJuocnK7p5cUq0/eLbxCkxIAt5Tdv0OC6bIxCoQy0ajzAw1/K4IufKJnnmO/SNqm/0jqSCU+DPP+M3xqUScZVTMHDrfDNd2udEJ8otlJg9cCv8Nf7UI5m1/4o0M4iivgXAF5iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRahg4cA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRahg4cA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C261F008A3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790578268;
	bh=s5UI4Wy+eGiErrBzR7b2VedGpOFJDsN75qbhAxc0yzs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jRahg4cAxN6Tle2r15oJe/vmxLHt/LqsTmTxt34l9F+NJ+DReohvk6pR5vCHz2B3O
	 pcJWUAQ6QH4Lp0CuwBlUfYDuo8LRITlBQkrUs+FWRkmUazrwaGqVihIh4IqyqQnhho
	 SzyMTgwzEgMUZNVh1F/Zj0azGL+N+c5Ip34weRdyBiQruy5eAGdfDQpOqcJy0xC9If
	 XninYxyuXj034C3GWnRU/6CjCPxeYVDzZ7UFgT6+ITXDEVEQGj43lpS/oBRFluKgN6
	 GcObbZtLOxjCr5AeIQf/biJ0/q1/t08Vi+9JBBBQYwnZtkEnOC4gB+89RwY77H8Rzi
	 ckorlts8LfjXQ==
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bd580489dso222727585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:51:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwayhBypj/SmTfXD9JLUOqdovmW2PaMnrzkPlMd445xj8QOEixvnTx9rB8WhLDrI2bJfYmy3KaFssQ2Kts=@vger.kernel.org
X-Gm-Message-State: AFuF++l103ULUuffRL33sMfo3O57n5YIXOthYzrqNdLMTPAr0oh5joS/
	bPLGgf/Tn3+xiY2VvvjC+wDZeHxKsxfBBB7tRBeeKvOkgXDDhXoUMouTvJzBqLvs4VtWUfIhAqN
	Zvlplk1MxQdehXp8W0jNBMusC64KVkxE=
X-Received: by 2002:a05:620a:6486:b0:93c:6925:dfeb with SMTP id
 af79cd13be357-93c6925e8a2mr834739185a.56.1790578267654; Sun, 27 Sep 2026
 23:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063724.24008-1-hui.zhu@linux.dev>
In-Reply-To: <20260928063724.24008-1-hui.zhu@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 28 Sep 2026 14:50:55 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wrWdw+4B10K3J+sDCSjVoBs2=LtObb6MKehuYsx9pXMg@mail.gmail.com>
X-Gm-Features: AclHuK-c7GpN5AyOOlaUnzGeJcdZoBH-1EyfOLTse_68UQXS73MXqF_7DQKjthA
Message-ID: <CAGsJ_4wrWdw+4B10K3J+sDCSjVoBs2=LtObb6MKehuYsx9pXMg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Add bpf_proactive_reclaim test
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, JP Kobryn <inwardvessel@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:37=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> bpf_proactive_reclaim() performs one bounded reclaim pass per call and,
> unlike a write to memory.reclaim, does not retry until the goal is
> reached.
>
> Charge 32 MiB of page cache to a cgroup, ask for all of it in one call,
> and check that the result is positive but well below the request: one
> pass is capped at MEMCG_CHARGE_BATCH pages, far short of 32 MiB on both
> 4K and 64K page kernels.
>
> The test deliberately covers only the kfunc itself. A full example of
> the intended asynchronous use, where a BPF program watches one cgroup's
> workingset refaults and reclaims another one from bpf_wq callbacks, is
> maintained out of tree at [1], released under GPLv2.
>
> Add CONFIG_MEMCG to the config fragment, without which mm/bpf_memcontrol.=
c
> is not built at all.
>
> [1] https://github.com/teawater/memcg-async-reclaim
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
[...]
> +
> +       /*
> +        * Charge FILE_SIZE of page cache to the cgroup. Reading rather t=
han
> +        * writing keeps the pages clean, so reclaim does not have to sta=
rt
> +        * writeback before it can evict them.
> +        */
> +       if (!ASSERT_OK(ftruncate(data_fd, FILE_SIZE), "ftruncate"))
> +               goto out;
> +       for (off =3D 0; off < (off_t)FILE_SIZE; off +=3D sizeof(buf))
> +               if (!ASSERT_GT(read(data_fd, buf, sizeof(buf)), 0, "read"=
))
> +                       goto out;
> +

In case we might map file holes to the zero PFN someday (not sure when),
this wouldn't necessarily give us page cache. So maybe write + fsync is
more future-proof? In that case, you could also drop the two lines of
comments.

Best Regards
Barry
