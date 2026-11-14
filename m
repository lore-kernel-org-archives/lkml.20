Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636014;
	b=W7se8aR+v2Qnihk8JrvQUXOF0qvymyb45cqmpUd0qBS4J+f2sBttx2yGLRvlJdb3GHOY
	 g2rPc/5uCYugXebyKdq9It2ZdR+n9XZi0Z56/Cs/rnYPwymFr60E/FuPn4H3BWLnQdlrk
	 VeKixVl/KShl1Dj2JsKF97U9QU02JLWnz+/wr2CRXf069B92jvF8i0HhZ+Z5oZTkfnv2D
	 XbkACptLnb4hWRnWG1TLqkdSaQz0xddlFzFzXs1Cxzdk7u3RDfdDXUc0n2xlAI+7tavjn
	 eg3qJ0zkrCT9aSFFT/0sRIJURsQEpaJ+QTnsXDz5bP0i4rGDFzE5Q9jJffJ+BpzdixQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V5vFPK32ZMQWprKRPGreWVAcROr/+4kRa727HzscJ4g=;
	b=k0qPAsUfVW511QKagR5+IrwuuEfDzQVKPZ8hlD5VWvOFfd69CaFHIBWkyU3Vacs0bYFU
	 WeOgujCY798hY/zlX2XYneHCl/PddqXdh3gFn+xfeZbILaC/3i2l/Mj2YpIaWPMp9cdVb
	 WMuF1rsUnZbcof6hV1EmKxs1pWlXEMYH3/ALuDtQnIJStTwt1+tPuFWpuf9nx1jONa23p
	 LCG4scz3kyNC97FgICMiyp5dLwQU54h9OM8jUBOsOQjrlrUm79ZlTcOtIjjqiZ4huv3g7
	 MzE3nC1KwcrGGs6Its3uxzF/RvbWEit1bt+mw3odQWVZGd0nn/NbYNWuZiTXRR7SbgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WS9H+bPs;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAA60A3808
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCAA60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WS9H+bPs
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1260863c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636013; x=1795240813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5vFPK32ZMQWprKRPGreWVAcROr/+4kRa727HzscJ4g=;
        b=WS9H+bPsKsSlIpGtl/XQGa8+Sds7Bo9LhuF5FEL1Sjyl9UatMboccnQvKDFYAbn2Zi
         /nBRrgEQVjI9l9YzvCNnSNRV/YqBfaMo/+H78M/rPu95jRY+Fb6nU6h6wqUt7wfv693L
         eWUOsAgtkAECaUmvRppWHoMLwSuxA8EUe1Fhi7hDpBu+8W0PtgbAVRCBnXqtG3ejgssA
         RSkDflkgqFB7/sHHwjEU4liUs8VcTDKhfDig87c+Zwlzhk0AYXHVmUq6XnM1sMhJ1vCr
         id8cLv6rEqthPuTQ8sllV/+t5qB0qLWq6Fz30pJ9gChEao8RgRSqsKEjmQ1J9z88eSBW
         1PTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636013; x=1795240813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5vFPK32ZMQWprKRPGreWVAcROr/+4kRa727HzscJ4g=;
        b=XUnfrxr1XAPbOHPBblweu4QCrm95hkmjvunl9k2fM1t5zMkfDrwE3hhjrh5K77LsWQ
         aZsOoO2qAt3+PPnJqvj8i2ihS9w0uvg92ixy1CAfFXd6MoaEJjoNz3Duu7y+q2nZI8T4
         52h5PCgSPUQLIrXtll8kKqcv6aaBC/EJwLK5yOisIbBCXJ2BZbUo55SK3RWFYoNeZosx
         nsx1lUmwr9gb22FnW8/pQ1D2MpRm8pvXskswmyZHy7so/LEGcP1bRZ6v8GNY/G6MMo5+
         hP9ApuRqtly/hU/6fUVZThca5x+/0bmyYumCwKcknK5pu9z9WzwA9ZgNLB3g7rGT54jh
         16XA==
X-Forwarded-Encrypted: i=1; AL+hErFu5BymnWzGJt5r6U1M3dk/FpDbpWbdsIBErEG6N6H1qWwoocUVacpFGR1RA/lMoARPWe1dDfbra0t3O6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1HxRmNXGZ6/5uBtfEXqFdMRUqx2MEEPQtNZCC+kBnl3g5qBZ5
	gIaFsi3a7R0UxbkyZ6MgTDmMY4t0uF7EExxxf6x6boJbTMJD7pilJ786oK0/qw==
