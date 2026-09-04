Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177D42376F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505095; cv=none; b=c8NXKbdc39d5c8dNppz7fJRrRnwm4ieyf5hqaQwb4FoEMoBDCiu9B1Sob3a9d0R1aAclXVExJGrTohhs10vqqQrBB8+vcCUkwWgQk4+JalrOXOUR8mKhViilYeO2e7Np7hNMfGtdg4XUZ4lsCQfhjR7J+U73CzWKkmWPj1HNLlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505095; c=relaxed/simple;
	bh=qk2H2kpP5eCkGJQc3YwLpJnOJ4Ld+X7USeS5LpzMJyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uk88NtFWCACbhy+JHTRX1HK79Yy0Uu16jS3BOFjhWXaVwRmrAorbfXfuKiA7pQ0kBnruAhz57M/ArKa6VpUlq09wefcYb+yWcKS7SQOFz3bRn+X0JMFV4lwoG+CnH1KEnHoJ+feNuYJO2UJ1cGah/IcF3yeoNoFtuvvWU+CPH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahmQqfvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmfPmafX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahmQqfvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmfPmafX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684633Ai2719347
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 06:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqNAQpz3CKiCXLDTkHcOYdwhCHLF31sQozeDDZ/5UWM=; b=ahmQqfvy/afZU4II
	0Dg04lGlj6UX8wOIIH69WCumI5ahnB2Lwvk7SNzOqeeKuf1xgqgZxfVM0P6IQPx/
	Qq3rNAiNJ8Zti588TxMPmrtn9UZ4Gfi7SZU9br3iqUV7ZmUESR+H8OJG8OOjDUQ/
	hL+658zjXtuUrclegLk6DsW/TSvMhUCQ/Fsj1j0Rbbb2p6x2drmkRcBljGuqu93h
	V0OCjlty0rlP8F7oMEep4zVLdN4+MYYr3T5VtvTEtAfbDhEFBMcnSUlr8dxXaPKD
	8cWBL6a2pfG1ojwoaq7YPMLN+7zW/nC+h6oIG6heZMfdXiQLQeaHEkqGSb32HxLh
	JRrZMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd0b3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:58:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so1164181a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788505089; x=1789109889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqNAQpz3CKiCXLDTkHcOYdwhCHLF31sQozeDDZ/5UWM=;
        b=bmfPmafXXCy2DKhaXKqlvCOpR/xdiZOleSM9c2GYjzo7BZNjPcQ59YTDMuHNao7o3I
         jF4UYwgjIACf/hnSmhFg5wSHIYJEuRZanBJ0tp428Zq4OUxyBofIHQraLkhHaYidj0fy
         KEqWafVgDcx/nxzySAhWFL70RZCUxCDGr/d3WYT1VuvqeqLxS6HHd4QOofSW7Yi41ffB
         HPAhJI4Vx0vv6zWhc95v3+qVxLyAhKCqxAK3as1xQKlQ86ARnffW1V7P98vcziHwBjy9
         H2KMyaChlaLhAOitXS31vnb8vxMer6fBENnUg2zLrKs9duyYMB23i3lRX8a2OGASm6wx
         ttsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505089; x=1789109889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqNAQpz3CKiCXLDTkHcOYdwhCHLF31sQozeDDZ/5UWM=;
        b=Olr34jLbfqzgcfVOqoWBzItMgIFTVgZI9NogC37qLhgLqSDmmf/IgS8nHIRUZoewJr
         wHoim2Hc4ylCD5pbWXYpidrltQsCWtfPjE32qroJaFs5BvHa7Ecg3EQVTiqRZ1QdK6TC
         DQN7fnhTArpnvtb5PVfzIRr4+vT0kuANjMx8F7cRRmMv/FBuoFhQKLlUFGiMkxL4wOYZ
         pV1NAPRAd3PWIeqpYl98jh/4ZHi5O3Of5yc7/4c5FzwIiI+nO7wPM+lnOxb1AHs2HkUF
         oMiRAQkgvSOKWOEMBXYXHOF179BVAvcbawRuUstmE2sHzrEM4C4neqkbKZTDO+rKc5i6
         WDKg==
