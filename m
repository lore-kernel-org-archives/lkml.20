Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884964;
	b=xLeU6NodXdy63rUgwkQD1Hy8QRQ8mssVTcRPUGsSkOxnLDp2Jx6YltNMgrgxBOn2ofuF
	 ss6aq7v1Yjs4MEhNN4G9baJyVIRjUBDjrxZT/yNkQNRFmMrbHJVIFQYj9+FC0oxnTtWVZ
	 FpfEPPTbek5ikULO2zdwJh5dp+A8MjAu0irgdIOFuFvKI0es+zAj9TmPHdUMIoBDBMS6R
	 vVdsk0Cv0mZhyu9uhYAA+hH1eqgH4lotw9aMqT5odWKsIAC3DyvVxuRVZlfRIn86LAJT+
	 skNoTo75w12X+5bzZEEopgqK6nA2xLuu+JXvrwizUOXEYUA56AK7/D2n8yNiiiHargw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884964;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ab9/FtU+evEOIDbPSbhyDZc8Br1EcYdUtbtpoFOf6ao=;
	b=KMv4i90LcSdrFnjnHjwK1rKSkn/N8rbh4NFQ55uclDU88VZEorrnNEkvgN9hoobWduS0
	 DOsZ3e8cjblt9Bwa/sv0OdJaQmqBr7yAH0NuNTneQH4dNev/GQpTeesG0us6N/QJLruRI
	 8lXSyoWTyrKDnl736DQ+Hj27ktfoTla3knAH3ol8dxJevvHSyQMytSG2Lv0laHbHr8qjC
	 D5xrFzuLq4oLlj95fQcuTdbmEFU5rIAx8gpLg7L3mfugEoXmZ/jrWFtr5x8JtqXXeyyrp
	 o4+sqlITYmxlT/TMOH5R2fkKMdtC7QIUCaPqbv3ZWmJ28eJ580d9Zr6ufurNlwmpSWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bwc3C8e+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EcJ7w5jU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED169606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED169606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bwc3C8e+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EcJ7w5jU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793884962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ab9/FtU+evEOIDbPSbhyDZc8Br1EcYdUtbtpoFOf6ao=;
	b=bwc3C8e+6ch7cRwgw5BDzS4W7d4ZnCF3PvrH18MwRSW906ZrkchPqL9wFA2OxoB9llu7iK
	5JvlTaUI6dkwXK5JWCjbuwY+9TcsHiuym+LWF4grk6qHjX2ZtiKkc931opiyCLIHnTodCZ
	JaM08vb7b//pMaLQfjiyssz7jLgmBKA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-nYUlGf9ENjGZBZiKozwNUg-1; Thu, 05 Nov 2026 08:22:41 -0500
X-MC-Unique: nYUlGf9ENjGZBZiKozwNUg-1
X-Mimecast-MFC-AGG-ID: nYUlGf9ENjGZBZiKozwNUg_1793884960
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso2576616a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793884960; x=1794489760; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ab9/FtU+evEOIDbPSbhyDZc8Br1EcYdUtbtpoFOf6ao=;
        b=EcJ7w5jU2GZWcYHBTpQ2nMxirztq7lYzynfsmON8AyfpfXMUAQQFCQWtYUb+LA1ou3
         svaSSMxws9FRJmDZ43tMRiF1yRMmMQbj3UDlvHAOCthUpO0ntuSEV84P3FbF7YGS66bc
         KaDw+68T9eLIABd+FIayWb/rm6jODIMuhFKHdhEmbsjjlamO2Ei807+TnTQiMd6T2f0W
         Gq5i/qcGTPuXzLUerPACxHHHRPvZYpIN1Kjd30RZ629lBINeJBmyq4xQ9pOQWG+AGEyn
         cULTQ/XyOqa739rXR2Dfozkh2W8D2IioprR8mqzj6w9mQMietjsKp0HObYCeTatNyw9i
         irdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884960; x=1794489760;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ab9/FtU+evEOIDbPSbhyDZc8Br1EcYdUtbtpoFOf6ao=;
        b=fFAmadLza172WqdPLPVGg8aI+NI3Y+hkADaoTxuvSEi1a68eErcFJ8nMnsn9pob/2R
         +yZT7uRdpPZotoelKD7fKDYndA6pL1iAz54UKr8nq7cf1dUTFgOV2UzHR0/Mu3FnDMt0
         ERgiVh+JrLDjf2tfQR/L2rPrGcO3yKnAKmsytKTmoIY7JZ8RtcPT5deWzNYkcmUkcAal
         as+nGnQ5/MvJ3INFGW3p/SbRGKqK1RZLY70VhXWx18fE485B7GdnH3RzMRoG2i2lKGzb
         bdtCKsd8hw6TurbDaS68S8MY5QETJckLucW6TWyMGbXtuanYz9tR9veNSTgUbYhOH5v/
         CFsA==
