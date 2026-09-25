Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5BA33E360
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326213; cv=none; b=JJx8ojUMQOB4VlP4or43EhtpEQSx/cJoPkHinEqAxtodrQzkuN3W46h5QJwfQsTWNfBFe+znDJ6cIWRDu4QlF9+d+32bsOwXCod7y5yMCDsxCseQFH5mOt+Xo37PNdsfsZ6yYbRb2n77HNDM3IRWSpqQwB0zHCvvXuYxNNqlLwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326213; c=relaxed/simple;
	bh=rRm6aorR1hdkLp99yH/Vma+YSAO+HZz/IxZQot443Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bK4qYT/QB5Uq3HbkpgCEA5+8NNSyHQTRUG2AQ6O/wCj2CX3eblKzU1MNvDzG5wywvJGCWuAtMvFqPqp4dXcssiY5jAYlfpfNGRwFzXsfISjkTtosaJnhBschE0iu4BmjsR9dvWqG6gAboitAkGhd2dzBIU0vH9rj5E9MqINZxtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BujQTQm7; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BujQTQm7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rRm6aorR1hdkLp99yH/Vma+YSAO+HZz/IxZQot443Oc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790326207; v=1; x=1790931007;
 b=BujQTQm7yap93XmUa72Z6tk+eKnsIEwFTwVcjcxxA7yl10Cxqe5sDitF7qveBI4ehe/MmRPr
 CrAzRWEwIDJpLJhG2lbTvh5/cwvv9L5lFQ09MynpdgRzZ/yf8QC7A+TEmqsi8lIkargCmJveE/G
 Bsjtkh9IMumwfMI2htowMErg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6a1a2773bd8065e;
	Fri, 25 Sep 2026 08:50:05 +0000
X-Mizu-Trace-ID: c6a1a2773bd8065e
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
Subject: [PATCH v2 0/3] irqchip/gic-v3: Memory-safety fixes on the probe paths
Date: Fri, 25 Sep 2026 09:49:57 +0100
Message-Id: <20260925085000.753400-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v1 [1]:
  - Patch 3 marks the skipped CPU in broken_rdists, so it's kept
    offline. (Marc, sashiko)

Three probe-time bugs in the GICv3 drivers. The kernel keeps running
after each of them, so the memory involved is live rather than on the
way to a reset.

The first two free memory an enabled ITS still points at. Boot carries
on because its_init() discards a failed probe and gic_init_bases()
discards what its_init() returns. The third is a write past the end of
redist_regs[] for an enabled GICC with a zero GICR base, on a MADT with
no GICR entries. fa2dabe57220e's commit message says such tables exist,
and I haven't seen one.

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260924161514.1112730-1-fuad.tabba@linux.dev/

Fuad Tabba (3):
  irqchip/gic-v3-its: Don't free a vPE table shared with another ITS
  irqchip/gic-v3-its: Don't free the tables of an enabled ITS
  irqchip/gic-v3: Don't register a redistributor that was never counted

 drivers/irqchip/irq-gic-v3-its.c | 16 +++++++++++-----
 drivers/irqchip/irq-gic-v3.c     | 11 +++++++++++
 2 files changed, 22 insertions(+), 5 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5

