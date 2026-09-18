Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5951AFF9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752302; cv=none; b=WpRrGgWcsqvEM1kV4nSs8rkvHQwN3VrE+nX+zeKCqLUroEdERgDsKNcP7Ng/ZGc4+yd9xtpVE/csX1J9/LRvOYxvx4snEp7IPxQPk0O9zLHNRMwoofiqHv7Gz+EQRPWGojOocJd1shtpGY2O243izkxbpVLNKwUS6PBUNi+848o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752302; c=relaxed/simple;
	bh=Z+BK+VH5LxM1oigwsR2LUjN0XeNirnRXhRVS5tv0s/M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dQB6Iv+/i3yroZYD8wBS+3hcpONUpUuu1l42lmU7TAVgORYD9De2LyY9sHgs9nyPcNeztUzKoXBTjaxxVDuC4Ql5kW1VUF7k6FKUyPf7jcJWybYS7YFoFsIJ4f5lGa8hqV4W42kwxQMZj3yVqTTv4Hb3KqVNJpTWqiktcPD2y7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=altGrgEC; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="altGrgEC"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so19951205ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789752300; x=1790357100; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Md8swCj0kdnOqQQJ2clN5fwQ45QLSCsFIDbY3twlD8g=;
        b=altGrgEC9QiS5aSp2T7mBEH6Inoa15rtj5vHAMpptrf6EzqO36TIxwDyCMdVxNgKCy
         Sg1HZ2XblgrL59TPKKdkMeMVQ1iBnCYsg5ipBkrTO9gnvh64g6ZTbceSVdLZC6EozTHu
         W8X2swncwpb160lrT2PrBXkiYT21s5+KZE46+Y0zdnNWKN46PV1Tb69M765VGhnnj4tq
         RafnnkTulM7yhXoBVhTWb2XA64quMY/80tk3kUu6YWe/E3zQCoB2+0SYcGhQMKFDqvnr
         rt97361C1wlXXwYLDhfLc4TcRHCQFTC9rcqDH3HZBILnsOA8YxJpi507uNDo8xPX+zD4
         tP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752300; x=1790357100;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Md8swCj0kdnOqQQJ2clN5fwQ45QLSCsFIDbY3twlD8g=;
        b=tobhAsMvogvvip6N5EFrnsfXO52jerIg55G/bLRTiVKIC1TNoM38BYJc9lHVSkO91t
         F1r8pWZh50i1x5cLBgL2+6ImK7hqqmZCq0Se2OTIE8UH++0vjQ1YkxrlFufZu/GnIqvB
         wGAcY19gOXLnYurWyFmwBFAPEkysyiiHMgajnxshVi6qRPY0/jnzo0P7UnhMUXERaNTt
         AW11SYx/PNbV3X0lMOuhc1z6xHkEneIGqd/IAEiZCtrXnTvq/LlpUhLnnH6wKcc1NqJb
         Dtg7hbZPyNKGSedav+3d9oLhqWjwMEyMb9UFULVBez32BeqzhisR15/U8hPpEnmmzSxC
         hc5Q==
X-Forwarded-Encrypted: i=1; AKwUvByHFqFMFesjzfluZFTXFBqhh6pUxgba4GCueGnW1SA3+YcJSZApH4ZK9JXOq4BSeLPWVT/D19SWf2lVfmU=@vger.kernel.org
X-Gm-Message-State: AFuF++n7O4CDyU/lhc77j1XlL5Uqn7htOVfifBNnR7g/EFOS/SAVTUwc
	exyziFMrpbDzsOVmALswlpisgylFDyMbbc6UUZlRKs6H1F/drOqJrgPzQB4jeOEIfXTCynU5rtq
	gUMQVwtf1e4GdNhULhYDy+btaFT+vZXQEZg==
X-Received: from pldv5.prod.google.com ([2002:a17:902:ca85:b0:2d9:e5f:1d26])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:17d0:b0:2dd:c053:e665 with SMTP id d9443c01a7336-2ddc053e6damr7685515ad.43.1789752299497;
 Fri, 18 Sep 2026 10:24:59 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:24:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOpzrWoC/43OTQ6CMBAF4KuQrh3D9AdbV97DuCh2gEahpCVEY
 7i71YUJ0YXLN5n3zTxYougpsX3xYJFmn3wYcpCbgp07O7QE3uXMeMmrUpcCagmNv4GlCD31V7K
 XBIpLi7VTpLVmuTlGyjtv9XjKufNpCvH+PjLja/rxUAutxFYKLpUBDtFOXXBj9Hc7XA5tCO2Vt ufQs5cz81X35y8zB4TGoTF1iTts3Bci/kBERkjvUJkK0QixQpZleQLOcG3FOAEAAA==
