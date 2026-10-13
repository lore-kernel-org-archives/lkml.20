Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DDC38B143
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874575; cv=none; b=QHoOpCLCBHIx+Q1H2gRlGfwbZCOlEdmTaSc2VPjasg8T6AKhNsqmXv2+jLAaZBoYD9Sr7U3w4piVdWWib35liVxX4d7axuBzAnBCyyqNM5V1gh0RDwIk2PKG6b8OYqX/4MQT3vkXcclHufvaJk1V8Q9vwOMgjPgAGdDAamYfBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874575; c=relaxed/simple;
	bh=1Fobwrg8AECZXZe7njdX8d38CGkOJpbWg5fkKH8FxOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nwPeOf+RYSi87jBGL8VGD8fUllqTP8pvQvYEYjLjOXKwCvGLjtXW5mvc8tKspqbMZaiVdRFkO23uw9tfjFaybS+uMuylyFcZY36Kd5wLGgMRttycySLhhBo6/xDw0tvfElkbj/hjf6nu+Lg1Ui/7p4Y664cyORozY/pyOn+8Fao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y86CtWYC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y86CtWYC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so25886045e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791874572; x=1792479372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl1vkIq2RUKP+g12UFW92ioYIoDQmINIFzje7YSAvf0=;
        b=Y86CtWYCZCJXmX0RpyUoSZVnBVBhUz798iSmwoOLBOUXS9V6MYljR+6byZSjRNz/+W
         WmJYFHBO9opo8CcrN8Rdq69ZL2L5veB6tCzpEHTRMYwM0RiFhlpK69XrbgikeoozTv8c
         qMvI7P5PcaeCjY8wft8JZlV94rRIMONUsHvjRwGEIEpF88UdoAKmFxkMXsOPBS9XTcvQ
         2RORj867+Vcy46DCK9esuson1fUcPrQhx/QjF5SVBkYbrJ9w43nYlwbj2JeplIKOjKaL
         iydBWTo23NP9zP/BIMk2XfBqm25QF+X57nynDwi+uE5i9cojw24DQBbENyJAuFONVLTc
         /7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791874572; x=1792479372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl1vkIq2RUKP+g12UFW92ioYIoDQmINIFzje7YSAvf0=;
        b=Lj7cxYWEmptkmgwEsvXaXKOU2BjsyIhpR8/rQHoIZINVh9dVhX77lcQ1TDdJP/Qfna
         ufMVDHI/q4qsvt4r29upfPk/mhQEw/pauiXVvuSVSlqcw5jhbzUTFtRiAKUfE8sJv5ck
         s0KcoOJGb/l3nOtDxWhAKmpSHla58zLvysrQqgcJ5CWmBlztArJWPuV6fED3yJL2H1Ml
         eBTt7WT3oIRC+Wj5Zoi0dXrg41m3k1NGQwRMMxlOedIf7AP+1xHet3DEU0U5J5vqQ46z
         kh+TLmHDBOm13GB3GaAyZ+sr+3m5DMEccpDyg6dRwWKlKHwXAa1DluQALoYhC+prWOyf
         5FfA==
X-Gm-Message-State: AFq9FYKQJyoNjsbBr3bBl6yIUmyaDH8IY0Z5UGr1dqtEX4kTT9HYT3dU
	+cL7VQ56KCOZlT6lrXdy9ACkSZg/nVonf7ZSKwhUNuA0kSUnH4NREWYP
X-Gm-Gg: AYBFou0JMGi6LnCMfiABpm6OrYJ7P+f/vziHkYe7zoiG6PvxTzjlG70tngcZqu+3iHa
	rHk1liGqLGLd0OKfBoC/0+yeNcX2Ol1ehTsIByJjAEBnMcxCb2S3jUh/SOVjQyQ4aQQtLXMk9PJ
	AamJ9nXjny6+ZnYnyTzP1rUUfl42la/1DO0Nl4JVVi40wT4K0X+4otOzItNaYWpaEIEAB5/8idO
	RycTGppJNWnrJCk0XlOARm6oaV9YrJzUri63EcGypa8EGwaiuZyB6YHSu745pNVByPaKXEg9Qm0
	zOn+nlAEcNXggR2GM+pz1keoN2CFxauOpHMaWhDyY8BFZxdqrooZ5fJg8LiH9QwjOpXSMmYXiVa
	S4rahQUbDpB8BHfQe4NorR2i3NMqA2yrh2oDb+vPO6Sy5PKF17C0qlV5g5Xw6dE01PMsRr5NBzM
	BNigH8lfLKMlXXL/XxRuoD9yLeUxJv0/GbNdufCxFWVtxRHdnCW5hEc+GhqV1HFxNUxLbDNY3ZD
	bdZuEg3ZQY/1iZWWTg+Pqd3R+4Vt6mSXUXOYLAAtg7oSMWM35Sc5U9vOd0uNAqfOcxm7xfYP8A9
	tUmeexZvBqrN2lJUYT8so/fFA0OBHi38KN3qHji5k0ut+222YHM=
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a18e4e0963mr228220195e9.34.1791874571933;
        Mon, 12 Oct 2026 23:56:11 -0700 (PDT)
Received: from my-vps.. (ip212-227-39-93.pbiaas.com. [212.227.39.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1a1feb78csm154188095e9.0.2026.10.12.23.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:56:11 -0700 (PDT)
From: Louis Clinckx <clinckx.louis@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Louis Clinckx <clinckx.louis@gmail.com>
Subject: [PATCH] media: uvcvideo: skip bulk output URBs smaller than the payload header
Date: Tue, 13 Oct 2026 06:53:35 +0000
Message-Id: <20261013065335.2246959-1-clinckx.louis@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a bulk video output stream, uvc_video_encode_bulk() starts each
payload by writing a fixed 2-byte header with uvc_video_encode_header()
and subtracts it from a signed length counter initialised to the URB
size:

	int len = stream->urb_size;
	...
	len -= uvc_video_encode_header(...);	/* always returns 2 */

An output device can describe a bulk endpoint with wMaxPacketSize 1 and
negotiate dwMaxPayloadTransferSize 1, which leaves stream->urb_size == 1.
len then becomes -1, and uvc_video_encode_data() casts it to unsigned:

	nbytes = min((unsigned int)len, buf->bytesused - queue->buf_used);

so (unsigned)-1 does not clamp and the following memcpy() copies the
whole frame past the one-byte URB buffer.

A URB that cannot hold the 2-byte header cannot carry a payload, so skip
it instead of letting the length underflow.

Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
---
 drivers/media/usb/uvc/uvc_video.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1701,7 +1701,14 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
 	if (buf == NULL) {
 		urb->transfer_buffer_length = 0;
 		return;
 	}
 
+	/* The 2-byte payload header must fit; a smaller URB would make len
+	 * underflow and uvc_video_encode_data() copy past the buffer. */
+	if (len < 2) {
+		urb->transfer_buffer_length = 0;
+		return;
+	}
+
 	/* If the URB is the first of its payload, add the header. */
 	if (stream->bulk.header_size == 0) {
