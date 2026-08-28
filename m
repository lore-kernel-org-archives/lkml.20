Received: from 20.mo550.mail-out.ovh.net (20.mo550.mail-out.ovh.net [188.165.45.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A815346AC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.45.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946849; cv=none; b=rOapKjBb2OB6v29LUfVOd8rZFQpGMYwBiVILxO5IGHbzEA98tlIYgKjIVxXRKO9JoXrwfU6gLEQT7YaoVHDOnUaX/zTDdwccqlQkgT9t4nnbu4ysBc45jl4QWAzHxDkrWuKXZCkin3Lut1NMUMrr4HXCe0P6Wivd9pG1gR1AUNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946849; c=relaxed/simple;
	bh=ckAlqpaspq2k2x8q7tJLW4PNigmQWx+PWjnkQyMu16I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=InqA2KXNYTaKhRbjQqm6XYPXxWEyb9lj6vUUAf0JRc9LH8FH62U3hMEUQrNPR5HHnDxoxIqoQhd1wq+8QQVoUNpD5aamIiNgoM6SLfDWRDGPMbQrFPhHUkMVjxL1FsqrsLSKym5b+sabo/zCuu8Ir9PxtLaoFZZwg4jK87IVPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quelquesmots.fr; spf=pass smtp.mailfrom=quelquesmots.fr; dkim=pass (2048-bit key) header.d=quelquesmots.fr header.i=@quelquesmots.fr header.b=RLCaeniO; arc=none smtp.client-ip=188.165.45.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quelquesmots.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quelquesmots.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quelquesmots.fr header.i=@quelquesmots.fr header.b="RLCaeniO"
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.37.246])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4hWg2l1R5kz6366
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:58:23 +0000 (UTC)
Received: from ghost-submission-c7b579475-6dj84 (unknown [10.111.174.132])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D17FCC2A79;
	Fri, 28 Aug 2026 13:58:21 +0000 (UTC)
Received: from quelquesmots.fr ([37.59.142.109])
	by ghost-submission-c7b579475-6dj84 with ESMTPSA
	id Q4JXJP2TkWrQ9hYAscvRaw
	(envelope-from <l.wandrebeck@quelquesmots.fr>); Fri, 28 Aug 2026 13:58:21 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S00330f99484-d9bf-4ef1-a8a9-35eefa7e57e9,
                    860BA029DBC89C9CB79CD437547027D697208083) smtp.auth=l.wandrebeck@quelquesmots.fr
X-OVh-ClientIp:109.190.254.62
From: Laurent Wandrebeck <l.wandrebeck@quelquesmots.fr>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] x86/mm: don't apply va_align to hugetlb mappings on AMD F15h
Date: Fri, 28 Aug 2026 15:57:47 +0200
Message-Id: <20260828135747.724789-1-l.wandrebeck@quelquesmots.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 10664242445692042523
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEPfez9EEUV4Yq/cpyUiEXKtSThl3jZVINMHAloQojLyyapNUPIm1rOlxA8q/SZ8aqSNita4pqsBrXoxk79wLPrZQjxbvIOUgQ62jsJ5JwNVJS9VV+/gAB7hhikzDkar91k02WlAizWgmzjycl4MNtW2GePut5K6gZI3g7F3P6r5Y3QhMvEPmL13VkpZZ3rUdntYidPJB9jeStL9H2HknEty1nkpPX0jgqriD6n8CZZL4w9KjlQ9jHyY0wrUtYWBRJmCwSj/haMshZv7YvCowrHEtORRbIv7lnFEz0YwVCNmRIpcD7YzlJmhegpcXZ+EBrrxqVGWRrdGhIJZB2Iv4Ptr5XwVHvI/QaW+4+Zcpt7601t80Ihb1QSAHNle3L3FdMTOr9SHIIk+Sw7OkXuXN1TjnIFSWqC1TcMwLrITmqlWM/gPRw4JQSZ1mkdan29GxRjJfVFH57OHtUrf/GYAmYwRJKO2dx24zwr1E2FoDCFseALe1lwMJpRi3+eiuVxGnXQ64hDErJer778QFMGQ/2vrprky0xhvrABPOEHZvUColLf9sTmArJRtt2VeH74yv4JUeGH7cAor/iPZZG35oncekWsApyfuqqiuF4JzP2By9vU1vEPb4FyEmPekz5UOJcSpHddGgrpuqio7VKdsKv7fK+veVt+GyYD6Rc4FjG6PQ
DKIM-Signature: a=rsa-sha256; bh=764ev2N3KwIgGapMuVWioNnBS/1ILv2C77z2qZJCBdE=;
 c=relaxed/relaxed; d=quelquesmots.fr; h=From; s=ovhmo4049951-selector1;
 t=1787925503; v=1;
 b=RLCaeniOviPMBqhBZH3W5fa3Uo77l7WOsSx4uxRQsc5IzTxoYrbrxZwG1zlOi78OClQ81+yi
 BQ87VEWsrJTF/2xpDxCKYEcTF2lULWUufMBazeZB7GPq5TiWq6kp5CCwIYKYOCU07QC4K1x3vHV
 Yk2krafDhigmY+m+bP+qFjDo4UbpFpbAoD2zmJU8EC4gI+xG/dDGVbsEMxC1tOgRgrwkVKk19Ug
 Mp2vJdIIyHkndFM3oPsd1OLPX8DGZmaogOoeO6hsAdQ8PKxjRh3ms7S1afXoaSpD8C9IHHmoDQn
 tWWhUvnU5puuCbrCZ/JSo6IVC0FOTg+EV1FPGCHLpTmmw==

