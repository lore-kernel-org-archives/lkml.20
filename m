Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CC02DCBFA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778804; cv=none; b=rzJEeRKz0JrzChmQVLeGGfbFBxPUtJUpVGGXNk2ZRqAxzW/mTjbJ+CgmoWDHLGGTn/mS5frr76D46lhoaWcJ67Qr3CY8RoHV+dsIw9JgweJy7suFlf1marQXgQNhVBA2Xh/LU1M8nrxbwd+fpRjk+NTH5DsDTS6GRSw6KO/Nr3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778804; c=relaxed/simple;
	bh=UvYPFEm3GzkGR7s8aPhGNCgvjZfGqk491uF+plT7epk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oC908kvG4+Da6HZV2oz2hXu3lPxeZqXm7a0LkTrdmBzfItXGOLM06hyLg6OTxmk+jFCI/5WmErU3p5y63r0Rs95X4UAhjXcDETflFjg04eru8DgZ9xyj9YHUMd7YvsD3+WK061eIBRy2NL42xE1W3nDg9+hCn0hCHl+o6jVXuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBl9NW4N; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBl9NW4N"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1064819a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789778800; x=1790383600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYflQONwlJSMZNXqCrxiR0VsKYk4eRcneht4Yn2HkRM=;
        b=UBl9NW4Nd46kVfjy9cV5k6gJj5ED0xTV33S/kvEeRnX3z9ij6dEBzzsObNbtq3O8FT
         ejjr40wh0SqfHeDH6WDTDUBzYwpGgdy8U4eY+SNIbTI7avn2+0WJYJgi2ZZHD8k/mohW
         6QU13ohLO0GYPAoRTR8cU4hEoCCz5g6vJBmTDheacytD0zFZdn7f9tVCp7SX5u8L8NQi
         QwXZtjz3Nf10zeW7OYO+LZlz3C06Cvtg/zMWDlcJcDFroRcgOHlsDTZLy4CCKyM788zA
         ieD8IzxbmfvAavy95PnuYF+gRzfCN48Fxea/zGltqqOpC1pEgLBZv4D5lt69yYjCt5ud
         PkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789778800; x=1790383600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYflQONwlJSMZNXqCrxiR0VsKYk4eRcneht4Yn2HkRM=;
        b=kAnxl3qR6++DSkHDeqVoACVOmB+gijAmHYZtkWaURXg0Ih5oRDwhHS3H93Z7RfZJYu
         pI8d252Xx5gD4JXGm5kw4uJdGFlWJdX+FY/MNxKd6GkE/qbVneszQA+fsAAR03URyP32
         gIMsOZ72v5Ck7uTsfD9vpLQfcvYvsWTKlfY2PxhL3N7ibwvV0xvKVRMEJYhaM3Ajm3Jc
         JqRKv4huk8Kfi03a0n2jbpYOw+BvnhBBCvPJQr2R1jPgSPu52IgF3k/zsOZkIY1tRGwO
         LGw2rqkKA5nLCw7eKwwtw8/gwzZx03paHcXzd06x5MssUWSDtlqIAMOo0bmcNMhqwqka
         aWWA==
X-Forwarded-Encrypted: i=1; AKwUvBxE2r6pxZlkf6Hc5VIdlzWoIcSSUdb+EW43UXe/MVFh6mUXXXa04Yw/m2jR96iTJd++WhwS3O2xoI5NjAo=@vger.kernel.org
X-Gm-Message-State: AFuF++lz2olHRsJY1DKN6RuaIrYHpbGqz+Gy9h2SU4Z9TBPT3N09nMKR
	K7rrLa2rJrqxSwCtOVZ7XGh8W07ABBSXPPpNXTd6bt8QSPsT+PBrleg=
X-Gm-Gg: AYBFou0F90u2A+JIbrG3FqPbxT2xfmkEDowFeITCl+k14CI9GkeO6qatGS6HrrclYjp
	a/u68DiPqz+8YApYDjbLt5WJtH5iFIgk4qrPKesx6fK22dBY2xBHEWGlQZIMftPYI5YHRdC+/aA
	u25DWAMWFZ3zikzUNdIyBAWK1YqVcStmELKKbJKwzVIwbIfsgdjhxT+tIIEWJ8YGSq9BC08xUZ/
	MwLh7dT+EqMX2yecGa3lH+HHHSS1ko6tpoKL2wkOQFscjVYA+qyLep8Y+43ZF4oLMpWXLcQKSbE
	cesTgi6VzcJNFXrMgMe5/tr1ZhQxqIMRTj2HG+cfQ/WaDqocvRaG8sTwevf9CWvhaDWyYvk7nOu
	k3PBn8xhztL1OR/yQlrNK+y9y0b9d7kRWFrqYIaX+BXwjuVUlytWunFx4ANWBfuveuGuyL9uUz3
	eyfZOt6XEl3GtlsJlBiop0Mi+RC3QJ6UElakuPLfiqABGpescvPmcu0jCdYJvl6IFMaomGAR4Q+
	TlRv3h+DqSk/3T7l/1Kqw/ZfQ4=
X-Received: by 2002:a17:90b:2e0b:b0:39e:6c68:c78a with SMTP id 98e67ed59e1d1-39e6c68ca60mr1742297a91.64.1789778799727;
        Fri, 18 Sep 2026 17:46:39 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:45e5:9e39:6356:6164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c169dcdsm1927166a91.2.2026.09.18.17.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:46:39 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat, 19 Sep 2026 09:46:29 +0900
Message-ID: <20260919004630.1159895-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>
References: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on the source lands in a
destination VMA that was never registered for write protection.  It is
then permanent: the bit is dropped only by change_protection() under
MM_CP_UFFD_{WP,RWP}_RESOLVE, which uffd_wp_range(), mrwprotect_range()
and userfaultfd_clear_vma() issue only for a VMA registered in that
mode.  pagemap reports the page as uffd-tracked, and MADV_COLLAPSE
refuses the range while the bit is set, because collapse_scan_pmd() is
strict about uffd on swap entries.

move_present_ptes() and move_zeropage_pte() build the destination PTE
from dst_vma->vm_page_prot and arm RWP only when dst_vma asks for it, so
the destination's own registration decides the result.  move_swap_pte()
copies the source PTE instead and only ever sets the bit, never clears
it, so one UFFDIO_MOVE behaves differently depending on whether the page
happened to be resident.

Clear the uffd bit on the moved swap entry unless the destination is
RWP-registered, as copy_nonpresent_pte() does where it installs a PTE
into a destination that may not be armed.  A WP-registered destination
stops inheriting the bit as well, which is already what it gets when the
moved page is resident.

Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
Cc: <stable@vger.kernel.org>
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 mm/userfaultfd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 74f04c323c50..6495666c596b 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1452,6 +1452,8 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
 	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
 	if (userfaultfd_rwp(dst_vma))
 		orig_src_pte = pte_swp_mkuffd(orig_src_pte);
+	else
+		orig_src_pte = pte_swp_clear_uffd(orig_src_pte);
 	set_pte_at(mm, dst_addr, dst_pte, orig_src_pte);
 	double_pt_unlock(dst_ptl, src_ptl);
 
-- 
2.53.0

