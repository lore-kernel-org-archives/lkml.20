Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798260;
	b=WpUJNHtHfBHvQ1FJp8+34XsYf8oIfW0DQ/XZqCeqfAOekqXBOSFjqgdlpIwYpU+nUXCJ
	 gN3tvVs/OE6UcCvdvR3BSrrmhQa3IyqOc0+aa3Fl2RIAgnfHVdhVOlUV5NRZrZ7eRmCLO
	 JYZOLULvuM7aUhWNYi4QYm6LupUcio3aIUsPi6A9XjOXLY6QPT1xYe2mv8B8M9sYt3U6t
	 wRLlhgLxstQMxWAJS6ilBjyeW/6Yoy92Qmr1+5QqaDbb8uWhMkIgbXgMI//Nhz7AsBZVi
	 nMQo6VGIEi5rez7Bw+erQg3hWaRf0L/TZxRzL+xwYZEevC5OHguIjGljGtcnH2cUGiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798260;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4pXFqn79QUbBsMjuDsGw7ClhjengxKNrsxIDFCP+w3Y=;
	b=4PUIjxhwdsJcUcwbg6+zyDXFwGK+Cs9lVe7w9JC9R/sPESLRhVKFPJJOokZj+ytS2bXJ
	 qefuaDPN5pODpalvD0jNA/VUfFJ/uJCUjFIG2fFLivqwPWSvpnWY9YU36dB6zegYqfcpg
	 mj9Chg4sGFyWGy1yC9FKg/NumP1dvXjVLporfG59bNdV91MLKrO5pSvQUMjgCP/iFZix1
	 qnBQPJmNuT9a9+9QKi8GHtF0guAP3lDBdlmwQh5PTh9ftB6ClESbCwHfiJJtfH5edyBwj
	 ByNCwiVMZK3Gr3Nn6Molg4bGv/ueodruZdKd08P2l5ATdUWHI4V7cIO4Boh1CBFmhGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngTz6dQV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B229C606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngTz6dQV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB931F00A15
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798259;
	bh=4pXFqn79QUbBsMjuDsGw7ClhjengxKNrsxIDFCP+w3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ngTz6dQV4u1cbtZTvq2Ky1Ek7OBOoPb8HhWprAVAem8w17mr0cLtoh9m3r90q5K3A
	 xcJ5XSPjn6crcC2Ud6uil9cn1Ppr+IeDwlcYtzTIxfdfgT9FCenCPqaR5f5tpd/L9Z
	 Mp3pTWYiXnWzUTkmYlBS3LKyRZWYw8ZbiOer4RX1RBZ4NKSFICetj5cbh49jC1C23p
	 aDl/f/qsnbQ+sTzEXKln7wwiiU8cfWPdJG9b3Mb0SW/0+Gf2dHAg/HL27uipdvOMHj
	 nlwnvcobwOnvAdpoV2Sxd03RG8A6cwKlZ11q0e5rgvO4QMWpbmMvY7lpnEA29FYLxf
	 QfXiFJXuHV8/w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso8255041fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy/C+Bqa1T7gOL4Sz8kgRFXtB5HTv4iq4Ynd9MeeVYXv+ofcZDhQ0Hfxnkpf4uYbbpSTWo6Frv/2gBgDfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s6ViELBNvnDTrSbOjUzELPlse5wIECo1Lc+QJJsH+BW8o7kt0
	6oU5Y2pQlEqGzAa6+k2N0u3D++agGHyvVyvyYcZOydo2H83eSzm55ibfcrxfbpOdOsWgOGrP531
	bbVr7sFKAedcBkx2V1zyHnn/4cD6Ha4A=
X-Received: by 2002:a05:6512:1392:b0:5be:414b:a84b with SMTP id
 2adb3069b0e04-5bfd9576229mr6050040e87.51.1793798258371; Wed, 04 Nov 2026
 05:17:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com> <20261021204654.1001101-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20261021204654.1001101-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:17:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLmOe212XpcF=h9hLKKebraCCS9+8bbFSoJGTSyVCH1ttg@mail.gmail.com>
X-Gm-Features: AclHuK-cFjCWPxrNO57RVzPfUWRFqkM8WgAWXlpSWa3PLlTk6Y4p2ZdV47CKjtg
Message-ID: <CAD++jLmOe212XpcF=h9hLKKebraCCS9+8bbFSoJGTSyVCH1ttg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: sim: Replace custom devm_gpiochip_dispose_irq_mappings()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Samuel Moelius <sam.moelius@trailofbits.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bamvor Jian Zhang <bamv2005@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Replace custom implementation of devm_gpiochip_dispose_irq_mappings().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
