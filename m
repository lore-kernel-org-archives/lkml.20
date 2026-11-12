Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501080;
	b=N4vX8KSKX8LCy6bTRaxwDRm/LHiCEZspgzTAYfOTXCYyP7Yw0y2p1iI+7w1YpFTJidQL
	 SC1W3zPtpxJsezoSuty+kDmwhUr8cXN2z2d4IfkVrupRXPatsGyp27Q9icYWa0H6/lak3
	 2QcNsz3oGYT3vmQFOhuQgGJ4PA8q0ZRnOgL06H1QSJyHy5aNRbvLTwYK53BfpEHa41EXJ
	 A9NLoIKf9utKOsNFlAqqGCmm0vU7o5UsQv775eNlV467JtQbMXVfGJ0qsPy7QeJ6pnBsg
	 yDPUFo+JLEA2j4I0cyPiQ2A/0wDvlYYYTGw1AvINHnh3ECeqO/rqHxITNo8D+37+Tdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501080;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=PIMkHHsGvTQ8orHN0lDgvswNZ891skgsXy3ktpSlRWk=;
	b=gKEZ460Oq9gloPT8wAGh8uEHZmn8bfQz/Oh41QY8/noq7pZefixDKDNlZj+Ti/I6DgMk
	 /yoZFT05thkScPw20Y0vETLKuaXMx1guaD4CAF2EIfpsK+btz27l20wN/FuTu4mwqYNmP
	 ZFwtPHwR9pCqly1BVbgJ8JUK4OvI2+izQOQ2ZzHrXF3/HmlZcecICp20pfBQk7bAyeq4E
	 neqK1lO7g+72cuQfJ4kf4hYCcIv5+DyAvSSHqQ13TTcjH5dtWl46uKYFe9tI42XWJQ27e
	 Y5ED5t+bowRAQgswzBf2qqV4m++5CBw0C5duj72dfQ75oNT6qtw6w0nJyqF0JkkTK8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2t9zxZp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F21606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2t9zxZp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9CA1F000C4;
	Thu, 12 Nov 2026 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501080;
	bh=PIMkHHsGvTQ8orHN0lDgvswNZ891skgsXy3ktpSlRWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q2t9zxZp4Jtw908FdZFxHQGmi1rTS5qT4sawJkOYWVvTFQIb3rajD07d1+7MNXe0p
	 qcL2OLNMc4qrbM9hA6GFafbNI76jlvArsqv0rNL2R9kgFFTbJjbBSUgEG3yY+SEddv
	 q7MigcFEH40//YBJc+lXjK7MlELc8MyP6QHA3i3xV+PyMiEOwmAu4XObRgGfIZ2AG/
	 jx7LlnvdLJWvGEYMTg9RgCwBzDc34p3Nzz8Uh98TkqgERagiLJHCwZugSH7SOBoKMa
	 O3P3Ze34g70vslHmHF8zZu0OzJDpWNY8/bcdT4RJVpvjm7UbvceIHdJ5kG/hC0NaBP
	 lZ5Ov0zJZd2dQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:06 +0200
Subject: [PATCH 1/9] x86/mm/pat: flush the TLB when only an alias mapping
 changed
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-fixes-x86-v1-1-791adb8d6670@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

CPA flushes the TLB only when CPA_FLUSHTLB is set. cpa_process_alias()
sets the flag only in alias_cpa and never in the original request.

When the requested range already has the new protection and only its
alias changes, the alias keeps stale TLB entries. For example:

	/* the vmalloc mapping is created read-only */
	p = vmap(pages, nr, VM_MAP, PAGE_KERNEL_RO);

	/* only the direct map changes and nothing is flushed */
	set_memory_ro((unsigned long)p, nr);

Setting ->force_flush_all in cpa_process_alias() does not help: it only
chooses how the TLB is flushed, and cpa_flush() is skipped entirely
without CPA_FLUSHTLB.

Worse, when the alias wasn't changed at all, for example when the primary
mapping changes from ROX to RO or vice versa, ->force_flush_all in
cpa_process_alias() causes an unnecessary flush of all TLBs.

Propagate CPA_FLUSHTLB from the alias update to the original request, and
flush the entire TLB only when an alias actually changed.

Fixes: ab5130186d74 ("x86/mm/cpa: Flush direct map alias during cpa")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index b1d5c5a0ffb41..fb2413cb8d314 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1975,7 +1975,8 @@ static int cpa_process_alias(struct cpa_data *cpa)
 
 		alias_cpa = *cpa;
 		alias_cpa.vaddr = &laddr;
-		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_ARRAY);
+		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_ARRAY |
+				     CPA_FLUSHTLB);
 		alias_cpa.curpage = 0;
 
 		/* Directmap always has NX set, do not modify. */
@@ -1984,9 +1985,11 @@ static int cpa_process_alias(struct cpa_data *cpa)
 			alias_cpa.mask_set.pgprot &= ~_PAGE_NX;
 		}
 
-		cpa->force_flush_all = 1;
-
 		ret = __change_page_attr_set_clr(&alias_cpa, 0);
+		if (alias_cpa.flags & CPA_FLUSHTLB) {
+			cpa->flags |= CPA_FLUSHTLB;
+			cpa->force_flush_all = 1;
+		}
 		if (ret)
 			return ret;
 	}
@@ -2003,7 +2006,8 @@ static int cpa_process_alias(struct cpa_data *cpa)
 					       __START_KERNEL_map - phys_base;
 		alias_cpa = *cpa;
 		alias_cpa.vaddr = &temp_cpa_vaddr;
-		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_ARRAY);
+		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_ARRAY |
+				     CPA_FLUSHTLB);
 		alias_cpa.curpage = 0;
 
 		/*
@@ -2015,12 +2019,15 @@ static int cpa_process_alias(struct cpa_data *cpa)
 			alias_cpa.mask_set.pgprot &= ~_PAGE_NX;
 		}
 
-		cpa->force_flush_all = 1;
 		/*
 		 * The high mapping range is imprecise, so ignore the
 		 * return value.
 		 */
 		__change_page_attr_set_clr(&alias_cpa, 0);
+		if (alias_cpa.flags & CPA_FLUSHTLB) {
+			cpa->flags |= CPA_FLUSHTLB;
+			cpa->force_flush_all = 1;
+		}
 	}
 #endif
 

-- 
2.53.0

