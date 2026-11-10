Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317949;
	b=m95uGrE7kNfYtcTFidi/eL+83onmMRqbqxV+oZ8wgjbyUNIqEQRgIc6sdGqNpqI8zB6h
	 jgxqFEZhZVsYENVb142HvBZaaD8BRFYuASLEyoen58KjnjFM+SdIQoVRsMdExGlvsOjfE
	 kX8vTEV23cd4dh7P6Dqq0ykwlrot1EZLXGAuACf2tUAJI5o7ZYA540FLgKxvXokYRdkzC
	 wUismkuyDzOopyAJoXt9IemVBR4DEYZEYJfa/54FyMCUayscd45rYLbhCUKyNCXUjT8wr
	 bIINYf4OHYAWSa9wJzVMK2Ne/1zh2SKyiWvGtm3SmHhyXFyRC5iG087LB+x18BjYA4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317949;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZMeMfQvmt78dPYrMMtAW9VPm9Yugc+D1ue2Bsz1Cqzg=;
	b=ODvdwVp7b7xhetpk80JWAC02aJQ/dtyHAK5s/QIL5NQrM3WMiyTup+xu1EJHva1j1aSs
	 PYyxW08fqWy2bk6oc5WhFFXcWG1EiVXcuVBbn4ro93quFwbIZmrooJGguct6LtBgMTSnc
	 W9TPSpMmDIKf+CpkXwM7hLTnDFlTOv45NU5KJDjN9yuesZ8BrwDdZscp9VjQPLImWt99T
	 ZMPFc7zzSn2UM69S7qC6vbQvkU0VfKxz7ooCg1a/B2ZKII/uKSCjWFVKLEurT6AaQ67tv
	 pAm/mn55FkcgtU/bs1gUa47Zy/CVQLwqWJ3FjHVD0tETkIEwbfcSk4tM3Y/QT5duoGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E6606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797E6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so2289324a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317948; x=1794922748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZMeMfQvmt78dPYrMMtAW9VPm9Yugc+D1ue2Bsz1Cqzg=;
        b=csDPajJ7ghlrZ8DDkLh80FpF/Bpvds7pq8teC9iynyavbTAL5hpro4Ta7SLWGg8hFm
         xD0hqNbOcJ2vIN+TAlgx41quwziiyUU+APHG1co0iKscKO3ZRWTI8F8wzb47n7NHXE7S
         hvG5dIskFeC+6dbnKv2cNNOZtNYb33pS6rIuYEqsI4YpMmH4W0ednlcjAWQaQxJGIA9X
         TdSHGFjarEJYP038dBuUzKk6nn1bapAmFxKEqxGJAfVch0pDB+ZriTkG2zMXafzeRegd
         n6QYAy9217kKvRPVxcrYqKL0+nWIkKfU7HwVXjWuxB5rjOjZ8Fgw435Ndt7pihnomtAE
         Ragw==
X-Forwarded-Encrypted: i=1; AL+hErF5Qh244nsnh59jSUfrYzg77SiwyVO5yFP+lu/shBwcZSEGErF2XGFYonDIVhooIItHq5/5LMR26kLQFqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z93fsO5VaJgrhIn5/1D4MVYfnXkaSSmUvXscJgyXcjj3X5jSoSR
	blb/SKvSNASdO7SRHy/TvGiOpdGYeCnZE3q9EARMUjxGdxmj15kDkF+9nAKDvXVboE4=
X-Gm-Gg: AYBFou3QWvpcOsurSWfX34m6a+wSYvD41JRP1Uo0I385qQuE5zzmtNu1eI1Sregr2A/
	ctyLiPzRjNksNGk9gn8zjzvzTixH7AbpIM0ulGdd35QGDU2XJUujtf2HIWGgtdfSjPwYmWtVxBI
	hGi8S5J3VGzcgItjIRjcrLfYDjUrV6rigAl3AOrJiCnYwgnF+w8x2yTyE5LZQKABr0A7Z/2XylN
	7vLJgWnZj39JScTJc7o6ZXzYtl9RVNtihQeL0nZoAf1CcRff51d1XQTaDAi26MTXMZ4ZS1qim0r
	ADfntQ2q3m0EGNFwLO/DBW1BZV6fOpR6pgaNo9/Jb2BT5Ilht+9c/Sb3dz0I7UyTAbR+GjYLC2w
	CIwf3Gg4nNUXP9VhbYyBhtwxmoB0oAD6htKH6wvJq8bK3kcHSFlt/4mjKm/AMwM1rKiTZ7p8BkK
	P8BBcW7g+NtXNvJXEUVy1kxtp9KAvBACKQV85gFYOstyPffAPJEOVsK0IQE3jjKaySo5tY4C1rY
	K1lvJrqEqo5MnCJxrnOMqB7CrZYjxs/pGchikvXwWR8tu21KPUKnrMdCfYug1eU+P+2aBUWlEuA
	d8fDCz+RnrCbGIv5DRFq8YwcNc8mkJeieUVBuFrVriIzXqLRsVEpZdhlzNSUEwuEnbc=
X-Received: by 2002:a05:6402:22d0:b0:6b6:f429:47fa with SMTP id 4fb4d7f45d1cf-6b7564ea318mr1526288a12.9.1794317947594;
        Tue, 10 Nov 2026 05:39:07 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578e8732sm1107509a12.21.2026.11.10.05.39.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:39:01 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3000138a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:39:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEHqXVXm/Tk4fhDcBZedtKX0p7ky7R5HnltGeOhDKuns28DVLdDgtS3w66ZTAPhESC0ALS5MGvolnkhRGI=@vger.kernel.org
X-Received: by 2002:a05:6402:22d0:b0:6b6:f429:47fa with SMTP id
 4fb4d7f45d1cf-6b7564ea318mr1526088a12.9.1794317940664; Tue, 10 Nov 2026
 05:39:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106110923.164090-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261106110923.164090-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:38:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQxTK6R17jxbiMH2ZxbH5j6B8x8h2XeysJHFXsskS0rA@mail.gmail.com>
X-Gm-Features: AclHuK8Uhzs21jwItIeAcI6lu6EJ0iz-5HN7a0XG0Ev7COfmQG9EuJKsPYXnOHI
Message-ID: <CAMuHMdVQxTK6R17jxbiMH2ZxbH5j6B8x8h2XeysJHFXsskS0rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 12:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Renamed adc_pclk_gear to pllcm33_adc_pclk_gear
> - Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2
> - Renamed adc_adclk_gear to pllcm33_adc_adclk_gear
> - Renamed ADC_ADRST_N to ADC_0_ADRST_N

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
