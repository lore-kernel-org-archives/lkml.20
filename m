Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349E54D7974
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580051; cv=none; b=vDZVYHG45PzGjBP1v561ipw8SjdD9Cy/zERZVhAUfZG9+6sR4yfdas5SFAERvdlWKJbhf9DGSN3d6PkpnwF68auOU75whhR28hamXM5RQ2sNMKxGHbQpKoa2AJpT/F6axveHdC9/HPXIWGrZbVr5UzYm753ZDe8RylFu034m1FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580051; c=relaxed/simple;
	bh=LN2LspITv3xkE1/NS/TeXztMqaceG3gtSU2N5tESJyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUB1z0xGOll2T2mkOHQqz9WMw7ehLDgslWHDwxSt0UdrhgmVBb5cDUtfELuB+EUkUg8AADErV2M54uqdvDZGwI5o6VDY/4vr6TLcdh9+Il0FHWZY0EDF+Qu34M9ue3F3Wfo3lwn1GZ21XiP1ifUmuwkMOHesqMbzpHhJPoCyoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHnLngYv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHnLngYv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0841F00899
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789580044;
	bh=LN2LspITv3xkE1/NS/TeXztMqaceG3gtSU2N5tESJyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dHnLngYvaCp5p9+qgK82CrZ0A44lBO9IRTLtvxWSl5WqQ2F9MED4KcWzhVDlbq6Ox
	 j+vcqD6QYQ5qMISrKz5aSx9nw7NufXBe7K+VbQjbZaa4LkMT/4cuozhMZA70Q3Iez9
	 IWKZFk7hV/RikVKBpHRUWAPI0fCPsaJRaHfl8vAz8N2O8STfc084sRQVvFKlvJJtFP
	 H1NpNLyvAX2ztE3Jkb1v80/PyB/dS9rwx/9HvvzK67buu7VFiwIOu2oQQbxZN/c+jx
	 jln2IOK80iYSHFn0y1YVRD1Jqxx38jD70vOViYvAP1G5H7yfi94kuj0+AbIm7fK9Ta
	 vddJKxgoRZQ8w==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so1180898e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrJ/ti3L0T4ixJVLNSwirhMKJxCbPb0Leg01orQwSV8cnJ8eVj/uAZDQR3/h3t+KQuXq7wXP84RX5NW1w=@vger.kernel.org
X-Gm-Message-State: AFuF++mhTJuuvVuheRN2XivnKgkLSsMB0xzB1HPh0NoGNMbJnTP4+fh4
	RR+lsBpAZg/eeJ4HRUx7mpDp50ClS+ihXFj25LTjd7RGkiK8QQiIHdww+n4EmjCjWAFJO9sC8rc
	TTbK7SuSg53RRRF/3twKgG+9NufOtOPs=
X-Received: by 2002:a05:6512:3f23:b0:5b6:423:7f10 with SMTP id
 2adb3069b0e04-5b8b667b01amr1882851e87.30.1789580041252; Wed, 16 Sep 2026
 10:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916161205.2082579-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916161205.2082579-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:33:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLmD7jgAtwo7A01Ow0f=qYQGcE_XAPWJ1Hw+oyquGqEe_w@mail.gmail.com>
X-Gm-Features: AcwNN1Vcy7j5iBgknGpi0d42nIDdyyFFmeCq40y45IGsXBuWgzXJ25tbVP6kupQ
Message-ID: <CAD++jLmD7jgAtwo7A01Ow0f=qYQGcE_XAPWJ1Hw+oyquGqEe_w@mail.gmail.com>
Subject: Re: [PATCH] iio: accel: kxsd9: Fix runtime PM leak in kxsd9_write_raw()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, nuno.sa@analog.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:12=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> pm_runtime_get_sync() increments the usage counter even on failure, so
> every successful call must be paired with a put. Rejecting an invalid
> scale value returned early and skipped the paired
> pm_runtime_put_autosuspend(), permanently preventing runtime suspend.
>
> Fixes: 9a9a369d6178 ("iio: accel: kxsd9: Deploy system and runtime PM")
> Cc: stable@vger.kernel.org

It's NOT that important.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
