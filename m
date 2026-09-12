Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B42AD03
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789172314; cv=pass; b=r5jWWgrwmJ5p8ZoBusgDCS3GseBylKe6BpHLrGKJwrQUv0K3Zdo84j0wZzAb5T+ywuXRAxTHPHJ4c/57CdsmiHjVqouavbb9JzCkLynMJOv1Q0nL+jsj7FdfcERrDj8Dv7jePO4haWtz4vXm9c7vxX/fITiaJS5k8mIs2ZuekxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789172314; c=relaxed/simple;
	bh=FKzkqU4YemmerA1tbvFMUJ1w1CS/IWoGJw9B7s8wdCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFtADmAj83DjHOcHK8BWMkuIoQJ/Ya3fUeJytaQrM/4abPRKeQ5ZcreU9lRECRvDlgvTveV9TtDaYJrkneASxtroy+Dck83YSkfkZfsYJfboOVzq9jyq08VefhbQVexHAH9G3Ps0nPdpfqiLlAKhB2QbrLzxQe4nIAeK/5SbFOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO1GsG7f; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO1GsG7f"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so17992366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789172311; cv=none;
        d=google.com; s=arc-20260327;
        b=TlVl91u0WcrXJIQt84jPqH/xmtybNf8b5n7zzUbo8W3KtSLwC9Gh8x1hOTQHFM0+14
         aXESSVyqlBToYc2i5qrzyvNqAIddQUWHuRlTs1MVW4yr0IA4JFKfnciCq+lZ/HMGNvWm
         Ya/BOPQFJAc638Xxne0BHABRzTS0c6AYND6T7rdOKEgZ3Rb3ZQV9a7b5P1tkIWzuyJuN
         SiMdWaxkZ1ArBIlYlpe5oVkh04pIPqWTaYg6vebVx/KWsxo4CiIoJw233E1iYjjv+aE0
         Infm7fdp3rUt5jiLYUXgbl5M+0oEhMJO7V+KwSijVQSqOFDigU5oV8vyvvV4v8UzUDNL
         Z/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YaieaN1FqHtiGqiMiCwnr2vc1sRViEs9JV9afuzauDQ=;
        fh=jh7FcUMH+YCq27vwzrvpiOFszs0gVfQW+ByQLUXKd84=;
        b=EW+VU56wgPvqjC/t02WXMQMCwzFTmhfmotf8fFP0MDLC5KCiQ5YY6oEDR4M+tXMCm3
         chdr9LIN7LtNBLIjdZPUt5NmJ430+/4mURfst8lRWCc2Ztw80vkjLj5B7Zmqw2jZbslD
         ECq+tSpo3kJPli3Q3DinHBydtlnet6UgjvygtCn/I0J1JQXMIJd9DucyF0pz2chKmFzY
         rgKN7wYbnxE75ODsmhmqK6wX50lU4W7qmejYmfVrg4iiHrwuZhidwhHCkd3FkgFsoUO3
         Ow9nzhoBFBITB8A5jgU7f72ZuOzFJ5Y/TOUwQSRm0b73kRCTusdJdhv6orDpf4y5asXo
         AFAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789172311; x=1789777111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YaieaN1FqHtiGqiMiCwnr2vc1sRViEs9JV9afuzauDQ=;
        b=hO1GsG7fjV2ZeToDplrFW4r+q6Q5NsE9OBEcL4NRt5bqZpJ18skE54K3vU/daWGNwt
         UaL6nvM8I86/IT68kZ5sbTdZbQ8NV/ABbax7Ybh9GssW8NL7nF5ev6xuUTLuWz14y0ni
         hsMyLDnNhW+BwPRlsMJ0tEcqGMaWqsD3kgsVqeCAJR6HLD0+pVBqPcajKFvfB1q+9O8U
         KvD3s1TocgId8AKf/yllyP/+Kbf9N77V/YaKhI2YOfb65opv/3WR0wUb5N8E34+sq/kk
         whS3sRRgH0qAQhcHhgtwZBJf59Gpn/xZHfiu5fsLtFjTc1m8LMnyq7wh5QPMmqfFdmj3
         mzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789172311; x=1789777111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaieaN1FqHtiGqiMiCwnr2vc1sRViEs9JV9afuzauDQ=;
        b=tDYYj/YPl+rwm/VCVaqNOghWnkq0tnIW0XXFwQxtSYX5yWC3sGjv2N0WKrBh091tC0
         JTeV3SjP4wnitJMtM0YBixiInOMgmzpO7IFIXZpg8zG6yWCPtKfTeGJhgU3cTsBWAqXa
         T3qZF9ID+kzUQHTZ+Ihs4php3dgP6iUSlFbVRdPhZPtFGaeVw73lFvsPL7rtsaJNRFBW
         sum2OMFE4BDbyJgPcrhLnHn7ZotHr3pwxjDzQxV/dbEwyNSKmRcQyfQXG+SjcQZ30SnG
         i2ekaX7+uPk6luBilh4FuP2Vh8KKAtYrrziaxSfWKP/AbAB8Y11CmYkS1zEJ4t2Oatyq
         AX/w==
