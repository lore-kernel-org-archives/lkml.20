Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85D743CEDD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359507; cv=none; b=M0k6ktH7+s+GXEsKmsfJUWikX8ovZwW6u3VHvPKb3dfoRLhS5tIqEOz1zC0xcE5K8A6QyO+zOw0R9T52nHfxoDsNOJi8nMqZ7t6ZPw4GCStx6zYHjshgY25KhwVIlFTHhng/6cavR20LWyDmc9ZvPfTy9Trbb7LTXN8ztvPbeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359507; c=relaxed/simple;
	bh=sdSAqbCgahmcAPoWTA9qYdtqHRKXWDjVhTUk2ZmbxgI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXgUfqDc3G3X1qnN1nAutYKAyifYoL6LLxbqhc/eUpkkv6yun46lWQt4YERNQQLYzWCz3ZwBYSBy3qkeJ3jel9Qt/XbStdNdfmvNVFZn4zycD1Ir6vouJMlIgTEPqWTO5rCvDIarid0/JBrHL5d3duvuPdS0tTLSEmayw9f0p5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P90TIyIk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P90TIyIk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so13058775e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791359496; x=1791964296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCD0Ma/aUmdecmxgeD5ziiIU2dGW3Peqg0Z9bY5RVLo=;
        b=P90TIyIkFcHcsaxviPW09KCEJV/ejfDpN+VT9RUi2uMU0beex8beQ0NH7GTJXvxZPJ
         DeADjQV0IBDxIhe+feD6NSrosBl7sVhd+D2idcc50vcGnEwf34AwVFWiwWajvc4U5KwW
         5Yc7GEaMTLGYDiAWeN2qe5kUINpL7X6vBxADeS7QxrawM51hT172iaJWFK6IPQN8KAfe
         zx4ct3BHwBG941IaiASJjJ+oIia+maEbYLuvnW6boGfSr0rEXd+I47uV7BvBIPLHeJzW
         ZUZO2Ue8ZTatvuw63aV/v/e8jxMMkczpNPnlTrx+6lewh9/VhSbr3C4C+5LwZmzvFD6P
         Ldgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359496; x=1791964296;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCD0Ma/aUmdecmxgeD5ziiIU2dGW3Peqg0Z9bY5RVLo=;
        b=rVTTOTQnC7Fra6GCpQNtLGBLRwwF7pbCWVI5o9z+mtl2H+YV6zbJOk1gph5ccDy1u/
         VZG7BOw55uQ72GQxVWrD9ATORSeDF3OjGQ3Dzrrfpah+IucN3A4TjEpGmZeXirNY1CBj
         826XEegCy+hdO+F4nrCTWr6QJIQwZ1pXKi3gp9+mwzfsqupqmDxq3uILzM/fKF33iOMR
         +dKssYWX8iwEQMcd5SdNGGDqcVLMhKSMmCmJol3AstmHJKsewzEO3Kpitrrmvy5p5Q+J
         BPSYuPJSBkqltMKvBQUta4BYBe8j8fMsfxILEBDxjx9Zrq/or+GhskXXdWX9jn0VwSa3
         V8hg==
X-Forwarded-Encrypted: i=1; AKwUvByEEVklYoXeK7bZf5az4NV9ieAoZjPXfX5HODQ2aNhn3aMMCgw2UMhw1u11vjJMpD1Qyrh8Ok0bUG2qTow=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ4sgVK4VyS1xjo8RMUbFvPaiNQ6aT175BCmvry/G2EGTT3ODl
	qTkpufzNVNx+LIvvlWNSuB7Mh/5R+WSviX3c/pYuuOoaZR3X+AcLaKWa
