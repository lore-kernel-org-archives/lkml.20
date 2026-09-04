Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F75535F5ED
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490636; cv=none; b=X2BTWd+ea4Ys4ZTkK6KI4TP3/A8OiV23z6FPPOHl0XUsvR0Et3QKM/ySeqyJk5qcLGGvebcn1CrAnXvp2yuqxL0kpLgq7d8oZtAuJxboj8VsSU6XwE5Iqw10wPSbQMZ0rR4xoegXWhrq4qTg+7/O5glU8p6s+MGlK+a/rk0SfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490636; c=relaxed/simple;
	bh=/vNfZEtzd7rZhII/yDUoAMszVv5dW4tl38T/aaQMUE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UgpKXC1YmJQE8w1sElXvBedUrIUZOO1gWlxE51oIa84qgCSNzecgMrVh0Z0eHl8xevDu3dQ2tFTcs9lEtMICwPoUC5fLbtEm7gWK8UNWUZGDd7lNk/EAYGSw8fkIk9xgAB1n2H9ti8CciLUMAiIlqZHTWpGLWZGqB2/GFvE7SwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jvRwcx05; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jvRwcx05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788490466;
	bh=ROVnHA5BEqq/WcSBihPHGC+KA275aTS7xUiFqduIN8Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jvRwcx05URvNlDoDNFp8rXF7wq0yX1RA/eTHwSb+nrM+Dp6lRxkr/w1fXupzdwa22
	 f0v1p1UoJsSFVgz7NTpTrN4WQy8eFZ/W0ZYo9fJHsGw9g/6izokBu5WI1h+8PoNwl0
	 w6d8I54mFSZ17SUWUU/JF8sm8c5rHdInM5mepqDM=
X-QQ-mid: zesmtpsz8t1788490458t1b47548a
X-QQ-Originating-IP: yZtkANSwL7POW9k1ioY0Pdnq5BieGZbOrXtY3tlvt7s=
Received: from ggx-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Sep 2026 10:54:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1351358170329713200
From: gaoguixing <gaoguixing@uniontech.com>
To: kasong@tencent.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	bhe@redhat.com,
	baohua@kernel.org
Subject: [RFC PATCH] mm/swap: fix swap table count encoding for empty slots
Date: Fri,  4 Sep 2026 10:54:11 +0800
Message-ID: <2FDEE109C6578F17+20260904025411.106943-1-gaoguixing@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N1L+gx0qj2+lci1Dgy5gFHQcGX/ba52aBObZtvA/5AeN+T/8Cs81XGqP
	LUkTOkonlxSSGMPKxfbEn1B+h07ZbQgb7O++M3ROufhlf/EjGp5QV9lItlMCh5ddeilflPM
	UxZrmXtViQMW+Elb4f3de50wvTzbi5Zu+/jnJ5jcE6AuEe3iPZnEhZ9n61gFnUxA5uitLKH
	E8qE51/W1WwZXih3P1AJ3kf4L+WjUm9wbHqZTvn6B3mSaGkOXrxx9MLxlNHSm1nAjrrF7uy
	ChYTUEZgey/hAWpA1u+J4CBAduQu9u12pF0I05TjEy6zTfsxTSL+0LOyoWypscNmO6w2fPz
	zpjFisZ9wV/zW7wkdTa8o4v2tNGrF1e7oRRltCT5o0DdIcgD/xkHB7jcdqh8E1oeETVodLT
	QczIT+0yQJSQW8MbayrxzhsCASUg1Ag2qsH3xW5zmuT296AReIMK4YFF1ddbL9tB9SgDgVH
	ZvFN32QJ5UuJ1bkY1nxrD8yKlLXBtjrnaUXEC+oKfr+3elaxNnbRF4AijeEw623O2RbgJTW
	9KP1cc5giSgr48AIZrXt7WwKG4goPAZs37gZlB0MIWI0/mK7PjEU+MgSh+r91uwxLfqe6aS
	sM+rlN5uTe+kfTvzVCsXDskPGuxdXA3tfJALwTtLTpei2sN4qZLOR6b5N0AmRWVoHLRgbmu
	0Siz2hgyb8286q/unQ8xXZtuAl5UA1rh9pHfppsQQ5cMvcgGEPMGP4b8vu71IA4Y4kiMyBw
	fnkdgh1hixDubZvxBr7mrMlPI5B7GtQE9kHYMCBOnFCDoobm/5b9UOcDj4XsSWBp8W4btIG
	3PABfMnXONsunQsW0VjAkKdg4yuPSz4zvIEdE1dyC9rT6iE2owNzHJ+/eO92fh1tPT8hIRo
	3UCUjCPcScmy7ZReHv/mhrwIFaBuH2FFvYi6CEB8hPEHU25EK7BToUXQ5ajT7aQnlNEp8fo
	JplSbDlLgaxJpc7HsT892s3wM32rP01c6raJX8Z7tkwGtzj2RWRDVZ6aRTTF3fGWMZU8yD7
	+RsoFyIRO2WRaqM3ugQT8mGlFOIFuGDHuys3TvVdyLrxgjRLPS
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

