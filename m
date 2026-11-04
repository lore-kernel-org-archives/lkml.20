Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788467;
	b=aLtZcZnzPB8HEUA20g/ElufQtAgWBwr/GtBwVQHEzKb8N53pVUo3XFlVscc3AP80W0Hw
	 MuS+TElEEzFrHpYmmKJdi51wdJPAPlZ4vk0aKFXjDQN4eimwFENKlTejuL03qvh4SqUsz
	 mKI1rbucFbicLi7l5h3whUMyMizecsZo2tOiUgc1DvYZieg++EOAsydVfUuV5+swDj4+R
	 ILD4UMduLhwUvIR8k71s4DPJRyskBkn7cBBgz2K5U0pCKfGZ5U8V8hRR4hpLxTL+tUB6g
	 RFspVlTyfaTMNi4OHh6glItog5A0TqXsjRkX64Tg0ZUFTXYRqsmscNRpvIyAaEL31vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h/IyEnODLjG54iLprqGuhwix9RXe6REIL8RaNZR63d0=;
	b=aeJkhMkXlv0wX6iIV0ILhnLT1ltt+BnnyFf+hvUNxFnLNhu+EUJS8fZEU/w8prF/M7sh
	 eXXW1RhayuLSBqMfyvjsjjaFVV2Cd9xl966UOv2RO4H7A+UYttuHvj5YYz4Z73ypeiqHQ
	 dTO88BmRUBbBMGWpWZvEvQp4uewPVpSvuRscg5jq1os1lh9C/FHvZQE4aiZtCUZNiXXqb
	 ZOk6+t4U/7VtuRxQvUaz1rV7YMWvk+xQjE+1NBK5f/9XIrAU7ELBR6Axdgaa3ZL1+do5I
	 B8Ct1lcyvHYFcS09pG0sb49JWUY7yxSutMDBov9hZlOfTiQR9H+bo2xW0zQS1irziAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0UYgqRB;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43AE606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B43AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0UYgqRB
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490a1be3bf4so15143f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793788465; x=1794393265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h/IyEnODLjG54iLprqGuhwix9RXe6REIL8RaNZR63d0=;
        b=H0UYgqRBv3N1RDy5WALaO+DwGXv+cpb7/uVGz2PG2K8C9+GnrO9hjaoFeK/wPuA1O/
         aduIJ5lRrxepNZjuDICFbbDPyDcnpa2To1lLReQG3xRZuqdP7Mp9kF9/wswuMrDRWyTF
         Skq9uTYmNFd1Y55lWLhjsy8jcDENfH+maLhjRXGGOa55CgtXOpNjXc56qRGJO9xHbKKW
         3fRdYK9WrbPc4dUK/LrZRRnj/7pbPtb5x63h6O9BpkQr/IU4jqxbQ9ZRnuE/fcfoftZ0
         D1Od0704SoghcyZft4+eIXlaRAfPKuGBudLJPaJMwiBHPSBRArYwym9jNrlkGwtuGzaF
         abmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788465; x=1794393265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/IyEnODLjG54iLprqGuhwix9RXe6REIL8RaNZR63d0=;
        b=WbvBQd2psJY6f84JXMt0XxgGIyeAMveAlK4P1Pj9+TZRkRK2oHU3+Sl1nVqhKNpMpE
         TpjziAOXNiv9OKH6pvTGNzkcM3IZQmh/M8JLAdnRskb7cZg7d/6mYlG4atFEUQ+liwnh
         y+x5pj7XCG6QYINB0sbfIjnPQaXkHZNwSawhdTaac4alplCAoipOB0irN/a9RY8zRI4t
         n1vZwHCbMHtPb90XO/R7pvBhESM8Po2Sb1S6Nm3t4+t/rvIYcUvQoiDvZqHCfjqOMv4S
         8Oq25TFzY/HRgubpuYuyGXkoLi/8xAavMSJ8emriU4DCVrgLkZ6RrK2HBox0uQY2DPsD
         DqxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuGQeI6r2r6RWAHsxtsVWKuEiOFmMp5dxsfOCcse78adgnK/GXUp5uT5+gXj7vcS/YupAQhwjS2dlP1Q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xzPZcUN6z3SoJdSfpS+QAg83zj0Iyw63UkKVA9q9+UBtkaZqF
	x28VKif4b+8ZSixvZM//j7iXzfkluIqpFY2JaBs8vux6hBC4LUYFoKoWyef0uGpw
