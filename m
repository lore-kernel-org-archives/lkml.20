Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283223;
	b=RyTfwwQLc3rDppjlmSZ/FizbXKtB/ZnvU/n91gJtgDu8r9VtYtVL/OQ7BqgB74tW9AXy
	 bzE5F53w4W060jTMxrxjv36s/yIq5Fi7RcozStbnL9MBqfRrqDWmsU+fYcHT1HgPSjZNt
	 B6rCOImcFQdl5jUWt2O9B+GwVW1JnhKli3oCrZNC6QJhsh/9iTRtbpUnP/FIeo9yr7p27
	 fPnDypW2WxfV29tK7PxmPckwkIXofpz2ksihEP5h/EZCkoEKXaikrmGXCQaooDqlyoSLZ
	 UB96X49jCNFRrRXt/YXFbxbMwbsKHyClSfW4l0TYZlurEJ+x1VMEq0Qd+cKwxQ2+F2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:In-Reply-To:References;
	bh=/pgvkliCtPwsMB5opghN4hnkUGvheloeM6QC61uhwW4=;
	b=f1vGvLES3uYxNuyk2vg6cduUqP/fRU8k220zVavau9DC9Zv33yl2WRbTAOuREnVi6IBx
	 ijmG/+ny3uY01umZoVQ9RSuAk/wVKw9o9nUpWgloV7croLtSLj8YMdfLY6ueR1cbtksz7
	 sRSFmvVlec4sgN7SrDToAhJIoJ5KSaSo44DcvVlSTURZzVrapZ48v+QWH3s00IOnCt4KD
	 i9sbmVly4gj2ob4pDHOYjryS82oYhAoReIaIaagXLQHhkaINUmosSuBxwOKc353RFoSuR
	 FAqcLz0M2D4O4szyo2PpwKCSEjkg7ti6ubEuUwxxio5VgniD0BcNbJjbfPJjaSlkhMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQK1CVMj;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB42606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB42606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQK1CVMj
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-188406bb948so1976879c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283222; x=1793888022; darn=vger.kernel.org;
        h=references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/pgvkliCtPwsMB5opghN4hnkUGvheloeM6QC61uhwW4=;
        b=MQK1CVMjeRKniKOCjNzLrzdqj0IVxLaVas0+10hStJMvK3UAwl0xNx/vu1lwe4YIdg
         1ConM/ZpgNY4zWM5Rdc5E65DwOFtuF9i9dt0H32Jy6SdUqsPo9gE5ZX+bRKm/H0Y8ZCI
         +E5zcJeI+WFEtOVowCln71E+8h/d6B28yHZOgkDniT1M72AYEEtpPsmuqKNL3vh9MLIR
         3gvRfOunmEcVDZcrPlVaRCmgfypZFuksZdINBLHa80KWtOe1jRNCPzRWoqTTT5qnnmq0
         WsGrQSygD04Wb29RN58BxjVBXGRnFoQwcAZbLeb7Rq7yqwCkIM6sQaIxCpsckrVHWkui
         LK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283222; x=1793888022;
        h=references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pgvkliCtPwsMB5opghN4hnkUGvheloeM6QC61uhwW4=;
        b=jTu+EcwS5BT1V/44xlf/1tlpBR1hSgfWT/Bgw+PpdtQAhNYCBUdUoXBaxF1zH9Io0y
         BC8oeTzWkqmoupkzZTtjTPwB7JxBtBHPIKg8XhL2THfkEno6Ub0sP6NSLXxQ4Ok1xTZ8
         YLu4g/He8lZo3n6dzz+oqtoUeBjJ2Kti7KSeI+dOPL5BHv/ahsmpsMksvaYMy+DOPww2
         QtXOi8Lv4t+8OkCccvbwa8rNMtkNHauwuJM2Oo+x+1fvVpr+sd4opz4nSqqiIrf2SyD7
         pqCpII6RM+lAY2DoRO0Auug13z6DiwQmxyx/GsGZR/Pe9vr6oUjWFjWAWbKE4pKXCB7f
         copA==