X-Forwarded-Encrypted: i=1; AKwUvByInUx46XP8G3aMi1cgzgqm8I5CvQqBBE5r97aS9xcFCbfH0OtEMSQNwpsC5IE0oTxxPZVPGJEmAKCbYrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mIyT7kpgpYtSccA50G1mCIvyUJV7Y8Rcx1pMsrGOMwNNBdkugH
	WV6fTUYWhlrj9Zicacht8a5oG/M/Tr/YIUXG/0Se2vnmgxgoMj6cs0ID6ZR2qaZOr/+ooSaMTH1
	5466QzzWRZxYZtD5Rmmc1FpTX53J0fZQ=
X-Gm-Gg: AYBFou2DjoqEhPt9fT6qq52FZbq0gxuBWByfZtrcoK00RZXVVzsVTg6cC7Z1euJ227i
	jbPIMxwSH25hDt8KjdnVxKqs+utSTuONMudj8HyKaLl9ScECqBzlgfbXGv1B40UUzmMpO3nFuKn
	devMkj6UmJAi4PgoE2ke2hIRymahL2MBSDaNhWW40wp38C33V6EkiXGBU9qpg61q22BeG4m/rgZ
	n6k9HaSSJwcuwN8IxG2Z6d8pX2g3u1gI90zjRyh8MqRsZW0GCG/n8f9XMrwZZjmhoPu/ksPbpbj
	INXwaGpQNY4NdR62NXWpd3z9bBRkuu/FaN34btexGHPCgAKzAV+A3euQtKxGmzKkeP7YkmsZVgt
	D5XNucKjVPX89m3ot/y6gNa4dTqmhad//eCByyE0uyEhbvuTj9a6OEGSsHwWcPLIM3/aMlnNDmf
	Ojd7R0z176O7L299AC1Pi+dPYzRF3CXNflr9JxgaDY6pcv1gjkPmgjSnwHjWHqar4jlw==
X-Received: by 2002:a17:907:3f21:b0:c28:fb3f:fe20 with SMTP id
 a640c23a62f3a-c298587f908mr30570966b.30.1789172310754; Fri, 11 Sep 2026
 17:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512010938.41114-1-rosenp@gmail.com>
In-Reply-To: <20260512010938.41114-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 11 Sep 2026 17:18:19 -0700
X-Gm-Features: AcwNN1VjGclVgDXoZc7y-ymy3Y4nPyfaHNvSijxFOUTu1oI1BkyysKJCgXiey70
Message-ID: <CAKxU2N-n-yCL9CbuAzdN7jJqjx1p5noVNuAze3CKNQvHFd8P6w@mail.gmail.com>
Subject: Re: [PATCH] clk: pistachio: Use flexible array for clock table
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 6:09=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Store the clock lookup table in the Pistachio clock provider
> allocation instead of allocating it separately.
>
> This ties the table lifetime directly to the provider and removes a
> separate allocation failure path while preserving the clk_onecell_data
> lookup interface.
>
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Should I resend?
> ---
>  drivers/clk/pistachio/clk.c | 15 ++++-----------
>  drivers/clk/pistachio/clk.h |  1 +
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/pistachio/clk.c b/drivers/clk/pistachio/clk.c
> index 80c722c77a1b..03e28779011f 100644
> --- a/drivers/clk/pistachio/clk.c
> +++ b/drivers/clk/pistachio/clk.c
> @@ -17,28 +17,21 @@ pistachio_clk_alloc_provider(struct device_node *node=
, unsigned int num_clks)
>  {
>         struct pistachio_clk_provider *p;
>
> -       p =3D kzalloc_obj(*p);
> +       p =3D kzalloc_flex(*p, clks, num_clks);
>         if (!p)
>                 return p;
>
> -       p->clk_data.clks =3D kzalloc_objs(struct clk *, num_clks);
> -       if (!p->clk_data.clks)
> -               goto free_provider;
> +       p->clk_data.clks =3D p->clks;
>         p->clk_data.clk_num =3D num_clks;
>         p->node =3D node;
>         p->base =3D of_iomap(node, 0);
>         if (!p->base) {
>                 pr_err("Failed to map clock provider registers\n");
> -               goto free_clks;
> +               kfree(p);
> +               return NULL;
>         }
>
>         return p;
> -
> -free_clks:
> -       kfree(p->clk_data.clks);
> -free_provider:
> -       kfree(p);
> -       return NULL;
>  }
>
>  void pistachio_clk_register_provider(struct pistachio_clk_provider *p)
> diff --git a/drivers/clk/pistachio/clk.h b/drivers/clk/pistachio/clk.h
> index 2f4ffbd98282..1b9b311b9656 100644
> --- a/drivers/clk/pistachio/clk.h
> +++ b/drivers/clk/pistachio/clk.h
> @@ -142,6 +142,7 @@ struct pistachio_clk_provider {
>         struct device_node *node;
>         void __iomem *base;
>         struct clk_onecell_data clk_data;
> +       struct clk *clks[];
>  };
>
>  extern struct pistachio_clk_provider *
> --
> 2.54.0
>
