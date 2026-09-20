Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D362DB789
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921206; cv=none; b=cXaHJYWahnjc6XB+pprt+8y0lTEeANHSZLteoNursLhFq3A7pdCvOkLcvRKg/Y2aCi7ybkb9fWxOITpZIjXFquzmUQ44PhbdZ+2sEKHXDA+uiOsPH3pFH8Le1j/zWAinbDxvbgLxPUpt1VUVIERD4d33BOvZV44GFB5KsciMmXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921206; c=relaxed/simple;
	bh=EUXfNSfXmsfcClxGTob8jQ7hc6OKPD6XOtCNiRT4+AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pv560OG8ATgCS/uU36jI8CLdI5ZW9RsQ1inmNtkZuDTRKYYun9xFWNZM4z56g0BYj17vkoQKYk2Ic+sOxn7ndGvHtwRuNhjckPw4ucc9qkQx3v9n6vfnc+GC3exF3SLF4xvaEi+xHKNEIF38qruWuqMs/fZdPJsjOu6oPshyDxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsJrsIe3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsJrsIe3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E5A1F000FF;
	Sun, 20 Sep 2026 16:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789921205;
	bh=jK553IrpM98vjc3mJ5BVYHVYdEvEL/E6RFwMF94GTDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RsJrsIe3+gxaROcCXw7u2ScsPPYEzut862Ivg0w8jGwOWUQ8JPzJUR413U3AgccW6
	 9fImP0/sNhhGVwp3Os+oZsbb6UG+kSDKGthoYx1CSQ9L2OlRI/OOA5/gBwPiOhd2EU
	 qW+nVfduQ+U+MWf237f6GRB+4O+NGK2RLNx21MyxufoopWyNXiJk1axhG6g4vjY58E
	 odhGfd+6eSE3JS7oh3oRvSPVOcm/hRdmtWvkEoIf8L4A4ohI/jAtW4vFs6CyrzNl/O
	 FBv3JNMh8nWblbSfOM1Hqbj/mEvDGUJ0lQjSBhnN4gjrSVhP3LubyupkCd5hzvUzG1
	 TuXOVMOUWGnpw==
Message-ID: <0a778130-1e88-4dbc-b3c5-346195b54701@kernel.org>
Date: Sun, 20 Sep 2026 17:19:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: core: Fix OOB read for bit offsets of more than
 one byte
To: Janne Grunau <j@jannau.net>, Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
References: <20250901-nvmem-read-oob-bit-offset-v1-1-b610e18cdd3c@jannau.net>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250901-nvmem-read-oob-bit-offset-v1-1-b610e18cdd3c@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/25 8:29 AM, Janne Grunau wrote:
> When the bit offset is BITS_PER_BYTE or larger the read position is
> advanced by `bytes_offset`. This is not taken into account in the
> per-byte read loop which still reads `cell->bytes` resulting in an out of
> bounds read of `bytes_offset` bytes. The information read OOB does not
> leak directly as the erroneously read bits are cleared.
> 
> Detected by KASAN while looking for a use-after-free in simplefb.c.
> 
> Fixes: 7a06ef7510779 ("nvmem: core: fix bit offsets of more than one byte")
12 chars sha pl

Missing CC Stable.

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/nvmem/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 387c88c55259541446901f0e539bbb0dd8c4c3de..19be16943ee66e845860192b8f008539873f6f7f 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1618,12 +1618,14 @@ static void nvmem_shift_read_buffer_in_place(struct nvmem_cell_entry *cell, void
>  		*p = *b++ >> bit_offset;
>  
>  		/* setup rest of the bytes if any */
> -		for (i = 1; i < cell->bytes; i++) {
> +		for (i = 1; i < (cell->bytes - bytes_offset); i++) {
>  			/* Get bits from next byte and shift them towards msb */
>  			*p++ |= *b << (BITS_PER_BYTE - bit_offset);
>  
>  			*p = *b++ >> bit_offset;
>  		}
> +		/* point to end of the buffer unused bits will be cleared */
> +		p = buf + cell->bytes - 1;
>  	} else if (p != b) {
>  		memmove(p, b, cell->bytes - bytes_offset);
>  		p += cell->bytes - 1;
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250901-nvmem-read-oob-bit-offset-dc1c2f39af6c
> 
> Best regards,

