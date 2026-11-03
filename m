Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749201;
	b=k6SE83Gq1Z2giE6yj2SWbHfgGL5MdYdBkL//hi++WVpuox64zeByneh7Lr98YSgb6CVL
	 0cXiB96B5wSB5hkK2iOAkuYeVDMocHzK7koYj4t1thwQqjgviqN4u05NRPXqi5qgabe1Q
	 j5Bn9I2R983rD9eQvxF32IBJdJE6lOLtaUvpVcQPL5HkP6brNcgfAQ9kvx2+jcLmFZpq1
	 y8bYOqEOF/p93eQiIzor81VtNpsL9Erk/sWRdc5PFfuBtU8fwRTUfww9BZiSmJ4D/7X/i
	 s1cJ96I1nq/0C8syd6MA/FSpabwT9YYX78J2LOL5N60JD6qr0/CCk+7oAWUNQywctCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
	b=VWifwkPghOdUgDvlFWFMpYj0YvvYMvWug5GyykiKaOlS9P8pV4R2AYmdY/HV48L8WEW8
	 Fx3kB4Kc9mVRHj4X7S/sr+lHqaCtctIot9IRh7ygjyddzK3ZVkgPEhBf14wOi3zQMIrJe
	 77CjA30fltQO8vha+Bi8mFf6SC6paFN6okQBd4KZhpWqiN/Bcc+t001+got0dCUkiCFMY
	 wTFT+Wm7MlHhUEyKgPo8QbDcAAIL9K+w/qMz8kH8o67kIEdvEX7HDjXbgR84XsR6eDiQi
	 PnQnH8jvkBMOsg2QHNNt8MJkx9+bBhoJqJ3uPoMnrcahfqXPEzloBjQOTgDqC4JNIJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jzxb/KYl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EY+l3FNT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8345A606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8345A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzxb/KYl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EY+l3FNT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKl7W4033345
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 23:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=; b=jzxb/KYlhU6jWHrE
	WlzEfu79azVu/5vTDeWNgkasc6CrrHHvFnawbsEZJAvG8O6QHbTjh5PV/NHbjl4R
	a+mowJ7xGEpbhvDnGBR2DwY9ciKwVHQ4D0TJamIzkCA/1JrIlYf/ZxkEzSdjmTsU
	G5Ah8Hf7R8RKu4LWJaeUiFeCL2Y880peHhgcK4VnFKLBzQr0Zky1t6sgSBexHXnn
	C5c9PAwhJ1e95GH2mOH9GjgdAHsakj5eOmG50Zz3MrFsk/XRDpOYe/+cTwYC1E93
	EEAPC/UPc0XPxm9CSL0KdZxI/+YXL03JzoyKpj/UQUqji0PXBFcURzsWduzKTzFT
	qavfYQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypj2fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:39:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so102366eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793749198; x=1794353998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
        b=EY+l3FNT07tDOa+tdRWneL3n0da/Ks5gzlXQs4qq8pFia+XTbAsHP1Nt3jOIztWTtr
         JWRIImsKbaJHjn2mjzXIHnc0qK5bbhEm+D1A8CB2/jWG16qEMPhcr87PHMraX5b6eEJL
         7zTv21/ZxsEO46xH/Gy9W3foEEN4bt6zQFXcY/BUXbS1xPsVfn29xRaFaU8WLNi/0TcQ
         qcvjRZkXuaSKJrrLpzPQnkcFhFKsqTMUL0nrhuUfl4bZ91VI09IfCmM140N4QXx/AxhE
         Nq4B5M6HwyVqCl6Qw7Hs6ZQDVzzmITxEGTx+8YL9f/qFsdjysR3z9eNeQ9K0IceQDC44
         fJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749198; x=1794353998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
        b=caiMfKGPSurdqWndzCBoIB8EnMhf1XV4ZPzS6kRLAON/KiUgF9x4TIavNwi+2R93fb
         Hq/5Amlu0+D3EAYA4JFaJWDvs2rNH3JAf0+cxrzQDuDMimzuq+Va+G6yi9jqv0X23+nj
         Kj+8AtrFkv8jsGh0S239Qlw6uD2+CywQH6ZIbiKrgRZ6BOg057569SDGB8g+bRy9l7Uv
         PdyzDOcfRB5hV4jYDVLpyocv//JxOpXq+umQWPRQWbCfEywWgZcx5SPyMS5NL8gD9IgR
         hwP5l5BVUpFpejhATll+2TgZ6LLwzalcTmckyM5BIJOMKPv2njsO0CofMj1rvxMm8IWN
         pqlg==