X-Forwarded-Encrypted: i=1; AKwUvBxIinAZ8dYbfimvVmGR6bPRpQPNgCXW6BBSoVg4NEg00GYoj9O2E1lZQiyi+FjdKgdRj4XyDHApf/2ZCBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JSKfyy5anspO0GTiygBbGB+Atf5xA0ZKngARnMyUEqRHk8nD5
	V0R0STDYD2+cJaLpzb53/1SlwUqMJMk8Sre5GIjVUPEnXHfGL17LmIdXUtIvR2xgHpKWAMzxm/D
	dPSJb2DliOUg5Cx/rHMnsZl8Zj355wEDnK9ldMicDjgFXMrIrYMTeHihaXzgjMAgmIw==
X-Gm-Gg: AYBFou1KPIZXQk2+tNm682HGBzika+ak0SXvsc++5mjYCvd+yEqvLvF4tp4pS17M1p+
	PoDMhLDhM03/BIsu3gMv4fpfVBJt9+KfP0e4xctMC9uqthbNSG6LfRwPP5L/W5Gwf68uMxc9egk
	itRNgS++dwOXdBebVxHNCbxD07+yv57PTI5OFIwK2BzL0+paw2LtXySJ8tpSWXSq2zm0iE+jfXs
	xRD4JJns5IXXD7E+L5TBT+lUwt44NTmVbUHPAlK7QTwndyu88SJM1QBqtoO2XTtJG6AfVwZY+4I
	//LHY/Njd51530yU7ESohdjDFAwmKbKKH3HZaUzeWPEWkU8yvMCBKEnfODc1BTY3c/ZEquPaTDN
	KIu8CaW707wakcxPybYVa5pw0iL1vKi2HvP0Rjb1+yVYxpK2/2ovP30jg+CMf21Zl88E2g1yCkT
	wxCSkiRbaw4pvfxNQ=
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr17182375a91.37.1793884960401;
        Thu, 05 Nov 2026 05:22:40 -0800 (PST)
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr17182351a91.37.1793884959900;
        Thu, 05 Nov 2026 05:22:39 -0800 (PST)
Received: from mpilaniy-mac.redhat.corp ([2401:4900:1f28:63e0:edae:927e:c670:b679])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31601b7sm3856804a91.5.2026.11.05.05.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:22:39 -0800 (PST)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Thu, 05 Nov 2026 18:51:33 +0530
Subject: [PATCH] kho: fix restore order for NUMA-split preservations
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-kho-numa-v1-1-e807879644cc@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubbaLMKryMXMYYeMNpOSdzdc/
 ur/fRd4dIQe6uQChwd5Wm2ESBPQRtkRGfXRkPGsEIJLNpuV2bAolmuUpZLYV7qCmG8OBzq/q6b
 97UM3od7fPdz3AwbzeB1sAAAA
