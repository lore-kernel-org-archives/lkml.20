Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41043135A53
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776668; cv=none; b=cm/CAOV8F5uuVHVb7o5pZhTxWTBbncjQVn5HOAZfS6RBKyPM9sa15cLnMGt5T1Lg7KoxIoJJuIwFKHOlKSlW6wZQrBg4BqzDWRasIDjqVfUSUYZSHUte5vMh104dLpWoS3IKdsU0OttFBk1bSbbWCmvf4JKIAojbD6D3IcGPLU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776668; c=relaxed/simple;
	bh=cDHIvCHfrPPpF0uIa80vtI94kyvi5BHR+PWTlzNWHtw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=nbwqPRBUBDF2Ejhusrc/4voTAn+i7Hg3kDbL+BuU5FqoyPcKnaH0xIoTos8x5CAbVHR8rPlNIQ/H0IgRJf16LEODaRkQRINRCh2a5kSG3n5hNAnE0u5vSYIbo030kS3q1JXF9NZ6ryGojE3oRlI24iltxV3Cu45gW3sUVrkH3/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Huff7BvX; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Huff7BvX"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261012034424epoutp02b4d17cadfdcec099a2540ce4f4f249cc~dq2H3WfH-1392313923epoutp02B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:44:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261012034424epoutp02b4d17cadfdcec099a2540ce4f4f249cc~dq2H3WfH-1392313923epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791776664;
	bh=FKgnRa88XvLVectNV+hOOXwkCVWe2eQs0wALqoY1YFc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Huff7BvXLpQVQC48gLPLneH307P/BC4ifrmNDX6wTl4nsVyCvggj7y9X7a9fMQmnq
	 Lj/kiX9wvUO40fDH3DSUWehggDUriOFeTCwPW34ItwwXvmxmHkblz/4szSd/KXaVRG
	 h9iMIt+5Tf0pn0Tpi91g2N3vmQjBWu7FMETnBeaQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261012034423epcas2p46c5847be0e19609d4f25b88c9d8b32a6~dq2HgANk42036120361epcas2p4x;
	Mon, 12 Oct 2026 03:44:23 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.211]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j33HW282Fz6B9m9; Mon, 12 Oct
	2026 03:44:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20261012034422epcas2p486b38818b542d2fff5b5fed58863ec6e~dq2Gu5xML2036120361epcas2p4v;
	Mon, 12 Oct 2026 03:44:22 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261012034422epsmtip1c189b2c0afcf1d05e4decae3125711e2~dq2GqO_R50647706477epsmtip1i;
	Mon, 12 Oct 2026 03:44:22 +0000 (GMT)
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list), selvarasu.g@samsung.com, Daehwan
	Jung <dh10.jung@samsung.com>
Subject: [PATCH] usb: gadget: uvc: reserve frame interval headroom for the
 zero length backlog
Date: Mon, 12 Oct 2026 12:40:18 +0900
Message-Id: <20261012034018.3193146-1-dh10.jung@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261012034422epcas2p486b38818b542d2fff5b5fed58863ec6e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261012034422epcas2p486b38818b542d2fff5b5fed58863ec6e
References: <CGME20261012034422epcas2p486b38818b542d2fff5b5fed58863ec6e@epcas2p4.samsung.com>

uvc_video_prep_requests() spreads a frame over every service interval of
the negotiated frame interval:

	nreq = DIV_ROUND_UP(video->interval, interval_duration);

and uvc_buffer_prepare() then splits every buffer into exactly
reqs_per_frame requests - only the request size varies, never the count.
So transmitting one frame always occupies nreq service intervals, 100% of
the frame interval, with nothing left over.

