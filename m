Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568884ACC94
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947919; cv=none; b=VdhWHbj58Fu8hVB6puWlot0Suo+3aEhb3DDl0axr5p2PRbyiB49m4PCzGMhmtucVag6ZmcSEqS9NtjMGhBM4M/nOVIQ/cFv81u4MY3UoqO11fKxlkofFW4mEmlq7fTyA7fFs8VTyqLCcNZP9/5Dc1/z+kG2JqMeMvTpr/xY2xgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947919; c=relaxed/simple;
	bh=osc7Bs2PrTQAuRxp4Vg65RRTN9ESX9QDgpxPBG4dOZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1/YnR2zAaaFfFnJvKhQS5YY9elpMBHgsi7aBTQ5pQ6oz8y6QRIF4CHmj529He4zEXZkRV44NaVo7ror9JuHi3sVTr5XOwLAVh4arBrI1/OlugoaLgRGCRROGQ0TxofK/Wy9Sx6sghGyI4dARsszdlystgVmYQ4MfVE3lNFddwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b=tsSpWsMs; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b="tsSpWsMs"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so328125e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20251104.gappssmtp.com; s=20251104; t=1790947913; x=1791552713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9n14yfRryIKsVd2VYTqhCugxHgfRwCkDigMRwboBnXI=;
        b=tsSpWsMs8zt26xmW+FN/gin2Y8PSgDuH89rattUSBWVsKLAECTtz4jxQNLNy2lpaEG
         IbinwGfpBhDYQYLWCxmkJPpCQIsnyKIdyPdXvQND2EGWX53qiu0E6tMTIwouthNgdsGL
         0bo81ue/TtUhgCZyTeNUGslIR5yvgA/m4YqQ7f+pdCQf1QI2FqTZ97DAoYMmDcFZrnS3
         IBFgoJSv0XwfuJ188BzfUjiKHfh7gDw9yMlqjYZKtoABxCG7t4ONpgjNZU2vjuiHJTBU
         flSWrHVUCg8/o5Il3BgafSCERrokCALgVS97FgAKzkeWBx7zTbE8dnm0ok1zKPE3yNyA
         PCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947913; x=1791552713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9n14yfRryIKsVd2VYTqhCugxHgfRwCkDigMRwboBnXI=;
        b=Mi61LjrniCFjOs6uM6Ftrtoio357WprBi6k8zxkuqdKIMAAltpOvPFtgd/Xj5U3Oik
         pxPlqPve/e1I3mEuV2res7QZKIU0jF1Vw6O3R6XGBji4L09L7furhn7h9MkJEtMBvwAy
         1a0vGJLL1f54YKXgcJWRCx6mURxlMWUd+Tv/129TU4rNngEUDccAz5DPHj3p0Cxpivot
         cvZCUSEnxupFqNbTy+QzBpbxUhPgO6sXfltMRjvrovLoqKfQA3n5L9vW8AzYR3H2cOyd
         HBRZJH8fMOlt34zXOhRkJ9Vou+5sXH6FZZK+M/al39qwxv/eSRngWQUYc6vDLI21KaNy
         PL3A==
X-Forwarded-Encrypted: i=1; AKwUvBzsNMsPm+4Ce7AZAe9uNkxKEuWIvQd238P5DzWj83WX5c+vBARtr+Nm7WP7KL0cDyWqjyfYBFeSA5kue0U=@vger.kernel.org
X-Gm-Message-State: AFuF++n619m5DkDcfV/QccyFBhRuZr8LIyXb5Ce60wk5K9pofizEJSuX
	+IFgZL6ZE/vPe9TKi7yKkIfcKGh4IcIhqzzTtzE9OrPwot5thqOLkjY3rHbMOvdGhTQ=
