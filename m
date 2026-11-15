Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733612;
	b=Q3T0VF2jmG+S8b2R9uvNma+ADGSCpLg1g4rlbgdXbd5lRiY5lpIxQgMVMvn+K/wsv0X/
	 D9DCeYYVlFmlOhYAe1WlFQpZ7LTEcd60YCB2hNLUtFKXiXS8i9xxw9AHexlxvZfsdWt4B
	 Y1kKbLg4Bw2yLnIu0tvb5wk1SCzoBiPxT/baHXHXb3oN1L6KjC3vOu+FcTQDRQJ+292Bb
	 lE7skZ4iCkkEpB4UYn6lPe7bnapxNgK7C+u66kKaTYHnoz6sGjQtVL+2TWgleFF370O+q
	 Zwm+ESTzGTGBAJwVjYWTlIMahXWUoiQ2zEdfw1l8EYOoOkRFit+HwTIn5FF1YcoCAZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
	b=DmG96eeVAQV+lhNFn9aFNekMYPOVfVAtL2IkxhaZd3tATA+X4JOz3yBWU+JVDP6Fbj5T
	 EgqxWlZteTMx5oQTAt2WctDJAsyt1ZhUjcZOMe8ZiuxBHb/a9qaOz6ehOjWSpPJ7wNPqk
	 s+QmdB2a9laaQcaofGPoDNHjBWDTqcuSpNKEGFLj6nY8oXmAVWdFgbKsImbRNfe587gMo
	 nKS0/3gHTweLCU2M3HDtJojcutt5VbEnTiUZQ0HgDQtG8VO917C2dMGLghpHJ+UZnivR3
	 oHs3y7tuXU0ULJgNrTLZd2ASg6NJXPivbhuYlVz5ECAXzBwFy5OGpKuIw4NiJkIFaew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deXdu4vE;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37CF606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A37CF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deXdu4vE
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843cf077f10so4494914a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733610; x=1795338410; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
        b=deXdu4vE2gFpVY9tLWfLiHyE9S1H8z+CgAhCp/wol9OPeJkKn8+i9P4jU38oHZdFwT
         ysFDChqKrOkNDUpKOwf5TM6fMwLj0e0WpIFFg0uwxEqvRh/gaZRl3Cxrmi1vGC+MINvE
         4z7HM76seU/xEClTBdehoj3B1h4HU9WqQcWiqNhe+ennCSOQTnQjyy9nVrKTIISvTAPx
         OvWfQ9+2ZGdhgsEJvK9YUD7RfQJFb2cs1lcQdQGfLZyEgGq+c0/r3O4V7LZUwSMWy7pb
         oJL6MQXYsjFvvL8N/1nK8tojwTWBfQSUGEBOOtvWziqB8/aRa1HEqpp3nM6tDJa6Yyk/
         l84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733610; x=1795338410;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
        b=d3SDcuYGskAT4vYQWS6A/cnaIQvb+eQvwq5BxPlFXGedFtwdm94bMY/5FsntVl/TVF
         hFMDJ+qdKgV03wtbNf5H8VwgIk5MmtHm5pKxRrUqlySUuzhrUV0Pa58blYDf31wTuzaW
         j9smlVsE1pMEt+XD3AbG5sPrrqER9CiRZM+shkpXnZeOyW4962FxBs/9NCcsCRDE5K54
         GOaDWFw8gIhU9yGVUDKRQ6D+CZPG8TtB3+/TQ0vYEf4uyNDgzQvhab32tVMxVi4M7+Ml
         CI8Y8pFPqCigEwTrBtVboG7oSJS26qz6l8DV6FdUtALjljzB9uinoTe8yvirQ1z61Agr
         OUow==
X-Forwarded-Encrypted: i=1; AL+hErGhhuKbNG6ySPABu8CVmJEgnF+xmMlYhcaE0Sx3Dgvp/HnUt15NwwebE95I2uWnolZlBD0wtPjI4u1MHTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r35zWxk/qrRcF+S/U6ZMo3wl57Yp9cr+IpQec87iqw8WmeD/y
	fWlE0RL7rX1BUrRseRoQWyTY5zf4s3u8FrOFYuptfg5IXoAM7gDoM80Z
