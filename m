Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D1746C4BF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529660; cv=none; b=L+xIIf+AcDOy7/F+akv4ac7uRsCOIY/+4Xu+frQ0sZkOTskUI2BQBt4TGxpfKLB8yCAXKCldTGNziYcpDsxzxYM51Uz9IEQXCwLa+lHQveqXazuZ4Tz7ApViTvC6eUH6CblmnMMUudVL6DjAtz5yZwYBN8RF50t8ohn30rK1JhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529660; c=relaxed/simple;
	bh=rzRC9qMt8Wu9IVnepc7Mt/HIZ9DPyWfBZb+4RZC7lNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OhLWRNJD7SsLyKQKhJxbU9YL2cP0wb1Vr9NBAo9UxUy428ABN5TLNeDf2nZqShY4hP8OqXBvZiQ8sPutsqMoj+Ji9MoqO1IY+vX9dvoauGOlGQfIlFT6RhuOMNhZUIrkTiG6+q6agk2pAwWHETvaY1tuS91kNHUAjTpA7SboGhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rutxWqza; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rutxWqza"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso26738725e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529658; x=1792134458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwnmDHh3/boOKCuN1k/oK+tDoPsn5xW+z4VKugONJe0=;
        b=rutxWqza7Jh+XtqfgmENzZTAi0DG0TfQdNoDNJCOHXbVCG69fJo+DvVtzfL9a9J11A
         iuTgpDVC8kJnHLZI8A/87j69my3evr4BtkFpPB5lyu6h1Pof8xLSUFwhHK4qo1OI0jn2
         pchxl1LahI9VzDoVqibe+focdhaLhYdZG9D+CXdMkloGGYAk2U9IxjHyFT3ErdOG/OWQ
         NsMRR7zt/86KaHy1D4rxmhcZ8TNkbcZ97MNWvkbUXZBohVlRRK+mZap47pf33WpaCrrX
         knBouu6qJDgnUy0+8TYe1R0wmz0XNWBe6O5PC2r3IWST4n6idu431a4piToQ4otBNNFW
         +XwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529658; x=1792134458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwnmDHh3/boOKCuN1k/oK+tDoPsn5xW+z4VKugONJe0=;
        b=FISnmHiyWQybDEQTRo8wiqo5GhZB7fDqLbTGth93wFfqhHhCWVI7LXrURaIQBCrC7o
         FyxR1Ua4qKhhwuqwDc8g8R+6GjMfYrbN24pQMq2MjroJWFuFr8PpzKeUSJzEUG4ZbUQ/
         bs4uF6Q0AX5ylCAoz+q5b0EF2DuW9RAq+tkM80TE06cDbah93PCNU4MZDE+9u/WDPquJ
         sKJoX1IXt/nqXaqJgwYoWEQ4CH6zSc0kcorLjtAIne1+PlOHs/fuciLHo4mxNF2nZj84
         JPy9xKzbySFf2887byIEobFLH3hJTciCrHn1iPCC+lzgiShrROaOcZKYfYB0HyMjwQ39
         8eBw==
X-Forwarded-Encrypted: i=1; AKwUvBwAhfG2aQBweOfNwvG8RU1Ey5O2OAqjw62JeZmV4gFb5Igh+N75K2clzsx0ns/XmbB2+xrZ2XmsJULITUA=@vger.kernel.org
X-Gm-Message-State: AFuF++lVhDSSecdgaQpX7uz8c1m5rjY59aCbj5xgS6fCDQ9LkbRm9Mdo
	Y4jZmFc1L9PiRCpuEPHAi9UGbklggsn0h4YQcNB/B4QjJxlRW8AEcm4X
X-Gm-Gg: AYBFou2lgGriPBtOdHTYQG3L4pvjzOv9rlnB174ap1DyfLOVqyEER6u/5GOihr7kvjA
	wGHbsvHe+ce04X46JIVEjQjG1OQi3+cO3w9kVsl2L7FAwsu9gcbp+w1IMo+1Faip1Ej/PvDCxlW
	jK5FUJ/gVdR6iiDXxJApzRRgYlFBWpr3R64WzVK4Z8PXXaVVmL7f7UXQs1ewcdP+uRGtACf6PNE
	f2hmTqh3MqS/AcXUZQ5My0NESRXSI+Vaue+KS7zCwLmdNJMgemWX2PthOUnORx8ood2kt6gz85h
	mOhruTWDjt7hwPWI8WGcBPwfy5ydWGczyDSLSkUkOUZdQTb/7ofdDAhameK0aWlfovT/sAYCPOr
	jmOYTi79bgd2tQtqdAybu7liten2of/BY6ncVleDz4Rwkb9VCZ74YPqHlCdv59hZNyv+u4e/UV6
	y+EAq+a6+2Q1knTaLHDqcMKGoy1XUVx8WwgXO9O5RcWLRO6Ps3gg7hdX61dywtqS0xXa4wOYMMf
	WK9oY1NOtPLcPZK1BQeteGNd0xiesfVvS/7LYxM48d+VjT2SHjliCatu5Z7ZwA0VjE/Bxfm7n8A
	pD5jpJgMCIQf7+br/Fy31n6d
X-Received: by 2002:a05:600d:82c7:b0:4a0:1a18:b742 with SMTP id 5b1f17b1804b1-4a18e4463f8mr16457595e9.2.1791529657487;
        Fri, 09 Oct 2026 00:07:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-233-52-5.retail.telecomitalia.it. [95.233.52.5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18ca4621fsm26176815e9.3.2026.10.09.00.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:07:33 -0700 (PDT)
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
Subject: [PATCH v7 0/3] clk: add support for Airoha AN7583 clock
Date: Fri,  9 Oct 2026 09:07:20 +0200
Message-ID: <20261009070725.13196-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next

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

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  23 ++
 drivers/clk/clk-en7523.c                      | 255 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 344 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

