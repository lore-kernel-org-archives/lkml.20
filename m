Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B4455C30F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177085; cv=none; b=ugqs30+1wSbA0zAqMYn7+LR2K408sPT0lCIBSPLTIHkaXzgGDpxWQ4FDpaULWMXmf2sWIDxjWIKZIZwCfcO859V+2trP+IQwMSWbod70kSN62yJKQEgqh2KJMoeYXehLItz9HUervbyNw8F0fNKQrMKRbncT3isV9/HYba9b66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177085; c=relaxed/simple;
	bh=1TB0dQCsEex4z9d2T7MicDM0bu7L8cVlyYH48w+xWcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RhEND4E1uYSK3fuA67afndh2oO+OjlqhOQ2FmzqOFHzGyObvChek2I28DfU+xDHItiiSvHeGhyWDQo0uG3TSYi3fzBXy2r08EHCHmNl02woPh/fJHmkdlviJ4mBHWYwMztSV+Mlq//QNPvCfs0l0eCtbUOJ5/g6BFSJ1vwptVwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pR6bUALg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pR6bUALg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so12192355e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790177079; x=1790781879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pD3CzYR8CXLK1Ll5umgAXWKGPeK6m30X3OIrFbC6KBk=;
        b=pR6bUALg/689s36bRVOvkUfpHIEczjJK0XsnlT1hgOtrwG1Tt7ujYrrlXvNQzMV4wS
         Vl7E/jvC5UREyYABhmpWEmUxnFhxbno4i1qDrXtKipGRb6dJcj3tmDwLyt04JsgHMZ7d
         inXUGLqvyD+QmBpKtGfQK2kKOKeiahTyio8l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177079; x=1790781879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pD3CzYR8CXLK1Ll5umgAXWKGPeK6m30X3OIrFbC6KBk=;
        b=deb/5zHVJOCSML5Nc2t28cXgovAiOjLBwCO/JsrJYrEXPiO4HeeH1JiA4oiv3SQPp2
         tOq8HtSTagXlrf2tw5gr8IMwR2dlFh24cqlxKSpS/TNBylwh89xCNg/TKLvZqxIEWhvu
         9rPCGeg3a9DHztwVsDbfA/+8+chK+vC7rZ5KAjypmUGnPcgadmhhtTW985G+iZw7OjtV
         4zwNmkax/kzUd8OEekhL6urFVkXxhbg2accdsEA2cMV4ogf7nOGOopxDJ6GYRZ6x7XKr
         AbTv8JsSoMrXFHQHVzG8LbZ/uDx41Rcft2be0cErbj9A/yMam7G2bs5v1omStT7Ypxrn
         hQdg==
X-Forwarded-Encrypted: i=1; AKwUvBzd30wudVB5W/hJutIuGZnkwnfFPH5ENHX7rxRbXOckuI9+XHQqCPeuLstDTQwLxnq9//kYQAehPXU6rW8=@vger.kernel.org
X-Gm-Message-State: AFuF++nMznRoW4Flh1Qf2aLbttX0aKZUK8UzNeWcnMbKRRRwyCXeqdZA
	GhjFMSi33hYmIabKRThXgaTs6mbq4JB5bowPObvm9Im8gjrFLIYd46XyoJSE6E/j6XU=
X-Gm-Gg: AYBFou3d/3kwFMumzx2kMRWVvLawWuLK8Hgrl5USgSNMdFh0Mt7UQph4A2VfhFrWLyp
	qJWsAKP1Ct+2bYXrtInaoDj1kCqXR2R38gJiiYguqzbTv5SU5PT0Rf3cifVNNVOGu8Y0VrJJTe4
	CUCw0KIFmV+vX4wWGUwpGZSWv+00h1VVGwN9XdlokDfv7pvXn8UjWtThKB66r7GtFtrRyXfh6iL
	7UWRAMNB/x8fiA5M6G5ByQPKUfAwfzr3zMM9r5hqHkRrRQhOEu4okdRAzj1ergnkWdq+vbftOkX
	mDO99qoXqXvHCeVfdsSk3eij/w+FWU/Hqctqsj3fPn64HSfTtJsv+VmALcGFApS/u8niW7jOyqJ
	HvAglIZSypmasOmERlLgcZ75nMb1FJ480psyMOsTmlHuL7ty4j5SZyjZZPS+outp28PiHnmVgDt
	qYtC1A3E4a9/QKl68OF+tuyHcs6SJC5R4EPDiJB++mfczrOYfsGlq71xaby10VOlW4gDziZyrsg
	bwx7PTXz373E3HdnVyyc15nVZ2WsQsB+TMKZ+PtHzygD3+Jls8uulxNs5JVEdlt9CiJX6hZzH+q
	0Q==
X-Received: by 2002:a05:600c:468f:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49fdee0ab5fmr47670875e9.4.1790177079486;
        Wed, 23 Sep 2026 08:24:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c446e1sm55582165e9.2.2026.09.23.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:24:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	francesco.utel@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	michael@amarulasolutions.com,
	linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 0/2] arm64: dts: st: add display overlays for Engicam MicroGEA-STM32MP257D-RMM
Date: Wed, 23 Sep 2026 17:23:46 +0200
Message-ID: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board is produced in variants fitted with different displays. Move
the current RGB panel to a device tree overlay and add one for the LVDS
variant, so that the board dts describes only what is common and each
display gets its own overlay.

Dario Binacchi (2):
  arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an
    overlay
  arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display
    overlay

 arch/arm64/boot/dts/st/Makefile               | 12 ++++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 ++++++++++++++++++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 69 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 51 ++------------
 4 files changed, 152 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

---
base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
branch: engicam-rmm-overlays

-- 
2.43.0

