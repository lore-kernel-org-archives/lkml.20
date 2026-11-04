Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811558;
	b=YHyhFIpOCrAGq7dI1mhTvIEbGzlo47My/o8yhf5c9sfMvds62vJKKDsxKAuJkUIRiaJd
	 5mFoEdRuIXZYb2QKtoDVxXt4TxqZcI4v+SumXTcCP8bM87n8Baowk1MQOKl5VyeSkqjfU
	 JYwnHVV0ef45dCxnJmbq6Jz+sELYvtTNxR5pc/zIlo4WonD+w+we14vomhyBKwuw1o3mi
	 oqhOLGUaTr5CvAR1DAaVaVmxdm42ZfrYcEBv+XKid5ByJx0SjhGcJde9cV0lxU/irt8QD
	 g8g1xBH2vdZzL5mJ4JgR/FULXpqQMhFO6TiSR4Yoi9pcjHhwFmgkxaVsP1HgXNE7sRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811558;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=UvNnba0EFtPx2Ttq4iUvrOuj/mWd3NJj3S/pP9tLcH4=;
	b=CpSr8lAya0lawH9VLIZlJEccnsxfBP2EKgTucYbE5t8zWTJASfiI0YxLrdQiFPAYNaFV
	 wFF/gKJzBaUqSLDkOsRQE0EoOTagIqn99lfj5f6GQ5EbCGk8E79/x0KsE4i7fXW6r1SEh
	 2bDo+sHI9d5mBMtDmG/fZIuHEX+isLcTRmJ4L0uqA0z4gTbdTOVinpOK3aBuKqrLmaWD+
	 Y0HsoT3YsXuq9n9vOy1fkD+8WO0zam16VS2jfwRekoJHjXpyl0mXxiNxFGAsEy54rrhGN
	 Fuy7955evxqYPbgXzo0s7Nmhf3pT32HzMbGkCyf9x8iuOstnmoemCp7BXNYjAFKmfOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gwY1dU+q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE73606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gwY1dU+q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87EF1F00919;
	Wed,  4 Nov 2026 16:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811558;
	bh=UvNnba0EFtPx2Ttq4iUvrOuj/mWd3NJj3S/pP9tLcH4=;
	h=From:To:Cc:Subject:Date;
	b=gwY1dU+qAqq5USLQTWEwbIJPYNEIltc4K8e7ccLLeB56qwfVFpA8C9z4TDRsX6mpv
	 harkVkIRnR5EwVQzUSd3+sUO+o95GcDlN5yk3FFn8ngnlrR1N/46OhVWGnVRbYJ+Mx
	 2jwjXbdtB1Gdt//kkHsUoLHDCFs7hO4tmPcmGij1XJYTf8q1sOg8KE4GRbbH36V6pl
	 ipF3/zhN62XKfmQFXMrHH0KxjnKJNe/L+BsrL0X96XxWCKbQFAK5f5Sk9wl3TWMueh
	 EZwoN7Li8wIpoermYTwArOnLKsRFIFLsuP7PWVKzVxhbU1+5kzKfEhaQ2lvAbCNUoN
	 Elw1amSzfPWDQ==
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/sysdev/tsi108: Remove redundant 0x prefix in tsi108_setup_pci()
Date: Wed,  4 Nov 2026 17:58:55 +0100
Message-ID: <20261104165857.174285-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; i=blum@kernel.org; h=from:subject; bh=sIdgCzeQJuWgAZs8h8jZbRe5apSi7L4o6ofhxV6hh+I=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmvU4IubnslPW2KYtSBXWcTn2w642/Antp1x+rzpjcF7 fW1zJqBHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRh+oM/4uynnUbrww67bTB pefIpQ/Gy7Z+2NvY/yiP5+asdPtAPQuG/yFzAydY75v+uiVec46/qE/8lbU1kncuCK36r+cUub7 ZmwkA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The %pa format specifier already includes the 0x prefix. Remove the
redundant prefix to avoid printing 0x0x.

Fixes: 55d8bd02cc1b ("powerpc/sysdev/tsi108: fix resource printk format warnings")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/sysdev/tsi108_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pci.c
index 07d0f6a83879..dcc5e3e85dbd 100644
--- a/arch/powerpc/sysdev/tsi108_pci.c
+++ b/arch/powerpc/sysdev/tsi108_pci.c
@@ -217,7 +217,7 @@ int __init tsi108_setup_pci(struct device_node *dev, u32 cfg_phys, int primary)
 
 	(hose)->ops = &tsi108_direct_pci_ops;
 
-	pr_info("Found tsi108 PCI host bridge at 0x%pa. Firmware bus number: %d->%d\n",
+	pr_info("Found tsi108 PCI host bridge at %pa. Firmware bus number: %d->%d\n",
 		&rsrc.start, hose->first_busno, hose->last_busno);
 
 	/* Interpret the "ranges" property */