X-Forwarded-Encrypted: i=1; AKwUvByodZUAOXCXA2ii7qgwsol1Dk6ztzwPWEmPUvg0WMuuurdYIDED2eTv2TvazA/Mw/ROg70cQcLc5VHwhPA=@vger.kernel.org
X-Gm-Message-State: AFuF++nYO3Dod8daGb2lNwevpWkCPyP/wXZ75zsX8zdKoeGuooZR/XlE
	ZUBaAzXpKia2CVOKr+gcDPwE4Ho/Rs82JTK5KuKyp1kSX15WiwtM/08mp1nSNQNAnUNcq/j1S9m
	R3GMeus8YWS/eNNqPLvgEc2ri4uuXn44lKimWasx/gjmUoTdgOZTI46pnbzi+K97uc/I=
X-Gm-Gg: AYBFou2OYNr9FanqFU9Uu9lsgwlx7G8CG2pdjMoedzGJX7qcLfabiz9Igj3Q/SObVr7
	LeVeN0BoOHO9E1luPpNmQpkmz/+9e4Hj8fuqniqYk5MuG0NuEEkFuufK3747W9Nx0SzWFoQRkdw
	H6BlI3a4dsGUL1jQNjA6PzdZ7Dx+Ac70MpMKWxLDwOTD7RKJcbieTX6rCgB3ZeyGwkrb8gwaEcJ
	lPL2wwvmyAt04A4RRy688llV37fs66rt3ab2wEvhOrl90QhHAiGrK/vSb2aLNHZkXb+jTWOvZVH
	CGucDJ2UcaqzEhyP6V01t7CsBM2LHjgcOgbNcsC2avjIZgTUJlkgyK88IKEYCs1y66LIJZPTTqt
	xLWl5J2zeQzTImFRw8lzTnSBDUY/pxKM4duJz4bANTJeDetdJKtXl
X-Received: by 2002:a17:90b:3ec5:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39b26277673mr6247859a91.21.1788505088645;
        Thu, 03 Sep 2026 23:58:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec5:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39b26277673mr6247568a91.21.1788505086569;
        Thu, 03 Sep 2026 23:58:06 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm4760900eec.2.2026.09.03.23.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:58:05 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 23:57:51 -0700
Subject: [PATCH v3 2/4] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-16k_offload_v1_b4-v3-2-135928dc2408@oss.qualcomm.com>
References: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
In-Reply-To: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 4P9hA6kQCBJqrCiwOoLjUG_RhlhGu95w
X-Proofpoint-ORIG-GUID: 4P9hA6kQCBJqrCiwOoLjUG_RhlhGu95w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX9oU/utFSbJpR
 1BRExtb8ZvYbT+aj49Onl00aZpkanEtrOPlMYNZhQqFjFSExxS7J9Mhw//XpZbdf8hqec5PUnYB
 5RIOlqOlk8JPhmvCOrNRzn6JxwcVr0g=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9a6c02 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fiA0ds54v2HOqp6UKg4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX70oSTZHqotOm
 ju7BvgpIaLNU1Fp05TUVKpvB6sMe6XwkRvOQip6O5o/1oeahiiC55Xu8QZvx8by25MqVPVWuRc4
 0sQiFZ2tmb47qlGEr1B5V+1pCjog6STB8oQVlaRzBa3O0E7Zc+Xk77L1QAHuVdazy5WjTjMTxj7
 Hz9JUtWtayjBCOMUpLMPVtElgqAMbhn1bwBQVwqGTLoihM6sEzFgHUv4qz8neXiMJW/yz6V0UKK
 8dE4D2zBNtOXNvCvc7VZdiRhlqppChomwvY61c9bMWanW5Nv19DbDhgCi7mHfOFZ3v3tUry7Oa0
 1uTKzspXVRItAloKB+HKkj6jCHqWaGwhBPC/V0VqOsgEKifAc8TVHN+GL45+qEJeEV0hnJeIktz
 4p9YB4RcIXMaXn8U5UgcakX6mE65ZfHJXItyrWSAyf6pY/ro50wDnRyWk3bgkJ6PQbGgtelJoQR
 aD4kU4iOrvtgqKM2Sdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040063

Ring segments are normally allocated from a shared DMA pool sized and
aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
larger PAGE_SIZE (e.g. 16K or 64K page arches), a segment can end up
at a non-page-aligned offset within its enclosing CPU page, and
multiple segments can share the same physical page.

