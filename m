Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768082;
	b=2edKcdcMrzxQiqei2TAeO02b9ww6un6SQS3BrdSUWriZSADwr4Yr8Nh+2UN5USAfkCW8
	 sI5wfgBJ4oQlCzmSTUfa4d9Nx3HVcK0JYoee3PPQNxJh8WauYEA8Grx0xBEAGqyYWePIw
	 wHUnCIAd2vpkq6lA+HSGBp9JHnXyanOlxKhtFoJazQXlNRPbHWWZ3gyadBaRenXm8vd5I
	 DrzMbhNSM837pOl9bGrdmYO4A7BYdlGcsENw6J6YqylSSpIr7p7aps71G6yvPensikiWE
	 79n0sy16e6/O/48lQ36XCTCiI1sO50Nr4+OMn0PFt3iQfuvuk0PaKDWi8C7uEkHVSDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768082;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WmpCPFVTuFm706ecVOsfIYsdS839wcSu5U/OGfd0cQI=;
	b=fjWAByIXDNDk1yYLxy7EKiHN5+TDIG8nA6IYNR2jYnbabu//x0MsVnD7zySgP9g3YP/Z
	 JHyZrZQUnqy3Zzaag/uSD19N5/UUtCcmdsLQwi1s4oQFvcz0O00ncbPUdKBk3MO2D7FeS
	 lWPVEtSNZGdPoEXuCVdDUMvjvv0c94I4iu8iDlvBOOiUGW/f0HHkpH6FqWmyY3YR+3Rbj
	 KhiVMBGsoPvdqivuq9aAOZAaCXHUbnGDKs05bgNcx55Y7uRaTLbNZ7vWa+yDFkvhA4l18
	 uo2JEwiW1G8MjXAOVYlvN2bhbB6D3S9B4OS0AW+Bz6ZzWq6ZgkylAct1V/nYwVkmJ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UiB05ZB/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF276606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UiB05ZB/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D0A1F01829
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792768081;
	bh=WmpCPFVTuFm706ecVOsfIYsdS839wcSu5U/OGfd0cQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UiB05ZB/3Uq5x4So9B4NBmFafP7Ei0jiihyEWg4x0dLS39ag4T6ds7bqXUGpRX2lZ
	 0KAAE/NUXvv+vGFJc/QZAt3ZsIDqzX0nExCSWPWioTolsSuYgZTRdRUNcveBbXM0IZ
	 Id2jYUEl28f4Ox8lkekwABydnEbJBVYVXjNNITOoMkmqYEJeguvGAAbXY0Qr/GDnWo
	 2BTHczmhCOK/aEe4yIoe8pRhFzuyn4IPCjP3HosPUn9+Edc9DLGaXDKX0cUrKNrJyG
	 970RybfGTatPmuTH25A7cW7jugRjSq44GMUXN2bgrGh7wWFgHaT7gZQePdhkCJcpFa
	 9MvjCqhjQN1ww==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c450ab1483cso139685266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:08:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0SRlf52rJBcNIDRQefkP4RKBpQa5ET0pM//qU4t0glrWxvU4gL9oBKl5dvMJIZj9y0nyX1TB3/ry6YRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIUdWFPGEMCo5AF5lYKTambxbXemcthiNXkarLCxubb230m6tk
	Kojb595D0k0CwZ6ajx34LDWRjwQvrMd6hO3oiZ6JeQpdVCn2wWvx7moUJAEnY3azVYb+l8WOAJz
	goOKUqDJUOOUcmrHLklZ4H2hy3Ptzq/I=
X-Received: by 2002:a17:907:a4ca:b0:c29:f5d8:9c6c with SMTP id
 a640c23a62f3a-c46a92b9cf3mr393227466b.27.1792768080182; Fri, 23 Oct 2026
 08:08:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022232734.496064-1-suseendranb@google.com>
In-Reply-To: <20261022232734.496064-1-suseendranb@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 23 Oct 2026 08:07:46 -0700
X-Gmail-Original-Message-ID: <CAO9r8zM=CgfgbEVg8vqjeDTuiPczQxH8+QVjfX08Gao3kyEJCg@mail.gmail.com>
X-Gm-Features: AclHuK80QTfSTqsKyXHLSyku97K6opYMGbTo4CD_NKkEdMsbk2RcFAsJ7gpjO1I
Message-ID: <CAO9r8zM=CgfgbEVg8vqjeDTuiPczQxH8+QVjfX08Gao3kyEJCg@mail.gmail.com>
Subject: Re: [PATCH] mm/zswap: validate dlen and normalize comp_ret on
 compression success
To: Suseendran Bhaskaran <suseendranb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 4:27=E2=80=AFPM Suseendran Bhaskaran
<suseendranb@google.com> wrote:
>
> In zswap_compress(), dlen is only meaningful when compression succeeds
> (!comp_ret), as compressors do not consistently set req->dlen on error
> (e.g. zstd, 842, and qat set dlen =3D 0; lz4, lz4hc, lzo, lzo-rle,
> deflate, and iaa leave dlen at PAGE_SIZE; hisi_zip sets dlen to the
> hardware-reported produced bytes).
>
> When !comp_ret and dlen =3D=3D PAGE_SIZE with zswap writeback disabled,
> zswap_compress() sets comp_ret to -EINVAL instead of -ENOSPC,
> miscounting the page under reject_compress_fail instead of
> reject_compress_poor.
>
> When !comp_ret, set comp_ret =3D -ENOSPC if dlen =3D=3D PAGE_SIZE, or
> comp_ret =3D -EINVAL if WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE). This
> allows simplifying the failure check to 'if (comp_ret)' and dropping
> the ternary assignment in the writeback-disabled path.
>
> Fixes: dca4437a5861 ("mm/zswap: store <PAGE_SIZE compression failed page =
as-is")
> Signed-off-by: Suseendran Bhaskaran <suseendranb@google.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>