X-Change-Id: 20260803-b4-fix-aer-memleaks-524a1bd5e888
X-Mailer: b4 0.14.3
Message-ID: <20260918-b4-fix-aer-memleaks-v4-0-f0a2c21ed1d1@google.com>
Subject: [PATCH v4 0/2] PCI/AER: Fix ghes_estatus_pool memory leaks in error handling
From: Priyank Rathod <rathodpriyank@google.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Priyank Rathod <rathodpriyank@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When firmware reports PCIe Advanced Error Reporting (AER) events via ACPI
APEI GHES (ghes_handle_aer()), it allocates a snapshot buffer from
ghes_estatus_pool to store the aer_capability_regs registers before
enqueuing the error record into aer_recover_ring.

aer_recover_queue() returns void, so ghes_handle_aer() cannot release that
buffer itself; ownership is handed to the AER code, which until now freed
it only on the fully successful path. If the record cannot be enqueued, or
if a dequeued record cannot be mapped to a pci_dev, the allocation is
silently leaked. Under a sustained error storm this exhausts
ghes_estatus_pool, which then breaks GHES hardware error reporting
system-wide.

This series fixes both leak paths:

Patch 1: aer_recover_queue() when kfifo_in_spinlocked() fails because
         aer_recover_ring (capacity 16) is full. The rejected entry is
         freed immediately via ghes_estatus_pool_region_free().

Patch 2: aer_recover_work_func() when a dequeued entry cannot be mapped to
         an active PCI device (pdev is NULL). The loop is restructured so
         ghes_estatus_pool_region_free() runs unconditionally for every
         dequeued item.

Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
Changes in v4:
- Rebased onto v7.3-rc3+ (f259f446f519); applies cleanly to pci/next as
  well. No conflicts with the Advisory Non-Fatal Error support that landed
  in the meantime.
- Added missing Fixes: e2abc47a5a1a ("ACPI: APEI: Fix AER info corruption
  when error status data has multiple sections") and Cc: stable to both
  patches; that commit (v6.7-rc1) introduced the ghes_estatus_pool
  allocation whose ownership these paths drop.
- Patch 1: use braces on both arms of the if/else and fix the continuation
  alignment (checkpatch --strict).
- Both patches now build warning-free with W=1 and CONFIG_ACPI_APEI_PCIEAER=y
  (earlier revisions were only build-tested with APEI disabled, which
  compiles neither of the modified functions).
- Explained in both commit messages why the caller cannot free the buffer,
  and when the missing-pci_dev path is reachable.
- Cc: Lukas Wunner, who has been active in this code.
- Link to v3: https://lore.kernel.org/r/20260803-b4-fix-aer-memleaks-v3-1-e87159611933@google.com

Changes in v3:
- Resent to fix threading of the series.
- Link to v2: https://lore.kernel.org/r/20260803-b4-fix-aer-memleaks-v2-1-fd199b0171fd@google.com

Changes in v2:
- Refactored aer_recover_work_func() to ensure ghes_estatus_pool_region_free()
  is called unconditionally for every dequeued record.
- Added Patch 1 to fix related memory leak in aer_recover_queue() on kfifo
  buffer overflow.
- Link to v1: https://lore.kernel.org/r/20260803183853.432459-2-rathodpriyank@google.com

---
Priyank Rathod (2):
      PCI/AER: Fix memory leak in aer_recover_queue() on kfifo buffer overflow
      PCI/AER: Fix memory leak in aer_recover_work_func() when pci_dev is missing

 drivers/pci/pcie/aer.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)
---
base-commit: f259f446f5198d98e13756d2cd531812a0ad3064
change-id: 20260803-b4-fix-aer-memleaks-524a1bd5e888

Best regards,
-- 
Priyank Rathod <rathodpriyank@google.com>