A sideband client that maps a ring buffer directly via the IOMMU
(which operates at page granularity) needs to know exactly which
page(s) back the ring, and only pages that are actually intended to
be exposed to that client should ever be mapped this way.

Allow each xhci_sideband endpoint to pass its own segment_pool, allocated
separately from the core xhci->segment_pool, so every segment backing
a sideband-tagged endpoint always comes from a page that is meant to
be visible by the entity handling the offloaded endpoints. Normal
(non-offloaded) endpoints are unaffected, as they keep allocating from
xhci->segment_pool.

The offload client owns the pool's full lifetime, and since
that lifetime is no longer tied to the sideband instance itself,
xhci_sideband_unregister() must free any ring still backed by a
client-supplied pool before returning, rather than leaving it for xhci
to free later when the client and its pool may already be gone.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-mem.c       | 63 +++++++++++++++++++++++++--------------
 drivers/usb/host/xhci-sideband.c  | 40 ++++++++++++++++++++++---
 drivers/usb/host/xhci.h           | 16 +++++-----
 include/linux/usb/xhci-sideband.h | 20 +++++++++++--
 sound/usb/qcom/qc_audio_offload.c | 21 +++++++++++--
 5 files changed, 121 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..a041a35fcd4f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -28,6 +28,7 @@
  * "All components of all Command and Transfer TRBs shall be initialized to '0'"
  */
 static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
+					       struct dma_pool *pool,
 					       unsigned int max_packet,
 					       unsigned int num,
 					       gfp_t flags)
@@ -40,7 +41,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	if (!seg)
 		return NULL;
 
-	seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
+	seg->trbs = dma_pool_zalloc(pool, flags, &dma);
 	if (!seg->trbs) {
 		kfree(seg);
 		return NULL;
@@ -50,7 +51,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 		seg->bounce_buf = kzalloc_node(max_packet, flags,
 					dev_to_node(dev));
 		if (!seg->bounce_buf) {
-			dma_pool_free(xhci->segment_pool, seg->trbs, dma);
+			dma_pool_free(pool, seg->trbs, dma);
 			kfree(seg);
 			return NULL;
 		}
@@ -62,10 +63,11 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	return seg;
 }
 
-static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
+static void xhci_segment_free(struct xhci_hcd *xhci, struct dma_pool *pool,
+			      struct xhci_segment *seg)
 {
 	if (seg->trbs) {
-		dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
+		dma_pool_free(pool, seg->trbs, seg->dma);
 		seg->trbs = NULL;
 	}
 	kfree(seg->bounce_buf);
@@ -81,7 +83,7 @@ static void xhci_ring_segments_free(struct xhci_hcd *xhci, struct xhci_ring *rin
 
 	while (seg) {
 		next = seg->next;
-		xhci_segment_free(xhci, seg);
+		xhci_segment_free(xhci, ring->segment_pool, seg);
 		seg = next;
 	}
 }
@@ -334,7 +336,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	struct xhci_segment *prev;
 	unsigned int num = 0;
 
-	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+	prev = xhci_segment_alloc(xhci, ring->segment_pool, ring->bounce_buf_len, num, flags);
 	if (!prev)
 		return -ENOMEM;
 	num++;
@@ -343,7 +345,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	while (num < ring->num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+		next = xhci_segment_alloc(xhci, ring->segment_pool, ring->bounce_buf_len,
+					  num, flags);
 		if (!next)
 			goto free_segments;
 
@@ -362,15 +365,10 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	return -ENOMEM;
 }
 
-/*
- * Create a new ring with zero or more segments.
- *
- * Link each segment together into a ring.
- * Set the end flag and the cycle toggle bit on the last segment.
- * See section 4.9.1 and figures 15 and 16.
- */
-struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
-				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+static struct xhci_ring *
+xhci_ring_alloc_from_pool(struct xhci_hcd *xhci, unsigned int num_segs,
+			  enum xhci_ring_type type, unsigned int max_packet,
+			  struct dma_pool *pool, gfp_t flags)
 {
 	struct xhci_ring	*ring;
 	int ret;
@@ -382,6 +380,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 
 	ring->num_segs = num_segs;
 	ring->bounce_buf_len = max_packet;
+	ring->segment_pool = pool;
 	INIT_LIST_HEAD(&ring->td_list);
 	ring->type = type;
 	if (num_segs == 0)
@@ -398,6 +397,20 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 	return NULL;
 }
 
+/*
+ * Create a new ring with zero or more segments.
+ *
+ * Link each segment together into a ring.
+ * Set the end flag and the cycle toggle bit on the last segment.
+ * See section 4.9.1 and figures 15 and 16.
+ */
+struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
+				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+{
+	return xhci_ring_alloc_from_pool(xhci, num_segs, type, max_packet,
+					 xhci->segment_pool, flags);
+}
+
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		unsigned int ep_index)
@@ -422,6 +435,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	new_ring.num_segs = num_new_segs;
 	new_ring.bounce_buf_len = ring->bounce_buf_len;
 	new_ring.type = ring->type;
