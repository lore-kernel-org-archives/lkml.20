Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3385123E33D;
	Thu, 15 Oct 2026 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056436; cv=none; b=hFlC0j4n1V9MCryphFBC1NWRxgliLuVIaiNjn//6FSczrYT49ui5+EC2D9kZd0morfivXnkegIU2h77tJI13w5ns5oK41p/tNBoZ8XSi0J2yva7zu3wtmbl+utYASn0Q62PtrcBXmsOtXLQsbQ+vR3mQAvoeGoYtdybfZ+L7EGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056436; c=relaxed/simple;
	bh=YoAGyvNOVWW/FIgr/bJeGLOxcmmOb0FRZVPhuNr+3Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1lUZlNMbxpwHbXVFMi1WEg9AVHRXYw+yCkxRW1z8t/toju/uPfNWyctJbLoqtYPdsB14dGdUS/QwmujZy57ZJMoKUlUUyUu2PaYj453WHMHcXs7svxW9Va/5dXwwrUHDr4SystARB4r//481RH82kdYdVwB4RE5UDualja6PTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNY6mvVD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNY6mvVD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DA21F000C4;
	Thu, 15 Oct 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056434;
	bh=3mdYgBt2LqB3LVgkJYeY1oIFFwKjz6NX1BHb65C9Dec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mNY6mvVDi+W8sqfBDlBi7cPIoJAzc8uAef8ObVwlpSneTh99bFmMBX9TRgxZz5ZqB
	 NBPiDoTpMbgcTnO3t+hm9mGv9Hp2BxR1zVmnzcskjGkZQmCmWZzF7bhDb+xkufDJ9P
	 32XYSa5/QcZMdnOJsyPDXOx3E9yTDhx1B9SACs1t37GPnTkWUSKUOpaX4mktQa8kiR
	 il57qggWOoLv7su9BU6SidpTFFob8F3bFk2gY3NhH1+I7zjp587grslsoqseq420rb
	 Ia/KmN8fQl7WvLuqVbkkd0azvZHQ0POrZazUde45SMaGjpcvVnejnasbpnH3SvIuDn
	 1j/GQvXbYKgbw==
Date: Thu, 15 Oct 2026 11:27:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset
 controller bindings
Message-ID: <20261015-noble-sloppy-chamois-c71dd2@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-6-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-6-ghahramani.navid@gmail.com>

On Wed, Oct 14, 2026 at 08:20:45AM +0100, Navid Ghahremani wrote:
> Define logical reset indices (0, 1, 2...) for the topcrm and crm2
> reset controllers on ZTE ZX279128S SoCs.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../dt-bindings/reset/zte,zx279128s-reset.h   | 26 +++++++++++++++++++

This belongs to the patch with bindings/schema.

>  1 file changed, 26 insertions(+)
>  create mode 100644 include/dt-bindings/reset/zte,zx279128s-reset.h
> 
> diff --git a/include/dt-bindings/reset/zte,zx279128s-reset.h b/include/dt-bindings/reset/zte,zx279128s-reset.h
> new file mode 100644
> index 0000000000..5b580bcda8
> --- /dev/null
> +++ b/include/dt-bindings/reset/zte,zx279128s-reset.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
> +#define _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
> +
> +/*
> + * Top CRM logical reset lines. Mapped by drivers/clk/zte/clk-zx279128s.c
> + * to hardware register offsets and bit shifts.
> + */
> +#define ZX279128S_RESET_USB_B9		0
> +#define ZX279128S_RESET_USB_B10		1
> +#define ZX279128S_RESET_USB_B11		2
> +#define ZX279128S_RESET_USB_B14		3

> +#define ZX279128S_RESET_COUNT		4

Drop, not a binding.

> +
> +/*
> + * Top CRM 2 logical reset lines.
> + */
> +#define ZX279128S_CRM2_RESET_PCIE0	0
> +#define ZX279128S_CRM2_RESET_PCIE1	1

> +#define ZX279128S_CRM2_RESET_COUNT	2

Drop.

Best regards,
Krzysztof

