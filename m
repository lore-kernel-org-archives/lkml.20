Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D765E3CF211
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791083695; cv=none; b=F/c/5Jt0kD05d/AIEarczXOnloklkh/saN5/n/EVUNDTObo5bOFfKmz+SOPYYNWgmMsG1fii8xWuMpi+d8V5TnGJQemAdYrfabz+U123eWiEvBWhwjA2oP50cifLV5XZR5p+syL5A4NWOwIXsSHpo5YlndCtOT0dWYZ9P4gWK50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791083695; c=relaxed/simple;
	bh=ZxPiZjqdHHkQycRBYOBNIYTy9COETzipKlS9wkbdzXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hzTrEPLGb1JDk1BPqk1zUF65U9/KEby4jonaf6RqpV9h5b9Ypp4McUL4juVnRromscpEI5bFolY1+sM2SmrkUEWcX3UKFEtkFboWO1hzp1PpsAg5l1ZTzfSAo1zL6D6//LwWgve2NBJFMwQiZK+I5Ip4pY2vb3K/YkwYZ8wl7ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mnyuypxg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNBn0rwX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mnyuypxg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNBn0rwX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6941MxZt1628089
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 03:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3YI94vPWfYU+6qzONlX5uysQAaImOo1HXie
	EKjXLh2Y=; b=MnyuypxgtwR2ICXkqbjNsBgH96Jk4FtpLu/XnntzqbLUk5M4Rk7
	R35MaWjf6p+HDruqYrrIX5k23ZbCzL9pZh3imq6ko9vlIIk5hHtVzXBQjOdB5LtT
	3d+Zbu/QZAoBWt6uE9wmprW3cM1P3v63WofL3iPcKRJXFg5OUTjMgi5LQMikLk4B
	6tQR7+XfViI2mhEb0lbjGHVY9SSN8e42RnevQgXbB1kjMtqNZtYPRw6+aMijAB0D
	cIW19xkXZ7TczOEwF2b1ls9DcuQC5Wk+eaArIJB4sZKPkTuyz+QpXRSPaC+NFP5H
	6mrURxRyzt21Hxm23WRzmgreuiLq35XXnRw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06t9sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:14:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510a481ae9so1198206eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791083691; x=1791688491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3YI94vPWfYU+6qzONlX5uysQAaImOo1HXieEKjXLh2Y=;
        b=HNBn0rwXZ8MsMmhGbijEMw/ePLNDmZ9wr+FIXa3DTmsLucEK7wWCo6vxWDmexhMCHE
         bPbUGl+78KmaxfAUhAHmJrqREEBX6DT5/dWCPujX4eSoTLc+by7jhDw919IF12RdC+ZW
         tO9DkQfdiRQCHQVYgnNgTAGWKKwuWu5B77oI2xrUxhXvzHImXNqS9Fvmwbo64g21iP1o
         CE0lEI9JRFiRtvRZQVKcgo64EdSCOQrRq5VblG07JCqf2mOLrenKAwkUpKCQA8UL5sWQ
         V6s1CMDBKJZk7t/JdsE/6lslS4/Vv1ovg1Lr/46Uf7T2JRCOX9iGh5MiF2k1ZbCcjrGN
         nR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791083691; x=1791688491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YI94vPWfYU+6qzONlX5uysQAaImOo1HXieEKjXLh2Y=;
        b=yH0d6VhQEnFW7idbSlUBKlvPjP4CcktnxM54WR4rKj1HlLUx/XfQGjVzkLS93z6/qP
         XFytV+SHsYx8KedW0Q9g7tgNkfK2EZxzJS28dH1K1FgLJFjLh3QGR+7zoQTDQVN0DlT4
         CqoOvFcIKVpxMe6I0JYKZ1wv5KLvKU6g5rtMlDo/TPfjfVjV8fnBgiUrhZhXCtU6+VJd
         AluZ2Y5cD7MLQpwtRc+o/UL0O62o2xccC5pH6VQ455GMfcFCtk6vbIrqZjMpdoMujEOg
         99+KxEWdoU5+khzopGF8SIFfq9XyDEvHMoc/y2WEnPSSK5vbZFpmrGl3Hdmc4cKYd2UV
         Bxvw==
X-Forwarded-Encrypted: i=1; AKwUvBxerlIO8MyMTES/Zz5VbsWxrDtgp+n5NUyYrz7mG1vZBviaRnpyETpp/DJAM5TMFo1ABkT7ucL7Bek3+XU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsUIOBAmMy3lTI4+89+kCXvZaSCvyEIyJvqmSVdkSdX/X/4Uoi
	9J0KbHSAK/jwpoVshzhO9SPolEv6mY4+UfNW0wruFwhnO8bmZZZxNPzC+VmRL+d/70o34wHCvpa
	XmPFq0hQPVaUOVnlDWln4GeGsN3yryXk/uN1mAeeTwqkcRdcuppX8KP/NOYZq2LxlCII=