That budget cannot be met. While no video buffer is available,
uvcg_video_hw_submit() deliberately keeps a backlog of zero length
requests queued to the endpoint:

	if (list_empty(&video->req_free) ||
	    (atomic_read(&video->queued) > UVCG_REQ_MAX_ZERO_COUNT)) {

Up to UVCG_REQ_MAX_ZERO_COUNT + 1 of them are in flight whenever the
encoder is late, each occupying a service interval that carries no
payload, and the ring is FIFO so they all drain before the next frame's
payload moves. The frame period is therefore reqs_per_frame plus that
backlog, always longer than the frame interval the host asked for. The
UVCG_REQ_MAX_ZERO_COUNT compensation already in this function only sizes
the request pool; it buys the backlog no time.

At 60fps over SuperSpeed with bInterval 1 the backlog is 33 of the 133
intervals a frame interval has - 4.125ms, a quarter of the budget. The
waste is a fixed count, so it hurts in inverse proportion to the frame
interval: 24.8% at 60fps down to 6.2% at 15fps.

Reserve it. Measured on a SuperSpeed gadget (isoc IN, wMaxPacketSize
1024, bMaxBurst 2, bInterval 1) running the Android DeviceAsWebcam
service, as reported by the CTS Verifier "Camera - Webcam" test, next to
the rate the microframe accounting predicts:

  target   predicted  measured  |  predicted  measured
            (before)  (before)  |   (after)    (after)
    60        47.9       46     |    59.7        56
    30        26.7       26     |    30.0        28
    24        21.8       22     |    24.5        22
    15        14.1       13     |    16.0        13

Before, the prediction matches the measurement at every rate - this
function was the limit. After, 60 and 30fps move up with the budget,
while 24 and 15fps do not move at all even though their ceiling now
exceeds the target. At those two rates the remaining gap is on the buffer
supply side, not here.

req_size grows in proportion, 376 -> 495 bytes for the frames measured
here. That costs no isochronous bandwidth: it stays far inside what the
endpoint descriptor already reserves, so the clamp below is not reached
and the host does not have to re-reserve anything.

Fixes: 48dbe731171e ("usb: gadget: uvc: set req_size and n_requests based on the frame interval")
Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/usb/gadget/function/uvc.h       | 10 ++++++++++
 drivers/usb/gadget/function/uvc_video.c | 15 ++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -74,6 +74,15 @@
 #define UVCG_REQ_MAX_INT_COUNT			16
 #define UVCG_REQ_MAX_ZERO_COUNT			(2 * UVCG_REQ_MAX_INT_COUNT)
 
+/*
+ * Service intervals of a frame interval that must not carry payload: they
+ * absorb the up to UVCG_REQ_MAX_ZERO_COUNT + 1 zero length requests that
+ * uvcg_video_hw_submit() keeps queued while it waits for a video buffer, or
+ * 1/UVCG_REQ_HEADROOM_FRACT of the frame interval, whichever is larger.
+ */
+#define UVCG_REQ_HEADROOM_COUNT			(UVCG_REQ_MAX_ZERO_COUNT + 1)
+#define UVCG_REQ_HEADROOM_FRACT			8
+
 #define UVCG_STREAMING_MIN_BUFFERS		2
 
 /* ------------------------------------------------------------------------
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -501,7 +501,7 @@
 	struct usb_composite_dev *cdev = uvc->func.config->cdev;
 	unsigned int interval_duration;
 	unsigned int max_req_size, req_size, header_size;
-	unsigned int nreq;
+	unsigned int nreq, headroom;
 
 	max_req_size = video->max_req_size;
 
@@ -521,6 +521,20 @@
 
 	nreq = DIV_ROUND_UP(video->interval, interval_duration);
 
+	/*
+	 * Not all of those intervals can carry payload: the zero length
+	 * requests uvcg_video_hw_submit() queues while it waits for a buffer
+	 * have to drain first, and uvc_buffer_prepare() splits a buffer into
+	 * exactly reqs_per_frame requests regardless. Reserve them, unless
+	 * that would claim more than half of the frame interval - a frame
+	 * interval that short cannot absorb the backlog either way, and
+	 * nreq - headroom would underflow.
+	 */
+	headroom = max_t(unsigned int, nreq / UVCG_REQ_HEADROOM_FRACT,
+			 UVCG_REQ_HEADROOM_COUNT);
+	if (nreq > 2 * headroom)
+		nreq -= headroom;
+
 	header_size = nreq * UVCG_REQUEST_HEADER_LEN;
 
 	req_size = DIV_ROUND_UP(video->imagesize + header_size, nreq);
-- 
2.43.0

