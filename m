Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCDC4E77F5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409196; cv=pass; b=lbo4+rFDKkEo3XBv3u3wIMa4EChsd+0TmBApdf1kiBdjTn7FUZnLDYSiObmlhuEj0VOjd2cDzgr1GkW/bLNWTEug9Amg495RYkEVWKjWPOfEC+8IKDTgGFSaWd7gF0U9jzdbSSShxyPCkKnqyKTo4KnSvJNMwj+cQJLK4kHzEEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409196; c=relaxed/simple;
	bh=NjvtDbKF6HXkZCMqwsd9sCUJNo+Nw1euiIQvE/sseso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3Hk+a4mAJYUTjlXccuKCrMf0hhtRLQPlwxGhJEIFx7Pz+x5MK8EWnEUnQzVdUUUdpIo4injZqmNWkXHokOKXsegXetIMasTzx1ynshz0Ef4JMASJv5h2w+yKlMmQlEMSpvpcTdIeem5x+gbx1hRhCKtCqV2Gp4+gdd88+fcumk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lD1QQ9YH; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lD1QQ9YH"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6790844c9b0so1295684d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792409192; cv=none;
        d=google.com; s=arc-20260327;
        b=QeCh8mncC2kK3mS6UMFnzpekf6GH+PbH1f1VmwSl55wVM1sBJ1zuzGZOLtS8/1Yw0y
         DDEk27hlZv/0p0C38FFHNaQFRKt/ZQ8PQ6SKE10BLpcwn+8U7jURYqb505dFDn5YvBru
         1yKnT8otmmRHp37kp5I1QOuEwSnOQrarhDGhxADnN4BCQ/ZfM9/qvRTAVGyn2oepwbmJ
         RLtXIv4hFl1feEozFD3MGYG4jJ5T7dCbR0gP5VtE77cIeN5zPHnOgRiUZeJ6jTtw4Be/
         Q5fmxPfTHN2uiLqc2KNa07VqWfN3xrLbJZb2/bq8pOiTFemYTo+jMC59wljxNPIOFNRR
         AIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        fh=Ez/HQwmhlf2LQFGkX2p66JXqISPM7iIm0/TvRAO8tBI=;
        b=mR8MM/Z7/NsOYX6PskzzTpm1tLRyMCVsoVlf4Js9U1Ixu1KJuKSgpqmFaFoUQv3x/a
         X9z/UcA4k9SAG/SFW0JQrjrIr3VjMWed2rpbPeJRMSN6dnAKc38ssk+DCAZDfoqkEds6
         6Mn0SJm4UzvrrB6aTSv2dwiGdm/UkcmbvajD00PPS9mDtp8xfTUk54lO/iFMoV5BSlwO
         YOVVoJzDPLCJIqjlaWKVrlZX3WexXlkvHZbxQ1ptWtmdHlvS7+WM9eHG3IZbrBP7KQs2
         JRLZqRLtVefLYWnhjvayuNyIhS1f0ZIup8gC/ZrXprRzIOQ2ZRkq2/jUf2+o1HEUpbjT
         bbNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792409192; x=1793013992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        b=lD1QQ9YHwcxcfb9TQhswu+Ci+TiBOawx7r4a0gt7brNLXnxv1n4k6CyoA7kpBBRiJZ
         Nxuoc8vFMAXptnwT5IHq+1/1YL1pn4AFxKwOdYAl9qYWvSaO43e18c6xnZgsbxfDVvcJ
         7lDPWKrVPfESajInGUBhgOoDZzqrCZ1fK8db5DJKyakEmX6b56pLAkn5f6rzwLUP4F0E
         V+iWeSrJI3lDp2o0pg1Nz8Qw5CwtsQX9EtAPtxDTU+Zyz815yiYCNP4tVZs3HXs/VWJs
         O0zvk5/j9JJRfs4rKiEGA90XXJwVmodlm4RBfBmdz8O6MVhbljztZ3U8BV2nmKA5Dr0K
         OxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409192; x=1793013992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        b=ECYa0XYINnJAL9RAhB9+4pyM0OR6yznv67kUX3jfCHFhFtZyBNL6Opuam8vR5CAHal
         q4D0ssrnuQ8aEI70gayoK7wHtfaFPpjdBynFMsbhW5SHXF6xAIyrbCMll/IedNtIXA9M
         syjDM6L6nQLYk6OF9DRFt89wicoS7utdnK7FO9iNYcmnbU35p0x5yZBLgnKCt0lGDRSP
         N9XxfkApctszSqjpOMf9gCQQ1Dd6Tt3qfckMqRMAdNQJ7Tb1oDtAkT5acTZP2DnGu7ys
         ixwvKyoHSsXRRP1vRQqii8+2vCeF1JiYDE5NfHguB5HWutM4ENfpX4+OmJcwE02HvmtT
         sHqA==
