Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D2144AB8A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767913; cv=none; b=jLM/SP4o4rMNTUxCGJTdWMd48zDMZIuLx+pAgD4Mlgnsrji2Vx3L2b4Yx5bH4BfilivA5QeRhkOdp8SidKfqU/kqajHOVCiwvvKllNS3xHFpDHWmOxYWkqgGl5c4CirFBa/2RhQMp2EiZJAPaaEEVheUnP2PBbJxcdXWFp7tXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767913; c=relaxed/simple;
	bh=ZVNY2+/yG00jI7IAjOSoz55pU9oqZXj8cGtvvW9pw7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kk3fEuxSO2zi1sgFZCVCXVdW0lUG0D9HPL4sQxZ0505JbgpYeMdUyFYxmQnZiA9tXHkKL/QAd6W04EEVzBHqMJ82E2tQTn8JGIAiYLVFjqDTZyYPMbsojfvR5dhebtn+dsX29OgCWOkklPCpVG2+ixcex7EPm8Y73qfamXZCSpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovBNARpT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovBNARpT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997061F000E9;
	Wed, 26 Aug 2026 18:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787767901;
	bh=nZebwd6ruNoa8rIVeVdn+NLbkgHyMT/NSExoM1FpYRQ=;
	h=From:To:Cc:Subject:Date;
	b=ovBNARpT4naoCENtSzSe0Nw3JVgNodSwBLDPuCEL8y/dJxm3Q/DIwQic7/C8aFniG
	 BNJfB/iTDammqMEPga7loStr7GRvEmo5Ps+WWObWS1v8O/zZnFw+m2T+gSsd2qpZgy
	 Y+Skl0I3EA7XJk6Zp0kRqUL0MK8PHXFrUFpla0m2u45I/K+yYpQjbzObCu44XBtMW6
	 Bazo6LwlJLT13XCpCnFI0pITVRUsXIkgM8xSF1fe8veRsm0ArI3mBOuP0QJaC6YsEE
	 9XTyZXstB/dRfyJ/Y/viDITMTHb5NNetu7ReTEy1xkelnk4nl9tuV7MuFFnk97qqR4
	 NG4yeGYRtRU4w==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Breno Leitao <leitao@debian.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Thorsten Blum <blum@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] x86/setup: Fix logged allocation range in relocate_initrd()
Date: Wed, 26 Aug 2026 20:10:00 +0200
Message-ID: <20260826181002.12316-4-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=blum@kernel.org; h=from:subject; bh=ZVNY2+/yG00jI7IAjOSoz55pU9oqZXj8cGtvvW9pw7U=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFn92r+EV6WHbcnieaPhXiLyRvVb1UpWrTOng4NadhrEB Ljr71XoKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgIlIaDH8999/cOHlVRxRz710 LT+WPr/00m+e6J4bWn9Lnsn/jGbV4WX4p17+7mF6gP4Odse4fLvKKx1+SkfMFSef23v19qK0mhu 2bAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Since commit c967da6a0ba8 ("x86: Make sure free_init_pages() frees pages
on page boundary"), relocate_initrd() allocates area_size bytes, which
is ramdisk_size rounded up to a page boundary. However, the log still
uses the potentially smaller ramdisk_size to calculate the end of the
allocated range and can report it as too short.

Use area_size instead.

Fixes: c967da6a0ba8 ("x86: Make sure free_init_pages() frees pages on page boundary")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cda6adb9f69c..1fede9834835 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -334,7 +334,7 @@ static void __init relocate_initrd(void)
 	initrd_start = relocated_ramdisk + PAGE_OFFSET;
 	initrd_end   = initrd_start + ramdisk_size;
 	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
-	       relocated_ramdisk, relocated_ramdisk + ramdisk_size - 1);
+	       relocated_ramdisk, relocated_ramdisk + area_size - 1);
 
 	ret = copy_from_early_mem((void *)initrd_start, ramdisk_image, ramdisk_size);
 	if (ret)
