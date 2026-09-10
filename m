Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440A339375
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005069; cv=none; b=GmKVZHlMy7wU12IXBAZvUStoSEaSIftweYu8OIqUT/kVuC21Feaj0Gp6BUkVFz8CVz6MVRI0K12U6hLC6XRsWtsOMfW+9SVfooPPZ1Jaw5QLrp/7B1Ox0o7b3kek+6Q2luR/A0PFMYb9G1Qpjd7AI04CJxt0WAnRnKOe0M4mkpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005069; c=relaxed/simple;
	bh=MC8RF8exbnRdyxfzrjSNLOlOV7Cnba1woExTrACXBa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKE8Hs1GkbvSIdl9vfwux0sg9nYbvE/kIMB3gfuYvnadOmyUzXCWmFR02ySde5zjCkTDMugXwwMnkQBcrjRapVBAne0PQ1E+cjIwehC0I9cd7z2q7LiRAPZ/j+mBIbHeL/8kIvk6QavSmDjsJ1t1ORoxDLv+u1vezJKf14YJsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7uCSFSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1tmFJl8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7uCSFSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1tmFJl8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lId93198384
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qLcKeVUAGDAqIIR+NcT+dw/2isBatO7SL2E+KRjKb9M=; b=c7uCSFScMMdi2itr
	7EKgyuvAUenDol1uOUGw+354mn+uFnFCfxHZgkwhzYvJKv+PzHZYj2qdyvSfuc4g
	KRJQwBzRTpui2QsxO7XNpq+4fCOwpXtfvD19WsufLhtDxuA57C5O+QsEBBnoWKYl
	7RfC1QMyVD543wc4/KH3WkteBM9ohwKBrUDht/avEW5Lq2fHePkTVvQLDI44eITm
	+R8sOaJFmldu0/dJZLACD7GrvcIiveTxd3cOjNt+ixhNhGbrugruS1uf+XHS8GWG
	namh1maIBVDx22dxviMpC8m0JOnSaIIEabUc1W9bECk5Q/ABrL+saCBcqpEd9m63
	Fxs+eA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydshkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39906175917so8031724a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005066; x=1789609866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLcKeVUAGDAqIIR+NcT+dw/2isBatO7SL2E+KRjKb9M=;
        b=d1tmFJl8he0JspYrAHck4SZHHrMjMztuyblOdZ3ZQcp8wzqyBKM5LxGuJSPLBp4Czx
         ZQNxwlQ+lRoFJT8Ee7U5AQA0zMQamCof5NDfmZZOWMXzq+pDd04o/rPCQgpN25SfFz0H
         mNyuRXzCV7gS2ezUfgA24gTixK/wuJgUvka+d9MPem0AuDP+0tHymbhDgpfg2TGyRANS
         x0bqu04k31HtwwZ8/VPCKUat+A0EikP/znAlEG62KUfn+kmnV6b3ziUaBMz6GiDttETe
         wseXHIhtyEL5HPwgbJD4sJYdVIHtpZ+N2AZ029+G4FYcunEdJ0HPuBVvXPHX3NBBKlMC
         yyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005066; x=1789609866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLcKeVUAGDAqIIR+NcT+dw/2isBatO7SL2E+KRjKb9M=;
        b=Aj1GWK604KHjAKXyRenKdIH0QcgGrEMtees49QikpUEKksKELl28shFEqFPtOMv/Dr
         psW847Yl67sIEfut45/+uoeQaNIzOxExpIl4Q/HZhBvOcHdaJ7V2fVU6vH/+BnnXCvli
         a+/X6WiWpjIpLI6dL/MMARP6Pts7xRmUgjQaiKcv+NHnCaSQoAL8wUcgM+wtFEyKz+s/
         kHcvtWcRzPW0CvEZda9swEuknfd0X3VIgBjifV3AtHwRSdC6QyyoRkpBst7uT3EAZ2TB
         nDNyZFoDofSYfKNr6EKNC4GbnHXF4JlvLxOAztieWIDFDHfNToIZIsLvNgub9raKbqiN
         mMSA==