X-Gm-Gg: AYBFou2o3fdYCMo07Us4DHJkvAr/hnz0R9NF2CLNrgkqZNW59netRV3/isUpUG69iGB
	dKOp2aSK6yzVTu+HxfeCitevy8bcKtgy67QhtC/wViDxclBIgFBVRz8q557lLSKHNX9IuXr4K9U
	ZBmGuOFqoE5jnUGrUzLTJqpvDvOyI+CUPSXTmZxxna9cN5+7EzsmB/ufsnJSHtnEHXjz//jznt4
	IOmE/5YaxKdiIyVBvWin9mKoajJYVURYspwsHbEqFJn31YA1C8wvY+CoH4f4c1JVIX+Ke1d6ygx
	M1++i3cP6klQRwB9R643JQjaUHRnAYmE8XdqNVnd8D4zBDbP9xe/dkuxwWbM4qIpEkMNRH2kCTh
	p5gAAgndOYsAFTZaoRxvOQ7nEmE3KXc837vQYqBb+jiuqK+tqNPSI8qHurRA+kQvbAYG1nEN/8T
	BPf0MFDmiXepPJ4OnykW5xLjyxs1Nersv0GyVoc9VTkwQTguUMEmbmeE+Ydcp55QhNsj3woTl50
	3RWIDcn66KNWgLJ2/hMmCFMwwqcKHXNft5XuJZ44AJ1cY3xt8zOgS3VunCho5tUdKXo1dZnsmwy
	IJKV4t7nlyEjXuaiguJ5ipTn4yTXwVBPTwxdoY6QsoZTLp+JhhI1Ud8zr6i7DRQMUcbSCq/2eHZ
	95o8A57glvyBQhjs8bbk=
X-Received: by 2002:a5d:608e:0:b0:48c:698b:502c with SMTP id ffacd0b85a97d-48e6e2bcec8mr28938089f8f.1.1793788464784;
        Wed, 04 Nov 2026 02:34:24 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm3105132f8f.41.2026.11.04.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:34:24 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hariprasad Shenai <hariprasad@chelsio.com>,
	netdev@vger.kernel.org (open list:CXGB4 ETHERNET DRIVER (CXGB4)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] cxgb4: clear the sge maps and bitmaps freed on adap_init0()  failure
Date: Wed,  4 Nov 2026 11:33:08 +0100
Message-ID: <20261104103309.24360-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The bye: label of adap_init0() frees sge.egr_map, sge.ingr_map,
sge.starving_fl, sge.txq_maperr and sge.blocked_fl but leaves the
pointers set. If the call of adapt_init0() from eeh_reset_done() fails,
then a subsequent call to remove_one() may call free_some_resources(), and
free the resource again.

Clear the pointers after freeing them.

This bug is theoretical and was found statically.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: 4b8e27a86d20 ("cxgb4: Allocate dynamic mem. for egress and ingress queue maps")
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index d449cca00608..9176653c7d70 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@ -5402,11 +5402,16 @@ static int adap_init0(struct adapter *adap, int vpd_skip)
 bye:
 	adap_free_hma_mem(adap);
 	kfree(adap->sge.egr_map);
+	adap->sge.egr_map = NULL;
 	kfree(adap->sge.ingr_map);
+	adap->sge.ingr_map = NULL;
 	bitmap_free(adap->sge.starving_fl);
+	adap->sge.starving_fl = NULL;
 	bitmap_free(adap->sge.txq_maperr);
+	adap->sge.txq_maperr = NULL;
 #ifdef CONFIG_DEBUG_FS
 	bitmap_free(adap->sge.blocked_fl);
+	adap->sge.blocked_fl = NULL;
 #endif
 	if (ret != -ETIMEDOUT && ret != -EIO)
 		t4_fw_bye(adap, adap->mbox);
-- 
2.53.0

