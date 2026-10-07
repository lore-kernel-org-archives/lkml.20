Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0258442FCE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361592; cv=none; b=hEfIuM2PWaks6qNQuA1iXOqi1afjG2D21qC51gZXZLShvOm6mbQm4/yaTf3pO3lQJ2YTZr/k+5guNq8IRcfkNipvNRLqRbPzRDGVtT/PWoi7e8txTdz2dWzKrjVSViu3yADOHZdrRQStDn8JJN19YbnCh2zs3qlaiewO1mytYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361592; c=relaxed/simple;
	bh=jV4OzbU2f3KQRrFlwjDb/XPZqUZlJnIHXEWJ2uji73w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TdPrL73W3WzN/iv/YbxrjwIHdK+rTDDsJOnxuv9yFGj+ALD37UpVlU5pYSs9DWOid3gOtGYZVUrUYVwKbiFlFv57S4HKV8lGWy7v+Iw3xYmFRNYfq06J8trrEEZ7V/gJjffRuqeCkL8ClEUJZIA1B1/RDc6ZetAV5UYi3bsWP2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3779935f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361589; x=1791966389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBaPp0u4Tgsx6RoTaJszoIAhk3SQlcR8pT28TWFVYik=;
        b=BA88Sw3T/CEu+npu6CLNyEL1174fKoIJ6dYwoTkyMhYyXVth0BHMe5nkmOqwlKmMT2
         3nwbEjqd61Zy5Fu7iwMrviXUtSdbW5XRYyGbc1ShNr/+29M9Vki3YBdK6wqguujiLu9+
         g5RxKGLCyVNuTAgfDYvbjJZ4X9xKuEckxKuPBipZmTq0FPHBb4RjyiW34G2fdnWe8wGn
         +tgjYhpIc/uLqkjfWSPXvpzelXxw+RMRdnPWugK6UYRZwXd75d5JxWZvNFFnKjC+kF+T
         5Wc1cL88AwBSeKAwKhBvsYjOAKbiGY9Cmy0w1pycxrwN+yVLwRiykFRYS/MYG7j1rmZm
         EfYw==
X-Forwarded-Encrypted: i=1; AKwUvBwQL1O4EUERk93jbuBh6fYWRdohfwV0Cqcq9js4Ee5c/nBayBMdcuUmRVjNfEIWJHJAPXKbjUpK9Jk5i4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYMMedJizMULoq7B9qj0pfznY19l7ssNE5UxllAJqe0zcVcbUj
	kXNu+3FYzdYsvxgO+d1rto+QKb1THYbUt9CvXUqpwKtyCXjxigJGtwKq
X-Gm-Gg: AYBFou0/hqNNVRwMXUDAEjgOpkF18V6cDug2FtyVP1rWNzeqr/CdU4CmE128SJ3NFLh
	nJ2sZEu6lDXbMN44kI867/oNjHbkvgdrJtk7Zzk3UDq1M0t0vrdEBqNRkCEzbqkrKg1jJf+BitA
	GSEH1tm6/rgS7nxRq8ooew7Jy0OC4CAvA4QkjPG3Tzy6nqTcgrGLhLoqKHSLAslGBJ1Ofzkvsrs
	Y3prBD2rApbBgqvqdecUDdH2S+0VBG5n0gktn1EdCNzP49GuJF90Jfj8oDeH2CE54Whuzlw/bq+
	IvojxAX4LuQDD/Vl4qzwZnW4As2WB95MGGanqGdRAW255mrZDc6ixQCQgLjFIknxWvpi4lBxGwq
	X8WIjVJfR1d4kwEVsbGBtHmza1G+FX8bJB/u8kioXKHpr6LEm1bQxWtlIUVmwPzLL3/osRanDf2
	UrKTj6232j8sEFAGnPZqN+fUQVpCubrer//GwVZ3izY3gNmLWAYOkKhwvRcZuSqwRawJn4DwBWM
	nr6o/ltnB8aUhkx90DlYh3i4YYgpHobIiUq0d1lEyXd4A==
X-Received: by 2002:a05:6000:178e:b0:48c:5358:f999 with SMTP id ffacd0b85a97d-48c7289d900mr2748455f8f.37.1791361589094;
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:28 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
Date: Wed,  7 Oct 2026 09:26:20 +0100
Message-ID: <20261007082627.63807-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T7 pairs a Synopsys gigabit MAC with the same glue registers the
G12A has, but nothing described it. This adds the binding, the driver
support and the device tree nodes, and enables the port on the Khadas
VIM4.

Unlike the G12A, the controller reaches DRAM through a pipeline stage
with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
clk_disable_unused switches it off and transfers stop.

v2 changes the RGMII delays, after review. phy-mode describes the
board, not which chip adds the delay, so this board is rgmii-id.
dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
properties. Patch 1 fixes that. The VIM4 needs it because the RTL8211F
transmit delay does not work here. Boards declaring neither property
are unaffected.

Tested on next-20261002 with "clk: meson: t7: keep the memory fabric
clocks running" (clk-meson-next) on top, needed before any DMA on this
SoC works: 935Mbit/s both ways for 30s, no CRC error in 2.59M frames.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback and
three clocks. My board reports Synopsys ID 0x51, DWMAC_CORE_5_10, and
does not survive the clock sweep without the pipeline gate. I will drop
or rebase whatever overlaps once we agree. Patch 2 is the oneOf rewrite
Conor asked for there.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

Lucas Tanure (7):
  net: stmmac: dwmac-meson8b: let the controller apply the RGMII delays
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 77 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 22 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 87 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 65 +++++++++++++-
 4 files changed, 234 insertions(+), 17 deletions(-)

-- 
2.56.0

