Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330893;
	b=TRQv7d0f4V1SyynxtwIUdZRHyNdx1pEKyHZYEeuvQqBcncl9NbL7UAfqZ6iYBdBFw14Z
	 D338ti8UrrJToAsysHMSDzcNHnJaGIokcl4WV8Q/tTX7SRNNu5TsIOh8YCsrfp4TiXkAx
	 b7L594XFynUHgXhG/qjzG1wKTC7F/awfZIiYvnqLInJ7zO/X+jkHsdmjbJiNQLShfzKHQ
	 AKCEyZ13soNOdY5MfY7Mi/Q0m9nG1tucalRvJTCO7crbrRIqhvc2DKIiLhpRO7vK+CWpe
	 sJ+b/vfbaIt+cS+R2FC0xMYkPbG2oSP1nOq2gUo5L5FxOr4bYRLB0/52a5nr42aujsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330893;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jjc+r1dobxLNbJ8e1NVYfvHKpvOazYh/KlOqu1xm6OM=;
	b=C8Iw7EEWawJMXJa01xCe7nlZaUPWvv3MkrkbF+qy4b17uDMOb532ml7SMpj52w37JhNz
	 vdrxLfdFmJv+3dDz5yBdn3ucTPcU+yRDWNsqmE+5YcVPdahTsQCXD7ljJqwY7GcLq7oA+
	 PXGYO9pzN2dcviFfsKMWWsVkHUQyfGVroLxKhWMGLSu2ZtVse3MrgJgJ8QJAqL6pRDqEk
	 uaVfjQpO+bzgDSHrlDmKp2sMiZhVeVkv9t6n7icwIqOS3kJdXJ8KK3w1Qbfu1T33Sndb9
	 0nR+k9eNGQitKMKOYzCxPW3bVA1z5vIEem4DdkfCX2HbKahEcdF8xu+mC+u5r8nT9pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d83XMBKL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d83XMBKL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B38B1F008A1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794330892;
	bh=jjc+r1dobxLNbJ8e1NVYfvHKpvOazYh/KlOqu1xm6OM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d83XMBKLPCrcB8/CQf5heAYCOQAdS4Yfy5a5WMoFXu/Q13Z+PstNI06nHQpzlfKdg
	 xDEmsW/B2OSW56aa7q1oEkn26GyrbNs7vrt46dZ8IFFR1/1rkMRFtTC1DSiVae6OTR
	 /AJeyY0nGllMPWNO/Ac03Msmf4DMOhNA3MPTt0I9PfeK5758s1XlWy26ibxM9rrs3K
	 B3PWs6fYnXTW7uakZC6pczNXNwwIbwJUvwjmMxmd2LjHXCSjLfIdaJbhYU/9FVTSwF
	 +omNTVWOtwxkMzAAXCa+G6S9rLXekWQ0MIm6q9zmPa+l8e6k/h/+KqmlFwliSNc3I+
	 2kWanNbQhKgIw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2330429e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGMSsbOKLhWNYwYExBKsipu5OB5s3HUnnZ5b8flUN5ECPKVx6HT7XlZS6PZ1XIHN1YqIkr6pcc6clfG6Yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GWdfoxqi3rzcu1Fmgau+UINnV2d3I5Wbdy/HLKEwZDjTnoL3S
	A5CAzpcXzC8GEf8gK9f0wiRGgHT/YPsz2xvh61ZkhLt88IDo0hwf3uP6hgl08C57CLVvdXFOYW5
	cPoXoO6Yb8eB746UJz/Pf6YW8MqPI5WQ=
X-Received: by 2002:a05:6512:39cf:b0:5c1:4bac:ce54 with SMTP id
 2adb3069b0e04-5c156e9f0d0mr1093819e87.11.1794330890887; Tue, 10 Nov 2026
 09:14:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031211938.581230-1-hugo@hsal.es> <20261031211938.581230-3-hugo@hsal.es>
