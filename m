Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF2354CF4D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930377; cv=pass; b=CpUEoWo2u3aSIf8Zhc7SBq+QB8J80a+AVsrWRyFMe3Y1TnspFiFLHDZBN+YxoJjv9CXIAKPBzh+zfcTMkTlcD1uOycH0hV4XK8rF4vtd9yPpD73VmwO/BwO1JS+RLsXdY+jIqfaHDIriPnwxXMsOkp77pvzjgVMlDNw/NV93Px4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930377; c=relaxed/simple;
	bh=LHKyaN6WUugoUSp5MeLqyUxtlolwPgBXkaD5KlRFm9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCtWwfPgcnl/vGY24fIOhLPR9KoBULnqMNVleS6qdcbW4cTMAPgZXxEaPvLgSPPXeCC3hL2LPV8lpFVrF3L60VIUbwqCOIYphkxnzG3udc8AmQrrIJBZIvuxFBX1gzdnP+ur5E++wpN9BE+6jrxiTPrG1L/TGb0jdztQRuIm5iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C4/6EXUW; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C4/6EXUW"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac525c1f05so4764237b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791930374; cv=none;
        d=google.com; s=arc-20260327;
        b=eiwqXB/zpiL46ZyAmk3K+/GqwgMOfkW4Xa5krKQPaG0HDX/LmlpP3CICt7Lp+LLkwd
         FwFn4PemqsO4p2RDRmEDu0V41rUlaoK3uJ97SBKDDKd7BvEa9gIi4N/f/uRDbdZu7wbV
         h3cSolmspxxpdI623PES+c6UUAf1Er6tAaTa2iTupu0EDxIgIXd/Kj6NPeUwnmd16rHz
         79L29trNOaFCmXo0zf5bgxw2L2JvN74CKgjDA/2zaj51P+d9eDOMfQUE/xN/EP9JtIup
         1bYUA4ODXZNSBDdwyAKE2J+7kJy9TkL7rP51HV5X3GwbeJ7EggmnIfDl6QkY/A534vUA
         Yk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        fh=KQq8ETAZbBuWUibdAMtTZnekCiKp8btWHUWbBcLj4Eo=;
        b=ZRRQ3VmCOUlInsoJrH3Il/xghk9snEhk8NOdmypHYCxoo6nbGdc0KhcV+7RxFDdOFd
         Pi5lIR9bvEwkZ1VJ+QdiURgEsGqEILFomXjA1mEqMCiOr9LIebNGmK3JJoTkir7GrY8i
         3q+ds6lfZXq3uoJ7su9r/hIzLCFO4rtIccC6NKRCU83DaI0pNi+3/pe9LqWhNDRJZvY8
         MD+gkuyXoim1A90jbpSukhnwk3YdE5lSkZQE1YjB0COGMsVsfbi/MUHDk97z2sJVRElg
         Bnq1mUJt5NcxNaWs1wARhzbGWdTlis7cs/mgml3/PrOB+BQD+o7trcj/JEWzDi884r1Z
         m1tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791930374; x=1792535174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        b=C4/6EXUWLqwBThAGo1onKkHW2BxZrd15xJmVGIULHYLY1nPFF5hv2mrrYcUkuA7RR8
         IhUjXjBsCxcolz6CV0dg8XhSVmMve/TAn8Iev1d7tXkENPi2R8sDAr89/T1YBI130YKh
         IcS6Ly+tY/cTuvFj2Cbai7MhyVANyndbphs84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930374; x=1792535174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        b=fxy4dgp80guGZLAHMu5pm3vQVItlwCHGZjBVNFqd6sSP88Zp+59Scue0zR9L3SlFpJ
         syF1jKXgTE/U5BHSWYtcH3gm9FEv8MWMcJcgsDcvTGfVS7LEk8ZJJfh2fffpRSGs/O+/
         ZPQ9MJKgIFt+aXSU/mW0ncDfOWmWVKcGuGPRWM50HqMdyRJ/QGgxSSdZ3CorqWXlrq89
         bRd056dfBbARXXn+bJozh6zS7p6fL4e8t7JrW8TXsG/4gnPYnhVHXcbSazr07gGyCyJ0
         OmERrG9CUghDciZ1a8fckdxkmcUnMyTNW5GeocwdfkXXpnG2tGZKeEGhqSo5wW4YB602
         +jTw==
