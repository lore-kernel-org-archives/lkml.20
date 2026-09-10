Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A0369D43
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005070; cv=none; b=JPOoEYbD1tFEmBEalVuuwU/lTlmW64GH6PjJ5s2TL3gITfxPC/Gugzyz1HoNWFVDf0iOOwwTwg/WPC3KvY19SZiuzkRl1/LJEgjyjDYUvFJkulHaOCi7zOnh8OprmU/D+kNTHdVlEbYs9OJ4Ji1bYhfaMylRi2hMlorSlYLSaX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005070; c=relaxed/simple;
	bh=YezSN2ajFgZ5BhO6JiinsBMA1oRGhgbu29Z0ApFTkJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qo62nJ3AkxW7bW4/ImpXN50fr8AGrfrHVRuo3uEgGGHz1NEiO9BUtRpUz7UdixTHZird5hZ32z2hMpTJ8DD0Nfw1ylx4hXUEe2CjrNYPYUFzYnLZcwQ7tNZPjx7NYp6ES/XkiE12GIezHgERiVrJbMG+lZPgv0zGjjU/tk3LRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHdBkrRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrjTizf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHdBkrRL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrjTizf8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lBjV3730003
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJT8o863eEHoJK98pu1Vs+VG+YrADer7sNUuCodL15M=; b=lHdBkrRLDdqSrI2R
	M4Xf36muJ0oNcSAz/2TRFVS/LJZWdPqa4maZ/10CiyrF6/gXSLrKLETvwai0uwMt
	kUjF5roCax8kJTj5vzdu3pp6+2OirSLhXwi6IgqhvmfatBrKjs/0A3Dvd561U0ZR
	YovF/Z9+N8qt55tZOze7XdagEWJ5pGr3eJ3BPn0ZnGArnLnUSfvpzx3sGsn9LSIV
	ktElPn5xQauSzITCqrQuHav3AMkPj9XJdFmp695ArHwIuauGMu6l0PcoZ2xU7vTl
	/P2wlGUFKUKyoDVOB9A9/tE2rAFL01tnYU+Y8GWju2A64GEeUxVcmJ3kYK5ZHcg6
	67PwEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygsh81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so79306345ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005067; x=1789609867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJT8o863eEHoJK98pu1Vs+VG+YrADer7sNUuCodL15M=;
        b=VrjTizf8j23TsvXENNpsM+vBoWjMLTHD0tEOsl4K3b7xOLiQ2H540xKTTtVBOf4ylH
         IAMraMTxNkEz1rhK6nesfkfbcmyLiB8YCdds/KTmP+PcbidwfWtCnGSn8J5eQ0c0oP20
         ULeJ0z19PANPR90bLJ2acC546CN2f3ZapmzLqlpda/9GQK2P7xjfDDBsuwtqtSHvG0vu
         4gaK2jdtFK3wZgZ6GvRK7mQgX67VRY6BbBYDZPNjgr0xcwjow6m5REIzZ03TcrFDY2QB
         kjzqaP9Vep+bUc+UcP1y7ilBa7rvXam8VfsVeiKx5HoNX/bzAHwFoH0tNHfoRdRl6TqW
         7F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005067; x=1789609867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJT8o863eEHoJK98pu1Vs+VG+YrADer7sNUuCodL15M=;
        b=hTXzylhDHrShxNPolervBD2Oeol5bUUku80xZ/5sl6v047loSBmOiVjpM4j2tYAg95
         8o4eQjN9Z/OUUV5NHwTlw8xwmIEI2ywa0GFWMFtKdBw1mU3144nkXselKK9+5/ms+Zku
         AHByKOzPTnQleiu9g+YntU3z1gZCu42JSs1/tavYVnpdHpd9FkRJqh+hlbs+jQrrKwAQ
         aclGat8hduF3rbnWJX0wwi4NU7VOD23DK6BXX5eduyiE4j9Ma6Lrf3gXJpZdFLIpOx9x
         VG52x/+7vAIG1KBBAYpkgCvy9o6mnwweqVcc3lBC6lxTQtxaVWxVDlzVcjT5Ofm3F1S3
         CsbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDp4grHrdgvvzvwrKhrhI/Nxa6e1aIi7Z8Epm5u5NsJSVD3kdTdngthoSNSf5gAYnAbcEUFGCKvb1mfqw=@vger.kernel.org
X-Gm-Message-State: AFuF++nHKK4/deozbtvJgZiEKIoimXH0BSr+QoGvbGskfwydmUyqC1+B
	EEDupcEtpXEXDM2PR3tb4/k7tOO1kTROOPQ7jUV/+EEOEnNk8LWl3/ML02u7TaGi5BFNiNQm6pO
	QKLuD6qBfNOKt9Deg003+uyaYJDQoVeZZczPDN9CI0Q3fPt7MIOt8meEYiqGk5fMoT68=
