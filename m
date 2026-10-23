Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715662;
	b=xuGyBasGYqduPi07xNhi0psofMFZx7NBW9TRi71W05iCLqYxw5+DmPCcNc+4YfxIg74O
	 hc+NMHyQ1hPsYQWFSaSkjxj5x3mnpe20rZXWlkgkwEK1Uf3PpOveaT3m2iHItSX+pqs3X
	 WatgncAGCyyDiltWZqwiD7jpDyBO0jOtGqdBQCBstdZUtMaby9KpftDp1JA1qpeV7UZ3F
	 zkLAL+S21mD+dedi1aXqUdrANIsT+fZwIxApK7u0+5vlLy5I1ZcUm5TDdYwoSTDKHg5cc
	 VKv3MRc8/oMD0/hLbiMWx4/QJsc5c9rq+XTmwA89FHNNXAAka2QlcEyh1nP620lbq9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=JoSzbfRbme0ma9n4Sk0lIBNgKFoXKAG6kb3Fy3Idgm4=;
	b=KE7tizkUr7v0yxcxkFzsNjRcHaHx9av8Sc6ks4JCfFvCG3dvWEnXFA2mQU+E0VMvBTXr
	 eiva8EiKy2Ln/znxwJ1yzh6hpUyzOpFbFVfuUT9ZPcqSR0e4fkVe/fSH4YieOhIRRhEIW
	 bQDDHIykefUl5OZAv68mtDstUiiuqGzd4aJfzzXFAFOdZPmrFhggUYurzsXN3l3VM9nsj
	 OaCdge87Po0ef5bo90JZphCfFy77Ubl3xWeZZ2rjg6LU18GBqLxUaHuS9dH2yi8VoxOuS
	 2cnigmleZc6eCGtIo+0Fk9U6HCvKmEo7AAMJriq0DkV1cnJ/KcYkU5pIEJzesHxHmyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="T/5qvDt6";
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD3606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AAD3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T/5qvDt6
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-483c607ccb4so217819fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715661; x=1793320461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JoSzbfRbme0ma9n4Sk0lIBNgKFoXKAG6kb3Fy3Idgm4=;
        b=T/5qvDt6pDSVt6Fw5hjE+YVTU+2eD+50WodIi9kkJyKG9csxvfkxznsArCQCLjF25p
         +8KnkakPySzDH5OkbDWMT8FCtCYC+ISiB+aysA+T3vDtcljPra6E/Km/GYxaFFKrfyiE
         nQ0ChEubuaYDGcPocBaPqt2JzFko4+znUIQDCPKZT6sXx6CTJ6E2xwpe4XtGeAqNLARn
         0c7EzBvNERZlnvML0SXYBU/2Y4IW1ToAiUrj+jjDXDyU0dMQLhR7nZgMjGdgOCqAmBT3
         a08xEHbmvN84nhwN7Xno6aIjNL8q258vyHgVQ3mjnRI5uk+vl5rRFSod7qWbr1uuCICL
         4DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715661; x=1793320461;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JoSzbfRbme0ma9n4Sk0lIBNgKFoXKAG6kb3Fy3Idgm4=;
        b=KmnB4sbBO2FDkMXuKV+XTWrlfUioxbTAlWBRQWpe1AiysK1v8n2vcKndzhH9ZIBE1S
         a5I+r8tQu3n3lHrVlD+JQq33HzA3XotUqBIT8eBhiXJEIYhUe4RNjTYNo/mGPFni+fXk
         tt8I3OQCzztSB0a0hOhsNCzDbvjp9qga3vVS3pkmBUXmdb9Ku1sDGwtowZRQI4lVSoMi
         iXlGrnRvSthV+8w5gLXtOK3javWwhp0iZb6v2S+HeQDdY/OdjQtCTh5yA9O5wdLidXrU
         qX4qcVSdS945hWdqhvkW3onHewTMLSf5K5BV6XgLsxQjYsEuINtnb9hcw9cQmZ5bqg4R
         6qaA==
X-Gm-Message-State: AFq9FYJp/YOg/K/E9obtzaKTw0VX+PwG2UyUUWML9EsuI+QOOKf0jJUJ
	58ytllFasQtBO0xmN0WBcId5pNu6wRTTXrmGQ2OUrfeIlHRpyHVUhfaH
