Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8909420465
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110298; cv=none; b=u83WovxDGV+/0RQvygQGo2RJABvkd029pMaaNLdtjtnrX6K66BwU1QJKhnhb58/XS3F1hhHRTVa2xlR74+J36jn9aTgEF3tgAcqZj+4hyMVHZ+pqnVlKwJMNLpknShxAtzQsDeM61VwI+4L2BoyeEe9f4yuhtz766I/0daq0bnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110298; c=relaxed/simple;
	bh=YrYfWQ8DTCejykQdQacgG2ZQYpSnZ8BFiS7ovKQqYpI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CiGj1AJTz/YaQbQ3Fv8kR38/H53/fINF/hpz6hU8y7JOYf6ozCzD2rEfuR3/3IBKhOrk40xOsIR67gbJzA89I2oL89VZ/Dsz2n+07Sg4XDniEmal4kYzrpSVzqPKi7A+OO9jmutSn/mFfvzhPZgzVaGC1nqrBnWlnyx9sUMXDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pJqb3us7; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pJqb3us7"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc92350888so9987395ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110289; x=1789715089; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUWMyzu+5vvtW+pIvov+ll8ijxwG7oGXz2aY3xXHLFA=;
        b=pJqb3us7r9B0qiHi7rxnIcJICyf5ifHlxrMvMdtnN0/P+o2eejxcDfBBXjfhYOKaZM
         9+weL2acSO5OpUt5s6BiO8D4sqD3XwklFTlFc3xscGNePftXxSfcNcz7f6Sg8tpSEvYZ
         xRyqj2OId5N14smXxiShhsj5OKr28Um6tIpl5CODrJ4A7bugecuTMVIHNiDBDfSevcuJ
         WJnvCWGjBDhyC5zXtJQYHpJLh9mmirMKslMGKDalOFlb054P+lyXTUCrSBdZNU2b00UR
         MmJD+d6Tz/dn/hkcdnQ+hOmDY3uDWoK4S7oNipmwmFW02m+u1DEVU8vplQfP0A+BOl9r
         MpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110289; x=1789715089;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUWMyzu+5vvtW+pIvov+ll8ijxwG7oGXz2aY3xXHLFA=;
        b=Hj0NfeVukmphQ5FZ1aDSq9o/sRCJdzU+x1qjV55vsyTBUpivQsBEkieQkbnhTmvBlP
         iQXYb+5tlAPEwLzb0K55WKeyZ6RBYZP9CBMISLi39DQr088T3W8va/FpN4+sPrFx2rhV
         1dm/SFIND6+i2xE/JuD5NSlibGIlomcdokiQViksZxGyUmpuErbfSinhDZtTIQKVvSlb
         DLKs54lEzd6YC3idFNNRIcSNQPsDdgAvE+kCg+T1aPVyQqZlE+yE7sScqKq3nUZFzO4X
         Zxgng7peQnnpJLyWuh5kFsYfbWaI0uCaZFLspcSYRdNuItUpanNCNflzrYxwKI+B1lZ2
         wxAg==
X-Gm-Message-State: AFuF++ktxiD71Hl/DNrPv45orQxmLaBOjWzO6zBK+tAyF52bByXMb82C
	ZxUdi8e/VPl3FKGhK82iDEJvhmNvH7FrDjcuFxVCWpqr8nJkKrcireZ3gxeej9TvkON0AYEBJdI
	u2AQ8AWCnF10ipoPBpMlT7QIRzk/f8+NFju9lvfW7C4uBCKergK4qIbvfGYjpGIUfFtt8qCxpqh
	zBEhuECriT/juVvFXOeNPNXrQyUHNFaD+rzTKxyg==
X-Received: from plhs15.prod.google.com ([2002:a17:903:320f:b0:2d7:747:8f71])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d551:b0:2d9:4871:393d
 with SMTP id d9443c01a7336-2dd2a45aef6mr60678725ad.21.1789110288973; Fri, 11
 Sep 2026 00:04:48 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:44 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-7-morbo@google.com>
Subject: [PATCH 6/7] s390/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert s390 to the arch_load_unaligned_zeropad() /
load_unaligned_zeropad() split introduced for x86 earlier in this
series, so KASAN/KCSAN also see reads through load_unaligned_zeropad()
on this architecture.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/s390/include/asm/word-at-a-time.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/s390/include/asm/word-at-a-time.h b/arch/s390/include/asm/word-at-a-time.h
index eaa19dee7699..6a055bee5ba0 100644
--- a/arch/s390/include/asm/word-at-a-time.h
+++ b/arch/s390/include/asm/word-at-a-time.h
@@ -48,7 +48,7 @@ static inline unsigned long zero_bytemask(unsigned long data)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long data;
 
@@ -62,4 +62,6 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	return data;
 }
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif /* _ASM_WORD_AT_A_TIME_H */
-- 
2.47.3

