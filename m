Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399794;
	b=0qugjk1yAE75pPluMFIVgT7O2exZeREKiqJybr41LfGAotkLEcd54OlMvpKpmzUkeSbW
	 LliNVco0rt0VrA9IryNipAlUEi/LCWMNWWDC2bnAKI6i+o312Gv82IpQjB3d3XG5jdMiP
	 6JhlMn4dPMpmQmeigloJoRw/uyHEg2MZME54JozW03HwbRW+EzvklmiscPvE5K51U/O1O
	 ovVldN+RZDTIudRPQOT/6U1yd8xtdTAt6tgYChktEwJTtRno/pvXD0ZfXRVMPEhjKsZKn
	 bmb9KnRhtKDDpcsXA6H8FgX0GbjktXA5kRmM7kLgZKu0UkNzVC7bCdthNE2Ax2Xsy8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399794;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=8yT5RQn07qxJIcLtF1+NCilgjj5UsIVp9Ozf/hILwJI=;
	b=k2RrE1VvqCC9xXc8rI4V4B0i1J1UPAHGrCi2BpOHqan4rNcevHSh3A9AZAnxMoFeJLb7
	 Y1EPZ4jhQ56gwUgVecoGOGUd2mVlLHCnZnGFH0+PFj+ZBQa+Xr6z3HjXf6EUXUg83G2of
	 6q7m3vBhaU775Hk9xlOxIvG2053R0m5OO7pENgjebS37XcSx0VWhO6UOsA2WDKwLyQfM7
	 KbjKxGGfMbTrMUyaYwrg0KEw22Zo7fwHdFNSwYUGb46i4Hwhlpg/R/B2DwvM0zLQjK0qO
	 YMM0xtaP2jhaiK+P42m3hQGM3Lw1Q6KKlY0npBBXjHsPi/6QVaYdyz3ZeidXajtjEoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=PKbGPA9U;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A4D606A32E;
	Wed, 11 Nov 2026 12:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A4D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=PKbGPA9U
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54502a16f;
	Wed, 11 Nov 2026 20:23:09 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: pch_udc: Fix potential ep0 DMA descriptor leak
Date: Wed, 11 Nov 2026 20:23:08 +0800
Message-ID: <20261111-e5624093d6-usb-pch-udc@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1ca8fe13c03a1kunm9ed480831b365d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0pDVkhIGUtDT01IQktOSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=PKbGPA9U9jMcZU152VsbhOLasx96y/RXB+4jQbFqRNNdTYyPfXDUfj97wK7iNOIzy5bk9W3vwQLfxzVK1Zsn3AeqH0x7Y8AD2KttNSsockOiU7ojMPz1qfYN4gOtKqGEDXTggd9Q0pO0ecmT7f5SOqnoNys6ApdO9nAx5A/TC6I=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=8yT5RQn07qxJIcLtF1+NCilgjj5UsIVp9Ozf/hILwJI=;
	h=date:mime-version:subject:message-id:from;

Removal destroys data_requests while the ep0 data descriptor is still
allocated, then tries to return that descriptor to stp_requests. The
busy data pool cannot release its DMA backing memory.

Return the descriptor to data_requests before destroying that pool.

This issue was found by our static analysis tool under development.

Fixes: f646cf94520e ("USB device driver of Topcliff PCH")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/usb/gadget/udc/pch_udc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce28210f..5996f1d16aed 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -2989,6 +2989,10 @@ static void pch_udc_remove(struct pci_dev *pdev)
 		dev_err(&pdev->dev,
 			"%s: gadget driver still bound!!!\n", __func__);
 	/* dma pool cleanup */
+	if (dev->ep[UDC_EP0OUT_IDX].td_data)
+		dma_pool_free(dev->data_requests,
+			      dev->ep[UDC_EP0OUT_IDX].td_data,
+			      dev->ep[UDC_EP0OUT_IDX].td_data_phys);
 	dma_pool_destroy(dev->data_requests);
 
 	if (dev->stp_requests) {
@@ -2998,11 +3002,6 @@ static void pch_udc_remove(struct pci_dev *pdev)
 				dev->ep[UDC_EP0OUT_IDX].td_stp,
 				dev->ep[UDC_EP0OUT_IDX].td_stp_phys);
 		}
-		if (dev->ep[UDC_EP0OUT_IDX].td_data) {
-			dma_pool_free(dev->stp_requests,
-				dev->ep[UDC_EP0OUT_IDX].td_data,
-				dev->ep[UDC_EP0OUT_IDX].td_data_phys);
-		}
 		dma_pool_destroy(dev->stp_requests);
 	}
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
