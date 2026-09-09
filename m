Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0593C9890
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971609; cv=none; b=LJpkHvqnJMLUs5hRQ050kRcl0YKCnPktSWi28qNQErLYPJNtnsBGWWTFONNeDCnrYVujaaX4jzn6rHunRzVIfr760AChuW5yymeZc5nT1mYvbUO1BFWabbdQRSFmvQ6R63bYy0oyILW7fnhLVajNIxc2qoM72Kx1REBOawiRoJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971609; c=relaxed/simple;
	bh=3Q9594mGqB+fQ/IHa8Dz2VpM4t3kvv/GfrozR8q0S5E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bm6kXejVe2ToBiTXAECdAnX3DZ3JkY+/cdLkOmUqA2b58a10iH8kEd77JlmEYmnzp9sRZUZa3iI1cqreCQAOs3sDLvXMuFd9HBQ+0Zc1h8XZPpJ2gfnE/YFUDoS8SljO8f9dEB2L1KWkgFbAxybDjXy0/SuG4i0lDMnhB0eq4hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ue0Nqeau; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ue0Nqeau"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cf5bd2f12so80804135e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788971606; x=1789576406; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7rXaYLXeDaufl+lX5zkSQUxxWafEIsiLpWoK4oXgy0=;
        b=Ue0NqeauhHgjTdYs8fs1lEOpql9Vi5bsW6pwIRob7BCf5irMTmGoOmPqxkKzwwySTg
         0HKLJbS4Ma0c7Ir0/60L5aNajjntCGFT7hwqvfs3d9OzwIAiG0RDq5uG8h19p1akagSa
         bUVKrbS4tvInmqWVsCa86JQTdPX7hW0P3aWBSYtZgIFw1d7U6hcGk/9y6OhqHWnDw44s
         J5m8YpKrKMJYftzP3TgqgnoMpsGu4yRtbCJ+stNLhb0+TzcxElD/xYQttJ6bYH+RJ7a1
         LJwb1NdS4oLhPRg/V4L0xiQPy8g99Bkfo/8wFu20bkFOkWOZgVof66JGECTmRYhsG4j9
         VT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971606; x=1789576406;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7rXaYLXeDaufl+lX5zkSQUxxWafEIsiLpWoK4oXgy0=;
        b=NZWM1Qv1pQJ8bnnaR+2DxRFbZjJL/iY+QJIAJd68PHg+liHHXExE/bLOgSx+5BIUu1
         5o2loBFHDLP0Px28Ae/U8ifEGBM9w4CqKNb4qXx/hDLgrrDiX8VelzIvvS+ligBgn+jW
         NybDQ+uTeK9Efv0ypJ43coxfpbW6a5vx0vF40gx3CFA8NELH4PM7tADGESNxTJ74XkjH
         5CitNzNfHPbQqolnbVSutiWXz1vzUhO2UgpKg1Pdnn/84FS++UQ6IQRyILcofkd0GX9T
         ILYcgZFvKf5KSF0jeCUwpWr/l2a1gK6oIc1PgoJoR6Xrktar6rhuJ3s8nD90hPnVijfq
         jrjw==
X-Gm-Message-State: AFuF++kvzAZ2+ie/VmCyAPA2FzClIZ6btrfxo6tSHnSgn2H11tYZluuv
	WhHYuIA2dZjo3M/kmUaeN0wfEeewlRrkotmnIj+zbpzQKKEnqL/L3u81C3/9ev26IJQM8e3PGQ=
	=
X-Received: from wmpd22.prod.google.com ([2002:a05:600c:4c16:b0:499:caa3:ae0f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:8498:20b0:49c:cee0:f383
 with SMTP id 5b1f17b1804b1-49cf828c65amr260689035e9.16.1788971605881; Wed, 09
 Sep 2026 09:33:25 -0700 (PDT)
Date: Wed,  9 Sep 2026 18:33:21 +0200
In-Reply-To: <20260909163319.2116279-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260909163319.2116279-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=ardb@kernel.org;
 h=from:subject; bh=rKUAJsgtj9Irtxu4FWQLSWZXKAdegrFKPi39QCTPPzM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWthV2Dnw2g94eYvM+rNMyqL/1V9L2KdfMPvfN3kde1vF
 B5fcNvcUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACby/inD//CUJV+3r1i+9eNp
 70cbtAS+9v5j1c8o26L94sD2XdEHaqwY/ldqXrr0IOLIm4CqZQej7rPtPf4iKOoCU8LZtHbzjG+ f1/ADAA==
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909163319.2116279-5-ardb+git@google.com>
Subject: [PATCH 1/2] lib/raid6: Switch to Linux's NEON intrinsics header
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Including arm_neon.h directly requires workarounds in the types.h header
that are ugly and should only be applied when actually building NEON
code.

ARM and arm64 both have a asm/neon-intrinsics.h header that applies the
same workarounds, but without propagating them to all other C files. So
include that instead.

This will allow those type hacks to be dropped from the ARM tree.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/raid6/arm/neon.uc            | 2 +-
 lib/raid/raid6/arm/recov_neon_inner.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/raid/raid6/arm/neon.uc b/lib/raid/raid6/arm/neon.uc
index 14a9fc2c60fa..fb31cfac1f86 100644
--- a/lib/raid/raid6/arm/neon.uc
+++ b/lib/raid/raid6/arm/neon.uc
@@ -24,7 +24,7 @@
  * This file is postprocessed using unroll.awk
  */
 
-#include <arm_neon.h>
+#include <asm/neon-intrinsics.h>
 #include "arm/neon.h"
 
 typedef uint8x16_t unative_t;
diff --git a/lib/raid/raid6/arm/recov_neon_inner.c b/lib/raid/raid6/arm/recov_neon_inner.c
index 53c355efa7ff..afd225a533cf 100644
--- a/lib/raid/raid6/arm/recov_neon_inner.c
+++ b/lib/raid/raid6/arm/recov_neon_inner.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#include <arm_neon.h>
+#include <asm/neon-intrinsics.h>
 #include "arm/neon.h"
 
 #ifdef CONFIG_ARM
-- 
2.55.0.1003.g10538fe699-goog

