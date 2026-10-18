Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B434C6F04
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331386; cv=none; b=a6F6m6lgL9+7hrDT8vOb3zty/mQCbcj6tjMabB331P4Ccs8P2JjEz3DXIu2GjgWsFaURSNYpsD/vSiJ0sbGT/R05tX+AANaGEriZF2cT2Jk9KyFVfNugck+X9uRZMhddral/g7D2YNC29FhQMAuU/g2CK45LDP0aqltaCMbS/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331386; c=relaxed/simple;
	bh=/+Poo0M9ncZe9skH4jhSK0fTm72bMU8o70A587Vm6v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2ePEfWM/vG1IsCtdAZk1F1VZ9ThWtG77UAZBtqmqCj4QhxgsiDddtUVP+Z3h8UBSgGQAwOJG8C5b3v+MMRR/qJSXj9ngTB/Ag+8uf2LakhS+0KRFeFeOpOWc/HsxmB3VxtRs4JFaFEWd/Ku+/GQdxqYeq9fwvKGusNr0PWmqBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwpGYGDx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwpGYGDx"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2055573c8cso147210066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331381; x=1792936181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vELiqmiLg0My2qE0CYP1TlLdsSmoEcWN2hANkQsUo3o=;
        b=HwpGYGDxVBtMBKrEp1vOa0g5GC1VTfh5EnLGLev19uvIg6UBilumMUdjxbJ4QshSfI
         N6MN++Uia0odSx8+lSKQo9cemzLgf3yzvaMJOwAo4UtRQ4CiIP053pAeHk7+YIhhufKk
         ck2tql3rKC7OcFUwwVFaFiUJJ9tBch219tdMfIRkXDV56RqcqFUdj6iOkx6uV0YL/uwZ
         EblnRIq4LgLzgWd6IHFxFghdaphP2Fc2uN5oAYZHu22jzxXLeZOLnZkfWdRP4IS5sbYI
         KaKk6BtvoVVI+n+Cgoq1K9H1GB0pTlvi7IvppR8Zngi3f3vgyT5nSkknW42j+0Wvjpiq
         j/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331381; x=1792936181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vELiqmiLg0My2qE0CYP1TlLdsSmoEcWN2hANkQsUo3o=;
        b=Ht0hn+rKn7g6Jcz4XA1vuAW331EXX/RF8N58w+SDehL36X7f5nIoxtbCTcROhePFdE
         lcecrfsQz3nn1MpYqIk8lt8h+e2D0tke/gVAVyjE5XRA4XlCMGDRuLHB5KKW/fx8jnbN
         hI7naFZM6CjzGwFx7HmH8igf/NLAvatGrvN/aESpVHvyKxV0/hC8xd+DyTfeqU0eHkFN
         6AxYIOfGgBati2nZD187dzXntyKe+oCWafS8TdbZXS3PjFybxCRUvSBTopEmP/X6ROY+
         6Wx/b7p71k2sV1KPBnUdqTcvlOqzFNXXuR8Cg1IEZfq13xUBTjoUFynkVUwx7CqVp8nt
         A3Ag==
X-Gm-Message-State: AFq9FYIguOQSSfQ23cHBtqb5H4HfNgBJ0evH5RtnxRCJ8gH1Yuf381pS
	3KNDALSe69cr9Hg7/i2Uho1h3FY2fySWRDR3N1C9JA64aYme61igRoN2SUjFIy2W
X-Gm-Gg: AYBFou0/pJblyo6bZy1lYsP8IvbkHb2iZZpAC3r4tnU4rIPYPltqRvqMIpc1DWYZZ74
	wUQTqIe+RAfqeBgRXB8R/NB42gc8e5VPWSAuN87jrWKfhwoK5k76C1OKWx47zwPeTdJYBvsbK4s
	mTijfBMexFyr1DNvCm+s6730raYXacSi3X8cwhVoTcR+ZyTAcHnqfU4wCDGKGgWIFg+cp0pja1w
	epvHXRWZaNySXmoXWyJVBXIyAQLY4HXNJ6QihC2bJq8K7d0YlgbL8jpaQwuovKiGwmmR4ZkaLFE
	giUkJYWChxyPp2Z6KRfHpxcqpKUu1nuXv/cYtIkvIazLZPxla58GIkkWewbhuIpU6cL371aXGea
	RimVQEwB+voaQfkr361HRPgzVp7J51RDSMUC1d0NL0Wy3mTaIGxbORXLgtMZ9BXmNhwA+8DO1WB
	zn5B1+I2SnRj9wrNg+gS3AjpWThfItAdDwh0+5HoguHlUfxU9HwkQwXwzZ2TO8j8/5ASJoyoA/A
	l6HhzKOlmr3sizVa8YdLZQp8K/NOzynGARD9ajl
X-Received: by 2002:a17:907:3fa0:b0:c40:c6c8:6bd8 with SMTP id a640c23a62f3a-c419e838694mr368578466b.20.1792331380945;
        Sun, 18 Oct 2026 06:49:40 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm267678266b.61.2026.10.18.06.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:49:40 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	krzk@kernel.org,
	oleg@redhat.com,
	linmag7@gmail.com
Subject: [PATCH v4 06/10] sparc64: retain the DMA segment start across SG entries
Date: Sun, 18 Oct 2026 15:45:08 +0200
Message-ID: <20261018134738.1016106-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018134738.1016106-1-linmag7@gmail.com>
References: <20261018134738.1016106-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG mapping loops reset out_entry to zero for each input entry.
When extending an output segment, the boundary check therefore tests
entry zero instead of the segment's actual starting IOMMU entry.
Adjacent allocations can be merged across a device segment boundary.

Keep out_entry for the lifetime of the mapping loop and update it only
when starting an output segment, in both sun4u and sun4v.

Fixes: f08802572965 ("sparc64: add the segment boundary checking to IOMMUs while merging SG entries")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/iommu.c     | 4 ++--
 arch/sparc/kernel/pci_sun4v.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index 7613ab0ffb89..a23105b64fb9 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -451,7 +451,7 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 	int outcount, incount, i;
 	struct strbuf *strbuf;
 	struct iommu *iommu;
-	unsigned long base_shift;
+	unsigned long base_shift, out_entry = 0;
 
 	BUG_ON(direction == DMA_NONE);
 
@@ -485,7 +485,7 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 	seg_boundary_size = dma_get_seg_boundary_nr_pages(dev, IO_PAGE_SHIFT);
 	base_shift = iommu->tbl.table_map_base >> IO_PAGE_SHIFT;
 	for_each_sg(sglist, s, nelems, i) {
-		unsigned long paddr, npages, entry, out_entry = 0, slen;
+		unsigned long paddr, npages, entry, slen;
 		iopte_t *base;
 
 		slen = s->length;
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index 61f14b4c8f90..22584c4de973 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -489,7 +489,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 	struct atu *atu;
 	struct iommu_map_table *tbl;
 	u64 mask;
-	unsigned long base_shift;
+	unsigned long base_shift, out_entry = 0;
 	long err;
 
 	BUG_ON(direction == DMA_NONE);
@@ -530,7 +530,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 	base_shift = tbl->table_map_base >> IO_PAGE_SHIFT;
 
 	for_each_sg(sglist, s, nelems, i) {
-		unsigned long paddr, npages, entry, out_entry = 0, slen;
+		unsigned long paddr, npages, entry, slen;
 
 		slen = s->length;
 		/* Sanity check */
-- 
2.43.0

