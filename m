Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B72E48A8AC;
	Tue, 15 Sep 2026 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461196; cv=none; b=r6NR8dnShpGGiXxh9dmmCeF0AOcCmRuwdtuMJftTPBVPAyjLM1UoRUvf1q1KQBqvXLeV4Icg7iaqQI1GrHmWDdaNkrSFHHPmFAI/zjLW6p+Iz1xgulIuaUaM8p0h0/3wJP3XxbqFofSBmU5d/JfvepqabJ5Wf9S+bTcMK4ALoZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461196; c=relaxed/simple;
	bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3m4E2vYCutEWCY2W/dpZGCQoDv0eGf7pU8Z1xdM8zH6MrnrHtA//o3+gzlHJsUnFhCEdR7En8YD7Y4oBlzVCmWp/lbgu457UNLCz2H7zU/xkantmWh5lfSz17t36wwCPSMvLS5HFn4n4yF+Ztaa/4H2/cldhyUTaN70PG6SHBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=eTkyyT4V; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=eTkyyT4V; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="eTkyyT4V";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="eTkyyT4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461192; bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eTkyyT4Vz1HC0Rd0RYGsQmkLBD3ykr3jUN8GtX/vDz8d4QCLrkO3s+JhYtwtM0hAg
	 6zH17hB6LAiRJaaXzkZXFtHbcHtJ/31d88IiKWwJsdbyYSoYmBFZhJ4cyGS83hUNmJ
	 puWLev8RqDWM6k7YCyRXuCoFo3NT8sMcs6ES1BRHoVbUuollVF003TLOEphGguMSZf
	 nBLuuR6ehr/ORtWKxDyweFR0jWlhs5ENQftxvoG6LC0bEucUhrmUm7qaDohZeurv7J
	 J4Ov/xxt3ytTPym0Pet/DTmmWc6gWEPgBuTST8tgS9asOqM79LXRh0n8jFBp0BDA73
	 rHyzArjwSZcpA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C4A1A40BA6; Tue, 15 Sep 2026 09:33:12 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461192; bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eTkyyT4Vz1HC0Rd0RYGsQmkLBD3ykr3jUN8GtX/vDz8d4QCLrkO3s+JhYtwtM0hAg
	 6zH17hB6LAiRJaaXzkZXFtHbcHtJ/31d88IiKWwJsdbyYSoYmBFZhJ4cyGS83hUNmJ
	 puWLev8RqDWM6k7YCyRXuCoFo3NT8sMcs6ES1BRHoVbUuollVF003TLOEphGguMSZf
	 nBLuuR6ehr/ORtWKxDyweFR0jWlhs5ENQftxvoG6LC0bEucUhrmUm7qaDohZeurv7J
	 J4Ov/xxt3ytTPym0Pet/DTmmWc6gWEPgBuTST8tgS9asOqM79LXRh0n8jFBp0BDA73
	 rHyzArjwSZcpA==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 45BEC40B71;
	Tue, 15 Sep 2026 09:33:12 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/20] media: ir_toy: Remove unused struct field
Date: Tue, 15 Sep 2026 09:32:21 +0100
Message-ID: <6777105f1412441517c30126fc580e41e31179f6.1789460680.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789460680.git.sean@mess.org>
References: <cover.1789460680.git.sean@mess.org>
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