+	new_ring.segment_pool = ring->segment_pool;
 	ret = xhci_alloc_segments_for_ring(xhci, &new_ring, flags);
 	if (ret)
 		return -ENOMEM;
@@ -1424,6 +1438,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	unsigned int mult;
 	unsigned int avg_trb_len;
 	unsigned int err_count = 0;
+	struct dma_pool *pool;
 
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
@@ -1487,8 +1502,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 		avg_trb_len = 8;
 
 	/* Set up the endpoint ring */
+	pool = virt_dev->eps[ep_index].priv_seg_pool ?
+	       virt_dev->eps[ep_index].priv_seg_pool : xhci->segment_pool;
 	virt_dev->eps[ep_index].new_ring =
-		xhci_ring_alloc(xhci, 2, ring_type, max_packet, mem_flags);
+		xhci_ring_alloc_from_pool(xhci, 2, ring_type, max_packet, pool, mem_flags);
 	if (!virt_dev->eps[ep_index].new_ring)
 		return -ENOMEM;
 
@@ -2291,7 +2308,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 }
 
 static struct xhci_interrupter *
-xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
+xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs,
+		       struct dma_pool *pool, gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
@@ -2308,7 +2326,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!ir)
 		return NULL;
 
-	ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
+	ir->event_ring = xhci_ring_alloc_from_pool(xhci, segs, TYPE_EVENT, 0, pool, flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2356,7 +2374,8 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num)
+				  struct dma_pool *pool, u32 imod_interval,
+				  unsigned int intr_num)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2367,7 +2386,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	    intr_num >= xhci->max_interrupters)
 		return NULL;
 
-	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
+	ir = xhci_alloc_interrupter(xhci, segs, pool, GFP_KERNEL);
 	if (!ir)
 		return NULL;
 
@@ -2498,7 +2517,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters)
 		goto fail;
 
-	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
+	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, xhci->segment_pool, flags);
 	if (!xhci->interrupters[0])
 		goto fail;
 
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index beb637407e47..1bb6e5034b58 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/usb/xhci-sideband.h>
+#include <linux/dmapool.h>
 
 #include "xhci.h"
 
@@ -67,6 +68,7 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *e
 	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
 
 	ep->sideband = NULL;
+	ep->priv_seg_pool = NULL;
 	sb->eps[ep->ep_index] = NULL;
 }
 
@@ -113,6 +115,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
  * xhci_sideband_add_endpoint - add endpoint to sideband access list
  * @sb: sideband instance for this usb device
  * @host_ep: usb host endpoint
+ * @pool: dma pool to allocate this endpoint's ring segments from, or NULL
+ *        to leave the endpoint's current pool selection untouched
  *
  * Adds an endpoint to the list of sideband accessed endpoints for this usb
  * device.
@@ -123,7 +127,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
  */
 int
 xhci_sideband_add_endpoint(struct xhci_sideband *sb,
-			   struct usb_host_endpoint *host_ep)
+			   struct usb_host_endpoint *host_ep,
+			   struct dma_pool *pool)
 {
 	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
@@ -153,6 +158,9 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 	ep->sideband = sb;
 	sb->eps[ep_index] = ep;
 
+	if (pool)
+		ep->priv_seg_pool = pool;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_add_endpoint);
@@ -288,6 +296,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
  * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
  * @sb: sideband instance for this usb device
  * @num_seg: number of event ring segments to allocate
