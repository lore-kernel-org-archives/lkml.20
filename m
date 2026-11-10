Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321158;
	b=Wmskd2aGT6JgQvyjD6gHciBIPPK0qsm3+xRrUkeeUr0h7dPmzoIhdn6sodySIkPnoHMv
	 JI5MQRQwb9/4GP+RIFYimJrcTWXFEvALHG8K/yRqrza0iDNILF/IxlxM1c4zkYyuj5raP
	 U1W91SWMM32or4E5e1Z+n5JpD3BdnsN4azJUhXEm3iPNGpQojOPpAzQY2GZgTBUcG13PB
	 tLbO4nnXnk/ukFfUvJUu5QCJKaQfYjMe4Y/6768R+YPnKAiS+08QyyuInlzHv4x1lSvpC
	 npsUku/XJXgDzjbUKHk0PMPUf7HK40qZUZvDG8SX62NUQNCAlqahOHs4oK/9qgEhfNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321158;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=lTh48j2n8LxqHcVXfIK2MfExpwSXXiijRmCDhm3Eq3M=;
	b=B1C2eZgrNoln4+XRqtS1EXDUKGUve4eMkW0mMkfwoseA/KAwZoW70LPh53lWKdUU0meg
	 xfff0I8i5+/OkH34dTuklEvcB1CDxoyzcoG+GoVzV7uzLzOzLm3O/8WeN82fsyaUmJ65a
	 yyOOBjOyif5dkJSvZ25xlMPq6eO+D6xfP8YX+GgzRgtMAlONHPqvwy11FKwpkp1r8lbKw
	 2PtW421CYk9HNze2AHcqpp3NjqaFqwbhKQN/FX5t2cFiFqbpmtXsU+isAZz+sMVGtT2Ng
	 B1R34HyGwJfcsuD4jHXO+DVvh7RSlONXLx5isZZBaK3Rk7kOiBQCO2Aokn901x+gM0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=EEzwFXYC;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C086606A336;
	Tue, 10 Nov 2026 14:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C086606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=EEzwFXYC
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542cd9c48;
	Tue, 10 Nov 2026 22:32:30 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Justin Chen <justin.chen@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: bdc: Fix potential ep0 BD table leak
Date: Tue, 10 Nov 2026 22:32:30 +0800
Message-ID: <20261110-9f141e6bc8-usb-bdc@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa1c5dff2f203a1kunm3d9f5f4616cdea
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGB4ZVkMdSxlLH0keTBlJT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=EEzwFXYCuFmx0NwODdITszml7r3NjUcGGI6/EV02I+Uitm1oXUMxpHWxzy49CVKVaDiHmmiVu311AVsBeIaXAHhJIleBED76gQVpcIkQzCe4weVCJc0Ux8KgqJD/Uq+BaawqLojHQchf/LwgFXxD1fmJ4fnKws+BenuXd5jtyf0=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=lTh48j2n8LxqHcVXfIK2MfExpwSXXiijRmCDhm3Eq3M=;
	h=date:mime-version:subject:message-id:from;

The ep0 BD list is kept across disconnects, and ep0 does not have
BDC_EP_ENABLED set after allocation. Consequently bdc_free_ep() skips
its tables before the BD table pool is destroyed.

Free an allocated ep0 BD list during final endpoint teardown.

This issue was found by our static analysis tool under development.

Fixes: efed421a94e6 ("usb: gadget: Add UDC driver for Broadcom USB3.0 device controller IP BDC")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/usb/gadget/udc/bdc/bdc_ep.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index a7a22e5ec47b..db176636355d 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -908,7 +908,8 @@ void bdc_free_ep(struct bdc *bdc)
 		if (!ep)
 			continue;
 
-		if (ep->flags & BDC_EP_ENABLED)
+		if ((ep->flags & BDC_EP_ENABLED) ||
+		    (epnum == 1 && ep->bd_list.num_tabs))
 			ep_bd_list_free(ep, ep->bd_list.num_tabs);
 
 		/* ep0 is not in this gadget list */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
