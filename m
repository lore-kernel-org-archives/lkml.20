Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A942AA9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508254; cv=none; b=Z2XfbtPBweM/DLwJft6w9A/rPcenPZqP/N00dSpctevo5UTMAGpf60bofrcf2mtpYWspNbD5uyPnhhiADj+yz2tATcPYg+UftXj17+32haahDz1pXi9W3RNBEPUG4l9mJgtNUsyxKZ+qFVcbYvWnRMDV7OqRWn+pDXYn8E2DjHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508254; c=relaxed/simple;
	bh=GIdQrRVgD9PMraq6Zxwt3N33duEKD7zCYwGPg92ET0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dZ+vZXY/beyJu/7i+UpHaduwIkMpAfRWYYlkijscZWu6BN4X+hqGqI5UEZiLpmQUWghHyQoNzuqr5qMRAvLtfOyKc3hf4DFQzZbnWcSSDsO3z3PNrU5zAQwpqzh+czmL7vGG8C1jJysNRSC3PdTiPiAdgZHUo5EYoHOgZIlCjps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hkW0ryOb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hkW0ryOb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=qSjdS+jjbWu2dBBtAcqMX8OeigCICcsVNMw5EqE90jA=; b=hkW0ryObarzrgu2IO6KUf746V9
	zXWkoSJ7DMHPJ9kZ+2R6JkhqcHpx1Cb+0Ml5ngQOCn0JP4UJKu3ePsyeJunC9IIGvPYaPw8JktgxY
	uAIi4t/GaZKGYHwEPDu77YerwxpwmCaW+bLlmPaig9if7LBxKkmF8v8Pmh1syxpXfdqk7NN9xjZDF
	9w+LAwb3dkQk4yIUFBUgZgdRfjg3Yulh+7iiN+MvWF0moLBCAbzn7huQr/bv0PNFnNHX0duKDQgbL
	eKpDhzdA0U9hX8mVyAyFVzrMDHb5mTtNChCbyZMOcTi8pMcZebKJ1NjmWr6ktbYawcfB/t24LnGB4
	CkzfEKFQ==;
Received: from [104.129.159.233] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEz8K-00000005EC1-072V;
	Fri, 09 Oct 2026 01:10:48 +0000
From: "Liam R. Howlett" <liam@infradead.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <liam@infradead.org>
Subject: [PATCH] accel/amdxdna: Fix Kconfig invalid configuration
Date: Thu,  8 Oct 2026 21:10:10 -0400
Message-ID: <20261009011010.3521631-1-liam@infradead.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amdxdna has a soft dependency on the amd_pmf module.  It will use an
exported function if it is available and fall back to another function
if it is not enabled.

amdxdna and amd_pmf are tridstate modules supporting both built [y] and
modularized [m] in the .config file.  Since the amdxdna decides to use
the amd_pmf if it is either a module or built in (see
drivers/accel/amdxdna/aie2_pci.h), then there is an issue if they are
not compiled either both as modules or both as built-in.

Adding the optional dependency to Kconfig does not allow the
configuration from being selected.

Fixes: f66d6cc6891e4 ("accel/amdxdna: Support sensors for column utilization")
Signed-off-by: Liam R. Howlett <liam@infradead.org>
---
 drivers/accel/amdxdna/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/Kconfig b/drivers/accel/amdxdna/Kconfig
index f39d7a87296cd..eddff490b4f75 100644
--- a/drivers/accel/amdxdna/Kconfig
+++ b/drivers/accel/amdxdna/Kconfig
@@ -6,6 +6,7 @@ config DRM_ACCEL_AMDXDNA
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on X86_64
+	depends on AMD_PMF || !AMD_PMF
 	select DRM_SCHED
 	select DRM_GEM_SHMEM_HELPER
 	select FW_LOADER
-- 
2.47.3

