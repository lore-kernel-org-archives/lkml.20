Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984816;
	b=sf5ZfJHIhjQ729FEMANiYKYun2TUZcbh0LxQH0Uam95ximlfeQZ8l8OktPKxMauiZi4F
	 vECk1PlK0Be69yuqsViqA/vrAsa2wJ7cM5wLZu0EUoCF+WhWC5SvgvV6bcBadeYKPC2ud
	 qSZQCFSg67B5cfAbU+0yBuhTw49VNKm0nFHafBBZp0/w+emMpg/X/q9nOcB9ETtpwD90C
	 J4eHmN8lbvXlk0quy7w9Anstzvy/brzvDfSxlVt07Zgmqk3f1GkiSmNliJ3b6jUO/fNOR
	 9QnxH+4G+6BVbFOrQnibqOKh7w0/LSsep13E4X8ky1NdsNkhO5ze2P4XEBJWJbkE1Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WTKZttgdr/SAexmQekzblCSc0QECF1tZsnrq/gh32Uw=;
	b=bhKxZ3Q3vCJ26ct/WBp1TTcAm9W9S+7kSM+9XKHcLwM0mQL1KHjzaYyfazSRjNLssRGV
	 EB/dvujs+6mGaqhN5pRuKv6AXB+vFRU7ohONYt88x/zp+ieZsflAs98h8W/Tl3w4EQct1
	 GKlQatOgQDtz/R8K4b82OkKoa0httTvzmjSYimQzRkXhek4uWABR577vMh+D6CIG2Iokq
	 pEVrg9fbvIH4Vot3DTf3iJyXgkfo2jl5gyrIJJaRjIZsnEAJE026KPRJA71VfHawJVoBd
	 e2rSP3bWLZZu+fBL3iAvGLeKJtR+lJVKxyRcOudtkm00ZSaZ/YOuu5FFYQiGptjN2Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=pRfCZdra;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C8606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453C8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=pRfCZdra
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35943f55c06so3500241eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1792984814; x=1793589614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTKZttgdr/SAexmQekzblCSc0QECF1tZsnrq/gh32Uw=;
        b=pRfCZdrauaWdHhmQ5/y43IX8CwxQleEIComGg3pM1J0MlvuUGTSfAR7Ye25+GfiwMU
         QyCliSoH2vcSwaNsxwqJH34fT/7EXfA0geb4KYwpVO0QpFvW4GcEXvE+al4FpMLWcDRf
         K98ZGWiG8Erw6GAk6qeIZZU6epmUrg7dP3s7GH9bUJQCbuBZGYtvFJDWDgm2LICUdHFf
         yDK7rTLR3VWDjCPEPy3JpMRM/nOjF0gyxo2uTqBGkQOTa1kkOzU/ftSoid7SIdB218QQ
         0WDU57+zYJK/NU4cbsK67lXplE/a15oBNFWOg2oqs13In8DwfxR3iBDMn/0swt5Igh3Q
         O8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984814; x=1793589614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTKZttgdr/SAexmQekzblCSc0QECF1tZsnrq/gh32Uw=;
        b=EvqClhUDme2TBc7SaXiz4ME/QVMAUPIlOZy1vpcTK350BV/+b+ld8aIVMeYFj6eKWr
         bhQYT6zvWdr7kuWNWSqGsrlZOE2BT4Rx1XLDgTAFtxYZ/PjRSM3ptMFAYQly+ZfN6C6z
         EZvOz/6NvISr2+6uNTQ4IvxyclVhQoEJeeWz+COyJ4bmB+7GznK1YRzL1RHPXOru+Pfb
         YtJxefq838EJ/3aRIYZFq3GCOYmyRYM7zko5BZ+Gwzn2lfJGJIvGNupwLW00d6c1w2rF
         pcFqk6CiMGP4Xy0GdES681qCl3CElWBKtkiAtjHalWpRw6CpXqE3euOoR8BlZ/u4hk+G
         7Kng==
X-Forwarded-Encrypted: i=1; AKwUvBxd6SbdKPZ0H5xzdu9siQooiUMh/s8Qra15eizJi9NdPtIV7z4UY3B+wCPJid8v6lYVFwusufIa/v2GhFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvfOBMGJV0HOQlUztWEaAECzUAZuzaOp5bWTmbPOiKzPdSHVZx
	78/echD430qM7TgrYZaGvkaOO+IzPVl72y80qC+RgdGah7k7HaL0GKYDMtWjscJgSQ==