X-Gm-Gg: AYBFou32qL6SWSCDEEO1BViXBeKhO4f1eCtlCQ/AIuu//7ih2uF+TUs//IWPYUhDQOL
	5qIffSYdmoTqL1M2vCKK5e4PIEByYx8LLE+vrz7fKcDVlalXg3jP/uTeMBdj0jgDkIMVmIhCkDU
	UC8M/wWLVVO7v2AyZrjEHr2U/H0rnRUNIi/OHNR7CgCuwIe7U42ChnuY63CkaygtkFe2mj+TT51
	rJZ5hhYzaQEqQrW3iuNHel9T8672MMyiGKpYjRai1CvkJ+eGiLYq7ISbhJTLHC8cmQh5vtkzajx
	7Lz85aALRnpucyVWFU4DAEwUfANlL1QnRNcIsJWBKxZ80WQCB9wVJyZUKXSPV/wlUlOOW8pIrX6
	dEB/GBMc2vcNwjuUZRjH0aDzz820L0qzIAXGkjPLpPEGF15viXJarR+8EzDv3GTxfd8EZQLIst9
	53r/MajbRkQR+fyKOvMW0pKzUnAeQWlqnehj1MX/30eLVYJZocnfrc06AwhCr6T3qZyL0v9DFk0
	zKD1EjRg7ZXt3BdME7dZCZmmaKeVEr0EDkfFfYkaU/g146Q0c+OQI8P5W4W4ZB9JcT4SvlqMVnn
	uZusCAPmZoy0XnUKXGqW2QB7a+15MWJFmbkM7CmhXDaIVOqNWJJWm8vnsE9j15Ck1g+VG24uHEE
	TWXLOA0bdY5tykpNETqolGbOslqMslVzKbtqHrSlrPsSESmz0kE7LOoy1suQ7JBfDXj7XU3RPci
	Deef7POC5ayyNWFQaaV4h4zgHKFUST09F19oj9FVQzWQKCy/3p8PeC
X-Received: by 2002:a05:6820:2d8a:b0:71a:e62f:62ee with SMTP id 006d021491bc7-71ae62f6ac9mr968000eaf.23.1794733610517;
        Sun, 15 Nov 2026 01:06:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Date: Sun, 15 Nov 2026 02:06:33 -0700
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dkxboEZX3sOwaMsURimYthIN4
 e4WPIHJJD8v+Xl/FhYxEEZ2KRYWcKZI05hBHgpmez12CNRmZpJLJQQvIb6Mp5RjrAhar8HqYTD
 aPmAgh4k8wizAKHGWXHFzUo5l1zOgo/e+c2t+nEV3tGmTb42eYprCZ39kFlvv3818Aipba67qU
 vDKXTuvaTjaybNmXdcv6o9WGuwAAAA=
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Retain descriptors through callback synchronization using a shared virt-dma
termination helper, then use it to fix sun4i cyclic callback lifetime
and IRQ serialization. The helper keeps termination usable in atomic
context while callbacks finish in process-context synchronization.

Also serialize pending IRQ handling with physical-channel reuse so an
old transfer's interrupt state cannot complete its replacement or disable
the replacement's interrupts.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Add a shared virt-dma descriptor-retirement helper before the sun4i
  fix, following Frank's review.
- Retain all collected descriptors until synchronization, avoiding
  provider-specific cyclic checks and preserving repeated termination.
- Retire pending IRQ state before physical-channel reuse and acknowledge
  events under the owning virtual channel's lock in a separate fix.
- Link to v1: https://patch.msgid.link/20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com

---
James Hilliard (3):
      dmaengine: virt-dma: share deferred descriptor retirement
      dmaengine: sun4i: retain cyclic descriptors until callbacks drain
      dmaengine: sun4i: retire interrupt state before channel reuse

 drivers/dma/sun4i-dma.c | 68 +++++++++++++++++++++++++++++--------------------
 drivers/dma/virt-dma.h  | 20 ++++++++++++++-
 2 files changed, 59 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

