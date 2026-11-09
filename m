Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240967;
	b=cALOGzZFV8TI/sguzO28Ci5x9FaeSdq5kudZtdBgdbjWTaw4uWLjTPj0c/WzSHrKQa3H
	 rp7BgjyWhSxEP93lpwSzx2e7sXfsyggySf3LNf6hHrp7uKLDvyAwgVto0DIE0VpFXOtJk
	 OQvrGRNrtYmrqS7+bK2mDvlHz6qK2acRyMFEp+VvlvnV00l9ey+HOhTjt+ACBhGA90Uqp
	 70KacxD/RL28BZglr7tXxniMeDkny3+eIl8/CzcUVNUDYgCCpM76GVZ4ZOxyacnOgpk3A
	 ovbiED8R3RQ60pdTkuKfov+hHN5ZTaDV2qfNNmn4EbzIHQR0dOVXV7nB9R3kLBCWMpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240967;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a+uAUjhXKEApJwrL+oxv5vaGLoNsPevTJGtjjvevzRI=;
	b=MeYlwBjetzy3oPq1bKeFZMpUQgVFBUoD8MuS1e1NK6LmIfUD/XlbOJ0hC2RKW+TBI7Sr
	 Ag2BWHeG4vQepDHpDRimPxq/XhCzuXep7xDCt70yA9rZH1t2pHduaY+ux1HnshCi8b2jj
	 o40BLP/Tqx+C/GGB5cZT/E2cYSsYyYDGUS/mfDU9MYeeWbNLudLgR3D4d0NryFR7iTvrw
	 9zoiGF84AaSatm/kzgb99l+YcKgzImA2nKtcsF97wEbpUYaXQ0g3sGyq8DoSVrj+3qlHd
	 tmV+DCOWqS31mikPB9YaWPbq51b2UsqMd4bEbyuF2jjWCRogMHurNCzxKkec+/JgmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i6au/myG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C65606EE80
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i6au/myG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884CC1F00906
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240966;
	bh=a+uAUjhXKEApJwrL+oxv5vaGLoNsPevTJGtjjvevzRI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i6au/myG9p4GsOKM3Vi2VV8GPL0M54b1Q0aP+nLEVBGLWzFiIIQL51O1MPCO+TJ4P
	 dOOlbWjxw1rDvIUfDn3HiHecyjD8xeH7auCSya7gDynZpsG6ifrwDgv2bj7GEdYFIS
	 6koTwc3GNJ3y4HxS5QqxvXa+YXh6iYr6A8T2PwO6HCn5shYGBESjwyGMR34m80I3S6
	 RwOdZ0texE0E8hg2AoMGmeS8P3ZBs66cKKylaV0qlfR4zBPdrX44gquG1jpaLHZqWu
	 iVi83j2JSgA+Ktlq/6aFAKZQLOSxJXn2dcRSQ5YbGFPhVhc6rBxkKvUFpemhYanYHR
	 PRqMUgFKiJXFQ==
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53656465d1dso471135b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:16:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEnu1N8Y4S9yQBQ/i7HFc8IJs/v6zBq8fEtZ1xfGf57YO98Lg/qBKGtXfdBebOS6WhwFGHolcsB4lJoHJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AYwS5A3D6f4VWS4gFw8V7GSanVvfOGKYyby0aK9dzJDP7Zd6C
	2u3AviC+dFlxQ3JCfI1i2u+LKwWjA3XyLmo5G6j33bW0eEv4NgqFOHtX9P3eWM8l7A+FPNiMG8x
	M0uoHVOhjkreq9iTxQ57uSNusHWMEUeM=
X-Received: by 2002:a05:6808:1209:b0:532:4867:8916 with SMTP id
 5614622812f47-5683c9e2ac2mr94540b6e.4.1794240965556; Mon, 09 Nov 2026
 08:16:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:15:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v66J=FaqimwrqrbVuBVb5GMuhizp2Hnt6vN7CRMNhiuCFA@mail.gmail.com>
X-Gm-Features: AclHuK8oi8fLMntRJV56LqbfIWbbWAJenIS4kljcKk7VrVTWKVxckSNOSzGxgTs
Message-ID: <CAGb2v66J=FaqimwrqrbVuBVb5GMuhizp2Hnt6vN7CRMNhiuCFA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:27=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add support for the Power Reset Clock Management (PRCM) module found in
> the Allwinner A733 SoC. This clock controller manages the clock control
> and reset functions for device modules within the CPUS domain.
>
> The PRCM module includes the management of three primary buses: r-ahb,
> r-apb0, and r-apb1. It also provides clocking for several key
> peripherals, such as R-UART, R-I2C, R-SPI, and the R-RISCV subsystem.
> Additionally, the reset lines for these modules are integrated.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
