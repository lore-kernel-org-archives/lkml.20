Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113093;
	b=TDrbZzxzQ7uOCWzdoXWJEHiBuTnqogkz30S2eTqRw23E8lN1tojCSulHcXdtj5/+ms1L
	 /c2N84rAdzIyagbqcGTIhC1zUF+mNfZqKYXFWDR04rSzi3cnn2i0wGQwRzy+BxtbIms7P
	 tOLPoL/Ax+zFvSXYnoBAtw8LFuAzrbXqZtidWGopCywTzRA1Y3Hcdt9IOrhg7syfL0vbL
	 /h3Ix3iRvMHkE8P59sBm/p/fke7LaL31KnlHRGPjtjsReRK6MkDyOlcomvWI6b8gxNbyT
	 dMnn9S25mQRIKVpmFbiPLl4T7OzShGuxqejvQ1uMzQRAQT9eGZN29dqNUd2JDQtwSRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113093;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+d76iK+wGwS4qh7tYPP2y929nfoTrTw5AvjyrknUZPM=;
	b=AuL0fu2/JEjVNmu1ZS7SNorvnT1I/J+6NjHd0HC1YGAlF6Tjuh2MS/xWkzjHQH7NtnOM
	 N1ITH6EA0IyhZvwzBxqcmCZo3mXtrFxu0eXVica+0MwbmnjtGs+xdL0ShEo8rcoBWMYar
	 Wia5/GGnzw51u0tm0wcVeXz+KYjP4v+X7D+LbrKxndneS9AouvqYeNrcU/K3XEw0BuVaE
	 YsREC/hGipnFqCETmh+CyOIezskucc8obYZutRhk41tHPS4LArIPQwq9zJFLUupKBodWp
	 sJXx4Mk6otxRU04JTESDtaIDxvA8NLD8hiBeHYaPZegLUy/ZGY5F7ypspMFq8sfk2nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GGmtOW27;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B960A3807;
	Tue, 27 Oct 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GGmtOW27
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66291F01828;
	Tue, 27 Oct 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113093;
	bh=+d76iK+wGwS4qh7tYPP2y929nfoTrTw5AvjyrknUZPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GGmtOW27XK7cS3rJBtFlrVwAF035IlidqBGrpGuj8XjKV+vicEanXGZzvG1AzPr6D
	 AsBz4v1GUKUWiVpb7QUD8yxKAFccwg1Fp2DBa57Kkqh2f7YoOJ8L+ipWYQg+bGv/uV
	 l2v4eRhcKKvZ7/NfpI/ajPXohtRe6eX8q01U2KwA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:47 +0100
Subject: [PATCH 07/19] usb: gadget: bdc: the resume callback is optional
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
Message-Id: <20261027-llm-usb-v1-7-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Neill Kapron <nkapron@google.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=SxgH2L7C/xqN8XBmK82H2ka3tAQqLKL9y9o/JhRYmU8=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr+zefu2ozPQSlzBN+K0rCVTdb+u7e45Yh1cv2oyw
 /51a9V1xLIwCDIxyIopsnzZxnN0f8UhRS9D29Mwc1iZQIYwcHEKwET2ezIsuNa+cdb6t3qyecyi
 D47N1p7xP7PYlWF+mAOHZO5HAVsf+dVNUnnLlru0zFwFAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

handle_link_state_change() tests gadget_driver->suspend before it calls
it and sets DEVICE_SUSPENDED, but calls gadget_driver->resume untested
when the link comes back. gadgetfs has a suspend callback and no resume
callback: with it the first bus resume ends in a call of NULL.

Fixes: efed421a94e6 ("usb: gadget: Add UDC driver for Broadcom USB3.0 device controller IP BDC")
Cc: stable <stable@kernel.org>
Cc: Justin Chen <justin.chen@broadcom.com>
Cc: Al Cooper <alcooperx@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Neill Kapron <nkapron@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/bdc/bdc_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_udc.c b/drivers/usb/gadget/udc/bdc/bdc_udc.c
index 7a12219edac6..88a8f6550e02 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_udc.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_udc.c
@@ -218,7 +218,8 @@ static void handle_link_state_change(struct bdc *bdc, u32 uspc)
 	case BDC_LINK_STATE_RESUME:
 		dev_dbg(bdc->dev, "Resumed from Suspend\n");
 		if (bdc->devstatus & DEVICE_SUSPENDED) {
-			bdc->gadget_driver->resume(&bdc->gadget);
+			if (bdc->gadget_driver->resume)
+				bdc->gadget_driver->resume(&bdc->gadget);
 			bdc->devstatus &= ~DEVICE_SUSPENDED;
 		}
 		break;

-- 
2.56.0

