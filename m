Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C3351C0B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050105; cv=pass; b=Xre7wGOeb+EWDA3LYij5kOIloIY3uTxcvqLKESJhhp8+Cr6b+YM2+v7VyWMUYEFWxSOvCkqxZAnHh/PbG7jyz50p6PhteBN7PJfg17ESdpLu/kdsbmBL4xfyomlbZszORBLuY0QjiSujYerNdE6YfoMMZr8Eodk67Sz8PlEtetA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050105; c=relaxed/simple;
	bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddwSRNpAe7vDZzzHp2RUHgPkvyfg6/e8HXSGCbTqdBhQB6tkqHyeIPaYClDLFkHot1O3BUyy7oBDF3JQdLGMrz6VJ+eHVmAtf0+2men1CzxxjMJTXoCfj7wcOq+V5qR/2pFS92V9/C+FbfMF+nTr1yrH8oA0QE8z4nHEJlgbUo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUNSjoJ5; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUNSjoJ5"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso138480166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791050102; cv=none;
        d=google.com; s=arc-20260327;
        b=DEqMnUH+DzO8nFdH8o/tgt7PATMS5ZYhbzs9owN00wjinpYZ7i8qa/hUbuK7VFQgFE
         02FGU29YwmOSXADPSnhp7LBgShiq5tZ7Pjp3FNjyhwngszGA6PCTWA4JeCu6PTLZalbs
         kZnAccHnxuEZOpt/HW6v/1ct42Bzav2wCaokr9m+DnKKhjYXw2gBe5LYe1JE+YBugv4J
         A+jCl9ec8AqMJvHCMBwVKUYxq8ljFps3KX7pJMmOK9pvVZ629kxPuXlTPMeQGrO+mykz
         MP5JsVJ4ECDX9/4D7khPWftVe1f8bRr32LZNoAGnSxzWeltAwwZgC+3c8eYwnxvMSpyY
         ICRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        fh=noIOFLcQLuU55rqlqiXFMXs57w/bP91fktTbzmFHg+c=;
        b=GPn4ztjKSNI46p/kUfv4oS5X9Va6yzOgg/Gv2qFWAzMITMjpEiWHFRIKZ7HB50jGR2
         +fcpzTmYGhY/v+nNmejcEkjLJVoFn7XOx1qxEsYlQ3m2SgtfoadQ+MjQv29ga/fx7Ywb
         3t/3hp/QsRi1UEXUSEeMSqULKp2vPvhusSfpGaTj346TQ1I2GmuPpwdaSY6EcciLyv8C
         APnEjkKAlNRua25JtZkqP3QfaqqWhAXYz2n1FaOL/+voItQPUx9R7jtmHY++Y46wu5RW
         /TA8lyTxWpwmhDuiFmWEuK66KzNlBs5njYVeFH6196WZzPqSOd/cQa5IF91+j10a80ca
         Jkbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050102; x=1791654902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        b=QUNSjoJ5rTHpZDcSbmTQXJ+uN8iopeFWfJtrlI+EYJM4YoZH2o5o+s3JWkzYS4pfYX
         5Z/q2vwWjztTHavg93HZLte53diu4Iayxxmn6he3jEHAyFLT1GubAWtJsNnNzzJY0gjt
         Bl0jGM771ATpXHP7CH+7VDE3UuUiDGK2BMd54NPLLjn9Gxch82MvnzhzfRmDXyXnc8f4
         jq0JSpIsdUrhVGDgVxrMJP9fMdTu5iUp4QBaZ+4D0N9gQEwO7jAP5LG7g1BcMMySMiJ8
         0J3WlW77tiluszif6RE6onBPIdGFHLHNaajsXZmKUXopWtG2wIqGMR3TpwVKvmF7lwF1
         4WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050102; x=1791654902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        b=BI3jUO+XcUf44DMFXMIcnMiQd1EaJ3Kp7r42+JoVIJE/8AYlv5BsJ9u/kMCqWHvYzL
         krW9oY0LbI1ROEuoNODAuFXipPuNgQ/abq2Jh0ww1eRJkM3ddCRq97XQi9pMAf1oOIDk
         pc2XKZZhCEk70HHw/bw5NFanxqarGRk7RCaJbCNt3EV16rkba3Q4Fr5g/OljWfclUh2i
         mzS/mbwvnTmW0MW81iMPzUQfAxHNZDPrO1plgXk+EatuyDrs3AuYqzfLjc2RmBDKOcG3
         65LGaxfESEnlI/ciF/v8lQAgHIFjkoFY7p6Hp2Gn2HDrCOygJ8EaMEe8hY3DuDv5lV25
         D+jA==
