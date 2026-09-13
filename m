Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF23016F5;
	Sun, 13 Sep 2026 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303967; cv=none; b=rsUwbPO/ytQKFQOjoD1NzKm2bua/FlreslJZXySC2B4YdcrOm3jqJhgI63N1hYmrRsLskTZOGEe3vuo8ktudF0WDIFtgfHeZJHLLusjo+abXMNF3Y5IhTkLBwA5AF5umxxF2PkV8I1KZJq+YFXSZT+BGZBM0VODJI7OnpxyrqFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303967; c=relaxed/simple;
	bh=CsGh+krCgwywnMm1RqRI0tq1IFZXRbgju12KudeSpLU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JLCOJuI+D2aGH+NFEIbx6/FCTPXiR+GgSfC7fl2sqj6zH0hL0yK+yBvDhChVJXUHfwCpiehQX2j2svez3z88sOieR6yelM9vYwyNKP9+L9hDXM3cAmDk25I0q4uj5enzQBPTF+0jvkmD+rNLf8Kl4Lyqoa/TwwVoDawboTdAOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=PigS05Dx; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="PigS05Dx"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a400;
	Sun, 13 Sep 2026 20:52:38 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: pawell@cadence.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] usb: cdns2: allocate the trailing ZLP before queuing data
Date: Sun, 13 Sep 2026 20:52:35 +0800
Message-Id: <20260913125235.110093-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad3ab1203a1kunm173a591d25122a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTB0dVkNISk1PTElJSEJDGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=PigS05DxWE3F395Ri+QWM0WvzNrs6kKWp5/NvZXxB7le6G+ZtY6rmXfJ84AuHz9unvi/JMnWyNVfAdVO5MBW3zl04jgiKJKqievOnQXeuPMr+WLwykqkT3OX4+0Zadd4JxRfjNY9XqmWPK7ZBebTTQ9DGPyHvxAg0jufkCcU6GI=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=RgcrnwPCHAA75gneTRZnauT0hYrwSEZEa5TLXWYcz3Q=;
	h=date:mime-version:subject:message-id:from;

A trailing ZLP allocation currently happens after the data request
has been accepted. Allocate and check it first, before publishing the
data request. Free the unqueued ZLP if data mapping fails. The ZLP has
zero length, for which the mapping helper returns success without DMA
mapping; its enqueue has no fallible mapping step on this baseline.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 3eb1f1efe204 ("usb: cdns2: Add main part of Cadence USBHS driver")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 26 ++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 308d3c468ab1..68fed31a85c5 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -1696,7 +1696,7 @@ static int cdns2_ep_enqueue(struct cdns2_endpoint *pep,
 static int cdns2_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 				 gfp_t gfp_flags)
 {
-	struct usb_request *zlp_request;
+	struct usb_request *zlp_request = NULL;
 	struct cdns2_request *preq;
 	struct cdns2_endpoint *pep;
 	struct cdns2_device *pdev;
@@ -1717,21 +1717,31 @@ static int cdns2_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 
 	spin_lock_irqsave(&pdev->lock, flags);
 
-	preq =  to_cdns2_request(request);
-	ret = cdns2_ep_enqueue(pep, preq, gfp_flags);
-
-	if (ret == 0 && request->zero && request->length &&
-	    (request->length % ep->maxpacket == 0)) {
-		struct cdns2_request *preq;
-
+	if (request->zero && request->length &&
+	    request->length % ep->maxpacket == 0) {
 		zlp_request = cdns2_gadget_ep_alloc_request(ep, GFP_ATOMIC);
+		if (!zlp_request) {
+			ret = -ENOMEM;
+			goto out_unlock;
+		}
 		zlp_request->buf = pdev->zlp_buf;
 		zlp_request->length = 0;
+	}
+
+	preq = to_cdns2_request(request);
+	ret = cdns2_ep_enqueue(pep, preq, gfp_flags);
+	if (ret) {
+		if (zlp_request)
+			cdns2_gadget_ep_free_request(ep, zlp_request);
+		goto out_unlock;
+	}
 
+	if (zlp_request) {
 		preq = to_cdns2_request(zlp_request);
 		ret = cdns2_ep_enqueue(pep, preq, gfp_flags);
 	}
 
+out_unlock:
 	spin_unlock_irqrestore(&pdev->lock, flags);
 	return ret;
 }
