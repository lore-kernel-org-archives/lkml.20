Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F00356744
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149646; cv=none; b=j/KWue6vG70RBhkuzFRYwRQQrqHwQx9f1Ko3KZrabymYj8ZVVKm0fd44Ij0xVBYQDJFrw1bSMqe380mWcpU3iszY8Z/0iq0hcrsw9Kilsg0F9iJ4IgFzYm34nSS46HXtLndi17d+XmEzxdlpJvknhvpTekT9kxJgVt33gNYMvJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149646; c=relaxed/simple;
	bh=Ln4tV/9ltZBeYzidwNmaTydpreMcBH5u6aBCjr2S9kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/0IqTN4TDoeEggtQ/pqWLTgTXOUoIxzxrGIxGdhAhYNZLqsVHeRZdz8S02fqNeMNN+mISod4RaDf0/p68InrxZRjJOxRktZ/owCc8kncqh0FXsotH2ecR3rHh+PnAxpHDlsNGM+cVF94uVwDsiTAzjmC4TkKhNMToA56CUPeIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erOXO1fI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erOXO1fI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1ABB1F0089E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789149644;
	bh=Ln4tV/9ltZBeYzidwNmaTydpreMcBH5u6aBCjr2S9kQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=erOXO1fI8BTv33vuqCDeLVZR1/xGGhk/9jvSxvg23iX7Bzjz3FblmZIU113LvIASc
	 uo8/UAa3HeYZnYbC8lAqh0UbNAig3LwFPXwHjTtj9OdLOzipxe3i9Uu/Mw68iMb+Y5
	 TpGFYQPL7TklzG6U8KA1DopN+B6srF49kzxoH7kNJoN4Byxksc9ZU7gymkNYoS4grk
	 VDt1ONBvAkeobY30145XsYFcE+WZkOS2UZLfN/wsJQr+efeg8icOV5ZZcVFanqqJQd
	 o78xXtjOtFREOCLxi31rrOG9APwq+ZsryCvm3Ytl31w3Wm7Jy775hJOxOWGxKS7nyb
	 +oFu/wWkBLyEw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so1510341e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:00:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRVTTZ5RIB+Vo0UaDAAkvDHlpCAAh/gbAixvY99SZpi6mTVetFd+STJv3g3zfpHQo9r23bfLabq2QaHOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lm0Cg1dKTqhoIPLKG6xw0SM8H1u7lFQFoL1cJZ76r5t3UVp5zF
	CxjTipNlgTwR6SlmDgR1K4JBbwJsonnzCYI9CmkmrgLMRGPIzMKzmY6QOQvCNkcfEwP00CXPGII
	st3VCBObLTjBLrWifZB10sLnXDJOPXbQ=
X-Received: by 2002:a05:6512:10c4:b0:5b8:993e:6dcb with SMTP id
 2adb3069b0e04-5b8a029ddb7mr1100799e87.20.1789149643414; Fri, 11 Sep 2026
 11:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825105427.686619-1-roshaen09@gmail.com> <20260910192526.137057-1-roshaen09@gmail.com>
In-Reply-To: <20260910192526.137057-1-roshaen09@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 20:00:30 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fnA9qV9XpAScM5knc+aY4eHG3r9a5RrGnhvVqORwMhA@mail.gmail.com>
X-Gm-Features: AcwNN1VNyS5JesON5oceppyiBvf6Kxyrr06Pf03uMf0r2u2yehdu3ym0fg0KUnw
Message-ID: <CAD++jL=fnA9qV9XpAScM5knc+aY4eHG3r9a5RrGnhvVqORwMhA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/pl111: drop alpha formats the hardware cannot scan out
To: Roshan Kumar <roshaen09@gmail.com>
Cc: dri-devel@lists.freedesktop.org, leandro.ribeiro@collabora.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, pimyn@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:25=E2=80=AFPM Roshan Kumar <roshaen09@gmail.com> =
wrote:

> The PL110/PL111 controller scans out a single framebuffer and never
> blends its alpha channel with anything. In every pixel-format table
> each alpha-carrying entry (ARGB/ABGR in 8888, 1555 and 4444) maps to
> exactly the same register configuration as its XRGB/XBGR counterpart,
> so the alpha byte was never used by the hardware.
>
> Commit 860e748bddcc ("drm: ensure blend mode supported if pixel format
> with alpha exposed") added validation that warns when a plane exposes
> alpha formats without a pixel blend mode property, and PL111 does exactly
> that. With panic_on_warn enabled the warning prevents the syzkaller
> vexpress-a15 manager from booting.
>
> Drivers should not report formats they do not support, so remove the
> alpha formats from all variant tables: the generic PL110, PL111 and
> Nomadik tables in pl111_drv.c and the board-specific Integrator, IM-PD1,
> Versatile and RealView/Versatile-Express tables in pl111_versatile.c,
> plus the now dead case labels in the display setup and the Versatile
> syscon connector switch, instead of advertising a blend mode property.
> Behavior is unchanged for userspace that picks an XRGB/XBGR/RGB format;
> alpha-picking clients fall back to the identical X variant.
>
> Link: https://github.com/google/syzkaller/issues/7805
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format wi=
th alpha exposed")
> Signed-off-by: Roshan Kumar <roshaen09@gmail.com>

Patch applied to drm-misc-next with Thomas' review tag.

Yours,
Linus Walleij
