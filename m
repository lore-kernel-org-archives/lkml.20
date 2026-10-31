Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408072;
	b=Uc0XOtIlCDRKUUP3SNZewdzO2BNcJ0dH9M/v+UEm9KqyFlzFdoRPrqzckJ1aiBkxW1lZ
	 fmeIMxL1SeiELWFuR68j2iU8TNGw9JkmDF/imVGkTnIZ2PwcYgoVq8LL+GidofQ5wcwWf
	 AL4ekfk2g4ctIyZaSO7hfcQYBYu5hP7dKSFWSkaBg8K94EtlZsJ45N49DfpmOKGW5i2sF
	 B/qj7dyz2PJAPgV0VTVggq/UNt+oX4Kpa6u4nXit6gYC2dU3ytcVPErCzrCbqopkg9ZeZ
	 HtTrXLpZ0F3sBCMOBJzzz6mDyZhw+1aeh9c3LS4bm4QPCtXQBLjRqw2YnNu9WqOn3OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=;
	b=KYoU4rGhZQvxD12Vvk+kZT2pPXtg9qaY3Are3qJRRQBiQ5uOE8l1QH44rsg9wOjayuC2
	 dAwIficuDV01dNUKohzbFUhTGLNEpfZRqTd/D3FUvzfENhlEAp8+KKgWt1Eaor1B+Id5I
	 EF9c61w3V5Go1I50vx4hQpCrE3/hS50I70QdNbdpoVv5LEWip7teSD//AkDqUXVj9mq3G
	 FERiuDZ3DJoHTOqZ9GQSEozmLg4dvgkz4bvSLMtWcguvX/C4wzVxdsmoqeosUySUuffCU
	 T/diq3yX4yKtIAjtQoBP8aWEZb5tL82Teb2cYCmURWTQuiZQHvjqB2a4aVhrwmjp/vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMNVXwaf;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55739606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55739606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMNVXwaf
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so915680c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793408071; x=1794012871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=;
        b=ZMNVXwafSq3/WmvLWrhJHx/oEuwJ5Ei0TXKkcQzXtHWSKGpGwOPHZH2PXvE6JoARkG
         Pjf5Yx3/iHtrkDFmUngbCE2TqpUQZqpRv04OKPPXCAuiLiT2NFuRGQi+7gU/rQPK38Ze
         6klx7nPmnAuy5U5NkJsKn3GHZ2N1TnWOTEB/hYrSCUMb0SHnJPilgTSaPiCPoUVJx3+a
         MTAHScFZN8EHXHEAzZozD68lcGGcfemEW7jtrY5ghc6h40ijSGrGK54UGCBLHjI5WC+6
         f1R5KCIg0ogAbzljQg2mrutnbvNrATOXTfyrENtRwFSndO620prdvBnbZSy58kf3OKpF
         i6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408071; x=1794012871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=;
        b=k0+8SxNtSzjGSIEFsTqZWfPM+RbF9Sehx6jH1exH45+vImqlVN1JsWTWfqbG3+HDH9
         5UWk1z0dvdjqf2U+AvMG5FOIJ/4l5ZxjnCH8KbBG9u+bS9dX6g6uKlGhrIwQXkyWqO4Z
         hBWBXzFNuU/b5P1OC/SR5Od/4jQb9EremaQC57I6y02Y3yEHcOU9PVXum47PzUY/4HwM
         WS0BEODsTBj6l0e17jKxwvWRYed8Axe+NyKQPySxChpmdy3JTAyEZnFJD99zv+pRiWVX
         xOOhcmr8Wz1asdaXBgRLEYmREh3sL7Z2MNVPQr6dfpSzAKyqZPnnZ6j566djEQR4kxRJ
         Xt0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwsuoIVfApIBIO6DKNPtOFzn8Oni7veEuAAYxnhQi92jMwLTkCdq8lvwVtYmXSCzO5GdH1IghWtDPa32Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLZHSBkpZrud63QoUa4g/rFJxOsr8nc7Qi2SopZocIqBdU+lS+
	5AoBss9lQJv/aqPL/FT0RUVLzxr4m9gOJw2XONlqMjtM8Nshsz3Y0IjT
X-Gm-Gg: AYBFou2DpEDSF8ffJxaqqKanBf/k6DGIMtlUoW7Z6joCt7j0yyUn0khugqqBz8KACLm
	74gxtlowOFzZFI9MRPFabivBsLvlnPYG/bAEDV2pFqq6zQB+DXtBTHJeA11X5R1HLhVVVUafcrI
	fP4wDDp4zp22pwUBipww8I3rUyF9FWeCnTX6NEfM7TweeJ/7JfPHhuUqEHzI4v/wTdDWClm2Wb+
	zxUureLOcATmYk17mohGHTyNBvUeOEfKV3TtSxu01bbwm2uEHV/ZQoB28nHrAtTQuV8Kl0wCjqI
	ynIs1z8+NXAKMSRUy/Qo875LXWEoGv2UU+9bhcDk2OoWFpOzDJXZAi31NSLEHPyT7tD9tGvmJVf
	TkEyEXzveWg+ajURWldbnCnOHpd16mC3wUEpdi0Wq/nTwoz0kU/7NkljlQwwjVVwV63RiLobYV2
	GPKq3QXHCoafk6iVZ02uzJtgDAho1y+vwiG9swUBx8sE+A/DST7SuQsTRx1PNtWLL4y1JxYVHQd
	7YnbtoLH2KLKwjv6a1ht8o2Hh9gRedWmndBMb+dDPCM/hUI8LnuJkuZbBCxQMmPTYRpqIRnJr25
	u91/ZEB7nnnoe0w30s8jtln6Gvm3KTFigAIQRNQY+LHhyJ3hu/x1hUwOxdD5x5UpAoWzuw9eCPl
	bCf7hNMQpij2kwbuFMvEdZeJ6fm9fB81r9PRH6mU6GFe7l5+rl3Wo7lBPZC/pztQGoVOJvzlYjp
	D0YNpeqjdn7ZFMAky/Nh4PZeElKRfTDQKJebw=
