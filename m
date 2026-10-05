Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552D43F089
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240046; cv=none; b=GQUkn7TFlHDsUWBxFS4WAn1hwQxzMkBcBaBW30KxN6CoBz6PcfhcDB2LLPGPsv5ZHFdPXrwi0YA72fyx6x2ZNdrJeZ+vTf+UO7gVfyvnZ5JyjTl66PUy9fZtq7MYiU6i+8rp5cin1kVW9U/O5Y04E25NDaqlomG5xF7cSpbEpWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240046; c=relaxed/simple;
	bh=Mg+xLhEBE+iNwytNcOclz0X+Cg8TFYLnf/u5pFemE2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=So3912pBXysXQQzqZNAd49snD0FRQM2SAQ6U8TR8Obnrh4VL1asKSwl2kgbeZHNEClKRuznkBkkVKxDualO/theiMxh/kcc3oy9QhxuLYjzAB2UzevY50GeDdYr/byyRT1XUsxnvaexxLBjgwPnsG/j+ZRXV1WcISv7gILGc2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rncpOBWD; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rncpOBWD"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1217721a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240038; x=1791844838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3O5Pix90BvrGtShH3HWLTeak2Koa8dPqPpawpalPiLo=;
        b=rncpOBWDD4guQAl4cXfmq+OfSC3li3I97OqdWoHyQrvDGtZe309Pwi9duLbt/EeEdX
         w775WQ0e41+j3cq/qF75pM6KFF9jUhW/cP0ua7IfPRLzptVthPMAmd+jQgNpTWlW1wMB
         yGCDCNyFpSrhjsi1ErOC6dakngdCqFflWNk0Q74yKP6fABXbjYtbOIK0NAKt2FeKP8OE
         iATZR3DClV1HuNgdtuM0Oqr1sTkmgDDOy0VUuAkDtwEcBcXL9n0goH/14qppuadiOAX7
         xrlax/uQrHoKl53isoCK0Wn914zWzKIyQHEjObgHHCQYNafbjMqqtC/E//75t4vBVn+W
         Sndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240038; x=1791844838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3O5Pix90BvrGtShH3HWLTeak2Koa8dPqPpawpalPiLo=;
        b=TUAQOSHka+s66TA8bPVu73VtSskYM/QB2KBwTqPwj1Ft3qjGCfnUtIa1NkLCg943X2
         MauLbdA0Fg7rCXzc+KpVhXtFuXHmspeLMwdsNDOabpWkY3MZ5+T6Sj5Cb6pAL/5BvOVf
         B6RCuZnYtz+rSZpNY8fQuGss5bD6XzuxEnuEYvnZkW3n+kWUBN8imrnNeZJS4G9oxebO
         zbY12S6kNaGb3/N++gNHvT3P0bpbsgVaLrkYvNZuQPXHF+aMCgBmWGrjtZ7+PoPTyp7j
         L205S4e7C034KSiNkmtR7SsA0gCf/TJgXdf0qocHyWakdnwTywBb04uu3fAoIvbCdd19
         XU/A==
X-Forwarded-Encrypted: i=1; AKwUvBzUT+eVE4lfI8/2ZTi4h6/fODZpiHN4Y+C5lceioHchh3hH+Vf4K1iVdZdAxOw28nOfLJmHVxQF9GmPsSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSaxGujnWHdysVLxcPpevTnRpHJrqFSu/yijsJ68IempLVTOPP
	DYZRZjlbYMzZ1PhLcNSRC6G/O66KqDrV6Gr56VRQACwj3dvWXHtysMr1
X-Gm-Gg: AYBFou30x7xVJJIxSIt9DBcTl8gE5rY6UmG7gmiY9hv0i5VSxCSp/xJm3qv2Q2hbIZ0
	aSFOpqYRVNfO3jPOIqZOKrVxGxrmLFvhn6+KlJUcoqEVrlwFgrlFmJxskftqDsWQ8wUuxsMUZSn
	s/oHNUYXMlA+OskWLaYBIlLxl39zdul/ukOrHq15iHtHZD1O/4y/VafEhVJetIztysOHliUy/F+
	Gywz33Jiv1LGugLYaQzAI6KuR5h8Faf52Gk1m1HfIlbHBb6CqWNKKvkllS7I28uNtv4d3avI9WO
	9xB1RZLryBraiY2+bgYwJbcPUyrb2Zl+BVxXvMuyO0zDu7xjYxbDsD1W1kv/Ru2wvV8z1HV0VnZ
	h4GI3b6sm+9VekBrOyfGAIMe0I/TlQ3nDhaxHWGLIoG0xNlEfj3THyOJxZhNz2TzG4RHhVNDOK1
	+EZC3oNFRMP6LOl62k/VX2p5ycIx9U2iWxRyQebW7YFHgRV3vL/PZrDU74faqQjQOdZC32
X-Received: by 2002:a17:90b:3803:b0:3a0:7591:ad7a with SMTP id 98e67ed59e1d1-3a6ce3b92f2mr9535670a91.5.1791240037537;
        Mon, 05 Oct 2026 15:40:37 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:37 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 0/2] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Tue,  6 Oct 2026 06:40:06 +0800
Message-ID: <20261005224008.1140250-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the RK3568 XPCS and fixed-clock nodes, and enables the
SGMII LAN port on the Ariaboard Photonicat.

Dependencies:
- Generic PM domain (genpd) changes:
  https://lore.kernel.org/all/20260925041751.495818-1-coiaprant@gmail.com/
- PHY binding+driver (Naneng Combo PHY SGMII MAC selection):
  https://lore.kernel.org/all/20261005221229.1095843-1-coiaprant@gmail.com/
- stmmac XPCS lifetime management fix:
  https://lore.kernel.org/all/20261005221749.1104430-1-coiaprant@gmail.com/
- net-next series (XPCS glue, dwmac-rk SGMII support, pcs-handle binding):
  https://lore.kernel.org/all/20261005223011.1124347-1-coiaprant@gmail.com/

There is no hard build dependency. DTS validation will pass once the
binding and driver are present in linux-next, which they will be after
the PHY and net-next trees merge.
---
Coia Prant (2):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 74 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 45 +++++++++++
 2 files changed, 117 insertions(+), 2 deletions(-)

-- 
2.47.3