While stress-testing a local adaptation of the swap table series, the
kernel reported unused swap offsets followed by a NULL pointer dereference
in __swap_cache_do_del_folio().

swap_table_count() returns a pure count.  However, when initializing a NULL
table entry, __swap_table_update_count() passes that count to
shadow_to_swp_tb(), whose second argument is the complete swap table flags
value and is encoded using SWP_TB_FLAGS_SHIFT.

The flags field includes SWP_TB_ZERO_FLAG below the count bits.  As a
result, passing a count of one sets the zero flag while leaving the decoded
count at zero.  A live swap slot can then appear unused to
__swap_cache_add_check().

Initialize the entry as an empty shadow without flags, then set the count
using __swp_tb_mk_count(), which encodes it with SWP_TB_COUNT_SHIFT while
preserving the entry type and zero flag.

The failure was observed in a QEMU x86_64 guest with about 8 GiB of RAM,
Linux 6.18.44 #7 and MGLRU enabled with 0x0007.  The workload used a 2 GiB
memory cgroup, wrote 2600 MiB of anonymous memory, read a 512 MiB hot file,
scanned a 4096 MiB cold file and then read the hot file again.  The kernel
reported:

  _swap_info_get: Unused swap offset entry 0005f948
  _swap_info_get: Unused swap offset entry 0005f94a
  BUG: kernel NULL pointer dereference, address: 0000000000000a50
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  Oops: Oops: 0000 [#2] SMP NOPTI
  CPU: 1 UID: 0 PID: 4077 Comm: python3
  RIP: 0010:__swap_cache_do_del_folio+0xbb/0x1f0
  RAX: 0000000000000a50 RBX: ffff8eddd6308f40
  RCX: 0000000000000a50 RDX: 0000000000000001
  RSI: 000000000000014a RDI: 0000000000000000
  R12: 000000000000014a R13: 000000000000014b
  R14: 0000000000000a50 R15: fffffa8747b25580
  CR2: 0000000000000a50
  Relevant backtrace:
    __swap_cache_del_folio
    swap_cache_del_folio
    folio_free_swap
    free_swap_cache
    free_pages_and_swap_cache
    tlb_flush_mmu
    zap_pte_range
    zap_pmd_range.isra.0
    unmap_page_range
    unmap_single_vma.constprop.0
    unmap_vmas
    exit_mmap
    __mmput
    mmput
    exit_mm
    do_exit
    make_task_dead
    rewind_stack_and_make_dead
  note: python3[4077] exited with irqs disabled
  note: python3[4077] exited with preempt_count 1
  Fixing recursive fault but reboot is needed!

CR2 was 0xa50 and the swap table offset was 0x14a; 0x14a * 8 is 0xa50.
This is consistent with __swap_table_get() dereferencing table[ci_off]
while ci->table was NULL.  The unused-offset warnings show that swap slot
state was already inconsistent before the NULL dereference.

This patch is an RFC fixup for a pre-squash local adaptation.
__swap_table_update_count() is not present in the original v5 series, so
this diff is intended for review and fold-in rather than direct
application.

The squashed local commit 99b07072a9ca ("mm/mglru: introduce frequency
guided promotion (MGLRU-FG)") already contains this correction.

The broken intermediate commit was not published, while the public squashed
commit already contains the correction.  Therefore, no Fixes tag is
provided for this RFC.

The corrected local tree, which also contains a separate cache-pin rollback
fix, completed 15 out of 15 runs of the same pressure test without a BUG,
WARN, Oops or NULL-pointer signature.  Therefore this result validates the
combined corrected tree, not this patch in isolation.

Link: https://lore.kernel.org/20260517-swap-table-p4-v5-0-88ae43e064c7@tencent.com/
Link: https://gitea.cicd.getdeepin.org/ggx/kernel-rolling/commit/99b07072a9ca56420773bbdd052e894601c2b861
Signed-off-by: gaoguixing <gaoguixing@uniontech.com>
---
 mm/swapfile.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index d6c5c25755be..02fd5ad94185 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -163,16 +163,16 @@ static void __swap_table_update_count(struct swap_cluster_info *ci,
 				      unsigned char count)
 {
 	unsigned long swp_tb = __swap_table_get(ci, ci_off);
-	unsigned char flags = swap_table_count(count);
+	unsigned char tb_count = swap_table_count(count);
 
 	if (WARN_ON_ONCE(swp_tb_is_bad(swp_tb)))
 		return;
-	if (!flags && swp_tb_is_null(swp_tb))
+	if (!tb_count && swp_tb_is_null(swp_tb))
 		return;
-	if (flags && swp_tb_is_null(swp_tb))
-		swp_tb = shadow_to_swp_tb(NULL, flags);
-	else
-		swp_tb = __swp_tb_mk_count(swp_tb, flags);
+	if (tb_count && swp_tb_is_null(swp_tb))
+		swp_tb = shadow_to_swp_tb(NULL, 0);
+
+	swp_tb = __swp_tb_mk_count(swp_tb, tb_count);
 	__swap_table_set(ci, ci_off, swp_tb);
 }
 
-- 
2.50.1
