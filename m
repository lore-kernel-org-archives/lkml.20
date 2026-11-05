Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880687;
	b=u7Zrjh7+hEUo9NTpFQ8qanIkZGRUK2sc9QVwUyhwlW5gYxY9Xfjgnidhx13l5Cvsgclj
	 KtFfgVSTZoINGUwEqnOwdCBMlkOZ+r/W8aaBJdUn0eXYE6LMHRF9Cmsr+prx3MhDY0ahX
	 tcojhrNjRbafuZ/pcoHUiZcUCIT/qQoZcLl/ikevvsltfPUakactxbSRBE8mdGYbXMvGm
	 ydnlI12LU5RC+ZW5w1A2yvnlNlyL/f/jwCEDywABwmyc/6m78SuFbfneGwt+fejKE1LWV
	 mtd35+VASf+y+4D8E/IAhf+iPuyaaQeZq3L4gu8XocvZzSZ6NCtjfatjnISeOekKeuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
	b=vqMQAgY+yVKHK2ofQThEvPsolBg+U0WHoV5sBa+THxowJ1oSVYyCXjFOPpOMyVnEjEy9
	 PcbFc5fylm/7OYOAKi0vd6zpsa4gi60+/nSXmVSy9K/v0bcI4ppMP3qOq5j+PTQ1/msbH
	 NLcRc9UrwVPzBBpsVwV20fUNS0llraHNPMJ1/iiRco5JTGNN9RGd2AbUG1Mt7XS+gT7hB
	 Gm2wyJalBsDJAMn/uq+ii9GblkNgaGCXMnYK3ATU/Yh61wj+j+CLOKoY5OovenQb1BBtn
	 0Namv+Ceu5m1ec5NdNzIeMXMo6ybXqawg+wcf/QT4xm83YYJ9KX0eRH9S0GUJa+hvEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VEn26V/p";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E9606EE91
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9E9606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEn26V/p
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c1d337d8so836397f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880685; x=1794485485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
        b=VEn26V/p8NYKFjB6iovnRMzQb5XBCGJfH1f7fzdCf1fyjdKd+EI/7GGp9Q2IluxPS9
         XjquYP1XiVth52a9Xe3nW2R8vZ87a/Mm1bgbEd7a0P0WlqgRNKOLdFSgnC9qm6iNS5Hx
         XfRM6cf3gdCv6DLJJ4Pwbd008COZ5BoH03HTts0GjLBxequGn4OnLaYkE4vW+jBn+cs9
         hrWYU8NkgMZo6NUbu8FhM2Uo8F2hOjksf23LsDuj9q9WdRgukZ3qbWEby/SbVXNcNzgL
         ud5zTlb6+hxsDrKj0nQymAPSplNGD27T/w2x+bfPG/Eg61dpkuAmqJ3ggUzDMNX8i3H8
         Oj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880685; x=1794485485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
        b=Vr82ZQQKAqplHT/lNxhK380VTISV0YeptHdmCHmO80h+jeZxwXbtbXCzpM+yQGXiRE
         P0wUZLKpymgYDLw7SDCCkCqiMSpQW9abgY+7FP5Ik+VtRUMKK/+o7vJl8xWRz9kghoJ6
         KPpAp74YWgbRwg3m8EcZnVazKTjqw0aX24V9p2m8hUtUr5g9WXYbWg2DQaJgAAsAoTms
         Ana3Cr/uUeuEobJZ9sKcFveeSUfpQo1UCjA5EvViNfVyc0/2/9yNqMrCQodaWZRVvwdo
         5oLulSGqf34v7+fEtS5hJA7slQf98wdd0G1DT7YhVky84nPYEAWc2j0nvtXJk2oG8aHr
         js+g==
X-Forwarded-Encrypted: i=1; AKwUvBxxk+XsL49RXdQmarIhs3tH+iaIUtbO04HDn+m9FEkopqTsVfZscmTMJAR5mGSBPqlu3lu4RxLXTcYRQt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z94dOKLIFm1ro6PolH0lGN9PssPubyYHKKkbLqsuwUhxBpTqWiS
	kDX/JqEPnWLaR16kJuKA4WivesOipI7vn1EkScMQStDJGRx4MfuDsU7N
X-Gm-Gg: AYBFou0RuU1HQeCR5jmPHTIxe5rLlGBdTep+V3wYrzWK/IISau2WHTn5NMhdV5cBXE0
	QLcj76I+OKFYXrYGs666tkWET0sOtJBXi8+bhgK30vR8K+sj8aDU5gozW8Fs02rPaIKLNHMMH19
	DMGtJBxE4LNCFpkTxT9N1xXnFe2PqIU4u8tmV0V5l9fcml8Oucm6vwc5swAT9sMPhU8m4+qL2hk
	2f+1JJG+hVPkdHzI3sFR2WJ3BywbnhcComieoM6U8ey+wSebmpNWFBk5eE9nQvffJ1HuHRdIpjk
	RNlfI+K+MdG7WDBnFLnWVsgJe2aCHyPyZOyWLko8x6KUZhtmdNSf7W0IjlwLDZItH3g7bpaJUzk
	QKiOj8zvwSC07hlALRKQAk13X5NR7OJdOGNC2z7O7IYvNbEIx2SvEd8iab8n+JaLkxmefv8fBnX
	5E7dGtSZ3uFN9jLRs5KJHLNOJ3J2k+et2rjHA6laU7d9ZLAxhp1TPL7nPZSd81RgWapWI7Ngxoe
	dgn/ih6oLzapq1aLf2MIsMQdyXbVdJOKqtkYWBG9IXegkBCZm4l86yVAtE4piWluulJ1BUeUg3A
	JXi1oxkuxEZIrRCLV/knY82ZRZloX7+6uWuQROtcyx46G58YBndCz+MfvFHpbt/v4sWPVd0SG63
	+5TUIoIOD4YBrRxwoteiRr4sX
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr442431325e9.2.1793880684946;
        Thu, 05 Nov 2026 04:11:24 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:24 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v10 0/5] clk: add support for Airoha AN7583 clock
Date: Thu,  5 Nov 2026 13:10:53 +0100
Message-ID: <20261105121059.11201-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 332 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 418 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

