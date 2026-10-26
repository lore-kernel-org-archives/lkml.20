Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005830;
	b=r+ApH8HUeMBBMCXnFE3r6fpgMZ98QlFcyDPXcEvC/ie4aS0xdi8qvhElx+S9ebW7juYM
	 sXXBe7KEgt4I354xWjBTJwQxGgQ11Udv8DzdbM+L33qpVWDXjqf8MqniNNcJJv8cyTsO5
	 bV66mxrqAaZ2Epm0OebdN+b1URgrd25r7KEBBmH3AB/tb7xSid04gL6N3wUNP3xizCBr0
	 xtbDVWwufQfydJ4+j7qiq2M7TDdoyBqoIlA2mZFYd4+tnULLEDH6+8MX6NTivnqjIUEc1
	 7TCVnpBQ9UCyHPJJAsPxxeVyt2atbsoHAYnx9fEeW+ln3S+IHahkOS++tHwiiBeiQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005830;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SVu1DeEO1ETbeCmNztnv6Ojujj6Uh2JAgOnpKOwVVKc=;
	b=YIAZ/Ml2lQIggzcMSHgrxZZSb+RLuvUxC2/1fmYLEI2ETpynipt4mvdpo1b4lxfS2ihI
	 A5aW+jQ68sTV5hErwIoB0JgdKR926zO7K2n4uI32Vsm9rmxe4t6tl9WqlvWXapzXqchoH
	 oLfc/TZUY8ULP2G0TW5oKwdT4Oe4tC7NysnFOcDr0VcSxJUfe18B4Ivy4HtOarSNAKXDz
	 ITVa0Zq1Q21zLFg+MutyEqjiMRkAGxmK8hD1iiOrstUfjYWuux6TSkiGF2u0D1UbpUs1f
	 WLpjv46NmnBPoQghXjVzNno81qkEzSftknusWTm6hikZoYwkmzpsjtj7EWv5l8lq8nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnTYDEkL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FB606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnTYDEkL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2161D1F01829
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793005830;
	bh=SVu1DeEO1ETbeCmNztnv6Ojujj6Uh2JAgOnpKOwVVKc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jnTYDEkLhzMMevVmdYW2nBzxjrBRKN7AjzcRREch2Kwm3Ldue13VRQ2UEgP1fex+G
	 5VBr6HtFZ9aOyXPIg5vi/0m3SWkGWDa1Tlx5Hv2bTuBT3Xjdu7nCR6jNAtonMSsKAa
	 BwzNszaFa9jN/FXDxUNi4hRl+gkglb2VGHSd6XagcFN0YLoUWoiGN8OMNvTb7isVi3
	 tqw7imfWNWn6pS6g8/SfceVnuZ6WUER68PBPNtMiVFi0VVt1fLShodQ8eH42Q7VAwy
	 Y8E7kdVzZp/6H2DVGri/UptzZ+YSFF8c2BlYTvKRLPzK2HloITgmmcvXLsTBpMDBSp
	 EdklBtGFJ1new==
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so3044448e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:10:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzL076GTfHBdADRULuH69RJJBHyNRKKzz9nnF+y7vga8tGq1NP4MtIlwXnceWsuhN8bDG5JA3iAsJN2wBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+6ZE5myOXpnDsXzoi2t7gTgKQJPVtMZ4Gxrv6r9bZGcFEy75Y
	pBmFQfbYHw7f36YZ5paFwmq0jfUoX+lsSNCAi59A/2zN4cx1Nj5BQc0Tkm8rPkv2NcWWkwnWnRl
	c6v4Quc36q8msjxXqx4aWHNI2R2qiuq0=
X-Received: by 2002:a05:6122:218e:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ec23239b28mr1869905e0c.8.1793005829306; Mon, 26 Oct 2026
 02:10:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025180304.349254-1-teel4res@gmail.com>
In-Reply-To: <20261025180304.349254-1-teel4res@gmail.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Mon, 26 Oct 2026 09:09:53 +0000
X-Gmail-Original-Message-ID: <CAL3q7H5v8Q-8Be2eRKszfmi4Rh4oLmuOP8dWWfTprRb8VbHxdw@mail.gmail.com>
X-Gm-Features: AclHuK-nKpWzWnf_ehGUOGNEqkLBaBeTpBcvTscSsSlzGy6A2o8V0eQ6wgxgdPQ
Message-ID: <CAL3q7H5v8Q-8Be2eRKszfmi4Rh4oLmuOP8dWWfTprRb8VbHxdw@mail.gmail.com>
Subject: Re: [PATCH] btrfs: return an error for unrepaired RAID56 scrub sectors
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 6:05=E2=80=AFPM Cheng Yongkang <teel4res@gmail.com>=
 wrote:
>
> scrub_raid56_parity_stripe() returns the leftover value of
> scrub_find_fill_first_stripe() (0 or 1) when it detects unrepaired
> sectors in a data stripe.  Scrub callers only treat negative values as
> errors, so the unrepaired state is masked as success and P/Q
> regeneration is skipped; a device replace can then copy corrupted data.
>
> Return -EIO so the unrepaired sectors are reported and the corrupt
> stripe is not treated as healthy.
>
> The masked-success behavior was reproduced 3/3 times: baseline scrub
> returned 0 with "finished ... status: 0", left P/Q unregenerated, and a
> device replace copied corruption.  With this change scrub returns -EIO
> and the replace is canceled; healthy RAID1/RAID5 scrub still succeeds.

This information in the last paragraph is rather useless.
Rather than state the obvious, just check why we were not returning an
error when we should have. If you checked the git history, you would
see this is a regression.
Also, add a Fixes tag identifying the commit, as this is a bug and
should be backported to stable kernels.

You should also check the for-next branches (in kernel.org and on
https://github.com/btrfs/linux/commits/for-next/) before sending
patches, as this issue was already fixed:

https://github.com/btrfs/linux/commits/for-next/

>
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
>  fs/btrfs/scrub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
> index 479c0e0..ba2e27c 100644
> --- a/fs/btrfs/scrub.c
> +++ b/fs/btrfs/scrub.c
> @@ -2250,7 +2250,7 @@ static int scrub_raid56_parity_stripe(struct scrub_=
ctx *sctx,
>  "scrub: unrepaired sectors detected, full stripe %llu data stripe %u err=
ors %*pbl",
>                                   full_stripe_start, i, stripe->nr_sector=
s,
>                                   &error);
> -                       return ret;
> +                       return -EIO;
>                 }
>                 bitmap_or(&extent_bitmap, &extent_bitmap, &has_extent,
>                           stripe->nr_sectors);
> --
> 2.34.1
>
>
