Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89944A0924
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999344; cv=none; b=t5p/nwBUQ22aEe83gkj7O7LdSsJMXZO8KeIDxZnfOUKjiPnvUqE+jgdG2sjRJt961ihueP9pfdIKLzjhhr4N1ZAmtXk9S/halvv5Fs922BjyigUB5PsqaWY+VJYqeXV9NrLey/qnBd/5oH5+GQIZgqoDYfNtgUdWwltJ9/ZnKT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999344; c=relaxed/simple;
	bh=d9wqUJmpH5uLASKu/y+N22vJym4WyRByfBRA78L07L0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rlpn/Uy+XM/pd9t8RvpyYxRDiCUvNj0yg8mKrd4EY2TgV5XQn7AG4WCN8yrcC0yqZKIiG9EjiSRfyYhaA1gQg1Ujtpq+WSeVeeB2cBmK8RyBqIxRZDn2JOT33dn4Krq2q2tqkcnRyC3VwqQi7TQDGJ609XXeDXzTdRHhpTewoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIIY4XmZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIIY4XmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662C71F0089A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999343;
	bh=FHCOo0228Ui6llFBqgoOKNDXI90TVjQN+WDSq4RM2V4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bIIY4XmZ0InIqvjL46Gzjedgt5Lv3velFSfRAngCeyWaKpRjsY2iF3T31Mc6MIClU
	 tMZtR4gPxPHQv1NqN8aYG5/OpVW7HvZY2BPF0sfC0oQJkbhhXfF0csssnaKxTW48QI
	 3A5hjfyLIJW+L1rrlf4rsnp0Sb4QxCbWW/cJzS/o/HZ/uLjI/izKwcZVm63Hf9e0tX
	 j1wHhl5w41dLgK2wKlWJx9nwXY0B4yA/3HOH3tIduBV5B9Ok9m5KdABybIOh6Pggkp
	 wLO82J9ehSFs2Z8cUsVpzJSNfqAfv2Kh0NFVjtqVXs5AuDZBnXOfQFxGpreqci/Vv2
	 CddaR6b2oYswA==
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so1495515241.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUASJH8+q+/gYJQd79jwFIaE9wyUJkmA7HFWjUgbqsCOOZxES1uwJl8jxtyejeWKseGHk+XjHxS5GQwLg=@vger.kernel.org
X-Gm-Message-State: AFuF++l40kQRTM8cpzuKbvOi7DRTneZd5N7rwrZSsYqUo2Tl4QvhGbKf
	i+WJDxO/JLDm04YoZzyxBBGfn5LQ4mAUG+WR4L8MY+OMKrhwDS4THp5PmmP32lTLIHs5k1PhgZn
	17K8nBcldqVle65QhPKsMy0WUr4Ywukc=
X-Received: by 2002:a05:6122:3106:b0:5c9:c60e:5cf4 with SMTP id
 71dfb90a1353d-5c9c60e60efmr3123384e0c.18.1789999342617; Mon, 21 Sep 2026
 07:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920022659.3145724-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260920022659.3145724-1-peng.fan@oss.nxp.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Sep 2026 22:02:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7N7d_FTE9FT8cR-ONar+DkGtYN8KbxuMmDSw8xZbY=+g@mail.gmail.com>
X-Gm-Features: AcwNN1XbrtOjyAjk34lMhPRdk74NuYmtXDM7SIXKrX-neV2ZyPTLfYjVkINbpsY
Message-ID: <CAAhV-H7N7d_FTE9FT8cR-ONar+DkGtYN8KbxuMmDSw8xZbY=+g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peng Fan <peng.fan@nxp.com>, Li Jun <lijun01@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Sun, Sep 20, 2026 at 10:29=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/loongarch/kernel/env.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 652456768b55..c529a14deb18 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -25,10 +25,7 @@ void __init init_environ(void)
>         int efi_boot =3D fw_arg0;
>         char *cmdline =3D early_memremap_ro(fw_arg1, COMMAND_LINE_SIZE);
>
> -       if (efi_boot)
> -               set_bit(EFI_BOOT, &efi.flags);
> -       else
> -               clear_bit(EFI_BOOT, &efi.flags);
> +       assign_bit(EFI_BOOT, &efi.flags, efi_boot);
>
>         strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
>         strscpy(init_command_line, cmdline, COMMAND_LINE_SIZE);
> --
> 2.51.0
>
