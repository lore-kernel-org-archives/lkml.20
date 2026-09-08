Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB74B56E05A;
	Tue,  8 Sep 2026 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882861; cv=none; b=EFTxeIIuABS0fx4c0pzUgFQHe8fQIlrZCWvoB2fxi+SFbBxTleybwbH/is9bEuBx8xu4vJBKymF3Y1vSE42tszHaQGmlL7EYXJPFpgmw2zqYtGjTvYK1SUWBSAdonTix3rIMdaKOBO2nLMy/Fexmg93LE6+ho58lP2GlJWRwr4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882861; c=relaxed/simple;
	bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOpNvb+8wvNHOXNjVGuW+N62eJojt9qWPHrx5jjcdMmAvt0AdhSJPwIld53OhkVN6owIfvE8DYWB/fHGnye2X55kphnlZMNXmHXhKDBNveaP/UkhvTny84sC6KnDj056JDaU73pPxy78ip5rdKPy94G6QLoSkT2WPbhKNZjYy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ldlxgjHp; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ldlxgjHp; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ldlxgjHp";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ldlxgjHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882853; bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldlxgjHp1wcX8NviuIbLJ3xgnDk86OcXWPq2bcRvqK9wRp+i5iWNbMcYc+UHdjTRv
	 UKqSyicmoRn1iV0tYtGfGgy0OkY35hDtWZ6KLrBEKoLDW5fXhsZDtUXDamunnrXY9x
	 oFo2Su1IUNp27Rm2E4GJr3+SOMgPvYlM8e7tAWiSS65FwiqPDfh0/Z/Y/PqICw+c9j
	 wwjLmt/C0nZk/NjsT/FgmMjgw3Upk0J24c0J7XHBYAz6muBvL6sCrqhi7QRFGUrWrH
	 94Pca3735tNtMJ4W8RNnKgv6+qSDqYiOCzggVpS6XrSREVVBEpQhsTUSn4hYQYar/M
	 PwA0y7bfbZPzA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id CCD5D41467; Tue, 08 Sep 2026 16:54:13 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882853; bh=nYRd7yY2iQrxXpFpibHfZxMG2K6deJ630SG9D69fwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldlxgjHp1wcX8NviuIbLJ3xgnDk86OcXWPq2bcRvqK9wRp+i5iWNbMcYc+UHdjTRv
	 UKqSyicmoRn1iV0tYtGfGgy0OkY35hDtWZ6KLrBEKoLDW5fXhsZDtUXDamunnrXY9x
	 oFo2Su1IUNp27Rm2E4GJr3+SOMgPvYlM8e7tAWiSS65FwiqPDfh0/Z/Y/PqICw+c9j
	 wwjLmt/C0nZk/NjsT/FgmMjgw3Upk0J24c0J7XHBYAz6muBvL6sCrqhi7QRFGUrWrH
	 94Pca3735tNtMJ4W8RNnKgv6+qSDqYiOCzggVpS6XrSREVVBEpQhsTUSn4hYQYar/M
	 PwA0y7bfbZPzA==
Received: from maru.home (host86-150-50-53.range86-150.btcentralplus.com [86.150.50.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 2A69341461;
	Tue, 08 Sep 2026 16:54:13 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/19] media: ir_toy: Remove unused struct field
Date: Tue,  8 Sep 2026 16:51:58 +0100
Message-ID: <1efa594810de0cfbd9366d4c4c8d6f09b483c093.1788882189.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
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

