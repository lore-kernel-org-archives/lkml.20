Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041850;
	b=Z6lz7sXyOnKPJPcHNhXruCFZvEq86WAW/T2+x5YA1punyVrGDa/NX4FxVx7a0DmiUEkf
	 0+cB1H5yCV3l2I/SD+T14LZf0EqjeeI/okLC8nTKSOdYqqYmz8Td9mPDKUGXRkblKUa1T
	 9IuiksdElUKI9kkaqSjwnuntFT/2DWg2Fib91oXrQG4UlnjBXgNpJnFLny/e6DsrYkUGR
	 us6FT8y7XJc87zvgYxIKFi0qfOFyReFg9Y7u1z0xFNW4yNf6z+xmgTi9UDiPLDkxnzp3j
	 ECQDNYYxkNUrul3338DKpYmpfmnphBzzC5XfEIm/RWU2LW0sw+Tb5MdZ8fV6OGWcBAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=;
	b=hILjB9qZEsq5HM4KNYEJY0rnyKdYC/xdGVerltw8CVzkm0BGxuXS/ilrHQw9LWdfEa81
	 5iDB8qVGxOmpoSsT4gqch3HshroXv5SBNuyVrK3UnBgZgih8Ui5v4QuSp08o/dB5oB3Ck
	 TJKiJf7RBE0KfZ+U0wdWMQVtB4ZBQyyPu88QNE35sbzDrCYiHkV9LQ4t2uKBA+MOoQPNJ
	 iKj2IIYakvW+rcah5rQDX2/8V+1nK+Tz5h/5qprw5GBqblRX+mMGBqbor5AJNETjYhLvw
	 SgO/YdyghjBkHepfU1kq5a3Dd3uvqsMckXK8nTG03SnQLNxH4IONqv0FGWZNEN5HQtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cTBAgOOM;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33C5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A33C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cTBAgOOM
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47bb3ddaaf6so1524290fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041848; x=1793646648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=;
        b=cTBAgOOMT/JaAVdk+8VK3Ol13F3yJNNR4A9lb2ukhnCmvChU6gN3u0vGkPXngPadzu
         78SlP2CS6eck9TOLZ8uX11Nb8nD3HBVKsSfUMz0pd1yPg8ZQDhQzaRZvVrU+laTB97ad
         YRO28GBXEiYR9BK+l0SgLtNzzMOcS7gK5vqtIje8e9KFyWLijApLaBx4OBMj6vXyocsD
         I+3ofZILIstKPIj1n4Lji/yjnVMZdptVbIFo7R191AGgnIdO0vP0zqmwKMHNQLu8VJw0
         eDJiWvHT80Z8WXVhi4w9vWYkd2hw9XQ7IwPJs+wGFjdKH1KoY2IWtgfd5EPQJyTk+SXQ
         5GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041848; x=1793646648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hslISBXc3XOFlG6x7S2yz4ikb3NBWFkUfj2BOwtECQw=;
        b=b/KjdtM0dRxCuqX+fkG2krMJmhLMaCt7V4kKHhzrAPGlkCYtHjOiZJehmhC1Fwo34W
         vsJpC3sZH7leeFrt24FMPWRoXrIytDeOIPJvUK+t2ebARIzVp9Ii2NpO9hJOFPVgvmwI
         oW1rJ4bgkfLPJq73DxR44sJL+xOqSIsrZavf8nUJqXlpN1gvSBzybyHsZ/LeL3Hup6ht
         l8FVX+xHOTHnFbA4hgZ1CCCoVyY+LOpSFwGNRI/1gDeFE1sKfXt7g5Fr4gQNJi1+oOoM
         sIWg8AKVoGlJxQ2N9xrv4g1IAq964zzQdBQ6QPTW2hqrmqI8Qb2vCVepqLzXsnP4Zh9X
         JxwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdU44CVor9YQMrrEfn9am/NgaK9BgMbCtgv8/CpIdm1sNjyW4GJr5yPqeWqyFwBLsNu67/4n1twtCllec=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhjDDxaUaPbAurkefr8lvpI72ZAUcmcMYj23F27X9gN3yTeDfC
	JuWn4IKcXss5fkKbsPg6HqiWaaiRmM9d4nO9tmihCJmAeck4NH7KRavd
