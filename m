Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200563;
	b=WscD00e7CjyCP2J0FNS8zpPBhp4y61CutI/Ff4Ff1NthHvZLNR8dvm7kg4noiWBLCXJv
	 4TRO+vL2S720lmMf+n8/iAI9ImQSxehVhWRQ8Z5KGHpvTrlwk+JO41FHNhfS+YObySxo2
	 xbablbGvooHy8pZfbYa8faBBL5FMc5NgZzld4oVdR0r5UwAkgeKF8K1tRSuPbw0COTNhk
	 GipmOTSVGeFj0t6P+/fkkUfb5pilsNFQlrBjC5+kaadBhjILdVCmPZE054RynDbqVqIhx
	 q8BNI2CtaVMSf1CJtF/wPyMCma+J0RNMEt0SV6NoqCSUXOH3ppBu6BB48n7sPGnzHrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YeFAvqaFBjTDbwHpdVBu+3G5WzX84h/1VRkYo0vld38=;
	b=mT94P77p4OnCW8ni84oQ6N2evdik3hjQBe/SjwX5ohRFbd+IMRPJCnGKLMD1F0mHzQCR
	 yOcxDP51lTsgmPrgmBDVoWB9AWd7zBob19yP7a7bGPNL5PkkRIRTz/tem7DutKUIj4gU5
	 BjEs/Sd2JMBbmVSo6pOoFEFK4BaQpi4NPxLSlIoTlnx6gLQvZYtuHMx4SVdz3rMv7nD4P
	 iZr0Syeg6Gh2FLkiS5dn+qcIm+FktcnVQtT6SIQZbIY6AiFaloxAmZs5MMfPU44VUDlyy
	 y6AL4t3+pMvrFH6JSdhpm3JxIk4sTOu1RdXAHS0plz5Kk166Xz8G0TpihhWYpRqOVuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNu9PZcY;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2B606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC2B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNu9PZcY
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-563a0462094so213078b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200562; x=1794805362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeFAvqaFBjTDbwHpdVBu+3G5WzX84h/1VRkYo0vld38=;
        b=WNu9PZcY7TxOXyoWPWzBuRH9pbkVd+P/ZOLuHkQI15l10MtCNqSJuQsITVb21JP30q
         dGXavCQ/ecYJIncDXhoVZ1yv1S7pPEdBKbwDVcl7+UbYve8jTxz6XTHQb3koywSZ5OHF
         xmeiO6o1VM9Baqh3BS0bLTm463i0lro22JEeFh7lol9tewxyIimf/24HToDd6p5KuXa3
         LRRjjV+uYEQOe7dAXIBwqS5k5IrRh3ppk7h/W6gZh9lr0zSXMd/yibyOBSUJ0oCPSHqD
         V2E4VLdsL7+P6pirEGsIWjvcmvxqEZY48v8gD8LAFlpHax4FFQ1IHm5efcbL+uiatUEC
         Aqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200562; x=1794805362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeFAvqaFBjTDbwHpdVBu+3G5WzX84h/1VRkYo0vld38=;
        b=bL9OEaLFmnNqram8USabkTxwxYf5QymaE4F+p7cuGasxU40eJcnYA0n+Z33b70OO8w
         fobSN/VXjdyh0w9StgUe89jA0C1K6Lk8u5EDRXXy8bPwn6qyMhnAgzaK6/njdtZ58wX6
         QOFjcIUi9Il+EhY9YTT4Ge6vRPrLaKSlGDBupRhaZMTAO/7u/m/GH3g0akrLrp3JzZgU
         H9fQMpDV/WJ1YjzUW05yA02dtXB0zhD3kFOSiKWfGzNrLmUi3O5ekJe6UPNExTtO6a3T
         +TMuU3qSSEtjl5wp9iDIir8MwEq7h1MWwPkkmL38f/chHejcvb8XRCwDJUT8PEpXKUK8
         BR7Q==
X-Forwarded-Encrypted: i=1; AL+hErEL5Udy9KH2axgQ/ghgPUUym2nnZ5fetCDWKUmk4zTQJJiMY9JNfB6n9ihhsuHLIY9uRSItSo0U6H8yxHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gMeqLaqk4P8Ve3bUv+Ba7gO5rDMa0CZzQ9hu1E6Yec2HEDwp7
	K7MSFS6mTrhY/VhMs5Cu/oP+q6Uxi2VO3T0Eyr+HbHTKZfPr0+2DvmXy
X-Gm-Gg: AYBFou33yIXCbtZF5pXJMXJsAnXV5NhBXOyhUX5DGI0gGz3cXqG3MAYnDTvT5RDH8YH
	PsoLtVOM5cRPA47ravQwSBjQSUrcrS7l2ZCdQuUGP4Vsuklibs3m8DzyNBzc4izXaWqMI9lJXYa
	JTj1P9bQHzJlqnkUIwltIZBErqWXq9qjqTLDpkxh9d7hlgnYWU3+I7Ni/ou1Jwo3qUD/U+tDOCV
	P7DR0p6e/0UHFGCxYSlitTR/EG188rxufGai6YNfG3BOWqdnWkg9P44xysb5bzJyDn6jBm9vSlp
	uJgURthYmnGyQ+fn3jjn0h7mFGKA7kmqX/1GQ5jsfOp72Ef41cdnbyrmammFbqGof8WeZDWIWkA
	gtiz6qSjqHOMWCGIu/0Oj5YetRG3BQFUo8vGlpUT8VY9vRHFL25R0iqbIQGF8oCR127B7/E62ep
	VqdfiBsP8i6ld/2FstPyfPLVoWFJCJt7neC/KQtiQ02rLUwbxoOtf3tj1m08FZGtytzB4iUeC8Q
	/GUA2+YxyUedlLD7+/6koq375c/8Yyw2fYROOqqRHKf0KfMVbG/RUTzmS6nHUixQu1rZ6Kjc4MY
	O1Jh6tVdRyqD0yi5O4UrcgD1fZ3daiPawm/ywKDNtgVLrbdMNGW1P5n7XEZLzVP4+E23thlBTFz
	9BEOGlyt6AqvRshQ6mNfPms3gSxM7LXQ12H42GnSzs+8H28741iBSCo1jNWY7a8pwhg4b6pX4YN
	lWUXO9VycGuTNZ14P+xRVwL19oh73kefR7xbXSMpKeqjT7x8j7aHhLsZIx3Bh3e6QTjU1pgVtR/
	w==
X-Received: by 2002:a05:6808:13cc:b0:567:aa7b:4836 with SMTP id 5614622812f47-568144b6c0emr1886261b6e.26.1794200561873;
        Sun, 08 Nov 2026 21:02:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3570841b6e.1.2026.11.08.21.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:02:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:02:37 -0700
Subject: [PATCH 2/3] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-2-c48ec19e9ee4@gmail.com>
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
In-Reply-To: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 49f65486e862..de092f190528 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1186,21 +1186,24 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
 				      1000, 50000, false, chan);
-	if (ret == -ETIMEDOUT)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	chan->cyclic = false;

-- 
2.53.0

