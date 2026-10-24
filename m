Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792865133;
	b=GAEkf25sC7jahDtszykDam4+9RvpsLKUx35DcwBiFc2gVVtO47X7Hhhh6SDTuDajrEt2
	 ve5tFfzbNo0twLSHTu+hBvjdh7sc3/5eF5eq+ayNWhtMV9QsH2rIbo5kZfZ6jlF7UG4QD
	 cRK+Qz9ukhJ/NkzVQnizImwX54oPbliWA7RpFZebA0Sm9CU0Bl4/UQHjgdgqNdWe0fBpW
	 aRGd4DMdTGak9YcHFs1gYsfZ7MlncsyqzPTyZZwMrFQRQPNOTDC34qlGs/ABH0vOMZjjf
	 /gW+qXxzEWjGlRPAodsE0DioHv/Tmr3Kwfh6s7ilZfjoWo2z54Qw1kjINW5mWv11vYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865133;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=FpzwCxPPS9IwFBjAs06Z/W/Hx2bJLTKEYnKVn0uvtA0=;
	b=qfdLTXUKvic0ogas2C51UmWbFT1rrgU4QJKuVzS88DkgqWmYQZicDwaKdyKjK3C3xtp+
	 PYj9oYu1c73GDdum9NEFR8Zeqz3M5a8LXXJnZEbQv2TvCzqKder4tiUCiIyWuZX+9vlFV
	 K0VppTJfzvRlXr1nluRyahXzjVBz0cLi7V1k+tGWNkXbZlqRhOU2xp07nrMkpnKdvHEnu
	 dqCcLV8UbR2UvV2lYEiOeZUtARGGa9oT1C0DiYdK1QGrF2cWjn84uAmww8mX40lSeubSV
	 xGsJ2WiNhAG1xvhUTOTZzOOtnaSUCGXjG9go0Dv3gwO+4heW5AGngMTL2GAlQXtQv5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=wXQnmlLl;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16190606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16190606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=wXQnmlLl
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B6576D312F;
	Sat, 24 Oct 2026 21:05:22 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B6576D312F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792865123;
	bh=FpzwCxPPS9IwFBjAs06Z/W/Hx2bJLTKEYnKVn0uvtA0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=wXQnmlLltfKxte+M6I5nW33rVCJnzHb+5dVLwE2M1C1FkvLePr0ENj0Hon2ICcHZg
	 izGFUgkRtEZWtMsm/UshW9IzLyTEWBTy4aC+xECOxMnk7AVActsfZCJdTJTJoABVFw
	 VB2Bfu9o2T/o/6WmweDyOVf5t/udzrnPCYvT0tHNTBjhmovvE5uHM1RUQ6wuxoemXl
	 2IiiZw0EBFBlLnwRCY+mRFqfUNPCti/iRwjIie8n/yzdC0EF/gTet37RHRaFcGK558
	 xxDer5Y/jmqSs6ZqiKR2MAsEfx7iEnLxyzluyE8WE6YVkglT6ivechXJZl7DuR3hp6
	 tk5BI3KbmuyjA==
Message-ID: <3693b2aa2bba051b82406baac73e0e03921bad34.camel@rendec.net>
Subject: Re: [PATCH 1/4] irqchip/alpine-msi: Use SPDX-License-Identifier
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 14:05:20 -0400
In-Reply-To: <20260923083703.38974-2-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-2-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-09-23 at 08:37 +0000, Eliav Farber wrote:
> Replace the free-form GPL v2 license boilerplate with the equivalent
> SPDX-License-Identifier tag, as preferred for new and updated files.
> No functional change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 5 +----
> =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 6764d64e7950..0d97abb85e16 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -1,13 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> =C2=A0/*
> =C2=A0 * Annapurna Labs MSIX support services
> =C2=A0 *
> =C2=A0 * Copyright (C) 2016, Amazon.com, Inc. or its affiliates. All Righ=
ts Reserved.
> =C2=A0 *
> =C2=A0 * Antoine Tenart <antoine.tenart@free-electrons.com>
> - *
> - * This file is licensed under the terms of the GNU General Public
> - * License version 2. This program is licensed "as is" without any
> - * warranty of any kind, whether express or implied.
> =C2=A0 */
> =C2=A0
> =C2=A0#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Reviewed-by: Radu Rendec <radu@rendec.net>
