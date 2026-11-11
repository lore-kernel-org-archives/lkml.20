Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359634;
	b=pwOkLFSm3IHABiCQxY0/k4k3kYcKaK7gBnwaJ+tkYAE/H628o/NJpcFT5iZbfcArKiY8
	 B1qyE6sScgNJpwwPBkk0olkozprB298AiwH3iJd519S/nEhzaarZj9QdYie7NNPDx+eOd
	 PwhCdhs2+CAGpwoQD+XNIxGR5L87oTLvz1d2VzG8+gOwyXni0DzRCUNNAYPHMMl5AmZdj
	 Bsc1i8ii+1HERANQQqMk0euG4905R+Dcp/DmfYSMdy9cIwr3PdP5+G9gxaGm+QzXX+cdq
	 t1W51y5/buJe5lqNI1FjTU4tUZ/9nNDbHrYHOhnbQ6i/CBRuOzeVLoYrtI+ufg226IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359634;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type:Content-ID;
	bh=9G86ezc2tSarZK3XMTxJLmspGwjOjjloDjMYM9KNl8Q=;
	b=vURC3pbax27JUpsXQCY2iSCOECRC6ak/X/zotr/qlX3o0mQh0kYmU3SPOMvlFATMCeNj
	 ZcG9CrTgBXU1SFmLW2KHl9ibYjabe8cGZOlAab6zSsdtkaQPJ/7sd5z0HYDKeZN5lSOn7
	 ony6bUPVpM+5PBe6BZIfzXfmzWQ8UWJvoNDvBHTxdFzXZVOD0TNQzczkWDYaM3Gz1mWsy
	 PyKIHNFoG/sC1qXhw8Lzuq+HhdZx3C/GjXUxF1Ji7X6GnmhlfYQYl3nHFtubWPRxa2W86
	 5giFMhKrmw/5FoeDDMAzZFNL9k7g71r5rMjXBjXMo/xR7Zra9zWXwCOfhxY21U5Fuhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1uP6iM3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730CF606A321;
	Wed, 11 Nov 2026 01:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1uP6iM3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7BA1F00A03;
	Wed, 11 Nov 2026 01:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794359634;
	bh=9G86ezc2tSarZK3XMTxJLmspGwjOjjloDjMYM9KNl8Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=C1uP6iM3wNW/8HkHF73adJ5pY8Qf100Rl2QwfEVP0kP4J58/G4KzfVwmq7ufMDJAh
	 dCE0/vnQEZxGTaB2dJMabiHtgFyaoor0b/cPxlyk12ufdVXV9aL4eRNxcbKx42qHXx
	 0Xw32rt0+4HheVZfLc/HiCs4wVWdmr5x8Hi3EyfPe1d3MnMbGMc1eRRBDucaCK9Kqx
	 jUF7tX8dyDZIFcRB0chIi8dN+EtYnXcwmePw9urCZzDpXszpC9LYELksaq2ndnk+To
	 7AVEmJjNXRHxGmuCUxaARUfuw8OTp3p/UZntF4k+HDZdhdib2og9omvuP3jXMTo46y
	 FtrR0aJkzk4nA==
Date: Tue, 10 Nov 2026 18:13:52 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
    spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable onboard USB hub support
In-Reply-To: <20261109175555.323067-1-frederic.mahe@cirad.fr>
Message-ID: <857db758-8aeb-178f-6acc-b163ba636863@kernel.org>
References: <20261109175555.323067-1-frederic.mahe@cirad.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-949019252-1794359615=:1436767"
Content-ID: <73288eb2-efa1-fa72-c824-2d612fa1e6ad@kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-949019252-1794359615=:1436767
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <583f3743-56c6-ad22-7710-dcda79404eec@kernel.org>

On Mon, 9 Nov 2026, Frédéric Mahé wrote:

> The Banana Pi BPI-F3 (SpacemiT K1) has a VL817 USB 3.0 hub behind its
> DWC3 controller. The hub's power and reset come from the
> "usb2109,2817" and "usb2109,817" nodes in the device tree, which need
> the onboard_usb_dev driver. Without it, the hub regulator (USB30_HUB)
> stays off and the board's four USB-A ports are dead.
> 
> Enable USB_ONBOARD_DEV as a module, as arm64 defconfig does.
> 
> Tested on a Banana Pi BPI-F3 with v7.4-rc1 (dwc3 enabled as a module):
> the module autoloads, the hub comes up on both buses and a USB mouse
> on a USB-A port works. Without it, only the root hubs are seen.
> 
> This patch was prepared with the help of an AI assistant (Claude),
> which also ran the build and boot tests.
> 
> Signed-off-by: Frédéric Mahé <frederic.mahe@cirad.fr>

Thanks, queued for v7.4-rc.


- Paul
--8323329-949019252-1794359615=:1436767--