X-Gm-Gg: AYBFou114WhgjL5Rq5/plow2ksirAr858DSuQmXsTbj+VonYwxI8Gt7rT3E5sGB/8b8
	K07MC3ZYInxAvtcAQ+ZtLbw/iR6NXohQ17Hj6CcrDoYvSbpYsln/RYVkjiRVTjDYYsx99t3iLHp
	QYH62QwhNCdVEGQ0q9Na/f71AWo8m1DMlZJVUOUMrzaUWF5Igcy8az/+tG2UZj/Q2ZNNYD+QATL
	OrCBLuWmmJjsB3bP9AGYF9V/O0v6yj07qfgRd2Gz+ZFBX3jwhkGqQj8wkFil/KoN5HPVacvUx7N
	NnSaW2L3gBp9OA0+tqnEM7rrQmQGLNSFZL9LsXT8zjZd+tf8n+Qk14XPrJD/YQbwJ9j4O+BUowX
	+wvPOR9ApbBFMdtp2xEHS/pU2TSq0e3E=
X-Received: by 2002:a05:7301:c017:b0:34d:2c1a:9881 with SMTP id 5a478bee46e88-34f21977973mr8407029eec.36.1791083691128;
        Sat, 03 Oct 2026 20:14:51 -0700 (PDT)
X-Received: by 2002:a05:7301:c017:b0:34d:2c1a:9881 with SMTP id 5a478bee46e88-34f21977973mr8407000eec.36.1791083690363;
        Sat, 03 Oct 2026 20:14:50 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127136c44sm1049634eec.9.2026.10.03.20.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 20:14:49 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, faisal.hassan@oss.qualcomm.com
Subject: [PATCH] usb: dwc3: gadget: linearize SG requests that exceed the TRB cache
Date: Sun,  4 Oct 2026 08:44:45 +0530
Message-Id: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac1c4ac cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5kJKJXIRvc014F3nmKsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: aN3zdPjyvdYT_JbBrQ86enQiMAFm1km9
X-Proofpoint-GUID: aN3zdPjyvdYT_JbBrQ86enQiMAFm1km9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDAxMiBTYWx0ZWRfX/dwES+OsSILl
 hpaNFB9PWORTTeL7tlF7OkrnhQ7vty129fa7NZ7/UQ23vMnfhAiQ9ymuGrdau8zmhJQpT/JqEpg
 u3Qea0pdq7ITkSPIRaq7Aj9NbIRokTjpCc8YGQngPHOtODKnM4u27Pkc/hQppjuHCuE5IlXQuJr
 l6WmY3hMC4FvMf5jkYzlmKUfEdAhZN2t27qlO8nq9HYHEe9+oNeLF58tAla3fq2AFaWCdeP5RCL
 HhIPTlMkq8MRp0UJzdI4pwOubaZ02+RWyEVghtV30FEerkpcndIpvBk1uQw21GdvtScw9eWB95/
 WZ5Sw3pvWnuLT/8BrDI1E5ZqZjpGwuf2jqgCF/LZnWPSX2w+R1EcixhWJZSyXkIPC2UwCW/TJ4x
 +wR6/8PeiiFsIAd4a34XMVzuZEGhSTy14Fv7UTbwEE8txUDKyiMpbfs5Dat7OQaVx3/E/kykJsm
 +ERs8TFjq+h5lHgPW8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDAxMiBTYWx0ZWRfX2Ofv6n11yZ6s
 x93Nbxu/DWaqRH6grFsUeBRKaiqAiMgiRwsU+vFPzF2hQ9ElDxGkYLXBpMX00n7qREhCoRnkZEB
 ltWNLW2bwhI+JL3LsvervRALwGNPLio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040012

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

Walk the scatter-gather list of IN requests before mapping them,
counting the TRBs each packet would be built from, and copy the request
into a single contiguous buffer when a packet would exceed the budget.
The original usb_request fields are restored on completion, so function
drivers stay independent of the controller limitation.

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
 drivers/usb/dwc3/core.h   |  15 +++++
 drivers/usb/dwc3/gadget.c | 130 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 1 deletion(-)

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
index f245e66cd13d..2165c80c7b00 100644
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
@@ -206,6 +222,8 @@ static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 		usb_gadget_unmap_request_by_dev(dwc->sysdev,
 				&req->request, req->direction);
 
+	dwc3_gadget_restore_sg_trb_cache_buf(req);
+
 	req->trb = NULL;
 	trace_dwc3_gadget_giveback(req);
 
@@ -1474,6 +1492,110 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
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
+	buf = kmalloc(req->request.length, GFP_ATOMIC);
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
@@ -1630,10 +1752,16 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 	list_for_each_entry_safe(req, n, &dep->pending_list, list) {
 		struct dwc3	*dwc = dep->dwc;
 
+		ret = dwc3_gadget_linearize_sg_request(dep, req);
+		if (ret)
+			return ret;
+
 		ret = usb_gadget_map_request_by_dev(dwc->sysdev, &req->request,
 						    dep->direction);
-		if (ret)
+		if (ret) {
+			dwc3_gadget_restore_sg_trb_cache_buf(req);
 			return ret;
+		}
 
 		req->start_sg		= req->request.sg;
 		req->num_pending_sgs	= req->request.num_mapped_sgs;

base-commit: 639df5d23876a548b86fe6526bed8b97edf64d96
-- 
2.34.1

