Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E74B53ED
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828244; cv=none; b=JGwPZKz5BDS4Do6DmomH/0LMoHFSW5lhW6wF65lruxWUjPnJl8JVCrIX8Abmor0HWH72If66RJfKS0R8B0GvVR0jsv7Y+7Pk420t/rHu656kVMKpNESm3rv42MeDXQVRpuwaUwd4iPL4ZE+MOH1vRCLiyUe7JwVSFTQfBUnJcxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828244; c=relaxed/simple;
	bh=gG9Kx7p7puwk2D18xEHfDWSfIqsQFAcxntsqTlAcQrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kP+kcZr+5ZJRmgyalVGNmud3JM8cGDhWkcqU+V1ahaPSWMExcdmlDvYBWVPMyQ5VCW6maAPKzadXsUfarfIZJu02Y3w4Qr9QK/iba3z8gE6C4uAN4bYvYTSsYYy0sYM2OAS09kwJKSiFupkIQs8EncAtJYgYME27ukWLcIpRAws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UG4wZEA+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UG4wZEA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EECB1F008A4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791828243;
	bh=BQKaj5Awg5w3e5n3316cCBdk7B1Ni55RY2sulUGiQTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UG4wZEA+09wnT3hhsYiJTI5gp7ItwMYOgHmghTaQc63BsnG+BdwKAdwkW1ehU3XVo
	 yulscydhvCCTnKp0TADs166eUDO1ggujPJTlv4gR7BUgOK0XT5fQq1jQdbpVeAdeU/
	 MImU7dG6KmfyJhALG7+B8rUfYLGoUBqvlITfkmtwIeJyyXUp3Mh4iqI8dN7wPtAdXJ
	 zXb917UDhCxhlgPFbSfMNDzoEG1cnz1VXhLHQmj3VI8CcmZaXc/nvkDX4Qaq9FxdXC
	 Z6wAQBE2bYhTsuR65mzKp65eIacAyOnZOlKc6eO+faXzWdfMKpCKlbz+aPi2QXScqg
	 RLBF5JgwEAzSg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso2530888e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:04:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2NgUXlsNsR8l9NV478jjUllfHa28DNzdYyR52umoAa6CnOYSc62T46KPWcJY+bm9ExcB2R25nC0XQbp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFS7cvWm7+XGyX5KZ5eIJOUq4JJYhW9cgKWj6rvPKrgudM59K9
	w+w4h9JPORupl56fX0gzHcwJMAisCjR9F0FGasTFHJrqQLqYaQSQPjvbQEMLeNG0Qh4feTJ3LCf
	Nf1Y2U0ww1y2hycCfFvBQFK7HXCF0wXQ=
X-Received: by 2002:a05:6512:2399:b0:5b8:f59c:dba3 with SMTP id
 2adb3069b0e04-5bcde8bc89dmr2896031e87.35.1791828241779; Mon, 12 Oct 2026
 11:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005174939.53873-1-hakan.abay84@gmail.com>
In-Reply-To: <20261005174939.53873-1-hakan.abay84@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 20:01:57 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iUgPZV9BtgH584GSNCYkWwgfw04PZ6rkG6tJoGnpMofw@mail.gmail.com>
X-Gm-Features: AclHuK8lXAoIHf2r9Eiq5zfHASH537dA3HLlccMtYiZlwGahTanKVaYmYQKyExo
Message-ID: <CAJZ5v0iUgPZV9BtgH584GSNCYkWwgfw04PZ6rkG6tJoGnpMofw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: PM: Add unused power resource quirk for Casper
 Excalibur G900
To: Hakan Abay <hakan.abay84@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 7:50=E2=80=AFPM Hakan Abay <hakan.abay84@gmail.com> =
wrote:
>
> On the Casper Excalibur G900, the NVIDIA discrete GPU and the second
> NVMe device become inaccessible when unused ACPI power resources are
> turned off during initialization.
>
> The failure is similar to the THUNDEROBOT ZERO case addressed by
> commit cd7ef20ba8c6 ("ACPI: PM: Add unused power resource quirk for THUND=
EROBOT ZERO").
>
> Without the quirk, the NVIDIA GPU and the second NVMe device are left
> inaccessible in D3cold and attempts to transition them back to D0 fail.
>
> Add a DMI quirk for the affected Casper Excalibur G900 with NLCC 001
> mainboard to leave unused ACPI power resources on.
>
> With the quirk applied, the second NVMe device remains accessible. The
> NVIDIA GPU can enter D3cold while idle and subsequently return to D0
> for accelerated rendering.
>
> Link: https://bugs.kali.org/view.php?id=3D9891
> Assisted-by: LLM
> Signed-off-by: Hakan Abay <hakan.abay84@gmail.com>
> ---
>  drivers/acpi/power.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
> index 23a4e207a01e..2e79defca42b 100644
> --- a/drivers/acpi/power.c
> +++ b/drivers/acpi/power.c
> @@ -1121,6 +1121,18 @@ static const struct dmi_system_id dmi_leave_unused=
_power_resources_on[] =3D {
>                 }
>
>         },
> +       {
> +               /*
> +                * CASPER EXCALIBUR G900 laptop: Keep unused ACPI power
> +                * resources on to prevent the NVIDIA dGPU and NVMe #2
> +                * from becoming inaccessible.
> +                */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "CASPER BILGISAYAR SIST=
EMLERI"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G900"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "NLCC 001"),
> +               },
> +       },
>         {}
>  };
>
> --

Applied as 7.4 material, thanks!
