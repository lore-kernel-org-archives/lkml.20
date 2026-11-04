Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802991;
	b=LjbOmc9CDqUtsMhKJbQEkPcvubo4C+mzqV0alQTghjC2QV9mLDmIhvs9ezBCwxyf9zxa
	 qKHwjoHQfAXHwSZF6D51XtBAY+LHmAJo1s/mplS+9bOKFCCQEDJjkYecE2hgNrRg81KOQ
	 Qrncf67AbXxOqDOJJ8a2iVwzDjX5/eY6KAAeyvxOwp3XtW4c2PcslOqZg1fykYuJysq9Z
	 MSXTMcD92Y10gFeB+OdDhcln20B2Ti82DD7BafeOZ6rN2o3RwH+wSngEKyYsCRrh3JRDO
	 aATf4HIcZXbNkeewRPxUh39qN4+CvnTA97XlZA2ZbtgGkViLU5Yb4kGTHPO7AyE5jOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=;
	b=r/5vdziRCnBF3CrEuC0Fa8BDViuPmk+lliihsFGf8dy/29ZcmT4WTWG7bAs8XJZMvnyb
	 zdXZNsjo2c2EzSC9S2Y7bSY29U7dkNDH7yHEhCKW355+Sx9lA/Zoqmxt1jfYF+t8TOvn4
	 NB9/VoQ8XO+E7482oOTbgBZLMbznsJOxbnw0n4TROIOT2D9+lee6GPngVGeCUi6EiZ8Dh
	 0r1cxa+yOqS6GjkZyE9zf3Fk7NGX8aOcZGQ6f70abRGhU7+nnNa0Kx7jCU1U5RdkI+lXw
	 B+yugNqZ3Bp/xzUIXETtRrC2Nz1KVenIvsfq0qbgEX/JY/fGkg2sfyM9t7DhJmhnwGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hvss5G9m;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33790606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33790606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hvss5G9m
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1218757eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802990; x=1794407790; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=;
        b=Hvss5G9mBXHoAafGDDQUN4FuXzGK2I4F28BMoy1eiwhT/Ce+0lcAUND/RSMKtLy5gv
         CRILA6BnD0J2HIQj41dFspHqJggQedsp/mIiEJX2bqkxwK9kXC2LXdJ//pX9P0I8/VGl
         J+Pg2976Iig95d9xreihq1sFJBOpltsLKsrefYl+1CmiS1Sq506b2jJLXqKF8oHJve8l
         mxrZhRIO7tEVjZjDrQrtGurLoZW4zuzDrhYXJzsnqHxHcr7ErpTrUpvs355jM3IsI3sx
         KEKO4d6t4Q4DfIIXOWGunuATiIAUQL7TLaECVXYfZUSAXX8K7xV5CWsRqyYnmrWXIJbv
         H9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802990; x=1794407790;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=;
        b=qqQtex53DHpkrZ/K5FuyPrnk7xMaU1S/bR+zaUYTr9fI2mKb2EflFpJRdOwAZcxFl3
         C5aOnACaYc423TJac6H6wNOKMfPFs6E9UmX9sA+a/bSEMGSiVzKw1Mo3xppPJrmbdgfB
         DCEpyrH6ZBWJAtIy/01n/tHnPzo1W2LIfRRiWXNxl4OagewKebGrr+cTsuWElVjleW+t
         mWjRn5JDf4r56XmPyD+5ljUoNHqEcDv2kgKfGKHBTNKez6jPrR2gvqHds7hNQj7YzEsc
         rXjLJrl2uZG3rZJK5het79K5DAlJXeLMtnXQ1WL8W4O4TLSs+9j6TlsIgoWpSNnBGfue
         euTg==
X-Forwarded-Encrypted: i=1; AKwUvBz90bB1mYb+1c1yl/fejAHkqTg9LBR4kixBceTg1GrVjveZiCfW+A4DgOfdSfzTy8Qsd6BsuBLXJnOVTs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X0abd9praLxs3vEtS9KcLJjLFgfrtqbm94zdIWrZ56DTiVjYE
	97nESq5gH06QRunMomlHd+U3LHuiSH98OBavvFcIOuJwxAAZRx+Ykroo
