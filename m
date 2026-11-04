Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798853;
	b=rTxlISfCzWLr3gs0aEYFS7EUP5EQoPPNIaWNtBa5dz/Tl/Uq8ru9eBt9HveCypo4pK0A
	 1TttHl9OmUVQzjdR6OKXZgovfWXwTU1kxD405BLs32waySJCZQ8MBiRs4wYXr9pYYgPfW
	 nkUw/bWQCUYQtIKqt1/iMk70H5v7Qj6QQ9Qc5xfy7zRg+QDsMbFAuCJ08MY55EQL7+te5
	 l12y5rjdyZKBlwZL7g9vLTzDpCbKo5osbKIUJh2e1N1uNluiLxGTUAf/0Pnysu4Nqw3Nn
	 v0cFpz3YzpY4MqBJ5ow4jAJTUndwpKNyj1rvV/yo4KHdHZSsj0PNCf8YsHLUnwQQQ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798853;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dBk58bgiaSYO++534GCoI4z1lGQjTQFVViflxC/DUZs=;
	b=SP+QkmIvAQuKbvkDwY0Mli8GVeEdgZUhBXxp2B6L31bBnfRsgxyVUN6zHEMP89BNUMpn
	 TTNKNFqaRoYMLBVnZ1i37AOEqCUhE+o/0ZU41s0Lc6PMZ6JvM8Gqs6M+/wPfK3kAYEGYo
	 8eCuson7LCdy86Ddxdfub8g9/Mv1+xuUDNJRSs287XPz+oQH8dXPUQLoAeu6AP6PcCtKl
	 In2EHgY7jfHYAdPuS6+Mb91Bo+m56DLyFGfb7KQqrN0cMaiPg22W068EMUh0MnttKN1ax
	 58R1iOruHX5hwGy1Hf2Mf0AucU1bCQ6qNOMAyszY/YRVAh7U31RZ4drrtjz31JidgPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwugHvY4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C966606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwugHvY4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294681F00919
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798853;
	bh=dBk58bgiaSYO++534GCoI4z1lGQjTQFVViflxC/DUZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HwugHvY4AfiC0JJx+xWHiDIB65WvtCXjwr2MIvQT5ssmx5urPKMDl4qXozC5vIH3n
	 stL4SIS6eaIwCw84/gALIlL3qWkbgYmFPZGmMZZ5VfkOi5bUDP7nXu4o7A7dsagw0m
	 SIAAj/HEDof3zl0Qg/EFjynwabyOkG2gkzI2b+pIjpiRX3skvVIARz+yZKlXmxEdXb
	 Qev/BWulHqh6Eg39IPYgyj6vK/+U7R1snJhrYVnlK4r1wWKbJ//vYBIUZp90j3Ah2n
	 rm5Wnk4qDwFvSPit572nlOTlD8fqwOzG6lbNmqVinOgyassqpOKs3r//IARZgbjNIt
	 s3mrT/BsVTl+w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so697658e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:27:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzLloHzfGNhsENaH7AwfH6mi+NfD3cVBQWKw9363s1ODT8XPTCeSvzVpOD8uGqauAssFACyrLFCzQ8dh1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eueKf20lpCNvETDuNNVBR708vEpv9A81Nk0rfXPu82cJu/Luq
	/PtkQ+Hly+UZAY8WQj6hUOhGy90j/M1jayqdMLjV3CBQmsc9QYtmxpMnVJAJJW2J5lkVlORPedN
	05dOhNJL98ReOsW72brwRuO/TmV03voU=
X-Received: by 2002:a05:6512:3409:b0:5be:3720:1393 with SMTP id
 2adb3069b0e04-5bfd957ba22mr5521555e87.51.1793798851974; Wed, 04 Nov 2026
 05:27:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023151209.58772-1-haohlliang@gmail.com> <20261023151209.58772-3-haohlliang@gmail.com>
In-Reply-To: <20261023151209.58772-3-haohlliang@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:27:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=y=89dCKmCGC11row1Mag6RdeTj5FVL1gonPhmpeyK7w@mail.gmail.com>
X-Gm-Features: AclHuK9oak2Ndwa0rlNcxXIP78HVDGk4Qnd2nfEL6l83940QRwB8MQbA06r5Mqg
Message-ID: <CAD++jL=y=89dCKmCGC11row1Mag6RdeTj5FVL1gonPhmpeyK7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: dwapb: Use gpiolib irq_set_affinity helper
To: Liang Hao <haohlliang@gmail.com>
Cc: linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 5:14=E2=80=AFPM Liang Hao <haohlliang@gmail.com> wr=
ote:

> Wire GPIOCHIP_IRQ_AFFINITY_HELPERS into dwapb_irq_chip.
>
> Signed-off-by: Liang Hao <haohlliang@gmail.com>

You are not describing WHY you do this in the commit message.

Yours,
Linus Walleij
