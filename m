Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDF73546F3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644989; cv=none; b=ETjnkkZc1JiUtcEYPeSxJsrOdvggpInK3sHSzMuFX6+jsp8xBid+Kk+/zNGKoF62XocKKb8bWZVC/FQKIx2YYNKAML5X2xB9XqZmcTwZDzoc/d2E5a7lN0WO+jmMg/OygJ6rxWkP67n62L6/uo5/dbhM6aq0DwIFLU4dzUlV7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644989; c=relaxed/simple;
	bh=wOHmL+aSMCizXI5eCNy7a0JbPOFoQHkkra26PNCQttE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqu2MaVIQHIuivEWSDrt7+wnYmuQGtWGa0YR+Zpv3f9AjtXjdBvpWtwSnTEGdD91nanDRmI19gHDV/eSoJXzz1sjhYzOXX9DIMivUW1BNshdCJGjfurYghtnagB3w+0O5pZ6oysDSSixR0bM1USs+ACxswuXWm+valh+Q60/q9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBddbFAQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBddbFAQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49557167508so26951255e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788644986; x=1789249786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCVMoBjhOb7Ok3wVZ5FY6NGTV9ixb6pFAGBj1ywt02k=;
        b=LBddbFAQ3Mh6Rf7kJn6t42CAuyIXNbCGGbft3eXpUGaxmhWV00iAaJTgibYwO38Uql
         8xcF5fvUEjHlKc+crvh+XfzaYCy5311AMma3Wk0SyhYpRe/e0aa2aYzx1I9mBrc3QPIj
         EapASTjgShnT5NxHYdp8vG5m8jIIFlk6X5h2eAv6ENkCc16YPKC08jNiVqLHe/ELnVSo
         vR6jJLVjZ/dVAtFjFTMlHiiGN3/JmqIPAD2o8WqYWFP6WVELRa13RsEqWzYJCxJO1y93
         r1R0W+aGOkb5zBUStTMwlpY0EEXr4ATt5Tq+w3CshZyVv+/nZEGEmjomyN5AB6u65mdT
         GyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788644986; x=1789249786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCVMoBjhOb7Ok3wVZ5FY6NGTV9ixb6pFAGBj1ywt02k=;
        b=TpO4JWuXKRg4L+jaDeah6AbWUb+oHI7JEP/Ae7Belm73IdL+Jj1WhfYOw+ovJldIgN
         L7GnjUj6XWypP9P3Jo0QmcIjBLH24gVXMGJYd30ELXeNrXi9+PaCLI1NMBFAyKB53tii
         HSf4oX4sRBWlcluy4/t+EHqtGqV+zi+Be/hrR5mdTXXLy7V28vduV/iB3FmC4iEvVyCQ
         As792SxBYHZRTqBA4y5UvPXyenIuKKZg4l8mNbOjinZhnYzpUQzyQMpUtmtIIWcgIT64
         L05LBiUcvA//qAdOw4wlYTy8OjwqgoOxnpNnzSiWtEb2WP8oaQ+ya2mnfSxPhHDrKFto
         bAJg==
X-Forwarded-Encrypted: i=1; AKwUvBxg4x7z7tiXM4n1ekb/6aS4Bgh81vVcnXxT4YAwRpcFxIev5eBLGzUrcNN/T0iD8IyDxdfpjA91tFHk3qs=@vger.kernel.org
X-Gm-Message-State: AFuF++lFoEaN7rVUnynaeBaGdv87aN/XwWIn6BEojpvymz5qQH856zzt
	1Ww9qFBe9fwIrWnELxuvEivBIHyaXxu1bFWgXwqZJd3hveuH9aJIzqJnhWV2sA==
X-Gm-Gg: AYBFou3SOI3NHUQYpeh5mo2oOknWigITvNH0xDBY26oUl9IcWz9wuNWZYzf9lfio2fh
	7Uyt0clZJX0CZf53iq1Bpl9ZRVgncjG62zYqMNr3alRXabx22nou8ebw15o4BPWyhpsCHLtdtfM
	NrZoi/CSsAdK2wxep59Qeyj55v357YtXF+sxH0qCWbay0Vl7bjnL2B0Z9j1QstCldvyWG/qoQrY
	uI/cxpwqyo4QMG18+9AgSm01ajyTA+GXW3Cv6iQkYRWGBk57Bn6uKqc23YMawVTXe59RnJSsc5I
	M6DALNbNEI3ddCDuQx37TXbdcXP+0IA5POC4+6LqTYQimihRjx4J66mfvCFF+wVRE4Z6oZv02OP
	1R+RNAgvJBTuqjjDYwmcQ9BRj9xezBu8cJx7V8TKocjSnJJrvVXE/VG31EXhdOcXNJLDv0c/yDs
	Ci4HHA88pJ5dBtwDj+hDYbR6flPQG4sUFO/4KV5812GjJJ0+8Fzi3yE+R18sFHFKZlRbx4CQ==