X-Gm-Gg: AYBFou14fPn1BtBygX0yACib0GJMySFTW2crHjWAnrWcDeyraBlkVcRe/RMFj3R2HGF
	FBo7DiV53WnWuGdU6qHgSqRYdvW5Fbs6Tof8Qutb2dTBs2PifeLe0tHuizLv3u6sQThP5GdJlD7
	qjNOfSwd2mH4p7NoLJvf3K+M/pbBbgslp1OnbxcdTgbracWWlpktvu7l8Sk0j73NUte7vRonCSy
	C5I2cuhnfriICI8kxqswythUDJrufr/eYMXjkdk+2mF3N9lyb8tMTtMIz+drUF3yQPLfriZjMZ+
	h699oDB8rv8XfXqQLerxMQOKTrKWPDCFfMchNN0aPwlBF249sBUeWWZ/w8fnhGFPbfURL8D6qBL
	o1yui11rBf8b3Zcqtd67uxxeJLNIMBXBUi4Dg9jAEcuBt/ONTGNyz9Vpp2iyf3Z15SyCmg72B03
	gljZOJ6gFmAlc2hQUDtDRiguiL3CSiXoTifGXm7bKnruczl0HDKYZ+c9UrpEYBlLLC/LE2QR6OZ
	/5cWVzOV6FEIn8w3kIY2Cki3ILWwwQvbVetyuk0AU3/wE1PPnvvSsD1Q32A8wLu0GZDfBzBkuC2
	MmTZwbVSchJcjOhgzBr2OxdKM6h+aI+6BelgPW0gK5j5ew==
X-Received: by 2002:a05:6808:30a6:b0:4cb:f21c:a794 with SMTP id 5614622812f47-55c00261d33mr4881021b6e.28.1793041848572;
        Mon, 26 Oct 2026 12:10:48 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:47 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:38 -0500
Subject: [PATCH 3/4] wifi: mt76: sdio: use CMD52 to mask and unmask the
 interrupt
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
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-3-944b1f7e63a8@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=1910;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=9KbBbuhojfi8oGqXT5PidIszoMscEC5hDq/fupskgeI=;
 b=GzThTvCATPI/ee8BIDVBMnOGZfI02Dm40DZnZKhDEynwCCp6k9M/V6+94HfyPX0T6bmxTpVzO
 4ZYw0j+17aTB3Y/o9OUS/sxyVi3rCA6VeyIZ/kuxBLRQX4KxMFuEwNT
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

WHLPCR_INT_EN_SET and WHLPCR_INT_EN_CLR live in the low byte of WHLPCR.
Writing them with sdio_writel() costs a 4-byte CMD53 with a data phase,
three times per pass of the txrx worker. A byte write is a CMD52, as
MediaTek's own driver uses for the same register.

On an MT7663 SDIO module (mt7663s, MSDC2 at SDR50) the writes take about
17 us instead of about 40 us each.
The worker is shared with mt7921s, which has the same WHLPCR layout;
only the MT7663 was tested.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index 3f314e8e1e69..311c31e87ee5 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -319,7 +319,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
 
 	/* disable interrupt */
 	sdio_claim_host(sdio->func);
-	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
 	sdio_release_host(sdio->func);
 
 	do {
@@ -351,7 +351,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
 
 	/* enable interrupt */
 	sdio_claim_host(sdio->func);
-	sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
 	sdio_release_host(sdio->func);
 }
 EXPORT_SYMBOL_GPL(mt76s_txrx_worker);
@@ -365,7 +365,7 @@ void mt76s_sdio_irq(struct sdio_func *func)
 	    test_bit(MT76_MCU_RESET, &dev->phy.state))
 		return;
 
-	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
+	sdio_writeb(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
 	mt76_worker_schedule(&sdio->txrx_worker);
 }
 EXPORT_SYMBOL_GPL(mt76s_sdio_irq);

-- 
2.55.0

