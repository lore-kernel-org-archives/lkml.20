Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E35513560
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912400; cv=none; b=jJlIoOk9bxD8VBLLZL8TivqoO/zF3WQMxyXxDFz8KFNC2A2fd8y7xqTc8iKIGXWG93xvOr24mGK1Ux/nM9jMEfokk+Kn3uVVS3AWu6YLhtFivo/AfkYI5qJsxImivC8HivagY66qM31S3Xui1hWffOK46YshLt4e2LxBYQu1uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912400; c=relaxed/simple;
	bh=nfPcqN6uvjdceL4HmtYr9gSOYZKUut9WQcxMiVGpMss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3gZkjR3ZCoszH9KpsZt+F7pwuyPKqaVOUanJcCaUULCDQbZJdSrQCoaK4KHrouBX0kMqT8l8ljVcv2dEhtp/d/q/pCu7YNNthadRP6hZYilNXRv9iALFtOIHj94+BKL6zkFOaDshzC9xXvVbCCYZdoEqHyI64+YOJ3VSQC7gHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnMx8Iat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnMx8Iat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824341F0089A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912399;
	bh=YuGU2oRZZMIcanimACiswl0UWpdL+yaEonRTKhjl2lE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JnMx8IatAi4IqSxvaLXG8u7V0ycd2qB41golHtuX4Ft6fxCSM1G8wMnIW4LPq0xgy
	 6w1tEPuYKUqnwT67ocT4wkw4K2139AT3NpUN6r04RdolCN5WlHsFIQHVvOdbIRaOrG
	 EJDKlJyiAwCukYIjXDviG6Iktl3B41u77a1FHKiLRQaOxKZoo4l8BJjK4W7HF2ya0O
	 WIQr1kIJEImfFFnDWoJPmXTlGUmXmBmY0+IEJHVThwKYmm0qHSQcSqJx/kWUp1pMeX
	 ThSryfxobLBZQyk0H1tDi6folvvgfpEvyHAHe0ERZF5IOtuJxBYPKWduKcFLq/IpVV
	 GQCbclLXDcIig==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcc6094d7fso2589610e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:26:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBYYvIW85h/rJp/e3CCB6YIXUOX/sLUiIPDlzSYnkxfABYj3Ran97jNsTbLZ3qPWlXFCjDFAIIpZkP8+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqJuj0DoFa5K19OO5su5K+xgZnNTEG1SM/E6WOTogHstkW5LM/
	08f0zinvhJK9Ox+wa8qTXUSDO/Gd2FGyFWyyNzRFH1bU6wfS02NYHWvUaONRy2H5rEUFB3VCslB
	NdopSpdZeznWxd2vSzjEr0n+lo2eXWC8=
X-Received: by 2002:a05:6512:691:b0:5b6:1a7c:27 with SMTP id
 2adb3069b0e04-5bcde8c0233mr5431703e87.42.1791912397857; Tue, 13 Oct 2026
 10:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <as5jp0sHNb9GeYY5@sirena.org.uk>
In-Reply-To: <as5jp0sHNb9GeYY5@sirena.org.uk>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 13 Oct 2026 19:24:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hjAdzLi_cJP4Ztq1Rhzg529QZNcLxtPtnu+uBrOJ2Wnw@mail.gmail.com>
X-Gm-Features: AclHuK8Woi7CUD3V-AAFklFGxH8IKTmfDkXyKGOO7XvJONUuJT3MTGZ7TDTux_w
Message-ID: <CAJZ5v0hjAdzLi_cJP4Ztq1Rhzg529QZNcLxtPtnu+uBrOJ2Wnw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the sound tree with the pm tree
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Ma Ke <make_ruc2021@163.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Oct 13, 2026 at 7:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the sound tree got a conflict in:
>
>   sound/hda/codecs/side-codecs/cs35l41_hda.c
>
> between commit:
>
>   2f47382b3ea31 ("ALSA: hda: cs35l41: Switch to use acpi_bus_get_primary_=
device()")
>
> from the pm tree and commit:
>
>   8d70e364e866b ("ALSA: hda: cs35l41: Fix ACPI device reference leak on p=
robe failure")
>
> from the sound tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc sound/hda/codecs/side-codecs/cs35l41_hda.c
> index 32abb71dd4019,d50c3d8f5303c..0000000000000
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
> @@@ -1926,11 -1925,10 +1925,9 @@@ static int cs35l41_hda_read_acpi(struc
>         }
>
>         cs35l41->dacpi =3D adev;
>  -      struct device *physdev __free(put_device) =3D
>  -              get_device(acpi_get_first_physical_node(adev));
>  +      struct device *physdev __free(put_device) =3D acpi_bus_get_primar=
y_device(adev);
> -       if (!physdev) {
> -               acpi_dev_put(adev);
> +       if (!physdev)
>                 return -ENODEV;
> -       }
>
>         sub =3D acpi_get_subsystem_id(ACPI_HANDLE(physdev));
>         if (IS_ERR(sub))

The merge conflict resolution looks good to me, thanks!
