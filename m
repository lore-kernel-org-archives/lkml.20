Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC544A3FA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348313; cv=none; b=DSzEqLM8rFfTYUbvlEJelcHOS7J22+cDYRMGzh6qH5T49un/NJsAWKlW5IaHGdHyO8yRoQHIUBlShhHMkWS7L1U/Zvu7vF7JIMy/cpFp22N67ppFhPxi1LznR1Ikv5geuQqJwvpff17mC1HvpJmlf8en9Wo/w5uWr5vyKbDxT7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348313; c=relaxed/simple;
	bh=lFtxf8JZBoasBd9xvqhcN50c8gfwx5WqOr6trxt5JU0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hN60ETYXsoMHPfrdQYe+Gf4UfI+qBGgNyPGX/CNCRagB05JbWUJykvD79oRVprs1Mx4zRFszppJzJxG8xv1aviNTcp1uy1+BBOPSR6t8w/z3mOZVCrhv9iSaGVRYLgjfoiXUAAH4DrOAExS3QZrLZ7GkqQ86LlbSeuxWnrqllQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSSvD/LV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSSvD/LV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482f9309813so942508f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348303; x=1788953103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qndJplFw7niD9IAJKi5k3Tb9rHK8G3tVrEh0TSYMEcY=;
        b=bSSvD/LVthgXzLaJ1DoL0vVuokofjLjiJUeNcdCQgnPm9w63xywaYTn3HC4GFcgykS
         pi1D6RLCVmtPuOpn9iWAJ1b3w46qJjPnlDn2KvNxV7GBAsfpqelkwo3pnog3WRuKCSYk
         pFCOdrb7OVagFuxZ+5QewSLxQea1glHxoduaeVHknkcdIEtlNZvGAy/QXMQxApBY/8vl
         k2tho5eraeBLp6QacRk9yaX2oohtS7pLmSxzPeXE8EOx2SNqQKSdLP3gmDNv9ZUfB2zg
         hrzf3DlgyB6hulvzFc1M6kMVeHtrPyo67zx+CDyGNBYdes1I7hDXNh7RNMMGmHm/jRym
         lfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348303; x=1788953103;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qndJplFw7niD9IAJKi5k3Tb9rHK8G3tVrEh0TSYMEcY=;
        b=YVO/QA2ymhfs4aL8oGkZx8dEFQs2xHtWSUsp+w8OhfqyN33MurR3zonkyZLeeHyez9
         6MmFY0helKUkIw2ReLLveehh8sjzAoz7HQDWphdbqQd/iBjlMvwK6F42nDdksU8Iv2c5
         sOxZu8hhFiKZwCaXC6dikNPGTmQ3GgxfpQAPNJpglQHL6sV5QN08ujYbeg8ktqlVkAgt
         LT9/b0VnaroF6C8z8cwBcrEu+ZTEn0NauLK9UcgAXXABjEeezcru2wxJqxH2npWhRkXo
         52kRImf0c/rXIbAyf5RFlKwcJb7xhMHGYa4J6PvrOPHUCuqTNAsjjf0RYuQByC7cEv4Z
         MOqQ==
X-Forwarded-Encrypted: i=1; AKwUvBylWIt1YHQFeVJvg6+bjTstdwNCNv5RaF74oNZI3EMsZ9rZe0E838UvMRLRsqpZJ6uMq81SD8B6DkBiHy4=@vger.kernel.org
X-Gm-Message-State: AFuF++keBNsHu5Segtbea3aSipbwvMVZFKkaEtGjIPzR0K38vp4Ju6pR
	SDUEWccQcoIEAPsSxMt5Fk6lmGpgRPKOeW8zIX32V60syZPPCGCyZbLc
X-Gm-Gg: AYBFou14LvJovQLhDzU6GVIgYDWtN5daur8EKf43w4sVMuokqxF0Ku0slkB5qhL4vnl
	JI+i6+2g+V/7cSVof0OsGE1gNF4vmAOIgJhLMGtyuASvlwIL9gbXTPvPyOtkKZs6uDWug003MCD
	y/D+xMYgXTtRslMAY2FIFIyeELYKsNXUs6orrTckoJk34Ye2lUOkgq3L+JQ9ADYfQBGTKYzkfDv
	tfgrGF/SEywZ1N7JYp+qYFwIrhSI30aJgsxp/ISQEBXvWtutFJglAPzBt0fAhHAFf6TlxK2rpYp
	2xYxFtMmNeaQASSdFREynY9/mdTprNXxwRqCnvtEXOUJvgtDwyhVp7H16iFDgcO1CSoqdRbyjIh
	Tk2Z/H1mXNOenaC8uxQU7sVwUXNcPmzmu9x90SSWwPmR2WHToyI4CmSUHjb4Fcjt5ky5lLTs9eD
	cTuVXgw/H+8Ps34gS31sGcVDFW5WV3/Qhq+xtMIDVW0Xr0WM4TmfbE0UFtHAV+R8ycvS+LuA==
X-Received: by 2002:a05:6000:2512:b0:47f:fb2e:f63d with SMTP id ffacd0b85a97d-48488f03964mr9001865f8f.9.1788348303315;
        Wed, 02 Sep 2026 04:25:03 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72f02sm5619073f8f.3.2026.09.02.04.25.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 02 Sep 2026 04:25:03 -0700 (PDT)
Date: Wed, 2 Sep 2026 13:24:58 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: co <co+fd80bc5967eb22c3@bugs.sh>, "Mathias Nyman"
 <mathias.nyman@intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Fix bounce buffer overflow
Message-ID: <20260902132458.5de2f031.michal.pecio@gmail.com>
In-Reply-To: <20260828002440.312ec0b6.michal.pecio@gmail.com>
References: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh>
	<20260828002440.312ec0b6.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

High-speed devices with out of spec 1024 byte bulk endpoints exist and
are allowed by USB core, but xhci-hcd always sets packet size to 512.
The exact nature of these devices isn't documented, commit fb5ee84ea72c
("USB: Accept bulk endpoints with 1024-byte maxpacket") only states
that they "don't work with xHCI host controllers", whatever it means.

But somebody (or a malicious device) can try, and then the driver will
allocate a 512 byte bounce buffer for this endpoint and may write up to
1024 bytes into it if particular scatter-gather URBs are used, because
xhci_align_td() obtains packet size from the descriptor. Fix this.

As a side effect, TRBs will be aligned to the packet size chosen by the
driver on all endpoints of all speeds. Alignment serves the xHC, not
device, so this is fine. Only out of spec devices are affected anyway.

Reported-by: co+fd80bc5967eb22c3@bugs.sh
Link: https://lore.kernel.org/linux-usb/D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh/
Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case with a bounce buffer")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

Trivial bug, trivial patch, though only tested for regression with
an in-spec device, testing with the malicious device would be helpful
to confirm that memory corruption is gone as expected.

As for actual devices with 1KB packet size, I found that Cypress FX2
can generate such packets and some HCs receive them, though others
reject the Configure Endpoint command and usb_set_interface() fails.

So we could support that, but this code really should just use the
packet size selected by the driver instead of guessing.

Perhaps the same should apply to other users of endpoint_maxp(), but
those just calculate some TRB fields like TD Size, nothing critical.

 drivers/usb/host/xhci-ring.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b9d005ca5877..fa6684746305 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3537,15 +3537,13 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
 
 
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
@@ -3690,9 +3688,8 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
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
-- 
2.48.1
