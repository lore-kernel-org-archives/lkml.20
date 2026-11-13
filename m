Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593746;
	b=C80tWPHtFJGGyHaw4SIIUdagN50R8qgRLp6EgYByyCv6+WXnnTgrB9iDGaBEAca+FhK3
	 sXCJZpvgdpvVt1+/2sOw6vUQAlGWv6RnICom+mngJWalaAa5vEz1f0Xle/tIvd3W9yZ3Y
	 tS6w+F/Gbc5FDhhMfEAM6tGSX1Rf9kxH3U++WaL5RipGTLd0iHdoEffW5L8g3HmUy9GTm
	 LZjuAqhHRpAJyu3QvQcnpq5livPo/bJESJdJFy+RU7HO4mvkqyPgCyHcdsfU85NUtYk9w
	 zkKquarWD4A/AReLoxwomaqIpxJdEaVqyrnl0fHNn7qbwbbxZ4s6sUX+iCwylOuGwRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593746;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c3P0NnvUOaRmzXzchRLD85s11hxVJbX7eztaK5VSXoA=;
	b=RDh3I9IOEMZ1ojcgW9mv4hPROtMHwfPu8616pHZdVCD4uh7+43K6IEcmYd//YeQs3dxa
	 0JZC3F7XgZTIonTy2Xuyze3QO9ey2nXCLdUAdxqex6FVBbQHQBfCngI3ETuf64T8ycIK+
	 0ZrnzGp78xG25kbk4+IdQ4wRXM73GFiNpPTlQaffI8UtYZwEe36CvU3afHAYTmKq79W+9
	 zHytdo8Cmn0f3bRjDMB+l7qYK684zjXBJxaoNLyQQcBPNosgYXc6Qgv9QdOcAyN1a06e0
	 PmXhIShsN8mGH4OoyVAeNFmnVlnVJdLTJdQTv8ja1ZGNAstrVclKhrRj0jfhinLmrQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ye6jPgYV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B52760A2614
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ye6jPgYV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086081F000C4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794593746;
	bh=c3P0NnvUOaRmzXzchRLD85s11hxVJbX7eztaK5VSXoA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ye6jPgYVaf97mLuuA1ARed3yBkwWrqQEbppkWlhBDkyBU31/hYVlhPE++lV2VIbT1
	 2gX3l1ffb6wGpdKl2ajCard9SXNzuypE+iIM0LXtfqwnh2f233eWJQIIQL15uOayac
	 ugYP1/XB6IfrzaYVZKV7xAgDuNZF0Yob2GGUUnAzViKkGnFFOMwYUqLmszyNuRgm7F
	 EOeaTBZP3zoiPR7Api4S3nYPZc3TFUdp4XtbBrEJfLXj7dlB0rcHBnDQmOKPeUUU0p
	 MOtatNqEiaW8fi6prXIn1ZyeBczp3knG0AxvYZroygw6EBt94N/s27WKHhYyqXZMt5
	 594TCyLYoeJdg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c10dc41270so1779614e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEDCNA7eSZ4xt94RmvFSk6rciOMvJ89o2AP0AUwbFSrTK8L6f5u7trr+18Ga80jWCOd7IV1TAQ4lhfie6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HWB1Al9bQlFsCSeOBo71iJCSLmsOhw/2ZEX2/JQmNN9/Bv5+G
	h+6dn26wB7uIYoJMdkGbD/XGw1DQd7xlcF29zB7RBIgE/zSQm7rbHMMYgdT2kCUAKEiGCzBFd6F
	YfL1e+ZVHw5BAbKth8GXUYMskfmAzc0M=
X-Received: by 2002:a05:6512:33d5:b0:5c1:5be1:2ecf with SMTP id
 2adb3069b0e04-5c170b3285fmr1271962e87.51.1794593744489; Fri, 13 Nov 2026
 10:15:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018164004.132785-1-cole@unwrap.rs>
In-Reply-To: <20261018164004.132785-1-cole@unwrap.rs>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 19:15:32 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iJPQER8p0MGHneuyFiFqCbh__tWi9g-u6gQpxwMzhRpw@mail.gmail.com>
X-Gm-Features: AclHuK-C26Nmb3e-mNuXczuZd0qjnVm4jfUsKXsqoBO3McbLrqMBv_ig-_tPAgU
Message-ID: <CAJZ5v0iJPQER8p0MGHneuyFiFqCbh__tWi9g-u6gQpxwMzhRpw@mail.gmail.com>
Subject: Re: [PATCH] PM: hibernate: Don't lose create_image() errors to arch_resume_nosmt()
To: Cole Leavitt <cole@unwrap.rs>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:40=E2=80=AFPM Cole Leavitt <cole@unwrap.rs> wrote=
:
>
> create_image() calls arch_resume_nosmt() on every path that returns
> with in_suspend cleared and assigns its return value to error.  That
> includes the error paths taken when pm_sleep_disable_secondary_cpus()
> or syscore_suspend() fails, which jump to Enable_cpus/Enable_irqs.
>
> When SMT is not disabled (for example on CPUs without SMT, where
> cpu_smt_control is CPU_SMT_NOT_SUPPORTED), arch_resume_nosmt() returns
> 0, so the failure is lost:  create_image() returns 0 with in_suspend
> unset, hibernation_snapshot() treats that as a successful restore and
> hibernate() reports success to user space although no image was
> created.  A wakeup event that aborts image creation in syscore_suspend()
> is thus indistinguishable from resuming a hibernation image.
>
> Only call arch_resume_nosmt() when image creation succeeded.  Failures
> now propagate, so a wakeup event that makes syscore_suspend() fail
> returns -EBUSY to user space, like wakeup aborts in freeze_processes()
> and dpm_suspend() already do.
>
> Fixes: ec527c318036 ("x86/power: Fix 'nosmt' vs hibernation triple fault =
during resume")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>

Sashiko has feedback on this that needs to be addressed:

https://sashiko.dev/#/patchset/20261018164004.132785-1-cole%40unwrap.rs

> ---
>
> Notes:
>     Tested on a Lenovo ThinkPad P16 Gen 3 (Core Ultra 9 275HX, JHL9580
>     Barlow Ridge host, I226 Ethernet), in daily use since 2026-09-17.
>
>  kernel/power/hibernate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index c13f68ab7f6e..f53f844114a1 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -380,7 +380,7 @@ static int create_image(int platform_mode)
>         pm_sleep_enable_secondary_cpus();
>
>         /* Allow architectures to do nosmt-specific post-resume dances */
> -       if (!in_suspend)
> +       if (!in_suspend && !error)
>                 error =3D arch_resume_nosmt();
>
>   Platform_finish:
>
> base-commit: 32c52ec87d6245ee2d12ed5dd509e40062939b50
> --
> 2.54.0
>
>
