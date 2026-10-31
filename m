Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435437;
	b=42WfJwSmABeLn0XZ7FXq7YYnzNwnOsHThuvOorP7f9uBlhYhENEQ7uF8cEVdZPmYVVMX
	 swhuGhcWL5lTdTK66CL1xv2rrG/0Ta8Lsf9H2ifFFc+dnnBESYI/IyV+L7VWQJqbFlweQ
	 ZiMRcP2zeD4nS5tnZ65RC7F0cr60pmpJ0/y7tnAtnw0WV0UfTbCtkIFl67XD75x9QJ/hN
	 QjD2lxJUhhq7smsJq7xH8aOoftFLgFigmyBMmLd2ZVNSqcUVdftSSPVgpRLFiYKlXH2Rx
	 23sB8koWZPScINAxDO63LvFfNGkdly0P2FRsAJf/8UnsAqff5lAeJidvAIrvJDrAB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435437;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L7nyEyulkh83KQxkSOLA26dfUTmVzFEVt1GSUDYgPpo=;
	b=Krq42wijfOEtcMMGNb2bcgrMwU7K3+EOKS2UG3klFW7wGqADn/UPLCLS0kYRi5CGneQj
	 s4RuZfKUInankfsLHpTX9Z1XxtNe2mpYuCcJHe6/z/CKavi02bDwxlTx1OCp6ah5PStSv
	 59ghAiAqU5H4QxoG19O0sN4ls/1Z0XM/oMnwfuT+OWbWPOXi0hVRSNZnRZRQlpwZNIHuY
	 Eb1Qe3cP+/EcKakS7NLTs3Yc7WfVpin2Dnz+rQzgLDOXs34BaTgyuwbORYII1yWxiX2Au
	 3HeEFjbWlAHy5CuFNpU5Ihhm1VN36sc6ee4C+LBipZ7gUiAa/mhmD71Yw5bj271nY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iWJGD91M;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05A4606A323
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C05A4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iWJGD91M
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793435428; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=L7nyEyulkh83KQxkSOLA26dfUTmVzFEVt1GSUDYgPpo=;
	b=iWJGD91MLm1I6PrWlCAhOq+15iYGobWRWzdVKYyZbiMqDyhdVTWF/NsgJh2DIDMbQg3mecxNvP0CQzXyaxe1qe5tioRobJHQgBt3XtgswvKSaZAIpodtcVLrkMb9OOK3bns8JqmKmHl6LHsGvmtLskbPo2k88LIgoBbRnAgqP2s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDo-2kK_1793435423;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDo-2kK_1793435423 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Oct 2026 16:30:25 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v6 03/10] iommupt: Add RISC-V dirty tracking PTE ops
Date: Sat, 31 Oct 2026 16:30:07 +0800
Message-Id: <20261031083014.15040-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
References: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Implement the three dirty-tracking hooks required by the generic page
table framework for the RISC-V format:

  pt_entry_is_write_dirty():
    Check the D bit (bit 7) in the PTE.

  pt_entry_make_write_clean():
    Clear the D bit across the full contiguous range.

  pt_entry_make_write_dirty():
    Atomically set D via try_cmpxchg64() on a single PTE.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/generic_pt/fmt/riscv.h | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index d4445e463fa9..2f4838eb44af 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -223,6 +223,55 @@ static inline void riscvpt_attr_from_entry(const struct pt_state *pts,
 }
 #define pt_attr_from_entry riscvpt_attr_from_entry
 
+/*
+ * Dirty tracking: RISC-V PTEs use D (bit 7) as the hardware dirty bit.
+ * When Svnapot 64K is active a leaf entry spans 16 consecutive PTEs; we
+ * must check / clear all of them so that no dirty indication is lost.
+ */
+static inline bool riscvpt_entry_is_write_dirty(const struct pt_state *pts)
+{
+	unsigned int num_contig_lg2 = riscvpt_entry_num_contig_lg2(pts);
+	const pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) +
+		log2_set_mod(pts->index, 0, num_contig_lg2);
+	const pt_riscv_entry_t *end = tablep + log2_to_int(num_contig_lg2);
+
+	for (; tablep != end; tablep++)
+		if (READ_ONCE(*tablep) & RISCVPT_D)
+			return true;
+	return false;
+}
+#define pt_entry_is_write_dirty riscvpt_entry_is_write_dirty
+
+static inline void riscvpt_entry_make_write_clean(struct pt_state *pts)
+{
+	unsigned int num_contig_lg2 = riscvpt_entry_num_contig_lg2(pts);
+	pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) +
+		log2_set_mod(pts->index, 0, num_contig_lg2);
+	pt_riscv_entry_t *end = tablep + log2_to_int(num_contig_lg2);
+
+	for (; tablep != end; tablep++)
+		WRITE_ONCE(*tablep, READ_ONCE(*tablep) & ~(pt_riscv_entry_t)RISCVPT_D);
+}
+#define pt_entry_make_write_clean riscvpt_entry_make_write_clean
+
+static inline bool riscvpt_entry_make_write_dirty(struct pt_state *pts)
+{
+	pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) + pts->index;
+	pt_riscv_entry_t new = pts->entry | RISCVPT_D;
+
+	return try_cmpxchg64(tablep, &pts->entry, new);
+}
+#define pt_entry_make_write_dirty riscvpt_entry_make_write_dirty
+
+static inline bool riscvpt_dirty_supported(struct pt_common *common)
+{
+	return pt_feature(common, PT_FEAT_RISCV_S2);
+}
+#define pt_dirty_supported riscvpt_dirty_supported
+
 /* --- iommu */
 #include <linux/generic_pt/iommu.h>
 #include <linux/iommu.h>
-- 
2.50.1

