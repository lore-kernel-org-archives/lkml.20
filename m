Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8244A3E0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110301; cv=none; b=cQnw4L2L/Rt8UmKgJor2FaOYr9TJGYUQmUcJGfjCiXeP29SfKlHXVBd34R8lSB0FFESVlpfKhhcP5SfOqjBLbY5f+3JwF4Vws2RobPLtvsJ28G6m04ftu8qNkPlz2dKqbyv1yvoDETgwvwEZRcLqOWz7BSsI8DhYYJQJ9CQNG+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110301; c=relaxed/simple;
	bh=GA9mRxKSUeeqsmtq3HYQxOizT5HeER4K1UAF5EDbsaw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UmJUsszLd46dCi0dfVsikTFDW7ZDxRrJaqMHaRn4HRH9t79Yv4txv5GnAtvb5nZB4bGcGcnvK/3avE4gERDoV+rppS+SlDxV8XHvlzDDLGQGCGPDxel1QTE3eZv5VTcxzehzwO3ZuN4xgzEu4Mh8zKB6J2dxYS19PbkP/lmiKMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tFUL/KvG; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tFUL/KvG"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so7981295ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110290; x=1789715090; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mupi7f/R8vSLK7yP3tvVdaLvmeD/LZPxEKzcTyfibm0=;
        b=tFUL/KvGijW2fmMbEFUZEglYuNuUegzpDKWU/CkItvZSq6JFn2NUsJpRmCnwUlj0ct
         YYeNEIr5RWGWAUuw77fJTdeVuoMtaIs5NowUYjrsIlM8SSb2y3yYpEhLCfBfxRudBHGK
         V+pDPb7EiqQAMB34y6/fvaV62u4u46y9d0kpeHSAGSm2Rpv2IwYs8hn9nIa+rf6sZ4mq
         jIOVqRRQtJWD4HtyEt0ksGw/yhs4RXANBk7ZyPwlcZAAp0Th2yzo7/5SbxWEOuZl1toA
         ldfRiLV4Yq87xQLw5u6Sf6zwKXX4j4gCjwwSxtEz6fWeiD1qDJhcaOt/lxNvv5CGN7h4
         pAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110290; x=1789715090;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mupi7f/R8vSLK7yP3tvVdaLvmeD/LZPxEKzcTyfibm0=;
        b=cUyomuPfxPxudcQmPNy9eNCGEuchgX+4iH1Lhi8GNWOjweyruMt9on/ZkbrSSaQzOs
         AqhO3SjTyta2c7kH0oz1qlw4irEo3LuuqcJFayGATbx6mB9bAFFA5KP2IN0ovEnqQr4n
         jE6sBRqHSE7u4pAR/lD88FBv+FCC3+Mw4akeVFvrUlyuclSjOrpPU4xkPHFKbEF50304
         1NFm2y5nYudeKL7P9IYJ7rSrMX/cuQ7d3vPnmoYjX8xQw6A6Q6nPInuMl6ubBVd+wv63
         CC0yI/oVSjvsuzql6qvDq1eIom0oUrNZIgDiZKX3wAF5xGGehBEeSn+JF48rMrsFtu8I
         noYQ==
X-Gm-Message-State: AFuF++kMTEFTHdD5iWQxY3soRHe04DCVDMQkUU3ZYUOvWDt3Ol3HWUia
	D9vr/8ibIk3PRv36qqxeYXwZRh/bNk3ZGK3UFIgnhEZ8qO9gj7I8jw4oAO27ak8N+LtahA/cC4C
	ywCVCI+JYxo7FxajfTmTalkZkVdNrBIsOfdqLjMsNkR9WFHj15lseUWaAXwipkbu2jAvgI74jTS
	hPjQEfC54q6jwSnQwM+FPZlttc66UkdgZl3+YpcQ==
X-Received: from plri7.prod.google.com ([2002:a17:903:32c7:b0:2dd:334f:920d])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cccd:b0:2d8:d4d3:da50
 with SMTP id d9443c01a7336-2dd2a471a7fmr72805325ad.20.1789110289759; Fri, 11
 Sep 2026 00:04:49 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:45 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-8-morbo@google.com>
Subject: [PATCH 7/7] powerpc/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Convert powerpc to the arch_load_unaligned_zeropad() /
load_unaligned_zeropad() split introduced for x86 earlier in this
series, so KASAN/KCSAN also see reads through load_unaligned_zeropad()
on this architecture.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/include/asm/word-at-a-time.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
index 54653a863414..9a09620ca776 100644
--- a/arch/powerpc/include/asm/word-at-a-time.h
+++ b/arch/powerpc/include/asm/word-at-a-time.h
@@ -164,7 +164,7 @@ static inline unsigned long prep_zero_mask(unsigned long a, unsigned long bits,
 #define FIXUP_SECTION ".fixup"
 #endif
 
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, offset, tmp;
 
@@ -203,4 +203,6 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 
 #undef FIXUP_SECTION
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif /* _ASM_WORD_AT_A_TIME_H */
-- 
2.47.3

