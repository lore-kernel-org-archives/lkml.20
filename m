Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261706;
	b=tXGUR7QarFOs++d+mMRhZ7lXEmr7j8NoeKwShE/X0EqERxS8bb7pEkjumv+PRIvvSFqc
	 sZnZ2h5iMxYz7lzr2a6VKXnh4hLNIFiQd3kumMbDYSSeuMgHxQFPEH8wP4es3j1edG5Yk
	 TGcvhpzHHI3yCP7LjgDSctkLurGZqteR+Xwwufk5Kpu90MVBLw3e+aEL4+Z24mZEs/Mad
	 /o8UAu7wUEFRB5MdAxr0Ew95FLByoZbENq9P9AtL4lv3buchG0l4UcTZnBTW0FX76e726
	 8dSAaSE87Yy0ERKEmHVVk1lnhJ8FxnteiCO4lqDgyT/bXXdrGtoSOThMU50Ewvvpycg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261706;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yYObwNH+TIVb9QisRlkuqPGqCJm2+m3teBi+a2YdMCI=;
	b=OTUrHhMmSUSU3zmro7rIFz6td3e5NIsUsoHMAWMsoKdS3pZ4uarq2ZjIZzuadvuqhMNI
	 BypiTadwnAfteZFldSpfexjpO5JSxHnb4+A81oY0XeW0KunUvZl0GCgVluCJSxBtOoBGf
	 yZaOGArT+Mk13j/AsqgrPJ5aZLiOSvrmhv5/U63jhxP0cKvKCWp8DPZX99SolPiUkUnjY
	 RHEamAgze5zp8owERi+pgzXYDYxGYZ0Vyb6c6o9ar3zc2rTNShn2nrpvyjxo09cUaM+05
	 ViwOgGBVgFxBQ4GzaM/miaIQqnVHyV6htv8592Tg5gKT0Evaz7XS+EnjjOGD3/rfXMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6uS1VxD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4A6606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6uS1VxD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9381F031E0
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793261705;
	bh=yYObwNH+TIVb9QisRlkuqPGqCJm2+m3teBi+a2YdMCI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d6uS1VxDtAE1nEpXR8bojG0FSljbs5S1DQb2K9ykGc8AzU+v3S/HEFCHUgHHZ6c0N
	 Q9fo4LWKfh43Ue3TYpDFAGnzYkFnpHRMN5ZMlJqagosj4eFu/NxGbRlDTNC4PXUT2q
	 3EXmcMscL964xIxFdPcvVituqSegsDWE8ABxCWZmJaR3+vG0YiTaHnIpTr1+0w34zq
	 Pm0ONZ6Nl7gSCcX/WZ/PDJFWyrwLS+vcjSbfxbt6+jg1ulevmrDN+QCtNWAYoQZmpS
	 hkwQQqbMpNZnzee0MEOTDm+eJaCOs009VAgQNGO1Ceb0bYYK4TJzWnYKWufV7kc7vy
	 T4qrbnEeryS2A==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c315869241fso283544066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJczz/i3iNF6DxB3dCglRtESbQWIYxXFdkAfaio+l1HxhbS2a5WviTdIKf6MMaqUj3ElpqcNJ5WTI1mBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+qON8uL+ecKT2C5lbaAKF29RoN/mmqUA+KDiI2Z5zWWm3oTVG
	1CGcho+qXZEXWMqlB4xlNks1r0AlZFCCatWhu+xsEymEB1c0FhDPSbBINjeL0/jmWLEsMAFDSPq
	b44/hrvTVb/6Ed+KiL9iCzO+BBHbIF7U=
X-Received: by 2002:a17:907:961a:b0:c40:f89f:d91d with SMTP id
 a640c23a62f3a-c49bdf75773mr380842666b.28.1793261704270; Thu, 29 Oct 2026
 01:15:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028203324.6073-1-dennylin0707@gmail.com>
In-Reply-To: <20261028203324.6073-1-dennylin0707@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:14:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_vqP+FK1NDqyqzEbkz9x1O191GNa_JOOHCSFuk7S39Gg@mail.gmail.com>
X-Gm-Features: AclHuK-1y0mLW6FP8qa5uYUDpH3JuwsT0W3xlLQLJRFbzwZl1qeYTJdQVXSzFko
Message-ID: <CAKYAXd_vqP+FK1NDqyqzEbkz9x1O191GNa_JOOHCSFuk7S39Gg@mail.gmail.com>
Subject: Re: [PATCH] exfat: fix parent link count when replacing a sibling directory
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:33=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> exfat_rename() adjusts parent link counts only when a directory moves
> between different parents. Replacing an existing empty directory in the
> same parent also removes one subdirectory, but leaves the parent's
> link count unchanged. For example, renaming one of two sibling
> directories over the other leaves the parent with four links instead
> of three.
>
> Also adjust the parent count when a target inode exists in the directory
> rename case. Keep same-parent renames without replacement and the
> existing cross-parent accounting unchanged.
>
> Fixes: 5f2aa075070c ("exfat: add inode operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Applied it to #dev.
Thanks!
