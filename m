Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709187;
	b=1r9umMRX+oc22/E7U2KV3FZfQ0XqdSZ3HJhqr8vMdtk6KuzHJxOtsHMFLtbOkZtmzuMR
	 Y6AfFMq/g6V/rLh6LOTWWgRPMYjjQQ9qrxlvVcPrJLjCetf4wZ5ymUAfO2Z4sgLensiKD
	 KryhXjjwydnP3IVsJ0xrgAOnppETtu0ylOs2L4l/HudaFRcJJMyBdWWbcOn6CBEM20wfq
	 qdMUqdM4GrLLhQjVJAynTkZEGV8ouYsiyIbcH5zWSOIu3m8WRAirfwDPq9sS9P32uEklJ
	 z+Ld181tx+IZ2X9JbaCJJh16vf0XA0w8D18a3Kt2eBLpXfDo+Bbn4y+6mvQgCxYgTSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709187;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hbNZBfIv/0uOJ1PwEaNvIG/iW/b95+ao7lxg1RZI7vg=;
	b=WgGVSAnGXJEjsjsGBdygT7ibnmH9ImJg1VyeWmnt6GMnbGgLq7BIBhZY955kuXqWQaV5
	 aKliUTPiuoekDpizqMEwZuDV5PEXM1qUa/gGxy/MWSFkgS6wPU6cskDrJNj08lZmoZyyS
	 9TiD7Lc+Ma2pGwH0iNnNjNOcaO9QNVL+bmbFYNeV8HVolSayRtDvJ7tgfZfDAvuv+5RAQ
	 2Eo0sXaE960mW9wccq3GCxMeNdvzypqorFSdOEn2djoRCm5ye8Lf/Aj8nVFstf+3gRTxt
	 IecNUJbm7ftRsaRMvi9dvT8g5Nzl1kUAtqAj4E1s7PAnKoFdxe5mVbclNoip/9uc2KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDW0sEDl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 25D6D606A33E;
	Tue,  3 Nov 2026 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDW0sEDl
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EC4DD1F000C1;
	Tue,  3 Nov 2026 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793709186;
	bh=hbNZBfIv/0uOJ1PwEaNvIG/iW/b95+ao7lxg1RZI7vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EDW0sEDlW2wyXrqPiUIz4rgTWdWs+WgapdIvK4nwhLfYu1Co1MpHXB7mQJjNJ9bRv
	 lDyuQE/LQHORvl9uqBZcqAu1wOOfST0VYoPaA7gXpkA6L+SWo709JpDbSM8NNETvq1
	 s1/GcAj7kCaOuYo7KmSsKU6+2D799JemLOXIBF34SkjifBZ96Crj3oC4y02cAS8RCB
	 EVRycZWZSStQU5ra/mLJAIy6pekBJU+vibpj/B9MzaSqkG+v6dnmNZ/gzvCVr4nRze
	 +j0Na05ig8M3KiCZ6vVXWraYtn0IpcER8ew/B1Spx8zrpLmCLfOjjyvnB0N8bOoUQF
	 n7Fy0XXdE99wg==
Date: Tue, 3 Nov 2026 13:33:03 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <gi22hjj45arue56j52h24bu2hmrfzcpxqrbp24i35e2tpv4n5v@nkavpfddugki>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
 <20261103041806.1885974-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261103041806.1885974-3-shengchao.guo@oss.qualcomm.com>

On Tue, Nov 03, 2026 at 12:18:06PM +0800, Shawn Guo wrote:
> The FUSB15201 is a dual-port USB Type-C and Power Delivery controller
> which runs the Type-C state machine and the PD policy engine on an
> integrated microcontroller. The host only observes the resulting state
> and may ask for role swaps, so this is a plain Type-C class driver
> rather than a TCPC driven by the Type-C Port Manager.
> 
> Register a Type-C port for each connector described in firmware, report
> attach and detach, orientation, power and data roles and the PD
> capability of the partner, and drive the USB role switch of the attached
> USB controller so that OTG role switching works. Data and power role
> swaps requested through sysfs are forwarded to the controller, which
> performs them asynchronously and reports the outcome as a port status
> interrupt.
> 
> The controller exposes a per-port VBUS ADC reading, but the Type-C class
> has no VBUS attribute and nothing needs the value, so it is not read.
> PD messages, PDOs and alternate modes are not exposed by the hardware at
> all. The chip-wide MASTER_RESET command would drop both ports at once
> and has no caller, so it is left alone as well.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
 
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
