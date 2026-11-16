Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855724;
	b=CXWlY73witSOfPrhSoQ7D2NUmlNSmwuELxQIbL8NgKw/eveiAcP9cZ0lVjydi8Ciq9Bi
	 mYnct6+thkS5SI/LV/N/Mhcqm4P5Gc/uNt/TIeAWRQvaQ2OFV6XrPrbpBiU04HWg6+yks
	 5p1rPAIy5BSu4hXOJklQrCXzVV9KhihEaZfY3XOXgPtTCP1tguZbY0EWAgrr8hRPM2vZO
	 TqMeSzwq2vjA1CNz91XjnU7CEpachn22BDJnKBVhYVCOl1Pnk2JtRCDItb01KJWfCXett
	 Z7zl71GF5FtY4+pnSmB71trbr/eC2ULl6yaXZOWvaenj153YDDx/uraPEfze1hg5Zlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855724;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mA8MjS12E7vGeBEWH08HXY2Cszb+0yVAhS75ec8ZzNw=;
	b=bsv2fbeOW3yOt46OdfzPLO21JYirK8MUCtU1ZYOiD37TPOakyuLtLWTjTs1N9TNyh8Vx
	 Eul17rgcyHNmDsvHcKa8YYB1uALTU8DxglXQC67142fuBAxQU6EuEcsfLB4V/ZMBSikqC
	 YvCTJqhHGXwmPCIJGL4KXshJTUdL5a4YK47BL0lRIPC1Y81Q7uCiNY6HEkMbwYrbf+1JS
	 /LsaBNLbUI4kbMxo8tP5MIrJHYYSdc+xQ6MUEOYCMuDS3pRsxGR8PPiCcWcXCXzl9EKXv
	 /IyBAtgkAddEHqkJpl76F0mayRjMZ5+vEMo01qm7JQ33ygOm1i+LyqhW/AgV/HCbH5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76004606A329;
	Mon, 16 Nov 2026 19:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76004606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jSy0713h2zFphN;
	Mon, 16 Nov 2026 20:01:58 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794855719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mA8MjS12E7vGeBEWH08HXY2Cszb+0yVAhS75ec8ZzNw=;
	b=wsUt4ryRbQF+Z4CEwj5KganwtLaBuTs/UVQpd0f+2rOZpYpdnC6PIFBcP3e3vnNk2vwBEO
	Iq0YvIoMzuEn7YDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794855719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mA8MjS12E7vGeBEWH08HXY2Cszb+0yVAhS75ec8ZzNw=;
	b=OF0CaKJ1hQJulLMr2vulXH9AnXTVTLD3yyPzVOwz1fyN/1z6oDhuD3JrvqX3GprcSDQury
	kcfekUAHk9r0I/1amzPHzSiADNnB21OxPls4k6cvLkNXOw8y7r4/jQM3KqwwSSOFGbT4No
	5i2hCYmeSdpdFAw4MIVypcsKk/KIBI0IZaezontaFRLHVavq0PV59LfP76B8VGt8xIHjPm
	dzoXe/fXFhmdAGJlzm9xG2x5iDoHglcqNUCam3N6dutSkKYvnKkq0l6ao0mnal2SV7sTg3
	123EexTau3bCIIap987lzZ2C+rExqQqG5lw4ghgD6ubPE/6yUnyKHv13PeWG4w==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id HOAzLCZT+2ri8ygAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Mon, 16 Nov 2026 20:01:58 +0100
Received: (nullmailer pid 2736560 invoked by uid 2002000001);
	Mon, 16 Nov 2026 19:01:58 -0000
From: =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
Subject: [PATCH rtw-next 0/5] wifi: rtw88: sdio: faster and fairer TX for the 88xx chips
Date: Mon, 16 Nov 2026 20:01:40 +0100
Message-ID: <20261116190145.2736364-1-david@hardeman.nu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The RTL8822CS on a NanoPi R76S (RK3576, SDR104 at 198 MHz) sends at less
than half the rate it receives at, and with traffic in both directions
it hardly sends at all. These patches are about the 88xx chips
(RTL8822BS, RTL8822CS, RTL8821CS); the 8051 chips keep their current
paths.

1. keep the free page and AC output queue counts, as the RTL8723BS path
   does, and read the registers only when a transfer doesn't fit;
2. send up to 32 frames / 20 KiB of one access category per transfer;
3. stop the mac80211 queues when the driver's FIFO is deep, so the
   backlog stays in mac80211 (fq_codel) instead of an unbounded FIFO;
4. let the TX work have the host between RX reads while frames are
   waiting; the RX path otherwise takes most of the bus;
5. read HISR with RX0_REQ_LEN, and the three free page registers, with
   one transfer each.

