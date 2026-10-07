Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DCE3DA5D6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365586; cv=none; b=IQ+rD/a/3UHeqD/XacjQfcF0Ww9B9XqEGiursaeW7rtmO12Ry1Pm4Af8k8wDuxnACnk4nCpArChVCNOOY411AdyWHxW3fybEDpx2T3Qfyj68yfaLGCAWu9BMCGwCtCX86EBeWV0IyIbHu392uH8uN0LJofAQQnOuavFAFWaVjY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365586; c=relaxed/simple;
	bh=mWeV2lbQvUcTV3I0MU3yvpr0KXBCWj9TPl2RnDHne5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCmVroOz5ZxV1OvG6/JN11gkjuzEPpg+ddANo9LzsmNXzAKjubnKcVyKZHsUDHKvbnc4Lpx6arPllC7kRw08rCTtE+TEl6k8wHxKGuGUb3KWEHsAYPC92WLz9uNi8F9I7Szo42/nbULEhej1aUuHTI8oGneWVtZ0FpSr3GVoW9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=i+LFduuY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VDDP+5C2; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="i+LFduuY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VDDP+5C2"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id BCE5D1D0018B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:32:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 07 Oct 2026 05:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791365568; x=
	1791451968; bh=+Ym+LgllyXsTKLxDWQa+IguFgjS04cAIJ6pcNCHcr/E=; b=i
	+LFduuYP9/Oq5Rd7nkg4pjH/dEsllpiS6d4kw2iditYuI8WCckRSJYnDqpE+6b02
	tsUeg8R5nZ7yf5g1+M6F/18sZnCV6pzWiQjAeeYHDJccHbelIHO+k7x9H1pE9iw2
	XkKWZE/unaCAAeJABMjyvWxdGnwv9q7YTrWDYtws1U9eNarRFYc7xD8WP1d7n583
	KjhwRXPhigWSQWbaKbPrDzZTzshbxeyNyQ7D4EhmC/wutFwKKjlxiyqQjo2IVWwp
	aa06XHs/qQGZ3Ds4Au+M5aGLZK7Tz6y2LAp5FuFir/z27WV+QyURSi6YcXNU03Ad
	TUTgUDUjrevjtJ3hj5Kyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791365568; x=1791451968; bh=+
	Ym+LgllyXsTKLxDWQa+IguFgjS04cAIJ6pcNCHcr/E=; b=VDDP+5C2KNAnTiMtN
	jhZSLhzhavaLdEzqYw/+20WBNoBrabJP4wixFv5xh8dCOMklWHzCjvRKP81qdkrZ
	Yo/x5wn1Ebc+R8mNad4bToXKfVafbSesMsFEM6P7qtw7jG2MjkEIy34K6BhBcZ7H
	5cKKuWjzYOJLvvE4lCba7wuSjlGHQadMuL14W23WGonRTkUOMcgG3jpckgnk7f3L
	XpNTg2fQDCVuhCBuCihn7aJb7Gg5A7Wigf4JG3EdifDw16vM6t+/dtT+pKm5ITAs
	TUs5XxYZCIO7BsBopPFP7yI3i3P8Q7QVGvCKO6Cb6CvSrXuEYf8oQWh7KYY54k0b
	iF+2w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791365568; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:RJXCkO2GYSBhskSkYUQ3p6I8oV7gCwwuxo71DOahY5PAhUR
	4KeFoBB1lqmZB4yf7bB0zgQt1w2S3JFdKl1A4IXswqC6XCLksx/X8Dvv0pQnkVcS
	jWEkfBTjKWzRgG6/TErD3P/KB6FBWwkp17v72lP8Ayi8hCMCZMTiZ4+eIJm09jMi
	ezRwydJNLM71joDi4StTmJZH4bWyxjcmDqzsGODI1dZaX+urwb4FLZIbW5tb5fSp
	/Xx8JpUCQL+FNv0ha4iplGQ9/niycIus8vVtKExlLnYJR7TXnmymgXMhj9nFH8NG
	yLeUMw4zIJ8ZgAJ24kttwJZv6Tla3GXHJuAQKHg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jYTBoe58U6cWD0Ciy8Pb0X1r04Sr5r5BV1fBrf38zSo=:mWeV2lbQvUcTV3I0MU3yvpr0KXBCWj9TPl2RnDHne5k=;
