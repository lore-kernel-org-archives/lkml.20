Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904120;
	b=UvNXIjfEt/IcGanqw9QmxijckQonSHMZ+hbh1Y3Dx3KLG8zFBqZP5VcVXVVPoES9Yguy
	 wAEDOGgVIGtkV/fSSbp8MVajuD7aa1qDw+y4z8DgjE7fNRuFEh4+NiscbW70kaIDOsBrz
	 rqy5mdo2HlM0CCFewtxI6NE6LkZb+3tiq+8mPllXhlcv7Lr0+Or0TrZtsO8szCVOOwRAw
	 JLDejaqfAPpa53SA3KlPTjMqucXhu5UFaB9LNtZfO21zAxGeJ8beSz8GtSL69KGNwnK2f
	 QjO63ZJN/+ULN7BXA3VZS2QPzbTDPKX8StG/yoYEE8KKpjlEuBUwPP4yOGlqQGYkz2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904120;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EE1sb551x27Ej5Fjzi9j3H+2qleA12aesnVZEQWHbOY=;
	b=AOIZuJQP9ixPrRX00ycsIuPbtG1Xi1fEspH6NE0HWcijVwx5MvfgmnArm7tavu+wI2E5
	 CsAz5saYQczEgW1d6jbwn8P2P11bXwqzDnMn4MUe2Y/Tgi4DTRBZ78BSpbYi9+AXZfcgK
	 n5doBLuibKED4Zd5AyscHj0nzOAL0pD7PzLxeH5NzrjtDKZ4iu8kUs8Zk0MJPURRyG7Xd
	 Go5NPA4xUNWBQSrZ7J5GlRML7J6Mskm50HxhW1aWdIK2P0cZoIVMDRCrYKfx2JGaz5oOS
	 R1zVfWvNigqAM5qkqeQbcShBrBkjfPpR48u9qxUeJoCdMdlBH5s1+IYzBTMg6ouvM+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="GtyV4/Mu";
	arc=none smtp.remote-ip=95.215.58.76
Received: from mta1.migadu.com (out-76.mta1.migadu.com [95.215.58.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8B0606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A8B0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GtyV4/Mu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bhr39nNBlSP/jhuooBjvFn5uupn8bYHVVZDQyyfyBlM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904118; v=1; x=1794508918;
 b=GtyV4/MuKeVj46VrcoQ5xUjXP3XeFxeYMuIrS8xo4cZQdC6XoF77FcKAGcIBprrgIh5XilHP
 nWMpWO12XOvVofZrQGldNmtvLODwpy6ITHeHwAZvhvhdlF5i3ofwpuPM3rDNGkq/D4CPlHiTOzk
 72+lX0a0VuLtt5U5gP2bv+X8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c4e779a46879f223;
	Thu, 05 Nov 2026 18:41:58 +0000
X-Mizu-Trace-ID: c4e779a46879f223
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v9 23/32] mm/madvise: skip PMD swap entries for MADV_COLD and MADV_PAGEOUT
Date: Thu,  5 Nov 2026 10:39:07 -0800
Message-ID: <20261105183940.2236717-24-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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

A swapped-out THP has no resident folio to deactivate or reclaim, which is
also the conclusion the PTE path reaches when it walks the swap entries and
skips every one.

madvise_cold_or_pageout_pte_range() gets there the long way round:
pmd_trans_huge() is false for a PMD swap entry, so it falls out of the huge
branch and tries to map a PTE table that a non-present PMD does not have.

The entry can also appear after that first, lockless test, so re-check
under the PMD lock; otherwise a PMD that turned into a swap entry while
pmd_trans_huge_lock() was being taken trips the VM_WARN_ON_ONCE() that
expects a migration or device-private entry.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/madvise.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index 156290227c236..576707e303cf2 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -384,6 +384,15 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 					!can_do_file_pageout(vma);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	/*
+	 * Swapped-out THPs have no resident folio to deactivate or reclaim.
+	 * Avoid descending into or splitting a PMD swap entry.
+	 */
+	if (pmd_is_swap_entry(*pmd)) {
+		walk->action = ACTION_CONTINUE;
+		return 0;
+	}
+
 	if (pmd_trans_huge(*pmd)) {
 		pmd_t orig_pmd;
 		unsigned long next = pmd_addr_end(addr, end);
@@ -394,6 +403,9 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 			return 0;
 
 		orig_pmd = *pmd;
+		if (pmd_is_swap_entry(orig_pmd))
+			goto huge_unlock;
+
 		if (unlikely(!pmd_present(orig_pmd))) {
 			VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
 					!pmd_is_device_private_entry(orig_pmd));
-- 
2.53.0-Meta