X-Gm-Gg: AYBFou2RI/ALTsxcvcSVfH78dCGkRUvVsZ6wL+xJ4hkU9Oqp4SxY1xAKeGB9bvRKmE3
	a7HaCvOKraiUHMzXYYYB8GRKune/4u3l6lXcnuTdyyIcjGbvCePtp8bmMxeCuhq5KVB5ZmX9kaX
	Kpgow2pST0N5fJz7bFlCPiqrMr9wEcIr9qG7Bq3VO1Gq0YKXLf9Yr3g3SkTcJOZhBL+Q1INg/NK
	c4U8cUfG3eRP/0ZTMokQtaMuY/suWm/ONvuHFpcomciTlk8f9nPD46QmSnaHTvnQZ9CcsepfiYo
	tIb9/2GWY87ZOywpcfpqjNJY7AoLDy3hU2sSz+lNoLyQvYFzAqLB8MC6jcyV/Hkb0hYXW5/s9AN
	zGfIpxHI0MffwWp1PGe5DMqad0u+IMOWgqUwVeHERSX0kRNNIsMPUOMChJSsAnNsof2SUUEzpO7
	/4KhuI69LX5bJbYPmpRu9kg+OmhzOVhRYpZF4Nae67bvfaw0PXIKZ8WuiibdkgEspyDaY2La5gT
	kF6IUFgN2+It7Ez5QTmfUhAEbdFEqd0QdPW9a2VmUNFtz3iL9RwwlPtf9hytxmST55fuhaFs+gD
	vCzRDMiDBqda/rwoq+Z9iwhneNYl/i8eRS5c5MKya+aRsMAfCGDWYvbquZQ=
X-Received: by 2002:a05:693c:6092:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36a424609c2mr29593192eec.35.1793802990157;
        Wed, 04 Nov 2026 06:36:30 -0800 (PST)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm6208241eec.5.2026.11.04.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:36:28 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Wed, 04 Nov 2026 22:36:11 +0800
Subject: [PATCH] net: ethernet: mtk_wed: fix double free in
 mtk_wed_rx_reset
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
Message-Id: <20261104-double-free-v1-1-efa52326702f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBRF0a3IH2uiRRO2IgZaD18EaRGJ2Ltie
 Ab3XuThGJ7K6CKHgz0vc4CMI7JDM/cQ3AaTSpSWMslEu+xmgugcIIw2RW5VnhZWUyhWh47P71b
 Vv/1uRtjtXdB9Pyt+IfBvAAAA
X-Change-ID: 20261104-double-free-b6b95c2539c6
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793802984; l=1229;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=BAz+fNM/Iyf94+H1t6m97KLkVam+zChfLqMn+estExE=;
 b=n902yQuPJrVcZaUjXryGj97qgtl3JwbpauFUgWDNdIsyHcSg+2Qqp6KztWjzVWsc0l44pJhUw
 UWdl6ZEPjM4AWQvGOzBGd31a3rOHoTI09O+BKXmwl4p8a63U8pOu72N
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=

mtk_wed_free_rx_buffer already calls mtk_wed_hwrro_free_buffer but
mtk_wed_rx_reset calls both subsequently. This would cause double free
because dma_free_coherent doesn't set freed desc to NULL.

Fix this by removing the mtk_wed_hwrro_free_buffer in mtk_wed_rx_reset.

Compile tested only because I don't own v3 hardware.

Fixes: 1543b8ff02f0 ("net: ethernet: mtk_wed: add wed 3.0 reset support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/map/216156
Cc: stable@vger.kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index f40ac5794341..5e9674c9e63a 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1723,7 +1723,6 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
 				   false);
 	}
 	mtk_wed_free_rx_buffer(dev);
-	mtk_wed_hwrro_free_buffer(dev);
 
 	return 0;
 }

---
base-commit: 11140c51df12e594d6bf2c8d2af5dec63b0219ac
change-id: 20261104-double-free-b6b95c2539c6

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>