X-Gm-Gg: AYBFou0Vlm10aldZh4m9BSEYcdVf3khGvy2vtV9DBrtQMMqUI5rjWqzUI+WdS7cckf+
	tnf26UAbWUUxfblKEtNT28uiVq76U9NMnJZPluCP5W0rTzYXJJxoVTDzRvEp2fazoNGZ99+xsfX
	h3+EBV123U1OBIfYASHYUvJ8PyegJsexHmPF0W42XqHVN88FtyydxaHSTbVsYTfA0F8d2PRLwfR
	2pEbx2LdifAt0yEEdk/UsxppA6UQnaCr7Hm2EO7tRJ0IhrQbLOyXUgRolAuRaRUJdfzCNqBmO7A
	nW6vKlj5TMPJfjBEqNBrXqwWplDSdPx2tcCZ6LFoXSG+ufe6nCEMSXT4aN9ntEaaLL0FLtJA004
	i1Qc+t+L0BNuMXlvwiImj1jQMzSIuB2JTrO828XGZIwEZ9kJczNTtvgERo0be4Hnh87Fa7PXEWr
	iaQCM9Kp0DH9CB15j9d9Yce9g/nriEsd9acbqiPuNnnDw0eitV8bWPa/jqz/Bagbsvcw54wnG5B
	UR/pqcm8w==
X-Received: by 2002:a05:600c:1546:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a180648e92mr19902375e9.30.1791359495582;
        Wed, 07 Oct 2026 00:51:35 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5d8dfsm139137905e9.14.2026.10.07.00.51.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 07 Oct 2026 00:51:35 -0700 (PDT)
Date: Wed, 7 Oct 2026 09:51:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: xhci: Shorten the TD skipping loop
Message-ID: <20261007095132.04638d45.michal.pecio@gmail.com>
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

Half of this loop is code which only executes once to deal with cases
where no TD matches the event and then it returns. This code needs not
to be in any kind of loop, so get it out.

Optimize conditionals remaining in the loop body.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 68 +++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3ae823830fcf..875a0770a3b7 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2844,10 +2844,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
 				      td_list);
 
-		/* Is this TRB not part of the currently executing TD? */
-		if (!trb_in_td(td, ep_trb_dma)) {
+		if (ep->skip) {
 
-			if (ep->skip) {
+			if (!trb_in_td(td, ep_trb_dma)) {
 				/* this event is unlikely to match any TD, don't skip them all */
 				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
 					return 0;
@@ -2885,38 +2884,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				goto check_endpoint_halted;
 			}
 
-			/* TD was queued after xrun, maybe xrun was on a link, don't panic yet */
-			if (ring_xrun_event)
-				return 0;
-
-			/*
-			 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
-			 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
-			 * pointer still at the previous TRB of the current TD. The previous TRB
-			 * maybe a Link TD or the last TRB of the previous TD. The command
-			 * completion handle will take care the rest.
-			 */
-			if (trb_comp_code == COMP_STOPPED ||
-			    trb_comp_code == COMP_STOPPED_LENGTH_INVALID) {
-				return 0;
-			}
-
-			/*
-			 * Some hosts give a spurious success event after a short
-			 * transfer or error on last TRB. Ignore it.
-			 */
-			if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
-				xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
-					 &ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
-				ep_ring->old_trb_comp_code = 0;
-				return 0;
-			}
-
-			/* HC is busted, give up! */
-			goto debug_finding_td;
-		}
-
-		if (ep->skip) {
 			xhci_dbg(xhci,
 				 "Found td. Clear skip flag for slot %u ep %u.\n",
 				 slot_id, ep_index);
@@ -2931,6 +2898,37 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	} while (ep->skip);
 
+	/* Handle events not referencing the current TD */
+	if (!trb_in_td(td, ep_trb_dma)) {
+		/* TD was queued after xrun, maybe xrun was on a link, don't panic yet */
+		if (ring_xrun_event)
+			return 0;
+
+		/*
+		 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
+		 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
+		 * pointer still at the previous TRB of the current TD. The previous TRB
+		 * maybe a Link TD or the last TRB of the previous TD. The command
+		 * completion handle will take care the rest.
+		 */
+		if (trb_comp_code == COMP_STOPPED || trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
+			return 0;
+
+		/*
+		 * Some hosts give a spurious success event after a short
+		 * transfer or error on last TRB. Ignore it.
+		 */
+		if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
+			xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
+					&ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
+			ep_ring->old_trb_comp_code = 0;
+			return 0;
+		}
+
+		/* HC is busted, give up! */
+		goto debug_finding_td;
+	}
+
 	ep_ring->old_trb_comp_code = trb_comp_code;
 
 	/* Get out if a TD was queued at enqueue after the xrun occurred */
-- 
2.48.1
