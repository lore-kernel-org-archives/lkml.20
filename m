Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042797;
	b=FJRs6HzZ8SGO26IUKGppxIZ61vgrxDK4jtTqSTL5JyZoS21bFb9wfUXkWK12N7VVEKsg
	 Xnqe9MdkBzN7PqvB7OKYURylCxrhKYV08nEOJz+5mKrf1LPsvEyuni616Tg7rYQD5I8td
	 DPi1+hkE8kjgKL3IyXXfYFFh9npm+9FT+cKJ1G8LGZ2DAPyuAiz4yYGFnRhsgW2eOl45Z
	 ySsSFs3dtu3VFacbI2EfzQSlw63xCDDfSmuTtDYR9+zfMrEjQc17XdaE0wNTETRjcKNOU
	 +vkgYsnJeyzRKz08EYaMjf67HHp86sLQAvtOdd80FsMMzfTIPVErDqP/C13kwWOdzew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042797;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8Kc1cohtal7Z6JWXOOnKtAzlP3ZNhZ94KfGnkpnEI7c=;
	b=nazQKsIsSyNKqgTcn4wbEp8T1UI9C4oZS9TuSGGZ4Ksq1hY5t/ovtDDlg3OqOuFYwuXz
	 6KbpKrp2SJ4Bqyu6/+Nl8oj2LuufZoJsw0Jql1Yh153Mkp3ypFM20bXnnKDh0o1uhxz7D
	 8JYvAIXEFAB4Q2S7GoMK2Pj/TijMv1mqUw6wntdj0K10teHzqbBoV97CiCJ6Dq37p8tVH
	 vYg2UUSm9WbSpBBwK0HxcxtMmszZMcoGiRS0iJI6DzJoLtFHdMftjimzScgcuw1SjwYq4
	 MlUvjMLTSemAG9Obi1A24cOUuItw5VFx/ZIxRKlbDTlcVLNEaKPptdqZ6eCAh4d3rRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCAtdriz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCAtdriz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0783C1F031E2
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042797;
	bh=8Kc1cohtal7Z6JWXOOnKtAzlP3ZNhZ94KfGnkpnEI7c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MCAtdrizNe43F0olqIRRZn4iuFqaFMWg+zXPlJdEc63+HMl1SqUYbK0TVVICYGhEV
	 xc7oUgzwL+Qv142zTXJk3FJ2+rahZfKG2KtxO71ZjmEcvyvWTQS2cQvpp/QychbwQx
	 bRNzeE7ALvjW9zYM6oWVSBwqvpPorVd1Bw61FCnQffZwupLj+15lSJRgkWbSHdTtn8
	 ZlpCQ9/BtvUu9NWFnVEb/v7nFsF8NL9eviIuwNyOFHLlowjNBECkMYs4zyxv+xAhbZ
	 skvpgi5HsglzeCBKsNjzqctYhWHul1h8UbfO7PESBYtSfC3BhVtAWQmv/VKo0Y/2NS
	 D6bB/eeeGt7Lw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso1061043e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw33BxtbwrZo2gJ7fQtVQSUzXq3MA28rnmVUsttd+NI/xr+LcA8wijGnL9FbO9yAvJQOV+BS1uoYklQCa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIPrsGtnI0CtuOSETwVwskwMo4Ngt9GdX8f+GZQZ1FWlALgkmX
	Mb40jVb5+RL2JkzZh8vK1bHyshI6XGbVWRS4vYT2v1Nrdxspa5MErKrk+aKpsywTR174FrF51t5
	6pVwDKcSw5gGd4b8rY/SS9GyFwYFjPyI=
X-Received: by 2002:a05:6512:694:b0:5be:513b:a44f with SMTP id
 2adb3069b0e04-5bfb71e3d25mr2337199e87.49.1793042795490; Mon, 26 Oct 2026
 12:26:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003000011.58045-3-blum@kernel.org>
In-Reply-To: <20261003000011.58045-3-blum@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 26 Oct 2026 20:26:23 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iBX3tL2mx10g_4abRO_G3U96z5bgF49zaR-SvszbuOjg@mail.gmail.com>
X-Gm-Features: AclHuK-RzJ2SwTkeK5-H7Bk42trBPZSMQT2JY6seIFQATTFT6YeYQQ-1dwFRvaI
Message-ID: <CAJZ5v0iBX3tL2mx10g_4abRO_G3U96z5bgF49zaR-SvszbuOjg@mail.gmail.com>
Subject: Re: [PATCH] thermal: sysfs: Fix indentation in create_s32_tzp_attr()
To: Thorsten Blum <blum@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 2:01=E2=80=AFAM Thorsten Blum <blum@kernel.org> wrot=
e:
>
> Indent the show callback consistently with the store callback and use an
> early return if the thermal zone parameters are not available.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/thermal/thermal_sysfs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_sy=
sfs.c
> index 96fe5d591a0a..47daba943a76 100644
> --- a/drivers/thermal/thermal_sysfs.c
> +++ b/drivers/thermal/thermal_sysfs.c
> @@ -287,12 +287,12 @@ sustainable_power_store(struct device *dev, struct =
device_attribute *devattr,
>         name##_show(struct device *dev, struct device_attribute *devattr,=
 \
>                 char *buf)                                              \
>         {                                                               \
> -       struct thermal_zone_device *tz =3D to_thermal_zone(dev);         =
 \
> +               struct thermal_zone_device *tz =3D to_thermal_zone(dev); =
 \
> +                                                                       \
> +               if (!tz->tzp)                                           \
> +                       return -EIO;                                    \
>                                                                         \
> -       if (tz->tzp)                                                    \
>                 return sysfs_emit(buf, "%d\n", tz->tzp->name);          \
> -       else                                                            \
> -               return -EIO;                                            \
>         }                                                               \
>                                                                         \
>         static ssize_t                                                  \

Applied as 7.4-rc material, thanks!
