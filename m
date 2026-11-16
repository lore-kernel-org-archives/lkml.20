Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857402;
	b=PB19j1ifNoKamkB4YmfKsMuDIaOC1ukSWK64iBfFTVKQON8YOGA5JPme6kaCX0KVRjy3
	 h76h485MYc+Rlaah7v4w/BrCciIJywY7+hkd6lsaXJuE9zCrTx6TDY+x0A++urSyzUXoC
	 enVIVNvUrCTVE7a8iS4Qaza+UiUtxWvzW8HKPGLLxlKHzdlWWtAVJZr/VXHwRd47ojnFD
	 NsDceQxQG700ehXPn7+vdhwaZqIw2xrVvs3b6U45GlJXvWgrUls1WT0FszcHxxUZempvP
	 j3O+Rc57OszW7i7+qI9J6Kf/vIG25mdUHCGpOg1rzB7UpK8rWHzegu7IhUc+mHr4MHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857402;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vJEbZH6eaYa4UjBbDZ8rCzoQ5k9p221jQ4CKj+w5k/c=;
	b=pORKGY3M6mIi/cskHW73m8ENDF0B9sc2hVDFrQHcX5h7vXCGnh3uhOqaN2T5vL28a0bP
	 L1JPVU1wu2cl4mXvRluXCpD5hTTyNCyHa9UvDlGg0M/vlN7ZWMZGhxKLwZYHOEE208Wil
	 wX6Vna5qO0/OClpvzvCBMGzM99IJ0Pm3q6S6hPpnC8Vs5Jt4zHTqGFQmgku/AVjXcYxsd
	 SaAaKIKxPDZzcpzzoz0yOG65NMSfP2pVu58xNhMAUFnjR2o9HQm7aewHkbXd6gzyAcD3b
	 Epnu2GkIZdsbxzMPbABf8jw/x83tWeHI2Ep8FA7GCRi0XlIUHP6DTQpa+4mBpJR5KWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PtkongnB;
	arc=none smtp.remote-ip=91.218.175.93
Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9145606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9145606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PtkongnB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZvntSmCaLaNIEC3B3jSfAuRkr5837gnvJKZs8RlOmFs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857399; v=1; x=1795462199;
 b=PtkongnBsllQIQAs+kqWE4w6/w6Ay2PZB9U8fAeYZfstqKoQTmE9hXtapebAD0kYf2fSpr7z
 eTflYbQIR0Vc8sk92GFVBEfFxdWUp6jMT44CgnvYyyUwVfBjYIZOz1UL+eVwwvi8riAy0dj57SQ
 r3cUavVzkR8+4AeWZ1SbiCXw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4b31c3f78b985d69;
	Mon, 16 Nov 2026 19:29:59 +0000
X-Mizu-Trace-ID: 4b31c3f78b985d69
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] irqchip/gic-v3-its: Free the page when gen_pool_add() fails
Date: Mon, 16 Nov 2026 19:29:33 +0000
Message-ID: <20261116192933.3266502-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116192933.3266502-1-fuad.tabba@linux.dev>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
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

When the ITT pool has no room, itt_alloc_pool() grows it by a page and
retries. gen_pool_add() fails when it cannot allocate its chunk
descriptor, but its return is ignored, so the page is leaked and the
retry allocates another page to leak, until an add succeeds or a page
allocation fails.

Free the page and fail the allocation instead.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 33aa8a355ec65..74fda3a6efed0 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -279,7 +279,10 @@ static void *itt_alloc_pool(int node, int size)
 		if (!page)
 			break;
 
-		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
+		if (gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node)) {
+			its_free_pages(page_address(page), 0);
+			break;
+		}
 	} while (!addr);
 
 	return (void *)addr;
-- 
2.47.3

