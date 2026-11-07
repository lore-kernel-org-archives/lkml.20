Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794040368;
	b=a4Dfvq8kX/KTNtzDdYff75qCU9i7okSeBP9G3ECHjHASXsaaOwqidZbGbJN7ASV9DEfe
	 Lar/mLKvzjMmk6/h1jCGHXhqpz/waV1hNedWOIu4gNUc01MnTdwRMtaJIY2a9MQynKp36
	 h0HxPW92QGlB3OsfC0zs6mpLC2c1cBtAbRgZoSxsP3wyxF6X4zZI834xrsGaKtqcQPVrw
	 T9lIwmWidkeXUMqNxr4w/MRfSvoh+NlH4V/QdK9PptX+DVo6j76rNGScC6elaBn7s85bQ
	 SnoPmtI+wr8wDlDM5nQ00z3ioQDgDikSiKaVrl3EEQSk122OqQcRiAfIcI2a5Uki+jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794040368;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=RWyW4hq+lMBprz1xzIIZPbcfvi7PBGN3wx1iq7Ue0n4=;
	b=qok8OVk2tFvmf5iSivsf1b+Kj//X7O1bWoOgudWa03K4Pyh3uXoPxivIzTrGvaQZv82A
	 vbCseqiQCbO0fBNq2a5PYFwmQZlUub9gXTqnYI9i7TXJEskw3Q2Ph4IpkUs08xGrdsxFK
	 XvB+zqb0PKmWFn92f0lkmuDWnGjlVmk58tedjWEnZevZixN7knUE9l8mgWDjsfWTiWSIe
	 uye2u4lmFSt1JESQNB49HPTpJhUP8CfIwbNQL2+3Lze/CPDGhHdYIWr+DrsM6/LO9hP4O
	 z6SrGCLp2KRv+HA32XWyYQztFMLcMZLEbdcpxJIMxP74wAEmZywZmRjMgyXQT30JzPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aqYywTcq;
	arc=none smtp.remote-ip=95.215.58.99
Received: from mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C3606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85C3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aqYywTcq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E2UbgK+sPXXzPeqlhJBqYe006JI/BKOsIY3hNoZrk6s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794040364; v=1; x=1794645164;
 b=aqYywTcqGlwCiT9mq1d+X+723V8YQp6W15Lq7ZXj94eL5ctlE1F2kGzSL/+/Zso5i2vDAVih
 69Yyd0H6bOdfrWFfc8g0Uduy6A3vA4Ppw5yv6Xzzu8yj1wcvJUDRwTU90CxE4svm7PBM0HH9XIr
 kosGiS0mNw0eLI9+qh8LnCZ0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6647e240e5dc9034;
	Sat, 07 Nov 2026 08:32:44 +0000
X-Mizu-Trace-ID: 6647e240e5dc9034
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
Date: Sat, 07 Nov 2026 08:32:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <ab3dcde64bb90809ae10627803315d7385d6708e@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v9 0/4] wifi: rtw88: sdio: Fix unhandled RX
 request interrupt storm
To: "Alastair D'Silva" <alastair@d-silva.org>,
 linux-wireless@vger.kernel.org, "Ping-Ke Shih" <pkshih@realtek.com>,
 "Kalle Valo" <kvalo@kernel.org>
Cc: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Ulf Hansson" <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org, "Alastair D'Silva" <alastair@d-silva.org>
In-Reply-To: <20261107035321.1210303-1-alastair@d-silva.org>
References: <20261107035321.1210303-1-alastair@d-silva.org>

November 7, 2026 at 4:53 AM, "Alastair D'Silva" <alastair@d-silva.org> wr=
ote:

>=20
>=20On 3081-based SDIO chips (observed on RTL8821CS; RTL8822BS and RTL882=
2CS
> are inferred to be affected as they share the 3081 architecture), clear=
ing
> REG_SDIO_HISR_RX_REQUEST requires both a software W1C acknowledge and a=
n
> empty RX FIFO. Masking this bit out before writing back to HISR prevent=
s
> the software acknowledge from happening, leaving the bit asserted even
> after the FIFO is drained and trapping the CPU core in an infinite
> interrupt storm that locks up the system upon receiving network traffic=
.
>=20
>=20This series fixes the interrupt storm on 3081 chips and addresses
> related SDIO lifecycle, locking, and error handling issues:
>=20
>=20- Patch 1 returns error codes from rtw_sdio_rxfifo_recv() on allocati=
on,
>  oversized packet, or read failures so the caller stops immediately
>  instead of burning through the loop budget.
> - Patch 2 tracks operational state via rtwsdio->running protected by an
>  irq_lock mutex (using a mutex as SDIO bus operations sleep), serialize=
s
>  start/stop state transitions under sdio_claim_host() and irq_lock,
>  cancels the TX worker synchronously on stop, drains rtwsdio->tx_queue[=
]
>  with locked skb_dequeue() and ieee80211_free_txskb() in rtw_sdio_stop(=
)
>  and again in rtw_sdio_start(), and resets rtwsdio->tx_queue_stopped[]
>  while waking stopped AC queues under tx_queue[].lock in rtw_sdio_start=
().
> - Patch 3 fixes the interrupt storm by splitting
>  rtw_sdio_handle_interrupt() into 8051 and 3081 paths. On 3081,
>  interrupts are masked via HIMR, acknowledged via W1C writeback,
>  serviced, and re-enabled under irq_lock if still running.
> - Patch 4 refactors rtw_sdio_rx_isr() into separate 8051 and 3081 varia=
nts
>  to clarify the differences in register width and HISR handling without
>  any logic changes.
>=20

Thanks=20for addressing those comments, v9 looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