X-Forwarded-Encrypted: i=1; AKwUvBxpwYbMwt5r8wZzehHtp5PILr2M7JbUnoDJ8//UjeFMH9mrfJyTFg1gaonGbaZmeGOeyfoGQ3sn+63tP7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z95271rUkmoRCF6YmilwmIvJ63TO/FwIg6AiuGkR9jBg37i70Oo
	eTcoyKOWzqY5ndAjnXCPa1mY+n6LlQNe6Z96dXSXCVBNiHMMz/qOlRUv8LDXKhfmGAR8sHPRHbx
	bKZ68HYY058P5tqqN9ClU0k7XBZWOtydEIdHyTQcASiSqcz2APmrw8ckci9wp75+b4MY=
X-Gm-Gg: AYBFou2t6NpNRUy+2tpaT5ncoj2tBuwOWuw47/RpaccioCIXhgGhadZGixXQvsX6hJd
	e8LOAghiq8fL7F4/8z2SYultUh6F9UxMMtK0ZAGuxxbMzQTxWVRAWu2Qt0SRnK6v/OuU513Qe02
	W67NNcZDVcN2R6qFXIuIbA+KOQCxZJOEu07H4OfL3YVbMDIXHKkBq1s9zK1z357ut+jDag+Borq
	tBn3NCWtaOyEcrn8eaZbnWhCzLkIH71GTQvf1RhXSf9qBCUZXo6Yt/lHy+orzZHjWCEoYnIPwR1
	1LCDEEd0YPw7pgWoAYh9ViyfGsOk2VAjLsmYs1owqDPbnZtA9Y+wB+NHb+f96BEVZf096NKQgLO
	qX0IJGNvM24Gs9qvTs0gKF+tjnj8WQdXTvaHSYVZtxjKWEr9qY0uxMA4o0D6uUMtoTHrP1drpi3
	85Ecz0hW5r3t6Ke2/2nNp05SpInw==
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr35245422c88.29.1793749197766;
        Tue, 03 Nov 2026 15:39:57 -0800 (PST)
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr35245392c88.29.1793749197211;
        Tue, 03 Nov 2026 15:39:57 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm2356442c88.1.2026.11.03.15.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:39:56 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:39:53 -0800
Subject: [PATCH v5 1/4] usb: xhci: sideband: fix ring sg table for sub-page
 TRB segments
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
Message-Id: <20261103-16k_offload_v1_b4-v5-1-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
In-Reply-To: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX8H0h7kdrdx/q
 8CJc/BkEvyIb3EPrYngacUyBrOir4m1rk/94JchElXa6BMnmw6HBeIbrdt1rNiqUe/K7pHMLOPn
 VbM9IRI0AZYCUoTsgU9bMvmismHJDI8=
X-Proofpoint-ORIG-GUID: v-9--wgW4Bzw27qxLb-FQR78GYiviEqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfXwBcMLy+/XhON
 JLW4N8t0BfrxedTQHzZnLKyv+JO0oga/TX2kzHyXb+siErl74hs1HQU24/z5Yu5hsoChJUKET5K
 eKnJk/xj+4gBAfHCoVl6DcUV3r2DezTt0MbyPLIntS8cLkx4Ysq4Nbv4rK4JtyGF0OmJP6xALVx
 V6KwMQ3MOWafFAaLyo0gJpDz0um2vdTgHAzBBEBUb2Y7HzjW9CYLgGQJAQoPttD9EszHt2UOo7R
 dV8gMQ2TlM+Ik9qBQyzWcte1eUWIN+gse93wcJ4rqvDX5C+PUvjXFg5lDLAViPDp1ezLwrkju3o
 gOekq9Zfb8qJC+VR1SoWsJZaPywZn5LdtbIcO08HPdyApM2O1wCPe/Vi09T4qqlgdw4q4wBxM48
 UukHLb8rMsX/3ehjYqSxfYl7Tiza95+bZKMo2zIyKOe+wcnMAP53gJcVuqxaDqfwQHF0sAz0n7f
 KXuX40bo7oQlWQ9gFWg==
