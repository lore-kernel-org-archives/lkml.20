Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920257;
	b=sXJtvRIJx/oa6pz/zYlyMNsJyZ/qm6Kc2JjL9pI5v97uC7R1IKCqMb2WCH9HjoisEP43
	 3ENBVbQ0ePbbnxsMwnwTVI66U8VSZecxd3zqr3Pk0NpU2ZKfhQoT4DvdykXxRRkQYnTiB
	 RPjoshVZkp8jfAT4CmpkS/YuKR7/RCgmsk18b9ydWN4IRxcSzHe5igzI1KqyS+LPYSWf3
	 jqYRDd4FZWUHeTx8tkEGDqnlZmmqimYvh973S9meWefuleSQqo60/EcWKrALQiKk4I1/5
	 I6+qmjlRUsJcHVzPBS3tfJpHjLYebFJ2lgmslubIVy//kguNXJ+yrGkIhrW09tHJg1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cwQPpTaL2c/wj1OEDa9qNdi880oheLkZqVlpuujln18=;
	b=ktpAyZU7a83tOv416vblFWWXoYVfnY2Ym+LLP5pyhxl43JTctAoRXbMVxkPW26ZXXerl
	 38Dnx/OAeYHrgRLVX/9+0za9kXQd6b6tOnmUFQ9mMekNGIuOs53wMd7fXAtv13dxyzW0d
	 HvD9V7u3WSQxQLGXNuJIi7a7VnN6IVNyUyGoazh4L+rq0brDKyJ2PDBjS052dzA+TF7gQ
	 XklngL9h7gFiRI8xPW8qWVcQ+aGuQ+MR4/IIosQehs/ivjQoJ0ZyZxDpC4BUN4wDOI6JW
	 MLCprsiHhbe+xYhNiYHb9BqgG6siHaYIxFxsGP0gDExu3JTkHo+cIF7pnFdg8AQqcKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="he9Xj1/t";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093F606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7093F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=he9Xj1/t
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so6800379eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920255; x=1795525055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwQPpTaL2c/wj1OEDa9qNdi880oheLkZqVlpuujln18=;
        b=he9Xj1/t6jD+zpDhkV5lhMnEd+n3snktDIJnyh+tRUhWMvREqTYyVLf0gmxsMaXNF+
         wqyv4RZKSq9w2j+Gwn2lk1ZgYxKM30QcFXzjYZH/09XDe16NW0P+gzhcII9w5cpfFaq5
         KahHYFUfKpTpUqjQx9i/QXbC17f/gCVr9GGFE1UH1dGVvXV7B41XPoEw+QFfAIUeG5AQ
         f+m8Waf8SaBB1e+sYlWeHsaun7WqHfs8z/41Nd4FIqZ9A9SNZgMY9fAyKpeRi2ZKUQ//
         47bz+DVNViFUgn71bXz8mgXEK98KfIDriwAhGY18QAhOBjwoxgC3BzmbPkb6jc530t4B
         1j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920255; x=1795525055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwQPpTaL2c/wj1OEDa9qNdi880oheLkZqVlpuujln18=;
        b=UrKThm3tuWBsx/T2pu6T+RBYYcrTfIUZbFDiuR71DuroK6YZ66ThG1lgsN7BWN6gEx
         jzbCySHWbv01OEGMiXiPOQy2K0xVoulNLb2VTzqUD68axRkA59eY52NYa2AoWPyB5m3+
         8PXx9Sgz80p6JZzmDsZak9cq+Lpe/LXc3a2sk/krhw2Kqe1aud8GZWmavg9xR2GbFAF2
         aPUteDgB/ZTJk2C9qHtTxPzC+lMwt3aAEO49mAq1oyVCHbfGBXWCTdTynm2BCKs4UYLf
         aoADd8LBOuGVuyhrb3x/PpyO/lu+dC8pYtuZr4YnqmIyS6Os6dfU/HAqU/dtq6vfbE/6
         P5Fg==
X-Forwarded-Encrypted: i=1; AL+hErGs5iLLZjPtk4MaZlsn7mcvzPjWVtjVGZRnYe4GCyhuHiAXZRKQnua6PZ7fUMsbh8+xqXzwBW7OvL5brEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dTx4TkMD/6YH5V36p67XtvkR4D+3Hl3xKBYnyWnVgFyUSBwyw
	BzHeU6dExjvvuL2NflfpItCu48f8s8nXRZ10ECQrTAYOvRVlGAkCXTeaNvRZHBEkNOQ=
