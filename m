Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792983373;
	b=2Rxq7IMeQy5BJDWBLy/HoZpjMhbhGSttBBndbutf66pdLJ23Rp9OZI97S//McF9QmalC
	 2YYdiY7JtbjVeAXDX6bDHtnC2HhW5v2tvaAX4HgTvtwM/6y+hWpt8dVwo/5+2qanHfXuF
	 XqdNNqcSzWE1GqJZY2fkE0x3rI8hIuE/Xeu73L4S6ZSnrHy4XfCFIU2nG16LZatIJ537+
	 AdRJntd2nQPa2voAUSz0TSubCEphg8PEOYYqvoV91YWNgRXbExX8n2sf4pE20d7OR+ZZO
	 SCWYkyThonSzJRbQtb/MPIKyu65WpeaxafzczQ702gnEKGZtMsPBMVxJ4KrJyNFBmNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983373;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZSHOP9vYCrVIMLOfjskmyREPSPWOTx5gY4tO1jbmCzQ=;
	b=gdQCO+J7GyF3rJLUBG/ENNGW9dkCsp2Qi5xTY8da6pFJkKYr0hppt5ebdtaarde/Gb34
	 jvTZmf1YzQb92XgGJQQdJ2N1aILVdtqkQk0eqV4By7EPM0zu71KyaNQ3F/7fPYeceLAbu
	 y7I6wIO4aESvIAmCRoPa8r20Xxo7/uWoOutP3Sk0V/UsWstvsdpCzZNrVzwCvZ6MD6zxW
	 bo1fGr6kjfll68cblOGzy4SdQnO6LDcfrl3fj9vyeSSSnlgyHofxagknZebeuK7kzDI2h
	 He8nto3HF5TcKjAp50458AYqFUSeBjbn7YM9P3u6XWS/VsVTlWezGzLkVLt/w4doomA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=f6zGVErF;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BEE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BEE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=f6zGVErF
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792983365; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ZSHOP9vYCrVIMLOfjskmyREPSPWOTx5gY4tO1jbmCzQ=;
	b=f6zGVErF3tueCPLmSuB9XnmuUrNhYB14+NrtATrDVo/Hb1gdRbBWmAbi0NOiG/cduC9gK324ltuKaBwQvE4Wh6bkyXJ9HbK4U4w4/l0HOZzmZQobfi3WOdVjIX0KYebg/x59IswcRxbtkXHoibpa/NixEXTi7rDZPECnwORttTQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XDRaMhh_1792983363;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDRaMhh_1792983363 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:56:04 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Kaitao Cheng <kaitao.cheng@linux.dev>,
	vbabka@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: [PATCH v2 1/2] mm/compaction: skip folios containing hwpoisoned pages
Date: Mon, 26 Oct 2026 10:55:51 +0800
Message-ID: <20261026025552.1427901-2-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261026025552.1427901-1-xiangzao@linux.alibaba.com>
References: <20261026025552.1427901-1-xiangzao@linux.alibaba.com>
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

memory_failure() sets PG_hwpoison on the error page before it manages
to pin the folio via get_hwpoison_page().  Compaction running on
another CPU can isolate that same folio in the meantime, so
HWPoisonHandlable() then fails on !PageLRU(), the retry loop in
get_any_page() exhausts itself and memory_failure() gives up with
MF_IGNORED - while compaction still has the folio on its
migratepages list, flagged PG_hwpoison.

Nothing stops compaction from migrating such a folio afterwards.
The corrupted data is copied into a fresh folio that carries no
poison marker, and no hwpoison PTE entry is installed on the way
back: the userspace mapping is silently redirected to the corrupted
copy and no SIGBUS is ever delivered.

A large folio with a PG_hwpoisoned subpage can also sit on the LRU
without any race at all, via the THP-split-failure path of
memory_failure() (kill_procs_now() + MF_MSG_UNSPLIT_THP); the guard
below catches that case as well.

folio_mc_copy() does not close this hole: it only detects corruption
at copy time and only where ARCH_HAS_COPY_MC is implemented (x86_64
and PPC64; elsewhere copy_mc_highpage() degrades to a plain copy).
Software-injected poison never traps during the copy on any
architecture, and that is what MADV_HWPOISON, the hwpoison-inject
interface and the fuzzers exercise.  An isolation-time check avoids
the migration of a folio that is already flagged, on all
architectures and for both real and simulated poison; a poison
landing after isolation is what patch 2 checks for.
The check itself is two flag tests on the head page (PG_hwpoison
and the folio-level has_hwpoisoned marker), not a walk over
subpages.

Neither page reclaim nor memory hotplug lets such a folio be
copied into a fresh one: reclaim unmaps the poisoned order-0 page,
and skips the hwpoisoned large folios it cannot safely unmap, in
shrink_folio_list()
commit 1b0449544c64 ("mm/vmscan: don't try to reclaim hwpoison folio")
commit 9f1e8cd0b7c4 ("mm/vmscan: fix hwpoisoned large folio handling in shrink_folio_list")
while memory hotplug refuses to migrate them in do_migrate_range()
commit 5f5ee52d4f58 ("mm/hwpoison: introduce folio_contain_hwpoisoned_page() helper").
Skip them in compaction as well, for the same reason reclaim settled
on skipping: the UCE is rare and a race with compaction is rarer
still, so skipping is enough, and a later memory_failure() will
handle the folio if the UCE is triggered again - while a migrated
folio would silently propagate the corruption instead.

Deterministic validation on v7.3-rc4-75-g62f4c998b297: order-4
mTHP folios were brought into the stable "large, on LRU,
PG_hwpoisoned subpage" state by pinning a sibling subpage with
vmsplice and injecting MADV_HWPOISON on another subpage, which
makes memory_failure() take the THP-split-failure path; after
triggering compaction, /proc/kpageflags shows which poisoned
folios moved.  The unpatched kernel migrated 16/16 poisoned
folios and 16/16 clean controls in the same pageblocks; with
this patch, 0/16 poisoned folios were migrated while their
controls still migrated 16/16.

Soft offline is not affected: it only sets the poison marker after
its own migration has succeeded.

Assisted-by: LLM
Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
---
 mm/compaction.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index a049415512c6..491adcbc5313 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1093,6 +1093,14 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (unlikely(!folio))
 			goto isolate_fail;
 
+		/*
+		 * Migrating would copy the corrupted data into a fresh
+		 * folio with no poison marker; skip, as memory hotplug
+		 * refuses to migrate such folios for the same reason.
+		 */
+		if (folio_contain_hwpoisoned_page(folio))
+			goto isolate_fail_put;
+
 		/*
 		 * Migration will fail if an anonymous page is pinned in memory,
 		 * so avoid taking lru_lock and isolating it unnecessarily in an
-- 
2.43.7

