Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310409;
	b=hO52GdP5CXj3kWvHZB1NVji3h1m5mI7dkgH9ceIvmzp0C3q5SsHuKIV4YnB302OcWB2R
	 MkQdamzVTeU8QACmAJyeMrHBpHHwc7wyGeQWhkm6Ay5cHjz3ZkyojXlT+Jnz+kCrx98x2
	 ko/NAm9RHzLpDInIpvPvGcFq8ilv2EVuRWjnav49l3z13fwnSl973uZMqe2+JKrPWIkUr
	 LpEOB2jQCxL7Ts74yIieXk49iTNprQkl+rtPejwONmN9RjtufMkO3RhMdAjJG/IDqGPE9
	 Dr3tM2y9hIw6CY2oV3dkwp9/qD3vOn9CtJl0H1l27bVFjLHmOEVkG6YPRTtrePJ/c6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310409;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YgY4GvZNXZvMZ3ql+8fhr4JZ923ggCuD2y7382GN+08=;
	b=Y+qNlcQjEPL6vIdV5xP6Hoq2GTW1VL8tfu9kyUF2m96l2OeTQ1dfhu/yLJsH0oY4HCQd
	 1d00f1ergGtR2eTuzXceJbWSx8Svw2ceX2Tnw5T1dRtm3QJSieWjC8u4WFzFn/K+YpJJ3
	 ER2kfHgljjacf8Zb3XKoSRepu5aGgcrf37vcwU9NEWw2bLctGq4X0N1NmxICGBSmfWlQy
	 c+5BEUmIwQX5rN1emqyoMu8TptzCcjcgW59aCYNaq9pWQlmja0InLdnVNCDkqyeLRt6yZ
	 1gtN1duY/9u0IY2Ukm7/n477l2a26WV58FDCn0jMHkAztXYnbXCX+CnoVLICvr9RL9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5Skoeev;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08459606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5Skoeev
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB981F008A4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310408;
	bh=YgY4GvZNXZvMZ3ql+8fhr4JZ923ggCuD2y7382GN+08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A5SkoeevCj1UI9vUNmbwr9lWAlHIjTHnPJHXb/YaHBBulWp9XWTXrSI4gz1FtM3E0
	 vJDdRbEFlV1bw6pE+dXAVmqntFaluCJ7KTigP1WyP/vIdwyfNmTE0l/SaK2Hp/cx/7
	 nhdKiTbADqa1hwadTEbJC8nURwMMXG2uop/5NMYLIcSvFEWTQ1hRLt6KMWuUg2bXCd
	 uLzYnuBSO0MIROo++oQrs/tpzHdXti0hUoLlzRNNcrQsB4Ap/cGZMDKusRNFPj0bxu
	 7dInUYKhImv/sEBiBCX8zbyxQZhGqI7DbCpMp36U3ruCfrTGhyuaymx1aFCAxDHWrD
	 yajzKbKPoFYBA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be47aa555cso1692141e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGKUvUxCcXG0L9UTY5BbE2gyR4hzNoCjQ1bjWAnPyIz8LxF1qhKV3OsZfHhNo5NUqJ2NCWAULo/vPc8d0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s7uvrbLywT22YtnXT9Ra0Ia2a7hk/l8TC6L98xqXfDvznuuQi
	LAv2BHTQj09G0Mp6ZUKUd/o8vOa9ybLtx2nUnYUZ8WyBw+HBjsmP2mvGzUW8AaXhoUqicHXnUZF
	VQMEGPTGuYwjXN9zakwDMqQBoXcPz0ow=
X-Received: by 2002:a05:6512:3c9d:b0:5c0:cba:7d30 with SMTP id
 2adb3069b0e04-5c156e9eed7mr707271e87.14.1794310406972; Tue, 10 Nov 2026
 03:33:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110053423.2517-1-lirongqing@baidu.com>
In-Reply-To: <20261110053423.2517-1-lirongqing@baidu.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 12:33:14 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iE7jKS+7J=RApvVZo0h7C2MPsp5Zkm+3-8VcoVGMum6Q@mail.gmail.com>
X-Gm-Features: AclHuK8kL6LYexEzPSOX_lwrmiw-eQLWHllK5RWqbY0IvprgeqWxWKHLkZgeY2c
Message-ID: <CAJZ5v0iE7jKS+7J=RApvVZo0h7C2MPsp5Zkm+3-8VcoVGMum6Q@mail.gmail.com>
Subject: Re: [PATCH] PCI/ACPI: Check the found handle in acpi_get_rc_resources()
To: lirongqing <lirongqing@baidu.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:34=E2=80=AFAM lirongqing <lirongqing@baidu.com> w=
rote:
>
> From: Li RongQing <lirongqing@baidu.com>
>
> acpi_get_devices() returns AE_OK even when the namespace walk finishes
> without a match, in which case the return_value argument is not written.
> The caller passes an uninitialized acpi_handle and hands it to
> acpi_fetch_acpi_dev(), which dereferences it as an ACPI node.
>
> Initialize the handle and reject a missing match.
>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

Stable may want to pick up this one, so please add a Fixes: tag as
suggested by Sashiko:

https://sashiko.dev/#/patchset/20261110053423.2517-1-lirongqing%40baidu.com

> ---
>  drivers/pci/pci-acpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index e260089..e90e749 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -82,7 +82,7 @@ int acpi_get_rc_resources(struct device *dev, const cha=
r *hid, u16 segment,
>  {
>         struct acpi_device *adev;
>         acpi_status status;
> -       acpi_handle handle;
> +       acpi_handle handle =3D NULL;
>         int ret;
>
>         status =3D acpi_get_devices(hid, acpi_match_rc, &segment, &handle=
);
> @@ -92,6 +92,9 @@ int acpi_get_rc_resources(struct device *dev, const cha=
r *hid, u16 segment,
>                 return -ENODEV;
>         }
>
> +       if (!handle)
> +               return -ENODEV;
> +
>         adev =3D acpi_fetch_acpi_dev(handle);
>         if (!adev)
>                 return -ENODEV;
> --
