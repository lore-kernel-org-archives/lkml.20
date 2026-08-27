Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E4536DA1A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849074; cv=none; b=aKzXP27JzD3Da6LQo0pjquOuekUCCETfFJmaTfSmAEt6NQSaPKz/INArv6D21Xyf1u1XH80TITIKalFSqKYI337A9V9oGJ9e1QdNMzYaZ9d/oje95uF6AHLxu9JIPqp+7Zt+wTPERsLjtlIlm0mGnJC/AXXLHHRINij8tyGYG90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849074; c=relaxed/simple;
	bh=hrAjX4HCx4m471e7qEjeVWi5tv1QJb4jHvqrAodiEUQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=co1g7ieYllvAkDdl/Fz1vA80Bs8hE4HGe+cfHYMb6D/uyJu0E/CJgNPGs/1tIkdmJrHCSzKtQk1WkcP3636X4Zud/G9YorwX707bj1NpabIngr5VLfsl2P5Z3RDagHUPJoD6u67gwnIj11PkCtRgR6UnCN89xHGzO06HgOlPOqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dHF/OrTD; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dHF/OrTD"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f6d70223dso20162f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849071; x=1788453871; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXhY5FIxYmRIyBNqCNy2Mkq7WbLcOyerPMehnqIVrrY=;
        b=dHF/OrTDQaqsnj2+vDsx+0OiW8zCC5mUVVwmVr3C7fz5DUlhftzPd9xS6Sry7hMnD6
         nM9BA5WGogOkcFfd6gE0Y16NCMeIZS+BNgk9tQqBRQzWJUqw1fvIplX5KDPNH3+0MItP
         yM7O90dSiWkrGIaSJNg9BCTDMTPGxjwrQY/g36TpxLMsYKj4lT2YIJXSQ+w4HZ9UsF5D
         YfYW3uPsaplr3GqwF1f6gkWRXS15dzc6k5i5AuArEpbwomQLj+R+z9tekW0JnnDa7KSH
         i5le5Bps8hwBGgSAcpNaT8D0bMAiFuF0idUssabwwD9Rz0b7FscEtYCo09vif3b/NlC6
         HUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849071; x=1788453871;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXhY5FIxYmRIyBNqCNy2Mkq7WbLcOyerPMehnqIVrrY=;
        b=Gx/IR/W/kQL3w0WPLfeP5lpLA8TF8lk9q4M+0HOhAbA7PAiPt41/fSwBivtJ5Ud6B9
         f2g3xV8eBbKqfE3zFSRODB3RTGR34BpeQbHuNORJ47aiVbSMxIHlR+PytyjaRd3vKMJT
         jOvj6FZYoHWRwy9pmy+kAxNiRqlJmRmcpqyIf9kUml533GFZ5pC773lWvz6msgHcgVg4
         J46uQA9jJxW3fewulV1gRqzR7kPQUHT0hkts68pxgNYLRER+qJYnsEjN0qH2GYULBa9y
         3rvSU8mhOPqnp8P+f4o5yRRaWnjO3n8mdaSFc9xUR95WjPpfR/TivhuOsPkBege5SU0R
         7IKA==
X-Gm-Message-State: AFuF++nevIZROgJy1LvQvPyE9qeVv94J+jv4I1NOl1HRD3myfKdrihQB
	luuVM+Bxz0HbLgtxqk3uA9gPhxfuaHX4Drb4wXqWRKPdba0rbnht2zIPP0M13mYIyuVS+3DtvCP
	xD+f9/gCCt9Xd2SOPTBYtlxkRrTElM2V/vLsEyhWJb9VBE8UGYWzkHhGOROiL1xjnxQ71Eca8vZ
	TeczeceCwOJvDuphMW6xfPdTkVFU1hHPhaDQ==
X-Received: from wmql11.prod.google.com ([2002:a05:600c:4f0b:b0:49b:2006:9521])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:c30a:0:b0:49b:8c63:dfdf
 with SMTP id 5b1f17b1804b1-49b91c5749fmr2308405e9.15.1787849070540; Thu, 27
 Aug 2026 09:44:30 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=ardb@kernel.org;
 h=from:subject; bh=XUloMLRvD65MS8q2DriEUBZ9uHb1RahsmJYT7z5cG10=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZtTuOV5JlpnrJizO3SIa5RP/t4Tn/ifHNOsnDx+fP
 HTx0dWVHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAi2+QYGXbGcpgrLuq5fD6X
 +2rW/cMbDn/8/pzb5/+S7cdf2hydNf0II8NPvaYrbJ+rDfaHVGrc4Nj9nsk1dV3NbkUZ/r+/KkR j77IDAA==
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-6-ardb+git@google.com>
Subject: [RFC PATCH v2 0/4] arm64: mm: Map fixmap page tables read-only
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This v2 now covers intermediate level page tables as well as the PTE
level page table for the fixmap. The latter is a special case, as it

a) is only accessed via the kernel image's mapping, and never via the
   linear map (except for ptdump etc)

b) must be accessible via a read-write mapping, as all manipulation of
   read-only page table descriptors relies on the fixmap itself

and so it is treated separately. The intermediate page tables may be
shared with other mappings in the upper kernel/vmalloc region, so they
must be updatable using the ordinary APIs.

Build tested and boot tested on a Lenovo Yoga C630 using 16k pages.

v1: https://lore.kernel.org/all/20260805104042.1107678-2-ardb+git@google.com/

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Jann Horn <jannh@google.com>
Cc: linux-hardening@vger.kernel.org

Ard Biesheuvel (4):
  arm64: mm: Map fixmap PTE tables r/o in the linear map
  arm64: mm: Use fault handler to permit swapper_pg_dir updates
  arm64: mm: Create r/o page table region that permits updates
  arm64: mm: Move fixmap intermediate page tables into .rodata

 arch/arm64/include/asm/fixmap.h  |  4 ++
 arch/arm64/include/asm/linkage.h |  1 +
 arch/arm64/include/asm/pgtable.h | 55 ++++++++------------
 arch/arm64/kernel/vmlinux.lds.S  |  6 +++
 arch/arm64/mm/fixmap.c           | 12 +++--
 arch/arm64/mm/mmu.c              | 48 +++++++++++++----
 6 files changed, 78 insertions(+), 48 deletions(-)

-- 
2.55.0.887.g758fc8c411-goog