X-Forwarded-Encrypted: i=1; AKwUvBxDwoT5cGjlQyL9+K6uKQCePaj2lG8zcQ3+nquMxLu22nZTI+4mP8T+p/A9HL2kGDhSIulssCkUG5SrxPs=@vger.kernel.org
X-Gm-Message-State: AFuF++kl2isPotSkVnrMU1UiBOyOiQGoFRdCmWMOwNbyXVJUcJ17OJjZ
	RYrjHA6dIWTkCfI4Fs6eiCQUH3VUm+8hnSO1E6ox3jlRcjwSqo3b/C4Z7EDvXLWXLfv5z4Zw56x
	qCPrTz2kBEGHKMqOX9tlKXW4o39XSUmzTmXzPnxePLa0BoVmPnacaqJ+JiqER8i2tb9NXuIPhRK
	8=
X-Gm-Gg: AYBFou3nzQc3hohZZmNMYRzn/NkS36XKzpkV9x4BR/agRrn6B0RvfUGSgZUB+Ymp3XV
	mUfrtHMMJfkDmbWDSQlHGf1dvSuDpHaj6WT/8hewQqyMLXqFqxeXT48S6en7FTyR0X6NuYHUETG
	AVlwpEobNZ6UrrOLAWiyivrymNg24EnhLQ1skt05KxiLngC6XesW8ZjspumSHhCBfSxyYZm98lW
	hQ6qPLuKRl3NsSJIZXhFKOpti9Vx/iiFH6ahny0w+81kaUS2rztcFoHO25xlioS0c7lxIdTPrFg
	PMrdvr2Q3YFTYlKO6zpxN0dgaFL3MseAmmcES0JEEMMQtQkr6RvdCYWyjAudCzoTDoZbaMTlbUU
	bk+EnFV0h9MKTZIUkbHe9jYt9/sBOfJOlJCl32uN9Jkzog9HBkdmB
X-Received: by 2002:a17:90b:578c:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39b261e7649mr61147008a91.12.1789005065864;
        Wed, 09 Sep 2026 18:51:05 -0700 (PDT)
X-Received: by 2002:a17:90b:578c:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39b261e7649mr61146945a91.12.1789005065352;
        Wed, 09 Sep 2026 18:51:05 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:04 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 18:50:57 -0700
Subject: [PATCH v4 1/5] usb: xhci: sideband: fix ring sg table for sub-page
 TRB segments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-16k_offload_v1_b4-v4-1-f24a86617597@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
In-Reply-To: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa20d0a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aTe8jcWzyPiXfLMz6F4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: B5VeBz84yCmo0efd9Es2iBOEtSF4Xty3
X-Proofpoint-ORIG-GUID: B5VeBz84yCmo0efd9Es2iBOEtSF4Xty3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX5farUu6CYMVf
 3QGVMs3D/KxR4quU7fK1w7wmSKvXiCRlcyf4W1XaAEMib4eH2GzuyfQzV3kBemHmHlIH/5/VbWY
 WVx6sBuhtWDId8PLnt4FOu21Kss5mcI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX3ykTGRJZk0tt
 BZJLs2eaUfN2/EBY1aqGGMtrpKf+mE86fmjsnDLms5vnRD0ZsoElIeyUx921ojspRiELUrP4Lq3
 V+mbWjy/K5Ya+unJ5JvvOtOQw7etJaEIn8/v2hB0lmVAL9bcNS4q0BTvqT8cH6R/8bepFgxLOrJ
 7p7sd5/OQHf4x4m1j4VLV5jKjE6E3IIbPdoS7Clv426SvevxD9VHFh2QxeeWdj1iwKBkf3viIza
 86U0bNwQGiYl/jvJaDBQIv0yqtXpM3zSaH5xy4qgobz+mQr8crdVf4vIhTZdjXfGhVDZEz05DH8
 o0EMM2hp6aHb9GQTrI6Xhlk8HTImTSlCbJC5yxB+LISZthqmDpKD7TQSrqg6yb/MGK8y7KPs951
 Q4gXwRyLdAsPvWedXWuUeq4gOb2TSsqNFbE02t2OTwngCQUIi6dk2b3N3Z2eENkemO+dPLBYkyu
 F5S9pjf0PJu5v3UOG7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100018

