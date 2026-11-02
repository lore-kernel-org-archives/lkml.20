Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648062;
	b=nNUquNn2Xh9nYJTB7GPdSIouPSgw6p8qzpsvDmsU192so341b1XtzmueI+lljpuQkrDl
	 S83g3h3TXR+yUGDa2GyyAUBQHF0AqCtw9GVoecfzPQ9A1Q1ZdahTOnt2PuXINH6ImLVED
	 Ww2YpgAPvA5J0CYueEqmG0RaHN7GtMZ+z0BwN+ZmDtknVBF8SDEPPwO9JobgdTj/5ezcD
	 1LnjxpSCtucb+pVlycV47NK6x93HwZkdRzFkIZfrf2Sk+QKOoXo/UVjtdW0b5c5HNSCpf
	 rqYlUetjuqxDVMm+if3jQ/U7RezShCOxrM5p3DleyD6aefi4iDp3XfEGeCtiv9MmtKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=ZOtMF3dzph0YjKo7XJmxUpS9QYmiLSYkCjWbu1s2T04yKS6cpEdAveSNWcjhkKyOUzC8
	 Il/CGRgDl1bghpeF3p5HZtm2Ujl8sLwfCmvc64EvZyRXF3uxhngONHefAhB1gOj/rfQhr
	 gwQ85kF5MU9h9NkZu7uN1UK+ehTdZN3+n1t8nYwKaZoLS3nwjDXc+iwUbp63Xfdgye5Ia
	 MrX7E4qTIK04JW7BvHCsJbC14Pyp9fXPJ67EiKv6s9zWir2IMoicWbq76MWMwD+mMhmzT
	 vscGsQ/JCBJDqA910voAU80aXZX5Bby5OHjSKq7a2D5EAadXt7ZHcvN4O8Edo++JSvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0yJUUbj;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78EF606D80D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78EF606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0yJUUbj
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85a6c747dc9so3075410a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648061; x=1794252861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=h0yJUUbjstn8n0lPMZb2BE7TQtnBcd7AjiPCy5Za2PFXpMbWiPRPEUAR3nxKRQRIRU
         IHc7q36oNA8OzxDC9sdg9ozvovc++jE1fEuB1D9drsvaMpjc4g8kTD+Jd7BLcEWRHWti
         BoUycOYQIiQbwZOuObVYf+XY7/LC6Y7NHPIEyGdxnfsX9OxyKj6ObXEjWe1ta1/CDno8
         r+b19zNJGWoiNtz1K9MpYYDv/OcCfMQemBYW4PIY1wIdRuOXp4qx3KPvDaFPcoanTelz
         McjMRvBAg6xVWnlZ5P1d6DLDD+OW2D1GHBb6HNtggdnSLguDawyCkuVntdjtGQjbUezQ
         eayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648061; x=1794252861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=iN1fq9dFeXbjnHjocHXWAbjpS/m94B9IqJo26jPZ2KjIYuBuNzHtqGlpf+y5As4hlK
         /gtdBXOhXxl5Xm0LMXbwJFZ+8IMySx1gEqFuE8+dL8FYduL1nyZ8hyOch7TvQTgOEEai
         sVNCoQ7ekaXMIEWmgoVoWXxCgnsL873x1oZRTUyR4cbAkl2P0pRGxnvcVGAT7lkUezyR
         jYl1fz3oJ78B0+KDqAW9DLZ3j+muRmvHpOgA4PVlsSkin7TMhhKwNmX6Q/AetOhprNrv
         rGM7ZTgNbQYqarQ+s62zNjSkp98KR9o3siRyiSylO2ZL2EjfSVnFdy4VtA0Ux/fIvd2t
         9Tuw==
X-Forwarded-Encrypted: i=1; AKwUvBz4P2As3K7/kq5Aj6JxkzlT6HmESHylGTRNMEPVQ7KLhUzrrxkRYS4hkWdn+BK78CxZ9L42hwIihiafWCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNpIk9a3v/EGL8omCnUxG0t+59SLeOVSrNbJA0Qk8xZHZUxlJv
	XHlGf1vVEAyUzx+TgYxWFKu4YyrXdVyAbbGlVRScPzU7D6esAtuyexAG
