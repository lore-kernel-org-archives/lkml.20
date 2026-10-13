Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667BE4F96D9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893995; cv=none; b=vDKFjLHreD/sX2xaZFjRLsqB4+rcRE/OHDdzsQrZ5HwUHsK0tli3hlEQ0G+qa1XeaNxaZ+WqLo7Jjg+9s8LbBmMjnu/3nOCiuvL0WmeOFo68DiaPe3qkO3UNj4pS+wjQMeLnanui8WpYGnDEwukdMzqVgG/KhzAxSGB8PJRqbZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893995; c=relaxed/simple;
	bh=HClb3+R7XqUi6eYTOz7iTtJSRX2ibpgrEI5bky7lR/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omStoXMy5Ay4KPvnm7Yj1nXLElWxR4LqIwtI8eDqepREGAUzHrSTi5j5iuRp1y8PixJ4v5OLAGzsYmhbSu3tc0Hy/4PpCst9wyr3tqb5HNzIEqOdltm3WR6of8aG0x8V7vaDM1i+xePjx3a3IPICLlwnns0mGyWy4yzIJoou76w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b=0CndrNFZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b="0CndrNFZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af27fe287so2494115f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20251104.gappssmtp.com; s=20251104; t=1791893991; x=1792498791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nClHHLwqIIKVi02OMAQklsmsGC+QC3Qdr3aT7miJ3Rg=;
        b=0CndrNFZDpPD/GuxwazuyBqlaE3MzotqhlwtyxzrXjyVNCVjr2/I63SuG+OzFwgMW2
         a7J/E0BK/tduj3IJp8L+IkGCnf0j+W7rqzl7gfiHb9/9AyGttTQuBR2ZyMuFb7Y2x3oa
         iaNeWV/ScU+BjpdiFGBVkH5zrvAf5ljB1UTYoJTWaZMoTtL3EcB1J8if2UAQLkxvOLTm
         ywyfZa39KpwsQwvRiiwPA14hd1mjvKdVVaebgjt7mSx0fNHhikH9YMyZYBE3BkzQdh7v
         jmJVwqj5nqdgeCpV04xfMTceINH1/lOyMYzlYSrqQiDMpL0SrTQlfdEWI4gSr5LRYH3y
         4Lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791893991; x=1792498791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nClHHLwqIIKVi02OMAQklsmsGC+QC3Qdr3aT7miJ3Rg=;
        b=NUNt3e1ptbaxpGskbFUx95X3M3JGrl9S+YPRQJbS9rjEtlUbnwBrKuvq2k4mz38loK
         TF0tdC/pQjNIsuocKaPQ9t1RErhGJPj2eYOd0NuMU+HZrLoC++8N2P3Ymx0uXdt3vVW1
         5EwZyz7Y1FEDjuJSNK2oB9hMch1fSR/NUX6POTf5GOliY5FlbU6mzwtIRH7o0Av8ihVU
         4UESLxpq0zhX65vzlYcZWpV5TWv7x8hLbGMunrPGI/7PsQEhPYID+pjUUFDLiJlvMVll
         FLb5U4MorqEf4GSFlR/R+2zGW0kKPIf3QMmuQ1SAOhEqPEatfFl9WaWMiRgKNv8HUsX8
         9p2w==
X-Forwarded-Encrypted: i=1; AKwUvBybXI6lHTsc0LqgJNQ1BJL/XV8PFDuwm2fFtSpYjX2SOPDET/1WPiOhWdHD5OTTUhi9LEjwBBvskkVjLP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFy6xP6+MjSFPtc3q8Qbdlr8gA6knm3z9DeuSi7wTF8FeBc5PN
	sxNX7RWdhy4g7LXI5ksmt2z9WzS8sp8WYnruaDVZ2ForLpJew4cLbRBdx+mJQnVsvhs=
X-Gm-Gg: AYBFou3ttKKORKJI+Eoj8vkdP/3dmtSGswodISE0Q4xHh3Rpe2eOmAcPETr9Xak4tz5
	2s6D9eY1+YRSihBzMz7ai/U2NZvLXQCon6DP/JsQVjMDe44MHrO2C5StM+CxLhjr9UJQDqnW2xg
	0QKy1EkZyhb7KIcQYJf2IKfWBXHPGgyBG6aERR/Ctb2zQzUOOMNVcx5SJWKV1RaID/PS4r5sj91
	aP9X+bT0qrPiVPbgphUqOT/wRhdl7hSJFailrI6qOxDkMUobwK477jcS9wZaCEdvKReYVVTV7zZ
	rcL5qlwnFXLSYt4MXjQMwdFMyh6TFzG2kzTIr66WRQlxjaH1WEpbafHCL12tvh4JmQjJ9+iBYld
	l3CL+ynZz0Xw/yrvk+1aKfFytF9rr1rf1dQUCzaO9lpP7OBXoNsBYH7h0dn3cOcIHS3YujHk3aM
	RkpCXqC1Qy3KQziSv2NUXNvLYaH2Ag4s0jkIk4BkD8j2GPVMosa6V7rQFqGzbQX5YvNg/miXzi
X-Received: by 2002:a05:600c:c3cc:10b0:4a1:a7f8:c12b with SMTP id 5b1f17b1804b1-4a1a7f8c219mr37427115e9.19.1791893991549;
        Tue, 13 Oct 2026 05:19:51 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:26c8::3dd:3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc5e0asm4806155f8f.50.2026.10.13.05.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:19:50 -0700 (PDT)
From: Matt Fleming <matt@readmodwrite.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Sairaj Kodilkar <sarunkod@amd.com>,
	Ankit Soni <Ankit.Soni@amd.com>,
	Baoquan He <bhe@redhat.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v2 2/2] iommu/amd: Don't allocate kdump device table from DMA32
Date: Tue, 13 Oct 2026 13:19:44 +0100
Message-ID: <20261013121944.4060097-3-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013121944.4060097-1-matt@readmodwrite.com>
References: <20261013121944.4060097-1-matt@readmodwrite.com>
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
register with the IOMMU still enabled. The 64-bit register is updated
as two 32-bit halves, so the running IOMMU could see a half-written,
invalid table pointer. Keeping both tables below 4G leaves the upper
half zero throughout the update, so the pointer stays valid.

Since commit 38e5f33ee359 ("iommu/amd: Reuse device table for kdump")
the kdump kernel reuses the previous kernel's table without writing the
base register, so its newly allocated table is discarded when reuse
succeeds. If reuse fails, the previous patch programs the new table only
after disabling the IOMMU. Either way, the kdump kernel's table doesn't
need to be below 4G.

The previous kernel still allocates its table from DMA32, so the kdump
kernel's check that the old table is below 4G still works. Drop
GFP_DMA32 for kdump kernels only.

Cc: <stable@vger.kernel.org> # 6.18.x
Reviewed-by: Ashish Kalra <ashish.kalra@amd.com>
Reviewed-by: Ankit Soni <Ankit.Soni@amd.com>
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

