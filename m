Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394EE4052B6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198318; cv=none; b=Jk+JrYrGlLGxTt9K1cATTVShDR8/jq4+nXU2wPYl8tLzl6y0xqOj3t48ih1zhU3vo6h8wIMShL0UisAc1lcKnsx1DTmMbZe9L/7L7T/4lYkXMxWlt64r8y3xQS7n+YzRfCOOiqyiMl/eKbu6E40qcCsoc505ZDFfiqpH3SvkJcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198318; c=relaxed/simple;
	bh=1nBlqTH4rySJJJrjvxMVk7xeYq/zwZliEPlPz4ala9s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=R2W/Exfmoc6xcv4avlP0hS76mZN8LkvENFdnhHPAIfTA9cGVxASvxPxsIl+rOdmlJQGw592E79pS+PB8afHR0+e3McoQrXmYJXWwys6O+uX2VHSV4d0k467DfuUCGQPHldSKMM7IKGdL9VLCsig/ka4Iys48xc3JCfD9PicIwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lzYl637I; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lzYl637I"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a166295f1aso18519485e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791198314; x=1791803114; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9Gm/BTCAlrmEIT8CdHGZu24+uBtcpyp+USLt6702EY=;
        b=lzYl637Izq6PNf/hfPvWqt1iVh3UWUvH5pRKwBFXS5vB++LxTPq4yAiFKtXuhjcAts
         j01i+t8GriW5+vxBGSQ4quUBv5UgytxDNgm4bZDPvguRxcURuIGJaA4Do3OOluHlk8Kb
         T1VFpqnrxGjXVN4DMBszyZZhLqhSKzS/+PNjD3bj54xbP5e+BRPop3rpJcC1eZ4s1HHk
         j4Rn44I6aUnd9ze2C+twJ5vO3yP5UPFDNohi/O+LTza+w5SBsGSZAUlGfSztX/C3iAeO
         Uuu1/wAjsoX8v5ep9UFwcbRo4uVQuo7gVnw1bkUhyubh2gXDfl9zY9MfmPhoemUGQVdQ
         Q4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198314; x=1791803114;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9Gm/BTCAlrmEIT8CdHGZu24+uBtcpyp+USLt6702EY=;
        b=eF4OsZRjtTVIUAtHA5dHn3l5THXfomGsBU5tkijcy088qzgBKr6bPYKO5XLFbBSEB/
         evoY94VUPzxhiWZ2qJ/6Kp6WAmF5COOW4JgdbNhwqs3lW4wrxaw2js7t1yw45ptDU29g
         CPIkF6H24TBOHUihS817iyqHk0sD+qxCYBcj2AGoR9I112PBeQR2WtN34jimgWdW00Qg
         PTGqkHy9cFMSHg5fSENjAtyn1DUt/9LEyE3pCF8Oof9XZhSRurDwECJcK8chneFjNoUR
         RGc4lUXDBpgCU47JJk7P1ey/yEbZwB119TTdBW9N5BYiyrEH1ehbe/BDZQFkTqon8UKL
         mWUQ==
X-Gm-Message-State: AFuF++nsmdefEk4hbN4U/I+/6oURqyX8+f/qEbziLAEw+WjWoZPKG+Q8
	iXJ+MCavbun2G/3eOObo70NXlU0Be5+2piqs5bY8NQzpEMM7og57N973OwjWXN+UR9fN4ieXuw=
	=
X-Received: from wmph41.prod.google.com ([2002:a05:600c:49a9:b0:4a1:6dc4:df0c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45c3:b0:4a0:2540:b46
 with SMTP id 5b1f17b1804b1-4a1680e5babmr113687655e9.12.1791198314148; Mon, 05
 Oct 2026 04:05:14 -0700 (PDT)
Date: Mon,  5 Oct 2026 13:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005110511.157016-4-ardb+git@google.com>
Subject: [PATCH v2 0/2] arm64: Implement support for BTI veneers
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

[ Resending this with minimal changes even though some other approaches
  were proposed as well. [1][2] Neither of those are appropriate for
  backporting, while this series can reasonably be applied to older
  kernels. ]

Recent toolchains will omit BTI landing pads from functions with static
linkage that never have their address taken. If a landing pad is needed
nonetheless, it is up to the static linker to emit a BTI veneer withing
direct branching range of the target, and direct the call to the veneer
instead.

Modules are partially linked objects, and so there is no static linker
that can do this for us. Instead, the module loader must see to this.

So implement this for the arm64 module loader. Patch #2 contains a test
module that was used to validate the approach.

Changes since v1:
- make HAVE_LIVE_PATCH depend on !ARM64_BTI_KERNEL, as live patch has
  other cases where landing pads may go missing

[1] https://lore.kernel.org/all/cover.1786768375.git.jpoimboe@kernel.org/
[2] https://lore.kernel.org/all/20260822135323.795946-11-ardb+git@google.com/

Cc: Mark Brown <broonie@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>

Ard Biesheuvel (2):
  arm64: module: Emit BTI veneers for cross-section calls
  DONOTMERGE: arm64: module: Test module for BTI veneers

 arch/arm64/Kconfig                  |   7 +-
 arch/arm64/include/asm/module.h     |  12 ++
 arch/arm64/include/asm/module.lds.h |   3 +
 arch/arm64/kernel/Makefile          |   1 +
 arch/arm64/kernel/bti_veneer_test.c |  26 ++++
 arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
 6 files changed, 167 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/kernel/bti_veneer_test.c

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

