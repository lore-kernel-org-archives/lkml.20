Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593527;
	b=xHGaI4pSBD8sBn9SL6b0jtRfSrzF1FCNOOyzch5gl2bXOoR8afIUlrrefY97UneCc9eP
	 lIu7sNX22ccGJISHK8+kfXOEH3pGA9EqsSzSYDbSWfm01dVtjT7MCTmLfS0slAiev90VM
	 iIL5FqOBrjLK1nLG9B9IJWqQKHbz4JiqsEhpRlcGdAgEna1gqn2o5U1jxGFKiHBW7DJNv
	 NhhF0NPZOWfLycqXIWLpqAmFz6HvKgQzZivrZI1M9X/RM+c4UuWxN7W46tn9y+XDzvz6l
	 q02qE/lPeHs2TZU4UQ7Rt4Asj/G3G424oAjCVFHXcMH/s8lN9h2tUC4IEwHWfjsfwQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593527;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nyxWtYc20DJP4u8pz2LdUF3hk9Hp+2qBVra998XMy24=;
	b=H2k31QE/omj791C9qYw5KLqOWYC///Gzonek3iUaV5ox7uXJ2X2YE59/cAmZkOT60czy
	 Febngq3G78amr8aKbrPevbuwKbRwUIvqzKlSOE+9RuJ3yLHBpOYXwPMkjCcfXtVgCbThK
	 x++2XvyWdloPzdhEJHAsYjQVBz6p8NZhI1M3G2buw7HzdobHPOYXkUtsAxgQKeqNxoj+j
	 3ulgtWjoCrNsOmpMIlTk2sqiFJ2GXoJqls/KxliAKGHieE+B7787VMkVZqR2659fQxkpT
	 4aOtAIS1JW2ySHY6pin3bx+EETTNsIYHNsYWudBjHlsOs9i7vQh9YYPZK+v/8T/L/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S29yPnPP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9836606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S29yPnPP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B4E1F000C8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794593527;
	bh=nyxWtYc20DJP4u8pz2LdUF3hk9Hp+2qBVra998XMy24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S29yPnPP31FnVRMo4m0A8Pf5Peraz7K3IqtzgaSRIGL1vKp8fO0ycGq7Zy0Im0lD3
	 HgqGcXdk1GX0hyBAzy5SLqDWlfLmOz7zvhWiexe0zk8PAG7mjf+dV8qD8ahS6xrJH4
	 l+SuzR71Dz/fIjhXXkzn2C9/BBtFrR+Drdw0bx3ItDUsVoXXWz1vYCUIsuwJvqcooQ
	 TowXKTuUkiL8GVazoGLjD6SsSJd4nzTZsc31nVthubXukJGNsquSRT1fUv6xxGkF8/
	 bMo/3GD2eTEPWPJNtoky8qaqUkhKzS+EpOIRjy4aY9cEsTZLFqKbaeL2chkv2RjGSM
	 TbYU88yCL04Wg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be47aa555cso1793189e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:12:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGQjsEGmTybB8Ma24o3s/BkedEWqZXF0H67DkkCh37nbc1chlTvPvG3XUngBJ9tkp/sFdt6t2HLJS9izcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8adrq1GscwAPaebbrkyeeEVAFvFFc9IOSHCw46D6oqeCMhLmnW
	YsTAUtfoAJ+3tZtdz0BEQ7EIL/v84l44jcdy9yk71uk24XCKUs5b4kWuB3q5eAD5F5gDaWjot6+
	xuHpmG0S2KYiK2W7Sar9BwxSSqmRpIDc=
X-Received: by 2002:a05:6512:2385:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5c1709ca3c0mr1111732e87.31.1794593525814; Fri, 13 Nov 2026
 10:12:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013023411.1364546-1-yangyongxin@kylinos.cn> <20261015081644.1353321-1-yangyongxin@kylinos.cn>
