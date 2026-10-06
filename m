Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F03DD84C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791307383; cv=none; b=oe0Htj9x2Qjarbmty7zmhfZ95Oebcqkv/N0vIwoJ3IPDyJ42eezI/VJ8V4r8BycXvhD16lqTLzTWRhWcWTgIBmjizcrxyzZyFXNkEJ7iuMWbiBu/oiRQ6ahdok1BhBhpbZB3vT+rdCtG+kPxtGwfNe/bE2s1dGtmlCq0bszCn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791307383; c=relaxed/simple;
	bh=wu6fdnjbK9k7Pi0YENtdvnMtzrIT712VDbV+fC/IWRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=beb6/viQGqofILDXiLt0DeAkdMDJ0uIUiTirwjSd3zgCx6me19V5SvdogpDI5igFp5qWrheBOya8xUaipQ9V6tehI7HxRIiAs5hYQ+sCYv8g5+dA+ub5wlu3JQOuLD35AKM2OPReG06l+Grj5dyzBQM/K+/rSW2ErJcCWKYtYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJ2cj31b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kI9TAYX0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJ2cj31b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kI9TAYX0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696HCZcK2470210
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 17:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n9VnUuNRyTG
	HYfH/xsFiU180Yv9tzt71MWo6T9NkaZE=; b=XJ2cj31bkZHCZop/Pfrht/u8F9H
	v3yxCF2i4Js4O7qteoxzgc2wI0GQdBb8gKUjeHoawAu3zDKXfW5498h74pAbxvzh
	d4CuppTvP8W0y0IkQvNLcesA5r/OFAc+Krd8nf+mdvD3uFzxJxHXaw+Ox3VGa3PV
	VYcW1Q1cQV7+nQdiC1cVUpl++BvTrGx2cXhNBb8/zWHSEjgYMWavbd80GSLsIk42
	glX9FU9mADt1G2nl7XG7VB7fXfXgpC8k3djaj/aU9OVqga65MNoBEc3fPM9tU09G
	wqXxOBHzxMoCg2XeXx+MHxxAmwLemUYLvekBrx9llLSUm5noKZLm3IVXGIw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc51vb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 17:23:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e594a90232so32142135ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791307380; x=1791912180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9VnUuNRyTGHYfH/xsFiU180Yv9tzt71MWo6T9NkaZE=;
        b=kI9TAYX0PIjWzaUXKHAZI9N7Lub/AHrK+5nFtSYgsmMqzCAlLzB0TWOFBfAcYuuRXZ
         9nbE3mFsXGlg33DIS6R+NEoS31Q7FKs1cP7wsxqUCOgC7YMCFVn1G/3zZn4f4ItdRmlC
         TUvw7G71LKdPOTZZDs4rbklNlzM/jx+cryty2TN7u3+A0jkKIEYbtbjIbBc1EkcSId1L
         WNC1iCLPkrkawnzFT8ef2nOgfWM+hd61AStAZ5yVh7Wa7rnBHXrbBY026TzdJUq0FX/i
         c77uKIJ1KIh+NeAERVmP/xn87z/hgHRHZi4o7Kb8nfqlcu3Rtv7QMl6+iZphAfYHrRb1
         LNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791307380; x=1791912180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9VnUuNRyTGHYfH/xsFiU180Yv9tzt71MWo6T9NkaZE=;
        b=N1NEV6o57dFeIGGWm1TWLH9GSY/sRaDCk9qxUYxTA6R1qAVseXNE0pT/LIN3fh/dcj
         VgLIKUPmgTRtJYXNnL9AMg+vj32x/PYMVybWV/moo69pHOAankpuJQr2FnHmOVw0QGmD
         QBehtJExI8+s+1rgmoiZjd10jRJr2nI69bOCsiB1NhlX+HVUy5IauxRP4jrAkg2A2GYG
         sazYc1O03nlstEWZpAc8n3jz4HFcZta6QiMMXSLgDOIdBpFmdI7mwqkHTFGz1TPTOpj4
         zwaMT5+FC2fJn+l/KHm8GdB3ovhHnySk5CzbgIamJhe8Q1OKza4zw/sFzYZIkMBVgM+K
         5vVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq9/7R2/9ztda+8EAS98jJbWPWOjJaYkS2HinAsSaEqWRc8PSQDb6kpRA04DoGxcfP/R91u1eHIJo0Zzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYItynMKYCpD5XLj1GOQ4IfZSokRHMXi5C+DewhxONqoubHfP3km
	uvGxiz12mPxEvf5Y9/GyrZtN9d8ygj9Xkp55UnO9QsOL0tR/8XYnZPuxdzxIfkZ/MPoELItRxKa
	c31O/W3fFDoa3H+yf57RrvvCiGXMSPCKw6gLNRSPd4Ea9+w77Q/KojMuFicawR86qSqs=
