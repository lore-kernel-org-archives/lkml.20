Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452744;
	b=Jmk9Mvo+Yayo0hDwWdSt+DIt2QlFCxLtfZxAwHBImDpAxI6nPfE6xEOuGl46VSoiGfqk
	 tTUwc1C8573G7gq+PwyEV7daaIYVCy/8ujoKksDXfq3ZAZ2LEt/xJFcLqfAqvfnRDO69g
	 6O0/OzlN+0VpqAOnEX9J70FO5fcFzN9KuGwaDiNY4AdoxovUKZCnK+4kucBMyvrghDalV
	 A9yrf7RybqywCg3U+/TtNi0h2XlrndMJKzZ+g/VImhH8B/Tfy0PXr9iPwRHKk199QCxyP
	 wpOVRioeZh2a9oo8J2b3Ygt6gAdvM+dHf/Hi63ePtLHDCsfnxSMUPRQJBasPZPlDfFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=H/1nepHETYkMrBZ8dwWmjMmfItF4wfcyh5WRks/j7xM=;
	b=ja/MrsAZjg66WVythLKEx735ULVSyJI89GPfhouh+9x44M0SJLMM/v6f6NNqLsmKElld
	 Z33I/gusMFIbDzYLOdH/tX7X04E58Sxmr8dQUiugOge23XX9amz6ljnWvpJsWePRootf5
	 TXoWWfurcbkVGv4/UzaHFplGDiaOlf+WW+xI18MUr9x9G+Sc7pZIqiAgIaWVI1Q4rq29i
	 okS7YGLYecas5NtEXn5etNn3NSljKfvbmjEkN6cYX+Wn8af4+doTDexVO1hpRmte2ccBE
	 Ar/o9xx/IncJDhaJ7qHlmJd06rkZznLL5OXDirqXaXLZuafr9ohVyOXrug2DhTwivgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=Pw5gut4s;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA6F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=Pw5gut4s
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jQ4yX5lV2z8XrrM;
	Thu, 12 Nov 2026 11:05:40 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794452740;
	bh=kxCgMxQPw7zcLOOhcHpi7uXta8VoUq1BGHVf6nXNGqc=;
	h=Date:From:To:Cc:Subject;
	b=Pw5gut4srzbBmc4DquuhsUXRyLRKi0FL0Hts0vbduFOt+2gNwLEFqp4e72tyd6nE8
	 6DDXU+mEhfkTTjIYJWdjjCnI03jIPl8mYqimVk9uFNY8/D9xU4y0uossUkJ+qFQLF8
	 e+z83man3qRhXb+/NxBTwkuge1j4xPHJfqmVa7tW3fDjBBP5hVaQuitnuyqgT1+iOu
	 cjuY7JKxic1Mce3I8NONe5By+JRVBqmpCbP6ccShlECH6drwCQKHz/Wr/DVdjTEjkR
	 oWdLJ+23K2rxJcsrm5jVpVPeCJC8NmpUAmZjpXPwtM4pBgK3JEg/MPuUD9gumeAra7
	 6FJJhXAd1GQ2g==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 6AC35OT8083980;
	Thu, 12 Nov 2026 11:05:24 +0800 (+08)
	(envelope-from hu.shengming@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 12 Nov 2026 11:05:25 +0800 (CST)
X-Zmail-TransId: 2afb6af52cf5c07-cf787
X-Mailer: Zmail v1.0
Message-ID: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>
Date: Thu, 12 Nov 2026 11:05:25 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <hu.shengming@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Cc: <alex@ghiti.fr>, <akpm@linux-foundation.org>,
        <baolin.wang@linux.alibaba.com>, <wangruikang@iscas.ac.cn>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <zhang.run@zte.com.cn>, <luo.haiyang@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbW06IExpbWl0IHBlci1wYWdlIFRMQiBmbHVzaGVzIGZvciBsYXJnZSBQVEUgYmF0Y2hlcw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AC35OT8083980
X-TLS: YES
X-ENVELOPE-SENDER: hu.shengming@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 12 Nov 2026 11:05:40 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF52D04.002/4jQ4yX5lV2z8XrrM

From: Shengming Hu <hu.shengming@zte.com.cn>

On systems without Svvptc, update_mmu_cache_range() performs one local
TLB invalidation per PTE. With 4 KiB pages, installing a PTE-mapped
1 MiB anonymous folio requires 256 SFENCE.VMA instructions, or 256
SINVAL.VMA instructions bracketed by SFENCE.W.INVAL and
SFENCE.INVAL.IR.

Apply the existing local TLB range-flush policy to PTE batch updates.
When nr exceeds tlb_flush_all_threshold, use local_flush_tlb_all_asid()
to replace per-page invalidations with a single ASID-wide SFENCE.VMA.
This orders the PTE writes before subsequent implicit page-table
accesses and invalidates translations for the entire batch. As with
range flushes, this may also evict unrelated translations for the same
ASID.

Benchmark results from will-it-scale's page_fault1_processes under
QEMU 9.1.93 (qemu-9.2.0-0.3.rc3.fc40), with svvptc=false and
CONFIG_TRANSPARENT_HUGEPAGE=y (higher is better):

Folio size      Before       After     Change
=============================================
4 KiB           116537      113503      -2.6%
512 KiB        1431962     1977519     +38.1%
1 MiB          1528457     2208209     +44.5%

Signed-off-by: Shengming Hu <hu.shengming@zte.com.cn>
---
 arch/riscv/include/asm/pgtable.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2ebd5fa5adc5..ebe42fcf35ae 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -571,6 +571,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
 		return;

+	if (nr > tlb_flush_all_threshold) {
+		local_flush_tlb_all_asid(asid);
+		return;
+	}
+
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
 		local_sfence_w_inval();
 		while (nr--)
-- 
2.25.1
