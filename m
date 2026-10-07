Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD87440621
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359560; cv=none; b=i7leQYGMRzatVMCG/fw4K45aHT5vcPHCqu2pFXPpE+cbEi7eSOVEsCDNFGJF7Adxa61QBjUjlCPGJX7YudWt7kXeQWk5wHCMue7RUMlriAMMZ1CSXQqIGoZyEx4AmAUT81zYLCRB5VrY0Dcvgrl9TQGl0x25RZLvnwnCC3D07H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359560; c=relaxed/simple;
	bh=fCjDsnsv7Oa1EGukhmDXY+vx73DdlDLmS/VKampFPY4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lam7FvABaXUFIHfpYwfdbJpb/+QDpdbfkMmoHxf/zsm85k7LrfE3pE6XVXUsJKuqX7zl/jENTKUZdogAw2CfUd0leMMeWAyQEFpwCD0eFmiEgCzMKq3im1X+cZrGxwreP/EzpZ4HJ0CwdKvKjytlZgvm1KHcaAenX/t/ZTuJ0Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPurIfka; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPurIfka"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-486e8faff03so769310f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791359549; x=1791964349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9aohISJtZVzgsAGjTrp/nCpHM5VVlx0au3SDXR5jaMs=;
        b=NPurIfkapfB5gQiec3cPefv+azY7d65GSm8mmXbRySBHWmQHmgdZTnbXNEI7+AZd72
         vTfZl8b8TMs9TRLBxbofj7URoTAPgdg8rVxZw+piJpSyQOPgCm2Uff4rv/7HjWIznbnr
         cQo4gaqXnJA7AAQDDbA+h3AOPvlNTyEb0haEjADCiFkzdJgXZzp1a4rtXXoUtNm0k7Ur
         teaRcJ80cXtHRQ4YcPLk4d8VOvStHg7CwPlavHLSUvBlHHpMkZXoJP3OQ86dVskGcbpa
         WVgirvb3clIAV1+ow9luQldE5xLG1/s6BfRQaC3F6ollnezlx0Q8GtFJZPK/DvdQdi7K
         RNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359549; x=1791964349;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aohISJtZVzgsAGjTrp/nCpHM5VVlx0au3SDXR5jaMs=;
        b=bPy3kNue8kKZs3v8L6NOlDrow/HR7X7POo/UgDymBQ19iAuaednbM4mX36cgNp/bQl
         78YGuFfmEUbvSRR+OXzIorSDXUgAsl943+WFhA9NiGQ9heZykCjkRCXRIzaJanoqtc9U
         XZhLwOdMmaPmPHBnv8iwTZqBpNCwQjjFLIVTlEzrQVj+gWqMMv2sxuhzxQywCwAPiAKM
         X8qcRwQ9ABrQxKYseVgQrs5009j1jFK35Ch7TVHzwi9bPxeIZxIe6wNBTBW9W2QnLZJE
         /Kz6b/4kUtuOxjyu02FYPFmA8z8BSw+PApaL9Kz4nsF9DmIIlOs21wrFQhi7219Esxhy
         xCLA==
X-Forwarded-Encrypted: i=1; AKwUvBz2rW14UrOl6Jd6avN1HwD5YU4uomLSXeqYdUrRAkabBG+aD5lSPX+8BCHlYZm5kHLjYyRU/ZMBDH7HNO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqQEcLjIfy6O0LnlEFwhvZOlSOO65JdRbDgCg00Z6Btycqm8hS
	IiUiZgoQ6YUl/WF/0Fpx0keUk2GAljlBSMHUe57NDkDKFSsdiuGuvj5I
X-Gm-Gg: AYBFou37X7VI7C3eTugefG/f/YXq8pRH4Lyh0Lak2f5oXs9wGL2PXVi51rqC7fCu/+n
	4WPfWzsjyjmV3GxiqsEWiz0t9Pwh0PDUYe9uSEB9PcAGiNK/+DzL37EugDi4bD2/QmwD1fspH4e
	tByXrcMCZ2q1urTXz9G58ndc5heeXXOUrIDCPOaD2VXqiYXdXyriiaY7ZAD+z3C6ZXULDce3kWm
	9Yy6JlIsEsmGeLRE8B7bVo90wtwMk/xmfdoD8gguv72hPttg5iO21TJtjlX3cq0ADIHcZHz5dHg
	u3QzoryCwTcy5MIkoTvazVGn6FX0vvKymqQYL1mQSfVavZ6pD+GWxOkNOe8jneobEnqpRW5IG7k
	aEho8Bfxa8MSudCxc5AEXjgC90tbBU0tPjsRRRSdRCNMs2TtweUN1rmrDYPlAuLjHbFx/hprh/3
	Lf2uJbPxPpdmVnT4cbxajz1DgZ50YoBhE/camlEuhPWHt9KeQtqtf+SwsqKMs8Q5KHHVHwxdaIQ
	+99m4ie9Q==
