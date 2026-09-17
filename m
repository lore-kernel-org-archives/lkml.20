Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822434B95A2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639222; cv=none; b=D7v09v8xcH1NsiBgpdySEBmDHvd+q5qeREjTw02RYSO8zgLy9lGvQHMWXcO/doUDozzbldyxb//5BE7wXnPszG9xd/GQ0YIwFdud8/z5l12rOZ7eHWDRBQohWuyY3I2D+5xya7NnBFjRHBxo69P29DMyA8JR3FLIxzZqgUJUv0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639222; c=relaxed/simple;
	bh=paeQyicGy4uOJnj9MMiYfbfBIScuQX5Dy7auLPzshnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+dBzqsjrX4gYtQhm95cvo260ZcopWvN9UJ/sZZQGy3i+Ku/HCaqwRObUhsSMVVGwrxuvs8pepioyL1MYHprPSOjMn0bIj/y4sDLCE+GpjymrSvzoX6dYDh8coLb+QmBHdteH4IzkzcjoEN79DtL/edrHEbKlFeQg1d0cqY+cSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c83be8db39so363720e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639207; x=1790244007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PgwBsZe/a4Fuzb0Py083b181bySHfV18F3y848rFS0s=;
        b=bBbgGH21uKynQRsHjMQQ4y0Dzyz9LR69yZeXnObTIszhL6cgkErIQPKNKEx9rx0LK+
         1JsTT6sYRxP1UplWkrR3q+Cv25oNyBNi6faFXVrij4W4TKs4/T007QhArAbfJnmQ9c16
         96uTf2DSnQI7lrG2ZjNnkkGV0uJIWrhVjDRJrAsat2bEL5NWMuKYa0Yrm19vF1FvYBFR
         vjf6GgEoDSGycIjEvvcXJZ0Soou2mAIlFhU3/Jg3WB2LwLUZS2jLIq1BZjvO/FkBnv9y
         gm1+X0F5uHzM9khwPf1Nxty3yy17shrH6AQhZuPXkrZ72BrAUqg/DSGgaY1ftHufAbvx
         5HZA==
X-Forwarded-Encrypted: i=1; AKwUvBzKnkDac1DbrX+Clshk9KzIrBhj1kHKkkPYOH5sfrJnjHAs686KHV9QAQUeaRfEZFmaH8DW2l+SBjAR/Do=@vger.kernel.org
X-Gm-Message-State: AFuF++koV7ZhmPp3Nja6rRfmrvsrpqV/wEbvchnfjBARNAEWFsU7Rfxv
	4UKnEcUez10mKk2QZZ7Talq4GmFaCGeBnQ3z7uMr/Cu6Ynn1rVYwsuN7g8FQ1GfjHVw=
X-Gm-Gg: AYBFou1jA/HAmlOV4kPqTrYJwfda1UzD5Q28ANUak/vF1q+WBqRei8f/UKoybbjECNQ
	miTbGaTUfreLkZk2oCF7TujdNitgPEHkH1vGpagxUSV2v9dTV6WTdn0R5/Glz2N0Hd4ByoIpU3q
	X8YIRIlFtbbBSCvnwKiy3gpw5uFSgStNswbVd9zINiubliVNQgUqCMqA47BXErnjWZds+Wxzi8h
	7cltGZspnmIMy7htvAw/fSji48SBGbIunFcMtxRn6oEVjNnYpJFcHFWXZ4QCgIjMun/sDxsieAg
	aJK3fEwOVF6/MbQT7wBrMbdldFuZByMhTm8Macd9e/vV8kIJ8lxX9MWohCGfEcLLFrLLl29cFMy
	N/aAwJux4w9ZIvAZWpSA7Qji/MfKN1Ef8Sgg4F23ZgfR+oEcVut54e7U5WOepNv5Xm0yVXWKwOG
	QUO+kYJ5By9WCXlMqX20LZq4AiJTzCwCsdUQJwd6eVpOEy7W1cDDZErglYVHkyVcZg7k8eAgfaV
	VKDPbGnQaMjqqs2VipgH8hEY5krcq4mRBT2Fw==
X-Received: by 2002:a05:6122:378d:b0:5c8:c5f:e8fa with SMTP id 71dfb90a1353d-5c9a629e338mr942953e0c.4.1789639206843;
        Thu, 17 Sep 2026 03:00:06 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a53b2ba1sm2131019e0c.8.2026.09.17.03.00.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:00:05 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78569cf871bso382442137.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxnTdaaKXlTHMsx9lf9VMSgnE3QxB7sidRmAosI4X/Y4ROFCtmMQLcj+JDL676jMHL851LkLkpHKFqE404=@vger.kernel.org
X-Received: by 2002:a05:6102:9d0:b0:7a1:f7d2:e826 with SMTP id
 ada2fe7eead31-7a2049c966fmr811148137.31.1789639205042; Thu, 17 Sep 2026
 03:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260910085430.3173166-10-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260910085430.3173166-10-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 11:59:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcPMD9kzEUbkZofv6O6EoCz7mZ52Rp-ennBYP30v9-Yg@mail.gmail.com>
X-Gm-Features: AcwNN1XQBPUy3BHOan6ZOGxBXs0JV-45PEV0B5RSS4MUAdKXHpMlIwNQ2uEPp3k
Message-ID: <CAMuHMdWcPMD9kzEUbkZofv6O6EoCz7mZ52Rp-ennBYP30v9-Yg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: r9a09g087: Wire up DMA
 support for ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 10:56, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/N2H (R9A09G087) has three DMA controllers that can be used by
> peripherals like the ADC to offload data transfers from the CPU.
>
> Wire up the DMA channels for the ADC peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
