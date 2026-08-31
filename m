Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB9239E9BF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154980; cv=none; b=O1c9s7Ua+6U/rrA65VflxHKKt9/ZWYM649QHX4X9/e9ThLBQY7g6rWfO/gqmg9V5maGmWQlkQBJ8/b5ck+TCJe7C8nGculWNDZy6YgS3b0WxSDK8OR7InQVynzhflGYc+QxyvcQapbQhbEAOTxkIz9J5esfwMhPTx9SovmIYjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154980; c=relaxed/simple;
	bh=Op/XItXxXOAr/NkxxBOxih26AjZkhlDofAzSF9G6YbU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k4focNcBs5kzv3+tU/pEJY1RW1hzPJH03i27/SLmyBirFlvLqnFJU59VR4vwZhvZPNXsHxbQkjnUcHo1fsZPEt9Wm73n0UYkqQ2x9D5VPRRflVlRy/CB5tKgvpLt6bi6d4zeIzSzZK4k4T1Y1nirRLhBdiR81J64ISUEbALSAmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxcGGzQV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxcGGzQV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1313961f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154975; x=1788759775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8abeE7yuo9J9DmBCNkbVrY67aO7PUOd2dMVcC0+Ats=;
        b=JxcGGzQV2lYzX4MWfIHSNq5yO2suK+UtR5PzirGp9VSiqOtv54nuptzDjQN33dJTim
         gSPufnmmAUo18VkoJffw8IaQgvgchASM2Hmc+ynsVZzEkG+3ilDtNPL2dft9tkW2kYOd
         2BLnEeJH09aUAlFUmz34bUJi9taGcGRYk4AbxH7kE6EYK12cfVAmiG2coPHhMaPNO9IW
         pBOkXFycdpYG2zibnQz6q27YEbUIbtvKakY8ag9lGZdehMdIy4GZ89U4phDlGOLZ2RX9
         MVZAVrRe0J1p6GW9TYDYwilCM58P3BOMOI++wWtuyWHdOL+v9gRB8YCyWZ3O0aG7Zx7A
         9Xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154975; x=1788759775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8abeE7yuo9J9DmBCNkbVrY67aO7PUOd2dMVcC0+Ats=;
        b=LgEIIeDy2yozGuEQQLHIOhf6pS89G8TvxdN/8EEyWQ9XSCUsasTA1nfYszxl7PPGp4
         +w+rEoH2NUIXAU4TllYnB2k/q2u1QSia7HLmtE9c5f61Z/9wudJn5mszZesUglTP4WlQ
         rOQNlha9gwEP+IAsKCgajyD238plfZNnzh2ECBPBl8buspjkHF5NtauFksfcXTZhJso+
         JcitqoMfRHC23TV+lvjyTxyMgQjlmdyzFmhldYtYbr9dP4kz+QdHJAyB1aY0NopI9moD
         VXCR8CnU4qP8VjIkykTYZhYGf0yMz4Kt7flRTXKLayc6tyFj74TdOAD72g89Yb4UGLZ3
         TLJg==
X-Forwarded-Encrypted: i=1; AKwUvBzczD1ARZM+G4OTYZo8KBb5gh95BqOeMlFiQCxwV5a4lPDrOIRRyMn0+JKBmzRnUbRPEfUNdJ47xp4V2VU=@vger.kernel.org
X-Gm-Message-State: AFuF++m7mSa2Dlq1dixKAmjwV1XPlHQg9YW82bLqINZIOc853jMV/NhZ
	eM/OM/peemt9DJQTRzMxvkzwwY/REY58oYYBi83Ymg7c4iH8UsIER7li