X-Gm-Gg: AYBFou1nvAVad3vHov8o6wY42fdfqMFHwIzTtTvKmJhoCroshhgb2Oc+p9J4eT3ZzQg
	CpMjHci7XVs0QCjakx+e5rupPjK3FFpC5g80UbZ3/GHaoSzi9tgITJFLnfgZC8gmmoxxqjZ2QJw
	4cVyFGZnNy/ka+XcOx+FZIFBHPdRoyg/MvQwLxIGc3v6kjNWLlwqf83rMaMtU04l1mRUFi5PdDr
	r+h4315IujZUaxIX44luVTCISK5TCgdsbyib4zsKT+PCV7zmUsZ27Dh8YqKZCk28Kv86bjpN9On
	CHLUuBD/LDHgK5r1a1ssf8cScir4Hlmq2lNPHpARDphGg7lzYy/UJnbNv3fJzkSwVTTDaup6g3g
	l3CMjP17yJqojgkmx4NiX8Uqtunj76jgCXapFDJ7yQJ+wJ89lhnz/CxWc9pFDPsJZUynzuPCs96
	Joa7xjTBNVE1TBBoU+VcBj4TfqLJly0pYLf11xtIbKPkNvUn6z53AH17ibhDUyJx1hvWOF7Qc5
X-Received: by 2002:a05:600c:46d0:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a02769ac69mr53033795e9.34.1790947912805;
        Fri, 02 Oct 2026 06:31:52 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ebe::178:143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm60543205e9.2.2026.10.02.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:31:52 -0700 (PDT)
From: Matt Fleming <matt@readmodwrite.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Sairaj Kodilkar <sarunkod@amd.com>,
	Baoquan He <bhe@redhat.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH 2/2] iommu/amd: Don't allocate kdump device table from DMA32
Date: Fri,  2 Oct 2026 14:31:43 +0100
Message-ID: <20261002133143.3628181-3-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002133143.3628181-1-matt@readmodwrite.com>
References: <20261002133143.3628181-1-matt@readmodwrite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Fleming <mfleming@cloudflare.com>

Booting a kdump kernel with crashkernel=X,high crashkernel=0,low on an
AMD system fails the per-segment device table allocation because there
is no memory below 4G:

  swapper/0: page allocation failure: order:9, mode:0x40104(GFP_DMA32|__GFP_ZERO|__GFP_COMP)
  iommu_alloc_pages_node_sz+0x7f/0x150
  alloc_pci_segment+0x4bd/0x650
  iommu_go_to_state+0x213d/0x34e0
  amd_iommu_prepare+0x39/0xa0
  irq_remapping_prepare+0x83/0xd0
  enable_IR_x2apic+0x61/0x370

On our E810 systems, the kdump kernel booted but ice MSI-X interrupts
never fired and the TX queues timed out.

Commit b336781b82cc ("iommu/amd: Allocate memory below 4G for dev table
if translation pre-enabled") allocated device tables below 4G. At the
time, the kdump kernel programmed a copy of the old table into the base
register with the IOMMU still enabled. Keeping the table below 4G means
it doesn't matter that the hardware splits that write into two 32-bit
halves.

Since commit 38e5f33ee359 ("iommu/amd: Reuse device table for kdump")
the kdump kernel reuses the previous kernel's table without writing the
base register, so its newly allocated table is discarded when reuse
succeeds. If reuse fails, the previous patch programs the new table only
after disabling the IOMMU. Either way, the kdump kernel's table doesn't
need to be below 4G.

The previous kernel still allocates its table from DMA32, so the kdump
kernel's check that the old table is below 4G still works. Drop
GFP_DMA32 for kdump kernels only.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 drivers/iommu/amd/init.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 0572e1a674f0..16c26d75f46f 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -648,8 +648,19 @@ static int __init find_last_devid_acpi(struct acpi_table_header *table, u16 pci_
 /* Allocate per PCI segment device table */
 static inline int __init alloc_dev_table(struct amd_iommu_pci_seg *pci_seg)
 {
-	pci_seg->dev_table = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
-						  pci_seg->dev_table_size);
+	gfp_t gfp = GFP_KERNEL;
+
+	/*
+	 * Keep normal kernel device tables below 4G because a later kdump
+	 * kernel only trusts and reuses old tables below that limit. A kdump
+	 * kernel's new table is either discarded when reuse succeeds or
+	 * programmed after the IOMMU is disabled, so the table does not
+	 * need DMA32 memory (which the crashkernel may not have).
+	 */
+	if (!is_kdump_kernel())
+		gfp |= GFP_DMA32;
+
+	pci_seg->dev_table = iommu_alloc_pages_sz(gfp, pci_seg->dev_table_size);
 	if (!pci_seg->dev_table)
 		return -ENOMEM;
 
-- 
2.43.0

