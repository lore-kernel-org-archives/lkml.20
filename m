Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B404A33998
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226685; cv=none; b=fu89JcyrYi6fWLSSWJmI5lx4WHkOowlChu2/Wt3ZcNS3vLvRwXtrHUVo8ndliGBE/kkQSa4BwaJZRrGZajNWY3wC6IeBWTnoee840pUbv2GcuOJbuX+a7abUjdrC89CTafTKusWMYgrI5/spY0HTrfp1ydbezcPpKg7nzJG3qp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226685; c=relaxed/simple;
	bh=nJ/70F4Uy1cXNLzxnGBcwbnvOYmm+Zk99AUFnliuPv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oap+2ibwp/oBiXG6/QCC15NVGAOdu0xEDdnTZXWOlPVAhL4OxyHY4xB4m0Sl7lx4laKLEytg96tE8MHi1T/TBVDrqJFESQolzVLoUSxTkB1JH2FeVQmhK5rLyMc1i0USu8qY/dg4limo1U7j4pIaM4i0+n+IlVyqMTXkgF2XxmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjg9Hb8g; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjg9Hb8g"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so37792915ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788226683; x=1788831483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwrPzZ3UqC1qw7RtMh2uyX7vL1CZ1f9d+u4eMBeXRcg=;
        b=mjg9Hb8gXAzt3E9WQ+tOJEZBGN3GAYwdI3ZUAdofJ5XyXW9NwB7T46mSX8t9+h4kC6
         qou0d/8Si4m6fUe/O/qJLoPtGdW3ZbL00MzMsWUVLODF8UBFwKWcRjIHrgp9wA8rnDl/
         qDKPZ+vE+ECzYf8IS4aryRAWawTxwdsnRWPHV8ksEIoSw7IM3EV1BsiOMwfEGa+cV6Ws
         zHGz+/jsxyvCV4HQDHJRpM+STjHgpvch8oWKmjucC7OnugABOYWLKXWwRA7JYo/loGcc
         PiPjYHiQc2atEB9C5Pc+/AmBPA8moRS0wR+NXZxOqRzI5KGYItP+8fquPaCH0OJRqH1i
         TCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226683; x=1788831483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwrPzZ3UqC1qw7RtMh2uyX7vL1CZ1f9d+u4eMBeXRcg=;
        b=Y12CXdGigOXobJJphkE+BVjgbygXb9sN3BXCeJItxJg1A66yJ57p1MC5jf45zFdGnP
         FLHiCbT0cSwf4c+Y+pBtgJX+pinRNnUk+beybU1RH6nISr4LdnkkP6becmh5dbyOvjrp
         NWhVnQ5PTozTaBoMBZfWDhELcxgK6LiWR5ZmH591RrZEKDAQ3+57kprFK1IP7+cJ2ugf
         4yBtaAxHEev4GKQZ4cskx6K13YYyljs7Ox75kpQZM6Ik7IGvIDXxRGZx8yZqsBMUUMYQ
         OTLqxyvi4J1YIxUv0okmdAgWIMMzDxv48YoVa3F20/ZUXhrsBL0S2EvvF+AUwb05xZBC
         Rq6w==
X-Forwarded-Encrypted: i=1; AKwUvBw1Z8X9z4ACyyqAitZvaGLGDT8ezo5c1dQkQt24fYkjezHIlLwLXz6uzGcVV6lQVhYn1UMbNXgc7wGWrQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++m6MkLhRv6BQRTVVPxrUEAy0gwHFFUxGjeG0v2R0do93gipZyBe
	AJZpjk3c5r/V0JgY5b/x2jLDw5j/nH1qTd5BOdmGSYuI9Z4Go+D2QenQ
X-Gm-Gg: AYBFou1nAWEA5aPs2DI7IRhlW9ftBEzJPG4o1M1uprsMm56BNWCpzXF8j7c/XYx+8FX
	HPMl47mBq32ARztjLf5i3pguSFA2wnw3cXgtagtD/NJnlR9BGRbJEsxLYtVi7I5iVnqt2A/BsIl
	9jDuU2eHXRe6hmO9+AI8fJINgsK4c8q3giaFVjgCZWlH+hiqrgAPWAFWznMukZeVUwP8dPywObc
	tEhOWhqJX4avLvSEj/uUrSJmZFzGORJaafm0mJBMTJCUvxP9z+fnPqRv3/yf4LAIb6JpNpWeKz/
	NsDHfBvz4kIpPZQaBGBEYynpQXZcd88cwQIi0V6GViSfEh2orE7xy7UPS8hZIWikzWkUsHd9zRW
	t9+2HPhDZd03vVuqmcKAL2dJnGvYrocNko2VFuXA32ypeRTX8Xw/MVAF3rKP7uAC4TwGIOU7AHD
	X+W7/smegjZmtjAxCzjWyBbYV1lMF1MSCT/ugzF3auoErBLWaNKPzwBaM=
X-Received: by 2002:a17:902:ce86:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2d74dbfd59amr423838315ad.3.1788226682603;
        Mon, 31 Aug 2026 18:38:02 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fc3f0sm43974415ad.3.2026.08.31.18.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:38:02 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	conor.dooley@microchip.com,
	schwab@suse.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] riscv: hwprobe: simplify has_fpu() to check D extension only
Date: Mon, 31 Aug 2026 19:37:46 -0600
Message-ID: <20260901013746.19386-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel never supports D without F, since D depends on F. The
D-extension flag is cleared during devicetree/ACPI parsing whenever
F is not present, so has_fpu() checking either extension with '||'
never actually produces a different result than checking D alone -
F without D cannot occur in practice, and there is no observable
impact on RISCV_HWPROBE_IMA_FD or userspace.

Simplify has_fpu() to check D only, matching the expectations set
elsewhere in the kernel for this dependency, rather than relying on
a redundant OR condition.

sys_hwprobe.c already calls has_fpu() and needs no changes.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221874
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Suggested-by: Andreas Schwab <schwab@suse.de>
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
Changes in v4:
- Rewrite commit message: drop the "weakens semantics"/incorrect-report
  framing (Conor pointed out F-without-D cannot occur since the D flag
  is cleared during devicetree/ACPI parsing - confirmed in
  riscv_ext_f_validate(), arch/riscv/kernel/cpufeature.c - so there's
  no actual behavioral impact). Reframe as a simplification matching
  existing kernel conventions, not a correctness fix.
- Fix "F without D" -> "D without F" (Andreas).

Changes in v3:
- Drop the sys_hwprobe.c hunk entirely: it already calls has_fpu(),
  no change needed there since v1 was never merged.
- New thread per maintainer request, not a reply to v1/v2.
---
 arch/riscv/include/asm/switch_to.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920..8186cda88e17 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
-		riscv_has_extension_likely(RISCV_ISA_EXT_d);
+	/* D extension depends on F, so checking D alone is sufficient. */
+	return riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
-- 
2.55.0