X-Gm-Gg: AYBFou0LXrGcXJ84rGfD9QTgNq6lqRVWZYdDIFjdlmRmGaRq3l+++B9r8YuoFgK6dVQ
	8mgo/PPNQ5XNdcmM2E3SLG0DPOF706qpokq5FQai2ZmUL4CSdw64ALK4EzW98UR5d32rvTJsEIc
	usG/OaWWBlTecdaLhS+TrkyYySfflay15KOnYQ455NyHGqUywLdLiAgoOzpoe/FMtdJv1SLBH2u
	p2r/HGWZsaZpHQMNqnb7q/eoUkSNwF9CFPcUMFJ8z8VVDaDNYRoPYPVa3C/uOVjaWXXLVM4caLJ
	FB/nbL5XfYEkLWw+SdTqY6CxHcXCNhBo5rsOHNSkWI6As5rUtJiIWGPPPyeS0tob4ndGbYfy9Ja
	pxZ6S0lytxqMTkpFxyJJCExdZbfyAKJEm
X-Received: by 2002:a17:903:19c3:b0:2dd:ad74:ac7f with SMTP id d9443c01a7336-2e6003c02fdmr911165ad.26.1791307379667;
        Tue, 06 Oct 2026 10:22:59 -0700 (PDT)
X-Received: by 2002:a17:903:19c3:b0:2dd:ad74:ac7f with SMTP id d9443c01a7336-2e6003c02fdmr910895ad.26.1791307379090;
        Tue, 06 Oct 2026 10:22:59 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5ff5dcc90sm1114485ad.23.2026.10.06.10.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:22:58 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, faisal.hassan@oss.qualcomm.com
