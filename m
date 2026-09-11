Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21AE43801F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110280; cv=none; b=jx/ioI6MbTahT0Ex0CqN1yhFldSYYvWL4K9KXqHpk4mqED7uIudEIqNO0ygO0My/4ojd0EDCVhBqm27DCUI2VypcATQucWPn6aHM0weeWKwMUwq17rRp8crD7257JQ3w6SpEd3e6TeyzxjRsKz7IGzRBwr+/yV3XtSWd/2uj0iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110280; c=relaxed/simple;
	bh=UhHCzY+Me2VDM6hFXb7auBwPsFdj7mYwT1iwN4Svzqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pJnyx4zBrie5qJEusSLEyExjlbbQ3y2bAwNFrmxTlA0xBgCuHcRgwNi+CZYe/GB/qa3d0OPYsY5csUK2RhDBhni7O4Vwj9TUZxh2wd09NzI92xCZC+Wn10s6tk/k/pE1HJFa++KqCS0FK71KBzHMA5jxCKUst2tUVUqltq02o04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U5NBQFBO; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U5NBQFBO"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so796634a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110269; x=1789715069; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCU2xeiF06KkVqtcXVSq5dyJUCYMUIv/B5XyYuirb0Q=;
        b=U5NBQFBOXexk3KfylHWmi8+dqvidnBYBiR4r1q5DzkV/MJCCsBD8w4QYaAg/Mxa/CD
         4l4mUQgBbr/C3rnt7LiNft0TAfEKDodlAFecEOl1FU0Qu5cf+LIS/+Fu9e4RmBIfkJIx
         TuHqH0IL9kz+oGUQG+QNG6WxO/e8qPgQeoqyUFxNbsjX9a0zJiaI689NBLJH2gSaA8bF
         6k2hY2bw3PJWfBv+Gx0doEb5OX8+S7okyjEL+/uInV94k74nEA4N0k2Qd0XF/l2SDWwB
         NAlgAN6WBt6T0l4PO54xpc3p6ULqtaxY1iKOTe1OA8z688P4TXBF/bQVKzhPbnR7cRz9
         xi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110269; x=1789715069;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCU2xeiF06KkVqtcXVSq5dyJUCYMUIv/B5XyYuirb0Q=;
        b=NKzoW02LUSVyyf7/CjZgsRErDWBw5id6ICMnfZkYmwdN4/xVPVbXhTdTxOUDJiM0cE
         v9AD92mTHcnZniEEmprF4WjVyDUrbbBMI0jemcr/r7I4GtNlgd9KGXdsdKgLPhTCsewC
         ZksYz5kRyqqJlGab6Zlgt3QJI+f8QMVNmbZyzicgAweQq8cVadRQqzNHpoiSe5zpcaEv
         V11aw8vqZj3i4eh09BLU8g2f+nW8n4WLMW/XNzb6ycocNNMwuGhLftJHlBlYGwb5bV5i
         3QiB0YEcTnmdYOar17uaaNaWePQYpNl6SCfVTCN6zcHLDMJKVacJU0f3+jnpJfUSgqQs
         FJiQ==
X-Gm-Message-State: AFuF++kSwcUD8HO46uWnpt0TDJYn0pa8o6CQ3vl8v5HdEkFpUM1gbWKo
	CjFOilVEnD3UkkssbFzZJmiH8oKQORwUhwMTJesUL9palolpKJ5WQ/ULixBVpcMdelcQH7AwrLv
	Uh1+EkFuxkCXM5rIMrqPtXUv23JiyVKbCskEW28vQgES5/R9n+zgZA9NfE3xTp3k6h1+52G1stJ
	FKMegO4QB+wY3SAxHGhyotpM5ZnlMm4OunS6E1jg==
X-Received: from plbkc7.prod.google.com ([2002:a17:903:33c7:b0:2dd:630:cea4])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1448:b0:2dd:3d1a:6958
 with SMTP id d9443c01a7336-2dd3d1a6b2fmr2624175ad.6.1789110268515; Fri, 11
 Sep 2026 00:04:28 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:41 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-4-morbo@google.com>
Subject: [PATCH 3/7] arm64/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Convert arm64 to the arch_load_unaligned_zeropad() /
load_unaligned_zeropad() split introduced for x86 in the previous
patch, so KASAN/KCSAN also see reads through load_unaligned_zeropad()
on this architecture (e.g. under CONFIG_KASAN_SW_TAGS).

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/include/asm/word-at-a-time.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index 824ca6987a51..656e3274ed7a 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -47,7 +47,7 @@ static inline unsigned long zero_bytemask(unsigned long bits)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
@@ -66,4 +66,6 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	return ret;
 }
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif /* __ASM_WORD_AT_A_TIME_H */
-- 
2.47.3

