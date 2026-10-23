Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716797;
	b=fy18qZuRi/kEEIXTB9DACqzjfy5W8fPdsjWQZcvy2JGQExVrP38a4PwaQ/0mPEjehZ4h
	 2MhpnStKZbVX+LP25tkTreumcQtiU+em+gUsiXY4vJCfRzAsF+J3TcFpNp2A29vwffKYl
	 F2SSeLpXWiaKCENv9YgQpLBL4DWL92j6K9xFPEe/vX0qXbxd3vsho5KDO51sZ18O5LsjJ
	 gvq4NlnCSeBYBIyjJK1iuUH97UnnvSN7zdD8tGaiweJYOkFj0yeAu7mykMBAP55aXV6XF
	 pf8M2a2ZcuB4IuwxeKFH57VNvmh7qAP7ujwnqZxU5qpLyzj1Dg//gv1ieOFsqFomTcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qwzDXE7uMgYzr2LALcYpN7OIf8wwLpLfy0jma6A3Wno=;
	b=4gw4Iq3J0i0hJ4FtXY/DLG3mjs1U2BtqwZdErLlkITOOekUgNigjCXvFWQbHA9T2l2w0
	 CMHLduoQ47d2dhpJBTUANIdlPFbZf0oIchFqUCfXEH2UHd3CwTWgUY3L6ojavwuZ7dwpf
	 XzghuDxON54zpP/HqITvPQZW6DVd0wq+4fvxI9XUSuROW1yXlDNiPdpdeKIfwRukOShpr
	 i4vZUyZEcg5lTlof+/WYsJRSnrvXatT3RY73Ogw+0gPLJMNpVOGpMs9ep5Y6GNBj9i7Wr
	 3lLhruPhOQysCs8NgzJ1/HOfuUJlLa7j/r5E5Oth8I9TyqP0KBAvRVsxSWFY0AkNUQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e0InhKW7;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADDB606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADDB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e0InhKW7
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-368581df789so334653eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792716796; x=1793321596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwzDXE7uMgYzr2LALcYpN7OIf8wwLpLfy0jma6A3Wno=;
        b=e0InhKW7gLeCEc0Iv1Lj9EUBFyMNPdb9KWqt5zOitlonEcFpbklZBhIG6kcwfSCWEU
         QIFXohUeHtAf6b4yWKZTGNqK2sbUon3Zh38wRmwLaM2FIEz4BWkY3tmvOq8fGpXDpcsF
         o2MjKFrVB8FA4EdKZ0OMco1IvhepfmE4uNSV9GX0Ag9+FnG8dMfbRM/ZLgJneoQYbfSH
         /o4Pw5dSZEKmTx1t8vuF2one6ce+FfhA96v7BaLmTcsEYoAnzu5tK09r3UNye/133h/9
         E5stzBCmhYSIexMpRFR0GnqKbQaL2A6HW/MQH83kKKx+RfaQ3C6hTmAqoZBgFrY7t5Oo
         9fWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716796; x=1793321596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwzDXE7uMgYzr2LALcYpN7OIf8wwLpLfy0jma6A3Wno=;
        b=xwTE+EI+bsYBP7FI1NL9z2Y8jnFFPmkOUly7qJ887SWUV/nWLVFgduzF9ur3UPrx5f
         SSpTtzbrzRDm+CVH7zTf1vynhtgO+7rxb/8AF6a9m9moEOIO5zU2sdUcfLBszSOHJA9S
         Q/GRfuzl/rt44950uab6aOzD2w25zZlQ5DlDRznhKjBXhffqgo7O/LpY/kwKrCLYZDIO
         cnd45kd3oDl1CTR8SQPgz9BeftRCYbCbX9+aVDSWO8s+8wbU4q01VSIrgLJitYKvOD6S
         13ra0Bu159AUM9E6Vg76N8zHwdXw4pFcYtGBjhU8bvojP9furH+wv/kmSd0K1kOtTRIn
         DBAw==
