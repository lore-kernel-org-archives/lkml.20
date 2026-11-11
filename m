Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398979;
	b=v4LRSceYbwh8kuwJ82SBFnAwpp2dQ5yxp2vqzaHNlBR0rHffnkxbUNG28UfUux08biAg
	 5cBq6C3oKURuUuGE/AIi1sC912jrPujReIxtZKHvHBCrpJT57M6Cnnpr/WvS+5hDs2sYD
	 VKu8hDhLlGACMSj8wVxgWiJdUE9Ni1iyToMG3MOifb9Yuecj7XD1SrQx09aHzVXZ+kLLJ
	 7cK9aBQQ9Mcf2Fww/w4HTWFzeEgStte+8pKPuVbPAFu8hUpWJGkET6AMlUtbGhixHQH1j
	 kBti8YW41ZGR0kjUwixIFEV3d2dLoPtfnEscD4H6FeH3aPyxBz0gxa8ufEcwdO8uO4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398979;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=9Zel7mapNneHNU1zsFcA6/Cil5Rqn8iobmE7NXg3s0g=;
	b=omPxx9rQcKM9CPCtNv3j8aWqLY2P87jGRO4sWMEl0PtfYy2o+EqCC9Bg/mtpCHJbeO5+
	 Xc0mUUlEC9qguNlxlboKQHmB5XeBJlVdx/moHy0otPtj1O06auysKWycGS817ZtwfnKJQ
	 yBaXB/WklHs/YI9YKCJS0JtmulYZhdpIWajH8XWNgMvWACZmItQBWiRevYPb/NFe1caIW
	 08TMA0QVfEekR6N4ZiyhiSqXTY5mp0yyXYG3upnZ06sCZUP3z9T1M1Du4e6Tto1HpiLzV
	 6l2szdm0riS/u5DztJR0StU/TpMar5Iqnrvv3oYXFJiDso9mTQwt4HLJ2F8QuKRdSzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=michael.haener@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=TrB+SeYv;
	arc=none smtp.remote-ip=185.136.65.226
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35F606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD35F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=michael.haener@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=TrB+SeYv
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202611111209270bc01afc2f000207fd
        for <linux-kernel@vger.kernel.org>;
        Wed, 11 Nov 2026 13:09:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9Zel7mapNneHNU1zsFcA6/Cil5Rqn8iobmE7NXg3s0g=;
 b=TrB+SeYviLzQFkrb6weJdov/oWLhJArf3B/HcX1Xa22s9dHv7ZjpsTcGoLB4p1jwDriJHJ
 bdtp0J8uvxUSc/tfkv8BOJYy1gp1p8c9canfXMMiJ7dD0AlTlCbWGI0sbSZynFSLcojCtR15
 qAqgc5W9QBkqJb4bZ1HtSq/KOJlk3xdnadw+9HI4c72ciXDxEPyg8qqGwF1RLkZaZC24ptRH
 HnXF1XwFK8t4zt9zN6ZxQVA11hCOi1UYbvTF8T+bhbBaRiK+rZclNtWi3pTRZKQU3fiVhu4a
 m5XA8rmqzm4Mxi+XCcq+rIOS3u6nkF8ZXHeJmaesET8Ft1hIG/AsZPeQ==;
From: Michael Haener <michael.haener@siemens.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avri Altman <avri.altman@sandisk.com>,
	Luke Wang <ziniu.wang_1@nxp.com>,
	Michael Haener <michael.haener@siemens.com>
Subject: [PATCH 0/2] mmc: speed up secure erase on ISSI IS22TF128G eMMC
Date: Wed, 11 Nov 2026 13:07:57 +0100
Message-Id: <20261111120759.100830-1-michael.haener@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer

Secure erasing a 33.5GiB partition on an ISSI IS22TF128G eMMC (NXP
i.MX8, sdhci-esdhc-imx) takes 5-7 hours, because the request is split
into roughly 10000 max_discard sized secure erase commands, each with a
large fixed overhead.

Patch 1 adds the card to MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME, which
brings the same operation down to about 6 minutes. It is tagged for
stable.

Patch 2 is hardening for the quirk: with qty no longer bound by
max_busy_timeout, the 32-bit erase timeout calculation can overflow for
cards with large ERASE_TIMEOUT_MULT * SEC_ERASE_MULT. None of the
currently quirked cards reach that limit (the ISSI card is at about
half of it), so it is not tagged for stable.

Michael Haener (2):
  mmc: add ISSI IS22TF128G to fixed secure erase time quirk
  mmc: core: saturate erase timeout instead of overflowing

 drivers/mmc/core/card.h   |  1 +
 drivers/mmc/core/core.c   | 19 ++++++++++++++-----
 drivers/mmc/core/quirks.h |  9 +++++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

-- 
2.56.0

