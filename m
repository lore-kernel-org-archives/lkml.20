Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794760344;
	b=Y9P6Hemv3RD8QkNQmCA+4P1Uy2rDXvJIEMThTEYLlH95LOzfP6ii6sV0hNKYTTIPHrSV
	 XlXfRjJ1EZ9xuQc0KYwRGITqOfpaee4vY6tcbCqVoON5kcyU5dsmPLIt7Chh6UuWY+Cij
	 bMfOtx0TwxSrahzgylFF0AKAaEcYh8Inx1pNju3686vODbfFvw0mambQwCFmdKiw/5/k9
	 ITkfrz/XUylm9lB9TB5Og1BBICi0gDlKUWXrLJEx1Cd8yQXWDqEeBszbHvPcn861f8VTV
	 PHz7bp+p8PTwdvbYdZ7Metql1fAgfA6maaskPByBFxwAfChc665cPOsfkZNQzXNd3Bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HCckTMZyw9OTQXV/bGloDIUtT2tzhoTG4aHw0IiDKVk=;
	b=PliPpAEjRAHK5WJcEHL5wA6fxbGnUX7gGpzZhSi8KKVvEhzvMhI0ZBbi7Qmlj43C7rBx
	 ALLJt5RJ0krrMRyNMYrfNCbkazoe6YjTir3ZVq8kzVkB2KlVW3eAhwsE0pzviUk+FOODh
	 b70ZauFWaREz3blG6Ir54/1AfaeHfPZRuVlBvmiOJj5+P2bcba2416+EAmviXgB1lCYWn
	 suExsDL9JbWl7cVqzcB0qXvQYGtOic0JbQWVll/pRX2l4POI6ytMOVRZV2jpLhCkFwX+H
	 mrigRbYUtI5fDTP0VKfXesd9tvQTkpiwoem+909MUQwxu4KMF/Eghpn7dFWPhEdGqVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYp+F1J9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179EF606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 179EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYp+F1J9
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ad5529ae64so26772661fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:32:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794760342; cv=none;
        d=google.com; s=arc-20260327;
        b=feiywWpWbbxW+MfZiw3QxRBRJPp2fE38JWe7gmfqfzaqm6DvtzjGUoNCahWEXTulWA
         WMQRJ2rYz25MpAg1o6bquVFxcVu3/n5bpfJpTQC2p45wO448qRBxZKLmS4MO98r2vF5x
         ig0YrFcJK1HomRBQkcwlcNP46qWdJclaq76tEIsqmYkVK/JROKtrY3nC4rA4u+/HsXa2
         xyeJz3ILbW5wD0GreGP+KlPRbNe+ml7qjWCqB7QtLynWNJei2wkr3hTJIzh7O2CwKZuv
         SarYCHSOhXlZUFojSeK4EtVcLi5eSKFKLZDZ2TtQ8joZOfdATCJ/UfiEVCr2WfZIxFDd
         uqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HCckTMZyw9OTQXV/bGloDIUtT2tzhoTG4aHw0IiDKVk=;
        fh=7Y+NCbG+QfDbBsshIMyiZPMaaJJPNdvOqNZarkLOxAg=;
        b=m6pRrg37dmVST8s6XhSp4PcfGwfzPrLs37aXv2w5VLLkeVHtXMhaMA8pWq91EZlD2o
         3Kyw8UUSbVaKBBtZrzxbHgtjIEe3M1bXaqlOmGwPVO7+0X6jI6OOHPTQ6rGlCLV5+mgm
         eLOCMJwRq9Fqfqr2vN7YVMBN3WcKoqudTg8jpKHIePcAjCsNzw8pVfH3djLsRktBiBJ5
         WmyA5Egf6c04H1ewHw012/f/1cRci0WMc9rl9Js1LfrK56374NU9/ng7sP0FxHV97uW+
         DqkrAIWjyY1ovlURE+ICRg+bz+8kr4vdqyOSjbN9bsKxoJC5FeB9yIiZCko48p+s1hUY
         cIWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760342; x=1795365142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HCckTMZyw9OTQXV/bGloDIUtT2tzhoTG4aHw0IiDKVk=;
        b=NYp+F1J9iTTjv84uTPpY4S2uLIwXNbEw4wuiolygEReixpaCKk+U96XDGXrigDbrdG
         uCLajIYdhC+tiqT996FV4pUT4LyB9iTW3rmvfIR0Midpnd4KdZIul6XemJS4c8rbLuVF
         vVDi8DrGgOSjVOskzqHSk9tU8oAjUlvCB4Y/899ITvaaey1Owp2OTiOx2wDicUJL+jge
         JPRGVUKURhtIpWf4FNr9C+VgbRbKTdfQ0V3Tc9lGRwhPYYxWmh+fnptvSfEEZZQFEkiY
         uBMT5FgOEP23H1cE97L3HRWnVm4zD3FSLy+FGANOg4Le5pUinBX4+qbe1TDKPyxd9YMK
         Gqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760342; x=1795365142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCckTMZyw9OTQXV/bGloDIUtT2tzhoTG4aHw0IiDKVk=;
        b=efB8+CdOmVct0YGHRe/ViNj77SuinYBB+Q8PEJGejie7rDH6HTz4X8qWYSbI2lc9xt
         HX0x9l+TE9TuaGDXvL2pfOha4sqkMDkKmRFnNspk5RCrZ6XgthGJEjOSgc3FBGSfvNDm
         QMxy5eSEi8AGEBLU5mBn2BjkP0Kd6uxW7yBqHNZmEfiYV3j1xoErV3T/mLjiOC8Wz4sp
         C5eSzu8iHr4jSpfoyg/vjg3Gty8g2uki5zLpc9qiXN+gdaPIHiJda4obAUbieZSuROhh
         153XuDmiawnPdB7mEO+AFwitFEpc61ZjoODvpv9iR+G548tg3HNHKf9HLBPXSaMkMHxn
         UYhA==