xhci_ring_to_sgtable() populated its sg_table via dma_get_sgtable()
per segment and sg_alloc_table_from_pages(), both of which only
operate at whole PAGE_SIZE granularity. Since TRB_SEGMENT_SIZE (4096)
can be smaller than PAGE_SIZE, multiple ring segments can share the
same physical page on larger-PAGE_SIZE kernels (16K/64K), which these
helpers cannot correctly represent.

Build the sg_table directly instead: allocate one sg entry per ring
segment with sg_alloc_table(), and fill each entry explicitly with
sg_set_page() using the segment's own page (resolved via
is_vmalloc_addr()/vmalloc_to_page() or virt_to_page()),
TRB_SEGMENT_SIZE as the length, and offset_in_page() for the exact
intra-page offset. This guarantees each segment gets its own sg
entry regardless of page sharing.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c | 57 +++++++++++++---------------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..beb637407e47 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -9,57 +9,42 @@
  */
 
 #include <linux/usb/xhci-sideband.h>
-#include <linux/dma-direct.h>
 
 #include "xhci.h"
 
 /* sideband internal helpers */
 static struct sg_table *
-xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
+xhci_ring_to_sgtable(struct xhci_ring *ring)
 {
 	struct xhci_segment *seg;
 	struct sg_table	*sgt;
-	unsigned int n_pages;
-	struct page **pages;
-	struct device *dev;
-	size_t sz;
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
+		return NULL;
+
+	if (sg_alloc_table(sgt, ring->num_segs, GFP_KERNEL)) {
+		kfree(sgt);
 		return NULL;
 	}
 
-	seg = ring->first_seg;
-	if (!seg)
-		goto err;
-	/*
-	 * Rings can potentially have multiple segments, create an array that
-	 * carries page references to allocated segments.  Utilize the
-	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
-	 * that page links are created.
-	 */
 	for (i = 0; i < ring->num_segs; i++) {
-		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
-				TRB_SEGMENT_SIZE);
-		pages[i] = sg_page(sgt->sgl);
-		sg_free_table(sgt);
+		if (is_vmalloc_addr(seg->trbs))
+			page = vmalloc_to_page(seg->trbs);
+		else
+			page = virt_to_page(seg->trbs);
+
+		sg_set_page(&sgt->sgl[i], page, TRB_SEGMENT_SIZE,
+			    offset_in_page(seg->trbs));
 		seg = seg->next;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
-		goto err;
-
-	kvfree(pages);
-
 	/*
 	 * Save first segment dma address to sg dma_address field for the sideband
 	 * client to have access to the IOVA of the ring.
@@ -67,12 +52,6 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	sg_dma_address(sgt->sgl) = ring->first_seg->dma;
 
 	return sgt;
-
-err:
-	kvfree(pages);
-	kfree(sgt);
-
-	return NULL;
 }
 
 /* Caller must hold sb->mutex */
@@ -254,7 +233,7 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 	if (!ep || !ep->ring || !ep->sideband || ep->sideband != sb)
 		return NULL;
 
-	return xhci_ring_to_sgtable(sb, ep->ring);
+	return xhci_ring_to_sgtable(ep->ring);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_endpoint_buffer);
 
@@ -276,7 +255,7 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
 	if (!sb || !sb->ir)
 		return NULL;
 
-	return xhci_ring_to_sgtable(sb, sb->ir->event_ring);
+	return xhci_ring_to_sgtable(sb->ir->event_ring);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
 

-- 
2.34.1