X-Forwarded-Encrypted: i=1; AKwUvBxIo5FIi+6ksIV6hn3U6eL4zNC7pRf5ssOp5FMwYtXBgdIRiREEeYg8PA0EJtQi+VuyrltvqGLM12V7wSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbOz1B7Xz6CvUjxRIMo/ur58/Hnf8+kXQGT5wie30O3LR4iag7
	HskzWvSlFvBPEt0Vaj2WvOZQN23enAT7CZzDsxHGnAKoJY0owJptuekUZd+zkioKkRAAdyHw0Ox
	xrZ2NgEscaP5Ir0I/w3cQsHF7+iFZU+g=
X-Gm-Gg: AYBFou03hIZbX58vZmdv7ZnFF7/JVPogdHRt8IOKi9rw14s26SFsvhV9FfXGGWqTFPl
	iufpvBkQGPlFCJiFpOJ/eijnhxEKe30USga1ULLeBQeCEdgmPcQF0+pUQjsh/d+MUQI4AZFbk4J
	Tgc5fZCF5oXGtaV+rG9DVyc1HSlOEDQ8BlmLly0jwg/17UduvRyi/XlMyX1bYRCWs+V3r+PAaPO
	eyZ8c2TVBghFkzMbg6rgehLBMYk/oGbwzTCo6cgZuzEMxf5tpmIGVrNCQbRi5SKXNf9IC7XAmz6
	L4iwHKjhRmP02P5PzxV3ffnS6kFaS21aH3PpwZEbTgeAkIP6GYd5ZFMifijpQVQyrAGZPTIoz2d
	5G2hl3tDDULp/F8WXIvJoPWNoSf1HqsbX0b9iybr83Ox6LMNenNkiDrJkjBYlcD9VGlahrmLdog
	yRaoAGHQ==
X-Received: by 2002:a05:690e:1347:b0:675:66f1:5ed9 with SMTP id
 956f58d0204a3-679ca90ed21mr2347287d50.101.1792409192148; Mon, 19 Oct 2026
 04:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com>
In-Reply-To: <20261016162912.64581-1-lukapanio@gmail.com>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 13:26:21 +0200
X-Gm-Features: AclHuK8NAOp_nRQSq-Iz-AG3DYdUQ7KXnVtQSaGV8OFLCu20HF33SdrAf0b1-9c
Message-ID: <CACi=Ov6Jg5eUxskBbmtWOS03jta90RK0nByhWf4EQs1PNhvuKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] backlight: Add Awinic AW99703 driver
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	daniel@riscstar.com, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, junjie.cao@linux.dev, mitltlatltl@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Krzysztof,

Thanks for the reviews. Before reworking this for v2 I'd like to agree
on the approach.

Following Daniel's suggestion I'll add AW99703 support to the aw99706
driver using per-chip data instead of adding a new driver. The register
maps differ almost entirely, so most of the DT properties stay
per-chip (dim-mode/UVLO/ramp-ctl on AW99706, OVP/OCP/inductor on
AW99703).

Following Krzysztof's review, the AW99703 binding will drop the
ramp/transition timing and mapping properties and use the standard
led-sources and led-max-microamp properties.

That leaves the one common property, the maximum LED current,
spelled differently in a single driver: awinic,iled-max-microamp for
AW99706 and led-max-microamp for AW99703. To avoid that I'd like to:

  - add led-max-microamp to awinic,aw99706.yaml and mark
    awinic,iled-max-microamp as deprecated
  - have the driver read led-max-microamp for both chips, falling back
    to awinic,iled-max-microamp on AW99706 so existing DTs keep working

Does that sound acceptable?

Thanks,
Luka

On Fri, Oct 16, 2026 at 6:29=E2=80=AFPM Luka Panio <lukapanio@gmail.com> wr=
ote:
>
> The Awinic AW99703 is a high-efficiency 3-channel WLED driver with an
> integrated boost converter and 11-bit brightness control over I2C,
> optionally combined with a PWM input. It is used as an LCD backlight
> driver in some mobile devices.
>
> This series adds the devicetree binding and a driver for it.
>
> Tested on the Nexphone by Nex Computers.
>
> A board DTS using it will follow separately.
>
> Luka Panio (2):
>   dt-bindings: leds: backlight: Add Awinic AW99703 backlight
>   backlight: Add Awinic AW99703 backlight driver
>
>  .../leds/backlight/awinic,aw99703.yaml        | 131 ++++
>  MAINTAINERS                                   |   6 +
>  drivers/video/backlight/Kconfig               |  11 +
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/aw99703.c             | 583 ++++++++++++++++++
>  5 files changed, 732 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/awin=
ic,aw99703.yaml
>  create mode 100644 drivers/video/backlight/aw99703.c
>
>
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> --
> 2.55.0
>
