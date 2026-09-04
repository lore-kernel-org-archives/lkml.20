Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4CA388E6F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565732; cv=none; b=AQmfEOTt2AsB1pbGHzWikw9mT90R4qg8UwqnjOKDRrpYMx3OXWnmDTZIN+aEs+LyV0e6m3FN5Rw7x2TnL/6kQEUB/hfIsZm6XDARvXpCl4yGta57ctc4NgHUlYowAYNZTMHuG4Be8W2q5bZ9+lMYGXa0zLzBsgXX2XoXrsXrCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565732; c=relaxed/simple;
	bh=Ala5/BLJL1vTZTT5rbnsc1HNb2XPUuq3vvbqNTEsGFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7KPk8gH2NqDBbvF7IrSA7GvUgWkyLx6X0L6t152CPEOpAsl7oE2U5zmkPSEyDUHzR0yU+29rqvZrC2gx5UZcxKeUxv3xjzS9GxdCtoYzbY2ll7nRwZzxMwY1W8QXFnvQueJ64Z7nO6jd4PDLhfy4TFRtXYBVzR7UzKsv5itfhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca; spf=pass smtp.mailfrom=justthetip.ca; dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b=c04vP/Gd; arc=none smtp.client-ip=95.215.58.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b="c04vP/Gd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ala5/BLJL1vTZTT5rbnsc1HNb2XPUuq3vvbqNTEsGFM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788565725; v=1; x=1789170525;
 b=c04vP/GdvfLr8sCGvZD+KUBeotH3ID0TN8kQdloK1CuglWGi2RYOrV4UMlQuSqGqAgeSJS59
 GQh4O+UmTg7GMEt8qggQb89VIL/JGt8NmSARJG5qHXgfCyaalhaW9AeAXEpD/we4sqPJsjzJgz6
 Bl7kKRKbOAwrnMGGIQ7wRAhIggg5+VxTsBHeXsPp+k66r+RdxD1egPl0YuoZPD9cizItxOn4jsV
 e9JesJ1iak6LFeFLUhMqHznrbgWkN9Xqac2nyaqOCCfPk84Ndh4spsbDLhTkZ9HZe8/ysI9yvFa
 nJse/347Ctya9bMqsL40ivju4HdgX74sfX65CTL8ktEWw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8d2a338e5845b8b9;
	Fri, 04 Sep 2026 23:48:45 +0000
X-Mizu-Trace-ID: 8d2a338e5845b8b9
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Klara Modin <klarasmodin@gmail.com>,
	David Gow <david@davidgow.net>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt792x: fix NULL pointer dereference in mt792x_init_acpi_sar_power
Date: Fri,  4 Sep 2026 16:48:38 -0700
Message-ID: <20260904234838.19342-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904161826.5638-1-scardracs@disroot.org>
References: <20260904161826.5638-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 4 Sep 2026 18:18:26 +0200, Marco Scardovi wrote:
> Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")

There is a patch for this from 25 August:

  https://lore.kernel.org/linux-wireless/20260825181712.28548-1-lucid_duck@justthetip.ca/

Klara Modin reported it, David Gow confirmed the fix on a Framework 13.

One note on the Fixes tag. The crash needs a regulatory update to run
before registration, and that only started with these:

  9b80bd9cab40  2026-06-09  mt7921 regulatory wiphy self manager
  e9f3f1cc133f  2026-06-09  mt7925 regulatory wiphy self manager

Before those it just set flags, so the 2022 commit would reach stable
kernels that never had the bug.

Your trace enters through the regulatory notifier, mine through
firmware init. I could not find mt7921_regd_notifier_work in mt76
here, so if you have a second trigger I would like to see it.

Thanks for taking this one on.

Devin
