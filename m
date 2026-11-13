Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585041;
	b=dAulA0Wyam6F5/bDWWTRNzVYqJwWKEzghwSAAfMaXRSIeXoDj1hqTTEsqE798CQOI7T3
	 0PJTUBGM2mw9/Q/U7Rlr2hO84h2oFcPcFSxnKLrcnvLh8HpCV9ZWC9mI1I8tP8hbenSIR
	 hq/0Feym0IlysqtzycXwWPEEJxKHgLLPPxHjfgjRJkuwrlRZzmSjg/tpWb+d8nBdA+AQY
	 R4a27zk9Tgq8KQi8EDp3GDxJR4dbYvDfq2LV4gDsMszOfR3IWnNVWMxLRxMn9n4FkURFH
	 Os5oRaztRtRLLDy6Czm47GT0B9txLbpnWBLncHIUbLycr4x1g2Z8szHsh2t4ouWtJPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
	b=Ei7g3Vbhj0DuVXFom8Ikiu6yvdEqWwNPnKU32OC8E8oUc4lCrkNqujFCj3MPlMNj416b
	 gmxNggCUCkYIuXpSV4y7Owez7bRtn+eHkd9HrkhHdJdoWvQZsLlcQhclTgvFXr86xi0LS
	 K/ASzjxI1y2uKIZ1b6UTLNipXhpYUT+7w4GKX76WNvMyCy9I6WKpDWl8JtT54F6lGVBA4
	 U/yFmcSUlQPYJiZe/1v8ewyb+uD63PAWA9Tv1NjjcI9yD5eT+1a5fWA2na5AaKnlvMK8M
	 j/6kY269HnEdy63AwFEoqs/rMcsuFMrrIfJAG9JQIeyZkslFKQJ7j847zID/HDBYOGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsG3too2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD8606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FD8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsG3too2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so12118445e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585038; x=1795189838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=rsG3too2KgoFZzoonq5v4A4bv6Mik5fbIf8ZGGba2IIuVzhugyGmL+2fCvOWYzuFXQ
         M8f6za2K65AQLfYlduTWD7GzpH549e1AlH+wKoNL5R3C2OrH86ldby5aa0766Rqvk77K
         8rRmXkWDlmcjAGonf0q0hS59yV0uppOtXtJAteYAm13HmuagwsilNVwU4tsYOfHi9oNF
         3a3JiWx/WxrdbDfSFKi3SMXk+AYHGm1AmFTDCd8hOb+LBsFrfNvtmkT5Wz7+3mkos1lw
         HqF3NDBa62+Z5HbdE5GqxY4cfna+hlCuapFxq2yM+sqhzFq0F7tkjxp8eVxoic2O2sLu
         407Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585038; x=1795189838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=ylnzmoI0Ya7lXO0RDqDBHr1byWgWLE8WxjQ3/N0AMtR7dwHUi7fZRCpCCw+juTluwH
         z4YAC0OgHoJn+F43vJutbr2+lk1EF/7NbsUdqiVcbS+wqjpQKp5aJJlPuby9OqNhwgj0
         ExuMm53ycX5cqvgVaAc2wSf8uCE52j+rIE7LW5G3ovAkxg1E/RvDLZ4pCEXk1+6GScIK
         CcHh7maVvbnUAdflr0I09fBmuAuOBxRVUZPxTWLoKmrquCxQqc5nbJ8BzmHyhTtMwqqX
         NODpo+TPGxJWugeT5JwjAw6ew1N7ZEEC76wXcTSQiCc9nUzJMy/A30kbi4IfGF7qiPrj
         ZvfQ==
X-Forwarded-Encrypted: i=1; AL+hErFrcy2KTo4e0+Fs7uKLRQo0TBJt4Iz0UQ2zXAFFomoI+RdjXMj3uIbf0mhVssPIeZg0TyhXEt1xUv/I5Ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hw/kbJijktTxAkHAgrKQpvqz0BYF80+WNwrn6eLVZDcQnce6w
	zRHiJBGUx7RO24yPwBZY2q6/NthdSjyW3qmdTfyU6714e81MH0nqIz2D
X-Gm-Gg: AYBFou2aE23gPax7sXDI8+VY6Y/jMVvX65D5EjdyTJPJDsa76Qtpbx7FHTPGhyHW6zm
	V6lFDwUngA1F3gfVAgWo/iy5GYA34tEKvO2p76iCo8vnSoo1rTLjhZQqhmx2vVdKWHvgn8jFph8
	iVpdMJqIRvBgSvxmHEcujVtrxeJxoOY5v/3NbIGGdkMehmDcl4uG0z2OC1WKYnIWgI/cDwUJhFD
	eBiYzs+KAnocvkuVXIZOU0pA/NqlFeq3pPwHeNHYdqUdvECELuJW68zsw2crdcLGwxefn+YW9wb
	W1NrxkTihyfNpfLaOOeESfwAknkHipdBTXPESPj9F1VmXr1RRMRzFhQpCEhKB3z9jE16PF9qz1l
	cDdzzl3zWNQjkmr9lQLxxYgGscdAiL/K1YmsNt8sCYtWAg+TAdUQ7zdKNltrZMTYDTvm+ezbD3M
	VPSaMEbCZ6VPXjjVKqgJmq8UqY1dsMltF4eYo7myaetqxvHO6AOqJDuK/AZ/hszMctePFWK4rEu
	SBnYP0Ml6VbGxCTHcRruKHsPYYOswjbBAhFn5CPemBSXsPaLFxWlgqg6ss9Dna1UuPKM2JVGr1j
	LnQ1Covg6ElpUSYXhyaR9Bdo4HmzjrhxoTkrBtCWT/fujuYkcpZrFSCCw/BaA7c=
X-Received: by 2002:a05:600c:8b47:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4bb55a7b9damr65527035e9.22.1794585038370;
        Fri, 13 Nov 2026 07:50:38 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm5518477f8f.34.2026.11.13.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:50:36 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 0/2] clk: sunxi-ng: add the Allwinner B288 CCU
Date: Fri, 13 Nov 2026 15:49:58 +0000
Message-ID: <20261113155000.84703-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This adds its CCU.

These are the CCU patches of the B288 series v4, sent on their own so
they don't wait for the pin controller. The rest of the series follows
later.

The B288 is closest to the A64: most of its PLLs are bit-identical. The
clock descriptions come from Allwinner's BSP, cross-checked against
ccu-sun50i-a64.c. Tested on a PocketBook Verse (PB629).

Changes since v4:
- rename some clocks and resets to the names the other sunxi-ng
  bindings use
- build the module as sun8i-b288-ccu, like the other CCUs
- add the CPU PLL and mux notifiers

Pablo Mazzini (2):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 775 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 ++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 +
 7 files changed, 920 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