X-Gm-Gg: AYBFou3T1jH0uR9MOOTB7Es8kDPC8I1JwH6Gz0JgU0FxV2qi3cEynkC0HuopadHB5Yv
	rSBPHYcE3Tbvp29d8dipBNk9Gve4Z6ZThIM6jbn3M4hejdxayU09OQxMr0b3oIZDYBCYdtLpq7W
	HRxFOIKjUnhu3RiTIl5VUUrhOeE8bnWhp6E465AWgiatSFNTvnJPhL30mIa9V/zVQ4cXA8QWFek
	oAFK8I/EEd+N1srPqHnSsQxcqHqPZwAEvKvyGFbIAZ1SE9sFZETOlYNGkncBFDus8tyObMDEVjs
	oYnSYeLcvq4/gwVueazp+tAhMMmPJgs935EB1yqZmx60zgf1nZy1UoZXIjanGhOmOqVc0/HrLIO
	HzLAyVOsTAI+W2WJaURV7Oe/+fOSItFmtREdV5j0yl/F+w7oW7cM318BXq6kyK41oNTnxYQjndV
	HfmKnY5knnYbTr/9V9/zTqOR8WMcSZC7TKZsmhW3fe9oHAV9Tk5M5aTxBV7xNXmL62FCm6IOLQ2
	ADDxQfZVwaRSmyYpAJ1XQ5NFP42KLrw+MIaSPpmPtYflbRYWu8BgFlLSqBsOooyTfxMONf0a0uX
	imz2zM6NdEJaz2C48x1LSNrgPOqkam3krBq/HHmgkE7+qP7MyC6UmY9Kxi2y38EvYw==
X-Received: by 2002:a05:6000:38f:b0:484:3317:a1a with SMTP id ffacd0b85a97d-48433170bb5mr22283097f8f.27.1788154975401;
        Sun, 30 Aug 2026 22:42:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb284cbsm20138400f8f.30.2026.08.30.22.42.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 22:42:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 6.6.y] arm64: mm: clear extra idmap level before use
Date: Mon, 31 Aug 2026 07:42:47 +0200
Message-Id: <20260831054247.33352-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 6.6.y adaptation of commit 0e9df1c905d8 ("arm64: mm: Don't remap
pgtables for allocate vs populate") removes the clearing performed by
early_pgtable_alloc().  Its replacement clears allocations made by the
generic page-table walkers, but 6.6's create_idmap() still allocates an
extra root level directly when a sub-48-bit VA kernel is loaded
sufficiently high in physical memory.

memblock_phys_alloc_range() does not zero the returned memory.  The direct
caller therefore publishes an uncleared root page and passes it to
__create_pgd_mapping().  A stale nonzero entry can trip the bad-descriptor
BUG_ON or be followed as a page-table descriptor, preventing the kernel
from booting.

Clear the direct allocation through its linear alias before publishing it.
init_clear_pgtable() also supplies the barrier required before the table
descriptor becomes visible.

Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
48-bit virtual addressing for the permanent ID map") removed the dynamic
extra level before page-table initialization moved out of the allocator.

Fixes: 54322d95309d ("arm64: mm: Don't remap pgtables for allocate vs populate")
---
A deterministic QEMU A/B used 16 KiB pages, a 36-bit VA, a 48-bit PA, an
Image loaded at 0x1000200000, and test-only instrumentation that filled the
extra root with 0x02.  The affected kernel hit the expected bad-descriptor
BUG_ON.  With this patch, the same poisoned allocation survived
create_idmap() before the test stopped deliberately.

The injected contents make the allocator's permitted nonzero return
deterministic; they do not estimate real-world incidence.

Tested on:
  6.6.y a4a971135a2ff64382ae4235b3ae60503bb1036a (Linux 6.6.155)

 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e075792d722575d38488e8352df8947c6aaddd2b..4e9e997e08daf543e5c09799563f991a9f8a7cc0 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -777,9 +777,10 @@ static void __init create_idmap(void)
 	/* check if we need an additional level of translation */
 	if (VA_BITS < 48 && idmap_t0sz < (64 - VA_BITS_MIN)) {
 		pgd_phys = early_pgtable_alloc(PAGE_SHIFT);
+		pgd = __va(pgd_phys);
+		init_clear_pgtable(pgd);
 		set_pgd(&idmap_pg_dir[start >> VA_BITS],
 			__pgd(pgd_phys | P4D_TYPE_TABLE));
-		pgd = __va(pgd_phys);
 	}
 	__create_pgd_mapping(pgd, start, start, size, PAGE_KERNEL_ROX,
 			     early_pgtable_alloc, 0);
-- 
2.39.5 (Apple Git-154)