X-ME-Sender: <xms:wBHGauWLaucZjXFkuZG2RHPQu97Nx1cEKWFmMsdGstMkYJWVOKQz9g>
    <xme:wBHGaoiXA_f5xrD61OWdYnSkEv58HUIhEhohkE0_7T3asluiM_hke_l2KtTZx4ksF
    ZYhdx9jGtVMgy7xAgS6albdM7XLchl4-C7cBjyYEOo48J87zv2C9ipH>
X-ME-Received: <xmr:wBHGap8y0vHrgYrPZASIC911nO6na-bcJeS7tncFxa24F8Sc-Cgw4zr1qNjrm196QA74AtImJ0j63DeLFsLc8pVxot8yzBoj0BV_5kKLWJtvfg>
X-ME-Proxy-Cause: dmFkZTGcZk5UZhE3hGZPA7OmThxBOMabMoTeTRs7uMWhJ/AlLirFpVeSE0QEDfoedniWIU
    ZC3DGn18HpH8zVVM9zuWqf1/mPFrJw2iy+AvZvu5gmVbbymyM5m1Wq3Wv9xFLWPLH7IbOs
    Nh6KFHEDLJyjlWCpRHuzCD1uTKb13DwmAyHJfx98dR3KDEwcu44eFMsfwTkQ3ma6OCGZsh
    QktnbdkGnSQ9iEYJLBJscA9evP3JNnWTpMdAfXnr6kjTSGMVkwnJhk3N3oGyRvdmd/+hSW
    12fuie37IKYKeoIXLNOHtjEypnVUmkYCPw6+cABH8bp5p8NdiJuBV2pjanIu2YdWgaaoDJ
    GGLijx3wmd4ylg2yMh1HF/w3B4o3g3oCa35CZUSXU7QcDUJk3AKnr9Dg07GlFTHR/yxtO5
    qyFlfHXLW3g1GmOTOYD5hQRgv0mlt/SnanSMKBYDFIj+vE+d7DKvcNXVuQMD5wp5W7qdk6
    WZ0d07kowvxY5Z7/d+90OfE1bRzTbBwiK2u6qhAnMs7Fp022ZDJmVKxVl2GauEmtNNZ45g
    qksTgGhPEpY5St2astqa05FDuccJPVikPrTo1IqS7yBZfhzP/FX3tANiQj4cOm5KO65KnL
    dHJcaPmEhVcgCSm3GZSmbqUidUFnwOAoYmbRjm3r36/O36mxQ3dpgjJBxOig
X-ME-Proxy: <xmx:wBHGaiBTJvpo3ImLbn70ceU75PsU1bRzGSvOYgDMBQAQn8mBOfoX6Q>
    <xmx:wBHGamLXFC78g16Lv4YAuED5xdd1h7EWYec_2HE6I66sKaugi_BRxw>
    <xmx:wBHGalm4i5Tl1dOP42lumcWAYe0NuU4Xup7ULR2bIUNhRyyP4OpKGQ>
    <xmx:wBHGakF8pxs7cNU4vPFDWhZp6pHxOXF-RVWa5-ThitiGWbXNW6aWaA>
    <xmx:wBHGamrZrP-4WEk8oJWxgVKyM8VB_WF9IDfCgDDGMAX4wHbdlePDmRdn>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Oct 2026 05:32:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] firewire: core: fulfill kerneldoc for fw_cancel_transaction()
Date: Wed,  7 Oct 2026 18:32:35 +0900
Message-ID: <20261007093235.175742-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007093235.175742-1-o-takashi@sakamocchi.jp>
References: <20261007093235.175742-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fw_cancel_transaction() has no kerneldoc even though it is exposed.

Add kerneldoc for it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 05c54887b4a9..a0379fc3e60e 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -99,12 +99,20 @@ void fw_cancel_pending_transactions(struct fw_card *card)
 	__t;								\
 })
 
-/*
- * Only valid for transactions that are potentially pending (ie have
- * been sent).
+/**
+ * fw_cancel_transaction: cancel transaction.
+ * @card:		interface where the transaction has been requested
+ * @transaction:	transaction instance to be cancelled
+ *
+ * Terminate the transaction by either canceling the request subaction or the response subaction
+ * of the split transaction, then schedule the transaction callback to notify the cancellation.
+ * The transaction instance should be kept until the callback will be invoked.
+ *
+ * Context: Process context.
+ * Returns: 0 on success, -ENOENT if the transaction instance is not found in the queue for the
+ * pending transaction.
  */
-int fw_cancel_transaction(struct fw_card *card,
-			  struct fw_transaction *transaction)
+int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *transaction)
 {
 	// Cancel the packet transmission if it's still queued. That will schedule the packet
 	// transmission callback which cancels the transaction.
-- 
2.53.0