+ * @pool: dma pool to allocate the interrupter's event ring segments from
  * @ip_autoclear: IP autoclearing support such as MSI implemented
  *
  * Sets up a xhci interrupter that can be used for this sideband accessed usb
@@ -301,7 +310,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
  */
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear, u32 imod_interval, int intr_num)
+				 struct dma_pool *pool, bool ip_autoclear,
+				 u32 imod_interval, int intr_num)
 {
 	if (!sb || !sb->xhci)
 		return -ENODEV;
@@ -315,8 +325,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		return -EBUSY;
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg, imod_interval,
-						   intr_num);
+						   num_seg, pool,
+						   imod_interval, intr_num);
 	if (!sb->ir)
 		return -ENOMEM;
 
@@ -370,6 +380,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
 /**
  * xhci_sideband_register - register a sideband for a usb device
  * @intf: usb interface associated with the sideband device
+ * @type: xHCI sideband type
+ * @notify_client: callback for xHCI sideband sequences
  *
  * Allows for clients to utilize XHCI interrupters and fetch transfer and event
  * ring parameters for executing data transfers.
@@ -436,6 +448,15 @@ EXPORT_SYMBOL_GPL(xhci_sideband_register);
  * After this the endpoint and interrupter event buffers should no longer
  * be accessed via sideband. The xhci driver can now take over handling
  * the buffers.
+ * Any transfer ring allocated from a client supplied dma pool is freed here
+ * as well, as the client is not expected to keep that pool alive any longer
+ * than this call. This includes rings of endpoints already removed with
+ * xhci_sideband_remove_endpoint(), which xhci would otherwise only free once
+ * the device is reconfigured or torn down, i.e. after the client is gone.
+ *
+ * The caller must ensure the usb device is no longer streaming through the
+ * normal, non-sideband path when calling this, as the freed rings are still
+ * referenced by the endpoint contexts until xhci reconfigures the device.
  */
 void
 xhci_sideband_unregister(struct xhci_sideband *sb)
@@ -458,6 +479,17 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
 			if (sb->eps[i])
 				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
 
+		spin_lock_irq(&xhci->lock);
+		for (i = 0; i < EP_CTX_PER_DEV; i++) {
+			struct xhci_ring *ring = vdev->eps[i].ring;
+
+			if (ring && ring->segment_pool != xhci->segment_pool) {
+				xhci_ring_free(xhci, ring);
+				vdev->eps[i].ring = NULL;
+			}
+		}
+		spin_unlock_irq(&xhci->lock);
+
 		__xhci_sideband_remove_interrupter(sb);
 
 		sb->vdev = NULL;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..1353d6fa2776 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -19,6 +19,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
+#include <linux/usb/xhci-sideband.h>
 
 /* Code sharing between pci-quirks and xhci hcd */
 #include	"xhci-ext-caps.h"