X-Gm-Gg: AYBFou0JPNGRvY8/CpKaYZlqqUwW4z0tErq1DjJB+18lOjt4hJcBONcGnH0CekohECJ
	0dQstEDy6KMLK9wdd81S0RgN0OmsRUOjQV98iAljNCCv3ZXDM8rP7+1x6CJUgdPCqFerPQnqlyk
	wTXKaXbS5wEW7ruT9OvYXFMEpvrihYbQyHCwpOVnkROkdBqIGHU3j6BzecOipQ2LRhLrjl6nzmt
	UwNz/ufdYhuhHEYT9AKwej1qnaSvMf0azeYEyDCCFPZR7wmX1v/7C51ZER7dcgB90KWQ2aXYrd1
	7L4ACQlnvH6ZxfXcd0Otwsk3rxedLT8uwoT1yab1spzf4dudx/Xh+5fLPo0/gnsYaL/XOH5ROsH
	YyrcVWU5I+mRGb4NAr6Q+Z+bCzdJtApvhMP/NpizetfVlH32VlZZGLSiyOxlYBEFIoQKpEf/s3u
	TPBRj5hHmU95aNzKauN/f3Wl8glTaWyBdrH5EM0kimBp1VQr7kJiFRU9BiSojftkMa2Xp7BClKW
	CX/c/dCMsZN09z/RK/TZ5AZ3G3PyWa+JL5VYej2PwxVa6tpiwPJhRpB2fjHdIaJq5R9KK0sPbzT
	eDQRKezpvT/Rw8NK5EBpBaxKtHvvurEr8WpTiqLVxK/uWSqK+ixLQtxJ3saZgsRq9tbGk+lKnxa
	KyMElhWZXrCgvVcbPPerbNku78nmbqlPw2nXHo2ZcGWS5GMFvCsIRPtgdJNVWOQwGPjhIR4y94Z
	RSjR3eb1Ca8hw66YCET2xUUpo/mRY6dbReL4ZpWA9IVC8+aCtkceAV/pez7N9EaRDSU6n5nv4K
X-Received: by 2002:a05:6808:1304:b0:50d:26fc:e6d3 with SMTP id 5614622812f47-563efbee16emr7279840b6e.43.1793648060817;
        Mon, 02 Nov 2026 11:34:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:14 -0700
Subject: [PATCH v5 02/10] dmaengine: dw: serialize error recovery with
 channel termination
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-2-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The tasklet samples RAW.ERROR before taking the channel lock. A
concurrent termination can empty the active list before dwc_handle_error()
uses that cached error to select a descriptor. The list head is then
interpreted as a descriptor. Even with an active descriptor, moving
queue.next unconditionally can put an empty queue's head on the active
list and pass it to dwc_dostart().

Recheck the error status under the channel lock and stop the channel
before selecting its failed descriptor. Only one transaction is issued
at a time, so take that descriptor directly instead of scanning for
completions first. The scan can otherwise complete it and start queued
work before the error handler has identified the failed transaction.

Detach the failed descriptor under the same lock and use the queued-start
helper, which leaves an empty queue alone. Clear the software-LLP flag
before restarting so a failed multiblock transfer does not prevent the
next transaction from starting. Keep the completion callback outside the
lock, with the detached descriptor owned by the tasklet.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Fixes: f336e42f73d9 ("dw_dmac: Move single descriptor from dwc->queue to dwc->active_list in dwc_complete_all")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 2a9db9e39f5f..f7ca9da5af90 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -403,10 +403,17 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	unsigned long flags;
 
-	dwc_scan_descriptors(dw, dwc);
-
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	/* Termination may have cleared the error since the tasklet sampled it. */
+	if (!(dma_readl(dw, RAW.ERROR) & dwc->mask))
+		goto unlock;
+
+	dwc_chan_disable(dw, dwc);
+	clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
+
 	/*
 	 * The descriptor currently at the head of the active list is
 	 * borked. Since we don't have any way to report errors, we'll
@@ -414,12 +421,7 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	 */
 	bad_desc = dwc_first_active(dwc);
 	list_del_init(&bad_desc->desc_node);
-	list_move(dwc->queue.next, dwc->active_list.prev);
-
-	/* Clear the error flag and try to restart the controller */
-	dma_writel(dw, CLEAR.ERROR, dwc->mask);
-	if (!list_empty(&dwc->active_list))
-		dwc_dostart(dwc, dwc_first_active(dwc));
+	dwc_dostart_first_queued(dwc);
 
 	/*
 	 * WARN may seem harsh, but since this only happens
@@ -438,6 +440,10 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 	/* Pretend the descriptor completed successfully */
 	dwc_descriptor_complete(dwc, bad_desc, true);
+	return;
+
+unlock:
+	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
 static void dw_dma_tasklet(struct tasklet_struct *t)

-- 
2.53.0

