Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404223;
	b=XCIumGlhLpqD3E+IkHlFs3P1Q547unD55gMsRR1Oz72Epy5XEuoMLmJaSznxgew6rxVw
	 Dd59ifHfKNwAVs3TMj99hv238nasq+tepBowP8PlUvdA2VmJkzNY7xKOfvEvq+MiRakkn
	 6t7vVLLjMhncxpwBzhh83fBqYi1xWtRHdIkAM9oVxeVdBXd5siSoEtxZl41WPB8vpRx0q
	 noyIlb6US/ntbiG9+K/1Tn+iimDLWgujF5YARTw6xiWorDEaeJXO+OigRyPmsTC01Oy/O
	 Y2BXTGd0Yd55iRjstObY9DUBRAtKePKuuaVLmMR1LHyjTpr8LKmY4R6At7InAVIxUXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404223;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=wfWLdiHNFBQdWNacF/GCPagly5pHlhMKOHF4T+ktheY=;
	b=TLPneuI+lzmOxveunwIEJyH0K2V3G8LIgDt0PIjX/fjKyBhBzSFTFLNVw4ZkS3YpekJp
	 HlI3QlTuMdq2RdYRohX65f4oCkP6n1ehBhf6gQwac/uyiJ8SZ1qh3CUh4gxmihg/H/tBA
	 P+SNnQeEq+TEgZj+CkzPQ4kShbZ4rrNLGp/zLaxnlqKvKK3eXPd9iHHxE4tfP3BS2JT/o
	 HCrIPpD5lMZdRH2EVoDLa4EBU6jta0tUbrqQ3+1QxZgZeSZP4X+1egpk/bltl5DUN6GVz
	 Rz5l5rcM9KTlWzjtXHcLtq9vbnHjARj3ivOcB1Qu/U18CSX4hdxtMx3GfGBVGnWUT8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5R6pmsp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9C606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5R6pmsp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86CC1F00A05;
	Wed, 11 Nov 2026 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404223;
	bh=wfWLdiHNFBQdWNacF/GCPagly5pHlhMKOHF4T+ktheY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h5R6pmspt2PC3yM0LxVgrf0VkpV42K2HhwlvbJ66y47F3WXycOS47E55VN1tjoVKe
	 rcpVnQlipmxjr7cM7Spd7HGpOM1Jtg8kfk/Dn12uuVFo8SCnlOyaGmopcv/MKaSnPD
	 ND5eShIOGxbQ9vWg1VRxHKXFH+zVAgM2v/wAn/SThnKqc2SfAplA73fnky9mSxfkVx
	 6nH9NjfbMhttA3l0xMFpfvHqMtYp5o7SKtfLH1IphOjrdRskeQpKCMZ2G0i64lCTXn
	 y1+PgNW9bmW8Y3LzilF5wPc1oUjeP4wYTHLVI3bBhK0kQ+xO4a5NSKLfQ5jlA+rHHD
	 6rd0YGAqY2BIA==
From: Thorsten Blum <blum@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] x86/mm: Convert printk(KERN_*) to pr_*() in initmem_init()
Date: Wed, 11 Nov 2026 14:36:35 +0100
Message-ID: <20261111133635.75044-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111133635.75044-3-blum@kernel.org>
References: <20261111133635.75044-3-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=blum@kernel.org; h=from:subject; bh=t/825LBm9ZGT/1Vvy5eL6aAEkruXSI7f9R2b0Df9Dh8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlf8nMUzl5uTmU/psDwOZcj4lD51ef+asf1dHJfKN5Ys nXFh2lfO0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAi5i6MDAf9vlwOSHYsmrd7 t/v0BS0cR5J/HIx/Xffm7RlV9em7bDcyMnzYeqXLKv0Kw8N1K7yXsh5UC5biPfEkM8ZOeaJkSdz 5axwA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Convert printk(KERN_*) to pr_notice() and pr_info(), use %lu for the
unsigned long arguments, and add spaces around the shift operators.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/mm/init_32.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 9b0a3dd02da0..a799f4cff63f 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -616,8 +616,7 @@ void __init initmem_init(void)
 	unsigned long highstart_pfn = min(max_pfn, max_low_pfn);
 	unsigned long highend_pfn = max_pfn;
 
-	printk(KERN_NOTICE "%ldMB HIGHMEM available.\n",
-		pages_to_mb(highend_pfn - highstart_pfn));
+	pr_notice("%luMB HIGHMEM available.\n", pages_to_mb(highend_pfn - highstart_pfn));
 	high_memory = (void *) __va(highstart_pfn * PAGE_SIZE - 1) + 1;
 #else
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE - 1) + 1;
@@ -627,12 +626,10 @@ void __init initmem_init(void)
 
 	__vmalloc_start_set = true;
 
-	printk(KERN_NOTICE "%ldMB LOWMEM available.\n",
-			pages_to_mb(max_low_pfn));
+	pr_notice("%luMB LOWMEM available.\n", pages_to_mb(max_low_pfn));
 
-	printk(KERN_INFO "  mapped low ram: 0 - %08lx\n",
-		 max_pfn_mapped<<PAGE_SHIFT);
-	printk(KERN_INFO "  low ram: 0 - %08lx\n", max_low_pfn<<PAGE_SHIFT);
+	pr_info("  mapped low ram: 0 - %08lx\n", max_pfn_mapped << PAGE_SHIFT);
+	pr_info("  low ram: 0 - %08lx\n", max_low_pfn << PAGE_SHIFT);
 }
 
 /*
