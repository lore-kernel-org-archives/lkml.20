Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113124;
	b=pLuUjccmC9+CUxdM+uUrh/2FaCtJQeb9zhK+sijNAy4TdaTPp5BH94dpTrSAxkUh67aL
	 s7TdpvEjhmEUQJK60N40o+8+GkCZVrUCVSgiyYyGIcnuTUZbfkkvvGnLO8E/dBi+dCPY3
	 J1TPV37S1oIzsuKHgUMjHVZtipQD7LFJhyhXPubBo5wua+4NxPhInRnR4Nz1R1H3ePZe5
	 gmoWT0HgOzfT6TvyBg7JdXRs1H7y7LWYP8m5bfR/b6W/rFiwxdFef+Wz6Dl2T4dIGKWTm
	 DZPR82UHF8GZa4qFfd+dJLPN9568IVODzTjyEW6EaaZojGPZpJtCIdiJVL3U+oalItw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113124;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=F4lahk/tgilKjjggtE5NT5r0+vQVYxwKeGrbL/xY3cU=;
	b=sGulZy9KX/IHMt37hrrNE/iIEUNEDR0ZRhQVf5lvzGLLOzwyDtvj0Cke09ox+uQwtejM
	 j++GRjt7eMaHM/N1IhG1ou1pQbBzcv+yQK89p6kz/3T4AdWtDVDkiBZX1a9Vq4fB4B+S3
	 T5tl4lrkCPRsfRDK6cFs6K37fyNWwKKJxP0ZIMnxTb7ktflQHYDxJYkEI30ZdpNrcNgKF
	 lvK5JfWiJ5bNX7EmmgAl/OLesHazAl4FPZ6ametpEIWKmFeJfhAVgfc07V2dBOMUYnn/3
	 eF/2tVO2yg+vFmtXlFTX9G7TZY30tRdsPZoAlKA4UH6Mre2Eo4nEb3kdEoABRLLy0TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CNylnm8Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A24606A329;
	Tue, 27 Oct 2026 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CNylnm8Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDB31F01828;
	Tue, 27 Oct 2026 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113124;
	bh=F4lahk/tgilKjjggtE5NT5r0+vQVYxwKeGrbL/xY3cU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CNylnm8Yz8U7EBJcaoNArFqn13MLYemYGYIFgBPZrnhH3On/RuOCDuVHavvoDsOwV
	 7v2Mch+3Sw/otMhnpZcCCGARPa+PpPesh28lLQUYHwte6bY7Bfz0oER7Kfhobt9xTu
	 183ffHjizFIGBzBC8jtbhRCkj7ls+rnI1dtAZ2T8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:58 +0100
Subject: [PATCH 18/19] usb: isp1760: wait for the TT clear in
 endpoint_disable
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
Message-Id: <20261027-llm-usb-v1-18-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2309;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=evgQqPbobSDpq2PAXmp1dP1UrXSqQo2nX9uZ/oqQIxM=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr9vqFj3+a5Ta3mKStkHniUNU72esb6asOFJTUdk/
 iXbuwqtHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRtFkMCxq/OjM/um6VPs/j
 W6Hjsge7H4iWzmdYcLaE226PzMSdqqZSN/fmO374cLx7MgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

The driver sets qh->tt_buffer_dirty and calls usb_hub_clear_tt_buffer()
when a transfer to a full or low speed device fails or is unlinked while
it is running. The hub driver stores urb->ep in its list and
hub_tt_work() hands it back to isp1760_clear_tt_buffer_complete() after
the CLEAR_TT_BUFFER request to the hub.

Nothing keeps the endpoint until then. isp1760_endpoint_disable() frees
the QH at once. If the device is unplugged, the unlink of a running URB
queues such a request, and usb_disconnect() goes on to free the
usb_device and its configurations, which hold the struct
usb_host_endpoint. The callback then reads ep->hcpriv from freed memory
and, if it is not NULL, writes to whatever it points to. A change of the
configuration or altsetting only frees the QH, under a callback which
has loaded ep->hcpriv without the lock.

The HCD has to wait, like ehci_endpoint_disable(),
xhci_endpoint_disable() and fotg210_endpoint_disable() do. hub_tt_work()
calls the callback for every entry, also if the request failed, and
hub_quiesce() flushes the work, so the wait ends.

Fixes: 74ad60292bf0 ("usb/isp1760: Clear TT buffer on interrupted low & full speed transfers")
Cc: stable <stable@kernel.org>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 6c52c6f59d69..3cbf5fe3ed34 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -2071,12 +2071,23 @@ static void isp1760_endpoint_disable(struct usb_hcd *hcd,
 	struct isp1760_qh *qh, *qh_iter;
 	int i;
 
+rescan:
 	spin_lock_irqsave(&priv->lock, spinflags);
 
 	qh = ep->hcpriv;
 	if (!qh)
 		goto out;
 
+	/*
+	 * The hub driver still has a pointer to the endpoint. Wait until it
+	 * has called isp1760_clear_tt_buffer_complete().
+	 */
+	if (qh->tt_buffer_dirty) {
+		spin_unlock_irqrestore(&priv->lock, spinflags);
+		schedule_timeout_uninterruptible(1);
+		goto rescan;
+	}
+
 	WARN_ON(!list_empty(&qh->qtd_list));
 
 	for (i = 0; i < QH_END; i++)

-- 
2.56.0

