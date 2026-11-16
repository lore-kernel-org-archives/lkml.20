Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794839578;
	b=VELMn+sOfypvwABlG44x2+/GqAigfL6A0AWQ08kj9lzu8wfoPLDSKkdJUc9Y/8wyYXHS
	 zZs3KzoIf7HrcwJimK4OGfMkwp7e4HiASajb/sklQ9KWg4J2XmJBls4vGnDrNiWg3KWuJ
	 xR2Swcb1rlm7rcSXoS47VwZZ+PzRt8OmwHzkuvD2/8GNz3SYp2HhYI35XUXn4jojv7G5o
	 Rf4UAt9lcYTzYzpY0q6XygMKo4MjI5HdvhmFReNECSvxq36lHyw1Uxu+VNc0x2Tw5d0Kg
	 45hYv44ONeP5LSS2x3D+Z4iHjAWR6a6hokbF7VtgnkSCi8pvXYthhh0c6Ki7Q9pxbgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=C9B94QbPDjaKKQtAC6TsJzJpuRtomQi1ExQZgwuOqbU=;
	b=jvHt7cUP+B/fKcXMl7kGDuDyeAZVAtho2Mf6Xw6AHaH9iO7TQGqahTG5JYeQMeoJG5/z
	 Dxz8Ihb8SIWk1SY0UpYr28UWkybZD4RrNMUbqCZE/hLcLP2vQ4IIcsGiiVBzcH9LARX92
	 RtbMvlqu4UVusoMaeN4/uAODR8iYDU2NccRnZTGRofIAftGPQIqXLgYX42/JYvMDxwFuy
	 sFg2+Y7UU65VWtuceyiKy/cti69+uUZ1mzNrlP4OMkoXuWm4Hn0Y1mJ814b7g614GvG+n
	 CEXGEYcl1K24BNpq0dbuOd/Fnv0EypgTWjD5UWV6O9QZVAB7pudgW1uAdITUoKR4d3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8Z4CRwH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F642606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F642606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8Z4CRwH
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be47aa555cso3882499e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794839576; cv=none;
        d=google.com; s=arc-20260327;
        b=RTdkICrD6etmXbwuYmMr+g0PTlJa4WAX5CAZcWnTKhTHvYnsrxJp8MQVgvOq8TqXsH
         oQXm9nJ5W0Q5LYDbnFbzXd1oNOPnI+/IdWuybREZDLSSGUSBE6GrnbtJ9HRwWv9EJdnz
         L06GswpFMVQvhBrPjGQPxVIZpHsbnjKaewaHtExo0bczmkZ9OmV3Lw58w2PMWzlT7LOS
         KKTRFOaznFm8hKcOgJ7b6bNXNjbvWizC5qsBnrxzuGxU03xHL/Ekj+nIWqs91WM+9x/z
         6T5gOxh0HfTXOFQO94j05teqCublBCdMBjaolPGB7Ie656gTUaHjsgFZ6H7d34G6w2g4
         n24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C9B94QbPDjaKKQtAC6TsJzJpuRtomQi1ExQZgwuOqbU=;
        fh=juGpj8CQMRU3KimERrCM4Hju/bqEA1thYST/kvheRys=;
        b=KlMQ9JI7xIHARep49WQzSqLVBngTv1Kxckyc4sY3/GrTwGWSQ3gAN1EHmHFFxny+us
         oYy0XtfQmYHU+MGhlnBZaC/p4JNXEqxVZJDEL24BazAhDTZ2c+7nlWjZYvyEF/G73LaT
         pYzCmFpzNPv4s1Tt5lq469APyV+OkR3DBJeBZA2hnSFdU7vlw55ZophHnwvX17+5Rev+
         JJ71wY1F41YKsQkCbrVuU30OmUVbAVDLvqxoRAKMNRmBfTmIqy0mjjpitM+TUF85Swpe
         2WTUopZmVw/7XPV4T7HqJ9xWtUOaddtPaV5vgdQMjDwKB3eEZkfCPyzcukmjV0cV886I
         b0ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794839576; x=1795444376; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9B94QbPDjaKKQtAC6TsJzJpuRtomQi1ExQZgwuOqbU=;
        b=q8Z4CRwH0sjPZ2AFdplxBv97CtRNwTaq3BYuIkZ83p5Ma+7EkjEQAsofQcWZZ/ONR0
         Mzzk1Zdcy3XcKbyWGAiR1EGtmjjSgUifkCzpqIgae92YbtXl7T3GdDzlmuTK2f77Cusl
         wOkR1szXPoYEDsFY5iwXnhgxf5G38lV0jVXUIfMMFpznFKrTOp5Joy5TObwS1FrXAkRr
         +w8TBHmMyAoARdljtxljlgw0IQRsHvDk21+iXGBdv6iD6+IfHZP283dJ2PXdmoIw/PVB
         ivWiAOtIlgJkxlN7xJlMjdKMDLo9u5kfKWBtfKWczRbMeggQ5AFVuGDoASkVYvHYlGH7
         +iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839576; x=1795444376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9B94QbPDjaKKQtAC6TsJzJpuRtomQi1ExQZgwuOqbU=;
        b=liGHswyGtpdUhga4SUzZIAsHmt2qyVj8XIHVSKyGqp2M5/Aa6s4C2+RB/IzRr6c7n1
         +9Gz862LkuTHQ/iFV6jo71PjiXx0/EJ6qwxozqM9KBHnF+Ggl7ajybksw8po5qBMcQSq
         sOviA+vKVmE49EA9/AG/qmxlX+GrHAvhSbES4vAVQFrgIUG6c8WfX8idamfSQ+ZRy2k9
         jUNpfDfYTQGs20NrxY3+i8O/tK7lVq+m/sy9LiukBTjIDUKTqDMZgvVrFg9zmmThdAlE
         DlDF0sj0dLfWYSx1qWXuVFCdV4dSoL553gG6fQ7IhJGLM1wkpWeUlglLGOo7gkpMgpos
         Vlvg==
