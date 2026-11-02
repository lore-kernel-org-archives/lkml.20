Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648068;
	b=fo1Ul+Zr5HQOTsXf9SEYXCI8m7ABVW6gV1fNnsZbfOIdQCX0mv2YwDvBKB3NuOdHofST
	 gezhXETHccqkj/Xw1aDpvHF1WLLU80YGW05SBoPyju0j5rop/5ZKPCD9p01tKNR7IXiTX
	 OxaHqiOhSYikcqWCAZRXrsv68wLEZ13HqG9v+nvEPKMDeR4qIH1qDbe67syAlHAwU+0LC
	 X+5e4utCYWAvt0JQjJCU75CGctzv1HS3E4ARstIvx1TpXBQEdckFcCwXCcQLFYahljHE0
	 rQB05jZ+MRNk6fo1f9aQd5GnbbQm72V3Q4OlDNJCW/SHnMn7rJiFFZJ/QlwpUrL/GIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1CHohurHwGW0s3Zm6Rv+GbWfGWzISEwRaF9a5zGiOwM=;
	b=JORByrTq/Rul2TiBqVYhewmUwDfIY1w4DQcbhGVMwfbT+srNW5MmZc3ZBxVO9Tdg4unA
	 qeN0bE2HcyCii3WivT0oEXgBZ1WPRTQFKMp0x7Z4Qufpj4Y3qAw0aEkKUJ1x8J6piTAgz
	 uhRb9yHt0lXypFIiUtdtntbajMgUCB1m0dviUBLweBPp1Kz7HPBgj/6QAJA99Y5Iy6hna
	 oGkkrSuykS8fMhKK9EKtx8FFhnwaNGmXxi98LsAfjuJUK9Khc0xK/VtPNWPkXKE7mqQPR
	 p6L9LJ9vunazJZZ/ulTqRtOrphxeI5M8VK8gACZT4qIc1slLcG0mai41xg2BlCBsb1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdjD3gzW;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B06606D80E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B06606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdjD3gzW
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-53dda625f63so2553678b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648066; x=1794252866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CHohurHwGW0s3Zm6Rv+GbWfGWzISEwRaF9a5zGiOwM=;
        b=sdjD3gzW91d/Yiofsx/4ymGX7zchBWu44Xh0qiZRbHLso9tI5+BU16O/HChBvG5dxW
         1MRsdtju6i3dw8lmSCvReHAu6mKtST8cclRlFhLPufQjCKlif68GPo7d49XAw5OXImcn
         CxzTbliT13pYgN0rqr9Ak7znACLFtYlV1aia4ar0Lb2s08bjShTlL+PltykxUXIn7jJ0
         TIn/D90TDYLKWKYn3RDwaMW05UER2+YNFVPmjOIPif398NrCc0lZn4EWGZRpeoKygfqR
         jnn5degMOYZAvL0JqUvJqGuPRaO4EY9CnKxVpszoxisio+WoHIj0Pu/nht+yGxICYP2R
         eXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648066; x=1794252866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CHohurHwGW0s3Zm6Rv+GbWfGWzISEwRaF9a5zGiOwM=;
        b=NreuzxZc3ZwS6vVqt37VRcbkMIj35lnsejY+sPpbhryzTsOoY9SX7CkhznXi+tJWkr
         bAryUojeoVhAYz1xK14DekTzSkWvZqYg2KMAEuyHjriyWES9o3wXG/uq9Whyg7abyMjx
         iR8KsxWFBS3xgAJxm34M8Oy8bTvh0PxpXMNbRdXikt8SophlgIhVle+42IXHkvhFi7dn
         ElTRfHnnV2cXl06sCP6BlC6fRj6PD1WYD8Lu86+D3biQtko2mq4bNGgPVXNBWQQhZSH4
         Dy/lHOvGIdiay4iz48TwAD7ofgl6PplKxGVjT/wd/m7RoiRDYDq+3Elgf696KdNj96wP
         OTLw==
X-Forwarded-Encrypted: i=1; AKwUvBwucGd26ZxI6Xh3YvSx4wsu9jgRuwbgQMuCGkAEBA3sR8gT0bhTXJyiOMIMHMFR8vmaUxzcS1cV5pgQyuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKOXfVE6EylOPXuuUv5TVZx/rbKcXjsMxq/9lsyxrsqzJId9cd
	2hchUsVebE47SSeIwaVgqkWe5HP1tq4yrIvyP57Z6JvMQIgep2j03XxW
X-Gm-Gg: AYBFou2nUDbnB4XMZGR/9tueL+yV8QXOaSphhQeIxd9/wCbbJuUulzFwrzc5b+opkje
	D30pU58G26BNMZcWG1YzWir/EvFMPry4h9aMb8qekGUSETaoxaIA9ywYV8ieRo32fw2rsWLwAtt
	EV4hKnGonQr+Z705wbcnim4uPOl3f4QrQhkovOSphqCEISK3DGi2CDsGh1H0nORv2OeU9o5g2Yk
	K7F03UAUHRtiZwhM9BPG3KD8duGLzUqIibXROImh3rT4X+swGIjWuPj/yk9o0fX7oQtjcazu8am
	12+3dSGyriWbAR3IB26S48lSkAPyfZoJylRFzT5IEckiqk0jerP7IXYpFvNY8K7ZXEBcAbd0dwT
	w/tINQE99Yl/eyNR62mBsesDHKYPHMdM3HSP/WYovHlHsxsU5FsYno7GCLhsY0d+UhJqOuWf3w7
	/W9+C1Q+syGhAYdHyg5aHGua/u7mCQdAvTKL52mqTDkMdko1HuyWjE3rcXOa7/PeBXcICQ30qTn
	cNANt8yzx2rqsxDxGmqR/y+guOK+S5Q9y3PpP1oqLXdyTQYcra5OB3yPb5myI5qBQMEzX70ydqt
	ZuUN3UnjW4FbBhEZOFHsOOz/df87IZpdE9RkgAZDe1eGyz9JsOq77MDDsGyOW6MWPsQEBVqYv9A
	/J77eTM1DnW5GFWlfciD9KpB4ZlZi0MRaXzHPVF/p9OqDvmT1pacPDllU/T/wFdo3MnUqbUDP+t
	VXsZKeTZQ6TgbNwO4Znq9oVhLUTpn/hESIQaR9h8xA0sBOKfOMzSswDkERZi+QepNBRYdayIXL
X-Received: by 2002:a05:6808:2382:b0:4cb:abff:3db9 with SMTP id 5614622812f47-5640d916930mr7379458b6e.9.1793648066236;
        Mon, 02 Nov 2026 11:34:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:19 -0700
Subject: [PATCH v5 07/10] dmaengine: dw: report residue for queued
 transfers
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-7-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only searches the active list, so a status query reports
zero residue for the queued cookie even though none of its data has been
transferred.

Search the queue as well. The status getter already reports total_len for
a descriptor that is not the active transaction, giving queued transfers
their full remaining length.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---

Changelog RFC:
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.
---
 drivers/dma/dw/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index e198c9f45f0b..0fd49ff9257f 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -901,6 +901,10 @@ static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 		if (desc->txd.cookie == c)
 			return desc;
 
+	list_for_each_entry(desc, &dwc->queue, desc_node)
+		if (desc->txd.cookie == c)
+			return desc;
+
 	return NULL;
 }
 

-- 
2.53.0