X-Forwarded-Encrypted: i=1; AL+hErEt0ClXMwyQoQbkrzMEtk2O89JREVprblxOZn4ZNpt/5JmPC8NOU3w2lOsTVeYFMbALBaGpQXGDg5HomHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RSGVmwWStVhXSTfR+x5f/VjD2pfHOQQYVOoMs3jeSr3i2EFdH
	Xm3ZeMpWSRHQosP5rS+wXNZXK46LTuu3m8H+dRO6Krb/b2QP8xDIZiNg7R/RXZ9lVrEydmQ0g/r
	osVbvzzP7trOV46inc6XXeRmAghtvFeA=
X-Gm-Gg: AYBFou1gy7Ml40jTbD+EJpgXv6Uxm6R43xfJM8txOM/8ELW3hfz6r/GW4YuOVsSWew0
	8VfmfIMGqHz6yqiW4BzJ/v+WciMBOHagndae/sgSTWcJV7FFR6GW3S03bmkn6JoXK6rrDPSDI6T
	07qjv6Y2DGpIJaA4NnPkC+66OKjQPYiB936TcEwisW6xOY9Gmna9H4oHj/CAgQ0dmBX+/2g/8Sy
	Pm6QmhfOxvaNEcmVU1duJLCIL5E3AYi+hKiHnEqEtbEIvL7b3zAXDdFcw78eYCGvEUkGs0tqxUu
	H0ITNG8ClxVQM4nXE/t3UJobYEoPuoQxAoXLJ6C0jx48Wm0KUnvGHyw2DMNkraOVRZTe8weBdL1
	jrxEM/SFt3XTTnmh2/cnewSxj/9rCQKyC/IiUc2+DKpX/hvPUwm6CbTZWSMbjYi5yhXjfLCbXUw
	h8/IZNOxqI+OXhtidGUEr6jf5T4+0waQEMWy7H7+55vU83yr9R6D2n
X-Received: by 2002:a2e:bc8f:0:b0:3a9:74f3:17d5 with SMTP id
 38308e7fff4ca-3ae2b41f644mr24359841fa.3.1794760341961; Sun, 15 Nov 2026
 08:32:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115103809.1288167-1-linmag7@gmail.com> <20261115103809.1288167-3-linmag7@gmail.com>
In-Reply-To: <20261115103809.1288167-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 15 Nov 2026 11:32:08 -0500
X-Gm-Features: AclHuK_dFmtmC7padQ5REKLjC77pZXObwKP22hGWvwh1YtR6bmvp3xOUehZ7QRc
Message-ID: <CAEdQ38FBKRAnFxWS9uQ3eAzByT8rKqzuQsAbPCv6Zhff=zF+RA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:38=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> Use dma_alloc_contiguous(), which rejects non-blocking callers, before
> falling back to alloc_pages_exact(). Pair both paths with
> dma_free_contiguous(), whose buddy fallback uses free_pages_exact().

Right, and the !CONFIG_DMA_CMA stub does the same since 641a9b9cc697
("dma-mapping: use exact allocation for DMA pages"), so the pairing
holds either way. Just something to keep in mind if this ever gets
backported past that commit.

> +     size =3D PAGE_ALIGN(size);
>       gfp &=3D ~GFP_DMA;

Thanks, this and the matching change in alpha_pci_free_coherent() look
right. The CMA alloc and release counts now agree, and the memset()
covers the whole aligned size.

> +     if (__direct_map_size) {
> ...
> +     }

Looks good. Every remaining core sets a nonzero __direct_map_size, so
the check is purely defensive today, which is fine.

I build-tested the series on top of 0b4cadbe7c39 with
ALPHA_GENERIC=3Dy, SMP=3Dy, CMA=3Dy, DMA_CMA=3Dy and W=3D1, and saw no new
warnings in pci_iommu.c or setup.c. I haven't booted it.

Reviewed-by: Matt Turner <mattst88@gmail.com>
