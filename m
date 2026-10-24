Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877125;
	b=kmef8QkvJZgzTzb+CJSMEru+yxeevMeUszRd8H+caGFsqjswMLXRaPKmkCwWFyQ4Pt5x
	 M0euHJkacLMEDtaJDmD3XHOAyyrDNK2GdBfqraxnlZqdBzbURnDDy7aSFMtBiuvLAI6Yj
	 QJ7j23zyVksEdBC1N67p+zH1FCXo59YJAIPLHilevHHwg9VZCpYxANpznvgm+AtkjMfNP
	 6lDjqax0Wr2ves6OT87dkDgWBYMVa260ncM24nGA8MyD+0pDYp1+ZYvdwMUq6rThMPAsE
	 1W5pGRaUtmTiTaB4xRtSaU98Q7NaOm+Il8N8gKNbYw0eztVLVkLvHXWr94Hfdh/ODww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
	b=vUc5pMmhNSJApubu+aZeWfIwhfKHV/dSrfhlMfMQ5JkxSD22VZ5W0rFzXAYHe52Zwwhx
	 sdxb4D2YRtQ87cOY6IDguw3GhUxYe7+xUDQvfg7OnukyzPwX4Z9+KAbXJnz8rzDZU9oHA
	 wfAxDw5NHfNphOYA5SVqipei6ZGIhW+6Ffhmmu/EkYnfiiEY1XGgtehUtrUJCK6inxyEi
	 YOQqii+LT0PZEPmIYKlfrz8NLRqVW9lf0JBFOTe7rcZSZ7RrmQO3QbRv49Gklz7C71oHl
	 x1pZ25lQOpTRj3ghySX8sk7zMu+c8wKNXKKx6NA2ZdPyaJ8bKNsbLb4lFps4jxB7L0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zvgo6i15;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A7B606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zvgo6i15
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so12101135e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877122; x=1793481922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
        b=Zvgo6i1589cIQqIk1mSPjEk9cn89c4NbZ3U8EmUe7UMtPnDkn/IB4x3IlE//XsR47q
         A4Hp6Q9geaXji2lWuUS9eTVjtUaIk3AhPl3Glx0wam7vcVdRlXHKtxXN0XBbN9n626ei
         4BMSKivumEOIVuu6PP/FPuIiRnIdNkTICg/UUDy/VfBbO3PcBoU9EYnl0SstdOvb7G+a
         2HXT/DHEIdOXMBS2IGxrXwDEQSUFnyu01doDpIiKZprnEr/DlR38bfGr7s/ymjXs8oo0
         L4ofMdhONoeyLzNJps+vsNDHggxQp7T1TGQdgB3TdfHgMNe8g0okSwHbjlehL4KmGEpz
         RhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877122; x=1793481922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
        b=d83vQtqHMkKkPVxJGawrQszoKnlvNMnu3t2GcoaqLBM+/XKldeR2J6gPvWKgMzASiw
         j+yQ4DzVJ52p1ek8B1N3rWa6p+52k1IzBD0l57cU8dTdg8RLXIaPJQc7S3C04/lFUKfx
         BN0JKuUUTeUQce5FEvYel8O5nsB1tSakJ/EbOeUAGPyMsJN0EMgv96WkOrkE8rbJouZt
         j/LkF8V5J7YaO6HHOuITrjI72heUD0KV9wJa3xOusKT1CVZZTSHUETKc2Fe0BnlJreZN
         sD2I2HaAKSkSXQxXpo2RsX7tiRRW+uE5/BM6oO9N/SzOTK/IB5FrKvPgM5WLVAlZyi9W
         8r7A==
X-Forwarded-Encrypted: i=1; AKwUvBzsB4zRUZqNCino42dDTDSDOPwz0QDB2FkdzGoSEUztiyHshMjmDKS0y7CcYtofzloiBemWUjLG/P5XMLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUNIm/J4/4RltHnJP8tbuwrOT57/n8a5zxG9wSdHOM7QJbDj9Z
	nL/Y0SbvRkbfrDGFX9TsKCb1w7q75fpac0YeRgwsP2CimUA2zzJ3f0Y1AkyIj4kRuf4=
