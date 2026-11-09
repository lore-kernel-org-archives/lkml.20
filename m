Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198176;
	b=hfqWee/WmPzUzPSBvFM8fRDq5/M1rMRXulkjOoCPKTxdv1a48D4kXZn5BCl9u45sXsaN
	 e5NntcgVhrnRWL+5NCZjApdF5doyd9YVQ00xQUdcZZHw4AO8wlPKD4dVuvurrMx1599PQ
	 KowXl5b1q/6xPrdBLJV3F3YOVjWuUdK6S1hexaoIV+Tx7r37F7pN3+hF3red9cO2V6qNH
	 WdzjP1/6QRnyGK46pOuS6hON+V7gRbv2Fz0wQ8lAsBGL5q747OQFW/2HkLzt98F77ZfFY
	 nLTXn+MM2586yO3MZwVnaXDfBqyaaNGPWDzzPgYuZN7ehskSpH+bZ4BWeBqvk5i1yIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198176;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O6l7bC8NfpIvrgluquy8ZFUNaeq3aPMVFdatMcqvQws=;
	b=D3+BUvoffJTRX5ABr9ciN8ZXDXm5OoYVtOQQJAum/CDHsBlS2XbE0aWW6F0LENLWSUYL
	 DJhP2HabYfHq/mFP+fefDG8Dv6yLXHGE9zTd133E5kQKY/p62fNea+pTzEWxjMZNd6tEF
	 dLpk404NS08w5iE/VInmuPXCfrS4pTlaV5XFEB9Jkda+3OUyTbhFZytghQsk2a/gHXDQ4
	 A9r0GzwxQvtEx4A5vEuKVvaaek+fW1tgKWXXaDIb0jydsU4LI9U5k3jeZF5tzWrmjPuKk
	 /DJ/XTtNYqO9bo0hLbvaXrzHEgGsPa/la+DTqzQwCrVafmKnGUrZgjpf8XRTdsMwmIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjlfBcAp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjlfBcAp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A121F0089F;
	Mon,  9 Nov 2026 04:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794198175;
	bh=O6l7bC8NfpIvrgluquy8ZFUNaeq3aPMVFdatMcqvQws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GjlfBcApVuXS6krUlI045m3DwcQ9ms6Lqk1ISDNPedGwhRNz6LQtgcm84iEXOuFBi
	 uWQPEy29U3okJ3agLExaxUjTveQlhV0R5XF+biDX6cM7rswrsG3YzB/PcLJXLGeUX3
	 dCBDBtsJJZs0cqybas3+NUQUKAK8Vqhtz9PHzdeW51nvuzSylzj+7tHxD//2DtgQnw
	 zEMGQNV/y/3Ua9phWcs5Nq9nSDxZ1JZBqJBqLTRP062mjsSFs3FhY1hNGli1Un1wt6
	 ryL+rBNA9LBO9fr+jObTfaZ5utcgigThtc+6A0IJ3E8kf+KlOKrQ6uKgH9Mh1UzA4v
	 sA55AoiiW24DA==
Date: Mon, 9 Nov 2026 04:22:48 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: iio@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Song Qiang <songqiang1304521@gmail.com>, Radu Sabau
 <radu.sabau@analog.com>, Maxwell Doose <maxwell@maxwelld.cc>, Tomasz
 Duszynski <tduszyns@gmail.com>, Erikas Bitovtas <xerikasxx@gmail.com>,
 Waqar Hameed <waqar.hameed@axis.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] IIO: Ensure iio_trigger_poll() is of the device
 owned trigger.
Message-ID: <20261109042248.78b20068@jic23-hlaptop>
In-Reply-To: <20261109035252.1295926-1-jic23@kernel.org>
References: <20261109035252.1295926-1-jic23@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 03:52:38 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Sorry all. I can't even type linux-iio@vger.kernel.org
So please wait and reply to the resend.

> 
> The primary aim here is to ensure a clean layering between the two sides
> of the trigger / pollfunc (push to buffers) divide.  The caller of
> iio_trigger_poll() and iio_trigger_poll_nested() should be using data
> relevant to the trigger, not iio_dev->trig which is the
> current_trigger for the device. Most drivers got this layering right,
> but not this set!
> 
> This is also step 1 in a plan to make iio_dev->trig opaque allowing
> more control of how it is assigned and avoiding traps around lifetimes.
> 
> Includes one precursor fix that has been broken long enough I think
> we can just merge it via the slow path along with the rest of these.
> 
> Jonathan Cameron (14):
>   iio: accel: mma8452: unregister own trigger rather than current one
>   iio: accel: mma8452: poll own trigger from interrupt handler
>   iio: adc: max1027: poll own trigger from interrupt handler
>   iio: adc: ti-ads1119: poll own trigger from interrupt handler
>   iio: adc: mxs-lradc-adc: poll own trigger from interrupt handler
>   iio: adc: at91-sama5d2: poll own trigger on data ready interrupt
>   iio: light: vl6180: poll own trigger from interrupt handler
>   iio: proximity: vl53l0x-i2c: poll own trigger from interrupt handler
>   iio: adc: ad4691: poll own trigger from interrupt handler
>   iio: chemical: scd30: poll own trigger from interrupt handler
>   iio: proximity: vl53l1x-i2c: poll own trigger from interrupt handler
>   iio: proximity: irsd200: poll own trigger from interrupt handler
>   iio: light: vcnl4000: poll own trigger from interrupt handler
>   iio: adc: at91_adc: poll the enabled trigger from interrupt handler
> 
>  drivers/iio/accel/mma8452.c         | 11 ++++++++---
>  drivers/iio/adc/ad4691.c            |  4 +++-
>  drivers/iio/adc/at91-sama5d2_adc.c  |  2 +-
>  drivers/iio/adc/at91_adc.c          |  6 ++++--
>  drivers/iio/adc/max1027.c           |  2 +-
>  drivers/iio/adc/mxs-lradc-adc.c     |  2 +-
>  drivers/iio/adc/ti-ads1119.c        |  2 +-
>  drivers/iio/chemical/scd30.h        |  2 ++
>  drivers/iio/chemical/scd30_core.c   |  4 +++-
>  drivers/iio/light/vcnl4000.c        |  4 +++-
>  drivers/iio/light/vl6180.c          |  2 +-
>  drivers/iio/proximity/irsd200.c     |  4 +++-
>  drivers/iio/proximity/vl53l0x-i2c.c |  2 +-
>  drivers/iio/proximity/vl53l1x-i2c.c |  4 +++-
>  14 files changed, 35 insertions(+), 16 deletions(-)
> 

