Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B304C77D9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058359; cv=pass; b=N7Fjtdw8GDdULvJGhtdBVNOLHL+GWbFJmlFo6rSfJ5F3Qxka79WxsEsbLxuGs370KyegHzzjNjKXSJvHWriKez3zkaRg9HGI2gW24kyQ72XA7iu+oSo9n5oTVSFjg0zfORWRgPeuJBimuwfui9hYvgVJGlToEP/nfW1H8wIZPBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058359; c=relaxed/simple;
	bh=0Zh6NbTCbBx+NVI+uqE5VDBeW/6Lziwppq9kVy8IRSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oITN4y9/TN+weGQ7ZgBFgWK254PtBWxwx0xFVq+ReYOI6VqYL+G2ogziqmFCe683y8oK5YMWyVZN2HWLItou6G2i+lNdH+1oBS8tITt1PSSwy47CqUr2hVFS4XXxtUp86XKdq/30o+OJfwaNSUrW6SxJeRk6w2gqb7+84uzx8ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2KHH4F5; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2KHH4F5"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso3162220a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790058350; cv=none;
        d=google.com; s=arc-20260327;
        b=JKojVkgj+cHIsdvRvkqJiYEp4ZFx8lrjAHQK1L4DtZACrTYWwHq7xrNPa2KQTuvoey
         pf+frZ6Sm9USCg8mMjxeKgPpUre7lrTonp0OPnPKsAQ1OOqtVu7KoRRb5Gz6YHVkXUie
         rgPmwCFaxrmZCeIoLIUx6ehVxNuJa4EKcs2AMabHNoVTCq29XUROvZ7JbvPd+mkhVSLX
         5vvsx6bY9+H9mioIItNgBsHy/Bnh975XHtc2sPa5SZyrg3BacTp1KGzgM5AojcR5D8/G
         4Nb8VEWrV9nyZxJ4gAJkUSFt4bdjmUtrjqkuXJ8Swb25w2ID4zSPU8D24QwlY0UB2v8O
         YaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xsw6RymLg8vrJTC9V4W0r3dpM0gHmJp+IdCdC5NThs8=;
        fh=/b0Z3FXX52kFS8RSvPPAa5OzWvpo+DTYvZEzuJMAZgQ=;
        b=MoSm8GJFRCB7ZxIPwdji6CzMbFf0vzwPUCW6DRiPNenUQ2xEPc1jEiSyKzUe6TUdOR
         /rfheVik59PuPjuXMF48LsBKVSQBjnP9ZG7LT4hrr5qJxP53P3e5NwTwLnmlEDhD6ftm
         BHlr7NWfroyMeEw4WEvaf7LZ9Sk17+dMZ523sGcEZiURpXjfzYk+V8f2iRSrV+HFVsmX
         IvxDEyk8Op79pwv+BabltBMjhRb0xUQJB/VpZXBPdLPd+HrFw0uZPVYjg95lcoS/rDEm
         RelgFwoev3a0rvHib6XHjOpN0wIqpJSTB54dkpiGgWG/DsxTB5dCX4tddM4n5xkzJsLi
         r7Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790058350; x=1790663150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xsw6RymLg8vrJTC9V4W0r3dpM0gHmJp+IdCdC5NThs8=;
        b=q2KHH4F5U039vDxALsjkqVgWgjevKqYBMcNpvXflitJMqXwfjAQDvWCotxoiEX/e8R
         AalpnCwa1ZtvypjESnhdOolrH0wowOBRO0dig+gPYORUBsJwec7kdYtkrdwkKDPL4gy4
         DJcCMPN2et5MclKz2cN3WhImiFDHnXckkgn2WSrQz9f9sb/oNA3j8UMKuRPm+G8BiwxZ
         MjyitoXCfFCYgcPAA3zWJ2h7gYLuqKS9B4YjCsWgaliJ1z/lsofUCpfybbqLZDW+Ao4y
         DLZ6W+HWVVlD3RMU07ggWxKO6MIXfMeZYSzU/5TEYMEkeiyaO4seS26M93eEKrT3sALY
         /0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058350; x=1790663150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xsw6RymLg8vrJTC9V4W0r3dpM0gHmJp+IdCdC5NThs8=;
        b=XRkiXcQ2ZJeT9N64ux4m9STYjJOhJiMxXYiCFF0VT3/Zi0fyS7riAKDlU4upMLXm+X
         uGpF4mfc8C6mBs/0Cm/zSDBSSeCRN0qBe8Nw09VhlqtGNLJE+copux/XQg7N3k7IP/zW
         bAU5b15omgljOvNsatvaefQ6KlrddKp7Uw+OC7M8OnFMXc7x+Ld2DQXbPLmbqEm6goMV
         Yi0FGp544W/ZKFshaMgWQT1KElObBBVMJ+bWxPIUmJu2Gl2OFBcAFgthNh9dtKmIRsb+
         s5aKSAPVQZRxg+xcMRYk8mggZhIHMR7kvhW67Gp55d+h5nQxrc7RHhGG4RMZ/dvP9j4B
         FIaA==
X-Forwarded-Encrypted: i=1; AKwUvByjFqXKdc/Gc1Nq7cO8bm5Tf9P4EAZFS7rK9KUm09e3mhF1LB/Efz8TrpDYqxbg3Uig+qT6426pmb+0jLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nirdqcUgCVXxiUL0wUL1OthILWmoiH0A2xA8mgUiPWYKseCPgZ
	11RHyoManoNJwGiSineXADw+7yHYwGF81QDuDJ8oCgRs8z2eufwdzcxVkVqyuOpUfDivuPcLyXt
	bUcjOh3BZZ39ih1lJrl40+aZG8NxWs20=