X-Gm-Gg: AYBFou1PGhlbRZ9cW6Q5UrB7d8mzXIkWutfq7FfhcV3luty+4TkE7nl/YP0KSq+URDj
	rB7E312cJLjzV0Wl+yqz7hJ6gq/W5KFsy9S6mmVGaz74tOyckv7s4t3x8Hi5GA3bzq2kKqI8JqU
	iV9DWYiPLbeZYkDrWhDLmP5tdHKoqjy55JzrNczMW6MoWIagxfs0VLdWmsSxm5rd4tN2rMCtVi6
	NVcms9ExQftuXpt1vH3/0thLS82mwcQxMCDyU0SMspnm8WrD0OHePwLCJEZGpY0zDaotj5QuJRO
	z+QAR8Wlphze5vq1wjyF+HAwVn0wVcbp7b/PA4d35OY1iOINhGlec07MKA76YYqqdtbHnfR7cnF
	MH3nhG2knfdOLkiQLyhjHgF3pmigdStNavDLzbHphqtQW5HZOeH6qGH7IXCv3z2JPOrrkiVxyYE
	9jdvpgDKSR6qZ5G12E0CFxPSvI2u39WZGqkrMTfPTEWs5s2qWmXbDHXHMXWl8RuNdg52WPLwMt2
	UIXp5OS/gYIHT3ea0bDTuTelGp7Afk8xL+DV0odLGN8tvmtXuJJbzp4UFCr9SP4HbhBrMeWJm+r
	R0faECm0fYjxHWdllZ4cIzByhigsetDumtXNQjcXFiRCAgal7XKXUwefFSkOYQ33HIo9GiH7Ng=
	=
X-Received: by 2002:a05:600c:6289:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a35ac9f52cmr43172355e9.22.1792877122133;
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:21 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/2] i2c: jz4780: Program the spike filter, add the X1600
Date: Sat, 24 Oct 2026 23:25:18 +0200
Message-ID: <20261024212520.91401-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

v1 said the X1600 moved the SDA set-up register from 0x94 to 0xa0. It
didn't: as Nikolaus pointed out from the programming manuals, SDASU is
at 0x94 on the X1000, X1830 and X1600 alike, and 0xa0 is the spike
suppression length. v1 worked by accident, by writing the set-up value
into the spike filter.

What was wrong on the HiBy R1: started from the vendor kernel, the
filter held 116 APB cycles, longer than SCL's high period at 400 kHz
(102 cycles at 140 MHz), and every transfer lost arbitration. Setting
the filter by hand before single reads, transfers work from 1 to 100
cycles and fail from 110 up, whatever SDASU holds (1 to 100 tried). A
cold boot leaves it at its reset value of 1 and works.

So patch 1 programs the filter for every X1000-class SoC, to the 50 ns
of the I2C specification, and the X1600 needs no driver change: patch 2
adds its compatible with a fallback to ingenic,x1000-i2c.

Changes since v1:
- Replace "Add support for the X1600" (wrong register) with a fix to
  the spike filter for all X1000-class SoCs.
- The binding now falls back to ingenic,x1000-i2c.
- Rebased on i2c/i2c-next.

v1: https://lore.kernel.org/all/20261023081452.44118-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  i2c: jz4780: Program the spike suppression length
  dt-bindings: i2c: ingenic,i2c: Add the X1600

 .../devicetree/bindings/i2c/ingenic,i2c.yaml         |  3 +++
 drivers/i2c/busses/i2c-jz4780.c                      | 12 ++++++++++++
 2 files changed, 15 insertions(+)


base-commit: 03a5cffc818695157414456dec695f7c30b9ffff
--
2.39.5

