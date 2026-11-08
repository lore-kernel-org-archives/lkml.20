Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794156689;
	b=D6tqildlim2p1FSZaf3m9bP6Z/5BXNggfhSvLM3M3vUC1SVCgx4WjywxdJ9dlSos2X1T
	 mrkcgbebcnBMOQ5GPUQaGZWOUV+vbREPB5f08d1dw1obHnswYueJChvt/ND1zITygafOY
	 uWlJId4GtvXBY43+nylbMGbQGO03JAT39mpuVCaRC7yMPYjFasBS/HLxzntjmEUOm0lta
	 LRa8HY/x4wennWDkGMGRFMEkV7YEYPhN7xF16NndRB9vrAt+WU9d13VbNxLT+Trspcrip
	 sju9GxL/8bxFqmKWDaTJy90bOfwnN+WpbtCwB6rWr16cl0wFsfUC2IdEKRAVJdLcZUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156689;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HYdezMpMDTFxzK1FZSXPnbV9koPM+33TOfuH3HebiDY=;
	b=SYXf+mHgcVHT1J7O/QXpvRwrIN0hOUus2SxrRGt8wQnzPPXJjb/BBRrFOH3FiEcewkqj
	 QEzzSURI+Q6ON8HR1Kk1AfBxHYDSgQOZP56n3qOHpQCkgqrcDk0DWUBPYpnra0bwY8C4L
	 ENPjQRsmGnSsKx8YWisxDcUYx6JJgkR0139nyrQiXrWeOWA/n3nVhTZNTk53aOeocW8BR
	 f5D2mKU4l2SMw9z3krNwytTc0yiBcIeidLz23U6y1VWV8zyxHCPZNKU9w1fbvhQq5JS65
	 wyC+2SFF6dJSiv2ai//W/V6MSJ/mKvN8t/+EonEE6LV9R6jI5hcG7nnFFb54O5vY2PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKY5HchF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C400606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKY5HchF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FE51F008A3
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794156688;
	bh=HYdezMpMDTFxzK1FZSXPnbV9koPM+33TOfuH3HebiDY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cKY5HchFPJJy/ssHlxCtcZgd7QCYCOxatgwRkpX8JEKqBjsmbhNM79r0PcpXYzo8e
	 gh7Y2w7rK14qmB88u1U2WdH19UQJmkgX0nGJjCY0/BZASK+6NhUyBeJ2krTxzVwkEi
	 qrex2+0GSGngAboBwHrknrxGb+Y1g3sCrGM4K/xO0YR9u4BGY5Wq3k+cAx01xlSBp8
	 mNEPWbK7bWeEzyKZPC3AJcfCPQA76p3bw5DIIm5lTWXAfeC4md0egZbaoaSbUGG2hS
	 14E0rScpkZw/1vIFFRgzRVOTmDRLtrtMFh4bR+wrnILPdVk6Is3NTlfO9W+8f6z+y9
	 +32eJN5G9PJpQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso1804681fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGs9Z3AXuyxBcem6KF/l8AP64EkS9nyNGK9JX1YbSJHNUB1XeOFvwaue/wprkFjpx1rjeQUpxrq9HpKep8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h1SPCN9Wwa8P1PZcWy5P4Qh6ad/7ZLnlWhB34onMI+3p5YXAg
	Ie93S3VHv6+dtCP7qVH/ppd2qG6eWWRlYJ9VQwojwwtkcnQ+M/45i5XU8WhVRUTflb1eI/lMfYJ
	bCPzOxGRQZmko3e8fwl4l/J7To6N4eZo=
X-Received: by 2002:a2e:bcc2:0:b0:3ac:43b3:d926 with SMTP id
 38308e7fff4ca-3adfa427714mr2794851fa.8.1794156686440; Sun, 08 Nov 2026
 08:51:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com>
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 9 Nov 2026 01:51:13 +0900
X-Gmail-Original-Message-ID: <CAGb2v659Km1rsvEbnwtFZwX8O+rztBXc1xuSoS9_=siz0EDxRw@mail.gmail.com>
X-Gm-Features: AclHuK-CJjXMYHavmXJ4Bjl3HAAm8K3xT0QbfHYHd9dVDpGfItJLvFreCyFJ8Tw
Message-ID: <CAGb2v659Km1rsvEbnwtFZwX8O+rztBXc1xuSoS9_=siz0EDxRw@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: sunxi-ng: describe CCUs as tables, add the
 Allwinner B288
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 12:58=E2=80=AFAM Pablo Mazzini <pmazzini@gmail.com> =
wrote:
>
> sunxi-ng drivers describe each clock as a static structure, list it
> twice (ccu_clks and hw_clks) and keep a separate reset table. This adds
> a table front end: a SoC lists its clocks once, indexed by their binding
> clock ID, and the core builds the usual ccu_* clocks from that table.
> Bus resets come from the gate entries, and clocks that a SoC generation
> shares come from templates. Existing drivers and bindings are not
> affected.

I think you're going to have to give more justification. What do we gain?
What are the trade-offs? Building all the data at run-time means we end
up consuming even more memory. The tables from init time typically aren't
dropped when a driver is built as a module.


ChenYu

> The first user is the B288. Its driver is 212 lines here, against 749
> in the current style.
>
> This replaces patches 01 and 02 of the B288 series v4:
> https://lore.kernel.org/r/20261012100816.331033-1-pmazzini@gmail.com
>
> Pablo Mazzini (3):
>   dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
>   clk: sunxi-ng: add a table front end
>   clk: sunxi-ng: add Allwinner B288 CCU driver
>
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
>  drivers/clk/sunxi-ng/Kconfig                  |   5 +
>  drivers/clk/sunxi-ng/Makefile                 |   2 +
>  drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 212 ++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  11 +
>  drivers/clk/sunxi-ng/ccu_table.c              | 510 ++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_table.h              | 233 ++++++++
>  include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
>  include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
>  9 files changed, 1101 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_table.h
>  create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.52.0
>
>
