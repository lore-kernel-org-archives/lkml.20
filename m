Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53293472F8E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964625; cv=none; b=OcyjV+efbdUUBRKv6XPzMkOfLu2sxrHI7gUKcHeMDsctJzg6wRaFl7ofW+Fipf4pkT542bpobQlNlLDkGd75nyR5K+5v+hsClVfiSugah801oUlkT4lsKN8xvlkeG4R03HL59wNsw/qklo2Kt54ZZOmapp+NIRAvvC0ELX3iTcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964625; c=relaxed/simple;
	bh=RCyeFPG6a0o4i4nAcfBnADbLLTwFrfgfycZJHu7aoY0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3WP7l5G/cVzEDiDo+8cC4KLDsQv2XZEK456FKjCcwHo9RWL9t1Y1hpl91EkgEtFpXEgMDkWj0ZYdjU2gnhznOanASIW9EyiXxotFpiQO9stJHRgL6kWemJLry2sjOvvkmb/eyeASU7nS0X6BwG46JHvSEcayFjHQramyjUg6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=co9OoteD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="co9OoteD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53291F00899
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791964623;
	bh=sl6IW0nnvVtp07vNT44AV7L0erWrDL8jBfOworvsToI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=co9OoteDp2WuxaM8YqiplSwL9GnSd9In+175+3Te3DpvnRRfRQnFkFo+66Rxr8uTx
	 fJYP8sycpWgurlsHVS+fCyw7p0VkLM5hgv1fQct5k3l5MryucUFTUwW8D16h6rKYJg
	 qC4Sw6Yl0Vw/3h8SiPgyDEjGvfrAQ7z9DAOU1XID9Fw9QCjsHRSI9Zp4EufxvqDtdj
	 OEQz2ODYL3dahOwI1VJmJpeVa78kuo8g0w91NTk7fJCZz3zCIfoCumI482++PTfRGZ
	 KioZJz1346e+z5inJu/Mi6i3b47QXZAtTuEh6hOOvlz2sD33rq1jc+BXpeoUaXnX5i
	 KjDhwntvI9xiQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a980c01033so5532261fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:57:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzl9+DO6hx26sBUhgzbtSVVSer7tgIypX7Ekx61NRbIkC/vvxsH34HyVdnGat4efURFhW6/37FLpusWq5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7b0umixU73Jp5rHPInCfz7Jswve+tPK59Y5yEtSZzPKIbSy6R
	2jBuGeMKLsg0oOo9OvAsFrfeIMyHfb6sw4d3W3wb6YOxWu6dN3nSYQ3NFIhOI3n+R2sAlzVxa+p
	2cRWLii6rEFuui3+8NLL9txYf4JHJZjbkpE9ADC1yJw==
X-Received: by 2002:a05:651c:1542:b0:3a6:692d:b7ed with SMTP id
 38308e7fff4ca-3a9c539343dmr40055691fa.20.1791964622555; Wed, 14 Oct 2026
 00:57:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:57:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:57:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260814075624.16639-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814075624.16639-1-pengpeng@iscas.ac.cn>
Date: Wed, 14 Oct 2026 00:57:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me3kH8rrifW20xw2JqECydKrbBfQ2ZfFsTrL6KwD8+9=A@mail.gmail.com>
X-Gm-Features: AclHuK_kQw-qSVTPtUkRCZuiCj0gamOTj8vq5XddbmqNqJG15Vf0yUsge2wg9SY
Message-ID: <CAMRc=Me3kH8rrifW20xw2JqECydKrbBfQ2ZfFsTrL6KwD8+9=A@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: davinci_all_defconfig: enable the current ST7586 symbol
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Aug 2026 09:56:24 +0200, Pengpeng Hou <pengpeng@iscas.ac.cn> said:
> The ST7586 DRM provider is now built by CONFIG_DRM_ST7586.
> davinci_all_defconfig still enables the removed DRM_TINYDRM and
> TINYDRM_ST7586 carrier symbols.
>
> Replace those stale entries with the current provider symbol.
>
> Assisted-by: Codex:gpt-5

Should be Assisted-by: LLM but even that tag is going away[1].

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260624082029.18675-1-pengpeng@iscas.ac.cn/
> - no source-code changes
> - rebase davinci_all_defconfig
> - route the revision to DaVinci and ST7586 maintainers
> - add the coding-assistant disclosure
>
> The Kconfig/provider mapping was reviewed statically; no DaVinci kernel
> build was performed.
>
>  arch/arm/configs/davinci_all_defconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index 72703ef0c51c..ac0029701283 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -144,8 +144,7 @@ CONFIG_VIDEO_ADV7343=m
>  CONFIG_DRM=m
>  CONFIG_DRM_TILCDC=m
>  CONFIG_DRM_SIMPLE_BRIDGE=m
> -CONFIG_DRM_TINYDRM=m
> -CONFIG_TINYDRM_ST7586=m
> +CONFIG_DRM_ST7586=m
>  CONFIG_FB=y
>  CONFIG_FB_DA8XX=y
>  CONFIG_BACKLIGHT_PWM=m
> --
> 2.50.1 (Apple Git-155)
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

[1] https://lore.kernel.org/lkml/20261009083137.3-1-sashal@kernel.org/
