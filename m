Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F7137B002
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419539; cv=none; b=PU6hfILqfONF4uIO6jOlyWlKQyyNfae9aB1qt5lGp6lHg0hwk4F6N5eTY4s0XDP437R/YU944/sfwx1p8Zp5d9dISkpp6h8QGO44JT/k9Gdsnr1dl2i4Xxjfji+ZvEok/rTMvdRD5oJXJKK9cFkdjCEC7Hd5tzfp9fOeUxLFLMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419539; c=relaxed/simple;
	bh=yYAhiCla68uVUiwin0xdm1mJTq8h2yF1Z/vybw00qBw=;
	h=Mime-Version:From:Content-Type:Subject:Date:To:Cc:Message-Id; b=BLOwzgdn6mfGU5+CVF3xODxQ3BcPfoCCgDVd7aVSQFiv9sJ6wHGzDu/OWIMZf9aEsMl++s5NIkqFzSiMJZV/DN1TAKFGxY28gJhH9q06sWD1cNOyfNkOZ9SaxCAaWjAlhlIWD9rMAdczrKs5aS5yabfZs3rkTrGKrP7G4lmB0aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KDf3ZW/9; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KDf3ZW/9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788419516; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=MkhNfbBH4PkDy2GD73ONaRjS2m1dsfNDUUYxpjgBuaU=;
 b=KDf3ZW/9eCFnQt+fMqLH852S6h/sAxq1wfVKExHWVUVUMlVMa/PQ/949F87M7mpPvwNfLk
 spKQVtVVvGELrBRX16IjqlFAZQETHdCJeSXx7olEVTdib0yRCE6UhCn4vd0IIazlR+KYkq
 jzWDAj5LixnThS8ty/VH7/wejwb3W8/lqoI5qephO6XDS3/Evi9JqCP/ANGajYedM9QhQm
 GAWDft9Y71Fyjnff0f+F98/oUlgrrg1HwLig3o2UT+5rKocu4lKQS0/t4yujo6CV72hi1V
 nOqDF6JcZH7iA++4x5436Pbh31kxiBrTkswpKfdZtuvxI/xLcnuOSLDcZ46dbw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26a991dba+2ae671+vger.kernel.org+lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH] x86/lib: make clean_cache_range() zero-size safe
Date: Thu,  3 Sep 2026 15:11:25 +0800
To: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>, 
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, 
	<akpm@linux-foundation.org>
Cc: <x86@kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20260903071125.1946-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2

clean_cache_range() writes back each cache line in the range
[addr, addr + size). A zero-size range is empty and should not perform
any cache maintenance operation.

As pointed out by Sashiko [1], clean_cache_range(addr, 0) currently can
still execute one CLWB when addr is not cache-line aligned. With size 0,
vend is equal to addr. However, the loop starts from the
cacheline-aligned address containing addr. If addr is not cacheline
aligned, that rounded-down start is below vend, so the loop can execute
one CLWB even though the requested range is empty.

That gives zero-size callers observable side effects. For example,
arch_wb_cache_pmem(addr, 0) should not write back any cache line, and
memcpy_flushcache(dst, src, 0) should preserve the usual zero-length
copy semantics. If the rounded-down line is not mapped, the stray CLWB
can also fault.

Return immediately from clean_cache_range() for size 0.

[1] https://sashiko.dev/#/patchset/20260831111638.76012-1-lizhe.67@bytedance.com

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 arch/x86/lib/usercopy_64.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/lib/usercopy_64.c b/arch/x86/lib/usercopy_64.c
index c47d8cd0e243..5adf772cbf04 100644
--- a/arch/x86/lib/usercopy_64.c
+++ b/arch/x86/lib/usercopy_64.c
@@ -32,6 +32,9 @@ static void clean_cache_range(void *addr, size_t size)
 	void *vend = addr + size;
 	void *p;
 
+	if (!size)
+		return;
+
 	for (p = (void *)((unsigned long)addr & ~clflush_mask);
 	     p < vend; p += x86_clflush_size)
 		clwb(p);
-- 
2.20.1
