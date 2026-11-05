Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879004;
	b=UWI5rLhT/EjIresdZWCmIriGB49s2ewTLdfvKDuqIg/6DYEFBsATxP3wgQMwZEUxRKbU
	 EDIoRV4pT3+wfFekQQPuxfFcCah7fKpQTVQpObXQK1JPV0fR2jEKvdai9THvpnK5b7+9g
	 HqZrlsshQuFRrwqeZoQrMvaJbBf4LrGYGBHo7wThhPILrOMCDI2ualGJ7M8xV1wdpaJ52
	 yMZWtErD3qcqfCvlY7Mc3gWcVSrl0MAlJi0+/oe+fBgOPl744dEUUUc14B2Fm2+kxDyWU
	 3MXa5psi+7b3X99j8E3gAmu5gJZseyBqHPtfQFKAWVTRFZN+ilr7Q/iOpBp2elD0oqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V9tY9gdRkxo3raHY2usVGihGSye+rQQJ2QRgz5/t7fs=;
	b=CvU7OCv/HWs7sog6ctBHAuA7lfwahWUYI4/p9i0mQroxF7kNzjlZjGimQRPmb6gf5p3r
	 lv9y2CqtnvC9jfXIeql1G7zi11c7uTwHFAzi+P+RP1oNxR1dOHdcHGBvgI5fEysCN8Yk0
	 5fpt1QhasFGswL9QZUTjltP7eMM2GwEL6+8LUGBIo3fRRBZkhSwDZl2I+gF7WsnEiltLu
	 OteXNRUcW0FxFwwo6knGagSQSZ97fvjs1R47nfPdl7Q2YF3/FQkPsclW4fPNxZ761X7PX
	 5lgYHheAtg9izLyMFqw93jtvU9Qctu0NKedCBYT0gIghBnqfIFSuihWTDIr6zdmOTeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0LqqZC7;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B210C606EEAF
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B210C606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0LqqZC7
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36d6765756fso1996313eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793879003; x=1794483803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9tY9gdRkxo3raHY2usVGihGSye+rQQJ2QRgz5/t7fs=;
        b=n0LqqZC76nh+k3HCnDbFpDZiqOO5izK4/9Oxe00sc4GKLaS3lfxYLffsCJnbMFY44M
         1RzW+pB62Zb3r2msrYtDPUQWAzGLPhBIuOIb8teU26ieNJla3KZ5CXQzf6fFD0q2MD2/
         a7SJhcwMayiKVaSVm6F1M+2o3TAdlbATRFgGgDzLO/CKmmEW+rMoeu0MXU/Wjm3bmGqR
         gDf0fkaLU5XECH8DLszXT7nzb0OoMoAKRFVD4eze5/hfzeo57ZgI4X9rXOHGLoKdjbJf
         895tI+fXnY+2wiowgWPZLQFcXpVEDbN9FXLPSE4E6F8ueohe6WsGI5GOiuNp+dN61DlK
         hlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879003; x=1794483803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9tY9gdRkxo3raHY2usVGihGSye+rQQJ2QRgz5/t7fs=;
        b=UCpemInPsgCrqP4Wbs0fl2K3pz4qMttNIlJsbyy8dWuCjvmXr+KyJzRZjYv4z3SAlN
         dSUEHAd+/kI0h3Ll1AcBPZqYbFBvWLZdHd+pwltu2GcwTYWb9gI3WccAqzhRE+dozfJQ
         w2r+41cGO5vweJamEYyQsKYezK9vqUFmtOwUV/ILkAakYrVqeCpAL91FeWcyTKR2Us9I
         N2yB53OE8CjU6SxH9KGSFBNx0M+Z1Wym4arOiEw+yaf+SWdGHvcXQp3vTyqhbuacI7j0
         +QNl/jP63Zg4O884zlKFHJ3t3Jgai85adCxxAGP2Fo9bUhJP8GzWh81AMjAuqg9yiJoL
         SV1w==
X-Forwarded-Encrypted: i=1; AKwUvByYBKKDZUx6U6mNCOYUv4YeIFcGD3NUBF0QlYMhCCsojTKdDucBPNOVW5auw0nSVfvBdw/vr6M+9NyW/wU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TxGZqf110+MqmDR/MvoESAyEXgzJ6Yw5Y+noa8LvIgdLqH+jK
	3W4Akv4GNWT5VV0vlfIUOozVQHbNo/GHO3X1tHAqCeTFieZook0HnLuVyGgdUWAgUrc=
