Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794562711;
	b=JhSX41tBq5wpKasw79J/RSpoa4E4MvijJIHSzs4L58w0pa4ETY/oMX9NCKB2cWzJniDI
	 kIaIVhRVDMrS5WMY/ENErrDbR02ETyQCKIAtRVkKzRs6CR7Ea5gqm9OyliYNTViVdRCLS
	 Z7eDGXFu7r/AjqV5KnckqvPIuI5EqLVsI+SErptXBKQSOSHpK3623bgwVyAdc1RVEcPxp
	 hv/BEKTKngU1CrZzQ6+mttqAWPG2nQICUV34lBYlBr6w0QMbbxBsBVzlrxsozDZXGwBfk
	 /uXjzZ40wO+m8l6BR3PDynbtoVQzsj8/Clju9bG0uzmytDcNGwkiMAfTssO29OcnQKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vwaSOUD1+F3Uh3wDhst/F9A1M+bA9w5kaeCRuz3dMQ0=;
	b=Ao0kxTHsmSHILMRYF19B8HcyIue9Bb3FP3uXfktktpAU0RBYuUaC1i3JNSzzGaVXdl0D
	 8crkyuGmPlXJZhi3FVpyXyLaymRBafYTcvOOZeaisqvQQymmDLio0SqZBdoZqAdCbv94k
	 MYK0sWLqiPsUbrnOklzXIi83dUT7V3dMFtWtgDY+Qb3gcK6KYAS5J+wVYx38vBD0j1StC
	 TWA58+Sn4m6qKvcJXlf2n/JvlXyWwmrAD34jRqRcsIl58LQs9Jn3gcrL/V5Ct+LJrwErz
	 blZx8Umld8rONlU4ZYhCVfgQLen6Uziep0WswQO7wEEkd1zlkUTgKSIvrYg+eVDJEbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=avpyrTvi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB77606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB77606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=avpyrTvi
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4a15c84c5so6500067b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794562710; cv=none;
        d=google.com; s=arc-20260327;
        b=Kj/l0ubxGFyMxFjHWUf3g9T25mkIAPcBPF/jfed7jbl79p+O2vKZMYHK7Kee9t7aS2
         KkH+d3mu2qIP+pylgpj9wYUqBclQyq6bMrlei7b6NYF0q3UmSLQ9LQ7YZlXxMRNu8LCj
         lpp2bEGSGFQZ5T0PI2WHlnmjiDYa/xFU67J00NKAEmRz/x7vRtnGSUGc/KJNeYcj0Tlz
         eYrnqR99blEDVaVQ8mD4jr2Y+wCCKXE15dsQuFTnP7qwt8DLY46giQYAmMOXj+3R6TOn
         ZjGQqouADdCk1rypoPPqrWdJd0tK8GeILm36S/QEpPtaogXzYTvkNzkJz0LKdwDficsl
         IBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vwaSOUD1+F3Uh3wDhst/F9A1M+bA9w5kaeCRuz3dMQ0=;
        fh=MbHKyeQOE8SJFrAGkbTiXrWnqLahGuJWyYzcpY32HPw=;
        b=ICM8ztkmdsjdDLlRwb1tWFbKW5ZXfwcNzoD4tpCNa/KdHlV4bSXPH2Mk93glpnI+P/
         lPdEVCTAw1ihd1hyHFc/rwJm+BCv8UxSgdC8sapVazVdOXUcEjjKdqr7tkWTekCAIImB
         qbU9ssDd/2ZbXE7tzngJpUjsNoXHhnHkAut4neUy9v9jyvEuRDiqX8b+ls9uHJaf4JVQ
         2/hU6xTqmzv+2Hkb7iGaNedQTlrNoAdAINt8jhHOs5wVhtKxmqUvDPTWkl9MudLeaOaR
         56/Gwvnn+FmZW06I4dm+TXetPnSv0KylhN951uxPVyyO56r515+L1K+sb5ptuG2rEM+1
         DYcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562710; x=1795167510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vwaSOUD1+F3Uh3wDhst/F9A1M+bA9w5kaeCRuz3dMQ0=;
        b=avpyrTvi4oK5W3E4mvGN2d3McV1cvJMinrQQk9ZcQAlCjlH0BfUksq4dhRDqRitzIn
         wB1FCrOOPRqI3Rn7xXhQW11ZOgRa0Gjd3ExI03bogX9cwH4iCYOu+/BPwkahcbRAN/6d
         NTWuIeW0NbkghW7vkpnUfx6CYRzzIdDWsleLny2760Xsq3YhS+u2DOnmdoP/25yfBihU
         MoEk9e4jmII8V2TVVwx69pIsY3XcR4b+NoqzJYVmYPvRLQfAKzg5EDTrtsEhwoCi6gD7
         FBguBY9bMbd0GGBhb/nRJOYo2PHYSuKAe3F68zv8Q22pCiKCQSjZdXTq5q6sWNrn0mYM
         6wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562710; x=1795167510;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwaSOUD1+F3Uh3wDhst/F9A1M+bA9w5kaeCRuz3dMQ0=;
        b=C1VYH3msmC5w8ywwQH+HCHi9k5ZAqCG/pAsho/uzaoePssByv54dXMH4dmBk12hUPV
         pqa0d1+dkX4nz7RZ7ZNp+7NZk01vtdj19bGNTKkoxxtHHcHQlr88u8iPnhaiPFuWIezU
         mORj6Vd2kWSz4GnNqE4ByRdVOmSPuVGx4jKrW6up4rHWQf9DS6SdB3I63dLIQD2RJ8+Y
         g4pbkCxNswu9hx1Y+Z/l/jzUCbRVl+OmHd5oOgb6hcwAufyTW2mnaymovHaSRdiQ6QoC
         92bRoTd9DJwxoOhWtNIbBRGUfDSZXuJ7F5MWXwuhMseb4FH83ptST+xgBCaS7R5pXTv+
         qL7Q==