X-Forwarded-Encrypted: i=1; AKwUvBxzz+Au6Kvah+Z0YEzdx5eDb+bxcA8PqCimnGKRJKzlPh1u9oAa4oNY3XaI8H7ObXoXPPjjXCUyZfRZHIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw88A5Lc6v+Y8Sq2kduNsNhlljM3VFl7/IXnlnVmt62Pe66NHc
	rcnRXR1DrgMVN87f+olobAIDxNvy3iOcuaVTYD35xH4Hkv3u88hCX7cDnvOM9mLbRTS/qgVD0Tf
	dGWwm5qBbILTQitjUADrMGJb+qtTz4elq1uBGR6f1
X-Gm-Gg: AYBFou06ihVVfMUBFoBCJHD9zYJ1oJIWlcmuL/fscJz4cWFEHlcIlWdHLgMpHjQTMJE
	70jMTZPTpGpiJykkYbQOwtP2TgaOqry8squYv1+3EjfkM8zMj9MFBVOXSqEx5Xlw//FXThLkPhs
	tGgMUvszWT0cXIs2i27VQ6CBixlgIrZNVrRZQAt7o/GH2NfL/jXNpGMx/6ZH3mOyeatkja2wjqW
	dDJd+FdAsp2MCvWWy14DfW6Jsxxtl/4vG2S3Fny1CSn6F6odPo9gtIFuEtXoAmQth8z4yzMi4Yt
	vpOCRZNiR7mnxMMe54Aw7gGyM+OkFtEOtpQHOO5qjgD48R4Pg3FUIWRms0HycnwgeEFI+CH11YT
	LJYGhgyCfbQ==
X-Received: by 2002:a05:690c:39a:b0:8ae:8877:9ef6 with SMTP id
 00721157ae682-8b07edcf6f8mr55863427b3.10.1791930374515; Tue, 13 Oct 2026
 15:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-8-384af01da3ee@chromium.org> <aszWnnc6RR9d5SYw@monoceros>
In-Reply-To: <aszWnnc6RR9d5SYw@monoceros>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:26:03 -0700
X-Gm-Features: AclHuK_tyUehVA205WXB_Og5y1P8AMIMPFMlhjQ2Y9FOhmh_U9e-FbL8LEin36M
Message-ID: <CAEe3GZHB_mDcdz3gcoAzOu6mO7ua3muESOJcaZi6Z45Q8J77rQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] HID: spi-hid: add device tree support for HID
 over SPI
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:49=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Fri, Oct 09, 2026 at 10:25:33PM +0000, Jingyuan Liang wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/spi/spi.h>
>
> Drop <linux/mod_devicetable.h>, the spi header already provides the
> needed *_device_id with less dependencies.

Thank you. I will drop it in v6.

>
> > +static const struct of_device_id spi_hid_of_match[] =3D {
> > +     { .compatible =3D "hid-over-spi", .data =3D &timing_data },
> > +     {}
>
> { } please

Will fix it in v6.

>
> > +};
> > +MODULE_DEVICE_TABLE(of, spi_hid_of_match);
> > +
> > +static const struct spi_device_id spi_hid_of_id_table[] =3D {
> > +     { "hid", 0 },
> > +     { "hid-over-spi", 0 },
> > +     { }
> > +};
>
> Please use named initializers and drop the unused zeros.

Thank you. Will fix it in v6.

>
> > +MODULE_DEVICE_TABLE(spi, spi_hid_of_id_table);
> > +
> > +static struct spi_driver spi_hid_of_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D "spi_hid_of",
> > +             .owner  =3D THIS_MODULE,
> > +             .of_match_table =3D spi_hid_of_match,
> > +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +             .dev_groups =3D spi_hid_groups,
> > +     },
> > +     .probe          =3D spi_hid_of_probe,
> > +     .remove         =3D spi_hid_core_remove,
> > +     .id_table       =3D spi_hid_of_id_table,
>
> Very inconsistent alignment of =3D, if you ask me, just use a single spac=
e
> before a =3D.

Will do in v6, thanks.

>
> > +};
>
> Best regards
> Uwe
