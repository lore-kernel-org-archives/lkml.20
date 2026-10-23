Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741386;
	b=NGz+q8qyYs83Z+oKoBTrWByY5MJOw3mGmcE87s0y69d1RnwnZsKqsgkhue90UDpr3Rqv
	 CMJIzm1YiSKdwaODXmfQGV0+01x7L5vproPOD+34MxHaRKqFc2yKroHZIgvNhGcT81Qnt
	 KvwnDE7BMtgW9SbW0XTWWIfBZkcnPVP2lzT1RAP2HEKHhnpwBdQqxlrmxga/tDIafULt6
	 YI0sLJVTN+drFxeez3NZ82M161t+9arzCbVPokL5jPUG2/TenbSSajklSKqeI/A4mBg2f
	 2FXVnTg8VDvOSvxPKsh41mYEr/qgtMGk5s8XzIQiNRL0qugRrLvVJowJrISt/gh6a3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741386;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ZmH0LXWzGG8jvIL7EjuI5plXOik+cN18urNvOyHW0/U=;
	b=eVper7M3Jh4IN7E0Uj3I7gTbP5FQfPavN2mlHGRCzdLrg8/JLFRAbjGC05jsoHKDdUhq
	 bfZm1Yx3vE8f06EPdOPeqTV7Y3iZUG4yrgpfU9iUfTNv0V6wCtkS17xB9j1kobBeFlAB4
	 kK+OHwaLUsNF53y2HXe6oIv9ZP/qF1rj1UgtZ3WxfphiHQu2sTfxd7sIXdn6Eo5RcBeml
	 KgoQCIxcfcDEVmC1dyb2ULDgwcDBGVy6wwEQqi5ivhMiIeycf6Xef4gFE5YhwG73mQrxA
	 IMpcMv4SfByG4tKg/zXgOucaq5IAzQecLEMtONSC0LXn8o1RNTKSzEKyeI9X/TpRJXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ay91AUHd;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D6E606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ay91AUHd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7F4A44E412B6;
	Fri, 23 Oct 2026 07:43:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4124A60398;
	Fri, 23 Oct 2026 07:43:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DBEA10328501;
	Fri, 23 Oct 2026 09:42:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792741380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZmH0LXWzGG8jvIL7EjuI5plXOik+cN18urNvOyHW0/U=;
	b=Ay91AUHdSYKvAWYKs2gsI0Ug2d7LDdbIScMoGWzQ6jnpRgzilAGWFehPLYOnc4dWEWQb08
	DXf5r/AZyTP5PgW5yAsu9dUA+wYaubPn9tmCZcd7WO7TNfTAktk1qePEdVzv8GgPIbIitr
	ChhCrr8nOYkyDP0olOf4BOczSuLZ9TGwPxYRipVB7jG9o/K6ofwzGT2QnPHLCj0+ZAtJ1c
	yPCdZwBddmB670LvAYzzidDtlEhsxB0AxrUaiP/Vo2xC6dLirB3hBPQ4ZXYzaV9MtACtBU
	wM4RYN/6LKp41yME/YQ4/JhLu4nAQzVcpttmnCK6WNOwM/ubmmbfsrSsPEwoJw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Jiri Slaby
 <jirislaby@kernel.org>,  Raul E Rangel <rrangel@chromium.org>,  Ilpo
 =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,  Phil Edworthy
 <phil.edworthy@renesas.com>,  linux-kernel@vger.kernel.org,
  linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: calculate TX length before preparing DMA
 flow control
In-Reply-To: <20261022-submit-serial-8250-dma-tx-length-v1-v1-1-18cecc89a099@gmail.com>
	(James Hilliard's message of "Thu, 22 Oct 2026 11:14:41 -0600")
References: <20261022-submit-serial-8250-dma-tx-length-v1-v1-1-18cecc89a099@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 23 Oct 2026 09:42:56 +0200
Message-ID: <87cxt0q2v3.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi James,

On 22/10/2026 at 11:14:41 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The Renesas RZ/N1 preparation hook programs the UART DMA block size from
> dma->tx_size. The generic TX path calls that hook before calculating the
> length of the new transfer, so it programs zero on the first transfer and
> the previous length on subsequent transfers.
>
> Calculate the scatterlist length before calling the preparation hook so
> the UART flow controller and DMA descriptor use the same transfer size.
>
> Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA flow
> controlling devices")

This is the wrong fixes. Watch out 1788cf6a91d9 ("tty: serial: switch
from circ_buf to kfifo"). This is the one moving the size assignment
after the do_prepare_tx_dma() call.

Also requires to be backported, so Cc: stable.

Thanks,
Miqu=C3=A8l
