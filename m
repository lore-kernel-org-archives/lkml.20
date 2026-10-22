Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660540;
	b=0GgOE2/3XmjxmQCskEaOy/waoVzHLxeZ4X2+f02ysm43UAE+/RR2/Pkm7lQbvHdtFG0m
	 KobhZWH5JXf0TK3vbGCnC77S/zaLIEuGzh3/wJwMJGHTSKwDiAFXWvSgIjjXE9wkgEwgE
	 fl+ktl7yHAeoeFstBDX/onFh4/3txbJW6oQuaiHTQg3SH2VAL6oebX0V2jkbIl5o2Fa65
	 OcEngdUdJUnT2UOjVIivsvHIb5vxRcEE2D+aS2noE7vkx9wfntW++SpVvU38vs0/NQXy6
	 Peh8cZ4YwnLZn+1EMhuZ6OrkL3bDttkDcweWqGjdVmkNBJHviucnZXeVLXCHItIAI4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660540;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dAtGHKvYVTH00WDKTEZ7akrxcfMPHzXwthZt16huB4U=;
	b=GV8WDnfNuynqveVUhMVpeN770kN2hGlc2WR8pk4eE7K8j9ZIVGek9wWBHkpMbqbbqiOZ
	 zWqM9oTbbS5dozU0TQINrO0sA7zOge8aanYT+0LYdaHHpgYogYclhqWFxj+A+toCOtNmB
	 GxwOEt1J7tmTPHmz6gxgPZKTUO87pkYKN3tZklIRTch9GPFyr/JbG5K/ByJkwB8v4BKUz
	 vQtEVuTOReeLIHlpNHagQKKU2uaVlwDA5ekRCms/UApTLgjCLakGitQq/J+M+birTum4z
	 ozIlkzWW7XzZuPnF7Cs+GJ/LcCePIEQd1R5WJ0WaJWhmajkjXfw6OzvjNnNxp9PRCQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B440606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B440606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1162662e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660538; x=1793265338;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dAtGHKvYVTH00WDKTEZ7akrxcfMPHzXwthZt16huB4U=;
        b=upXqHKZza7yN00xy6KplFGrvzQNxQSY6bgPyj1z5dpIYhOg69vICIAgYh9LkbTsxTm
         2vT9DI/QaSYZM50omOTfd+bZeuHiNWLtKEn1P5xXvTNu9lXOO4FBX2+otsMmz0try1cB
         IEq8zHQ7X87LbToSznXFCTzSJW9ft03gvNphQAW66r7Qi3ny68ryCzRocKiD2jBTvg11
         GPAWc7iDCMVD7nh/65EnXtNWI3AX8i8BL/l43nXUyXpje9l5ijgfqs0gmGdarMxUYc//
         mJ0E66YKoyjX2P3jLbmJgj1R9kNCRs1r7YNr0UWQtDvfuqQzZvKVfgR950aWVQpAeG83
         RQsA==
X-Forwarded-Encrypted: i=1; AKwUvBxHnaxoaJQIxkKnaIs7/uwz4LClLglnjGagraJArwsloxrcCdxyzSrZ3cJvIOqW7yBi3kvfwWU0a7gl4CE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOISwaWuA4Cbvw2oVADLcWmHC58/UdXHynh45/iUzrP0f66uGJ
	CD+TYOWR8TvtsMmjzA2zOvUEyejClwT9i6x4pnWCu+6unzXtBJSoV4LIDdqL2t6s
X-Gm-Gg: AYBFou2RCuPu/0YIPuI5DCmZEXrl9Or9hX1ycaGJifRZgDM8ltGRu9rdwF1NyWdQoRT
	8QBk4RRPAn+2Hxc/YYNZHn9K1oTo97mo8QtJnIto2D9ZjSotdygRQ47fHOe1a0lSbGUj5qbuDh6
	5KBB8KqwfH5AZXzW/UVlbDqLxoiBRveHUF69rJZqnDvVizpb/fcKt5+7nBEQL5QCu3EqByrTcfT
	TAmq9Sn9MDrA4iXAWPUwnCg2hM5wUx/kJkgClwQYpLHYNdyRhwvvEKz/2oMzfCeMVBll3OMVsxI
	5mNglaxBd8buvDc/FHvi/LznN5mBcutkFL9iMnjtcBtXvaAJngpG+eFgiHqCQFkXBDR7IinwohH
	/P4Wq3cQdX/fJQsdF0d7TLDAgYYwLtnn2M4KMSXNZeZp986Xa3jtBQMqVFq2C3WybXXEVW3eUO1
	0omD8KcSN85uGNXDTJxnl4VbIJHyjsfLys/GZbQtDS4+yaYFkjXXKxvC7ZThX7EcZNWCeNLo4FQ
	v2ZM8pJqH3p50fXg3YD1iPNplILWL/gwDDMJXZQf9eVf30dYjHeM27eFxXdXZuX8OrM2cXZsjpp
	wvLFDXzR7lzCLdAGAGvFu+IlsS+sKR5/2qLNvX4=
X-Received: by 2002:a05:6122:551:b0:5e9:6d96:a598 with SMTP id 71dfb90a1353d-5eaebdae792mr2044627e0c.6.1792660538545;
        Thu, 22 Oct 2026 02:15:38 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983a9aesm6114952e0c.16.2026.10.22.02.15.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:36 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7ccae9f1a9eso239389137.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOvz/XzJiUGU2VnqGGaWaR8WwJK+e3qMi9//v+XncDr930alpbKKWPvHNvsfYV4iH086r4dE4VRJkQsD4=@vger.kernel.org
X-Received: by 2002:a05:6102:160c:b0:7cc:1a41:20fe with SMTP id
 ada2fe7eead31-7cc926de9b8mr1860786137.25.1792660535752; Thu, 22 Oct 2026
 02:15:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022044135.275485-1-artem122novak@gmail.com>
In-Reply-To: <20261022044135.275485-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2026 11:15:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3dpM2D+6YTv5Db_Y+ZFa6e4nsB6mN0XjgNGBh=ZE5XA@mail.gmail.com>
X-Gm-Features: AclHuK_4BpDXw1ghhrrGwm8j_I-lCmzvQXgOFhpdarQQS7IFAgX7Ig0jOu94rnc
Message-ID: <CAMuHMdX3dpM2D+6YTv5Db_Y+ZFa6e4nsB6mN0XjgNGBh=ZE5XA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Add SH7305 support
To: Artem Novak <artem122novak@gmail.com>
Cc: daniel.lezcano@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Thu, 22 Oct 2026 at 06:41, Artem Novak <artem122novak@gmail.com> wrote:
> Add the SH7305 compatible string to the Renesas TMU Device Tree
> binding.
>
> Exclude SH7305 from the mandatory resets property, following
> the convention used for older SuperH TMU implementations.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
> Changes in v2:
> - Rename the compatible string to renesas,tmu-sh7305.
> - Sort the compatible string alphabetically.
> - Exempt SH7305 from the mandatory resets property.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -51,6 +51,7 @@ properties:
>            - renesas,tmu-r8a779f0 # R-Car S4-8
>            - renesas,tmu-r8a779g0 # R-Car V4H
>            - renesas,tmu-r8a779h0 # R-Car V4M
> +          - renesas,tmu-sh7305  # SH7305

Nit: the "#" is no aligned with the other entries, please add one
more space.

>        - const: renesas,tmu
>
>    reg:

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