X-Forwarded-Encrypted: i=1; AL+hErFQBL3W67TvmGym7/I5whQcMcUSt8/zgZNMv5bSEc8NDYWMZXcysAoXeIrD+iAgzKUqXOQPhwubjDvR1Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+APFSjC9FHhgEMj2ErXAVnfIglrUSro7llAYomMCIUXDcr/kFs
	sXmGhQU/K4w1wcKBdNyfml4RAFaGBRcnqpZnRHCpDuOVY4JdSG5CCPsgPEBPx+Gy5fAK94Le2Hp
	trdKxG628KBoXIY+nvp9o2XoOMIPWwxI=
X-Gm-Gg: AYBFou09KSRWhKZWtQtZJim7pha2fFQb7Al4Myx9pi6Dk/0YHBOJP96oJ2ZFFpxNpk7
	BJxlpD+3eyOC3c/mW2MP9yHK5ymsG05kXEkkhYtso7P48DVUUOK/9QKtvxCIJDflf2/xsLPuvgd
	O+kGTr7rEJ0QyzgkpT1X6P/nr8aLkkMp6oUMFrwLrf0MwIXR0xRBOk+aVGlGc0ly52T727ENbKl
	BhbYWZ2ct7dYXlZnzvWHOTWPWzxnreZd50Gs6qAMfZFrD4tLZjPFexmYGb+o5xczH1XpXNFnstE
	4CzxqoREkGVqfhwIaZviZnpTwSzCUcOHRInesyuTff3fVlJG/KyD2cCnMnS2xiBpA3bfJnI+mzl
	NMjjFDinkKejzEKTbNttDz+OG/yrjnqS+Szkkkq59n/dfGM9Tp2uqn/3mjHq3T1/4QDtGEKVSCe
	2g5wbNjoGFksIsQl2ujJBb3BAq6G0dBVTN+0DwmP6V+1u8MECOUtMyYptOKjtVMzOsjl+cYeSRl
	wm75rdO5jLF1BLjJYHsKVv8gpQ7RSkqYPbgDKLA7hryOKlaJcZQOcD/26mz1LHWT6beUxUsBL+j
	eAlSxTTpvtgQ6oPSdqVRXDpneHapUSo=
X-Received: by 2002:a05:6512:31d2:b0:5c1:4c0a:49d9 with SMTP id
 2adb3069b0e04-5c1709aed3emr4514975e87.16.1794839576049; Mon, 16 Nov 2026
 06:32:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 16 Nov 2026 15:32:45 +0100
X-Gm-Features: AclHuK_LmPF6GdpEB1OKtm5HFOhuVUEo0FmsAXlPZr3XF_GhyxB157Z16Flkh34
Message-ID: <CALoEA-x+TpMdsE-e7M9+9K0wu0kgbwDdP02QsMZ49nnnahxxnw@mail.gmail.com>
Subject: Re: [PATCH 0/5] tty: serial: remove redundant pm_runtime_dont_use_autosuspend()
 calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2026 at 18:10, Joshua Crofts <crofts@kernel.org> wrote:
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
> Joshua Crofts (5):
>       serial: 8250_omap: remove redunant pm_runtime_dont_use_autosuspend() calls
>       serial: fsl_lpuart: remove redundant pm_runtime_dont_use_autosuspend() calls
>       serial: xilinx_uartps: remove redundant pm_runtime_dont_use_autosuspend() calls
>       serial: port: remove redundant pm_runtime_dont_use_autosuspend() calls
>       serial: uartlite: remove redundant pm_runtime_dont_use_autosuspend() calls
>
>  drivers/tty/serial/8250/8250_omap.c | 2 --
>  drivers/tty/serial/fsl_lpuart.c     | 2 --
>  drivers/tty/serial/serial_port.c    | 1 -
>  drivers/tty/serial/uartlite.c       | 1 -
>  drivers/tty/serial/xilinx_uartps.c  | 2 --
>  5 files changed, 8 deletions(-)

Hi, gentle ping on this series, thanks!

--
Kind regards,
Joshua Crofts