X-Forwarded-Encrypted: i=1; AKwUvByrdyTM97nO88SayhlDsrVxu82W2vkrE8M0SzkTPcJ8Me5MmgV1tUNm6Ce8JNKMjX2LSmyqrOWPtXWnGp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2FD3ACD3VgKeuHjcLz7L2VGhReffyZS854TpcQRwijvUIOMxM
	asQgnRi2+sdTi1spNHWmIFX4rO6QDoEaeXtzlvoumm7xP9dREVNqXF6TMALNj7FW
X-Gm-Gg: AYBFou1sn2Ex6N8oKc96MPlULOZhCpPWktUWzIwUJMsj01EbGqdtSMVYpFpWgDhQoaX
	4dSy8O4VdhUMsvOwnePi7lZgrZf2N/mPu0+RT4igMh69TrtEeBo71P6hTFSMWH8Dm3cz0n1P15c
	TmvkXSRr/m/KUdYO4UgwCkB5932qMM3PK7FdWHOEgzB5fXO1zZ1fWZFW6GzO9Ep4LfDLnQsTa9o
	jTSocjMTKgNiOHBK/Cwf80fxbMer6ZOyXzuASnkpDrVG4v0chXX+EysvacvAS3me8c9A2MBKb49
	0y547SqU2nqVtgLkhVZZKh/AUl4kC3OADW2NBFOSO/LtbvZhkpHJsnowFutMgWXlLp83v3IVLVq
	zwQpwgo7xzcG/xZmLME6ePLvpmdiiqM7QePnIbXMO7iwNH1KgeXQpA/3nYmkdaRrhkE2SMT/Im/
	UYwYbL3RZfu7/xTa6YPXWVFZb26APV/LaU3A6tllkgCdVdGb6CvOosmi+7zBtTRFJrbp/rAZkrO
	SNLi9ywgkKZXqgwkppraJGowU/kMOGJTa2lZCni/vatuvoxAW6x3tLrW3EG8WMGTfC2fyCRDHXk
	wCw3g2g/HKH0FC4F8zOrcpYnnVDXL6W1kwm+cheezj/v3s2gReDsP3J1S98dnErPn9Fmyy8qzZA
	cQxIi4Yb9R0Qy8vtmfBGagwYzgMiR
X-Received: by 2002:a05:7300:ec8b:b0:368:d722:48ac with SMTP id 5a478bee46e88-368d7224a10mr3977854eec.14.1792716796168;
        Thu, 22 Oct 2026 17:53:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9a72ff2sm1686107eec.0.2026.10.22.17.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:53:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: bgmac: fix oversized RX frame check
Date: Thu, 22 Oct 2026 17:53:13 -0700
Message-ID: <20261023005313.3946390-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RX length sanity check compares the length reported in the RX
header against BGMAC_RX_ALLOC_SIZE. That is the size of the whole
fragment, including the space reserved for struct skb_shared_info.
The data area handed to the hardware is only BGMAC_RX_BUF_SIZE bytes,
and the frame starts BGMAC_RX_FRAME_OFFSET bytes into it, so a valid
frame is at most BGMAC_RX_MAX_FRAME_SIZE bytes long.

A corrupted length between those two limits passes the check, and the
following skb_put() runs past the skb tailroom and calls
skb_over_panic() instead of dropping the frame.

Compare against BGMAC_RX_MAX_FRAME_SIZE instead.

Only compile tested. Not tested on hardware.

Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
Suggested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index b3a92ae95de3..6873c7bb7a14 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -455,7 +455,7 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 				break;
 			}
 
-			if (len > BGMAC_RX_ALLOC_SIZE) {
+			if (len > BGMAC_RX_MAX_FRAME_SIZE) {
 				if (net_ratelimit())
 					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
 						   ring->start);
-- 
2.56.0

