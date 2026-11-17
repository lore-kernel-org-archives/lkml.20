Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900119;
	b=xeLdp9YWZK97tIge+2iWbN4EUv+ZX8z5jb9Vdvz4+16VnLF3HHZ9YOQY3AXhBdoju5pB
	 NjMJeCAEjmfr3TJHpo8UKGaY2zb3gfCWThlrKZf/Zg0kIPIeB++XqwUGCV0e0YiZvwSPW
	 HnU60/crM/cYFo27i3ZtvOqKU++khp2NLhKZtHFlrINSt6xa9O6W09NMwBceEYScWsMgq
	 256wB5Cn0UasLYYzoGtWw5+hR+xq/IWGIy9tUxRtLFVUnUlVJYJ4WCcU/yuLL+QbbnH6W
	 nk1SkaB51y2J4cjS4M+mmQ2r4jjnG3/r74x3oI4XNoimU3V9fY7S3A97Z/fexuC/FCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900119;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oxM0dfNHWhh0JA5nDAwcg0YM5ZxKXWKNv+wLwQN0H2o=;
	b=WEpEt5twkj11qDH+umvn1e7SkwIv1jJ+y6/cmb5rE4PQuRqUrE8+B5ZAEk0f9x7w6q3h
	 wHAa73hrUWSeofH+yqotVL2ixljVTMYyq36EMJdcuLXUUm/5K41FVW1gNakfsj3EQZcEU
	 zmFD/xjqpVEi2U1krNpAHhPqLMACkQkpckPhz+r/jZjGWvG8i/W+GHe8g5acAes83hAxE
	 dLk6oKQcUm7kN8R/PmQj1dLpKU8j9cGathB1p+8yJfPH4TqBn5VQ2AeIc9IXt3OsmEyCJ
	 /w0aLOTKHeR6g9YJABBIcs6SFh/xHvhNWBl3oN+tiO3BJUQ/A0Zzf420+4ahwghGZ9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YHZppQaL;
	arc=none smtp.remote-ip=95.215.58.137
Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA51606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YHZppQaL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=C5pBUkm+CKl8mzMt2Ynj+HJYaQvwfObB423yYROWZWM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794900116; v=1; x=1795504916;
 b=YHZppQaL+C5s0HBFTcD3hg4U5jW3M7Xi5UG9rjn5mU2aq4LFxuJ5I3mZ5YTLTvNCSY+qC9Zo
 s03iHD/k4nbwNWG48noZzJLq1fBFyvLZRVcRJeuIojU27BehYhoxHCmAQ/5j7gtldqe+42C86Bl
 yb02MZ5J5An4GcPDxpsLrpC0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a40618706497855e;
	Tue, 17 Nov 2026 07:21:56 +0000
X-Mizu-Trace-ID: a40618706497855e
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 08:21:50 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 Alastair D'Silva <alastair@d-silva.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_3/5=5D_wifi=3A_rtw88=3A_sdio=3A?=
 =?US-ASCII?Q?_limit_the_TX_queue_length_of_the_88xx_chips?=
In-Reply-To: <20261116190145.2736364-4-david@hardeman.nu>
References: <20261116190145.2736364-1-david@hardeman.nu> <20261116190145.2736364-4-david@hardeman.nu>
Message-ID: <B58755EF-D7EC-47C5-8DED-EB19A880CE26@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi David,

On November 16, 2026 8:01:43 PM GMT+01:00, "David Härdeman"
<david@hardeman.nu> wrote:

> +             if (ret == -EBUSY && !rtw_chip_wcpu_8051(rtwdev))
> +                     resched = true;

I think -ENOMEM needs a retry here too. mmc_io_rw_extended() allocates a
scatterlist when a transfer needs more than one segment. For example,
dw_mmc with IDMAC sets max_seg_size to 4096, so an aggregate larger than
that can fail this allocation and return -ENOMEM.

The aggregate is put back in the queue on error. If the retry loop keeps
failing while the queue is stopped, no further attempt is scheduled.
Fresh TX callbacks can kick the worker again, including for the same AC,
but if no more arrive, recovering memory alone leaves the queued frames
stalled. The single frame fallback can also return -ENOMEM from
__skb_pad().

Could this handle -ENOMEM as the RTL8723BS retry helper already does?

[ ... ]

> +     if (resched)
> +             queue_delayed_work(rtwsdio->txwq, &work_data->work,
> +                                RTW_SDIO_TX_RETRY_DELAY);

So if I read it right, this also needs the work to be cancelled when the
SDIO interface stops. The power off path is:

        rtw_power_off()
                rtw_hci_stop()
                        rtw_sdio_stop()
                rtw_mac_power_off()

rtw_sdio_stop() only disables interrupts and invalidates the credits.
The cancellation is in rtw_sdio_deinit_tx(), which closing the interface
does not call. The flush callback does not drain the SDIO software queues
either, since the SDIO operations have no flush_queues callback.

A pending retry can therefore run after power off and keep rearming
while credits are unavailable. The RTL8723BS retry helper seems to have
the same lifetime gap already, so maybe the shared stop path is the right
place to fix this before extending the retries to the other chips?

Best regards,
Luka Gejak
