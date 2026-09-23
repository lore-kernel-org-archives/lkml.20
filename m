Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8DF4D4868
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164075; cv=none; b=L1zm65PLY4qiZUYus2CUHJz4lRsLDPWuqgvHzuvipD11p9FPQ8K/1oWVUA6k5ft9rb1aRWTiVqcJjpJm77Pc+sIAJtUQOI+n/rHhreE2iJNnzTX0Ag1+48o8DDRPtH4EBPmjctehzQ9ySwbcDqHbUC4VSfUg4zQsnUoTh+YMi8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164075; c=relaxed/simple;
	bh=cZT48T02//kyUP7uQsqYT8/nIzHSusZ4qfcImmzLm2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zk90VjpbWOXc/GhWwPfSN6g+B+OHgVz3n9tGi5zKn5QUyVjJ2+ndCXYDzdv77SYkg68OIppGHyyJeKGgnG6WIRAjgw4FT73b/j9w4YJ1W2b2x39UqKfYuUC7shf2fk/etk0g1Q6sPuflNiyhdZrYYzXhS9FB2TukCYlacJqaJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=GQHEug6L; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="GQHEug6L"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 53C52240028
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790164058;
	bh=zYMlFnqs2oZLg0x/tmHehi2Rm4IkjdjjLTJ9d7PuzDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=GQHEug6LBOTMrk1vm6jAKSEE8PeCr0ulAkeVjyzlxS7Kd6OcYg2ntcjLTizJHlLPE
	 yvI56vPunD9f/2jcOdyOiUIUCYuOE2BvIWk/B8WcereeX8+UgL8AN/KaEANhgmlwbp
	 XrE/75oaNxdNi84G58fwowg5i34Rs6xgjjIm39AYce+ncHXes8VTDI37UbNXWGR0kM
	 ea2/JmjTUi6ZK35Lq5pHf49oAsFAQUmt7IibvGOuyxVEZerEuwTaBdGTtQCLzfA9+d
	 DaT9R6FKaN9edsb5VxyAc3prAzPfcpMwhZyTHtWcFQvvs+kGji/oUMWzJfaPctEeph
	 6ddq5lGrzxsAA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqZvq4bxYz9rxN;
	Wed, 23 Sep 2026 13:47:35 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2 0/2] arm64: dts: st: add eMMC support on STM32MP257F-DK
Date: Wed, 23 Sep 2026 11:47:37 +0000
Message-ID: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the eMMC of the STM32MP257F-DK.

The sdmmc2 node and the _a pin groups are already in stm32-next. On
this board, the _a groups give corrupted reads in HS200 mode at 100 MHz
without any CRC error. Patch 1 adds _b groups with the faster output
speeds that the datasheet gives for 120 MHz and 166 MHz operation, and
patch 2 enables the eMMC with them.

Changes in v2:
- Rebased on stm32-next, the sdmmc2 node and _a pins are already there
- Dropped the patches adding them
- Added _b pin groups with faster output speeds
- Dropped the vddio2 regulator range, VDDIO2 is tied to 1V8 on the DK

v1: https://lore.kernel.org/all/20260912204454.219606-1-mateusz.nowicki@posteo.net/

Mateusz Nowicki (2):
  arm64: dts: st: add sdmmc2 pins_b for stm32mp25
  arm64: dts: st: enable eMMC on stm32mp257f-dk

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 19 ++++++
 2 files changed, 77 insertions(+)


base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
-- 
2.55.0