X-Gm-Gg: AYBFou1a53AdejKy7CfkNKVWXT9XJRd4sOgy2ggbpcMh1Lgk96LCgeTAzUlHKF5sg7L
	zB85fHx3wCoIFoS5n5SmSCGAZ3C/7+9tOaM5UEb8Z8k6gHAwkIu2azjBH0horsc8qLioVOaq/b5
	DmyOVJ7AwxH4UEUsqcQeqS4V1W9bd6n2fJ7ItYAhP47ctj2QZPUHmMdkpBz6SsrUS37yLtb/rkj
	EXJD5xyR4G+nAbI5K/qbxqR7vrXOaz0Qsw7AocYuprkYdMtj06SIZhLXhq3oMhKOj4NwcVpk1A1
	0kmOHKuQTDqbl0ReCw8zFQeklvvV89Ww804m6sAc8TL+TnXzRoKgZ2eVVlyx0C77fyF+L49wsby
	61ksbqqHhJ/5udEHRaKr96OZLR5f0vFa2uEE0Uta5iXoC+I6+1HQRnM4IV/WQ+dr6efvws3Rxnd
	VVAMC7nsVwU96XcB6xwwhp0IDwNw1rcTP6aKuvcSAFQGQqB6I7svz3Jen5v+3WywVv1HWJzp8Hb
	awCkzCquDkNSO8ZGOdNY88cNDxyQYIMQ8Xn9A5svE/OudukZ/60hDo0/qyorpDztgSF46S9gjSi
	F6SOApTE/qa7IoLsZfzD1pPQKGLKqeHYmDfDBhhqMA2/Lz7XF9Ag64gs1bZmPU//jKdExG+/DdO
	8+o5aVswXCFvcvhhj61AH2L9NAaSk2WR98jGNsE2gcnXDp8c/nC/0Vm3hSMW0A9csVDYIgE5B/T
	q55Q==
X-Received: by 2002:a05:6870:248b:b0:49d:c3f6:4191 with SMTP id 586e51a60fabf-4a822392c98mr271107fac.18.1792715660868;
        Thu, 22 Oct 2026 17:34:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a820a9bcf6sm459716fac.12.2026.10.22.17.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:34:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/4] serial: 8250: serialize DMA cancellation with
 buffer reuse
Date: Thu, 22 Oct 2026 18:34:01 -0600
Message-Id: <20261022-submit-serial-8250-dma-cancel-v1-v2-0-088ea51e3891@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/41SyY7bMAz9lcDnuhWpjcqp/1HMgZLIiYssU9sTt
 Bjk30snvaRAgQK+POMtfKQ+hkXmSZZhv/sYZrlOy3Q5G8BPu6Ed+Pwq49QND+gwgUMYl/d6mtZ
 xk/FxJIxu7CceG5+bHMcrjBUdKQWh0mAwm7dZdPp5j/j28sDm8V3auvlujMqLjHU2h8P2ywiz/
 PjyrwT8Y2qcdxt3fTg/TNrlZMPtdwAUlLJgLk6ItVTxAEmTo45CqYZcsOd+t+K1HazlfueTC1W
 ZPUNDCKXkLqBgQqwEHGIA1sj1WZVL76541eqjYAximd0QEWU1PtQUtIT8rCLH0SXoFJqLkVNoO
 dmKSaVKh1xaolxL0b+yeq3BhmQFpQSFsGniUHOM3Zem0mIgRP+sCo7IkoAxV+vG1gSdtxSwltZ
 XEUrOiYbtPIdpWS/zr/uDuMJ9tf9/e/vcKCq2r6Lonf/6euLp+NnuMrzcbrffhYxlOG8CAAA=
X-Change-ID: 20261021-submit-serial-8250-dma-cancel-v1-b208f84e89c1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Reserve canceled transmit and receive storage until DMA and its completion
callbacks have retired. This revision uses serial-core write backpressure
to protect a flushed TX FIFO, following the discussion of the private TX
buffer in v1.