X-Gm-Gg: AYBFou2z7JmEWLM4ZDrkP0l1DJvBvAJJpu1BWCawZmuZ65+azhJYtgFGUhZRghlmxtx
	CjxNqbJr+gxTORQ1D6NW0gDbScHXIWOH8lfJXUol295gr2HdIOEipyztj2sIUaUpr7ptuCFssj5
	BNY/GF7+9yPYvbNqWhHDB7k6DjfYuI44HFngproFPhaBYG45nIvpup/swzCYSkLQZIfpmH6KgHH
	/1W9Z/sJxyTx5h/xym8KHSmhpY6moeJNk0Z0VzQIBX+BCsGuzkHFvJob3mp3hkyiMEQMbPBMdDp
	WH1/YGvdt4Gm1W/sP/9U6Tsb7EFG8LPNlbIW6VNkD+MYI0R3unPaFJJcnL+MdrO/47BB7dJiDsE
	LhK52DtneOvkxEzIy9qWYcL7CQkp7dW89hxE197DfKPTYjZXwwGfNIis997kADuk0YFSj8ZbW+g
	9E1G3Y+4L92vcnDtKOMiy3ZWqexAjNqUzH3Ev0W+iCAP6xZLegG4XbxOykvPlShgknZ5HA8dX6v
	haC7g9YpQSixh3DWldxoxQxfM3g4Boz9UEtTUhsl6ubGOYSru2h93Ja/Fqjex1K/+6KlDVpWUQx
	Twpc9ky+GQRl3pIQ8fcWiHwreiaUpVPBdBVgN2cJT+pZD3J80ie3HIn1imddIZH09J+Q/ivYnnF
	V664SNDbNzjcL00VAgytGFxwLc9+a6Sw=
X-Received: by 2002:a05:693c:4195:20b0:36e:2b8b:a090 with SMTP id 5a478bee46e88-36e2b8ba399mr2744277eec.37.1793879002447;
        Thu, 05 Nov 2026 03:43:22 -0800 (PST)
Received: from lwq-System-Product-Name.. ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm19906381eec.7.2026.11.05.03.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:43:22 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: felipe.balbi@linux.intel.com,
	vladimir_zapolskiy@mentor.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: u_audio: call period elapsed under the stream lock
Date: Thu,  5 Nov 2026 19:43:09 +0800
Message-Id: <20261105114309.970899-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

u_audio_iso_complete() drops the substream stream lock before
calling snd_pcm_period_elapsed(), which re-acquires it internally.
Between the unlock and the re-acquire, a concurrent close can run
through snd_pcm_drop(), finish the PCM release and free the runtime,
leaving the period notification to dereference a freed runtime
(runtime->fasync in snd_pcm_period_elapsed()).

Keep the stream lock across the period notification and use
snd_pcm_period_elapsed_under_stream_lock(), the API for exactly this
caller-held-lock case, so the callback's runtime access happens
inside a single locked section.

On final PCM release, snd_pcm_drop() takes the stream lock before
runtime detachment: an in-flight completion holding that lock
finishes before STOP can proceed.  The STOP trigger clears prm->ss,
so subsequent callbacks do not enter the running PCM path.  Runtime
detachment happens later and is not itself protected by the stream
lock.  On the gadget side, u_audio_stop_*() dequeues the requests
before the endpoint is freed.

KASAN reported the use-after-free in u_audio_iso_complete() on the
unmodified kernel.  With the callback stalled inside the locked
section while a concurrent close ran, no use-after-free was reported
after this change.

This issue was investigated and the fix was developed with AI
assistance (ZCode/GLM-4).

Fixes: 773e53d50e227 ("usb: gadget: u_audio: remove cached period bytes value")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---

Changes since v1:
- v1 saved the period size while the lock was held but still called
  snd_pcm_period_elapsed() after dropping it, leaving the same
  unlock/re-lock window open for the period notification itself.
  This version keeps the stream lock across the notification using
  snd_pcm_period_elapsed_under_stream_lock().
- Documented the synchronization this relies on: snd_pcm_drop()
  takes the stream lock before runtime detachment, so an in-flight
  completion holding the lock finishes first, and its STOP trigger
  clears u_audio's prm->ss so later callbacks take the early exit.
  Runtime detachment itself is not protected by the stream lock.
v1: https://lore.kernel.org/r/179378417544.69464.16164899430939223277@gmail.com/

 drivers/usb/gadget/function/u_audio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f0ee83abcebc7..7da4032e3a203 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -156,6 +156,7 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
 	unsigned int frames, p_pktsize;
+	unsigned int period_bytes;
 	unsigned long long pitched_rate_mil, p_pktsize_residue_mil,
 			residue_frames_mil, div_result;
 
@@ -267,10 +268,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	/* update hw_ptr after data is copied to memory */
 	prm->hw_ptr = (hw_ptr + req->actual) % runtime->dma_bytes;
 	hw_ptr = prm->hw_ptr;
-	snd_pcm_stream_unlock(substream);
+	period_bytes = snd_pcm_lib_period_bytes(substream);
+
+	if ((hw_ptr % period_bytes) < req->actual)
+		snd_pcm_period_elapsed_under_stream_lock(substream);
 
-	if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
-		snd_pcm_period_elapsed(substream);
+	snd_pcm_stream_unlock(substream);
 
 exit:
 	if (usb_ep_queue(ep, req, GFP_ATOMIC))

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

