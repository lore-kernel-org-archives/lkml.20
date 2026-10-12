Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23EC4078D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803769; cv=pass; b=GcFJQE+1puHfu+NyT0f4ahcCEDq2zV2dHwdt+/2WBfU73zTK3BLl2QTtqhxIIV+JvtSqM01kN7CUwQ/+qyq3l2YV2u3CkbiWz2NnQ0elNDYPFh3VcTzGMBJyBqUl8YuILOZJIetwNFPgqePzsLmiew/Bsn6rYre7dLS1ibDan54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803769; c=relaxed/simple;
	bh=BBYEwKeOE7OkkvDarXT0FjmEVf0UPxIbaghHxCPsYw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYOzAcsMzeQYA8GpLacOW82rMS+7fLBfwo4csCJyIlIhfceF1g87sQQWEtdpmLEvbhfGlFwWaP4RO/E5eiY285KPcIhKyKbhs4bCmW35DtWYvo+3LzopoFPlyBiob3KyJdDiF/hUAKXaRCLKJpIX8J6l5miCsCDWcIu/rtqM8jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk0WAK6V; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk0WAK6V"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c315869241fso251283266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791803766; cv=none;
        d=google.com; s=arc-20260327;
        b=T4f1JDlW18ANpyPc7g8D2gFSoCTYdK6W3u0TWBwJKzMzHzPFMwmXP5blphWWvTy50x
         Cio31quBJ60L5sZO0f3DmoU5v7zynbL68401VpyznJYFhSk9Aw85IB5zyvxVe+qVKsdL
         aZcSh2Yj27FfP4zBJwWLX5BqxTVkcCOYsrEDv12JLaq9T6ByJxXrnl3iG7ycmpPyY89Q
         ovEz7PDTo0bAJh8LFgO+Z1XjydACkfTXYfryaCKHhfUrQUaH+QCVHybp5rXvH6BF2zZQ
         Lhz2ocKamXnmZPezINnLmpu6NxyNc2iZrZnDH/5RJT62dTZkt5IiZaNIWnkj8trxJjL9
         e0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBYEwKeOE7OkkvDarXT0FjmEVf0UPxIbaghHxCPsYw0=;
        fh=pQOqNfk7iq+0AxnaMuAudfGA8Fe2WFbbWisHQSKv99M=;
        b=TLcsWur4a2EBm5ANlBweMPpG262U9hDh+h7pwNzFV6aJOqI0AIJ5yLSnSGUEYGwj0c
         GD2Gzlw99FsbUqFedP8KUmedzFqsZnhyJDa0i84Tt0XnTK4vNKK+kbfliZ3ANV1hNaOO
         pi4ySwbUwnn60NF7xJKNhBkf+9dK1PeF80oUAlCnnxAr6BtY6KO0Ey6oIOatTmr75Gk4
         c4WespKlGvK/QaPptO3bLSacCHPp5AWh4FUjM8qaQLP3fDpgPFdp96d/mHx9mHh0WSDK
         5BsqEy1PxiTrygkR+1x1ZMmGmWE6kT6Qe+7suDYV3fi1ljFZCUjzNfuZlUEOrRB57wjr
         xeWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791803766; x=1792408566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBYEwKeOE7OkkvDarXT0FjmEVf0UPxIbaghHxCPsYw0=;
        b=Gk0WAK6Vgm6dDUsf+IsaYP2DUbXKD0CFA2nyx7qI5HBvdE/GcTni/ILHTETu+QER99
         ufpGr+otFH2p9jtrDoxelU9VYH/PGGyyAkW2q+/UjBAFgdQSoV4OgpuP/8iMZcyFvKmd
         dcdTn5aOmF0dlADFG1EZkZanMCXrTKRz0H3qcQlBQFYoMwM2Wu0P/OVebdMcZAim+TGn
         KqzvNSrR2uDeQk2nA1GRa0gx198ppL0EIXqcYMrZ3xbufAUWSI4LYAa//km4oWSQ/XWQ
         Qjr/VYl6zeHfZ8hyEM8oGWE7OpHu0xderlYpZ6j5klAw9J7JjyWgoPd4a2p4bmGbNmip
         nPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803766; x=1792408566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBYEwKeOE7OkkvDarXT0FjmEVf0UPxIbaghHxCPsYw0=;
        b=E0e/Dp0ZCaD+UANcvtZ5S79bWqohufBu1zKAE7SpApSUVM8SXRPdE5MpEdzRBaC5qs
         GnziOvkQfX0SE42genmhB1nE5rzNDTtnSESRanwB/IvlVDfS5qpFdJHwtctbig63jgnT
         rdk+wA+WLqNpDK+eS2OhKeJBxaGFf0zpTHcslJgs/pgnfq5Hqa8khkq8D3SI1cuEZOGb
         HqfUxISJ7jxSrpxeAQpp53PrKXqpabt5zPBArZ/HhJj3w73TQRcKe6pfMcntdYjriy+t
         e1q9+gwnF29r5IQu2AgkwdNxNThx480levtvhbdOruHlv7wwrGZisfJE2+vmoTwoUqrY
         Ks2A==
