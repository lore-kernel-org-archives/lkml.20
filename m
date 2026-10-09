Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF433DB64B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579915; cv=none; b=aVYo+C32v9G7uidUD9Ryh0pwfR4tWslL395EVrXzv4SSxpuX1HU4bx3vyRSPaePSZcvkdYOVDa1vofN/7M9b912vUzsmSKq84vSaPlBwbLQM0LdutoRZqnxf+IRJ2NQWJTBWvEVnDYJcZbPtB8xsAWcsYPX+uX/JUOf7zPeTSuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579915; c=relaxed/simple;
	bh=5toHAWoa9RZfe3NwUtwkxm431ePYX6KMOn7h4lFo+DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNc+YxLAJLb7dRBt0gIDWviybbmjt8hR7zKLphPHLsK8nirarFJMqCtryOeBbyAv0DDDwgBvyMKzPcPWPv7XOwcgaBKwPmFBKOnPqpBCf7uGKuh9F1HNBJS3DgcpdsRvpaPjIPKBGMYT8oryFD6kr2krxFjKFuEvAOjbDc7XRF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqW4JEO0; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqW4JEO0"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2a4e013a44so40051666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579907; x=1792184707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hkd0Kv48QkL3NWd7Acj/unZYgr+JarMkSbQu09jWeXs=;
        b=VqW4JEO0sYvBYL5t1v31+UvdOUtHAjfMKhui9mCQlPRT67NsJ9cpPlRxWegGkjDgyH
         AJhy9E/IrLkMf92vGWB7B0BcoMANC804Dq50Psuuch9UUk5fR8oAzK8WOGKjkxIWYBL+
         33fdnbBJ37VY3pScvSCOF/9qK9kFi+NtTx8y3oKqinC2ZQ/1rDapZE1LKtgyD12eSXLy
         oEw9y+nR3WnDwbtYh69EaYYrzbeHDh92ljjjhxz0xCLth62JvhqsbLu67ESZaKDKgjg3
         5ADd4rc9VPNLenH4NUSRkx+91VHAR6pL+xbthyVXnO2s0mVxb4FxYgoL/Khu3J9afzQR
         EVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579907; x=1792184707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hkd0Kv48QkL3NWd7Acj/unZYgr+JarMkSbQu09jWeXs=;
        b=DLtqNTfil9OQJgFX5WQEs2u45ZcFGEAA7nuM5PqWUJY29ylDY8ncWjzWX2bB3dU7qL
         Vv0EHtB4k05Y+P44Cb/NBSGghFz2hbI7/gstbDyxYHw8Fy2VLn6cbmq24qzDkhPhqB+P
         yaghTzVCj6B3AZleoHZFGvCc3rbUhYyKPPaE4matkXAJ/t7DDJ4XfkoD74CdPEeBjKaP
         ikBXIGtwPevyaIMHijatnbTl0lidRC8uHkG8maRpWVj9+P/44ZDqRVNjzZ1S7CS0sRch
         QEIsD8rwjyBunlyPij3pCsgaBLNJJy2YpWw7NP8VGtUgs2gt5OW+uiESEPpAu4Extx6z
         7NZg==
X-Forwarded-Encrypted: i=1; AKwUvBwFQZlRkxi3jVPBgWs66VeQPqIy1jpDFmEJKy6T46rdhLxgUEpWP23TrRHZJlDQtBum8S4Nu0Cr3YJqB8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH7dvGBcKi/7PhukvMFOHGUEOiQYBLB04ptgzM6W+wkBjkqzPy
	e6zD/zBePV+P/xUpp7S1+1oiffCmDiW4kNHPBkmx7uvU2zKzSDHkzaEo
X-Gm-Gg: AYBFou3nhdENKlncgDCuoXXBu8J9I84kBBQDucTwDSR2LnVbo6mgY8gnJMNQfrjmf/Z
	B9TXlTEckoqNcW1+HP3eJdgTKj9DuPhMws3SOjwPPkHl/XF/1/YTNjOksqvjR+m6YOp2y5qpmY6
	SliK58GZ0J+5qJFGu58fBVdG3SrbpNvaIgqKW4kodsEQPzPbwkMV3b/1FmKAWSKLcuOu2ZD+NMS
	Q4dzW0VoG56cSn3XJSyX0r9ZJ0mQm1vMrzXWmpys5cl1s+08Hb+KLQ52PSkgU0lfbXv7UUxzll9
	F3cC8YDm5clNLuwZJ7sfen2ls+SZnhDJ+6a/nKIXGNId+zJseEVF6WxqD8FCe40j8ilcxL2c7Hj
	L2RVeZNNfyw9pU7hVt4PXuRWtQqiNZohVxE8gJ3LABmnRD5B5xfB2KPtzahFFSV+/mVqok6RsrD
	e9Ucubel0ONeotaVXWxp5DuthXFn80ujldV7hhXzzWcnGXYqHMEwWY+Yu6YAiubrgb7wEVeUqtc
	KEDuk+qFJ8d2nP8hNMYoc19DC2WkKxCWXoj4xkb
X-Received: by 2002:a17:907:2d21:b0:c2b:7686:4d7 with SMTP id a640c23a62f3a-c31a9ff6976mr305989166b.39.1791579906531;
        Fri, 09 Oct 2026 14:05:06 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:06 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 5/8] alpha: fix the local TLB invalidate in flush_tlb_page()
Date: Fri,  9 Oct 2026 23:03:50 +0200
Message-ID: <20261009210449.971057-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009210449.971057-1-linmag7@gmail.com>
References: <20261009210449.971057-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_tlb_page() invalidates the calling CPU itself before asking the
others, and gates that on current->active_mm. For a non-executable vma
that means a targeted tbi(2, addr), which acts on the context currently
loaded and is only guaranteed to invalidate the intended translations
when the target mm's context is the loaded one. A lazy active_mm does
not establish that, so as in ipi_flush_tlb_page() the target mm's stale
translations can survive, and nothing forces the old ASN to be retired
afterwards.

Test current->mm instead. A lazy caller then takes the flush_tlb_other()
branch added by the previous patch, retiring its local context. Adding
that branch first preserves the local invalidate at every step, including
on EV7 where a targeted tbi() against a foreign ASN appeared to work.

Which callers reach here with a foreign mm depends on the configuration.
folio_mkclean(), from the writeback flusher kworker that has no mm of its
own, accounted for about half the calls during writeback of a shared
mapping and none at all on anonymous memory. Those counts were measured
with CONFIG_COMPACTION=n: with COMPACTION=y, asm/pgtable.h overrides
ptep_clear_flush() to call migrate_flush_tlb_page(), which rendezvouses
with every CPU and handles the context itself, so folio_mkclean() does
not reach this function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-4-linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index e4ba0aab8a66..a5a42ae4a7d8 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -684,7 +684,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 
 	preempt_disable();
 
-	if (mm == current->active_mm) {
+	/* As in ipi_flush_tlb_page(): a targeted tbi() needs MM current.  */
+	if (mm == current->mm) {
 		flush_tlb_current_page(mm, vma, addr);
 		if (atomic_read(&mm->mm_users) <= 1) {
 			int cpu, this_cpu = smp_processor_id();
-- 
2.43.0