X-Change-ID: 20261103-kho-numa-5ce38a3ed9c9
To: Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884955; l=3669;
 i=mpilaniy@redhat.com; s=20261103; h=from:subject:message-id;
 bh=2j7UXRooyvW22SzIaRB/dl4RDz1nl9MFyxNiZyzuBgw=;
 b=vdaovpNvxbtOZRXpNitY6GqWoF6nDPZnjCousaLKgOJwI/K78h/4L2Dco1VA9V3Xcs/fKO107
 0UkOGgTHLK7Cw6fzuSyiGE2vzHPSQcKHjK954qch/bS6j+SUWRF3KTp
X-Developer-Key: i=mpilaniy@redhat.com; a=ed25519;
 pk=dOf4ctfH7dkkTYewUPOzloK8/0QFmb+uPo0tKgpSdzU=

kho_preserve_pages() uses __kho_preserve_pages_order() to reduce the
order of a preservation so that it does not span multiple NUMA nodes.
kho_restore_pages() does not use that helper; it recomputes the order
from the pfn alignment and the remaining length only.

When a preservation was split at a NUMA boundary, restore picks a larger
order than preserve did and jumps over the next key. Those pages never
get restored: they stay memblock-reserved and keep the KHOP magic in
page->private, while kho_restore_pages() returns success for the pages
that were restored. The consumer has no way to notice that part of its
buffer was not restored.

Fix this by reading the order from the key being restored. The order is
already stored in page->private by kho_preserved_memory_reserve() and is
validated by kho_restore_page(). Advance by that order instead of
recomputing it. This also keeps restore independent of the incoming
kernel's NUMA topology.

Example: QEMU is started with two NUMA nodes:

  node0: [0x40000000, 0xC0400000)   2052 MiB
  node1: [0xC0400000, 0x1C0000000)  4092 MiB

The module preserves [0xC0000000, 0xC0800000) (8 MiB, 2048 pages). The
range is 8 MiB aligned and the node boundary sits exactly 4 MiB into it, so
preserve emits two order-10 keys, the first at 0xC0000000 and the second at
0xC0400000. Restore computes order 11 for the first page, restores the
first key and jumps straight to the end of the range, skipping the second
key.

Fixes: 91e74fa8b1bc ("kho: make sure preservations do not span multiple NUMA nodes")
Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
 kernel/liveupdate/kexec_handover.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..7d30ad9cc512 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -511,7 +511,8 @@ static void kho_init_folio(struct page *page, unsigned int order)
 		prep_compound_page(page, order);
 }
 
-static struct page *kho_restore_page(phys_addr_t phys, bool is_folio)
+static struct page *kho_restore_page(phys_addr_t phys, bool is_folio,
+				     unsigned int *order)
 {
 	struct page *page = pfn_to_online_page(PHYS_PFN(phys));
 	unsigned long nr_pages;
@@ -530,6 +531,9 @@ static struct page *kho_restore_page(phys_addr_t phys, bool is_folio)
 		return NULL;
 	nr_pages = (1 << info.order);
 
+	if (order)
+		*order = info.order;
+
 	/* Clear private to make sure later restores on this page error out. */
 	page->private = 0;
 
@@ -550,7 +554,7 @@ static struct page *kho_restore_page(phys_addr_t phys, bool is_folio)
  */
 struct folio *kho_restore_folio(phys_addr_t phys)
 {
-	struct page *page = kho_restore_page(phys, true);
+	struct page *page = kho_restore_page(phys, true, NULL);
 
 	return page ? page_folio(page) : NULL;
 }
@@ -573,13 +577,13 @@ struct page *kho_restore_pages(phys_addr_t phys, unsigned long nr_pages)
 	unsigned long pfn = start_pfn;
 
 	while (pfn < end_pfn) {
-		const unsigned int order =
-			min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
-		struct page *page = kho_restore_page(PFN_PHYS(pfn), false);
+		unsigned int order;
+		struct page *page;
 
+		page = kho_restore_page(PFN_PHYS(pfn), false, &order);
 		if (!page)
 			return NULL;
-		pfn += 1 << order;
+		pfn += 1UL << order;
 	}
 
 	return pfn_to_page(start_pfn);

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-kho-numa-5ce38a3ed9c9

Best regards,
--  
Mukesh Pilaniya <mpilaniy@redhat.com>