X-Forwarded-Encrypted: i=1; AKwUvBwsL0wOgEoGvjS+VNegYqA04EH2YNtA4mbuxTD+F7YNGlN//1ZBwyC9ld1VUyrUOkruwx0mVIWdk9ouz0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpovnpNmgTemVuxW6yNGxehpwrdZa6yyorV1tQHUVRK/te8JBn
	sWK+gxWvRjgj9yCyr083uMqFvWAFfYi9uvxmfhcGlDcOkL75GFQote4s
X-Gm-Gg: AYBFou2bkmu3hNQWmH42dCjz6eS/WnI9wRrofgpfzueciTAB+sgiZm8TRgMZe6R6hpX
	dSAiCzPayZ2QC/AwXhvJrN/QgmhU8p0zTjPj4DrQSvkJEoZcO8TFAXNJve1jRo43/estgKioFCn
	raifyliXfM4a6tFoXDyj2Z3LgT5vYuiNByTTh2aRqXIncByr+WtzXVRA/suSlcHNMVqscg94j4L
	oE4YKUUocx1ntxDURsD3jB0t4jjzReGkbAf6Gdkzy+l5+NuviMm4jAmV5R6VRLwqv2U0/fRMB8h
	l/2jQKN4l8S0LBCll/XLDHhV7avNm5DKOHDspqHSArwlmeJpmpdzoyUVAun9JupBiw9pHanpZVp
	A5p0zj5eW/FGCWX1kQf9cwvVSft6k2P1Yhv02CZhb/pb1bl9XmkcsEvcywnN/wUQy1eemlxd9jO
	uls1bHrCJr+6KIcnzXyHeysUWlUcxsSzcFwmU5F40I/bgzma/Iwz9ZUhn5uQSH07IupTNeaQGBO
	VitYaE6Mh7M8O04F5TNnwGbaUyTf1gP1joh21C29PpLUNpGvC/7mkzLnCpowmMtRMhSGpVt3uZ2
	Yc7vmltS1KijbmDROnZTbi3CPFim8ALNsP0/7Td3ZiR+vQTgmEVB6Q==
X-Received: by 2002:a05:7022:e01:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1a6d02bd6e6mr9786281c88.41.1793283195990;
        Thu, 29 Oct 2026 07:13:15 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:13:15 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH 2/2] usb: usbfs: clamp the copied length to transfer_buffer_length
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314074.648427.8187049654053191605@gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <179328314073.648427.8311262845412746237@gmail.com>
References: <179328314073.648427.8311262845412746237@gmail.com>

copy_urb_data_to_user() uses urb->actual_length as the number of bytes to
copy to userspace for non-isochronous URBs.  The usbfs contract is that a
driver must not report more data than the transfer buffer holds, but
usbfs cannot rely on every HCD or device implementation to honor it; a
malicious usbip peer can already set actual_length beyond
transfer_buffer_length and trigger an out-of-bounds read:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x79/0xb0
  Read of size 88 at addr ...
  copy_urb_data_to_user+0x36f/0x480

Clamp the non-isochronous length to transfer_buffer_length before the
copy.  Normal URBs are unaffected; the isochronous path already uses
transfer_buffer_length.

Fixes: 3d97ff63f899 ("usbdevfs: Use scatter-gather lists for large bulk transfers")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 drivers/usb/core/devio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb94..9554b6a 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -557,10 +557,13 @@ static int copy_urb_data_to_user(u8 __user *userbuffer, struct urb *urb)
 {
 	unsigned i, len, size;
 
-	if (urb->number_of_packets > 0)		/* Isochronous */
+	if (urb->number_of_packets > 0) {	/* Isochronous */
 		len = urb->transfer_buffer_length;
-	else					/* Non-Isoc */
+	} else {				/* Non-Isoc */
 		len = urb->actual_length;
+		if (len > urb->transfer_buffer_length)
+			len = urb->transfer_buffer_length;
+	}
 
 	if (urb->num_sgs == 0) {
 		if (copy_to_user(userbuffer, urb->transfer_buffer, len))
-- 
2.34.1