X-Forwarded-Encrypted: i=1; AKwUvBwjdRuM2O6KER58QJ6Kxm9Q3Q4+VCx8TiVYLjafJTeYdMY4TkvM9jo92DM0cvT10YbL+syvlZEe0hpVvEE=@vger.kernel.org
X-Gm-Message-State: AFuF++kN+HbTLJzIozMjvgkBoJrsQyMFWXBmZpEseXopTsjhwDJb65fC
	R3WkkpEE2mZFsf0DMZbEoHYVPZDfr6US9EmpscLmVaepw8Vo67kI+YpyDGUI3VA91KM4i7bCuzd
	jenUHAoUP1H0rMTkqDXSKrjuR/wB7TLQ=
X-Gm-Gg: AYBFou2sWGrZuMKrPcLJ9RXzvgkQHfEdm0lVMJjp1o7eGXS0jNXgrkfgaZ5ZerjitUA
	iUPrbPN39lcqqg7YvVHhWSkHDpIWfEzmTyO9G9ICI/ro/PwzUOB3HHPBpTUk0O08OVi1QyflozB
	gjfJKNgX8aSphvLfrOydVUAxHyVJWG0EgJtl80MT50aq84Qb6fJjBO4QjkHyg7dve0mhbMyxztF
	LLWyBr3/KSKUF9b5CiF/IHMJgIaNEGbDglK75d9ikdKKRcduNmQfGfYP0l6LwdJT1tM3cKyUeq6
	MA1e8EZq/0uW7ToiALG/yDESdZY+FgdmdenvgADpUDCNcQ3ODgV76DAiqm4iQLZ9TuKCQv2HZsk
	rMTPqP2hack+0C4EubYOGN8VS/PJZMDBxakUI3hs4mGNCY2+zLAE0HTsZIKfyMs2EnR1HLtLz9M
	CUsL4ukMktIHgHtQH+3qDDyOaqEZ4TpMxSiCttFH9iqMemJp0orrUg
X-Received: by 2002:a17:907:7fa8:b0:c2e:4292:d26b with SMTP id
 a640c23a62f3a-c2e4aac022dmr541503866b.17.1791050102486; Sat, 03 Oct 2026
 10:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:54:25 +0300
X-Gm-Features: AclHuK-Tnk4vGYGovhYsTrmL0EszXMNMJq3_DIUiup98Oar2sN_FwV71aRE1nR0
Message-ID: <CAHp75VfcuHPQ3S4LD6OBAMvu=hiGdSU_pji9+8LAGXD=y4C=9A@mail.gmail.com>
Subject: Re: [PATCH 6/9] gpio: mxc: use local dev variable and device_is_compatible()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:10=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.
>
> Switch from of_device_is_compatible(np, ...) to the device-model
> device_is_compatible(dev, ...) API which works with both DT and ACPI
> firmware backends. The 'np' variable is retained for
> of_alias_get_id() which has no device-model equivalent.
>
> No functional change.

> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -428,17 +428,18 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)

It seems you missed updating the headers (like switching from of.h to
property.h). Other than that, it looks good.

--=20
With Best Regards,
Andy Shevchenko
