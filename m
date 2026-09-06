Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FDE378D8C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689711; cv=none; b=q8xg0LSmIt5P4Ro4ZkOL8jAflm/lDn3DpMMcinJr+LXOkK6wR2Yp9ms7kogxcMEEi4Wa8B41HdNYJD/WBUntLV4N/ON11KrCWTHU266cE4Q81hFWB0g4tSRUbgEUkZJgOqnUlkyiCFXNwwPe+dxv1TGI/UQ/c3t6o8ZKA5kvQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689711; c=relaxed/simple;
	bh=YwZyzA43y60MiHs/1uqV+qIGlmb3nFRWbJ/1ea3FYh4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PURMN/814cJKtl1WNWPjzEC0yUA2PQUzft75HIi2oq5x9MhfIV8IrdPqVxBrJOGUJdu13InqaE/7HVi5etQsZBGH/ikPmBOPiTUXHzokbXvzwuLWFdkDMwNE7DVSgf1d+690gTOUjO0k37ekkA9+kgImNqqkf/aor44/xhjYZhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nzsxnlnf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nzsxnlnf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso21599325e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788689706; x=1789294506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpR705y++NqAAC8FpbrrQI4IIcfOR7g2O8Oo19MdzTQ=;
        b=NzsxnlnfJ/xRYOoBBQyypjOQW3+7qXIDrRfwUvNHgMDYX5AlcwLlVAT10CocMQs01E
         rAAIG1mAxk7ulLOADsQEBubHvc0WQjGmwq4VH6O5J0mhruFFPOV2ArBKPzJiGMwtOT/s
         Boi7Os/3V0PWCDssDpzqTDwbbz6axcMKwDPybRceICzMokLt9AsWU5zCjxGY0r6ai+gQ
         hBjTreFA+x66RrF+vU5iIHPRag7Cdgob1w7Rsny7msw10mKkAdFdExZQkYKGHEmWenEf
         vjNfMPAtblIOEYgLWzP26T5/P/noACjksvxMOh9Uu3czaFIbpILl2HdWTSKhNj1qAfYR
         EEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689706; x=1789294506;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpR705y++NqAAC8FpbrrQI4IIcfOR7g2O8Oo19MdzTQ=;
        b=K5L7i2PSUVAXWp/pbD0M0KO9KuhPqdhh+xXCHimkQkb5VJZqQHKMtx5X661SdHb4z3
         eu3tyyZbAWL0L2L0/sZp97zhv5byrVDWlwXTqKHfidNoXPgIcnaD5ZIhghEWrpwOU22g
         NNxOM67cGcoax8xGwuBtd1ckfcSoSl1rUNNIARXuTtexg63HCWDPu+zHhid0e9Gw/RCF
         FyVfcjrgBYo5PVd8wipCrcJIpixAQWJ/aGQ2L5V28ypwXgJGYag/atGOlX8hYNkOdKL1
         sFY2N167/4wM0B2U/waN1EKWcNb6fP0Q/xm2nyO1TZ2/0+J6z3ktUcVZJf4f3YKdRrdt
         d81g==
X-Forwarded-Encrypted: i=1; AKwUvBzOkZ5xAlXPtYzOutLmqoJsfnmEg4ILyIv6gbGYC+7Y/FGQpV52eVYNxtI3GL0pe7THJbh4kz8hdPy8iZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lu+dGK4u8F2KOjiRg/f5vgjdpIZUvUATM7BMS6GFX7VY1TJs0e
	dyoN5u7UPmrhlJollpW2AZ9FcWiUyBohQyxCr2TGP2qaVdWxxBk8CACh
X-Gm-Gg: AYBFou2k6CH0NHcmV/kzbISP+qTev6y/gqrepjU+9Qh62L+QMsdtd9+yu06/GlS2xmt
	e/EKvHqOlaFqGwkQi7xK89r0j2MoM1d4layxNOuk8lA+yOjgUYh1ljjNf7+R2M8OPyP2HJh3ZeT
	edgL26ezIXm9TOB95D6+ss+nbsPRiT9GcsOzAThXItNZZu+yqnX0AyPAmf1/mHx45GtQapGgDKe
	LUkAwuABUn8zPBnkfawoD36ngI2Ydq+oBlIFkgMsfMIRmkUdO72KZ8M6FpgVRHjuYlmIL54BOmn
	vs2MGn1TIATo3oSgRpqN1619pcqld5RtIG1sHcmkI5Kk6b1AzyFwGLThmztTpw5RFvvGYA93uX7
	8wSTjEWafIWIElcF7oVJIn91MgJQA70PtaIQOsuQi+QxwMSb03hDqHKsXTRgyzHhgNlFnEIDfte
	8vKA4XojulAaTIQgHZW0lky3WmIqdvDuSAn2suKiJH8GM+9juE10NeeDqFZ23O2a3A3oFsOQ==
