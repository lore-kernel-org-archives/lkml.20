Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310021;
	b=r1OuD8ChIjSMnkCynoe/pqsY/HZOIE1yPCxGCGx6WKoW0HfsVk4erVjSBo2XDlV5SRNg
	 QQO8uGz/QPvDBxe5wrCwEsl/nCTwfLYVNDmM7Y08xfXcSUWQy+KlcF9lqZXIOQAVfwiRU
	 PCv9Eww5MzbDJVA/EY32mqTX8obDeTVZlVD78ju3BT0N8qfWYq8rLtbGIeW0Lp0zEoLxa
	 2/fNxoGI3SmLN0qxPmXSo6c8LIwuqjuWmn02hm3hSkNVEaQ1RbEDJsZeYCMclJsI8CaWo
	 o9ApejDYBjMu5aGRK23Oj0cTSdoR1p24vq/JZiO7XKh40VJTZ0iRsoUb43TINv1Wf9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310021;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sgZZOtBRQaNmECyPC9mpOVxtec1C2dAIZknHoGcx5pA=;
	b=bPdIjiXfFKhwDB9QmSSWOUixILDanRjHULeo3O45lyMkRt/vvB/9jw++RPwZHtYxLypi
	 aM8W0xg2OEdH6kpYChwE8dDLRjhHufce3U6kq2WY9cBxx+bTZYJJfURJppRmt8C+rJ/1P
	 NZ3UebVSam4UB+Nz7bIx9aWSWkm592MVD9Oqj3ChjkofSnyVQ2bWW9OKmMCNktLE7Nz8o
	 YvdXWV6/F2roPTw6FvMQv65AjPUwc1zYBxVv4sysYyp9OHPMK1axgB4wvVE1EwJSTGqGk
	 em4f/I83v0n/CfUzwk2t2xi+BLhpsaq+GG86j3KpkcJ9Jyq3BbppWF68O4k1+L5EhSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=m5SRpPJi;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D78606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D78606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=m5SRpPJi
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794310012; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=sgZZOtBRQaNmECyPC9mpOVxtec1C2dAIZknHoGcx5pA=;
	b=m5SRpPJi6WajnwzFDRrkaLemiRODUqim/o+9LcoWk/cK03A01Hw8U2GMvUZOlXN5ptjioDLnTe4crFWmN0erI0ubD/g/rCnLOcwom9ayGFrgqazKAeXF0D11MjbY0yK8yz2LDHQkWH34Bd28UvzRcfSFbeJ258esiVXfMbva9ic=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XEV55hJ_1794310001;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XEV55hJ_1794310001 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 19:26:50 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>,
	"Kaitao Cheng" <kaitao.cheng@linux.dev>,
	"Garg, Shivank" <shivankg@amd.com>,
	vbabka@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
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
Subject: [PATCH v3] mm/highmem: refuse to copy hwpoisoned folios in the !copy_mc fallbacks
Date: Tue, 10 Nov 2026 19:26:41 +0800
Message-ID: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

The !copy_mc fallbacks of copy_mc_user_highpage() and
copy_mc_highpage() return 0 after a plain copy.  With PG_hwpoison
set while the data stays readable, there is no fault to recover
from: the copy completes, the destination folio carries no poison
marker, and the poison is consumed silently.

Check the source page with is_page_hwpoison() in both fallbacks,
before the copy, and return PAGE_SIZE, the not-copied-bytes
convention of the real copy_mc paths, so the callers take their
existing error paths.  On archs with copy_mc this code does not
compile.

Measured on arm64, where the fallback code compiles: a
kernel-space microbenchmark measures 90.00 ns per copy before the
patch and 90.71 ns after, 0.8% of the copy itself.

Suggested-by: "Huang, Ying" <ying.huang@linux.alibaba.com>
Suggested-by: Kaitao Cheng <kaitao.cheng@linux.dev>
Assisted-by: LLM
Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
Link: https://lore.kernel.org/r/877bjowf9i.fsf@DESKTOP-5N7EMDA/
---

Changes since v2:

v2: https://lore.kernel.org/r/20261029034254.2487998-1-xiangzao@linux.alibaba.com/

- Keep only the check before the copy (Huang Ying): the copy is
  back-to-back with the check, so a flag landing within the copy is
  negligible.

- Add the kernel-space microbenchmark asked for during v2 review
  (Huang Ying).  The bare copy and the copy with the check are
  interleaved in the same boot, 20 rounds of 200k copies each, with
  the CPU pinned; the zero-variance baseline bounds the resolution
  below 1 ns.

 include/linux/highmem.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index d7aac9de1c8a..c3240f70471d 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -473,12 +473,18 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
 static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 					unsigned long vaddr, struct vm_area_struct *vma)
 {
+	/* Don't touch data that is already marked poisoned. */
+	if (is_page_hwpoison(from))
+		return PAGE_SIZE;
 	copy_user_highpage(to, from, vaddr, vma);
 	return 0;
 }
 
 static inline int copy_mc_highpage(struct page *to, struct page *from)
 {
+	/* Don't touch data that is already marked poisoned. */
+	if (is_page_hwpoison(from))
+		return PAGE_SIZE;
 	copy_highpage(to, from);
 	return 0;
 }
-- 
2.43.7

