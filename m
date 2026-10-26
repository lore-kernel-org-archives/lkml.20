Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000820;
	b=iV1v+z9Mi8mTD1T6TCSN5pxHDTsolSZNtCZwkeOAPG+3NeuTw49MyjroyEedAUgnvhYk
	 tQne2MJIY+KN/8OKYf1qzd8Jn3W5zbTe0bVtHsMFmoBpq/bGj8DmPMgbWS7lEWVm55q90
	 KLi+OfeaXTdb5Gkv5hgR4lUhaIaPpDME/Vg2wKLG1HVWttUMu63sG/ehgYQ7Ry4zRunHl
	 fXG6hCSAjJ3sagfnqBIS7fOoCLzGbtSItAz383cdGQQJRw38R5CqHpcHcQA+nqmQlMuXJ
	 mraqc6ErGmM5QEDomOSWDTXRHtMYD3jNeVebSJc+DJQwSvkZuglNw1EWLnkN28mDrGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
	b=1vkoGPXmFuPDojt9Dzy0iELVR4vDcIuHHH7FrELXIkt5gmHjmsA1/JXzQXhWa3dLQPyk
	 GQT9gSIGmbMJQjdOTirDMyDK+LL9IAf5cUagm0u8YW1LrSOUCciVfj2tABE4e4XV2kfVe
	 5yAA9Q3HYJxB82lJZlQa0Dize+JL9gXcLU2PBK0it2Hd7tz1WruM1YVGviDLmGxDS88nt
	 rMsHJPZz0X+mo0zZyytWUTu0vjK6tF2pr6twcR6j/7VllEGZDo3GvjsSjcDlWAm8TM3hv
	 gJL/fDfsJxZNzszSX5ysVynXs9D1hr5SaHbUVkV3KVhW6oO4e2l20pVxtMScB4yZkIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=oVCZUiyX;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95D606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B95D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=oVCZUiyX
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2617779f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000818; x=1793605618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
        b=oVCZUiyXw1lfiBhfxo41FJlK1qi2BtYosNra8np9mSh/DJ68mSBGzyPJWYmA4KBAH6
         vU4gQh3R5fMOth/IlDfH/frNDmT+mv0GDkd1K7glrfnahzC1aV+6oBsPSP+alGm4Q139
         9qFU+55MFyqIzRPJ8KSKohV0T6zJkzeEn+cho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000818; x=1793605618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
        b=QKpnVxtb6wmOlbatSROMZH2int1H9Pyor2EvYyV0LCctB4mRlJh9KQBFCkBJX1mmb4
         O9l00cjfFbEXDSV963HU32LXlBQcyBnZ47GbUzkQoCFmnl0IQqKGCn/JYTiY4DmL/WeM
         qThfOzmOS8EyS+WEljtlFjazOIXkshKLFaJ58+eCn4t0XnqbIgr91T0YK6fF2lrgQAEV
         b0zE7GSTdA/pEP99qVIPL7/qSlGanhCCGCfztHp3YS5ziq26eG+D5nZDG3Jk9j+tOc9U
         V0fsonnNwVOA4uYS14LBwUs2CsWHDA9zYecbsp3/iOEKMe1d5vNqB7Q6i/aEAW9YWvGq
         pg3A==
X-Gm-Message-State: AFq9FYKCrwrea6wbu+bLd7EkfU/vRs9whdKGBLqYCkiYJirIEsX9ToaJ
	U9FO7yARY3WvAwzJ21j/y+cZambghmrS7W/0c7cpZFKsag/6y5v8J3XzOA2sQiiEcCVHuR8Ya+j
	e0RfK
X-Gm-Gg: AYBFou3JyqmkqcznsROJIVI0Zy4jxgNr+bWLRaCDsztSouvSzGT5RjzRtSEYn9Ti4RI
	iYYhL2jCmPyPlNtDN5Zzp4+X+h5NPkqpnQzXpVnO8rpFEvaK7ATaMx3xb6p8LVVHRjULmobBXh/
	TeaFwFs0BgyC4Ofa3Dn0O8inQn5IrCxeJXlRN9zGPxmk40FoF4mNPfjqsHPrKpdT538N6utGhpQ
	VGhYaQ+U/i4tmg9sioIkcTzgJdIHt7ZD1j2ALTaM2SbeI+RUWwhOQW86JBQaw7arE5pEAWRIu2G
	z1MxS22vxSUtmBFK2U49vyQ5N0/ShXFqZhgUIQYJfxoOMiN/wIrHHZLFyQD9c5cRF6uY6y+sbkO
	b67Sdcs/f7A7JBDqXop0hn+Q2tUnNh+QTC2CmqGyOKTyYeWD6MEmLAkDRBGAE9jxIzyVC4lHyQA
	pLJhegG+p8pk/zEx5ZrCQ/XPGp8ATcXN4OLZy3G6Tk6fB/F02xJGoBUUtByMgsG2pWguU6JA6jd
	8BfYXFXk5hU3fPp2cgfkw3QhEjxBKfCSmbcpu+zIrzUPq4xoQ+QGPRkRpert55QfE2ArgdMO+in
	jlkVNvoygBg9oJ4Hjb0n/GhAFGXa3ZiUhYzgpzDcMdArRjYBEqTtkMwhmHQvWhtCj32i+oPEmv5
	nzl8WPOnoY2Hh5ZAgQRWqp+YcDeEwvD6kIkR86/jzqz35td/u5fzF
X-Received: by 2002:a05:6000:2003:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48e3eb73c36mr12890000f8f.13.1793000817894;
        Mon, 26 Oct 2026 00:46:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:46:57 -0700 (PDT)
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
Subject: [PATCH v2 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Mon, 26 Oct 2026 08:46:26 +0100
Message-ID: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
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
so the series moves the TI DPLL to the generic configuration and drops
the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters. The
dpll_disp_ck SSC registers are programmed with the same values as with
the vendor specific properties.

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  6 --
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         |  8 +-
 drivers/clk/ti/dpll3xxx.c                     | 95 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 91 insertions(+), 29 deletions(-)

---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