X-Received: by 2002:a05:600c:6088:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49cfc6cc100mr137734235e9.27.1788689706065;
        Sun, 06 Sep 2026 03:15:06 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm191695735e9.11.2026.09.06.03.15.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 06 Sep 2026 03:15:05 -0700 (PDT)
Date: Sun, 6 Sep 2026 12:15:00 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wakasio <scarabeeta@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec
 0789:0308 during DVD+RW recording
Message-ID: <20260906121500.04f06d2a.michal.pecio@gmail.com>
In-Reply-To: <20260906021345.10436-1-scarabeeta@gmail.com>
References: <20260905234752.1f0c9c83.michal.pecio@gmail.com>
	<20260906021345.10436-1-scarabeeta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 11:13:45 +0900, wakasio wrote:
> Hi Michal,
> 
> I applied the second patch on top of the first one and reproduced the
> failure again with the same three debug functions enabled.
> 
> Cluster 1 (ep 2, start of write, unrelated): same as before, 4
> Stall/Hard-reset pairs within about 177 ms.
> 
> Cluster 2 (ep 3, the real failure):
> 
>   11:07:56.930732 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:56.931126 Soft-reset ep 3
>   11:07:56.939018 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:56.939183 Soft-reset ep 3
>   11:07:56.947399 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:56.947686 Soft-reset ep 3
>   11:07:56.955772 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:56.955939 Soft-reset ep 3
>   11:07:56.964233 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:56.964395 Soft-reset ep 3
>   11:07:56.972881 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:56.973060 Soft-reset ep 3
>   11:07:56.981806 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:56.981975 Soft-reset ep 3
>   11:07:56.991162 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:56.991324 Soft-reset ep 3
>   11:07:57.002050 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:57.002211 Soft-reset ep 3
>   11:07:57.015466 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:57.015576 Soft-reset ep 3
>   11:07:57.034026 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:57.034195 Soft-reset ep 3
>   11:07:57.041915 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
>   11:07:57.042019 Hard-reset ep 3
>   11:07:57.162742 usb 6-1: reset SuperSpeed USB device number 2
>   11:07:57.176799 Stopped on No-op or Link TRB, slot 1 ep 2
>   11:07:57.679888 clear err_count at ffffccbbc21e9000
> 
> Same pattern as before. 11 soft-resets, all at the same TRB address
> and the same resid, then a hard-reset on the 12th. A different TRB
> address cleared err_count about 0.5 seconds after the port reset.
> 
> The second patch did not change the pattern. This run failed at about
> 187 MB into the write, the furthest one so far, but I do not know if
> that means anything given how much the failure point already varies
> between runs (0.35 MB to 103 MB before this).

Seems quite random indeed, but apparently things consistently go wrong
after sending the 9th packet out of 32 (IIRC) in a random(?) URB.

I have no idea, let's try one more patch (applies on top of the prior
ones) to dump those transfer TRBs and see if they are correct.

--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2622,6 +2622,22 @@ static struct xhci_td *find_td_by_dma(struct xhci_ring *ep_ring, dma_addr_t dma)
 	return NULL;
 }
 
+static void dump_ring(struct xhci_hcd *xhci, struct xhci_ring *ring)
+{
+	struct xhci_segment *seg;
+
+	xhci_for_each_ring_seg(ring->deq_seg->next, seg) {
+		union xhci_trb *trb;
+
+		for (trb = seg->trbs; trb < seg->trbs + TRBS_PER_SEGMENT; trb++) {
+			char msg[256];
+			xhci_decode_trb(msg, 256, trb->generic.field[0], trb->generic.field[1],
+					trb->generic.field[2], trb->generic.field[3]);
+			xhci_info(xhci, "%llx0: %s\n", (u64)seg->dma + (trb - seg->trbs), msg);
+		}
+	}
+}
+
 /*
  * If this function returns an error condition, it means it got a Transfer
  * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
@@ -2713,6 +2729,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	case COMP_USB_TRANSACTION_ERROR:
 		xhci_dbg(xhci, "Transfer error for slot %u ep %u on endpoint at %px resid %u\n",
 			 slot_id, ep_index, ep_trb, EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)));
+		if (ep->err_count > 10) {
+			xhci_info(xhci, "event ring:\n");
+			dump_ring(xhci, xhci->interrupters[0]->event_ring);
+			xhci_info(xhci, "endpoint ring:\n");
+			dump_ring(xhci, ep_ring);
+		}
 		status = -EPROTO;
 		break;
 	case COMP_BABBLE_DETECTED_ERROR:
