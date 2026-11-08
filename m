Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117965;
	b=EdFq4HYpwqh8hIOFtDYq5JBqUjDj81ocE64xwMmyef7zjHOUa/NTlb5upr+NYy3RNS+R
	 73KFklaKWYwgupgMpIJasVBcaxc8gmPcQUOVjxbH/RCEJwPhcADMUrH0bbm9Q5o8Eq+tR
	 fxkLqFok+yCds3QvNNWyCxs1edK50+gxykK9ibk2ufpJUkA+cFDev8x7qLxsnbZYYJxw3
	 JhmkJ3G8cvvyLrdMXW5fCxJ1rZxRsF5u5YPFSLJ5R8BsWIhGGfgSmpJQsSMiORnImUx0Z
	 OAT3ykYM3je7eD8kPmHhIjmO0Q64QGKVJnFSSgMeLkQKSPU+4A20uXRRcSceMrmQBGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117965;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=qX6RWh+r5fIz1Q9pt4v2d9+SdZF7rn0C/5Yi7I63gg8=;
	b=0VbgDdOczawnfZpxf3mIjJ00sGfkshO91u2os3Q+h+9hi08I4V/8oyUpSffqcuMYQk2j
	 ebAPY4XWq6omqJh/89C/axDR5oe7iZsNaqMFz4HqvKkW9E1RuQLuSDnk4jptb3xET42I8
	 9PGpimlND3PHBqVHINWX/b1YjmHkmOmPCEiXdiKY0PXTDL2IzAy049AW+s2mV/DUlwfrD
	 WwqgXqj4dZHp//5k/Fc6JdnDAPV1bER+UVXYSXSDbW9MvVJdPjHlkxRGQtbVX8Z9fnIMI
	 FHKmAbc8qWkpwy5Na/0Ih0lCz2QOajwx6pXyC97lrqdnRLrDVs9CqTXg4AAUIiu62jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lgCjYag+;
	arc=none smtp.remote-ip=95.215.58.69
Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A692606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 06:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A692606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lgCjYag+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q/O40flVM8Wp7LXnkoxKijf2YqAcnc+fE/DKekU+fGA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794117960; v=1; x=1794722760;
 b=lgCjYag+p0Coxqe9LSsmXEGd2C5MvU9cjnIfnaiDfKnwOfL3F2ffR7sAxoVEKa5nza6G1JDS
 bdnoUn55unZ4L08lsLJ4v0yuFaUS48LdHw5Wfv6SfWKS/Id+tjMaM5GOcpJAKyoLwhDAA4piadm
 0EL42eP8H+ax27FNoW+UIdOM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 56e57e8d5f37b56e;
	Sun, 08 Nov 2026 06:06:00 +0000
X-Mizu-Trace-ID: 56e57e8d5f37b56e
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 08 Nov 2026 06:06:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <162821b6cf0e6d17aa33c81d55a716b553e70579@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v9 0/4] wifi: rtw88: sdio: Fix unhandled RX
 request interrupt storm
To: "Ping-Ke Shih" <pkshih@realtek.com>, "Alastair D'Silva"
 <alastair@d-silva.org>, linux-wireless@vger.kernel.org, "Kalle Valo"
 <kvalo@kernel.org>
Cc: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Ulf Hansson" <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org, "Alastair  D'Silva" <alastair@d-silva.org>
In-Reply-To: <f2784538533947a38e9d03af7bc7fce8@realtek.com>
References: <20261107035321.1210303-1-alastair@d-silva.org>
 <ab3dcde64bb90809ae10627803315d7385d6708e@linux.dev>
 <f2784538533947a38e9d03af7bc7fce8@realtek.com>

Hi Ping-Ke,

November 8, 2026 at 4:06 AM, "Ping-Ke Shih" <pkshih@realtek.com> wrote:

>=20
>=20Luka Gejak <luka.gejak@linux.dev> wrote:
>=20
>=20>=20
>=20> November 7, 2026 at 4:53 AM, "Alastair D'Silva" <alastair@d-silva.o=
rg> wrote:
> >=20=20
>=20>=20
>=20>  On 3081-based SDIO chips (observed on RTL8821CS; RTL8822BS and RTL=
8822CS
> >  are inferred to be affected as they share the 3081 architecture), cl=
earing
> >  REG_SDIO_HISR_RX_REQUEST requires both a software W1C acknowledge an=
d an
> >  empty RX FIFO. Masking this bit out before writing back to HISR prev=
ents
> >  the software acknowledge from happening, leaving the bit asserted ev=
en
> >  after the FIFO is drained and trapping the CPU core in an infinite
> >  interrupt storm that locks up the system upon receiving network traf=
fic.
> >=20
>=20>  This series fixes the interrupt storm on 3081 chips and addresses
> >  related SDIO lifecycle, locking, and error handling issues:
> >=20
>=20>  - Patch 1 returns error codes from rtw_sdio_rxfifo_recv() on alloc=
ation,
> >  oversized packet, or read failures so the caller stops immediately
> >  instead of burning through the loop budget.
> >  - Patch 2 tracks operational state via rtwsdio->running protected by=
 an
> >  irq_lock mutex (using a mutex as SDIO bus operations sleep), seriali=
zes
> >  start/stop state transitions under sdio_claim_host() and irq_lock,
> >  cancels the TX worker synchronously on stop, drains rtwsdio->tx_queu=
e[]
> >  with locked skb_dequeue() and ieee80211_free_txskb() in rtw_sdio_sto=
p()
> >  and again in rtw_sdio_start(), and resets rtwsdio->tx_queue_stopped[=
]
> >  while waking stopped AC queues under tx_queue[].lock in rtw_sdio_sta=
rt().
> >  - Patch 3 fixes the interrupt storm by splitting
> >  rtw_sdio_handle_interrupt() into 8051 and 3081 paths. On 3081,
> >  interrupts are masked via HIMR, acknowledged via W1C writeback,
> >  serviced, and re-enabled under irq_lock if still running.
> >  - Patch 4 refactors rtw_sdio_rx_isr() into separate 8051 and 3081 va=
riants
> >  to clarify the differences in register width and HISR handling witho=
ut
> >  any logic changes.
> >=20
>=20>=20=20
>=20>  Thanks for addressing those comments, v9 looks good to me,
> >=20=20
>=20>  Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> >=20
>=20I don't know why I can't see v10 in patchwork [1].

I suppose you mean v9.

> Please take Luka's Reviewed-by for each patch, and send v10.
>=20
>=20[1] https://patchwork.kernel.org/project/linux-wireless/list/?series=
=3D&submitter=3DAlastair&state=3D*&q=3D&archive=3D&delegate=3D
>

It might be the same issue lore is experiencing. Nothing newer than
November 6th is appearing, maybe it's related?

Best regards,
Luka Gejak