X-Received: by 2002:a05:6000:987:b0:488:8a5d:ffcc with SMTP id ffacd0b85a97d-48c7275b6bbmr2701238f8f.13.1791359548852;
        Wed, 07 Oct 2026 00:52:28 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2044fsm3928831f8f.31.2026.10.07.00.52.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 07 Oct 2026 00:52:28 -0700 (PDT)
Date: Wed, 7 Oct 2026 09:52:25 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] usb: xhci: Rework and improve the TD matching and
 skipping logic
Message-ID: <20261007095225.57dd3683.michal.pecio@gmail.com>
In-Reply-To: <20261007094952.28bfa51e.michal.pecio@gmail.com>
References: <20261007094952.28bfa51e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Matching events with TDs and giving back missed TDs is carried out
by a complicated loop. Replace it with a simpler linear logic:

0. Having verified that 'td_list' isn't empty,
1. Scan it to find the matching TD and count missed TDs,
2. Perform necessary adjustments for corner cases,
3. Give back missed TDs, if applicable, using a short and tidy loop,
4. Check if the event refers to the expected TD and proceed as usual.

Besides cleaning up the code, this provides a few improvements:
- when the skip flag is set, no TD is given back unless we found a match
  or otherwise know how many TDs should be given back
- when the skip flag is clear, we know if the event refers to a "future"
  TD so we can log this in the Scary Error Message to aid debugging.

While altering the error message, drop a pointless goto.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 137 ++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 76 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 875a0770a3b7..2ea1c7dc1574 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -127,11 +127,16 @@ static bool link_trb_toggles_cycle(union xhci_trb *trb)
 	return le32_to_cpu(trb->link.control) & LINK_TOGGLE;
 }
 
-static bool last_td_in_urb(struct xhci_td *td)
+static int num_tds_not_done(struct urb *urb)
 {
-	struct urb_priv *urb_priv = td->urb->hcpriv;
+	struct urb_priv *urb_priv = urb->hcpriv;
 
-	return urb_priv->num_tds_done == urb_priv->num_tds;
+	return urb_priv->num_tds - urb_priv->num_tds_done;
+}
+
+static bool last_td_in_urb(struct xhci_td *td)
+{
+	return !num_tds_not_done(td->urb);
 }
 
 static bool unhandled_event_trb(struct xhci_ring *ring)
@@ -2606,14 +2611,19 @@ static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
 	}
 }
 
-static struct xhci_td *find_td_by_dma(struct xhci_ring *ep_ring, dma_addr_t dma)
+static struct xhci_td *find_td_by_dma(struct xhci_ring *ep_ring, int *missed_tds, dma_addr_t dma)
 {
 	struct xhci_td *td;
 
-	if (dma)
+	if (dma) {
 		list_for_each_entry(td, &ep_ring->td_list, td_list)
 			if (trb_in_td(td, dma))
 				return td;
+			else
+				(*missed_tds)++;
+	}
+
+	*missed_tds = 0;
 	return NULL;
 }
 
@@ -2630,8 +2640,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	struct xhci_ring *ep_ring;
 	unsigned int slot_id;
 	int ep_index;