X-Forwarded-Encrypted: i=1; AKwUvBxqKvvDkr+AtbbpoMbi8Sps/LyIY0lIqi9DZMMdBCGvoClVTx/wKy7gzpj82QDsxCI9n/2plctVdDlt8vg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIshO57s7PuBUfwhBHIGYU7iMzVyPD09dS86bfLLRizpU4AmuIG
	Sm6y5PoOoKnYop5GYSMRAVU3VMs2bVu1ulc6YNepqKjwpP8hr3LsuLoixmT6YMcXj5xc3e+Y1dE
	0Y+X4xlS7QSkc9JK/y5YefSQ2J73AbN0=
X-Gm-Gg: AYBFou0B9kP36KCXoSlUc0sJ31sgAOC1lGL1cl69sdCAB4CBzF57m4QXEnpYKwa8Sdk
	5uo00K1QxPcgNdE6Rt5sft64RNHWqHit1GD1qUUs3zUDA9mnC/qWc2CMHHtn7MxhcXaLvb1UG/Z
	dypF7tNYLfflENpqzIyIqwoi594/6d0Ip4d8TDYPjiInayLTu8TTPI4KugCT3p+/0K8G1t+Mngp
	fKlDUOzLae24YjBuSnMXgfrR8mKu4EMnPiqUKK0sAiV1l8WlMibikCO7UsYRwnB8TsK9c3vBKWN
	4l2qNMN89BDSUs+C+h5hQhx24sIWUfyPEAVjuoLIRFnbNxjAiqnha0gkBz+0emde2clE19wd3X0
	vC8iq/zIVdvexFkhVPwfdfV8+pEqAKmWm4ZtLnpKUZLn8ORcCyF915CSQXssofdyWBc4gFxOJW2
	zXMOvOkd0h21UPFcZZEXHtABEa4zT8lhoUsFQuWeFJFz7+hi8rAiQ=
X-Received: by 2002:a17:907:3d09:b0:c29:5b0c:1b44 with SMTP id
 a640c23a62f3a-c31a9fe3d17mr877054666b.37.1791803766024; Mon, 12 Oct 2026
 04:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-adis16607-v1-0-9c89cee35d56@analog.com>
 <20261001-adis16607-v1-2-9c89cee35d56@analog.com> <aszAHLVf7MEqvht7@monoceros>
In-Reply-To: <aszAHLVf7MEqvht7@monoceros>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 14:15:28 +0300
X-Gm-Features: AclHuK8PxCMj8iFJZZKRqYPj-GoQuTI01kOIZSMNlNkGPy4YGUhURoNUhpmsmts
Message-ID: <CAHp75Vee96s0-h0kSTs4O9rtKjYZEPB_8AnEqj3j=+SuzLkiOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: imu: Add driver for the ADI ADIS16607
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:12=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Thu, Oct 01, 2026 at 12:11:50PM +0300, Radu Sabau via B4 Relay wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/spi/spi.h>
>
> Please don't use <linux/mod_devicetable.h>. <linux/spi/spi.h> is good
> enough to provide spi_device_id and of_device_id already.

On the same grounds as for OF, it has to provide the data type for ACPI as =
well.
All the same to i2c, platform_device and so on...

--=20
With Best Regards,
Andy Shevchenko