X-Received: by 2002:a05:600d:6450:10b0:49c:ffaf:95a1 with SMTP id 5b1f17b1804b1-49cffaf95c3mr130492025e9.1.1788644985856;
        Sat, 05 Sep 2026 14:49:45 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm241296655e9.5.2026.09.05.14.49.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 05 Sep 2026 14:49:45 -0700 (PDT)
Date: Sat, 5 Sep 2026 23:49:42 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wakasio <scarabeeta@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec
 0789:0308 during DVD+RW recording
Message-ID: <20260905234752.1f0c9c83.michal.pecio@gmail.com>
In-Reply-To: <20260905134555.168362-1-scarabeeta@gmail.com>
References: <20260905101837.4b7849c5.michal.pecio@gmail.com>
	<20260905134555.168362-1-scarabeeta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  5 Sep 2026 22:45:55 +0900, wakasio wrote:
> Hi Michal,
> 
> I applied your patch and reproduced the failure with all three debug
> functions enabled. Result:
> 
> Cluster 1 (ep 2, at the very start of the write, unrelated as you
> said): same as before, 4 Stall/Hard-reset pairs, spread over about
> 323 ms, roughly 22 seconds before the real failure.
> 
> Cluster 2 (ep 3, the real failure), with full timestamps this time:
> 
>   17:38:44.749474 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.749743 Soft-reset ep 3
>   17:38:44.758367 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.758454 Soft-reset ep 3
>   17:38:44.768370 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.768577 Soft-reset ep 3
>   17:38:44.775052 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.775217 Soft-reset ep 3
>   17:38:44.785047 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.785313 Soft-reset ep 3
>   17:38:44.790469 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.790732 Soft-reset ep 3
>   17:38:44.799187 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.799346 Soft-reset ep 3
>   17:38:44.808558 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.808720 Soft-reset ep 3
>   17:38:44.819176 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.819317 Soft-reset ep 3
>   17:38:44.832378 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.832552 Soft-reset ep 3
>   17:38:44.850677 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.850815 Soft-reset ep 3
>   17:38:44.861706 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
>   17:38:44.861938 Hard-reset ep 3
>   17:38:44.981704 usb 6-1: reset SuperSpeed USB device number 2
>   17:38:44.998378 Stopped on No-op or Link TRB, slot 1 ep 2
>   17:38:46.645044 clear err_count at ffffd52c40707000
> 
> It survived 11 soft-resets this time instead of 4, then hit the raised
> limit and hard-reset on the 12th. The gap between retries grows from
> about 9 ms near the start to about 18 ms near the end.

Yes, "survived" 11 attempts at resuming operation, without making any
progress. Looks like the HW got stuck in some invalid state - device FW
crashed and stopped responding, or the host controller flow controls
it wrong, or they somehow disagreed on current sequence number, IDK.

No idea why this only happens with this particular host-device pair.

This may very well be a HW bug, but maybe one more thing worth trying
would be this second patch (either with or without the previous one,
doesn't matter). I'm aware of one thing the driver does out of spec -
maybe it confuses the ASM4242, maybe it's unrelated. Let's check.

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 83ed26c4f9e4..0e091d5cce17 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -381,7 +381,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 		return NULL;
 
 	ring->num_segs = num_segs;
-	ring->bounce_buf_len = max_packet;
+	ring->bounce_buf_len = max_packet * 16;
 	INIT_LIST_HEAD(&ring->td_list);
 	ring->type = type;
 	if (num_segs == 0)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b9d005ca5877..fa2480c83dd9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3537,15 +3542,13 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
 
 
 static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
-			 u32 *trb_buff_len, struct xhci_segment *seg)
+			 u32 *trb_buff_len, struct xhci_segment *seg, u32 max_pkt)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	unsigned int unalign;
-	unsigned int max_pkt;
 	u32 new_buff_len;
 	size_t len;
 
-	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 	unalign = (enqd_len + *trb_buff_len) % max_pkt;
 
 	/* we got lucky, last normal TRB data on segment is packet aligned */
@@ -3690,9 +3693,8 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (enqd_len + trb_buff_len < full_len) {
 			field |= TRB_CHAIN;
 			if (trb_is_link(ring->enqueue + 1)) {
-				if (xhci_align_td(xhci, urb, enqd_len,
-						  &trb_buff_len,
-						  ring->enq_seg)) {
+				if (xhci_align_td(xhci, urb, enqd_len, &trb_buff_len,
+						ring->enq_seg, ring->bounce_buf_len)) {
 					send_addr = ring->enq_seg->bounce_dma;
 					/* TD bounced at least, and last on this seg */
 					td->bounce_seg = ring->enq_seg;



