Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE231F4634
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788579150; cv=none; b=JpiDcXMaqSsG+l0IN4wN3UP+BgSAMwyyv/+RFmGMlQyJ95OHw4yQmpS9wTj/y7JHEn+Mg8cQm9zsufna9TvlE2l8W9OoXnsKNEAkaFgt0W/HMftHBqybFi3/K9kwrhUr8MPoBsxGibjB57Cj360I5AUS2wTPdZrIqLi4BzBk1Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788579150; c=relaxed/simple;
	bh=7HazKxD2mV8gt+sK19mSzAqs/+mLzQ4wgfN+3D049SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcSN2lsiGR2P2x9GOppotgcv0OWDjYqZbkkVVbsYqh7f02ESdDxSYt3YhSANWoUA/ZLKhrkGKosn1C1PVpCp0478VVXvdhvQkae4CRs3YIol4YdVzKI2fnL1e3v6C0lZlpH4BCVIFUT/7Efm7bJfW2WdiPAdppvZq5C5RfQtl4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hcJll2tCqzYQtkM
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:31:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 15FA440574
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:32:17 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgBnUAswjZtq6hczAw--.190S4;
	Sat, 05 Sep 2026 11:32:16 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: catalin.marinas@arm.com,
	suzuki.poulose@arm.com,
	anshuman.khandual@arm.com,
	gshan@redhat.com,
	david@kernel.org,
	will@kernel.org
Cc: wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: io: Reject present-invalid user prot in ioremap_prot()
Date: Sat,  5 Sep 2026 11:31:48 +0800
Message-ID: <20260905033148.3657516-1-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBnUAswjZtq6hczAw--.190S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww17Kry3ZFWkWr15Ar4xWFg_yoW8uF4xpa
	4kur1kWrWDWa4xAw4jgrZ2gF4rWws5JFWvgw1v9F1qvFy2qFWxJr4vg34Ygry8GFZ2gw48
	KFsag343GFyUtFDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU17KsUUUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/

From: Zeng Heng <zengheng4@huawei.com>

Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
that process's /proc/<pid>/cmdline triggers a spurious WARN in
ioremap_prot() through generic_access_phys():

  WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
  Call trace:
    generic_access_phys+0x1c8/0x228 (P)
    __access_remote_vm+0x2b4/0x398
    access_remote_vm+0x14/0x30
    get_mm_cmdline+0xf8/0x2a0
    proc_pid_cmdline_read+0x68/0x120

generic_access_phys() passes the full pgprot derived from the user PTE
to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
reports the pfn and generic_access_phys() reaches ioremap_prot().
The PTE_USER assertion, which is meant to catch kernel prots being
passed by mistake, then fires for a PROT_NONE user mapping
that legitimately lacks PTE_USER, producing the spurious WARN.

Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
front so that generic_access_phys() cleanly fails the access instead
of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
is only meaningful when PTE_VALID is clear, so both bits must be
checked together.

Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 arch/arm64/include/asm/io.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 21c8e400107c..bbfbc4682639 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
 	pgprot_t prot;
 	ptval_t user_prot_val = pgprot_val(user_prot);
 
+	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
+	     PTE_PRESENT_INVALID)
+		return NULL;
+
 	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
 		return NULL;
 
-- 
2.43.0

