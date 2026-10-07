Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B141D629
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388672; cv=none; b=Teegz2sePprInhJFIr2VEA6xZA3KcB6tLCVlHtaNahGbKC6zAnC4Ek8ezrGRTdqZJjbVJ/Bp1DyA89OshKwKSPoaWhqb7axQyTk9F1eZJWSkm/uLCDIQ6++9KXE5VyQsxqpcpdxVcy+JwC840zrNfmeMwjhdoIMvszV9AYpu+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388672; c=relaxed/simple;
	bh=bBnAXXUmE8Rf5xlW6stluIlOgSSprXp3socUzBXbJJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oxsvBOWhl6ikVzh1L3nb61k+NWvYOFloY+0FF5NuB1kzgaxvJSq5O/W7sp5VrlyA9qW/Pxs5TAcdLe2dddh+WBCnAD6zuQSTviv3SkpAD91NvARK4xBdt7P1KEelUeSPQqI5q67UA9bA5nucoeFP6TIQUvwcHBCy6LAU2spyUWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GuCjH3fs; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GuCjH3fs"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-144f79153f5so1640268c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791388670; x=1791993470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVUR0mPxOZ7cLe3tx3kr6IkZOSqHAPMm8wQmfjR1ZyE=;
        b=GuCjH3fsw25c+WCl6OG5cXciZxRCrj2n/9PUkzKb3Qt2GnCcKM242YCzZiaaf/Q6ul
         r1HtxjyGKJZiIC1KwIb0z5rm45zkaAz/eWqAxbyj0C+aZGbgauK8ZnQpH1g0diXU+wTA
         s547drRs+HqGhi3ouaN6fWAGsC3lNl8POLFwqkn/IdlRfNDhKfHvr5PsQAPMbV3RTlFL
         y2W/8j1I2p/ulsrnqszlwLG2UKQMW1kkSBMw1qf7aTRMWZk3ZjabAax79jsi/9+h1/pj
         hNfKzqLQAO3517kakL1UyCoO0MYAaDqoI8RPfZcaQpFSplMbYbSVJWs1MN6khuAhi+vH
         x4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388670; x=1791993470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVUR0mPxOZ7cLe3tx3kr6IkZOSqHAPMm8wQmfjR1ZyE=;
        b=tzN2crpr/8SYPxEnDglZM0Pf7MY0xLs8J3nT8/yguA+WTKlUIRSTyUopuwQJfze0AJ
         EXiIjWdlyLxEB5jPPeyYQFyj744QpK1mLUMwNIlRqapbA/3sT+gxdomnqSeSp18h/SYV
         Ht96JjmHj+a2yxrsQDlKCJOqYn17rvR75g3krKRLtt/l5C217m7dyr8wlIPQekYaDLvg
         ewrYPQqH0HLLePrETivLSoczc5gFAB+cxBt6dUXqYOhRPKBjC92jvm/zwc5l9+2acT6t
         5hRqfWqc0MwXpUNWstCHhsYDxKIaTKAwMHkPaBr1D5Q2BuCc8qHT7KRAtN3XcI7T81nI
         8xpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbjFSzia9g8fGoltfkfCAUddEjLwU759udwAUDe4gG8XtS5pFEsNaGH20DIqDaLa+6tyiEn2pZqav4bO8=@vger.kernel.org
X-Gm-Message-State: AFuF++kG7afB/2ruM+aAxl9P/E/ZiBQJisfzDNMPYlX+fNyY7H3dEg1l
	QV8zmL1hIBg3RbSKBG2XiQSfgrUlKI4b6Y9yrSqkt5xbgi2RS9nzCgJjNh2hNor6U3k=
X-Gm-Gg: AYBFou0e392q5qmKMzmGg2IA9g+LTS3OOJbaWD4SmH4MruZUAaC2IDVHMhi6q3FSEVn
	Dn214mPvyzNbrlQ6StnFg2kaqSE4GOUsLPosUHcv4+hSjPsXJrKbvGkJCUoc1ZlCgiJt1TjCF6J
	FWHJ3ECjXlCIQr/va2s0/h50KoxHksCzPvlFvjn9OQKRrkGu/vY6cP8FjoThOknsdX7EPN3M/tF
	2wcXN3s4qYX//67hu0Vno+koZ0aBcOTYhVbzWia2hiy9xJhuJlAHaCNxOqlRVcGKdxB6Pgg3f2z
	AOxNuZr/3TPMWucmkSR0Nema7b8oF7ulwE7QgHb8JKfHWyavq013x4W2hbm6EQPvxqcx41Lxo/5
	sCr8TNYl+JdrxFqrOffc3Vnx1VX0mU/cNq9MbB3su5WKPyjNeFAyXpS+uBHzS5nsA6//0MsouXJ
	W+2+xpyFbLCYKsVAO8jTRKrNRMU6XBC97vdZUy2GvKN/A3eYy7zi4shxVwOqJ8MsSmL5V2Wevc7
	BQPZK7o7xjxwxQqlycT
X-Received: by 2002:a05:7022:512:b0:146:84fd:7b58 with SMTP id a92af1059eb24-15d2e03cf39mr9053699c88.9.1791388670115;
        Wed, 07 Oct 2026 08:57:50 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16168f586f8sm9457788c88.13.2026.10.07.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:57:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] riscv: cfi: Bounds check restore token before swap
Date: Wed,  7 Oct 2026 08:57:40 -0700
Message-ID: <20261007155748.291814-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the user-provided shadow stack restore token is not checked
before being used as the address in ssamoswap.d. While an invalid
restore token will be caught and raise SIGSEGV, this happens after
writing 4 bytes of zeroes anywhere in the address space. Check that the
restore token is at least a valid user address before the swap to ensure
we do not scribble over kernel memory.

Fixes: 66c9c713de59 ("riscv/signal: save and restore the shadow stack on a signal")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/usercfi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index dec0ba5eff5ea..23c4d6d9d8cbc 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -206,10 +206,13 @@ int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr)
  */
 int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr)
 {
+	unsigned long __user *token_ptr = (unsigned long __user *)shstk_ptr;
 	unsigned long token = 0;
 
-	token = amo_user_shstk((unsigned long __user *)shstk_ptr, 0);
+	if (!access_ok(token_ptr, sizeof(token)))
+		return -EFAULT;
 
+	token = amo_user_shstk(token_ptr, 0);
 	if (token == -1)
 		return -EFAULT;
 
-- 
2.52.0

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
branch: up/cfi-fixes