X-Gm-Gg: AYBFou0rndIjWOzf5rwzbmj1yvxuuyAyj5WPSIwW/QHWWnBYkl/rQqNe5wCFa01Al40
	LcbOQWXTGGEoECWq0s3cNfkmmWlMGHGsmXU2glz0fFNBvn5c/9fcBe2GTCsue6Y1y4SgLXRFcjc
	7M9SQ+8Dk6RPGowWlaO5WLPXHm5KkyD7kzal4ViFG1a/Ci6q22lcCWQ3tlrSgJY0l49bIANydey
	U+3YIsDlhKyr5yIlBoaYLzK2uAnGzZz2PYRaMh6C+vw0ecqirDemIU6E3xBoPDqExUsq1cmQX+B
	fgRSCEg89+oZZ12jUArtHURptiCIOxKGWDDzy7TkooKACvuxqrJbdbGilEXJtvJnBATfxE9/coU
	etmr/Wa1ddT4kcmAv8f3bMm+yknlegF9dX4L6v0FQzQpi1rcUelbd
X-Received: by 2002:a17:902:cf10:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2db126669d3mr560843355ad.15.1789005067297;
        Wed, 09 Sep 2026 18:51:07 -0700 (PDT)
X-Received: by 2002:a17:902:cf10:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2db126669d3mr560842685ad.15.1789005066790;
        Wed, 09 Sep 2026 18:51:06 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:05 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 18:50:58 -0700
Subject: [PATCH v4 2/5] usb: xhci: Allow to specify a different segment
 pool for allocations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-16k_offload_v1_b4-v4-2-f24a86617597@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX7sSM1XvMUr+i
 JyNIMuVttmSmPfBlqp+rtIArp4/ajgzzI9m0a24AyKXL3sIQEyLttCLV/Aupm6Wp1vVZB728Gwt
 K67Qhop/RW6Plxb0aXf+iyRpnLGusY3u0rDZQwIqS/G4WAQQdFuIIejiaNL1NY8vrVkxSdxzqd8
 UzYPNB7kdksRqK7Ctho1rdgY0u+ltp9kfPdSDdkCBOvRt4t9fk9fQTniOrwQodoCbHrI5xO4Nj9
 oNkCZSRa4roGfYOtmhfpriQn4S1R68IH/eX0d/ZgVroUcH183QINszLm6M8BOmXG4np28dZWTw7
 hyOi+IhDJQnwpHeIwQVV9LR+KPfaPFCPKjjd3B8U1oE12VrOiwAaF4M/GlLT1esMEYa4UMCtbiX
 tokr+Xhg4TT6v4Hkhs/imZYbelJ+vnMnw22q92P+h9gnfTGH3uecAOKE/Aao3+SX8YlywRp48CK
 tF4LqAj20+Cdp8Bfa0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX1HCWBBRgtKtJ
 LsmfDrnKLonMpbIqvZB9vyn1Dh33C6TIcSZkBLmjbuIB/oIry+fzvi8l8bCf88ykOEPUH2x5YuJ
 OLTTPxR/IuBj/b7Cx2mpRBbyCFjUMVA=
X-Proofpoint-ORIG-GUID: 8bWmvMBb094VF8FRYhleZ72B4iV11-K7
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa20d0c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qt4-_lkRHfeKUwQPRJsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8bWmvMBb094VF8FRYhleZ72B4iV11-K7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100018

Ring segments are normally allocated from a shared DMA pool sized and
aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
larger PAGE_SIZE (e.g. 16K or 64K page arches), a segment can end up
at a non-page-aligned offset within its enclosing CPU page, and
multiple segments can share the same physical page.

Modify existing xHCI allocation operations to accommodate for a separate
DMA pool for segment allocations.  This will safely partition ownership
of segments between Linux xHCI and offload entities.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-mem.c      | 63 ++++++++++++++++++++++++++--------------
 drivers/usb/host/xhci-sideband.c |  4 +--
 drivers/usb/host/xhci.h          |  6 +++-
 3 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..6e52cefd6619 100644
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
+	ir = xhci_alloc_interrupter(xhci, segs, pool ? pool : xhci->segment_pool, GFP_KERNEL);
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
index beb637407e47..274da38f333d 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -315,8 +315,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		return -EBUSY;
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg, imod_interval,
-						   intr_num);
+						   num_seg, NULL,
+						   imod_interval, intr_num);
 	if (!sb->ir)
 		return -ENOMEM;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..15ce0bb7aa3f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -709,6 +709,8 @@ struct xhci_virt_ep {
 	bool			use_extended_tbc;
 	/* set if this endpoint is controlled via sideband access*/
 	struct xhci_sideband	*sideband;
+	/* dma pool to allocate this endpoint's ring segments from, if set */
+	struct dma_pool		*priv_seg_pool;
 };
 
 enum xhci_overhead_type {
@@ -1380,6 +1382,7 @@ struct xhci_ring {
 	enum xhci_ring_type	type;
 	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
+	struct dma_pool	*segment_pool;
 };
 
 struct xhci_erst_entry {
@@ -1865,7 +1868,8 @@ void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num);
+				  struct dma_pool *pool, u32 imod_interval,
+				  unsigned int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,

-- 
2.34.1

