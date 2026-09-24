Received: from mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793F3DC4C2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266531; cv=none; b=kJ6OCk3ibYmqCpFSkqum3Iuoz3YlC/gF089px8DUs3dj6guIEsK2H+P5NLCf4/x3mZSOpTZpI5TW81QzzeW+Q8f6IhNAOYtRnxDZ+yvpuFJZXdjLwnEdH+cfleicBaIniAiU+p9Pbm2zLPshfnzkS60mLMFoKAlO7s8kW/wiJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266531; c=relaxed/simple;
	bh=pA+73TkIqbFf0NM7bziE93GdtfVOjhH6bzAEwWZEJ74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aFcC4vImqc4NaEHUSJ58Dxnt0UyfCGUX4Iq1T2zIk4g9R8kpQMJDpy2e7JFdRq00EyLSe2NjWTrPbc1crhHzbaBfOe6f6VpidkpJbBQa+BA72F6CGe/eN73Fm1Ii1ReDAYFDIoPoEDNLax5TFpmVmC4i1R0XB45hABH/yLTnD+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K7oADMKF; arc=none smtp.client-ip=95.215.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K7oADMKF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pA+73TkIqbFf0NM7bziE93GdtfVOjhH6bzAEwWZEJ74=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790266527; v=1; x=1790871327;
 b=K7oADMKF22h2miGvoGf8bfDVsAWuHf4oTPAtWweFkoLEtYR+yxHkFKZBQDn8zugJzNoUVczs
 xZobrr2RIbpa5Qmd9nz6W3HmgZtBTQP4VpfIL3++gdoXr2dIdP1uVewxRP6QbO9zl2cqqRo0Bm1
 GX8aJkLlx2fKhCEQq+l6msvI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cf2236c452ea164d;
	Thu, 24 Sep 2026 16:15:19 +0000
X-Mizu-Trace-ID: cf2236c452ea164d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] irqchip/gic-v3: Memory-safety fixes on the probe paths
Date: Thu, 24 Sep 2026 17:15:11 +0100
Message-Id: <20260924161514.1112730-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Three probe-time bugs in the GICv3 drivers. The kernel keeps running
after each of them, so the memory involved is live rather than on the
way to a reset.

The first two free memory an enabled ITS still points at. Boot carries
on because its_init() discards a failed probe and gic_init_bases()
discards what its_init() returns. The third is a write past the end of
redist_regs[] for an enabled GICC with a zero GICR base.
fa2dabe57220e's commit message says such tables exist, and I haven't
seen one.

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

Fuad Tabba (3):
  irqchip/gic-v3-its: Don't free a vPE table shared with another ITS
  irqchip/gic-v3-its: Don't free the tables of an enabled ITS
  irqchip/gic-v3: Don't register a redistributor that was never counted

 drivers/irqchip/irq-gic-v3-its.c | 16 +++++++++++-----
 drivers/irqchip/irq-gic-v3.c     |  6 ++++++
 2 files changed, 17 insertions(+), 5 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5