In-Reply-To: <20261031211938.581230-3-hugo@hsal.es>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 18:14:38 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hKy=t4q61vwOZWjxh=7tonhnJZ4vTX9YAAqAP85nnSZQ@mail.gmail.com>
X-Gm-Features: AclHuK-qiQL7-IcaLJJi24IW3xrf_qtHskfk6wuPKYyA9nJtmz79AgMHe4OM188
Message-ID: <CAJZ5v0hKy=t4q61vwOZWjxh=7tonhnJZ4vTX9YAAqAP85nnSZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ACPI: AC: Add sleep quirk for ASUS ROG Flow X13 GV301Q
To: Hugo Sales <hugo@hsal.es>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:47=E2=80=AFPM Hugo Sales <hugo@hsal.es> wrote:
>
> On a plug-in, this laptop's EC handler notifies AC0 once, before the
> adapter status bit that _PSR reads is set. The driver reports the
> adapter offline and no second notify follows, so user space that
> switches power profiles on the AC uevent, such as asusd, stays on its
> battery settings. Unplugging is not affected
>
> Add the machine to ac_dmi_table with ac_sleep_quirk(), the 1s delay
> already used for the ThinkPad E530
>
> Signed-off-by: Hugo Sales <hugo@hsal.es>
> ---
> The EC's plug-in handler, from iasl, without the EC locking and the
> ASUS WMI event calls, and with its two sleeps merged:
>
>  Method (_QA0, 0, NotSerialized)
>  {
>      If (ACPS ()) { ACPF =3D One } Else { ACPF =3D Zero }
>      Notify (AC0, 0x80)
>      Sleep (0x6E)
>      NBAT (0x80)
>  }
>
> ACPS() returns bit 0 of an EC status register, and _PSR reads the same
> bit. Polling the online attribute put the change 392ms after the
> uevent. The battery handler _QA3 notifies AC0 too on some paths, which
> hid the quirk now and then. On an unplug the bit is already clear when
> _QA0 runs, so the notify reports the right state
>
> With the quirk, both plug-in and unplug events reach user space 1s
> later, with the right state
>
> The delay runs in the notify handler on kacpi_notify_wq, as it does on
> the E530. acpi_s2idle_wake() flushes that queue after dispatching the
> EC GPE, so an AC event during s2idle keeps the CPU out of idle for up
> to 1s, and a suspend or resume right after an AC event can take up to
> 1s longer
>
> Tested on a GV301QH (BIOS 418). The match covers every product name
> containing "ROG Flow X13 GV301Q", which includes the 2021 GV301QC and
> GV301QE: a public DSDT dump of the GV301QE (BIOS 413) has the same _QA0,
> ACPS() and AC0._PSR line for line [1]. I found no table dump for the
> GV301QC, but a GV301QH board has been seen labelled "gv301qc", so they
> appear to share it. The 2022 GV301R and the later GV302 have different
> product names, so the quirk doesn't apply to them
>
> [1] https://github.com/andrewrabert/asus-flow-x13-linux/tree/main/dsdt
> ---
>  drivers/acpi/ac.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/acpi/ac.c b/drivers/acpi/ac.c
> index 1cd7482bc0246..b014028555de9 100644
> --- a/drivers/acpi/ac.c
> +++ b/drivers/acpi/ac.c
> @@ -172,6 +172,18 @@ static int __init ac_only_quirk(const struct dmi_sys=
tem_id *d)
>
>  /* Please keep this list alphabetically sorted */
>  static const struct dmi_system_id ac_dmi_table[]  __initconst =3D {
> +       {
> +               /*
> +                * ASUS ROG Flow X13 GV301Q notifies AC on a plug-in abou=
t 400ms
> +                * before _PSR reports it online. Seen on the GV301QH, an=
d the
> +                * GV301QE runs the same EC handler
> +                */
> +               .callback =3D ac_sleep_quirk,
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "ROG Flow X13 GV301Q"=
),
> +               },
> +       },
>         {
>                 /* Kodlix GK45 returning incorrect state */
>                 .callback =3D ac_only_quirk,
> --

Applied along with the [1/2] as 7.5 material, thanks!
