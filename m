Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704006;
	b=hKSBQA109aiRagZ1Pvc0NZEhHhq3qpQu7vF/QLl75FbrUnSLeFjqCI2fCKWn3WsXceOY
	 UN2Vk0St6d7ezyy7kKhimGmOTKM3VQu3iXPw4CxmqA7/eOW1aaRvPIwngz/Ju4WpJgF82
	 J8Ci6qftpdyKTZdU8VXvdTuLT1CEbxamW6pOaM3cAPBBvxOy/ObGVhObe6AzHKHb0Ryue
	 lzNZU+kVNk0NAKKXrliiDKn/4gwcG0V1Nrsc21wGSNt7P/96vVmkn+vS0PyzEes6JE/ln
	 SM/6a/YnP+xTM041y1dNa612WHP0Mi8CYZsfHEJQSSTRS42HV6dLgdl5scvKpZa2wTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N/WKx1dvlKtMTD6b1Dkde2yUpnwD8vYx6xMXPAAWNvY=;
	b=g51eZsXZYWBAO9aOk5U56OuCjTR9qr8DrsSGNh6JiMIWIVhRgr4+7SaVDDSOgzvSeZK/
	 4MZXHe7ZzesLSp94oT7MFzLJrRVKdQUp1oyWy6VAEJqta+bjzQlfNFBiU7ZsCnh0ccsOs
	 +xBz46j3iXYDNsyg8Nq0l5muvvrow/BnM0Mc2vtETfo5ZKuXhY1n1+Tlp67fvS7WmpkA8
	 100rTKJ+bhmxycg+Q8Q98Not6XPbHISTvpMxrtkGpDTIifoDqCwHx0NDHDEBR5VL0cKEo
	 PLMaLkk0Doq7wSQVgLVHb9y7c1IIsKUOlpBrMinbFrFB75xqEZeGikURPWsR0gw01AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2DuDTks;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04696606F7E2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04696606F7E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2DuDTks
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so5737499a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704004; cv=none;
        d=google.com; s=arc-20260327;
        b=GRuHgUQWiZlwo1O+yDiSq9D4ZuJJ87cYV7HkeinTnf4Kl1FzyUyLRx5ByZKfv2LSkI
         gP9l0nIuMatm374BKT6BoA457uTq6uaheOdDQlMQE3xFe0Meq3Lg1oIcczoiXpFC3RmM
         T/pDLTXrNJddbeQ+u3iYZ1eYY9yPm+ZXmzbzjWZ1oQlmlRxrvww88StI6haYFzN8fHHJ
         klb1/if4fcqVqv1WRAZGbjoDCOHQ0n6ZUCk6s85fUkPS7A32K04O6iswx4bUYq7uycbb
         qghFTODTunVu2Dq6HnZcEPQhvTio6CBzDooHVT9PcTclHfZYzsB/s4mSmYcerpzzU5vq
         r24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/WKx1dvlKtMTD6b1Dkde2yUpnwD8vYx6xMXPAAWNvY=;
        fh=d6jpu38JUtlH0UHXGJrnBzudfBPSZdqTyf6CD00gjcY=;
        b=jwykJhByZ8GSRBkxAtZXOZMUC+1Xkl5Rw+cHORZ4509AMPVEJP3x9+qiQNUgMhWuAT
         KxAu5WagEVhD4c6RDiS/ClL5uZEXtPnNdJNaTJiISkyTqCRqgyWaqXhEuvfWiI8y9WTs
         C6jnp/hdQ7EW8uVjqI03fxMbl/WRE82/s9W9IE2/0c4pU6q75VnLbtunwQkIQqQgJ+Pk
         cVfCp26mxZIa8w99XZaPPcQa3ovhgZvYZM8au9Vx4oPEQzwBtCnzPgjGGhc1J/4DUdN8
         X6oAwaa8I+qI3ItZJJiWzCV27ha7cPHayC0Mrsi7HsGeVWv7F74tEzrbQj2yHP4m3cUS
         meHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704004; x=1794308804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/WKx1dvlKtMTD6b1Dkde2yUpnwD8vYx6xMXPAAWNvY=;
        b=e2DuDTks/EEje4+iKJ4BABVZzNrwOnegOge1hHHgecVPwiDRr4fOBm0m61f25X7hhj
         Zn6CoXRVW3jcobR3CuamkshJei9lB7lEcaJpp7Jx4cBOy625g4IDmiSNuFiX2zlmRBMr
         4qBgBoTbLKoxoOxtYCDdkuXNujW8sOn6jY8LRGc5WUjvsrzaZXcg5oxssAhGQPjjMlaY
         u4HMnASC9Q0xzwoKxXGcQDmwhWaqByiLyQ+jF8i3Ub0fMT42umomyHypNEg6Af9vm2y2
         IgB9hjbkL24D4/3aWMk8Jz7o9v+muD97ppQ4Keez2hLYE0d//zi2SRqUTjZad2xG1t2v
         eVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704004; x=1794308804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/WKx1dvlKtMTD6b1Dkde2yUpnwD8vYx6xMXPAAWNvY=;
        b=1rNdsmYwCsORxK2eCc8CsGFtJi1obxuwfvd5hr9Jp8jBy/ZPaYc0OhwuSkTJNRRjgm
         +prIUck/P0I99BepuwVBu6+k5utIZATLQwwevCTYmVwj4tuEQD8OtnszjM3pN6SMlJud
         3RbuT5X2tvJTNyaTF4u727vebbnmEwM93x229x13xXoY3vUIpriKIs93fqTpND8m2iaE
         Nq+NkBBLUnRtGK0Dye+cU4U3tRQg4w9dthy66ajiu3ZQ2Nv0jGa0vzOTzv7xHL89j5ml
         CYz9cgkil+s4TTovWvw8wn5J4BsJ4tTFCe994SEYjFzLN+Q/ks10nWHVXfyYKGd9+xSp
         IndQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmUdSHp+5mBnm/JWtixgY+jrz/I51LM1JQmcIbzbWP/O1Z5OTFoBNQdGu8wb8cqpt2LMoleYzH3i9ZIXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+loA1GRKkl55wUelhVBsciaugUY8VELg8oyDgChhHstn9C7w+6
	IW+NGrbOmFGfRQhZZcyaf9+dw/rcUJdV0uzbKVJq1llKh31o7ih+JfoFU0Tk7KuOwtrFa2zehV5
	0lhx1bgFm4Y7jO+OiP4u9QGRm3cq5FTk=
