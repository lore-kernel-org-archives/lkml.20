Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F9A39DBFD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787957024; cv=pass; b=TZGJnJ9R+KhRbiNGQoR834YTR1WPxyMNxzIOWet9lkrw8EMQBckY/FyB/5vu9x3NMOy4Rn/0pRxtCn8ehvlnaM4iUU6WmgYMebDo9jMRdbyknetWA8LgEyUufaT/L4J116auOpiG60DvoM9zE6COq9rbJgEL+WQyut0UFk6LcEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787957024; c=relaxed/simple;
	bh=DGHs5SQQXiotArDuQZ0B9Dgbv8T3sLVqVQ1dRhCjkp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUJRrifMCucSbqnBi9zBYB3iUnM8yrnLHDOlYT/umanMNh2mhNtBu7bYCoeLBIPpnf+Gj4S/0+l/ixrbLvQjynam0SoJj7ZmXObKNyfgZ06muMh3GfMhTVCNiscnDtxxvq/aa5Txl+FLhxxf0bpYoBaKaQtEV3IUmv+zRR3gSj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqN/alX9; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqN/alX9"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-836c5b01e82so23858327b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787957021; cv=none;
        d=google.com; s=arc-20260327;
        b=Desbc5QBiX+LkbQjv3H3rfYVhpgyzR2glWRPz7ZE5EXnge2BELI3GJHrG14k9FHil/
         EpldrJstr8D4ItFh90N4HUN7K+vRAzhSBRUc9kDaR4ouvtLHDFiN5TZPhbIoMBfFkf5+
         5BXcqS+inkYpU6yw20hppYMoN28duHcgg9XI60a1jKAOE+aiJxxe+TUyL4OEZML+PFmN
         6p+cQol4L+GTYw03qcViomCzDx1jBaKue0Po0AMVMyHXu5cLteg8pfX1OoMb0PDoU+pY
         LihaJXV3RE5CUA4V22nneXcn9iAphrkTklFxjXiiPbJVmFSwijE+58/oVZugHRE4N2mx
         hJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E2b2r/YcBr12q+KrOQE2EJ7xuTvSb8Ce2sgX6K3dty0=;
        fh=mTEdggkkC8aJ5dRcauNM4EdGFce7+FiRFBcmNkfaj3I=;
        b=bVvm7itsw9axvkbZ2VtEMWpf4aXfUVTXqV3NGUo5nYbWlCWOHWu1NxN8Se5BKwmk+J
         ztcDZp1Bo0hHYy/7+ZCGqYlJcnHsQbVJoPp2kzv9nF4XhnPsjmNrGEoHm09d6l09MX5Y
         Ze4SMarlhahRjjD0FtPBnVDnhCe1ztCIEucBfKbqFdj5VEh4gbZmDxD92TgwTKEnHV2l
         H66/8YUvldS2YqjDIFp57FUYKjvqUabaBhFhpnyoGrFp9gaBlAWpt19wMT+vxHA8/y9w
         E7fYnC02tKpnsRzO4e0Kf0mio0OOfa3oBv0B9DjgItBD91y+r2EgZX0PkUYZWfATWanP
         /XfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787957021; x=1788561821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2b2r/YcBr12q+KrOQE2EJ7xuTvSb8Ce2sgX6K3dty0=;
        b=lqN/alX9OpBf+DPeZHsWQLM5kFGFKYUMX5/eq/j42Y0DqCV9giWgPwNmFyQD4CLx79
         77k1zvC3Q97ld53Ni7hvA9hB+RWAFdoRdS6dz9AQS5kLeULXasYtBl5Ol5NeJ8cGBRKg
         8MAbYMMN4ESqnoev2Mje6DuTE8AI2J5XfaenSx/c+nSobw+8GwqyOMJRBi7vslWIAkiR
         v5d4H1KpGa03MFv9bpTfV9e5/frM1n5c8oJPrwlpl2FalSVG0qKkJIpqbxMGrIMhCesn
         BB3p7QFfocYlcDWWN8AJd+W0Gqpf+5Eg0Aee3GrOc9R5im9GMYWatY+RUjOCer7noiaI
         oORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787957021; x=1788561821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2b2r/YcBr12q+KrOQE2EJ7xuTvSb8Ce2sgX6K3dty0=;
        b=pLq8YFpmoTRs2jbHP/QdM4S2oFZ0d1OkorbOPVuVvzvO6dZ3guZxEzhCaj6jORmv2k
         TDUiypibjWL/TLVb5UBNetH5CjPUndfQrHFm6zzxOVfWDuhhz58YO+ZmZTtMacs3rubu
         O0yvM37R0Ixq0FVrNxlwsWAJI8I8S++tKbNhQzZDgCRYpmzz5nGS/J9XWTsgOjQwyaiD
         zCiNbIHCcMMgL6YTEdzGsB/TUEeWLjQNFBPCwWoK+Ut0FzgDO/BTrSZNy3A6vHQ786l0
         jLTFUu3IemrpWRA/0tzILv6N422Q6PJtrjb6n1zzXcArwbfP9AdKP+WI7zpV7hByYxz5
         RMdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxojElpMDcJOdjvGxEj+dEp7bVlafFkCYBbiGqdmS6zxeiSepphZaxHt+qgkOAmF1761RmCJ1IaICazcBM=@vger.kernel.org
