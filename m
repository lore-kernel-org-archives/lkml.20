Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776A370ACE;
	Fri, 28 Aug 2026 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914804; cv=none; b=ml+ROBpw2SKrzDn0/eEu5e48TOfqdNGrDPEUFViYhi4zSf8R8c8/tYyaTpSLZhRN4BelQthGuQSb6PnihDM+iIKMTvQxhp4RDVPNCfGiEbHwZ4B1uhX79EHz8DyZKHYpk57Z1IgO8+A6qb6GI9g+PYR6pFt4LgkaPW0vpKK2oHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914804; c=relaxed/simple;
	bh=X2elxpExfk8Svx/T+Mk+MaYqbE5D298Uyb+JMK4EzuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iDHH5SLKYogsn4QXaPeSqAY7bWpI28IzU5DMXgFR+LTgdfTclZJ9KkWd6uKY13n53H/vfNuTNqWyhLzDPtRKZDwQY9gNDYQvvwWE5vkAJZ2EQAkyEKz4QlMWPAdd2c+BtMP7k548MaedJyMxp8zhjrBK3khzH3/urpOSNpxM1Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Hw1n0d2S; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Hw1n0d2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3K
	xjz9cWeIixVxNbvWh2Xx5KhJ3vNUWAQ4fan3E71N0=; b=Hw1n0d2SPiDwJNFel9
	F1pM2MoqYGhYIiES3kZIAP8wzQcavOob5gEh02lkMfnEliD4YUPzI3bGrcxyeAYB
	spKzXd2B3NkeRGyrYqQ4znYvDcb5F9Nekm4xmeK29X7vDfa4SHtAQOxoNZGjdZ+S
	tGAyNTpcgxAkguX2q6gAQSKdw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgA3aAMQapFqFkZXOg--.38184S2;
	Fri, 28 Aug 2026 18:59:28 +0800 (CST)
From: oushixiong1025@163.com
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] usb: xhci: fix maximum event ring segments calculation
Date: Fri, 28 Aug 2026 18:59:26 +0800
Message-Id: <20260828105926.930033-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgA3aAMQapFqFkZXOg--.38184S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8tr4UArykXF4UWr17Jrb_yoW8Zw1Dp3
	W3ua18urW5tr1YvF4kXa1Iyas5Ca15JrW8GFyxKrWDZrsrt3Wvgw4DtFyY9a47Wr48J3W5
	ta4kKrWrGa1akaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYlksUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC-RCdrGqRahCVngAA3W

From: Shixiong Ou <oushixiong@kylinos.cn>

Commit 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
converted BIT(HCS_ERST_MAX(hcs_params2)) into
FIELD_GET(HCS_ERST_MAX, hcs_params2) << 2. The ERST Max field is a
power-of-two exponent, so the maximum number of segments is 2^n, not
n * 4.

With an ERST Max of 0 (as reported by e.g. QEMU xHCI) max_segs becomes
0, the event ring is allocated with 0 segments, and the resulting
zero-sized ERST allocation trips the page allocator:

  WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof+0x11d0/0x1548, CPU#0: swapper/0/1
  Call trace:
   __alloc_frozen_pages_noprof+0x11d0/0x1548 (P)
   alloc_pages_node_noprof+0xa0/0x108
   __dma_direct_alloc_pages.isra.0+0x178/0x260
   dma_direct_alloc+0x1e4/0x460
   dma_alloc_attrs+0xb4/0x2e8
   xhci_alloc_interrupter+0xdc/0x1c8
   xhci_mem_init+0x250/0xe70
   xhci_gen_setup+0x35c/0x4f0
   xhci_pci_setup+0x68/0x138
   usb_add_hcd+0x31c/0x640
   usb_hcd_pci_probe+0x1fc/0x3d8
   ...
  xhci_hcd 0000:02:00.0: Failed to allocate interrupter erst
  xhci_hcd 0000:02:00.0: can't setup: -12

Restore the BIT() based calculation.

Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..af8d4b74c4ba 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2301,7 +2301,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!segs)
 		segs = ERST_DEFAULT_SEGS;
 
-	max_segs = FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2) << 2;
+	max_segs = BIT(FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2));
 	segs = min(segs, max_segs);
 
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

