Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FDB3E0C4A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021117; cv=none; b=Lhj0NQOINT5Ct1jJ9engYWlrTbdirEXWgntR4sMNgA9gG6F2RO9GmSDjnkMtpvtP+4LG/D+onIjBit82VDRUoQ8QrWoVN0eA0SAGWC9nU4+8YArYRWx10/G/Yg6u0lOdGuQTNFVbyibMzH0hr7VDl+K7kTEZOA4ZwpPX27cIHYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021117; c=relaxed/simple;
	bh=7mw1SC7j2m+3fApFRtf/aio3nVzJa9ABqYViSIzMyeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYDhdP6RWTMzWsUoeGzBRrfOYttnQxVfqmwlyxOqGyZv3P4ocnfBvHge+ScmiBhhEemqhFItJfsG1J7ho3Gp7l0nXVw9eKshDOyZAxpLn0cQAjqkchggeqUg5JMx0Q/FeTytRuqdoFcHTZ941aBpxw58iSUQjFJMycc/up1MWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARD8EeQn; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARD8EeQn"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso2645540b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021115; x=1790625915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=;
        b=ARD8EeQnt7st4LssyLm4BlT+NL4zdE6nN5ju0bU9MYkxXVk/6QFlFUcbTjMzrWYVwH
         6EOAf1MoU9q2dPw2VQEDDZwE9nramCXrFUgQPwoNLtb+ciPIS42E6scVAKtX3UkfquuS
         rtecAoeDkELB6ThBiXKhkbUZbb4CHPxY5gD0d5O+Ia5nxOFOkUm937YnJ0HVgQWaTEmQ
         S9dHG+McO6ni3a2eWp4/ijBmQpsf97X3O6uyx38VwOT7V5buwkLUG7aNKqVzkdEvppu5
         5683Qe7eZeCVVt3t2EXyl1Ll99Tn2RFV5FUvw/bhGN2SblUrmragUiwhAIMtd/Xi0D0x
         8b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021115; x=1790625915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=;
        b=N0FBpbe6tFxODIvsF6lDWVxYElF4vaJTxEW6nmrH3qn3ZO8X0/kRmj+iOiL6PDpZyG
         MLPY6kP05xp7S9FmqcG58opdLxfyYy7fKIFKFdyxuDTQcGRyPs+X69ozzgtHHqRmvQKY
         VayMr8HfIO8vUsGeHlcY++CUdVY61Ld6fg9tlwEBdaEuI0+joNrFp0WAD17o4IsJrMOX
         SDtvWMkY8uHBr1JBdAJeRUk2Y5xXh/q0VwJlVGDYNN0QCBI7g4hpXrU01rDWkOOcjc1B
         +3nUDD1fL0qTro5WUMCB8s/090CB8YCxv3oBszQiW2GC3vk/jVmEuNPDbanaiE4u840C
         QDQw==
X-Forwarded-Encrypted: i=1; AKwUvBzSTpWspw+GNlFYm+sZOUQ/WlR7rmfYRDbEj/O0M/gfFixerWKqivyf88oDaV7hteASz7k7rWJEkqyzG8I=@vger.kernel.org
X-Gm-Message-State: AFuF++lJupdKoAZWK3I/BbfSAypOY+Ti1Lfq1YrRWKy63NmbG4nP9LB4
	pLckK/VXcN+1U3NYD1SmMy5zbJRyZcaEPeC9grDR+tSJwEOmvphCYjrZ
X-Gm-Gg: AYBFou3E96OvvGfw2brKc9Re5ZtMeb2sXM3Eeqv6sfXpdZisboQa83CkwCFbe+DiYNu
	dIEWvgjph1ChyT1mTJXFOX/hfuNVbAG4G+whTsmv/2rerliGCG/E+LUvu0/h06Z6++4Rj/n/Xyu
	rwxu8YGbYW80EhIKQj67LZAW6sbsCtp7Ki+1Ee1u5KyDKCfAj8oFHsVCnS23sQ94iax3QDz2Fw6
	hM/nsfNqXP7H2dSGVLVvuJgyscrHo7olmn3dsxrsLDP57PoWpMgxi4tb5Sq5jAgzO0qYCsC0Kmv
	gPt1MzeeGCoaVEgCXbpzEWwso0yCmtsy8PL2UBU+XR19zbcrwdeRHu+neqSzVz1YoEVyjb+Z/z8
	Vi5KRfgdYqu1sVTqD2oLy2/tsveH9rxt8gOZZ2a+OlzQM/4DC3AX32Pc4WLjCAFO0G2rn6RvBZv
	7FYpcJXRGZd1Rk+8VJ1Rvz41hh5GRXMLQfNKrMAUX60oY3Xhk1eeqUkFpuvxAOu4pYKKcC0MIlE
	FZwUz50hAo0oQGmP5N0qB93A5eQv6z6TRfZi/MCSX08HA==
X-Received: by 2002:a05:6808:c167:b0:4c5:90f1:b9cb with SMTP id 5614622812f47-4ccf74b09a0mr10949649b6e.16.1790021114836;
        Mon, 21 Sep 2026 13:05:14 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d423604f7fsm1137266b6e.7.2026.09.21.13.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:05:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Mon, 21 Sep 2026 16:05:12 -0400
Message-ID: <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech> <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

I tested the exact v4 series on a Radxa Cubie A7S. I used v7.3-rc1,
applied the four-patch A523 single-divider prerequisite, this eight-patch
series, and Andre's current seven-patch A733 pinctrl series. The test DT is
a minimal Cubie A7S harness with the main and R CCUs, RTC, pinctrl, UART0,
and MMC0. The Image, DTB, and initramfs were loaded into RAM from U-Boot.

The exact posted stack starts all eight CPUs, probes the RTC and the A733
pinctrl driver, and binds UART0. Serial output then stops immediately after
the 8250 driver replaces the boot console:

  sun60i-a733-pinctrl 2000000.pinctrl: initialized sunXi PIO driver
  printk: console [ttyS0] disabled
  2500000.serial: ttyS0 MMIO32:0x0000000002500000 ... is a 16550A
  printk: console [ttyS0] enabled
  printk: legacy bootconsole [uart8250] disabled

It never reaches the initramfs `/bin/sh` readiness line. There is no panic or
oops in the captured output.

As a private comparator, I changed only `ahb_cpus_clk` at 0x5c0 bit 28 to
`CLK_IS_CRITICAL`. That advances the same build to:

  clk: Disabling unused clocks

but serial output stops there and PID 1 is still not reached. I also added
private begin/done tracing around each individual enabled clock in
`clk_disable_unused_subtree()`. Neither trace marker appears, so the second
loss occurs before the first individual unused-clock disable is attempted.

Each run used the same RAM-only payload and was followed by an
identity-checked 120-second power recovery. The board returned to its exact
vendor kernel and eMMC root after all three runs.

So I cannot add a Tested-by for v4 as posted. The `ahb-cpus` gate appears to
be one issue, but marking it critical is not sufficient on this board. Could
you please check the CPUS/AHB dependency and the path entered immediately
after `clk: Disabling unused clocks`? I can retest a focused change or v5 on
the Cubie A7S.

Assisted-by: Codex:gpt-5
I reviewed this report and take responsibility for its contents.

Regards,
Enzo
