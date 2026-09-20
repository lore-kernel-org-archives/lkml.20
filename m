Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DD03E49EB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896010; cv=none; b=rdC43lCLsxbf19CVB/qfb44k99VnHcDoISiYog/CZ0DprKltHTarMvRsuP9tmvpE4S8nmHcuH3ujYGKttNS1cBhXq1ax2terfzqsQJ0biWXJjOIrLLCNitcS074XT/kl+yKKYJ/nq24K0oDkQAt+ORFvF82I+gDhdWVnCxu+UTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896010; c=relaxed/simple;
	bh=sRks7PPsIcvc9QT3aVnC7zBskOuAi2/FXpnL/DbDQLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vd7zvQKbvdw4qA0lwgpHHPyMAEvuXvh/ehy2MDVmH/R6UaG7C0M2JFbDRbXAf8nSff8ovrbU9dxFOU26X6ZVD/IblHQXIORnQjhOkS1MMjROb0km/1Mi2YG06VGt/M7ykFjC1skpY5xyeSUQzw6sxccXUs73MPIvr92bPNNoiB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=GGFaukXB; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="GGFaukXB"
Received: from LT03.fritz.box (ip-084-119-040-110.um24.pools.vodafone-ip.de [84.119.40.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id BAF2D3F29B;
	Sun, 20 Sep 2026 09:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1789895564;
	bh=+Kg51sW/FIPcwA/8sbO8+A32T4om+rsz1m4RixU0WNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=GGFaukXBoHbK5UkBHvJXmHihTiwPyxwyteUHxL7NV9ilv8AEjCUlOUpj3cV8BDawz
	 2/MREUPQBSxrsdzlYT3kvG+zvrJTIx5dlyxMVch2Ms019GHT7Md1AdIrF7UmIrhfLl
	 zOS4fOOzKAbeOgViepBYeEDegJaRQvgaJALNKPjtswpc89xKwduLjA7kcLe5RFdS09
	 LbNoyCH+VcpVSX7vcU2IaiAvCE/U5vk0KdPAaHdYRgU6POgAVBhRllMVYg2HW+cTXy
	 /thvvtsfoiIbW3RHvlAuhelPbDRzhW6utprZon4iut+DsB8PmAoOETDFkOAaRKaszz
	 /BfIg1HvM9oHNlgsiLGd4cOiJN6e4exCmle/hOKubQXc3mGvnFGtM+2kSwNgE/vWn6
	 OXztzsqskFqo2HiQep3pvvZu5UkZt6wOEKQ6RHgqILljE/z0nN+U5w8xRbf/zALqAG
	 CSXhp7QPJV5CPgJcmMUaQ19e85VxGmtSAGb29bW4hLcVc5hbyp6BolZIu624KyGNBN
	 68iGbhh5qfGmJebkQaPZF5TWy+Zgeg42XnFmglXa9h+0MWO925NhMFS4D4lc11TXBH
	 6BsJ4yuswUZd16S60vEjeuub9CbYfz85YlijRK9JeeKVNV1RUlbSwKORNUub8sIhQh
	 wdR+BsboYUUbX2vzOlFMJlyM=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] loongarch: efi: Set NX compat flag in PE/COFF header
Date: Sun, 20 Sep 2026 11:12:37 +0200
Message-ID: <20260920091237.136637-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flag IMAGE_DLLCHARACTERISTICS_NX_COMPAT informs the firmware that the
EFI binary does not rely on pages that are both executable and writable.

As the Linux kernel neither has RWX sections nor needs RWX pages for
relocation we should set the flag.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/loongarch/kernel/efi-header.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/efi-header.S b/arch/loongarch/kernel/efi-header.S
index 6df56241cb95a..c041dad5bbb6c 100644
--- a/arch/loongarch/kernel/efi-header.S
+++ b/arch/loongarch/kernel/efi-header.S
@@ -51,7 +51,7 @@
 	.long	.Lefi_header_end - _head		/* SizeOfHeaders */
 	.long	0					/* CheckSum */
 	.short	IMAGE_SUBSYSTEM_EFI_APPLICATION		/* Subsystem */
-	.short	0					/* DllCharacteristics */
+	.short	IMAGE_DLLCHARACTERISTICS_NX_COMPAT	/* DllCharacteristics */
 	.quad	0					/* SizeOfStackReserve */
 	.quad	0					/* SizeOfStackCommit */
 	.quad	0					/* SizeOfHeapReserve */
-- 
2.53.0