X-Proofpoint-GUID: v-9--wgW4Bzw27qxLb-FQR78GYiviEqh
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea70cf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zbI7ttHqI6kfeEXDPioA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030094

xhci_ring_to_sgtable() populated its sg_table via dma_get_sgtable()
per segment and sg_alloc_table_from_pages(), both of which only
operate at whole PAGE_SIZE granularity. Since TRB_SEGMENT_SIZE (4096)
can be smaller than PAGE_SIZE, these helpers describe a full page for
each ring segment on larger-PAGE_SIZE kernels (16K/64K), and cannot
correctly represent segments that share the same physical page.

Build the sg_table directly instead: allocate one sg entry per ring
segment with sg_alloc_table(), and fill each entry explicitly with
sg_set_page() using the segment's own page, TRB_SEGMENT_SIZE as the
length, and offset_in_page() for the exact intra-page offset. Walk the
table with for_each_sg() so this also works for chained sg tables.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c | 80 ++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..d0c0f75d6085 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -8,68 +8,78 @@
  * Author: Mathias Nyman
  */
 
+#include <linux/dma-mapping.h>
 #include <linux/usb/xhci-sideband.h>
-#include <linux/dma-direct.h>
 
 #include "xhci.h"
 
 /* sideband internal helpers */
+static struct page *
+xhci_segment_to_page(struct device *dev, struct xhci_segment *seg)
+{
+	struct sg_table sgt;
+	struct page *page;
+
+	/*
+	 * Remapped coherent memory is in the vmalloc area, where
+	 * vmalloc_to_page() finds the page for any offset into the allocation.
+	 * dma_get_sgtable() could describe the buffer from the start of its
+	 * allocation instead.
+	 */
+	if (is_vmalloc_addr(seg->trbs))
+		return vmalloc_to_page(seg->trbs);
+
+	if (dma_get_sgtable(dev, &sgt, seg->trbs, seg->dma, TRB_SEGMENT_SIZE))
+		return NULL;
+
+	page = sg_page(sgt.sgl);
+	sg_free_table(&sgt);
+
+	return page;
+}
+
 static struct sg_table *
 xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 {
+	struct device *dev = xhci_to_hcd(sb->xhci)->self.sysdev;
 	struct xhci_segment *seg;
-	struct sg_table	*sgt;
-	unsigned int n_pages;
-	struct page **pages;
-	struct device *dev;
-	size_t sz;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	struct page *page;
 	int i;
 
-	dev = xhci_to_hcd(sb->xhci)->self.sysdev;
-	sz = ring->num_segs * TRB_SEGMENT_SIZE;
-	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
-	pages = kvmalloc_objs(struct page *, n_pages);
-	if (!pages)
+	seg = ring->first_seg;
+	if (!seg)
 		return NULL;
 
 	sgt = kzalloc_obj(*sgt);
-	if (!sgt) {
-		kvfree(pages);
+	if (!sgt)
 		return NULL;
-	}
 
-	seg = ring->first_seg;
-	if (!seg)
-		goto err;
-	/*
-	 * Rings can potentially have multiple segments, create an array that
-	 * carries page references to allocated segments.  Utilize the
-	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
-	 * that page links are created.
-	 */
-	for (i = 0; i < ring->num_segs; i++) {
-		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
-				TRB_SEGMENT_SIZE);
-		pages[i] = sg_page(sgt->sgl);
-		sg_free_table(sgt);
-		seg = seg->next;
+	if (sg_alloc_table(sgt, ring->num_segs, GFP_KERNEL)) {
+		kfree(sgt);
+		return NULL;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
-		goto err;
+	for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {
+		page = xhci_segment_to_page(dev, seg);
+		if (!page)
+			goto err;
 
-	kvfree(pages);
+		sg_set_page(sg, page, TRB_SEGMENT_SIZE, offset_in_page(seg->trbs));
+		seg = seg->next;
+	}
 
 	/*
-	 * Save first segment dma address to sg dma_address field for the sideband
-	 * client to have access to the IOVA of the ring.
+	 * Save the first segment DMA address for the sideband client. The returned
+	 * table is metadata and must not be passed to dma_map_sg().
 	 */
 	sg_dma_address(sgt->sgl) = ring->first_seg->dma;
 
 	return sgt;
 
 err:
-	kvfree(pages);
+	sg_free_table(sgt);
 	kfree(sgt);
 
 	return NULL;

-- 
2.43.0

