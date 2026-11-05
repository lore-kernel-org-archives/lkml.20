Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886988;
	b=IZ8MKYorxocWrR04hsTaVmLsfGGjzN/q/3/gavQHZk5979AVp6nT+vi+L8bqTx1dK6c8
	 xkiim/D1zVD1aSufroorqrPBgnmqiudB2wf4Q0IBKnS+tzAKefvjK2TzViQcybi3FIfn/
	 6nCzHJjAOK4qfVqy++cVOCQUzaXGqbK+itY7tRaWtrmkcQ2VpNSFxhyiw0OQDvhVlHAv2
	 468CVv/tsQQQTZVez12GNY2CSuk7NaVpFBN8NNUBbUgVLEKr5Jdt/4Ygtp3oJdB9QJGgx
	 YcmxPx61AcV8uX9jFkX4OrBvrzVW5ZmOB+kBIKU7tk31d2dxOfoSyopc/wDfdh1DMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886988;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DgaNB918DvS/9e6kGL7HQ5e3QKA2xYrp9dfDsZ8DbFk=;
	b=qPJG9L7bNUJLqxrfX4jiE3enUOgcNiFjqz2KuUk4+WK5AF6HF/psUGZFyyygsdatDg++
	 dj01WK0XH4ofCy66kS9pPbdotOlhS5aCdFjM38BzWNG3aBK/bJ5AIJ9tDm5fYA7IscVFa
	 GnqONS/Q32QqDnZj9cRv46++a8KQX1OEf6CZku7LRjUdGrG7ywr+TkHT0eTd+bmbGfapA
	 iU3XSG2GBCKzQ5oGxgaVj+WFFKk9JVDc0AQjIvrlHwK8YbPT7eXtmONXOE+NYpYpORgph
	 fWhZmcFa6RiwblDzQ+IBSWZ+39E8GTdXjwUuxOLgWhsnAs5oKD03DKFfohglKn1hSwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwdO0XoI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F12606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwdO0XoI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C8F1F00A17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886987;
	bh=DgaNB918DvS/9e6kGL7HQ5e3QKA2xYrp9dfDsZ8DbFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PwdO0XoI+xCqt9JcXnjbffFCF88c8/RWnV9n8+Sb6snUovYGGZ9rR6l6vuMQN4Wcq
	 5sUf5w8H/5y25/kIR3ABjhT1hu8CuB9VXtgs4RKQwJ7cBeNvtnUlbCp/OKlSvA94kI
	 +ujcDjZMuHcIEtc92k8W5JnUrzM7T2gDpB1Db7B6Iy51Cmqyef0PtVpi7GcsCeUCdB
	 dfhxJr/q6CCYUddat/EaQwOAoYMSnQnh2h2bQq4zMRqBc6O+Lt3PbcSJYFE5a7J+XN
	 ARISxm3Fwj+Q+EqG13Jgf3p4Kbk0Xh1edfbQsQDSklrWF23RM/osXQgDN17+GTmamf
	 wTuuT/yAGePmA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba328513b9so1574287e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:56:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxxJbUNgnitJa2stXbbPnPv4wwci0mgweAssgm1qz5rk+XqTEq+lwUibrC2lwaZ2ghTL78NT8WETzxD+As=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vgeKNDfSF0R/cfjZmKu2rXTLAyTIxsa87mLNaueFfZVUiB9Zq
	FvCt2CCeIZroj0YSBuubL/FeZMKjH2WnG0jKQUVMTD7XM6ByKnGU90tdQykEgDXZ4paGVukXgYK
	brxXbklORdJEhLn3NwUvm1R93A4+X0Go=
X-Received: by 2002:a05:6512:10cf:b0:5be:5394:162d with SMTP id
 2adb3069b0e04-5bfd954b775mr5824256e87.3.1793886986138; Thu, 05 Nov 2026
 05:56:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
In-Reply-To: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:56:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLk1_uAS4spZLg0pJuxd6KxQdLkXpxFe-DeUy4E-5sHp6Q@mail.gmail.com>
X-Gm-Features: AclHuK_gydN3uFHqfkkpDZEjIzl9q_s993fpDvscnpCYeIU9fTXTp3QVFVyy_To
Message-ID: <CAD++jLk1_uAS4spZLg0pJuxd6KxQdLkXpxFe-DeUy4E-5sHp6Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: sodaville: fix use-after-free bug when registering
 the irqchip
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:14=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> In sdv_register_irqsupport(), if irq_domain_create_legacy() fails during
> device probing, a generic IRQ chip is left registered in the global gc_li=
st
> while its underlying memory is freed, leading to a use-after-free. Use
> the managed variant of irq_setup_generic_chip() to ensure that the chip
> gets unregistered before the memory it uses is freed.
>
> Cc: stable@vger.kernel.org
> Fixes: 9381fc5d655d ("gpio: sodaville: Convert to use managed functions p=
cim_* and devm_*")
> Closes: https://sashiko.dev/#/bug/linux-2f7ac8b6-5034-4ff1-9afa-5700ff44e=
3e9
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
