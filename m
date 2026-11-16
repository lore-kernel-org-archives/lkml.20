Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821067;
	b=uAFDyMpvHLM8pi6tl9b0DEInedg8W20AW9EGgUv1o6mCGeR2OffN2IgyM9X5SiVKZ69l
	 GpL75Rc1bdzC0ZMWsCw0jfhErMiI7rArPcBhnbB8D64sYwkalS6P53zJoKLZMKNrCJoBx
	 pHowkXKr0lBUEipHQKtUpiudmHuG96kmt52P4CX3drdrojUgdsmiMeFq9Q9tMSZRpwPJv
	 /AOix6W9blhcFjnHrfnCO6CNAWqOqnBTwDt6R05hjePo522pnOhqyJnPUaBmdGS1OW8Uq
	 oalKu1fe/Y3FARPvKVbFPOZoEd46jo/KqQxwgdeh0eSHXtmHi1fQ+FmchV/NMtPWPBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=;
	b=WXmYL4bATh4mpnnmCB40foguduxwKHyWVc7nC+YsDtEKFLc6SpCWFpT8dfcEdZuERYAD
	 j1DEPsCPpgBDDJx+eYjIaP4Bngq/Dho+cifs6e0blSJY1cf2kbwMrMOfBIn1cUp5dET+5
	 iVaLbd5Q+qMq95zJ2se64glVwmYBU/DRr4twL7BZOoiY5pLK/dFvzvdzQihbJJwKSxEgK
	 6aCYxfXATTOVd1UyPa/Fdp6aX+NXDFuwRlvHdgnBqY5CLiQfGt1+Rd6y9RiBgkYUp1RXU
	 L2NoWRUXnZTQrZEwMWLt9WC5xEHgsOqM5yKms0DHkI7A4+oo1rNqYWEtwgYbeKiP+Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkuKJxjR;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7315606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7315606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkuKJxjR
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso2240598a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821066; x=1795425866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=;
        b=CkuKJxjRDvsygZgd+aU9GZgl95fYcdfhBJvAGAKqyxvJaXrARgzSJYh8vG1obxOYj6
         Hiq8QBBTu/FBed1FFeE6pzSA2rjI4msRNQYZWbfN6pZ2aGioVQPhZ8k8pz6bMcXzMeC1
         KbSWr9EefxOFm59PXzFvms9ZImD51K8iWrPSOGfbl1G4zxjUBMpMdNR17CmqweJIlfpa
         NAgXhjQgW1O2fap99pGikhVU5jE1gSyJLECQ10l1slmhJ54h0FY1IKxDigvfe4jKexRf
         ibKbEx92bhobUUTRrJaWc1YTGHAJgp/HWTXY+yie45acO8jIoK2SkNcmd4jywIIcSMzx
         ranw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821066; x=1795425866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=;
        b=JsDIbDpGR5wPBXrWAV51Js999835wxqROWD62mIe1ut6x0aO7Y1IJe5l1JUXRj5m+U
         CZttIN/dmX5U1jwbiuv9j6HUyLdFfFxYB1kUCOog9wlGtOnHiJ4yT1U8hn0WT9ZEjBDT
         qGsTzBEsRlGROepjBFzA0eNQLfzJGcLd1DwRqKrFYE7cUk3QoXjtOWIIFJtym4YHYpUf
         AOJRsg3WIHQlByUC7ND6dYK7xFgPmpLOSlN/fWSH0M6RD1E3HIThhYN8j0V/CSN9dvNX
         BHd7KmC2Llu+VJ9Zf1NO6CBobbYEKHDzj/LMoW5JUUqw1LarXr6ayTmJO49+HlCGcAAO
         yAow==
X-Forwarded-Encrypted: i=1; AL+hErGIlt0FbTXvM7NeOrtzvn0Cf6qg1Bx8iAu9UHb5CAeY32Jz3zt7o1G0h8BhIGH9GQfUTcNf+R8LhLkEOQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z92gc5fRL4Nc6z29pjnxbjyDjYW9B2vr/VyLmB+ri71ws3NbAcx
	KEVYzVVj64FuPfpO76rtPK/YCx9cMppFBcqOWNj8NX77msw4IyAs7M5N
X-Gm-Gg: AZFdTZc0KXY5FvLiDvQ9T9F2zQQbWFj5RQzatudcdBDdjTZ5kMjsGOPgHdkkUppQTkd
	a8YRmvRCKeNyxpDNDyQ7JcnsQr7XteNUKrBIAhncQoCq/mzwYvt535+eXBLLg0pBPMbOUHaQRqD
	YUEs2CCvfIOBV5/gkuVNGWgq4Sx8s9w6QrvvdPpczwJLiRgOBADe7rWKoAUhuCM/pxRB5BSagcB
	rT5TFjiKqW1zjvmdibcViP4/IT/WfchwRS/hMNLkM32TXqwdlUb6P46dTr5cr+CmJ1B/JsztHGw
	D/SDN5WA0Sxv/LellMvtleCWhr88gO7YinCvRwBBx9bj1h4BPS+rACbVzj1/3XVY8acNLAHgda8
	KGxxq7dJnBfG7Bm19yJ0zEoRtcwLFPICfj6+JgTQ9wAhbCEUQxluHUxjrhNZ/qi5gajgh931uJE
	DVUtptmAUGPlHTWaIavJ46bMZHgiQtnbtVBfwuMK2M6gn6UwO3TmQMDxu5b6fENAazcsfcFE8tc
	4/AO1DkFoxAVS4/IDPXqcvCn9QXVjlKerYW/fKhaa5cSb0zS1xm6B0709suJJjHkdbeUMInbOaO
	omqySyX8N7t2OqxZqyqIaZbRFwccS7ZPBgBHJ7lGI+il7rrAIrxkYsvUZmQVe8mN6XEy7n1ZZBN
	9yQQKxF7qmP0o+YVVNY4ite6NAwxiQNNckiOJG1V1V73zGgRucgHFhzhvpJITzoNGBA==
X-Received: by 2002:a17:90b:4d06:b0:3ab:884b:65b7 with SMTP id 98e67ed59e1d1-3b1b0ba1321mr8970677a91.25.1794821066118;
        Mon, 16 Nov 2026 01:24:26 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:25 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: atmel: mchp-i2s-mcc: Improve clock and IRQ handling
Date: Mon, 16 Nov 2026 16:24:03 +0700
Message-ID: <20261116092407.514998-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies clock management using devm APIs and ensures
the peripheral clock is enabled before requesting the IRQ.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_optional() for gclk
  ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_enabled() for pclk
  ASoC: atmel: mchp-i2s-mcc: Request IRQ after enabling pclk

 sound/soc/atmel/mchp-i2s-mcc.c | 46 ++++++++--------------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

-- 
2.43.0

