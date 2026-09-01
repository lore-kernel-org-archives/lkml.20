Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB86429814
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275912; cv=none; b=tDF1Ue7pA/fQNkNKGoeNS6R+Am9EsueRDkWlG4hb5HgdLNCmrn0UcFNHy1tYXjelHh1VXC9+VYm/OffLlR+S69lbDB3MYGGGmy6Ti060Sg9wRhFJOJT9BGwbkS+9HxUGF+BLL4JKacVWLYtfoMRkIBoCMGuAidTl96mzBGOR4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275912; c=relaxed/simple;
	bh=bY8nH2vhIoT515m54zO/tX1HG0BTTb5To6RELqrfLnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYiqfoM8V0Fjs/tXRgPS4CVt546UvhlG2LkIaaqjZc81MVTDYM+1wPzR0R7GYWOUPvo7iybLTwGuzPtHNznOgSVt5L7glv3VjpyKRZgBe1vB54qEkHCdSBHgAdMzd8cwQd8dPZgXiF+cOUe0dzAhdaQDarWPmn/2UucfaHue6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCwoYnt6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCwoYnt6"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-85457d780adso282441b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275910; x=1788880710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8WFJH0ESiWBm+RbvdI7K60WSeg5h8yrXuENGkm3xh5c=;
        b=LCwoYnt6FQFVWLNYiXlJu/abVcuGptLQAwTCmE8c8SbaSFSF245SGf0uU186I5DdHp
         94saCPKTfgOHdCN+4QFYw/SwFWktXlMf+1keOFsd4HN/pZ64BMkd/yKI8cf63O749+U+
         T1u6rzG1wAx2CmfUUQ7J38JZKbMCneG4/tEdM5m4UCOGzDZINT//m0uRzhroBhmA8Glv
         +DF6b22iibEKagsen+XqueoHpz0lF4HhlH7kCHbf1CqckgmX9gub/8V5uKudi73loJ/y
         qsZ592t34sbFEB/1dZp74nqGvdzlIDXfzYOKMULhlr7FVg3ENwt6r/Td5krrbz6YQCl4
         EPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275910; x=1788880710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WFJH0ESiWBm+RbvdI7K60WSeg5h8yrXuENGkm3xh5c=;
        b=VIE6fWm24BhoVKCD9lpQ3RgD13DMaPmca5/TUhbLP5t5O3E1BWUDe4JSqxybWFxCje
         naxoTjK4ISU2HK+y+yqfILaluxQLw5edxOezoTHk0B0/W7ogNYU6KZdUTTLS0c8PH9FW
         lgT03Py14fH8lLlI5iZpZdYA0mQM+MVlNI9T6akp4AaO6Gzwnu4e9OYAd+h1nxcjadMC
         bKD9j87iQhxnuDGX7Fd6s8GqQV40CNs8l8w1E68FFCljpSg+RqRoE/n0H4Zpk/DFgWLL
         BnRZvB0aFX1xFETqj8oOU5X5+RB7X+idHWu5dcj5NSxsVSeBk2yh2dvYTSIfi3hRwa0Z
         ukrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+hgmavuo2GSLief7Nbb+EP7q0tJMVnfJkuHAZ2xj4ZGELQCQXMPB1n0EChJSk+QUyGRPFkmglssF3bSc=@vger.kernel.org
X-Gm-Message-State: AFuF++lVR6anAftEkbU//0EmIhGht9NDw+0FP6VTq6kT2WWPLfXuIVHY
	p7IM4pvNmeCAC6oQYBIA+Z8aeqo4mPH8s7hbrHKU28e7jKhBd10M3d02
X-Gm-Gg: AR+sD12HlqyOozEseWbLeIS9Jt2PDLMnpU1G/QKb7g5h27P/9G0bnaFir1TbTdWfyaZ
	krZPxA7ZbwDLPELLDjyBRqAAWBZIyhUeH6fRaX8KUjcTFebWMxnhwUm2oQaJQr6lCvhVwNmXJWE
	hIVqWlgrTRRHlga8TFooNfBju291ANLo6i8+8PJgq2v8lB4gTHc/4dxIPIykohIaBUdqnnlMPED
	rqrCyOyZFC98gDcbZiZ/bErtCzKic6cTBEpfZLEOo5JCYewu89iXEOEJgs5ZU0TJXcubrkV+gC4
	W0NMSmXYdRYgJqqL2pEn3bXvVSBRzYHypsBgXGMTqIWAyKvrKnBzB6LFQXqoK75o8btoHDXWDWX
	n3/R1Q0w+juAAqLxGzAPQ4I85q43wTON0hu9U5x4t6PreZI5OPms1cwv1bMk7rIsyqqjmClw0XW
	kon8LgsMfu1tJSgOZOrP+cKENVhJmrlA64VjB6hlUa46wYkO3zJ3gFdH5ooPX87xLeWMD14t9Yr
	Dbqu8CxK7if656IgrGhulV2hw==
