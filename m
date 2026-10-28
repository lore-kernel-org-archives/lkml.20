Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173482;
	b=YaB+PDBaSvspH019cwy7liEU1ak3m0eg+x39uEJV0rVuhy8GzN0MZBO3Vn/Y0V7RFVED
	 S77GxcEQ0tatqQzaL6svaH/Awk64e1Fvss9L7HtQfFrchQNTSvyLjgXfA4IlQFgT/zfpS
	 xW0eABoegXUgM2WEKaikuITKfs8A/raPdhxNXgyJ8G+OVGqvpNojn+9DKOGOXJ2U6aKh2
	 6g7UBOvr8EKzWqWb1FVpEFi7z0kG69CBojARX1opuizGAx7jEovqxQav4zp6WuCIoxxDj
	 yM1lqmrLCrtkYiPvAynv4kShumpwQ7hrqdTzBeyes3T2qZlqlSL9qBE18izgX7ypThg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
	b=kxpqoRJiu6Y/lyDCbTmRV/1VCp/v27o0sJX7UmemUYCGWxF653hDgOp1y7swNLVCaLRU
	 qryMIM3iI9RANMCKRKx3kC/UkbU2G4uRrGWEhWJnr2l6JY87ITEo+hFPDBDP7OXmp/K8n
	 XsWe8KoC073DSzstpnQyJGUt8y/Swb9dKAkP9kSeG7Tz46CbGdlP1q7HdACL7Xazxc/n2
	 skwD9qabV5vcqcaGYCkFdXeiE7jJQtELTvxo3ztupLaRcmHAgAacDt6EPd3IMEIEHREo3
	 IkydkEE/+nJBs87+7n20gzvQsTQdvHAHI/0swmPcM/1QESvtnU7oiS8i0olo+p6yXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=o+dQgdtT;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E57606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E57606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=o+dQgdtT
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so5375205e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173480; x=1793778280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
        b=o+dQgdtTPUArIk8G4DW9Oqsp764+f8J6aW0ayYaDCegAjgvjAOMBnfqzTJSmDzmm9n
         i+NZAC2XlxKHwZKwEPJ1B5aeJF5Pg1JAVxDHGVWJXAXwG7tAR4hxMgaOdwgppP/CRpck
         ruDoRW+vGo3C1vOq0mA/5x9Lp++jUhBtyGI18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173480; x=1793778280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
        b=nEGrlBRn7mZ0x7ZOj5am9J+flUMTl/gwi1PBEqRYB/GtLA4SYUDdNGHG031kqA/z1V
         UhKStEABhz3LJZNClxmvrbXWlO6W0KTbFT8LYMmwsGS9qsEFRBpBe6wxRu7Vsqr54Fug
         GOalj0xyEtUgGQX19Z1XzXJZbqzDPhuHl3iRhzB50D0CsbwNUeU7KhcocBl1uuo9b+uj
         KFPnf9XJQp6MgxAdT8/FGMeJkLqkUobGZupfR8oJvac5PNad4bmB0tP+lrGxdAnxt+hE
         rXKONjo/0L/7jHV6jxrri6AK/c1JOEQ0Wrw8hOFjK5zUO2ORkgrNQ9g1vpz3Ty9/Tblr
         tIfw==
X-Gm-Message-State: AFq9FYKtv8vMCEAGNKHM3ZkEiof89q1LbjJjcPRPxn1d4U4qEkPD4VzS
	yGlkibZwRjXCv/BTn8WNbTJzY6XZVzsESSvgBfBVhovnuNWJVknoaugRgVarwkH6BQimSZLYq6U
	oVZ9a
X-Gm-Gg: AYBFou2tRkZET7pJsyts8QZsKtu3z0XROLqpRPNNiHA5AFJ1FzcHzSE2/O0Qx+AyC9X
	W9SksUmgS5og7m7VB/K3L9AL79UyxN5iPFXHqu2LDAbesseyWlmp4mwIXvlWvCX+DyKiIpAHWok
	WRMMfFibrqGMOGkb0sDAJJJby/IHyJT7lyrfbhJh7Yz6xhgQr3NX/YgxJV0XhY3CYlKiWF/5lN/
	zgoj8ABsrRJZtsHSQq67bmbPwva9LFpZkH8YJ5TXQTZtMa+HdcQKlLD2r6WcCcwF3bKbE1YO9rN
	jv1+kPLv4efJVGhIdWTuUArpFKoQ5BLZkDeU5585gVmKHBnNu67opZfwAhstyHsNfDLolVnlamA
	HQPuCWwlOnzRgXxlM3EjmVcAD9ysvjQF1KnBgv9JmBuRLmvElLlScyAcVoHwwKb57Qunj0c3Nmo
	Fsquu2AN1I6Up6SUhLTcVe6oaLp9LT08gr8M23KtoPHhZ7yMQ8Bs2wmahFu9AjYD0uWy+cbpsjG
	BZALhaGTUIJ2dIbLCoaCuaQxREen8XgfDdlEwwSOjhgtxSW7PeAKvbrO6vjWakIWiLFodP1Kn36
	nbHpNE4QTvhPqrIaATf51VGVuauFSp+ZPWcPq/Xv4hgs+SZc/bbgkUETTE6RkJYakxR6SS/fgSR
	P1LCDczMGnV81r/E9vUPaDwY30BnH7Zxnkip2shJu/X9vfeUCUwHezBzyBp2P6Zcr6xy8+IvTtR
	gePnK2PP4bUHsShVKrfX4M2HrfkDKuhLKlGUunJI6AcK6U+3g=
X-Received: by 2002:a05:600c:608c:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4a967016833mr27902555e9.23.1793173480359;
        Wed, 28 Oct 2026 00:44:40 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v3 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Wed, 28 Oct 2026 08:44:06 +0100
Message-ID: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
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

The am33xx/am43xx DPLL spread spectrum clocking (SSC) is configured
through vendor specific DT properties. Since 7.3 the clock framework
provides a generic API and the assigned-clock-sscs DT property for it,
so the series moves the TI DPLL to the generic configuration and
deprecates the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters, set through
the deprecated properties, assigned-clock-sscs or both. The dpll_disp_ck
SSC registers are programmed with the same values as before the series.

Changes in v3:
- Deprecate the properties instead of dropping them
- Keep parsing the deprecated vendor specific properties
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  9 +-
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         | 20 +++-
 drivers/clk/ti/dpll3xxx.c                     | 98 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 113 insertions(+), 25 deletions(-)

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