Subject: [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed the TRB cache
Date: Tue,  6 Oct 2026 22:52:54 +0530
Message-Id: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
References: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac52e74 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3n27Y_Pxg6K5dMmys6IA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA2OSBTYWx0ZWRfX45PBHaCTk3WY
 2BUrxdmJlk5SUw4k+0lZlVjhLac3DMo5fpVXHJ+3I7P1ILqB9Dj8P/X7YD+fWgJtgMnUIdD1wuy
 N8eeur46ODCaaHan/MmFx/vAh9VTVLg=
X-Proofpoint-GUID: 5AJfTOdbl86MPTJgbb-iPgrIP472upAi
X-Proofpoint-ORIG-GUID: 5AJfTOdbl86MPTJgbb-iPgrIP472upAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA2OSBTYWx0ZWRfXx/Xf3ZfjCbl4
 Voz2z+8QKBLDorAvQeNudR1V8UdBFVnSyKs208+4lGNwJkA05iirkn71T9LGsxUf9HkrZOCbL7r
 7Tvx5QdYmvYywpqrpW4ufUIT/3aAHFlTs0/97dSat2v7M/gAlWmN4qJOJkpVCLf5o9ocpv8wIQu
 J55voehKFZXHn0NVIMzaKpR5eYvw7o+JHjU/DrkfYqLIcJFJg5Xlf2WWfjWr7P13lXlDrMEn7p/
 SD7L1D1y3Xe4fj8Qz7hKEALyn7NqVu+yZkV73zMG+ISBENQrZQcDoItgtzzasH5HF05/ERxmXmd
 JNsEuOFRggXllokZsKJFrKHxuIh9J3DmaHO930L/A/NMuMcuYjssMrb/TEmSUsXQbAKlxm9GcvI
 Q0tQHX9s9BTsorIwJUZff9RpQa6TCK9V5APw089Y9narqetmbXfJXvu93qATRzZZi0P6FOvTkvj
 MsSnVDasM3kMfLzVKhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060069

The controller prefetches the TRBs of a transfer into an internal cache
that holds DWC_USB3_CACHE_TRBS_PER_TRANSFER entries. Databook 4.2.3.3
requires that the number of chained TRBs needed to construct a single
packet never exceeds (DWC_USB3_CACHE_TRBS_PER_TRANSFER - 1), where the
-1 accounts for the one Link TRB that may be part of the chain when a
transfer wraps the TRB ring. The cache never holds more than 15 TRBs
however the core was configured, so the usable budget is
min(GHWPARAMS4[5:0] - 1, 15) data TRBs per packet.

Each scatter-gather entry of a request is queued as one TRB, so a gadget
function driver that hands down an IN request whose entries are smaller
than MaxPacketSize can exceed that budget with no way of knowing it. On
a SuperSpeed bulk IN endpoint, a 1024-byte request scattered across 16
pages of 64 bytes needs 16 chained TRBs for its single packet, one more
than the controller can cache: the controller never assembles the
packet, the endpoint keeps responding NRDY and the request never
completes. The same request runs fine at High-Speed, where the 512-byte
MaxPacketSize splits it into two packets of 8 TRBs each.

Walk the scatter-gather list of IN requests when they are queued,
counting the TRBs each packet would be built from, and copy the request
into a single contiguous buffer when a packet would exceed the budget.
Doing it at queue time lets a failed allocation or a scatter-gather list
shorter than the request length be returned to the function driver from
usb_ep_queue(), instead of leaving a request on the pending list that can
never be started. The original usb_request fields are restored on
completion, so function drivers stay independent of the controller
limitation.

The host side already applies the equivalent workaround unconditionally
for every dwc3 instance through XHCI_SG_TRB_CACHE_SIZE_QUIRK. A request
that trips this check cannot be transferred at all, so applying the
workaround unconditionally can only turn a stalled endpoint into one
extra copy. That copy is a GFP_ATOMIC allocation of the request length,
which reaches order-4 for a 64 KiB request, but it is only reached by
requests that would otherwise never complete.

Fixes: eeb720fb21d6 ("usb: dwc3: gadget: add support for SG lists")
Cc: stable@vger.kernel.org
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
Changes in v2:
- Linearize at queue time in __dwc3_gadget_ep_queue() rather than in
  dwc3_prepare_trbs(), so an allocation failure or a scatter-gather list
  shorter than the request length is returned from usb_ep_queue()
  instead of leaving the request stuck on the pending list.
- Unmap a linearized request on giveback even if it never got a TRB,
  so the bounce buffer is not freed while still DMA-mapped.
- Add __GFP_NOWARN to the bounce buffer allocation, the failure is
  reported to the caller.
- Link to v1: https://lore.kernel.org/all/20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com/

 drivers/usb/dwc3/core.h   |  15 +++++
 drivers/usb/dwc3/gadget.c | 133 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..af71abaac8ed 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -386,6 +386,7 @@
 #define DWC3_GHWPARAMS3_FSPHY_IFC_ENA		1
 
 /* Global HWPARAMS4 Register */
+#define DWC3_GHWPARAMS4_CACHE_TRBS_PER_TRANSFER(n)	((n) & GENMASK(5, 0))
 #define DWC3_GHWPARAMS4_HIBER_SCRATCHBUFS(n)	(((n) & (0x0f << 13)) >> 13)
 #define DWC3_MAX_HIBER_SCRATCHBUFS		15
 
@@ -714,6 +715,7 @@ struct dwc3_event_buffer {
 #define DWC3_EP_DIRECTION_RX	false
 
 #define DWC3_TRB_NUM		256
+#define DWC3_TRB_CACHE_MAX	15
 
 /**
  * struct dwc3_ep - device side endpoint representation
@@ -951,8 +953,15 @@ struct dwc3_hwparams {
  * @trb: pointer to struct dwc3_trb
  * @trb_dma: DMA address of @trb
  * @num_trbs: number of TRBs used by this request
+ * @sg_trb_cache_buf: temporary linear buffer the scatter-gather list is
+ *			copied into when it exceeds the TRB cache budget
+ * @sg_trb_cache_sg: scatter-gather list replaced by @sg_trb_cache_buf
+ * @sg_trb_cache_num_sgs: number of entries in @sg_trb_cache_sg
+ * @sg_trb_cache_orig_buf: request buffer replaced by @sg_trb_cache_buf
  * @direction: IN or OUT direction flag
  * @mapped: true when request has been dma-mapped
+ * @sg_trb_cache_bounced: true while this request is queued through
+ *			@sg_trb_cache_buf instead of its scatter-gather list
  */
 struct dwc3_request {
 	struct usb_request	request;
@@ -978,8 +987,14 @@ struct dwc3_request {
 
 	unsigned int		num_trbs;
 
+	void			*sg_trb_cache_buf;
+	struct scatterlist	*sg_trb_cache_sg;
+	unsigned int		sg_trb_cache_num_sgs;
+	void			*sg_trb_cache_orig_buf;
+
 	unsigned int		direction:1;
 	unsigned int		mapped:1;
+	unsigned int		sg_trb_cache_bounced:1;
 };
 
 /*
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f245e66cd13d..7417d3c32dbf 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -190,6 +190,22 @@ static void dwc3_ep_inc_deq(struct dwc3_ep *dep)
 	dwc3_ep_inc_trb(&dep->trb_dequeue);
 }
 
+static void dwc3_gadget_restore_sg_trb_cache_buf(struct dwc3_request *req)
+{
+	if (!req->sg_trb_cache_bounced)
+		return;
+
+	req->request.buf = req->sg_trb_cache_orig_buf;
+	req->request.sg = req->sg_trb_cache_sg;
+	req->request.num_sgs = req->sg_trb_cache_num_sgs;
+	kfree(req->sg_trb_cache_buf);
+	req->sg_trb_cache_buf = NULL;
+	req->sg_trb_cache_sg = NULL;
+	req->sg_trb_cache_num_sgs = 0;
+	req->sg_trb_cache_orig_buf = NULL;
+	req->sg_trb_cache_bounced = false;
+}
+
 static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 		struct dwc3_request *req, int status)
 {
@@ -202,10 +218,16 @@ static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 	if (req->request.status == -EINPROGRESS)
 		req->request.status = status;
 
-	if (req->trb)
+	/*
+	 * A linearized request may have been mapped without getting a TRB, so
+	 * unmap it before its buffer is freed.
+	 */
+	if (req->trb || req->sg_trb_cache_bounced)
 		usb_gadget_unmap_request_by_dev(dwc->sysdev,
 				&req->request, req->direction);
 
+	dwc3_gadget_restore_sg_trb_cache_buf(req);
+
 	req->trb = NULL;
 	trace_dwc3_gadget_giveback(req);
 
@@ -1474,6 +1496,110 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	return num_trbs;
 }
 
+/*
+ * Each scatter-gather entry is queued as one TRB, so an IN request backed by
+ * entries smaller than MaxPacketSize can need more chained TRBs to construct a
+ * single packet than the controller is able to cache. Databook 4.2.3.3 limits
+ * the chained TRBs a single packet may be built from to
+ * (DWC_USB3_CACHE_TRBS_PER_TRANSFER - 1), where the -1 accounts for the single
+ * Link TRB the controller walks as part of the chain when a transfer wraps the
+ * TRB ring. The cache itself never holds more than DWC3_TRB_CACHE_MAX TRBs, so
+ * clamp the limit for cores built with a larger parameter.
+ *
+ * Walk the scatter-gather list counting the TRBs each packet would be built
+ * from, and report the requests that exceed that budget.
+ */
+static bool dwc3_gadget_sg_trb_cache_limit(struct dwc3_ep *dep,
+		struct dwc3_request *req)
+{
+	struct dwc3 *dwc = dep->dwc;
+	struct scatterlist *sg;
+	unsigned int cache_depth;
+	unsigned int max_trbs;
+	unsigned int maxp;
+	unsigned int fill = 0;
+	unsigned int trbs = 0;
+	int i;
+
+	if (!req->direction || !req->request.num_sgs)
+		return false;
+
+	if (req->request.sg_was_mapped || req->request.length == 0)
+		return false;
+
+	cache_depth = DWC3_GHWPARAMS4_CACHE_TRBS_PER_TRANSFER(dwc->hwparams.hwparams4);
+	if (cache_depth < 2)
+		return false;
+
+	max_trbs = min_t(unsigned int, cache_depth - 1, DWC3_TRB_CACHE_MAX);
+
+	/*
+	 * A list no longer than the budget cannot exceed it, whatever the
+	 * individual entry sizes are.
+	 */
+	if (req->request.num_sgs <= max_trbs)
+		return false;
+
+	maxp = usb_endpoint_maxp(dep->endpoint.desc);
+
+	for_each_sg(req->request.sg, sg, req->request.num_sgs, i) {
+		unsigned int len = sg->length;
+
+		trbs++;
+
+		while (fill + len >= maxp) {
+			len -= maxp - fill;
+			if (trbs > max_trbs)
+				return true;
+
+			fill = 0;
+			trbs = len ? 1 : 0;
+		}
+
+		fill += len;
+	}
+
+	/* The transfer may end with a short packet. */
+	return fill && trbs > max_trbs;
+}
+
+static int dwc3_gadget_linearize_sg_request(struct dwc3_ep *dep,
+		struct dwc3_request *req)
+{
+	void *buf;
+	size_t copied;
+
+	if (!dwc3_gadget_sg_trb_cache_limit(dep, req))
+		return 0;
+
+	buf = kmalloc(req->request.length, GFP_ATOMIC | __GFP_NOWARN);
+	if (!buf)
+		return -ENOMEM;
+
+	copied = sg_pcopy_to_buffer(req->request.sg, req->request.num_sgs,
+			buf, req->request.length, 0);
+	if (copied != req->request.length) {
+		kfree(buf);
+		return -EINVAL;
+	}
+
+	dev_dbg(dep->dwc->dev,
+		"%s: linearize SG request len=%u num_sgs=%u exceeding TRB cache\n",
+		dep->name, req->request.length, req->request.num_sgs);
+
+	req->sg_trb_cache_buf = buf;
+	req->sg_trb_cache_sg = req->request.sg;
+	req->sg_trb_cache_num_sgs = req->request.num_sgs;
+	req->sg_trb_cache_orig_buf = req->request.buf;
+	req->sg_trb_cache_bounced = true;
+
+	req->request.buf = buf;
+	req->request.sg = NULL;
+	req->request.num_sgs = 0;
+
+	return 0;
+}
+
 static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
@@ -1985,6 +2111,7 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 {
 	struct dwc3		*dwc = dep->dwc;
+	int			ret;
 
 	if (!dep->endpoint.desc || !dwc->pullups_connected || !dwc->connected) {
 		dev_dbg(dwc->dev, "%s: can't queue to disabled endpoint\n",
@@ -2001,6 +2128,10 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 				dep->name, &req->request))
 		return -EINVAL;
 
+	ret = dwc3_gadget_linearize_sg_request(dep, req);
+	if (ret)
+		return ret;
+
 	pm_runtime_get(dwc->dev);
 
 	req->request.actual	= 0;

base-commit: 639df5d23876a548b86fe6526bed8b97edf64d96
-- 
2.34.1

