Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB20327C13;
	Fri,  4 Sep 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527294; cv=none; b=YcwoGC0qHlm4eeL3jBwJMfppoGI7B0M8h5Urp3+RH8tvcb5iA3fjeQGI9Dp6+HTuSppUoE7tjH8l74CZEPJ9T7T4DjqIg1nn2ZK0t3fV8ZK0L6JwMaAb/6lUTfJqyXl4WP+Bhpv9T6okL4PQhHxCJdmGW9L3bs2n0Cl0F00Q0xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527294; c=relaxed/simple;
	bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWIT1FjisWYSeJKYhhQTAtRxG86wuKvoRkWRVgJRGGx3rXNRHRexZA04DDYWBdQatJgsIY8WGNwBFJV8yGNH4JSk9VRbFCo/MBE5Hfw2DznVIGrD47Y7fo5pbdloc6DnMM7lOo6jQBRRxZ/X1nzw6vTGbzJ/HiJSSkT3vlNBBEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=X3GjnwBR; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=W1HcOiCe; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="X3GjnwBR";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="W1HcOiCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527285; bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X3GjnwBRS7vkxOCDldG52oiex6y7RFDIsiEkb75BsGqThA46uK/r6WYoRwQg7HJ1y
	 xQnOfLCqntClfxRsAJcA6I1bNZGKoUo1kJZSDgq7UQ4vRQM25WH8mYi02P6MI37yXD
	 ec0g/PNpT/mO6tjB9ZoKU6M+yBdTHpn0tG6AjIk1eKgww4xC4hHngkgG1s0z0qEb6C
	 esFtLmfHRtKdCbWo5zf5x6qeL9QIQxa5xmGvcr3fVE2G2lNWPMI0x2N48YZNx6wKsN
	 EYZbcJeUnjKWInSgjUOC1AzOX/DaoaVE2mEhr4hFwK+Wckwo3G1hQXhh9SK+jKVoeP
	 Tg+oC96uecqkA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 3ACB34146C; Fri, 04 Sep 2026 14:08:05 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527282; bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W1HcOiCeh9J0xCPQ0sadOk1+0uXQuEIfdENX4nxKWLQHfDJKlOsTur/lsP+qyGa7U
	 zAO1l4JGb5hp1P52qvUAGk5kG/qEQ4aNF3HE5z4Ocwe3TOU/CMzxjKtX3M9WlkChVs
	 KkgAhYuec5lEZXxJa8CllPb/tc8/ogSPsM5Xgu7M3lPsr1n7f3rSoWvozQvHWosuw/
	 HU1tIow7z7xNNaS8k/nwSZE1Zije+BHyrIkIe7413myFUM1f8AbVtrWn0+RIXVLr+M
	 gXBkmPhozip0bLwpXw95izgAZe47QXeHckL1GZgVyIL7f0G7x45u5gzz709Rzea+am
	 278i93E1NF3oQ==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 264EE41457;
	Fri, 04 Sep 2026 14:08:02 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/17] media: ir_toy: Remove unused struct field
Date: Fri,  4 Sep 2026 14:07:38 +0100
Message-ID: <70344b21c3e303a6aa5c0db179ddbcc803e1b4dc.1788526920.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788526920.git.sean@mess.org>
References: <cover.1788526920.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Never assigned or read.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir_toy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index ee645882dd5a..286c8543aa5a 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -55,7 +55,6 @@ enum state {
 
 struct irtoy {
 	struct device *dev;
-	struct usb_device *usbdev;
 
 	struct rc_dev *rc;
 	struct urb *urb_in, *urb_out;
@@ -441,7 +440,6 @@ static int irtoy_probe(struct usb_interface *intf,
 			  irtoy_out_callback, irtoy);
 
 	irtoy->dev = &intf->dev;
-	irtoy->usbdev = usbdev;
 	irtoy->rc = rc;
 	irtoy->urb_out = urb;
 	irtoy->pulse = true;
-- 
2.55.0

