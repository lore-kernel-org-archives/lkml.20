Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635386;
	b=yP8CcFoT99g6ekLR9HIhWhymBfJwO4J+IVaqyEmw44xI824aCgB++8YcaxglxYDtThq8
	 ougI8tIhhuPIfbMAFPezseXA2t2yghToc2UBN5SCJDeDom3h4HWiUNYFXDV7df2Sa3gTo
	 ZLCkSYJw3fIWwEgSU3LwKnM8INthgjPv3lFhv5QiHOiU/V++bi1+6G+/M3sp/tDdcls7b
	 IqbehYUVLMJo5jnBck1EtFdFdtrA40Nq/9m2p8AI/1heQMOC86IYJ3F+sW129uXswvF6e
	 C5b/LsVVFk76NP2EyjmO2+Fufrs+7kfpc99KyKGWgwtkDUIuPBI6a8O0+LCmtc/E70A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635386;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bZtDBjzgkv5xQcYlp5Yum+2Qy7bTJw3wf4TUeP34ezY=;
	b=KQSuJkLGehYsIMHXv5OSbdnpr04IP1QX4tMWuw68PR1Tc79hF+OQk6snFJrUinYCSDgv
	 HHG8oS2O3YiJKfM3aEwL3bSR/JLlWCLc2tcwWQOvJXMWmBHoFwGqeMtSMrPueTemw1wWY
	 0683U2lq0+VdMNA9N5G9R/nH9AG8RS7XQsw++tLWKlEguOCQwwQU8OIyNjlGur2Bh1BsW
	 Z7QJBATu6XXgrUbEd63KUKiu2BCNUJtlbU4M39Sb+4zN34oDr2Jkw8mXelqNJ6+k6eSIV
	 dVW0Gly3Y0cLOAsDfG3s2xZddfrE9z5WZmR0a/9nCY7e0hEpF8EzwMx5Hm5EUpLKGBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNRl1L5s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DE606A5A3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNRl1L5s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392B41F00A18
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793635386;
	bh=bZtDBjzgkv5xQcYlp5Yum+2Qy7bTJw3wf4TUeP34ezY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KNRl1L5s6/wEyvvsLuFpJ6plEXwOmrCadaiQnku6A1vaHVWQtMmYscsY9m4HRFLoK
	 eS7l2l/rzSvw7FCzbD+wftk5ezxRbLYqX1a/7EFKjsl1CClVhwnY9KF7jv0Qcyh2n6
	 vtulGe8hNAvgiXu6HVmquT9II9muR5M2r1GJpFWEDTdW/aEPK/OgvuTgwsbQbv0+v5
	 cucbeCjXYXFaA6zy9XHdqmZNiDyCKvZC4+Di0z+5y0fm6+rhR3iAyEpb28STEOFgLn
	 WkLSK37mZNco1WUUF9HNi0uLmrYzZGbJKpyuIrnnFDZJ+cJHq29ZHfSw4z2auSsRdN
	 3HiDujdROvHSQ==
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso828161241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:03:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwofTj7n/HNUuqXPPeo5du1w6MVN7vZviABqcGK9BGU3gJMe+O1TjZxs8X/3fJBcsWRAD6YVtJF5HCNtQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rc0cOmiZqumu4jzRtJKFZVNPe/FCus0Sox/6qd9wKVKEAThT4
	kqLzWtnGvBGdIi11CJPmSH9WQmynWCH344WZf+vxRz1vxZToa9JYeKN5m58F0SrTdsZR1rDr8Rl
	SvQJVZZNb/LslJVLgqO1l9SsPS6/KOkc=
X-Received: by 2002:a05:6122:c88:b0:5ea:d03c:f0e9 with SMTP id
 71dfb90a1353d-5ec68944736mr4322887e0c.12.1793635385467; Mon, 02 Nov 2026
 08:03:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
 <20261030-b4-btrfs-data-integrity-v1-2-f4d4196731e6@toxicpanda.com>
In-Reply-To: <20261030-b4-btrfs-data-integrity-v1-2-f4d4196731e6@toxicpanda.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Mon, 2 Nov 2026 16:02:28 +0000
X-Gmail-Original-Message-ID: <CAL3q7H69Ci=+6xdadWanzMNFwKJXzCzQwgBP2AZNz-GjVkSmKQ@mail.gmail.com>
X-Gm-Features: AclHuK9hJ6ZkQF9NbDoC3yqIUdGKzYNetSEDAGDD0vFFCJQvSJFv8xogAO1abdg
Message-ID: <CAL3q7H69Ci=+6xdadWanzMNFwKJXzCzQwgBP2AZNz-GjVkSmKQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] btrfs: clear dirty blocks after a delalloc failure
To: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, 
	Qu Wenruo <wqu@suse.com>, Boris Burkov <boris@bur.io>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 2:38=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> If writepage_delalloc() runs the first delalloc ranges of a folio and
> then btrfs_run_delalloc_range() fails, the blocks that already got an
> ordered extent are finished with an error through
> btrfs_mark_ordered_io_finished(), but their dirty bits are left set. The
> next writeback then submits blocks whose ordered extent is gone, or is
> about to be completed a second time.
>
> Fix by clearing the dirty bits and cycling the writeback state for those
> blocks, as submit_write_sector() does for a block it fails to submit.
>
> Fixes: 72dad8e377af ("btrfs: fix double accounting race when btrfs_run_de=
lalloc_range() failed")
> CC: stable@vger.kernel.org # 6.14+
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Filipe Manana <fdmanana@suse.com>

Looks good, thanks.

> ---
>  fs/btrfs/extent_io.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index 5ff630630490..3283835ccb5e 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -1746,6 +1746,16 @@ static noinline_for_stack int writepage_delalloc(s=
truct btrfs_inode *inode,
>                         u64 start =3D page_start + (start_bit << fs_info-=
>sectorsize_bits);
>                         u32 len =3D (end_bit - start_bit) << fs_info->sec=
torsize_bits;
>
> +                       /*
> +                        * The blocks are not going to be submitted, so t=
hey
> +                        * must not stay dirty. Otherwise they are writte=
n back
> +                        * later without an ordered extent, or worse, wit=
h this
> +                        * one if it is still around, and invalidating th=
e folio
> +                        * would account for them again.
> +                        */
> +                       btrfs_folio_clear_dirty(fs_info, folio, start, le=
n);
> +                       btrfs_folio_set_writeback(fs_info, folio, start, =
len);
> +                       btrfs_folio_clear_writeback(fs_info, folio, start=
, len);
>                         btrfs_mark_ordered_io_finished(inode, start, len,=
 false);
>                 }
>                 return ret;
>
> --
> 2.55.0
>
>