X-Gm-Gg: AYBFou3iK3d/aDw49EzVr1VsXubP8Y6h3xnVHbHtMWiXajlkrv9h5UFAzx+bW2EIimK
	LOMm44l8Dpmuu1KOTaUtTXurbFcj7VZVG1ZPsB537p0ZoMNHOl3zXWF7HcirPsW7lhW50gU/6l+
	Ol4Ru+x+E8OaFSzcsBGonHgh/OXQXUKN2P8ZKFDKl1HWa+sMpRbXFcH22Hz+JHP1vngbX8zsmDz
	USbKhSWL910/ZWWbW4/uLJ6goEqkhHTSjNGCiyzvYzzToRQXvxsL/cs1H3Ki2Rgisu/L1tKSXiv
	BLpFxDWihr1A/uUG30bnr5joEuzp/BJk8dQ9219+/h7tp0Bj+eAr30NXVgsQeIHEsQAB9hOgrzG
	oVxp6DynfYh37
X-Received: by 2002:a17:90b:3bcb:b0:39e:6c69:34d8 with SMTP id
 98e67ed59e1d1-3a07331ae7amr134090a91.60.1790058350508; Mon, 21 Sep 2026
 23:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260921175234.3137985-3-florian.krischer@fkr.dev>
In-Reply-To: <20260921175234.3137985-3-florian.krischer@fkr.dev>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 22 Sep 2026 09:25:38 +0300
X-Gm-Features: AcwNN1XCYQcpoYAJO_F2KOCSSGkPDz9AobuhsjJh05fJE4KGKFrobaYysqnjTV8
Message-ID: <CAPVz0n1HHP_D4jGNHHqO4AGZHAms5tCLK0Sftb9gn9ywSb8qcw@mail.gmail.com>
Subject: Re: [PATCH v10 fixup 2/2] input: serio: asus-transformer-ec: fix
 keyboard response framing
To: Florian Krischer <florian.krischer@fkr.dev>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 21 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 20:52 Flor=
ian Krischer <florian.krischer@fkr.dev> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Real SL101 hardware exposes two issues in the v10 keyboard response
> handling.
>
> First, keyboard command responses may carry OBF without KEY or KBC.
> The downstream ASUS driver treats valid non-AUX OBF responses as
> keyboard data. Dropping these packets prevents PS/2 ACK responses from
> reaching atkbd.
>
> Second, the EC count byte is the number of bytes following the count
> byte, not the total packet size. For example, the SL101 returns the
> keyboard reset response:
>
>   03 09 fa aa
>
> where 03 counts status 09, ACK fa and BAT-success aa.
>
> v9 used data[0] - 1 after skipping the count and status bytes. v10
> changed this to data[0] - 2 while tightening the packet bound, which
> drops the final payload byte. Keep the v10 bound but restore the
> correct payload count.
>
> Tested on an ASUS Eee Pad Slider SL101 with EC firmware SL101-0202.
> Together with the SL101 8-byte event-read fixup, the physical sliding
> keyboard completes atkbd initialization and works.
>
> Signed-off-by: Florian Krischer <florian.krischer@fkr.dev>
> ---
>  drivers/input/serio/asus-transformer-ec-kbc.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> --- a/drivers/input/serio/asus-transformer-ec-kbc.c
> +++ b/drivers/input/serio/asus-transformer-ec-kbc.c
> @@ -26,20 +26,26 @@
>                 return NOTIFY_DONE;
>         else if (action & ASUSEC_AUX_MASK)
>                 port_idx =3D 1;
> -       else if (action & (ASUSEC_KBC_MASK | ASUSEC_KEY_MASK))
> +       else if (action & ASUSEC_OBF_MASK)
> +               /*
> +                * Keyboard command responses can carry only OBF, without=
 KEY or
> +                * KBC set. The original SL101 driver treated every valid=
 non-AUX,
> +                * non-SMI/SCI OBF packet as keyboard data, including PS/=
2 ACKs.
> +                */

I have to test this on my ASUS Transformer Prime TF201 to be sure it
does not break other devices. But before that happens I would like to
get Dmitry's feedback regarding input patches.

>                 port_idx =3D 0;
>         else
>                 return NOTIFY_DONE;
>
>         /*
> -        * The data[0] is the length of the packet including itself. The =
data[]
> -        * buffer has to be at least 3 bytes (length + ctrl + 1 data byte=
) and
> -        * must not exceed the EC entry size.
> +        * data[0] is the number of bytes following the count byte: one s=
tatus
> +        * byte plus the payload. The SL101 EC, for example, reports keyb=
oard
> +        * reset as 03 09 fa aa (status 09, ACK fa, BAT aa). Skip the cou=
nt and
> +        * status bytes and forward every payload byte to serio.
>          */
>         if (data[0] < 2 || data[0] > ASUSEC_ENTRY_SIZE)
>                 return NOTIFY_BAD;
>
> -       n =3D data[0] - 2;
> +       n =3D data[0] - 1;

This is legit, I will adjust in v11.

>         data +=3D 2;
>
>         if (port_idx =3D=3D 0) {
> --
