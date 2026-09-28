Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E034078E4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575594; cv=none; b=XK6esxD+O9vKEZfV+TBaP3jG4gUFDPNnLnE5MsOPcs3fwOwlk5X2/+8l8pwegwpNgb/Zfoe36su6BGI69RuwfCDgdanSTs/Bw+9j/5nxxLET+/sNWEweTlB5zBYWkrq/tWuclHel8L7wawYW00a9Qsi0qRHlVMwJo1lRkDUK1SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575594; c=relaxed/simple;
	bh=sNYz644h6sGLWEAQbLDi9ciU6J9MsWOoh1EmTDC2VL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hldkz+WrT2CttD+b5dDYMrILem1M9/o8nnVSukJhztwCl7qJoLVZ87KhIRCJynESRjOoO6U1k/EehSaIcVQcwckpNFNXDMpcdbdpZ165JzDfu+ZDnHftid0RenN+WWQ0//aQSUvdgpktiQgzA/qa60DzjpqSKvNgHwX/Lyhanqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiR35QFN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiR35QFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2061F0089F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790575593;
	bh=OXLr7+E4dU595JxZiGB+0CgQXdpJyxw7uq7+O1c8tt4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HiR35QFN0blJ+lqS0ryibvdb3UA3/66y2mi0XvdHonRkFRVixY424DYqL6jsx0sU5
	 oLm5/OrJHH8MSRVDcnBgXsBuOF/sa3Y1hUrkdBF9C/TLWWNSgTImW8UU8LMRIV2afm
	 iWBjfDCBiR+57g/+Rb4f+65orIIof/vsgovDklFDi2M7jXwwh69P5lJEvHd6UbP/Pk
	 gyE95sGMBTqENHqDXvvF8tGBKt/FebhhAtMd+wPRubcb35BMw4nKU+nlJym9OTpnRc
	 n6+HTV8MU29JclWki7JchesXxz/gAWgcx/fRBj7rXF7hfT6ktwgsU3XOsdv6jM8GCI
	 9rLbMToctc89g==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dcdc386ddso103518666b.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:06:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/OpXIPcpOdPu3kjr83hbiAMesjlZq50H7LV+z9rU1YQHIRGQwkapD+S5fGfFnJFCuY+d7AtAlWBebW8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpx1J1qqdpdmXo4FBzRjX1gXtA4NWOj9t4MXWbXknCJBoYfGh9
	hOh+0H9admLEG2pHat/RmZmRfhS+dR793YaxbyOcR+I3JCbP2qJxwXfpV4dT+jMWMvindfj+XmM
	YXkmYO8WUvt5BV8qOXWMZpNPXzCowUhI77UdoOxbMyw==
X-Received: by 2002:a17:907:6091:b0:c29:f5d5:5aa6 with SMTP id
 a640c23a62f3a-c2ac24d0b7amr982485266b.48.1790575592442; Sun, 27 Sep 2026
 23:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-12-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-12-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 20:06:20 -1000
X-Gmail-Original-Message-ID: <CACePvbWx1F6Lyr9EtUpfrfQUO7zqG_6mW2PNEXNXrDgwjr-vUA@mail.gmail.com>
X-Gm-Features: AclHuK_qTxqlktk7LrMSAhuqzolmpbDtpL9nH79YNkCpgy3Im6cg3WLSZOD5r5g
Message-ID: <CACePvbWx1F6Lyr9EtUpfrfQUO7zqG_6mW2PNEXNXrDgwjr-vUA@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] mm, swap: require zswap for xswap devices
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, kasong@tencent.com, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:21=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> =
wrote:
>
> xswap pages live only in zswap. Without zswap, swapout cannot free the pa=
ge,
> but still takes a swap entry. So the device consumes swap entries without
> freeing memory. Fail to create a device when zswap is unavailable.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>

Acked-by: Chris Li <chrisl@kernel.org>

Chris

> ---
>  mm/swapfile.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index cdcbcbaa6d87..cac084bc72d6 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -4439,6 +4439,10 @@ static int xswap_create(int prio)
>         if (prio !=3D DEF_SWAP_PRIO && (prio < 0 || prio > SWAP_FLAG_PRIO=
_MASK))
>                 return -EINVAL;
>
> +       /* xswap has no backing store, it relies on zswap. */
> +       if (!zswap_is_enabled())
> +               return -EOPNOTSUPP;
> +
>         si =3D alloc_swap_info();
>         if (IS_ERR(si))
>                 return PTR_ERR(si);
> --
> 2.54.0
>