In-Reply-To: <20261015081644.1353321-1-yangyongxin@kylinos.cn>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 19:11:52 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jcUvFH7PN6h4tVL1Dbimh-+ZJynggTrAww5ffsD3hrWA@mail.gmail.com>
X-Gm-Features: AclHuK_qdOyIKNUeu22nNU6_Fc1p_bGAtc1PeZzbUBR4_sUPD0EoxkyjDYY6xkg
Message-ID: <CAJZ5v0jcUvFH7PN6h4tVL1Dbimh-+ZJynggTrAww5ffsD3hrWA@mail.gmail.com>
Subject: Re: [PATCH v4] PM: hibernate: Log the hibernation mode on entry
To: Yongxin Yang <yangyongxin@kylinos.cn>
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 10:17=E2=80=AFAM Yongxin Yang <yangyongxin@kylinos.=
cn> wrote:
>
> The hibernation flow is the only place where the kernel decides what
> to do after a successful image write: hand over to the platform
> firmware (ACPI S4), power the system off, reboot it, or resume from
> the image right away. That decision leaves no trace in the log. If the
> resume path later fails or hangs, the tester cannot tell which outcome
> was requested, so a report of "the system rebooted instead of powering
> off" cannot be attributed to configuration or to platform behavior.
>
> The mode is selected through /sys/power/disk and stored in
> hibernation_mode. Append its name to the existing "hibernation entry"
> message, so that the line reads "hibernation entry (platform)",
> "hibernation entry (shutdown)", "hibernation entry (reboot)",
> "hibernation entry (suspend)" or "hibernation entry (test_resume)"
> instead of a bare "hibernation entry".
>
> The name comes from hibernation_modes[], the same table that
> /sys/power/disk uses, looked up directly by mode index.
>
> No functional change.
>
> Signed-off-by: Yongxin Yang <yangyongxin@kylinos.cn>
> ---
>  kernel/power/hibernate.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index e365e440cd52..2bbfd7ffafe5 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -72,6 +72,16 @@ enum {
>  #define HIBERNATION_MAX (__HIBERNATION_AFTER_LAST-1)
>  #define HIBERNATION_FIRST (HIBERNATION_INVALID + 1)
>
> +static const char * const hibernation_modes[] =3D {
> +       [HIBERNATION_PLATFORM]  =3D "platform",
> +       [HIBERNATION_SHUTDOWN]  =3D "shutdown",
> +       [HIBERNATION_REBOOT]    =3D "reboot",
> +#ifdef CONFIG_SUSPEND
> +       [HIBERNATION_SUSPEND]   =3D "suspend",
> +#endif
> +       [HIBERNATION_TEST_RESUME]       =3D "test_resume",
> +};
> +
>  static int hibernation_mode =3D HIBERNATION_SHUTDOWN;
>
>  bool freezer_test_done;
> @@ -794,7 +804,8 @@ int hibernate(void)
>                 goto Unlock;
>         }
>
> -       pr_info("hibernation entry\n");
> +       pr_info("hibernation entry (%s)\n",
> +               hibernation_modes[hibernation_mode]);
>         pm_prepare_console();
>         error =3D pm_notifier_call_chain_robust(PM_HIBERNATION_PREPARE, P=
M_POST_HIBERNATION);
>         if (error)
> @@ -1130,17 +1141,6 @@ static int __init software_resume_initcall(void)
>  }
>  late_initcall_sync(software_resume_initcall);
>
> -
> -static const char * const hibernation_modes[] =3D {
> -       [HIBERNATION_PLATFORM]  =3D "platform",
> -       [HIBERNATION_SHUTDOWN]  =3D "shutdown",
> -       [HIBERNATION_REBOOT]    =3D "reboot",
> -#ifdef CONFIG_SUSPEND
> -       [HIBERNATION_SUSPEND]   =3D "suspend",
> -#endif
> -       [HIBERNATION_TEST_RESUME]       =3D "test_resume",
> -};
> -
>  /*
>   * /sys/power/disk - Control hibernation mode.
>   *
> --

Applied as 7.5 material, thanks!
