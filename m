Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94B43900F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183386; cv=none; b=e7I2N0I//rJSTYdip0Hvb1lVAbJN8WoRhevfSJjBdCrntd6YpQVgkuPT75/K+hgmyhAcIxTanNuDqIDk5j+I0jfAt1PwT3yQ6Im5neFld+IXUhL4PczdHkSu6Ut5pdm14xkh/LVP5NM5nz4B0el7Tl18oxX1UsR/SYxP7m38C48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183386; c=relaxed/simple;
	bh=iPSEhTOEtqzV/CCuS5UP7vqCI704xT0SGmjDnRMftMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svF64HkDnkEdtBWDpc3SJmDgIc9IGQvfH9xMuVDad/KcfNsDcf8/R7DcrK3pek5OAPQwCd4WQE30j5gHupu/83waLdILok5buZBev0iFwMjqMIv7+azZhWIKxLODSeJbrSFOKLnK3U/+MHSCVvRfrJbzcsoZ679qpA2SGbeS14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SRYIzDVc; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SRYIzDVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=MN
	IhhVbw7X5/d7sVTwXmPhv3XWWu8nVjTkE+oAnGKMc=; b=SRYIzDVcRlREcSQMkz
	IUXwLG1D/GcchB+9+Cp6maBH1EKJcpddPcz7v/tQm+YWCOlALd/qUSYKY9GgrYV6
	uzDIoG9ZJ/aTT+o2tWH+MXnih8rUbg1MmsS0b/+pU7OMmRQb0fhDZn+9MRqKpFip
	ad9AFMtPCpWFwG+LkZKrPHp1U=
Received: from XLL-9950X.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHHmEbg5VqFKS5Sg--.13223S2;
	Mon, 31 Aug 2026 21:35:25 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	mike.kravetz@oracle.com,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH v2 0/2] mm/hugetlb: fix surplus accounting and availability checks during demotion
Date: Mon, 31 Aug 2026 21:35:17 +0800
Message-ID: <20260831133519.2505020-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHHmEbg5VqFKS5Sg--.13223S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr1kWrWrAr43uF4xZrWUJwb_yoW5AF4Upa
	98Jw1Y9r1kGry7Kr4fZ34qv3ZY9r1rXr1Ygwnxtw15Jan8u39Fgr1Svw15Wa40vrZ7uay8
	Xr4UAr1ku3W5XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbWrAUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+B3n4GqVgx2NgwAA3N

From: Longlong Xia <xialonglong@kylinos.cn>

This is v2 of the two-patch series fixing surplus accounting and
availability checks in the hugetlb demote path.

Patch 1 fixes source hstate accounting when the free folio selected for
demotion accounts for a surplus page. Patch 2 prevents demotion from
removing free huge pages that back reservations.

Both fixes were tested with x86_64 QEMU guests. The commands below use:

  hstate=/sys/kernel/mm/hugepages/hugepages-1048576kB

Patch 1: surplus accounting

A vmemmap restoration failure is difficult to trigger deterministically.
For this test only, add a one-shot fault injection that makes the first
attempt to restore the vmemmap of an optimized 1 GiB folio fail:

  /* TEST ONLY: fail the first optimized 1G folio restore. */
  static atomic_t fail_next_1g_restore = ATOMIC_INIT(1);

  /* In __hugetlb_vmemmap_restore_folio(). */
  if (huge_page_size(h) == SZ_1G &&
      atomic_cmpxchg(&fail_next_1g_restore, 1, 0) == 1) {
          pr_info("TEST ONLY: forcing one 1G vmemmap "
                  "restore failure\n");
          return -ENOMEM;
  }

The injection does not modify the demotion or accounting code. It is
one-shot so that the later restore performed during demotion can succeed.

1. Boot QEMU with:

     hugepagesz=1G hugepages=0 hugetlb_cma=1G
     hugetlb_free_vmemmap=on

2. Enable overcommit:

     echo 1 > "$hstate/nr_overcommit_hugepages"

3. Allocate one 1 GiB huge page:

     nr=1 surplus=1 free=0 resv=0

4. Unmap it. The forced restoration failure leaves the folio on the
   freelist while it is still accounted as surplus:

     nr=1 surplus=1 free=1 resv=0

5. Demote one page:

     echo 1 > "$hstate/demote"

   Before this fix:

     nr=0 surplus=1 free=0 resv=0
     surplus > nr

   After this fix:

     nr=0 surplus=0 free=0 resv=0

Patch 2: cap demotion

This reproducer requires no kernel instrumentation.

1. Boot QEMU with:

     hugepagesz=1G hugepages=2
     nr=2 surplus=0 free=2 resv=0

2. Reserve one 1 GiB huge page with an untouched hugetlbfs mapping:

     nr=2 surplus=0 free=2 resv=1

3. Request demotion of two pages:

     echo 2 > "$hstate/demote"

   Before this fix:

     nr=0 surplus=0 free=0 resv=1
     resv > free

   After this fix:

     nr=1 surplus=0 free=1 resv=1
     resv == free

4. Touch the reserved page and let the process exit.

   Before this fix, the access fails with SIGBUS and leaves:

     nr=0 surplus=0 free=0 resv=0

   After this fix, the access succeeds and leaves:

     nr=1 surplus=0 free=1 resv=0

Changes in v2:
- Add reproducer details and test results suggested by Andrew Morton.

Link: https://lore.kernel.org/all/20260823034307.1072415-1-xialonglong2025@163.com/

Longlong Xia (2):
  mm/hugetlb: preserve source surplus accounting during demotion
  mm/hugetlb: cap demotion at currently available free pages

 mm/hugetlb.c       | 57 ++++++++++++++++++++++++++++++++++++++++++----
 mm/hugetlb_sysfs.c | 10 ++++----
 2 files changed, 57 insertions(+), 10 deletions(-)


base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
-- 
2.43.0