X-Forwarded-Encrypted: i=1; AL+hErGwzRbQv+ZdEZre4f6CDAyGAtv1sTyzzLrYul+hcdDJ4MjmstXFG37gH9m1YBrGcVyt3sScL1gwURQXYvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9acMTOF2+B4wpnIosubiurg07mg0zRFMBBv7A+YRg5vAOIHNfo
	zPMdh/8j9TLt+OikpLR7WcG/L9HzUYD+0EY4Xrfsbq/+HdVma/3csbu0tLpjHekVolY5GU7KcPQ
	/iCPmh+fYGmHhcZOg2Q5+MUn0Iz9N0A4=
X-Gm-Gg: AYBFou0iiuJRrdaWUnAmsQYVWUpu/SqWqoeGZymNRKJlnhFRsfOQ13Hqqq3nAm3kMqS
	32aKdScxFcjC5iHqrTfuronI4S2/M1Eaoymd23I+IcDq5nxXjbeoBFyL+jTnxXqlWPwWczsbv6E
	u/08ixjfaV1PS9YBZyfOI4igjvuFY+aFYhF0Tg74M7A98n7N69+fYLhgiu9IBqgf1DvOloRzy6Q
	1uyVtMUUVGv0SszGbSJdrVMf+0M05Hm2CTzux9e0UEZ1heHqTSm+PzT4bn+0JpNUmEb021SuCCZ
	KjJF+Pi/cBW8WSxlXcEdWDb5hzKmzxYYsbqUkUnyk1wFABeZjvEFLMeRUMqVIj9Fqa7uU5B5PEr
	b9WXCsuDQ6au/GkJ2MWJ/Y7fxa5iQQ+3w1Lc07TD84Rv/HA9Dd4MByKp8F3WD7S45+El/qyEkIz
	y99oQzwPpXCgWIt3/aaoLG2kZAPQwsLb1KHtTQ4sYw5C2gmoR17peBY+n5ceDrwwkNOYwI6l9Z9
	lBgTP1vLHG0+f+QMY6QryYxqJ0CDt/2btdtcf7GNbcBfChjAeP2elxIPMPPlQ==
X-Received: by 2002:a05:690c:c4e5:b0:8ab:4989:bc9d with SMTP id
 00721157ae682-8b4aa3126d2mr14797977b3.65.1794562710293; Fri, 13 Nov 2026
 01:38:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com> <20261112065037.1800467-6-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112065037.1800467-6-dmitry.torokhov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 11:37:53 +0200
X-Gm-Features: AclHuK_djmP9MqgezxklWmxc9D08cGWxuo_8XnZ2UDBve8INb7OAHhKwKVITLVk
Message-ID: <CAHp75VeWV39isCSpSxsuzw07iXf7rBfdYeSn=eJsBM-oWui01Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] Input: tsc2007 - use IRQF_NO_AUTOEN when requesting interrupt
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-input@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 8:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Request the threaded interrupt with IRQF_NO_AUTOEN so that the interrupt
> line remains disabled after probe until the input device is opened by
> user space. Explicitly initialize the stopped flag to true before
> requesting the interrupt and drop the immediate tsc2007_stop() call.

I believe this also closes a window of possible IRQ storms or floods.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