X-Received: by 2002:a05:6a00:4a07:b0:850:a86b:6ce1 with SMTP id d2e1a72fcca58-85625c2c844mr22271937b3a.0.1788275909909;
        Tue, 01 Sep 2026 08:18:29 -0700 (PDT)
Received: from o6.lan ([240e:391:ed0:47d0::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f33a0sm89911b3a.9.2026.09.01.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:18:27 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] mm: make persistent huge zero folio read-only
Date: Tue,  1 Sep 2026 23:18:15 +0800
Message-ID: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The persistent huge zero folio is shared globally and must remain zero
after initialization. As Jann Horn pointed out [1], kernel bugs can write
to pages that are intended to be read-only, including in security-sensitive
paths. Protecting the folio's direct-map mapping turns such writes into
faults instead of silently corrupting the shared zero page.

This series makes that protection available to MM code and applies it to
the persistent huge zero folio. It is best-effort: arm64 and x86 protect
the permanent direct-map mapping, while highmem folios and architectures
without support retain the existing behavior.

The interface remains page-based to match the existing direct-map helpers.
The wider address-based conversion discussed in [2] can be handled
separately. Permission changes and TLB invalidation stay together in the
architecture code, avoiding a noflush interface that is easy to misuse.

Patches 2 and 3 add arm64 and x86 support. The approach follows the
huge-zero-folio discussion in [3].

Link: https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/ [1]
Link: https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/ [2]
Link: https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/ [3]

v6 -> v7:
- Rebase onto the latest mm-unstable and adapt to huge_zero_init()
  (per David).
- Switch to a page-based interface and move TLB flushing into the
  architecture implementations (per Will, Dave and David).
- https://lore.kernel.org/r/20260730090647.2401252-1-xueyuan.chen21@gmail.com/

v5 -> v6:
- Patch #01: Skip the direct-map permission change and TLB flush for
  highmem folios, which have no permanent direct-map mapping.
- https://lore.kernel.org/all/20260727143426.1077133-1-xueyuan.chen21@gmail.com/

RFC v4 -> v5:
- Drop the RFC tag.
- No code changes.
- https://lore.kernel.org/all/20260718095647.182592-1-xueyuan.chen21@gmail.com/

RFC v3 -> RFC v4:
- Patch #01: Flush the direct-map range after changing it read-only, since
  the folio was cleared through writable mappings after SMP initialization
  (per Usama, thanks!).
- Patch #01: Keep the flush in the caller to preserve the
  set_direct_map_ro_noflush() contract and make the flushed range explicit.
- Patch #01: Clarify the noflush API contract and the reason stale writable
  translations must be invalidated.
- https://lore.kernel.org/linux-mm/20260706130440.9295-1-xueyuan.chen21@gmail.com/

RFC v2 -> RFC v3:
- Patch #01: Replace arch_make_pages_readonly() with
  set_direct_map_ro_noflush() in the existing set_direct_map* family
  (per Mike and David, thanks!).
- Patch #01: Use a direct-map address and number of pages, and document the
  direct-map-only and no-TLB-flush semantics (per David, thanks!).
- Patch #02 and #03: Update the arm64 and x86 implementations for
  set_direct_map_ro_noflush().
- https://lore.kernel.org/linux-mm/20260609143801.7917-1-xueyuan.chen21@gmail.com/

RFC v1 -> RFC v2:
- Patch #01: Drop the READONLY_HUGE_ZERO_FOLIO Kconfig option
  (per Dave, thanks!).
- Patch #01: Replace the huge-zero-folio-specific hook with a generic
  page-range hook (per David, thanks!).
- Patch #02 and #03: Update the arm64 and x86 implementations for the new
  hook.
- https://lore.kernel.org/linux-mm/20260527035607.14919-1-xueyuan.chen21@gmail.com/

Xueyuan Chen (3):
  mm: make persistent huge zero folio read-only
  arm64/mm: add set_direct_map_ro()
  x86/mm: add set_direct_map_ro()

 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 12 ++++++++++++
 arch/x86/include/asm/set_memory.h   |  2 ++
 arch/x86/mm/pat/set_memory.c        | 10 ++++++++++
 include/linux/set_memory.h          | 17 +++++++++++++++++
 mm/huge_memory.c                    | 13 ++++++++++---
 6 files changed, 53 insertions(+), 3 deletions(-)


base-commit: 88297631d4d42f6004cb39c0ba3da7d2d10a616f
-- 
2.47.3