X-Gm-Gg: AYBFou3mPkyN8KW5Z7UPisvL/gZIuIyJ0EpAJUCmoIXCfCWJ8o+2TFxfavHKauifYA5
	jDNSLWDe9vdGJfxdr2/uzmt1le7UphT55P0dVCSYz8mY1yvw2Gi2rErGChVYlmr1LXIBBm3HAro
	FfaQMwWwyvlrtJ6QJBhOGM1mnFO2Q/oy/XN/dbHH1WfUnnvdqiSSC/AKMfipNtwMSJaVwC/zdYM
	ayuYxOrgtwHf0SA1c6A05VXc1eUKJMxbai0OA9P8PICa3hx7PbQDjvp//nrnLSeVfUbAudnLzmx
	dGcekVDivdUxbPfOIjuKsD8gX72aiglTjbrU7o3A7HQKZRRNRbQWjpGngvm3QySSEMR8K4Bivnq
	Cd9f4R5V83QzHLk2lIcnZccMG3imYtT5UrtZV11ktnPF3+FfVnSwj6L/uGLGRMVVNlLgGFzUe+B
	NPV2MPWGUXUbft0KDA1RI9OJttAeB1sK49lU3JE7bQjDWO7VVtdOBbDg6Znw7vLNjB6FNkaLa1H
	yotToKDS/nT0OWh82pNif0yKEHo7ZP9ITlhiG9LyORqR7RNQzJXWlY1b/xSPL1cg8C0uI8tKqFG
	1ixlAsZhImns
X-Received: by 2002:a05:693c:6093:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-369fe828ebamr3830262eec.14.1792984814156;
        Sun, 25 Oct 2026 20:20:14 -0700 (PDT)
Received: from gio.localdomain (ip68-109-140-205.ph.ph.cox.net. [68.109.140.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm21439295eec.20.2026.10.25.20.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:20:13 -0700 (PDT)
From: Giorgi Kobakhia <gkobakhi@asu.edu>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Giorgi Kobakhia <gkobakhi@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] swiotlb: fix out-of-bounds read in swiotlb_release_slots()
Date: Sun, 25 Oct 2026 20:20:07 -0700
Message-ID: <20261026032007.1957949-1-gkobakhi@asu.edu>
X-Mailer: git-send-email 2.43.0
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

When buffer is freed, swiotlb_release_slots() tries to merge it with the
following free space by reading the list value of the next slot.

    if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
        count = mem->slots[index + nslots].list;
    else
        count = 0;

If index is in the last segment of the pool and the pool size is not
multiple of IO_TLB_SEGSIZE, index + nslots becomes equal to mem->nslabs
leading to out of bound read.

 BUG: KASAN: slab-out-of-bounds in swiotlb_release_slots
 Read of size 2

 Call trace:
  swiotlb_release_slots (kernel/dma/swiotlb.c:1653)
  __swiotlb_tbl_unmap_single (kernel/dma/swiotlb.c:1734)
  dma_unmap_phys (./include/linux/swiotlb.h:262 kernel/dma/direct.h:102
                    kernel/dma/mapping.c:218)
  dma_unmap_page_attrs (kernel/dma/mapping.c:236)

The commit 0b84e4f8b793 ("swiotlb: Add restricted DMA pool
initialization") makes it possible to initialize a pool with an
arbitrary size. Before it nslabs was multiple of IO_TLB_SEGSIZE and no
OOB occurred.

Add overflow check.

Fixes: 0b84e4f8b793 ("swiotlb: Add restricted DMA pool initialization")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Tested-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Giorgi Kobakhia <gkobakhi@asu.edu>
---
 kernel/dma/swiotlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ded7016a46a7..1f18003be343 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1649,7 +1649,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr,
 	BUG_ON(aindex >= mem->nareas);
 
 	spin_lock_irqsave(&area->lock, flags);
-	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
+	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE) &&
+	    index + nslots < mem->nslabs)
 		count = mem->slots[index + nslots].list;
 	else
 		count = 0;
-- 
2.43.0

