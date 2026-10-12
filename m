Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EB8471CEB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828034; cv=none; b=pttGAIoc68xS2YhAdlyt/9fogZIo8HNoTfm6j1Huw2J1VFAwtO3z4Xu2l7S9VUiyt8R2FZCkCvX9xvy7p8PPc0ZQDh2MfzJk6TZ+BNwqP6qpZhRVNd8fzEVVv/DZ76yI1U/oYr113LBcytRg6mxvEHNto16KqoX29ZqEqcSiI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828034; c=relaxed/simple;
	bh=d4E5O3epvH8jKsEIniqHbCUy5JQnzerDmgHQm03521U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtwVs0zTG4a/B/I5GM0ATYHCG3xCSQlaJ0VwWpAs0wGxzjmXn8T17g3U5k5UFTizuoajEOOnqqbv4tK2+YjDeYTqHhhLlafgGbb9IMfxCZBKGVdEsAf0p5KBrUbDF0Wr45TMvgs1eUAji8rinRP+TAOJgSk8F/3yqXnn/wgKP5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cV6QVP2U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cV6QVP2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950041F0089B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791828032;
	bh=n2aKVlaOn/xf/tnh17NU/X9b0uiGgn1KqnjjmBYlsLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cV6QVP2UuV3gPKOkX9HEzmRtdwsOtgD5S3UIusMS4irdAheQ6A8X5o3PtvhuTI+On
	 AlsypYMVQvA4a5tPIs7Knff/NBO8ktKbwORAMK+Gh1dS2JoMSVtQo0xoRuneyTeC7n
	 /HMTpt0/QwH2pEHdWzcbvhE6HTaQX5H7E0mfRTXb3aOwrARiZzHXi8dL/IQabR9wVF
	 Vdh1uKJ4Ee/d5SwcJ/spVSN2IvKaemBdsn2EuzQD5FvR4DJU0siZHg6FmXiA+ppPfK
	 Tg99Bpe7/bSwSRG/iMNlrUxgwRz0bTvb7M6RCEez+jo1oIer+KeNm9/xF/SxZp+HfT
	 4ZSqDu31TAl5A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso2387146e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfdyDlZ1uHzLml+24VnuEA1J/K1oh2V051rnbMmrsocV6+MJd6XUd2nnBk9o4gt/XBh+Whf86zEpYcMC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2WxNRxwGzWX0kBFbUUwLZAkOU7pgKRVFMq+PcOGDMEQHTVhom
	lCGfBJ39iu2GWiA0dXOnjy+G5WVmPhBQtFWxvh7Fsn3701/u7msUpqboVJ2H88Ah/68pVA2BvBh
	9mPgXFfxC0JWjL+w9TVUq1OOz1WNi7ww=
X-Received: by 2002:a05:6512:1284:b0:5bc:b728:324 with SMTP id
 2adb3069b0e04-5bcde6be018mr3246591e87.12.1791828031043; Mon, 12 Oct 2026
 11:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003164019.11195-1-vibhor1102@gmail.com>
In-Reply-To: <20261003164019.11195-1-vibhor1102@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 19:58:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hv2W1tQ7sLW8+zCScFOJKfR82fU7ri52nSvQGTyPk2JA@mail.gmail.com>
X-Gm-Features: AclHuK84bNp-rzUU__PEXDwLo_LOG9a36QNeMV7vaX19OZaDIqcUcDIrvWWwYQw
Message-ID: <CAJZ5v0hv2W1tQ7sLW8+zCScFOJKfR82fU7ri52nSvQGTyPk2JA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: dock: Retry probing battery docks after hotplug
To: Vibhor Goel <vibhor1102@gmail.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 6:40=E2=80=AFPM Vibhor Goel <vibhor1102@gmail.com> w=
rote:
>
> On a ThinkPad T480 booted with the removable battery absent, reinserting
> that battery can leave BAT1 missing from /sys/class/power_supply even
> after firmware sends an ACPI add notification.
>
> The battery dock platform device already exists, but its driver did not
> bind while the battery was absent. During hotplug, acpi_bus_scan()
> updates the ACPI device and attempts to attach it on the ACPI bus.
> acpi_create_platform_device() does not create another platform device
> because the existing physical node is still associated with the ACPI
> device. Consequently, the existing platform device remains unbound.
>
> Retry probing the battery dock platform device after hotplug_dock_devices=
()
> has refreshed the ACPI state. Restrict this to battery docks. If the
> platform device is already bound, device_initial_probe() leaves that
> binding in place.
>
> Signed-off-by: Vibhor Goel <vibhor1102@gmail.com>
> ---
> Tested on a dual-battery ThinkPad T480 with an aftermarket external pack.
>
> On Fedora 7.2.8-200.fc44.x86_64, tracing showed the firmware add
> notification, a successful ACPI rescan, and no attachment attempt for the
> existing dock.0 platform device. A subsequent manual bind registered BAT1=
.
>
> On patched upstream v7.2.8, booting with BAT1 absent and then triggering =
a
> firmware add notification automatically called device_initial_probe(),
> bound acpi-battery and registered BAT1. UPower detected the battery too.
> Removal and reinsertion after binding also worked, without a second drive=
r
> probe. Both captures completed without trace-buffer loss.
>
> Physical reinsertion initially produced no add notification on this pack;
> toggling charger mains while leaving the battery untouched triggered one.
> This patch addresses Linux handling after that notification. The initial
> notification behavior is outside its scope.
>
> The baseline and patched kernels differ in configuration and Fedora
> patches. The traces identify the missing attachment operation and show th=
e
> new call resolving it; this was not a same-source unpatched comparison.
>
> Built the kernel and all 221 configured modules, booted with Secure Boot
> enabled, and tested on the physical laptop. The patch was developed with
> AI assistance and reviewed and tested by me.
>
>  drivers/acpi/dock.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/acpi/dock.c b/drivers/acpi/dock.c
> index d7f3a8912..748df19d9 100644
> --- a/drivers/acpi/dock.c
> +++ b/drivers/acpi/dock.c
> @@ -445,6 +445,14 @@ int dock_notify(struct acpi_device *adev, u32 event)
>                                 break;
>                         }
>                         hotplug_dock_devices(ds, event);
> +                       /*
> +                        * The dock platform device already exists when a=
n empty battery
> +                        * bay becomes occupied, but its driver may not h=
ave bound while
> +                        * the battery was absent.  Retry after the ACPI =
scan updates its
> +                        * status, since the scan only attaches the ACPI =
device.
> +                        */
> +                       if (ds->flags & DOCK_IS_BAT)
> +                               device_initial_probe(&ds->dock_device->de=
v);
>                         complete_dock(ds);
>                         dock_event(ds, event, DOCK_EVENT);
>                         acpi_evaluate_lck(ds->handle, 1);
> --

Applied as 7.4 material, thanks!
