Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883611;
	b=Lov7bS6KxrzzvcRUk3588TncSPkUeTESL34a4ZFx+VpeedNLlocnGcWiVud67ct8LrcV
	 ChV3SVS/aZi5yhas/KLPbgbFMCt3DwPSpTfg9+GmOVTS4K0J+9WBi3p4fy9T4sR10EpIA
	 BiTWaaOasHuUx0eaLQbxBpF0xLWXSt6nCjdD+dyBNuqs8GsbHzfX0w/3iyHEhFY0JB122
	 QYQmxcrPEb7dRsq54oYwfQiGC1roQPCXP5uCGtj5UbUG/u0eh1Qtt028AQl5DRskLveuG
	 H12el4k3HbDPm5x3tGwfeRdsgU2JpKH9UYn+kbEbJ33PDnHwLq8UyWbOesrbXZDz34A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883611;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5pTLy1DMRoDwj8lZJ0UbFJoGofnphf79x0x39goZpc4=;
	b=GBt2A22xkEaduE7ValekCbDk0v3BiTSmA3AJ7rP9jlxn9o4CdsBBYsh+6OHgbNhftmFf
	 l8sXL7f/Tl8DYEr9+pvt+wQa6LMII0uk1CJfE6Py7dGYrpLRqjg+hDK7AgZQyaxhPr5VV
	 UfXABQzfuzQgPQhOU+clkix0yt602Cbgx72P8onJ8tKiUUiV+pSkaSBQwlIY+81Lkr0Gj
	 IDpUZcXqZsgNCWVsdDp70wejqZ8fOMzWfGfBe7Cj6b3hkzdMn1tt7U54sqeghYccMIVUW
	 nEXzXbVfeeO0s0Xy8Y2s2p7Unae823rJ/sjmmmTc6mip9ALdcys0PTHLFSBZma3h8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NgEJujQk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886E4606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NgEJujQk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620CD1F0093A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883611;
	bh=5pTLy1DMRoDwj8lZJ0UbFJoGofnphf79x0x39goZpc4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NgEJujQkR7URzSKlSj9GT/CiQT9PNQ2nu0rfD+IPgh1UzKpIjEPGbbVbgMIpw1/gP
	 Tsr9AHRkKux2w+irEvoJZZOzap8qRwCDcbrrpjZssLx6zyysdBj01KDai+EICmE9ak
	 MKewpZX0ut85ndW2e19bqZxqh3fY+P59X0SjcU6GWNJe7xx/AnLmuVH/GBHL/CMt5P
	 9+uJGyaABIscd3MAzFdWD2RS1Kx0Pr1tNkF0mHYhHDbCXk/KUYz5XGI6lJ6ix8Zy1N
	 vxVOTEEMm6g0OaijxJsLqWirqYrSMkO+wUnFeef5zWBVjgrD6mtQCMdEyoQb1WNxSu
	 Mh3pzVGJVUbEQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so1732976e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:00:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwUNeZ1S72DIer0VGZpf0R2835QfHK9gnXa9Ue1h3bE3n/K3b3HI0hnEPkiPW2s8QZSSoXv4owrJgD8teQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z87Fcq1CABsE2vv6fD3C4ikOcobM+yYRmU2eAk7DT0mv2K2v0IN
	vY5NRz5DlwTiGnpALD0vv2Qjmeybpe3lddj3Tsc5P0Y95z5PsMma9duby8AulJrNWMz4ELmttjR
	oX56f3UcUgbm+k9PwwIGLdD0Ld5aSYvQ=
X-Received: by 2002:a05:6512:23a0:b0:5bf:e25f:d59c with SMTP id
 2adb3069b0e04-5bfe25fd6dbmr5769231e87.38.1793883607153; Thu, 05 Nov 2026
 05:00:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
 <20261104-gpio-desc-flags-atomic-v1-3-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-3-e23cedf619ba@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 13:59:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=HfJX=M7Lvzx1-sb_9Zr0qYMWJccmgiD2yFQAEodkQbg@mail.gmail.com>
X-Gm-Features: AclHuK-4nqAaIXoMz8aCJ7rRxx6dK31OAuFQuXb16P8OOZK5p4ht6ZH_vYzr3MM
Message-ID: <CAD++jL=HfJX=M7Lvzx1-sb_9Zr0qYMWJccmgiD2yFQAEodkQbg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpiolib: provide gpiod_update_flags()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Kent Gibson <warthog618@gmail.com>, Adrian Ambrozewicz <aambrozewicz@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:37=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> We have several places in GPIO core where we copy the desc->flags field,
> change several bits in the copy and write back the whole word with
> WRITE_ONCE(). Concurrent updates of flags that modify other bits are
> lost.
>
> Add gpiod_update_flags() - it replaces a masked set of bits with
> try_cmpxchg() loop. All bits are updated in one atomic step so no other
> thread can observe it half-done. Unmasked bits are not rewritten with
> stale values.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has a good suggestion for this patch :)

With that addressed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
