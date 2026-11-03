Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669213;
	b=0MBTCK3PREpG3+LYf7ZSmt0mlfoD1S1tAFQWItmXHduF8SxzzFj8KzctU5WuNpfPzm16
	 RYCdN2y947lNNXJwB9OxM7nNMVQUr6foPIETBfFsVwv8sCTvHKb4VdIZnrbzu1ZPSqOUH
	 wOb/nsFSH485i7XvZh7UeClFYNkVq7VZGabUxtcaotSLj5aJuIiACL62v8CCSmQSlvQtq
	 bXkl7cOvnaXV4vbcZoUjnvddgmOgkq/LKHgOvcWQHvtko/XNAjc4bE9xWP3crD+gdd2AE
	 KHtrHyJQCb0ujNuz5su5AaGE8Own2PzhRobpfg3K1vgDf1DYLD9JJXj0ktwo+W0FDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tEG5AZYobzy2BJMnua8HLclVLE5Vb8k6t/Lh9yPR9Is=;
	b=Gt1OhUDMXBs+gZwqKwuV6DzBffumnINXCDzBfxYrLkeuF8zXaTAEYJmFVN79Gn0txt2t
	 Ivw1WSyIwfOQfOooZAdvQ8USmv6zHroUBfdDQKD73kOHoUkHmqvwj4WiWLtlx9UNfjPyt
	 EPQU1tD4OviiufyRFbNtmAP2eGp1vYT69iVs8p8rSWCZg1ggyHQSd0FILcZcjtzE6o4re
	 qPcH0y4GX+8Whhv1oJFAnMDHJBhRUa2Fkw3LTMm2cgZCnK8fBXRqASbQAxLHvO0McmQhR
	 fivPi2f9Sse69kGa/WiBdaYVvNeGxEoP0QUrEhMxe9Rj1SNhoBOc564NZ/jPySl0z0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--bingjiao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ipebOoNg;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513D7606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513D7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bingjiao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ipebOoNg
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so6991974eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793669212; x=1794274012; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEG5AZYobzy2BJMnua8HLclVLE5Vb8k6t/Lh9yPR9Is=;
        b=ipebOoNgLnLf2b9xZHnn4XqSuGJlxNbZu8ra5hxZ5yg3T1DRzSO6dZIj5a/ZY6L72N
         w7m8zE8JNyroP6O/IneXv7GLgUboQjFTfzrp+e/ETElS2gCkrt6xtUE7dgSOlPKzf/6K
         ZQShde2zPsyXhUOkx32zEKjrEDwhlxYVmFYNmJGMxjET4LPR+akWeuykhL4xal2FQNyP
         Y4SmyxbeUg6fkUBHFnQPKd6WQVUQlJRNlxybO/M9a8cg8e14jhr/FkCCKvFxPMJXsPQk
         auQ0IIeUZjOrr+28pkOo08N/pc7mclnZigmxhqRvxEqB3cQGpGcIoNpoOj40o7L6lXyJ
         BHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669212; x=1794274012;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEG5AZYobzy2BJMnua8HLclVLE5Vb8k6t/Lh9yPR9Is=;
        b=x8FQwTro9VDw6PMKRx6RLWC43nq6HGVWLZXe6tFwZOnj5/DY1nTICdywLSns5lfV1o
         Zfy5SMGaUWIrl8e7plkurRZYSy7Tey4ihzvQqeCP7kWmtu8HcoPbdlboz4ZIKW16VXZ4
         fKvfA3liN90BFWNWiXeM070lKf4xmJ+N30B5/WpHiKsZSWBAK4J1u271mbjJXUI0YTW8
         mhSIFVqDkhc5nPe6UOIhY+pPdcGhed833COy6WMS8ZUyPgBA09OdVjD0OECkrcmmo7z/
         EfCTBysjLm37/yh9CKxGCXidftZGRAbpfhq9Z0gkF3nV+6fFSMqeW8xEJNSFGTk7aKkJ
         IsSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8jQlbWWo3JqCl1zmDG0rAY4BlmLyrOC+wR1DzallA18w3dNSobza8d4Sn6JlQiPll2YTG8ZaGD08EBlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwHCo34Eu6CDEm8J23Nfc6JTZkyCqMgHUWnbk3JOMQ1cFVr7o+
	DR/ISoJZoWrlH4IQp8ebGReg7Nz+6mlPARMwm6StT9Cvy/QLgxgweEeoI5dgYYqwfnG32uz+GqE
	OYtFpfS1yIk3ykw==
X-Received: from dybb24.prod.google.com ([2002:a05:693c:6098:b0:369:45ee:40a7])
 (user=bingjiao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:65d3:b0:36a:a10:ab95 with SMTP id 5a478bee46e88-36a423cd4admr19365623eec.29.1793669211866;
 Mon, 02 Nov 2026 17:26:51 -0800 (PST)
Date: Tue,  3 Nov 2026 01:26:25 +0000
In-Reply-To: <20261103012626.2699661-1-bingjiao@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103012626.2699661-1-bingjiao@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103012626.2699661-2-bingjiao@google.com>
Subject: [RFC PATCH 1/2] x86/mm/tlb: Skip batch->cpumask updates when
 X86_FEATURE_INVLPGB is enabled
From: Bing Jiao <bingjiao@google.com>
To: x86@kernel.org, linux-mm@kvack.org, 
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Bing Jiao <bingjiao@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Rik van Riel <riel@surriel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Huang Ying <ying.huang@linux.alibaba.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Juergen Gross <jgross@suse.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Chuyi Zhou <zhouchuyi@bytedance.com>, 
	Xie Yuanbin <qq570070308@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 72a920eacd8a ("x86/mm: Use broadcast TLB flushing in page reclaim")
and commit 0b7eb55cb706 ("x86/mm: Only do broadcast flush from reclaim if
pages were unmapped") changed arch_tlbbatch_flush() to flush all
non-global TLB entries via invlpgb_flush_all_nonglobals() when
X86_FEATURE_INVLPGB is enabled.

However, arch_tlbbatch_add_pending() still unconditionally ORs
mm_cpumask(mm) into batch->cpumask on every unmapped page even when
X86_FEATURE_INVLPGB is enabled.

Guard the batch->cpumask update in arch_tlbbatch_add_pending() with
!cpu_feature_enabled(X86_FEATURE_INVLPGB) to avoid unnecessary bitmap
operations on every unmapped page.

Signed-off-by: Bing Jiao <bingjiao@google.com>
---
 arch/x86/include/asm/tlbflush.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 70098d448e99..4ec71ea0943f 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -379,7 +379,8 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	inc_mm_tlb_gen(mm);
-	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+		cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
 	batch->unmapped_pages = true;
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
-- 
2.56.0.385.gac671c819a-goog