X-Gm-Gg: AZFdTZdDfGTm6gXiub2LUdXceHg3g1dc/GwAf8FfhyDt+XTsnVyWrtR4fMmsj+1itpi
	XecP835mDy/Qvr47qL2+LeVTOI7Oh/POZBpBfidC1y/kylrCmLTfK8wDfdFCQabKHHPJLV4oKgc
	OYGHQsx5eC1AMv/+Jbsmo99TUe9uHnXcCFLBn3fgVhpogPl4oWFJB7GVTyakPwt4Oa4eAViraoV
	XxjUZacwslWMEIqBL6GcaGbutXgTSeDHT3TPYuM5ItHp0tDTZTBRzXKhxwYPFbtB6f9lWzlSmCa
	MnPylBSefsXIicWFbQzAi75Ap9oZjSUXZNQIFwxYKhqnlKbPs03Ji+YTMvwgRTclsXCbMgrMJD1
	0i9B4pjMBnOLDMXaSzk3jIDOq73snT0nXLPvv+c5Qqkl0MJr3znmK/bjsVh+0cfHGi4UJLyWY46
	CS3B9kpHVODH4496nPQQun9XyESCX/7J4O98ZdtRrhB6qPS/TWcLifbZS91I1eL2+DuHVqfnQud
	eco/mlTKKeDSqj6kyJG4gBYbA420WJL4z2K2oa89rr9fYtXabe3NbRxSZ5JUvt4GeEG5x5a+Nzh
	rNQ61zBnWZBt+aNQ0X5sTkNSIZrR1g4upHF6vkum/zC2CZXtcywe09bQYsJCbLkFWzRP
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr12249938eec.32.1794920255453;
        Tue, 17 Nov 2026 04:57:35 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:34 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Subject: [PATCH 0/3] Add PWM support for the Sophgo CV1800B
Date: Tue, 17 Nov 2026 09:57:12 -0300
Message-Id: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dzMnOwy3ZTSfN2C8lxdE6O0pGQjiyQDM0tjJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAKwV+flxAAAA
X-Change-ID: 20261104-milkv-duo-pwm-42fbc28b0693
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

This series adds support for the PWM controller of the Sophgo CV1800B,
the SoC used on the Milk-V Duo. The same block is also found on the
CV181x and SG200x, which share cv180x.dtsi.

The CV1800B has four PWM controller instances at 0x03060000, 0x03061000,
0x03062000 and 0x03063000, each with four channels, for 16 outputs in
total. The register layout is derived from the controller already
supported by drivers/pwm/pwm-sophgo-sg2042.c, so instead of adding a
separate driver the new SoC is handled by a new chip_data variant in that
driver, as suggested during the review of the previous submissions [1].

Compared to the SG2044, the CV1800B differs in these points:

 - PERIOD and HLPERIOD are 30 bits wide and PERIOD must be strictly
   greater than HLPERIOD. A 100% duty cycle is therefore not
   representable, and the period must be at least two input clock cycles.
 - POLARITY has the opposite meaning: with bit 0, HLPERIOD counts the low
   part of the period and the pin idles low; with bit 1, HLPERIOD counts
   the high part and the pin idles high.
 - A POLARITY change takes effect immediately, even while the channel is
   running, and does not need PWMUPDATE.
 - HLPERIOD/PERIOD written while the channel is running are only latched
   on a 0 -> 1 transition of PWMUPDATE. Toggling PWMSTART must not be used
   for that, as it restarts the counter.
 - When the counter is stopped the pin is parked at the level selected by
   POLARITY; emitting the inactive level would require changing POLARITY, so
   the driver switches the pin to input mode while the channel is disabled.

Patch 1 extends the DT binding, patch 2 adds the CV1800B variant to the
driver and updates the Kconfig help text, and patch 3 adds the
controller nodes to the shared cv180x.dtsi.

The hardware behaviour described above was verified on a Milk-V Duo with
a logic analyzer (GP4 routed to PWM, i.e. pwm1 channel 1), at 1 kHz/25%
and at 0.5 Hz: polarity mapping, PWMUPDATE latching with a running
channel, and the pin state of a disabled channel.

This follows the earlier CV1800B PWM submissions by Jingbao Qiu (v1-v7)
and Thomas Bonnefille (v8).

[1] https://lore.kernel.org/lkml/20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com/

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hiago De Franco (3):
      dt-bindings: pwm: sophgo: add PWM controller for CV1800B
      pwm: sophgo-sg2042: add support for CV1800B
      riscv: dts: sophgo: cv180x: add PWM controller nodes

 .../devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml |   3 +-
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  40 ++++
 drivers/pwm/Kconfig                                |   7 +-
 drivers/pwm/pwm-sophgo-sg2042.c                    | 201 ++++++++++++++++++++-
 4 files changed, 241 insertions(+), 10 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-milkv-duo-pwm-42fbc28b0693

Best regards,
--  
Hiago