Commit 1317a5e7f7b1 ("arch/x86: teach arch_get_unmapped_area_vmflags to
handle hugetlb mappings") taught get_align_mask() to return
huge_page_mask_align() for a hugetlbfs file, and skipped the pgoff-derived
align_offset for one. It missed the other write to align_offset:

	if (filp) {
		info.align_mask = get_align_mask(filp);
		info.align_offset += get_align_bits();
	}

get_align_bits() calls get_align_mask(NULL), so a hugetlbfs file still gets
the F15h I$ anti-aliasing randomization that its own align_mask already
excludes it from. vm_unmapped_area() therefore returns an address
deliberately offset from the huge page boundary, the hugetlb VMA's vm_start
is only PAGE_SIZE aligned, and tearing it down trips
BUG_ON(start & ~huge_page_mask(h)) in __unmap_hugepage_range():

  kernel BUG at mm/hugetlb.c:5161!
  RIP: 0010:__unmap_hugepage_range+0x64f/0x660
  RAX: 000000003fffffff  RDX: 00007e9280003000
  Call Trace:
   __zap_vma_range+0x523/0x680
   unmap_vmas+0xa5/0x1a0
   exit_mmap+0x13b/0x3f0
   do_exit+0x1e4/0x470

That is a 1 GiB mapping on an A10-8770E (family 0x15, model 0x65) running
7.2.0, 0x3000 below a 1 GiB boundary, RAX being ~huge_page_mask(h). Both
hstates crash, and so do both on an FX-8370E (family 0x15, model 0x02)
running 7.1.8, there 0x5000 low. The offset is va_align.bits, drawn once
per boot: identical across hstates within a boot, different between boots
and machines, and a boot that draws zero does not reproduce at any size -
hence the apparent intermittency. The crash is in the teardown path, so the
reservation leaks as well, HugePages_Rsvd owned by nobody until reboot.

Reproduced by mmap()ing MAP_HUGETLB and returning. A Ryzen 5 2500U (family
0x17) on the same 7.2.0 does not reproduce it, as expected since va_align
is only set up for family 0x15. With the patch both hstates return aligned
addresses, and PostgreSQL has mapped a 4 GB hugetlbfs segment for 18.8 h on
2 MiB and 4+ h on 1 GiB pages with no BUG and no leaked reservations.

Fixes: 1317a5e7f7b1 ("arch/x86: teach arch_get_unmapped_area_vmflags to handle hugetlb mappings")
Cc: stable@vger.kernel.org # 6.13+
Signed-off-by: Laurent Wandrebeck <l.wandrebeck@quelquesmots.fr>
---
 arch/x86/kernel/sys_x86_64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 776ae6fa7f2d..6b2be065304f 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -157,7 +157,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
 	}
 	if (filp) {
 		info.align_mask = get_align_mask(filp);
-		info.align_offset += get_align_bits();
+		if (!is_file_hugepages(filp))
+			info.align_offset += get_align_bits();
 	}
 
 	return vm_unmapped_area(&info);
@@ -222,7 +223,8 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
 
 	if (filp) {
 		info.align_mask = get_align_mask(filp);
-		info.align_offset += get_align_bits();
+		if (!is_file_hugepages(filp))
+			info.align_offset += get_align_bits();
 	}
 	addr = vm_unmapped_area(&info);
 	if (!(addr & ~PAGE_MASK))
-- 
2.34.1