The series first separates OMAP's locked completion processing, then adds
the serial-core reservation helpers and applies them to 8250 TX. Flushing
still empties the logical queue immediately. While the old transfer owns
its storage, write_room() reports zero and writers wait for retirement.
Normal TX continues to DMA directly from the FIFO. Failed termination
retains the reservation until normal completion, without advancing the
reset FIFO.

RX delivers paused data before the PIO fallback and retires callbacks in
process context. Normal retirement leaves further receive handling to the
UART interrupt. Failed pause, status or termination instead masks receive
interrupts until DMA has stopped, then keeps RX on PIO until reopen.
Shutdown excludes new retirement work before releasing the channels.

Based on tty-next with the posted shutdown guard [0], channel
configuration error handling [1], RX TTY accounting fix [2], RZ/N1
transfer-length fix [3], and transmit-PM shutdown fix [4].

[0] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-shutdown-v1-v1-1-3d3ce383c614@gmail.com
[1] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-config-errors-v1-v1-1-c067587d1ef2@gmail.com
[2] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-rx-accounting-v1-v1-1-c11795914ab4@gmail.com
[3] https://lore.kernel.org/r/20261022-submit-serial-8250-dma-tx-length-v1-v1-1-18cecc89a099@gmail.com
[4] https://lore.kernel.org/r/20261022-submit-serial-8250-tx-pm-shutdown-v1-v1-1-0e894afa3bb8@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Add serial-core helpers to reserve flushed transmit storage until DMA
  retirement. Apply write backpressure during that interval and keep normal
  TX using the FIFO directly, replacing the private transmit buffer in v1.
- Document the flush callback's reservation, writer backpressure and
  retirement requirements, including release before shutdown returns.
- Split the OMAP completion refactor into a preparatory patch and move
  the RZ/N1 preparation-order and shutdown PM fixes to independent
  submissions, keeping four patches in this series.
- Take runtime PM references around worker UART accesses, and leave normal
  RX retirement to release ownership without reading LSR or restarting DMA.
- Synchronize the queued TX ranges before preparing the descriptor and
  return the mapping to CPU ownership before releasing the reservation.
- Keep the TX transfer length separate from FIFO cancellation, so a failed
  termination can account completion without advancing the reset FIFO.
- Exclude late RX flush work during shutdown, including Intel MID DMA
  timeout interrupts which are independent of UART_IER.
- Accept DMA_IN_PROGRESS after successful pause, and recover from failed
  pause, termination or DMA_ERROR before handing the receiver to PIO.
- Preserve stop_rx() and shutdown across recovery, and retain the
  DesignWare empty-FIFO timeout workaround when receiving through PIO.
- Apply the requested guard spacing and container_of() formatting.
- Link to v1: https://patch.msgid.link/20261021-submit-serial-8250-dma-cancel-v1-v1-0-efe2b89f2303@gmail.com

---
James Hilliard (4):
      serial: 8250_omap: separate locked TX DMA completion processing
      serial: core: allow drivers to reserve flushed transmit storage
      serial: 8250: drain canceled TX DMA before reusing its buffer
      serial: 8250: retire canceled RX DMA before reusing the receive buffer

 drivers/tty/serial/8250/8250.h      |  27 +++-
 drivers/tty/serial/8250/8250_dma.c  | 272 ++++++++++++++++++++++++++++--------
 drivers/tty/serial/8250/8250_dw.c   |  15 +-
 drivers/tty/serial/8250/8250_mid.c  |   6 +-
 drivers/tty/serial/8250/8250_omap.c |  37 +++--
 drivers/tty/serial/8250/8250_port.c |   5 +-
 drivers/tty/serial/serial_core.c    |  47 ++++++-
 include/linux/serial_core.h         |  16 ++-
 8 files changed, 335 insertions(+), 90 deletions(-)
---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261021-submit-serial-8250-dma-cancel-v1-b208f84e89c1
prerequisite-patch-id: 3604bfaa3a1c214997de1f11162b81a4541af5ab
prerequisite-patch-id: 79dd093ffb35e254e790dffb8887faf51b64f947
prerequisite-patch-id: 80a5061d84c055a64c760268febed179c687b99f
prerequisite-patch-id: 7dbb404baf1f861982cf6a4b755d39cfec548223
prerequisite-patch-id: 40881d81a27b3a1aa45203d171214faaf2197768

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

