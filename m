Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733721;
	b=tEnaBXuHp0UUrePmc4KRHZCYgzj6VPuqPlGEaxt1yqjCiJI9ztpT/zbykFghw6sUrSa0
	 dqYXW2NH+qDHV5mId7rhqLgUoCy6nwXLFOB7LlD6E7E3juN4l49VLyTpJ75dpSRf/Z5IE
	 u146WrcoWqpMnqNmNrUR+1nQR16YX1KISexF7Q3npswNUALl2VRaVXcLWSCUOEC2MJhvc
	 ozV9SrJa/t5D4OJ8GiRSp1xgqjTwFY3pVYuqdHxQ0KSbBjb5FdgUsXZzSErOO7NYbj6wP
	 83SVY0J4NOKziYomn2Ovm1PudL926J/n13YIRGbOvGo/Zapevb3mX4GFmacv0WjrlYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733721;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cPbeiqkDI6oY/fjnT97usmEJdL0j8jI/QK+Y4eHs8ns=;
	b=OeRhsznXiBGvRWRp7nsXRh0OFolaACvlie9k5oXl111yj3XM0Cjwm5lKreO71yWpUpeR
	 zM+ydjrx/7rXlOOmWVXua+MYDIMMl0s7ezDo+/qCkApu81rqeo8ozXE0V1ohlvwNgtCIR
	 rc8MQ0S0U8QWnUY9CIl0P9+U2dor9/10FTmqdOmKC/tdcuw0ZrIEx9C05SxRBEbc0if1f
	 K2qtaLki7MavDGWFB0L7BTK1dGOcPxarYubdcMJmPRK+f6YaQE/NHDISyvUV21WceCFGq
	 pt6EIItg8Y5wF6Ecj1J2EL8gZuzt1rWj5g30jLWcde4VK/9o2rr2rE8aoz3UmCSaWcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xOKs6dnc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63FA606A329;
	Tue,  3 Nov 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xOKs6dnc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C241F00919;
	Tue,  3 Nov 2026 19:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793733720;
	bh=cPbeiqkDI6oY/fjnT97usmEJdL0j8jI/QK+Y4eHs8ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xOKs6dncLp5uctq0qOE/hGOl9Sha41iDSIKXehgnVc1klkqRdQyTMgJ2ZYROOR3VC
	 YSwLcvx/LT6htRvk0yBBNcNqk0B3ZLbeuKhIzziVkEKgG2jouB+RnTjWHf19HUO4U2
	 M867f1/rTOvMMdiuKb4WbHo2ABOjevN7Oo99duLw=
Date: Tue, 3 Nov 2026 20:16:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rishik <rishik.yechuri.code@gmail.com>
Cc: Rishik Yechuri <epicrishik@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] staging: rtl8723bs: replace private 802.11 header
 macros with generic helpers
Message-ID: <2026110322-axis-wispy-1081@gregkh>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
 <2026101402-spotter-stitch-056b@gregkh>
 <CAL4M7k4kABFmDrReZ0dnuYHiEb0Jn2N=iutncNJ4X-S=HPAYXw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL4M7k4kABFmDrReZ0dnuYHiEb0Jn2N=iutncNJ4X-S=HPAYXw@mail.gmail.com>

On Tue, Nov 03, 2026 at 12:21:18PM -0600, Rishik wrote:
> I forgot to add the assisted-by tag to the series. I wrote the series
> with some help from claude. Should I resend the series with updated
> tags?

Please rebase on the latest kernel release and see what happens :)