X-Received: by 2002:a05:701b:4187:10b0:16c:ff3a:d72e with SMTP id a92af1059eb24-1ac5e322fb7mr5663288c88.20.1793408071289;
        Fri, 30 Oct 2026 17:54:31 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm1419862c88.12.2026.10.30.17.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:54:30 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] serial: amba-pl011, imx, fsl_lpuart: ->flush_buffer() unmaps the TX DMA buffer before the transfer has stopped
Date: Sat, 31 Oct 2026 00:54:25 +0000
Message-Id: <20261031005425.3351240-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I found three serial drivers that unmap their TX DMA buffers in
->flush_buffer() without first ensuring that the outstanding DMA
transfer has stopped. Line numbers refer to mainline at 83f32c773255.

uart_flush_buffer() invokes ->flush_buffer() under the port lock.
The path is reachable through TCFLSH(TCOFLUSH), hangup, and close, so a
userspace process with access to the port can trigger it while TX DMA
is active.

Because the port lock is held, the flush hook cannot use
dmaengine_terminate_sync(). However, dmaengine_terminate_async() only
requests termination; it does not guarantee that DMA has stopped or
that its completion callback has finished. The DMAengine API requires
synchronization before memory still accessible to the descriptor is
released (include/linux/dmaengine.h and
Documentation/driver-api/dmaengine/client.rst).

I found the following cases:

1. amba-pl011

pl011_dma_flush_buffer() (lines 858-877) calls
dmaengine_terminate_async() and immediately unmaps dmatx.buf.

The unmap can therefore occur before the DMA transfer and its callback
have finished.

2. imx

imx_uart_flush_buffer() (lines 1716-1739) calls the deprecated
dmaengine_terminate_all() and, when dma_is_txing is set, immediately
unmaps tx_sgl at line 1729.

The imx-sdma termination path disables the channel but defers descriptor
cleanup to a worker that sleeps for 1-2 ms because the SDMA core may
still be running. Consequently, termination does not establish that
the controller has stopped accessing the mapping when the unmap occurs.

There is also a separate callback race. imx_uart_dma_tx_callback()
unconditionally unmaps tx_sgl at line 595. If the callback is already
running when the flush begins, for example while waiting to acquire
the port lock, it can subsequently unmap the same scatterlist again
and may attempt to start another transfer.

3. fsl_lpuart

lpuart_flush_buffer() (lines 601-614) unmaps tx_sgl at line 609
before calling dmaengine_terminate_async() at line 613.

In this case, the mapping is released before termination has even
been requested, while eDMA may still be reading the buffer.

Potential consequences

These paths can release a DMA mapping while the previous transfer
may still retain read access to its backing storage.

Without an IOMMU or SWIOTLB, a late read can race with subsequent
modification or reuse of the buffer. With an IOMMU, an unmapped IOVA
may subsequently be reassigned. With SWIOTLB bouncing, a released
bounce slot may be reused by another mapping. If the old transfer
continues reading after such reuse, data belonging to a different
operation could be transmitted over the serial interface.

LS1028A is one configuration worth examining for the SWIOTLB case:
fsl-edma uses a 32-bit DMA mask without FSL_EDMA_DRV_TCD64, while
supported systems may have RAM above 4 GiB. Whether the affected TX
buffers actually use bouncing, and whether a late read occurs after
slot reuse, still needs to be established.

A related issue in qcom-geni was fixed by e3c04834ae1a
("serial: qcom-geni: fix TX DMA buffer flush"), associated with
CVE-2026-74655.

Possible fix

Since ->flush_buffer() runs under the port lock and cannot sleep,
one approach would be to:

- request asynchronous termination and mark the current TX operation
  as flushing, without immediately unmapping its buffer;
- defer synchronization and mapping teardown to a sleepable context;
- ensure that a completion callback for the flushed operation cannot
  unmap the buffer again, advance stale TX state, or restart DMA; and
- ensure that shutdown, and suspend where applicable, drain the deferred
  cleanup before releasing the associated resources.

The callback and worker would need to coordinate ownership of the
mapping, and any work draining would need to occur outside locks
required by the callback.

I have compile-tested candidate patches for amba-pl011 and
fsl_lpuart using this general approach. I can send them for review,
or adapt them if the maintainers prefer a different synchronization
strategy.

These cases were identified using a research static analyzer for DMA
lifecycle ordering and subsequently reviewed against the driver
source. They are source-level lifetime concerns, not demonstrated
hardware exploits.

Regards,
Samarth Narang