X-Gm-Gg: AYBFou0zfW6MBBC21dTVRYKsPkWeO3l6GlBMoQ/tUAoH6NpkXmEodZN+RaptP7WshAK
	jJ+0eQvRZLNzpP8djPlOOcCR8qqWSJ3aFEEM1xFgu5UA4r88gX46rJk+pEi/arXqHrmvM20KUf0
	rM4WJESH3cVgdfhQG20V5GE1xWlEN0U6tOTvJzNOeZ5Kve+PnlaqDwRRit+tanPoMqfe/Kr5al5
	SH0fD32g2JLYTzEZsSFX+bQHXOBwGlL04A/QK0SLFTc7+oUwRsrKRINfDT77JQI+wzaYQTsLSHW
	iiw1q+QiDaSlvL22u4fB5aJVEnANGjlmBcIxPjyEQBUjxcI0T9cK4osgEFcohY1WqioZEdOcim2
	RTs+mm5nGpoq0CPXKs81xjxjtSum0risvCC9/3dDgUh34QQL//FftdTeIIy6Oxi1xhMASyoAkls
	QJN6InFGR6VC+RXCvxuDyu3fZKPAJKNdx8E9E6nwMjONJVGA1NpdlzO8WMb/p0bp/HYmuWzO0dv
	MHAbQhSYXIOnWcIjK6jS8inytDR6ZM8brsEFLwgaz5j4QDw+yT+W69a96jC5CCFy6E5gfJGuX+j
	SH0TjaQjCXMI23yxDq+4pOiuO/yt0UkqZfL0PamZmjTo+3Th5MC36tpu+dR45SVLstEW6zx41Cz
	ffOZ8xkbtIktm92Nu
X-Received: by 2002:a05:701b:2616:b0:159:f192:5290 with SMTP id a92af1059eb24-1b4f5f37854mr5951635c88.13.1794636012896;
        Fri, 13 Nov 2026 22:00:12 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:12 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:58 -0800
Subject: [PATCH 08/12] HID: rmi: use put_unaligned_le16() to populate
 output reports
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
Message-Id: <20261113-hid-rmi-v1-8-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Open-coded byte shifts for 16-bit integers are verbose and left the
upper page address byte uninitialized when reusing the output buffer.

Use put_unaligned_le16() when packing 16-bit fields into output reports.

Fixes: 9fb6bf02e3ad ("HID: rmi: introduce RMI driver for Synaptics touchpads")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 0a5d32dbe881..ad2ab6c13550 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
+#include <linux/unaligned.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/rmi.h>
@@ -126,7 +127,7 @@ static int rmi_set_page(struct hid_device *hdev, u8 page)
 
 	data->writeReport[0] = RMI_WRITE_REPORT_ID;
 	data->writeReport[1] = 1;
-	data->writeReport[2] = 0xFF;
+	put_unaligned_le16(0x00ff, &data->writeReport[2]);
 	data->writeReport[4] = page;
 
 	retval = rmi_write_report(hdev, data->writeReport,
@@ -217,10 +218,8 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 	for (retries = 5; retries > 0; retries--) {
 		data->writeReport[0] = RMI_READ_ADDR_REPORT_ID;
 		data->writeReport[1] = 0; /* old 1 byte read count */
-		data->writeReport[2] = addr & 0xFF;
-		data->writeReport[3] = (addr >> 8) & 0xFF;
-		data->writeReport[4] = len  & 0xFF;
-		data->writeReport[5] = (len >> 8) & 0xFF;
+		put_unaligned_le16(addr, &data->writeReport[2]);
+		put_unaligned_le16(len, &data->writeReport[4]);
 
 		set_bit(RMI_READ_REQUEST_PENDING, &data->flags);
 
@@ -293,8 +292,7 @@ static int rmi_hid_write_block(struct rmi_transport_dev *xport, u16 addr,
 
 	data->writeReport[0] = RMI_WRITE_REPORT_ID;
 	data->writeReport[1] = len;
-	data->writeReport[2] = addr & 0xFF;
-	data->writeReport[3] = (addr >> 8) & 0xFF;
+	put_unaligned_le16(addr, &data->writeReport[2]);
 	memcpy(&data->writeReport[4], buf, len);
 
 	ret = rmi_write_report(hdev, data->writeReport,

-- 
2.56.0.679.gc527c65306-goog