R76S as AP, VHT80 1x1 (client 2x2, AX210), 2 m line of sight, iperf3
TCP between the client and a wired host on the AP's switch, Mbit/s
(AP->client 30 s / client->AP 30 s / both directions at once 120 s),
mean of 3 interleaved rounds:

                    down   up    bidir
  rtw-next          64     132   28 + 76
  + 1-4             184    210   77 + 89
  + 1-5             198    212   84 + 86
  Realtek driver    ~183   ~265  ~40 + 180 (FriendlyWrt, same board)

In the bidir runs, the share of 5 s intervals with the download below
40 Mbit/s went from 11-24 of 24 with rtw-next to 1-5 of 24 with the
series.

The individual steps were measured in another set of runs, with the
sender behind a path that reorders some TCP segments (which costs a
little download throughput but doesn't change the ranking); RTT is
ping AP->client during the download, median / 90th percentile:

                    down   up    bidir       RTT under load
  rtw-next          89     164   23 + 119    34 / 91 ms
  + 1-2             189    220   37 + 167    22 / 51 ms
  + 1-3             181    214   30 + 176    10 / 29 ms
  + 1-4             194    198   79 + 91     11 / 25 ms
  + 1-5             190    202   73 + 100    13 / 47 ms

Patch 2 is the big step for one-way traffic, patch 3 halves the
latency under load, and patch 4 is what makes both directions work at
the same time (it costs some upload when that runs alone). Patch 5 is
mainly about bus transfers; in a longer A/B (10 interleaved rounds,
channel 149) it gave about 10 % more download than 1-4 (190 vs 171
Mbit/s), with up and bidir unchanged.

A soak with the full series, 30 120 s bidir transfers in a row,
averaged 95 + 88 Mbit/s, the slowest download being 80 Mbit/s (10 of
the 720 5 s intervals had the download below 40 Mbit/s). There were no
kernel messages and the bus stayed at SDR104.

Known issue, not addressed here: when the client goes off-channel (for
example for a background scan), the chip sometimes gives up on an MPDU
of an A-MPDU session without sending a BAR, and keeps sending up to 64
frames past it. rtw88 reports every SDIO data frame as acked, so
mac80211 doesn't know either and can't send a BAR. The client's
reorder window then stalls until it is pushed past the hole, which
costs a short throughput dip. With iwlwifi clients it turned into
bursts of up to 63 lost frames per hole because of a reorder buffer
bug there, for which I have sent fixes:
https://lore.kernel.org/linux-wireless/20261116155609.535595-1-david@hardeman.nu/
I tried the hardware BAR settings (REG_BAR_MODE_CTRL thresholds, the
BAR retry bits in the TX descriptor), a longer retry limit, MACID sleep
for dozing clients, per-frame TX reports and a BAR sent by the driver
after the client wakes up; none of them helped, and per-frame reports
only came back for about one frame per A-MPDU. Ping-Ke, is there a way
for the firmware to report which MPDU it dropped, or to send the BAR
itself?

Tested on the RTL8822CS only. The RTL8822BS and RTL8821CS share the
register layout and code paths; testing on them would be welcome.

Two series on the list touch the same code, and I'd like to make sure
this one doesn't clash with them:

- Alastair D'Silva's "wifi: rtw88: sdio: Fix unhandled RX request
  interrupt storm" (v10) changes the RX interrupt handling that patches
  4 and 5 touch. This series is based on rtw-next without it; I have a
  version rebased on top of it and will send that once it's applied.
  https://lore.kernel.org/linux-wireless/20261113082242.2773369-1-alastair@d-silva.org/

- Leonard Lausen's "wifi: rtw88: reduce RTL8822CS SDIO request
  overhead" (v2): his patch 1 (control frame filter) is independent of
  this series and applies on top of it. His patch 2 combines the free
  page register reads that patch 1 here replaces with cached counts,
  so only one of the two makes sense; Leonard, I'm happy to go with
  whatever you and Ping-Ke prefer.
  https://lore.kernel.org/linux-wireless/20261116100804.425592-2-leonard@lausen.nl/

The bus speed itself needs 67a97316a31a ("mmc: core: sdio: skip CMD11 if
signalling is already 1.8V") from mmc/next on this board; without it the
card runs at 50 MHz and the gains are smaller.

The patches were generated with the help of an LLM; I have reviewed
them (to the best of my ability), and tested them on actual hardware as
described above.

David Härdeman (5):
  wifi: rtw88: sdio: cache the free TX page counts of the 88xx chips
  wifi: rtw88: sdio: aggregate TX frames of the 88xx chips
  wifi: rtw88: sdio: limit the TX queue length of the 88xx chips
  wifi: rtw88: sdio: let TX in while receiving on the 88xx chips
  wifi: rtw88: sdio: read neighbouring registers of the 88xx chips at
    once

 drivers/net/wireless/realtek/rtw88/sdio.c | 574 +++++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/sdio.h |  13 +
 2 files changed, 526 insertions(+), 61 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.47.3

