Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245394;
	b=ASKRRBintVPlzt1AL1Sxnb6nPh+l5KcjS15nQrAnwTDkOdo2WquoO6xf2BFEg8oYvDuz
	 9tnsbGS5GktR3E3g5+ERboKct+Yejv846wrlNyvtr+4om59kH2xOUZq3IKpM1J5+8IQJc
	 0bJEiKsLdWsCxX8Zm90FeR7L3ybGMsh8ChENmyyJCdjx61FZyLpxFzXXN6FAqzG7BABe2
	 yL5qCVENpFTovMpzCK07fdcaU+xX/04/em4hmR/Qig/d3HM853oQ6n+HmYiS9HgErIlqR
	 jIdoV4DfRPy1Hv3pmKuBL9X9t1dJCSWJUKeEsM2i8iUGcERtdh+L9lOAdfRw7+ZpSBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245394;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JekMvStiW/W3yoGDfXVkNrB3ZFspUK0TlSYVErjbeDo=;
	b=1vDxpYvwLlJ8yFHVT7NeIaO+Z6npNHjdHT3K7i6bizT2g/zT39jmMx8eJoB/MYwyTU9y
	 ydAylVbSWNFu/36uKZrwD9UT2ofNhYCSN/CFps44qZ046epqEOgCGp47mjhXuXMRIlBh/
	 t4ljHgjX0DaIxz4A0bpJVIKnh3yPb2xvdfSau7fYLn5LkPPr5FUdfEHnzSdHFII0ab4tk
	 EixjY+OI+FYcfyjDHGZ+AwQjBIQ972lSwpFchtlGjAxjSXtbd5I6D/iMFKXgZwRx3mXMo
	 85aMy2wicZTfPFahP5hDh3Uoo3X6HtxbibCtHaTvEI/Nk3L2uwkSeNbM/US9BV9dqEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=kcDroLBN;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C3606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=kcDroLBN
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793245385; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=JekMvStiW/W3yoGDfXVkNrB3ZFspUK0TlSYVErjbeDo=;
	b=kcDroLBNmjgkbaAhC/gdDzTPWO/5h/aEBXEnewTFe4qrOSV8TWKHcXS4mqod8ub/BZcghSXWaLTxcID/wRRB22/buD/ZO8wIFKefdT4/Z9g+HPzDNLC47GstglB+4Rli98ri+KO/7MtL9c0UnAyRN6YD5orRgYpT6ukpuSWBjcQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XDiFJuP_1793245374;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDiFJuP_1793245374 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 11:43:03 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>,
	"Kaitao Cheng" <kaitao.cheng@linux.dev>,
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
Subject: [PATCH v2] mm/highmem: refuse to copy hwpoisoned folios in the !copy_mc fallbacks
Date: Thu, 29 Oct 2026 11:42:54 +0800
Message-ID: <20261029034254.2487998-1-xiangzao@linux.alibaba.com>
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
before and after the copy, and return PAGE_SIZE, the
not-copied-bytes convention of the real copy_mc paths, so the
callers take their existing error paths.  On archs with copy_mc
this code does not compile.

Measured on arm64, where the fallback code compiles (10 rounds
each): COW copy throughput 1043.67 MB/s before and 1043.26 MB/s
after the patch, fork latency 348 vs 359 us, forced migration 57396
vs 57654 MB/s - all within run-to-run noise.

Suggested-by: "Huang, Ying" <ying.huang@linux.alibaba.com>
Suggested-by: Kaitao Cheng <kaitao.cheng@linux.dev>
Assisted-by: LLM
Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
Link: https://lore.kernel.org/r/877bjowf9i.fsf@DESKTOP-5N7EMDA/
---

Changes since v1:

v1: https://lore.kernel.org/r/20261026025724.1430747-1-xiangzao@linux.alibaba.com/

- Check before the copy as well, so data the flag already
  condemns is not read (Huang Ying, David Hildenbrand).
- Use is_page_hwpoison() instead of folio_contain_hwpoisoned_page()
  (sashiko review, Shivank Garg): the folio-level predicate misses a
  poisoned tail page in the memory_failure() window, and refuses
  clean siblings of a poisoned subpage.

 include/linux/highmem.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index d7aac9de1c8a..d0e33cacae90 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -473,13 +473,25 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
 static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 					unsigned long vaddr, struct vm_area_struct *vma)
 {
+	/* Don't touch data that is already marked poisoned. */
+	if (is_page_hwpoison(from))
+		return PAGE_SIZE;
 	copy_user_highpage(to, from, vaddr, vma);
+	/* The flag can also land while the copy runs. */
+	if (is_page_hwpoison(from))
+		return PAGE_SIZE;
 	return 0;
 }
 
 static inline int copy_mc_highpage(struct page *to, struct page *from)
 {
+	/* Don't touch data that is already marked poisoned. */
+	if (is_page_hwpoison(from))
+		return PAGE_SIZE;
 	copy_highpage(to, from);
+	/* The flag can also land while the copy runs. */
+	if (is_page_hwpoison(from))
+		return PAGE_SIZE;
 	return 0;
 }
 #endif
-- 
2.43.7

