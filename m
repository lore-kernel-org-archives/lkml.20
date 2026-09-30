Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001953E0C44
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801971; cv=none; b=B9olDTJcKnel5uCOOFRiFVP41YWxPV6uSV3ZKBEPMVTUutO0KjblIf5u0+4GRub0yCsTjaLxX9BhYhcAdOyUIiFhwfEsoJgR8QNhoCFmrGsc7VHaGzZq8fPo5NeCviWxxVEzkoxhT5wsoJWMmd1guGNhExy4XbNsljSOOWEJK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801971; c=relaxed/simple;
	bh=x2xDoi432TpdS/q9V1G7eQayt3YVdg1enz2iU5BviuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzDIFcUQf+ETWuyGCfmqxUJ4IDHd5ptZqDD2xbMfxyhDkf8hi9XAnbu6D1EvKxW/tYhgQUvwwXX0qJZDA5cf48kigG8NNg9PWXDjQfgaJe76HfCDMOL8umdj5C5VPIsFdl2LOYOIwL2qEYayAB6bpvR+/xy7VVLFA/oVWPAzGtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T81mUW/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T81mUW/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9819E1F0089B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801969;
	bh=x2xDoi432TpdS/q9V1G7eQayt3YVdg1enz2iU5BviuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T81mUW/hw9yHMlbon3JBub2tX+pVw8QbZdtVbmDn0vR43Xjt2VemsTg4o1f5tW3Pm
	 WEqH5dlsf4bfnQQZ0QvMkRjZbGSisiumU03R6WRWtxV1l8jhZFJHlMAnec8D3A/ody
	 6MMVT7x8s0bfoBUDGPWDaUK9JH0Y54tJo+lae8y3NLu1IgvPJ6prveTXGQeFjp0K4U
	 IHxh2K4p3ZInzKjnpi6wQ5BSWxrqVlOVL7ZYsKZ9ke0Udiet0x3OZM433+woNhGVnv
	 uGdCMz51/L7v8BnzgCvEYPdIZc1IIo40olrp7U0vYk49pNDgeqwwd+N/T4dHC2vaRA
	 BcqJhtJ2SiFpQ==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64b06fc66so40835501fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:59:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwejy6CMD3ZnNNqxiRb7AXth3W2OE4erDCxStVNoKfLwZryHQSG2rNIGFzgh8aC+8aEj1U0xGBn5uxum8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPa7WyFWgUE4dfwP6ZOwfoQFEdcGcD3J03Pn5GWoaNRtBtOv5b
	8HMoUOHlKeWGEpLy9MzrH1dAPdV3tiMZspvDbMQTfn8EEslzHdD6dkKriwRTFKhZUFpdouZPi9L
	uTiX4AD8LcfnhvGJ4eNb2id9SL0CCSZg=
X-Received: by 2002:a2e:be07:0:b0:3a6:3074:1213 with SMTP id
 38308e7fff4ca-3a7791f6853mr8204661fa.10.1790801968394; Wed, 30 Sep 2026
 13:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-9-will@kernel.org>
In-Reply-To: <20260918161407.2300-9-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:59:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLmasCTjrOhoh2adbcJOoUp3tpyKRoW0sQ208Yu+gmASyA@mail.gmail.com>
X-Gm-Features: AclHuK-WMilLduU0SJSUy6DYdYt0XQQZ-96_5ql4TiYDpBI59IN3Gx8NkrGan-w
Message-ID: <CAD++jLmasCTjrOhoh2adbcJOoUp3tpyKRoW0sQ208Yu+gmASyA@mail.gmail.com>
Subject: Re: [PATCH v2 08/21] scripts/gdb: arm64: Use TPIDRRO_EL0 instead of
 SP_EL0 for 'current'
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
> update the gdb 'cpus.py' helper script with the new register allocation.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