X-Gm-Gg: AYBFou2yI5sYdt/FJN2ks/Uu7sjwRNeYOkt0etv6i3bwtKEpeE7ltqdzUexfpgqDoxo
	w7RwIJttvY08XBa05WoOVkhyQzNdjkn3aMvfwU0O7X/JrYf5hvRQxtFDsm3jar8fKCWMqmKkWvx
	6kynwDJpDrBBQs53d62u7v4uLVo1GY+kupeBOahDcKAnMa/mZ6vcX/ybrdrXWikHOX6KlzAURhv
	UuE8fbdoklpMxaSzR6XCCgijG/IICiDxKRyiHgnBq5H7s11HsePeOcmwyccuoeh4vZfJ+kxCTuZ
	GeNdZTCLiw6I0b8GTMlyXFyoMKFfTo35OsDAkp7k9SVf4XUcJByLYBH9l0FjcJPM03Tm84Q6Hcr
	9xYSxf1Sk3M42zCTCe4wWXZFMiPO3Z7hZyTvWfHKZHyx3+4lwcr6Gl3gUSF36SHqdnzad4akYFQ
	JEjIMX2yxfBzhtB8ZkhLUTIA==
X-Received: by 2002:a05:6402:428f:b0:6ac:a862:d8ce with SMTP id
 4fb4d7f45d1cf-6b4d428f81cmr8567727a12.7.1793704004167; Tue, 03 Nov 2026
 03:06:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
In-Reply-To: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 3 Nov 2026 12:06:32 +0100
X-Gm-Features: AclHuK80yRCm0o-1xn8zHa6unhoXxUoLu6bQm-m9xx4ZQebfzMiUchQkkgUNT-g
Message-ID: <CA+=Fv5T0NE3LiTEHtwORHzz=0qv4xkRxY7iReU9KQ8MQmcRPmQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use symbol assignment in SYM_END
To: Linus Walleij <linusw@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Nov 3, 2026 at 10:09=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Alpha uses the .set directive to select assembler options, so the
> symbol assignment emitted by the generic SYM_END macro fails to assemble.
> This breaks COMPILE_TEST builds left and right, e.g.:
>
>   Error: junk at end of line, first unrecognized character is `,'
>   Error: .size expression for bcm6846_runner_start does not evaluate to a=
 constant
>
> Override SYM_END to use an ordinary symbol assignment for the calculated
> size. Preserve the symbol type, size and local size symbol while leaving
> other architectures unchanged.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611031620.n4ptlpo7-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> The generic SYM_END uses .set for symbol assignment, but Alpha interprets
> .set as an assembler mode directive. Provide an Alpha override using
> ordinary assignment.
>
> Tested the unchanged Runner wrapper with an Alpha-targeted GNU assembler
> 2.46.1: the original header reproduces the reported errors, while the
> fixed header assembles without warnings. Symbol sizes and the embedded
> Runner bytes were checked. A full Alpha allyesconfig build was not run.
>
> This patch was prepared with LLM assistance.
> ---
>  arch/alpha/include/asm/linkage.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/alpha/include/asm/linkage.h b/arch/alpha/include/asm/li=
nkage.h
> index aa8661fa60dc..a3f0302c92d0 100644
> --- a/arch/alpha/include/asm/linkage.h
> +++ b/arch/alpha/include/asm/linkage.h
> @@ -6,4 +6,12 @@
>  #define SYSCALL_ALIAS(alias, name)                                     \
>         asm ( #alias " =3D " #name "\n\t.globl " #alias)
>
> +#ifdef __ASSEMBLY__
> +/* Alpha uses .set for assembler options, not symbol assignments. */
> +#define SYM_END(name, sym_type)                                \
> +       .type name sym_type ASM_NL                      \
> +       .L__sym_size_##name =3D . - name ASM_NL           \
> +       .size name, .L__sym_size_##name
> +#endif
> +
>  #endif
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-alpha-compile-efdde587115c
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

Thanks for fixing this. I reproduced the failure with the unchanged
BCM6846 Runner wrapper using Alpha GNU as 2.43. With your patch it
assembled without warnings. The start symbol is a 32768-byte OBJECT,
the end label is at offset 0x8000, and the embedded bytes match the
Runner assembler's output. I also cross-built the kernel and modules
with my ES40-config and CONFIG_COMPILE_TEST=3Dy.

One related observation: I tried SYM_FUNC_ALIAS() on Alpha and hit
the same assembler error because the generic SYM_ALIAS() also uses
.set. Maybe that is being handled separately?

For this patch:

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
