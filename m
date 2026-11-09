Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238901;
	b=02g4g5irEdQyYGzRkp6gAT+qpnt/Aj5H8cu2zySQPYqYVwRakNjPrcJdYijWUAxaaKRU
	 q3vr9sZNY/6CBTw7bzH7wsqitDwvg11YtrKV4kzxneo9UOYMXlwaUda57afntm+uQ7ep3
	 J4INe852bzbJ94wukMGzT9EdMtcM09Rlq98grUwcGAqJrh9fv31sC8bvRaQNGpNyy/iib
	 5ysR/3OcU1m9mDv6xet0KbKHdXwLEjHhaWR656uLkOnQAvMXLpeKgZaK1l+vi1g94yOEO
	 W1NWN4EINnzROb2RZNZr7fzSQFvF5CB6F5mcraAIl1WQjzkVDfAuqLM8sAKAdlcW6hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
	b=euw9hO875fS8qRHYhcwUAzyVIJVAm/2zHrJaC4QIZwd2JeC759g1sqMufe5azr0NCuES
	 e+j335777r1VKSXe0lMzlo+Mq/zV2tYUAJX7o+NSIg+btTzQh2krDDriGldldO4iJ3XBu
	 BvR729tL3oQokIxw6GPkF6h1DJfaWQYpkwRjQiKjE+GaURMzPCMkoVX0xQXwP/vF6AumH
	 cKHP3R43O/U5i58ZSzhmTelx72o1vifXa4nnTgFpMUTK1i0It6aUOYG6IOs4mUrb9QxRD
	 xKIcy6r9efnUfEpz6lQpyQ512bPmyGYSyF5o7MUbkatdTGWEh9K+5DgRjEoyJvyRjag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfkyAw8g;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD683606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD683606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfkyAw8g
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so7340285e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238899; x=1794843699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
        b=UfkyAw8gCaV6pX/Omm1V3onq2iAhGBagklfX0QrO9DZBv6uO7O5o/q+5NLkP8UEw8C
         lYtxaRz+38kvyoCiP1dn12g+8PFMWA/r4SVUdunsETPpW/EzblQAmCCMuq5lxvAZFrlD
         PbDjlQWMbjW3m8xi6A6niqQ+B7avO39mU2u5V4bFMc5CRk+ai4XtZs2SJHQBgJKb3iaF
         qz5qCyAtXIK8kLc9SharT1jwmcF+W9banpzxuXcqJq23bgAWAMUzXSPJVHQxsfmhUpws
         TWSMWY3DC1z7kRMWGzVifxgZiVcHyfnklgzsnoCn+Lx15AgBmSeNVIX1qV6BoJJLSQGZ
         OfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238899; x=1794843699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
        b=2H0asqlXtUC90ShudQDnL/omlpqbPgVuFEFTgDIQJXjhOA2ynHnuGgrzna8wTa0FYt
         heR+OMFXUb89jh3q/cHIYYw5a898vT/tWYK66XmJOuXBjFDEO+2J4mcAlHs30sl4jJh9
         J/zOGVfHeofJIBNmL2idDbyBpYIv/utSI6Fo0pFVRzSXS0pk5FqVy/VFPHZbr/NgcU3O
         6z7Geo42I2636ADnp7bNF5zZCn/Y6WMnu5H5tmAg8px/t0e/rmO7ExDwUb3L5wz+A+NX
         IczTrEA/LHnoKoFE9tNpNrPSKZf6cPR4dPb5Y0LIOZWUvsHu6v0YHiMsD00RIPfUHRxP
         6Bmw==
X-Forwarded-Encrypted: i=1; AL+hErEaZzlaeqeXL1mXarvn64/HtmNLJfXeuCQrXjEWXeBhR2FdIqWr+ES5jGmCpy2nak9PE6Bn4qJFckBzuzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TySb1skI3tEsFcmygzIPTrtvEscxdt+MBkt6vKtCS84V2VWuo
	s7aVXwdIIoPAG5lRbCUzKxkx1GNGuifiW5TO8NA4F/hcS6NxAzdxM7zb
X-Gm-Gg: AYBFou34nnS5VyM3IXm1fdTb/V1ZsW9wbB3YapCqqi/QaK30Xws8zUsC7sxZQAuPV/1
	qhFh5/m4NVhPQ0v7F+bj3qVGa1gs3/WOrZDJEPxi9J5Poovc+nWq1GmXxGJRRI8lMiuMx1o/ikI
	wbHe3SRl0xdLSyTEmhNuOzh8XFvAk+pi+3V72MX8yNYmzscaDqTubhUZOH0iKcIZRCD77ceK16l
	G15C+xO8xPENBzXYgzxyHh3DzUNQIHCBX0TK3zRiZ3PB9jXW7U33BRIppjR6u4js6hILrpERz79
	BCnT05bw3hpi21bxjhfsLDe4PFrHyWhTHhyC52uxoHNpeoaYxiTj1qy3kT1mFUb24D6ByrMrC+r
	3jPWUcQ51t6sfFeEYfEYu1UnPYvLnQmtllLmvqF8RVrA50PpD6i++1IXCDmceQFhZBNEtrnDRz0
	RmGSmva5Dq4/ke/SO4DI8kLmNBXtZVZ+DHPBYGR0fs223pkj/8ZgENSm0axLD+wmjfD/EHXk9gb
	jnJYdYaW6Eq9QQSPv9BOn7tlJl3mY8C/X2vvsEtXMhqr+NStVc1QnipGT4j5u7q4p3IRWf/dxCB
	US8OhBKSF8WRyUz7vyFWo/K2lGopsGiYbhD5CTgirZQq/WZvL5U00DxhbHsZV0/RCnTcMIlHnjw
	Z+w==
X-Received: by 2002:a05:600d:19:b0:4ba:a5:b920 with SMTP id 5b1f17b1804b1-4ba00a5b92fmr12877165e9.16.1794238899088;
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:38 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH v2 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
Date: Mon,  9 Nov 2026 16:41:16 +0100
Message-ID: <20261109154120.592392-1-jude.gyimah87@gmail.com>
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

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 4 drivers, so they are here as one series.

Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

v2: Patch 2/4 opened with "These three do not" without saying 
    which three it meant. That sentence predated the aiu patch, 
    and the context was only in the cover letter, which git am 
    leaves out. As a result, the commit message didn't make 
    sense on its own. Reported by sashiko-bot. No functional 
    change: all four Kconfig diffs are byte-for-byte identical 
    to v1.

Jude Gyimah (4):
  ASoC: meson: aiu: select REGMAP_MMIO
  ASoC: meson: axg-pdm: select REGMAP_MMIO
  ASoC: meson: axg-spdifin: select REGMAP_MMIO
  ASoC: meson: axg-spdifout: select REGMAP_MMIO

 sound/soc/meson/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

