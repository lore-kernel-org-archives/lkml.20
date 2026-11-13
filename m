Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543612;
	b=TNzRlHbAo6U6gUB1C8asX1nGuxal4Gzgrj3f+cB1KbcLGBfLTFJEopxcwMp9Thr6530b
	 7PXNE61k0jTInxLaLRwD3I9wppA9970lIQQIEph3RQuE8ZmzoqjNV06rGz0OeVUxez+7V
	 3NFWdueODwgF9k50nMFXwM/AbRYAUlnwX7NECVUljQfauu6/MqWt6ImlGN3GvEAne1bri
	 4RYnBGZ6Ibsk9b0qADBevk0f6LxSy/LFfTI5bQ0xO0ey97ALmmBeK0wPnuWEXPMVffPvU
	 JJweZgBhsaHQ+cY9QHEFuF+51YQxe9tx+UKf08hx4UsgBcg+TMzhogCjJJZ7hfrBHUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KFG0JH/dMpan8/wpUyzRuxwvuYfdwzdSydgnFcr2KHk=;
	b=39CAANk5L5tGhd3tBy4j6af2HymbrEH+cnICSdUn4v92zz9yxaPLfeY5g7uGM2ucdaWP
	 zG76DOWOHowTC4+SxAD8NPPMKuBET0q7iuaht2mOypcxsDp56NsUt26pxzvz3B4BWg8tz
	 o0ppHkz6DkbfM3paoe2wNNFOpld8CGYdtcmBUTF+vCPnwmAIyF4GBb5DNAkXa0gLY+zOk
	 cxa7Fkt8Qhjvx0D4fb7TgXDTSodZjsmvMu4iR6WD7DyOyslTJxhmQy7fkwLRJcd/iNihH
	 WaSqLj3o0x0y7TvaqVwxzLU6k1zS6MwByEBcP2klEnUYOJQDJF3F3jnCnmGRhH86JfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PmYkRXSc;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FF8606A893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FF8606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PmYkRXSc
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so768081b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794543611; x=1795148411; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFG0JH/dMpan8/wpUyzRuxwvuYfdwzdSydgnFcr2KHk=;
        b=PmYkRXScSdXalPPR67/gXO2L754wW/MWd64f8P+OayBvFvlAV//p5+SnU1KM0So+GY
         jkV3WMiU4FBXNIUr9hbnL6V2lTrGC1y92GzztziWz7oPzBJCIg6mwF4vlS0xsEY+Ai0h
         OF7bafxEJTEO7Zr2wcwFSTP4LlBI3/gZ3KJoVrWvVJaIYag9MCF4kdmDw6jiaLU81qXS
         nzSi2TDSKs1IiUaFuBxVYCeR1vIT1WLViEnaVpoPeceYM2qRDrwtHxjtXYx+NgvYsUVZ
         G+r0BOxDSbvOMGWN0MHWysFeja5xBJc3o70IrZQ3QZ6Dfm7D1TOryioAV2KLGId8lBTx
         DqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543611; x=1795148411;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFG0JH/dMpan8/wpUyzRuxwvuYfdwzdSydgnFcr2KHk=;
        b=yxLoEuP2qknZiBPFHhv6zUW7dTzMxrP2lEjTnz84PcpahCP7HS0NQD99jSENKqJ2Ej
         JRTnJgToDu9oFd/jlACBTfozElvq1KA6WRnJEAHzBITUmWJNajdoPNLik7xn+39WCoKp
         KLh6BwvtL/bJCzyMkuNrbPNs55PnN8ihdiYHYwf9ZRyfsKNceDaSbDaGmrbdTx89UWTh
         ft/C33u22NYmLfPo4mrRmeDtr6JjaQwg5I17Di5CPp+i9NwjACn8WjO/2iKpqFuhTxio
         8w4f39qF1xGfn6m+D77ahRMyPeG52Jbf+040QUQZS3y6srTzlWsr4p8bSITW2PZ0uKjW
         uz5A==
X-Forwarded-Encrypted: i=1; AL+hErG0vc5xC3JtWxN786gddq/+EQJktHOsuXawR/gPFbHl9cYUZDmkhNDfQEcJ8lRL6eRTYsMthd2AbMCUROY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n26yMlbGgQa8lHMN+Imu6TCNMtaKhc1SKLGsqoDhZ2PfA5Rwy
	tbpxjLyCwYdyruhU2Zq+wfcVRz1CR7IJTTorhYq17PddWoR+o0wu+B6shkMzTsd7yLehHvVZDOT
	RkCBUpNLlURR4jQ==
X-Received: from pfbft6.prod.google.com ([2002:a05:6a00:81c6:b0:8a0:91b7:e7b9])
 (user=rickyniu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:bc8c:b0:89e:fe2d:abe2 with SMTP id d2e1a72fcca58-8beb84e0741mr1406322b3a.44.1794543610494;
 Thu, 12 Nov 2026 20:20:10 -0800 (PST)
Date: Fri, 13 Nov 2026 04:02:36 +0000
In-Reply-To: <20261113041948.1280304-1-rickyniu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113041948.1280304-1-rickyniu@google.com>
Message-ID: <20261113041948.1280304-3-rickyniu@google.com>
Subject: [PATCH 2/2] xhci: Give back URB under lock in xhci_urb_dequeue()
From: Chien Kun Niu <rickyniu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chien Kun Niu <rickyniu@google.com>
Content-Type: text/plain; charset="UTF-8"

Before commit 36dc01657b49 ("usb: host: xhci: Support running urb
giveback in tasklet context") set HCD_BH, usb_hcd_giveback_urb() ran
urb->complete() synchronously, so xHCI had to drop xhci->lock before
giving back an URB. That commit updated xhci_giveback_urb_in_irq() to
keep xhci->lock held across usb_hcd_giveback_urb(), covering normal
completions, xhci_process_cancelled_tds(), and xhci_hc_died(), while
the open-coded err_giveback path in xhci_urb_dequeue() was missed.

Dropping xhci->lock between usb_hcd_unlink_urb_from_ep() and
usb_hcd_giveback_urb() breaks per-endpoint giveback serialization: a
concurrent xhci_urb_dequeue() or xhci_hc_died() can acquire xhci->lock
and queue a later URB onto bh->head ahead of this one, completing URBs
out of order. When spinlocks disable interrupts, unlocking first also
causes a redundant IRQ restore/save bounce into bh->lock, and without
an IRQ-safe bh->lock it exposed task-context unlinks to a same-CPU
deadlock.

Move usb_hcd_giveback_urb() before spin_unlock_irqrestore(&xhci->lock,
flags) in err_giveback to match xhci_giveback_urb_in_irq().

Fixes: 36dc01657b49 ("usb: host: xhci: Support running urb giveback in tasklet context")
Cc: stable@vger.kernel.org
Signed-off-by: Chien Kun Niu <rickyniu@google.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 30ac1bc45..3bca3a91f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1879,8 +1879,8 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	if (urb_priv)
 		xhci_urb_free_priv(urb_priv);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
-	spin_unlock_irqrestore(&xhci->lock, flags);
 	usb_hcd_giveback_urb(hcd, urb, -ESHUTDOWN);
+	spin_unlock_irqrestore(&xhci->lock, flags);
 	return ret;
 }
 
-- 
2.56.0.611.g1030f0b940-goog