-	struct xhci_td *td = NULL;
-	struct urb *missed_urb = NULL;
+	struct xhci_td *td;
+	int missed_tds = 0;
 	dma_addr_t ep_trb_dma;
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
@@ -2814,13 +2824,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
-	/*
-	 * We don't know how many TDs were missed when ep_trb_dma is zero (as permitted by
-	 * xHCI 1.0) or bogus. Bail out leaving ep->skip set, next event will sort it out.
-	 */
-	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !find_td_by_dma(ep_ring, ep_trb_dma))
-		return 0;
-
 	if (list_empty(&ep_ring->td_list)) {
 		/*
 		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
@@ -2840,66 +2843,50 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		goto check_endpoint_halted;
 	}
 
-	do {
-		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
-				      td_list);
-
-		if (ep->skip) {
-
-			if (!trb_in_td(td, ep_trb_dma)) {
-				/* this event is unlikely to match any TD, don't skip them all */
-				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
-					return 0;
-
-				/*
-				 * If skip flag is still set at xrun, we are on xHCI 1.0 and our TRB
-				 * pointer is zero again. All missed TDs can be given back, but we
-				 * don't know which were missed and which were queued after the xrun
-				 * occurred. We can safely give back the first pending URB.
-				 */
-				if (ring_xrun_event) {
-					if (!missed_urb)
-						missed_urb = td->urb;
-
-					if (td->urb != missed_urb) {
-						xhci_dbg(xhci, "Skipped one URB for slot %u ep %u",
-								slot_id, ep_index);
-						return 0;
-					}
-				}
-
-				/*
-				 * TD was missed, skip it. Core already initialized frame->status
-				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
-				 */
-				xhci_dequeue_td(xhci, td, ep_ring, 0);
+	td = find_td_by_dma(ep_ring, &missed_tds, ep_trb_dma);
 
-				if (!list_empty(&ep_ring->td_list))
-					continue;
+	if (ep->skip) {
+		if (!td) {
+			/*
+			 * xHCI 1.0 allowed MSE events to have zero TRB pointers. Some old chips
+			 * also generate bogus non-zero pointers. We know, don't bother warning.
+			 * Missed TDs will be given back by the next event with a valid pointer.
+			 */
+			if (trb_comp_code == COMP_MISSED_SERVICE_ERROR &&
+			    xhci->hci_version <= 0x100)
+				return 0;
+			/*
+			 * If skip flag is still set at xrun, we are on xHCI 1.0 and our TRB pointer
+			 * is zero again. All missed TDs can be given back, but we don't know which
+			 * were missed and which were queued after the xrun occurred. We can safely
+			 * give back the first pending URB to let the class driver know.
+			 */
+			if (ring_xrun_event)
+				missed_tds = num_tds_not_done(list_first_entry(&ep_ring->td_list,
+								struct xhci_td, td_list)->urb);
+			/* In other cases missed_tds is zero */
+		}
 
-				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
-					 slot_id, ep_index);
-				ep->skip = false;
-				td = NULL;
-				goto check_endpoint_halted;
-			}
+		/*
+		 * Give back missed TDs. Core already initialized their frame->status to -EXDEV
+		 * and frame->actual_length to 0, nothing more to do.
+		 */
+		for (int i = 0; i < missed_tds; i++)
+			xhci_dequeue_td(xhci,
+				list_first_entry(&ep_ring->td_list, struct xhci_td, td_list),
+				ep_ring, 0);
 
-			xhci_dbg(xhci,
-				 "Found td. Clear skip flag for slot %u ep %u.\n",
-				 slot_id, ep_index);
+		/* the list may become empty on ring_xrun_event */
+		if (td || list_empty(&ep_ring->td_list))
 			ep->skip = false;
-		}
 
-	/*
-	 * If ep->skip is set, it means there are missed tds on the
-	 * endpoint ring need to take care of.
-	 * Process them as short transfer until reach the td pointed by
-	 * the event.
-	 */
-	} while (ep->skip);
+		xhci_dbg(xhci, "Skipped %d TDs on slot %u ep %u comp_code %u, TD found %d, skip flag %d\n",
+				missed_tds, slot_id, ep_index, trb_comp_code, !!td, ep->skip);
+		missed_tds = 0;
+	}
 
 	/* Handle events not referencing the current TD */
-	if (!trb_in_td(td, ep_trb_dma)) {
+	if (!td || missed_tds) {
 		/* TD was queued after xrun, maybe xrun was on a link, don't panic yet */
 		if (ring_xrun_event)
 			return 0;
@@ -2926,7 +2913,13 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		}
 
 		/* HC is busted, give up! */
-		goto debug_finding_td;
+		td = list_first_entry(&ep_ring->td_list, struct xhci_td, td_list);
+		xhci_err(xhci, "Event dma %pad for ep %d comp_code %u not part of TD at %016llx - %016llx, missed %d\n",
+				&ep_trb_dma, ep_index, trb_comp_code,
+				(u64)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
+				(u64)xhci_trb_virt_to_dma(td->end_seg, td->end_trb),
+				missed_tds);
+		return -ESHUTDOWN;
 	}
 
 	ep_ring->old_trb_comp_code = trb_comp_code;
@@ -2964,14 +2957,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	return 0;
 
-debug_finding_td:
-	xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
-		 &ep_trb_dma, ep_index, trb_comp_code,
-		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
-		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb));
-
-	return -ESHUTDOWN;
-
 err_out:
 	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
 		 (unsigned long long) xhci_trb_virt_to_dma(
-- 
2.48.1