@@ -709,6 +710,8 @@ struct xhci_virt_ep {
 	bool			use_extended_tbc;
 	/* set if this endpoint is controlled via sideband access*/
 	struct xhci_sideband	*sideband;
+	/* dma pool to allocate this endpoint's ring segments from, if set */
+	struct dma_pool		*priv_seg_pool;
 };
 
 enum xhci_overhead_type {
@@ -738,8 +741,6 @@ struct xhci_interval_bw_table {
 	unsigned int		ss_bw_out;
 };
 
-#define EP_CTX_PER_DEV		31
-
 struct xhci_virt_device {
 	int				slot_id;
 	struct usb_device		*udev;
@@ -1253,14 +1254,11 @@ static inline const char *xhci_trb_type_string(u8 type)
 #define NEC_FW_MAJOR(p)		(((p) >> 8) & 0xff)
 
 /*
- * TRBS_PER_SEGMENT must be a multiple of 4,
- * since the command ring is 64-byte aligned.
- * It must also be greater than 16.
+ * TRBS_PER_SEGMENT and TRB_SEGMENT_SIZE are defined in
+ * <linux/usb/xhci-sideband.h>, shared with sideband client drivers.
  */
-#define TRBS_PER_SEGMENT	256
 /* Allow two commands + a link TRB, along with any reserved command TRBs */
 #define MAX_RSVD_CMD_TRBS	(TRBS_PER_SEGMENT - 3)
-#define TRB_SEGMENT_SIZE	(TRBS_PER_SEGMENT*16)
 #define TRB_SEGMENT_SHIFT	(ilog2(TRB_SEGMENT_SIZE))
 /* TRB buffer pointers can't cross 64KB boundaries */
 #define TRB_MAX_BUFF_SHIFT		16
@@ -1380,6 +1378,7 @@ struct xhci_ring {
 	enum xhci_ring_type	type;
 	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
+	struct dma_pool	*segment_pool;
 };
 
 struct xhci_erst_entry {
@@ -1865,7 +1864,8 @@ void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num);
+				  struct dma_pool *pool, u32 imod_interval,
+				  unsigned int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 005257085dcb..6d318e6a3bf6 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -13,7 +13,19 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
-#define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
+/*
+ * Constants shared with the xHCI host driver (drivers/usb/host/xhci.h),
+ * which includes this header for its canonical definitions.
+ */
+#define EP_CTX_PER_DEV      31
+
+/*
+ * TRBS_PER_SEGMENT must be a multiple of 4,
+ * since the command ring is 64-byte aligned.
+ * It must also be greater than 16.
+ */
+#define TRBS_PER_SEGMENT    256
+#define TRB_SEGMENT_SIZE    (TRBS_PER_SEGMENT * 16)
 
 struct xhci_sideband;
 
@@ -72,7 +84,8 @@ void
 xhci_sideband_unregister(struct xhci_sideband *sb);
 int
 xhci_sideband_add_endpoint(struct xhci_sideband *sb,
-			   struct usb_host_endpoint *host_ep);
+			   struct usb_host_endpoint *host_ep,
+			   struct dma_pool *pool);
 int
 xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
 			      struct usb_host_endpoint *host_ep);
@@ -94,7 +107,8 @@ static inline bool xhci_sideband_check(struct usb_hcd *hcd)
 
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear, u32 imod_interval, int intr_num);
+				 struct dma_pool *pool, bool ip_autoclear,
+				 u32 imod_interval, int intr_num);
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
 int
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..1b8877b8ee62 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -7,6 +7,7 @@
 #include <linux/ctype.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-map-ops.h>
+#include <linux/dmapool.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
@@ -1786,6 +1787,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	struct usb_interface_descriptor *altsd;
 	struct usb_host_interface *alts;
 	struct snd_soc_usb_device *sdev;
+	struct dma_pool *segment_pool;
 	struct xhci_sideband *sb;
 
 	/*
@@ -1804,10 +1806,19 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		if (!sdev)
 			return;
 
-		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
+		segment_pool = dma_pool_create("xHCI sideband ring segments",
+						interface_to_usbdev(intf)->bus->sysdev,
+						TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
+						TRB_SEGMENT_SIZE);
+		if (!segment_pool)
+			goto free_sdev;
+
+		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool,
 					    uaudio_sideband_notifier);
-		if (!sb)
+		if (!sb) {
+			dma_pool_destroy(segment_pool);
 			goto free_sdev;
+		}
 	} else {
 		sb = uadev[chip->card->number].sb;
 		sdev = uadev[chip->card->number].sdev;
@@ -1844,7 +1855,9 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	return;
 
 unreg_xhci:
+	segment_pool = sb->segment_pool;
 	xhci_sideband_unregister(sb);
+	dma_pool_destroy(segment_pool);
 	uadev[chip->card->number].sb = NULL;
 free_sdev:
 	kfree(sdev);
@@ -1905,8 +1918,12 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
 	 * This is to accommodate for devices w/ multiple UAC functions.
 	 */
 	if (chip->num_interfaces == 1) {
+		struct dma_pool *segment_pool = dev->sb->segment_pool;
+
 		snd_soc_usb_disconnect(uaudio_qdev->auxdev->dev.parent, dev->sdev);
 		xhci_sideband_unregister(dev->sb);
+		dma_pool_destroy(segment_pool);
+		dev->sb = NULL;
 		dev->chip = NULL;
 		kfree(dev->sdev->ppcm_idx);
 		kfree(dev->sdev);

-- 
2.34.1