X-Gm-Message-State: AFuF++koEzjmGNINEL4UW9gzMOUcMpnH4amPaSuf3sh7resKQN35i4Cs
	Z2GSkto/DfZ0bhmkCAGwEHmgDnR9fdvtFv41FxEJEpxwOh25zOCucp8VPPJZA+EmJ3s/KjWelmu
	v3U8B3t8aXkQd1pUmCmEX8iG6QSXXj41RI6kP
X-Gm-Gg: AYBFou2sQB5JpUEYivDqXSkR8UHFYcIJXacPU/JnJmV/00lxsUTs3mXQWV1ofMDldYw
	oaxdrl1Hzj9C4PTGhAI5qYsvP7cPlTUvMv84qcydsTKTjeFd6/7DnTflKgmCPh/fWnTUISbeNun
	yJxdIqfG5G5NLPZILshPAOthie/bqu1XG0zzM/O+xiFoPAMC4Czkpap0NcejJ4gD8AUM6Sz0eTn
	6P7eLahi0sNu/b2LiNxXC+JZ5edzOznmElcbhH6AjLEgNChCdyxwQVNsYdPrbjR1oFnywGhTxlG
	LIICpWDU7CHn+DPIl6e7fon1A5bIDf6JjKkLdzQuZPaJNCGq6sszeUCvgr+K969Ilcn+TxE/pxa
	7
X-Received: by 2002:a53:a690:0:b0:668:1c55:4283 with SMTP id
 956f58d0204a3-66e4c76d946mr2712395d50.49.1787957021314; Fri, 28 Aug 2026
 15:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12955564.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12955564.O9o76ZdvQC@rafael.j.wysocki>
From: Julien <julien82453@gmail.com>
Date: Sat, 29 Aug 2026 00:43:30 +0200
X-Gm-Features: AcwNN1XYBX11rSIqXNiWyf1cOFtlIqqPNasGuWLMN_MrER9LH0cNWCpmTMsLH7s
Message-ID: <CAJOGg3x4nMtSJeiLa2nsBFFuG4GRyvj7MbErcdOgxyuXCkr_og@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: scan: Do not combine resources that overlap completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, jarkko@kernel.org, 
	linux-integrity@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 9:11=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> Commit f234fdaae1ca ("ACPI: scan: Avoid registering platform devices
> with resource overlaps") attempted to avoid platform device registration
> errors due to overlaps of resources of the same type returned by the
> same _CRS object in the ACPI tables.  It did that by combining two or
> more overlapping resources into one, but it went too far and also
> caused resources that overlap completely to be combined which broke
> the arm-cmn driver that expects two MMIO resources to be present for
> each device it binds to and it expects those two resources to overlap
> completely.
>
> Address this issue by adding checks for completely overlapping
> resources to acpi_platform_adjust_resources() and add a comment
> explaining what is done there.
>
> Fixes: f234fdaae1ca ("ACPI: scan: Avoid registering platform devices with=
 resource overlaps")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/linux-acpi/20260819003752.GA3063251@ax162=
/
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>
> v1 -> v2:
>    * It is better to check for complete overlaps both ways as suggested
>      by Sashiko.
>
> @Julien: I would appreciate testing this on the machine that needed
> commit f234fdaae1ca.
>
> ---
>  drivers/acpi/acpi_platform.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> --- a/drivers/acpi/acpi_platform.c
> +++ b/drivers/acpi/acpi_platform.c
> @@ -85,7 +85,13 @@ static unsigned int acpi_platform_adjust
>         for (i =3D 0; i < count; ) {
>                 struct resource *res =3D &resources[i];
>
> -               if (resource_type(new_res) !=3D resource_type(res) ||
> +               /*
> +                * Look for overlaps of resources of the same type that w=
ould
> +                * cause resource insertion to fail down the road.
> +                */
> +               if (__resource_contains_unbound(res, new_res) ||
> +                   __resource_contains_unbound(new_res, res) ||
> +                   resource_type(new_res) !=3D resource_type(res) ||
>                     !resource_union(new_res, res, new_res)) {
>                         i++;
>                         continue;
>
>
>

I have tested this on commit 1b78070aaef6. It seems the patch is
already included in it.

TPM device still works. Here are the logs.
acpi MSFT0101:00: [mem 0xfed40000-0xfed4103f] expanded due to overlap
tpm_crb_acpi MSFT0101:00: [Firmware Bug]: Bad ACPI memory layout

If in the future if I need to make tests again, should I do them on
the Linus Torvalds' branch?
