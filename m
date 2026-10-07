Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDF03F107A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398307; cv=none; b=tKMElBNQ0zqXTg3FvEe28eNkQd3v9u61paA6sSZi+AkzjmFcqxhNOQSqKN/ZQ/7f8Qb5xUXv+yTLtA9pILwIE7J7kjUB75mPAfk0gCSnIWoFUwasVtJUI9MIqlZvkdhZuNZieem5hRWl98iFxJVRAAcu6Y504v6OsNUR5UxjOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398307; c=relaxed/simple;
	bh=JpBMAw+tGIDULMwd1xZavj6lhXlGClcjwk1vQb+S4gE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CT8Ne7yMHwFVERI2l9ATnIjokhOAGb2S5NjOquvgeSLIKiTOCr9RIO9mRBOOmP9TKxiRF+7aFE9JAgqvLY9ldI+54fqp8tgNXOkKMA7YXZSIN2sEUGUnMop+EkiRsmiZsnSTttK/zBkEjBSKAgVWH1LcVthn4irBsLSNYz+Lnc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nnfd5wRv; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nnfd5wRv"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91968804af0so20653156d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791398305; x=1792003105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCXCiQO584QO3eX/a3eFjBSu6WZdPOZ9HmP0EKIExx4=;
        b=Nnfd5wRv2WQ84t0Fe15SC017vnuyTYj7NKUhEJ+Uu7d5ytBLt9mt3F3vozgmbEo3bw
         nhb22s8Cj8wOXYi0izqSUxBgiyj0iFXDYReMm61RzGqNUNnS7qsT5kDQLEFWAMvcZWiX
         2cCrZUlHUSxL4RYdkf/+toxns7xJtBXEOG961Sl1GnyGoZzeCJ9/QCIMaOi9y9/+vVJD
         YkZvaR4bPm19pHSbvNZ2joziY/KBejKzA7i6aQzWzSwZE1LcR/wLoTaNc3N1NWpimZhj
         wjIiHDrgew3xvcVSlb/xHtXUmgCr7yyYqQPBuFDJZ2FkQ6Y2Vug1MCoue3yDruHLtV5a
         +8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791398305; x=1792003105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCXCiQO584QO3eX/a3eFjBSu6WZdPOZ9HmP0EKIExx4=;
        b=ntOU9V/d0DxUNakfSc1Aqpdcetb5TQDOhKuxZkVwwwxE61mSNo0AyzsFdlJ3hTqkVP
         PMj8uf8APDeVlJClufqG27Q9A4IQy1YxqSmM066VhvSpS7IIpZ5mDMPCDInEW8CJPV4V
         ESJB7lqiAPAegGWyGGhyy6lhlGvxCKGcIMBRbcEsZPM+E6k/LCIA2P7lYon69ts1jXgm
         Y6z//QaD7lgo5AhUT9mkktTkXEp+om0EW126PH/uKpFIoj87IZot3bg1lL96rxUsTrUK
         U1rI6Has67AZWWRRSREs7KFJ5oln8Dx0yA0JJzGfyqOJg81VCILCKiwBAwdvXMOWkbV2
         xMWw==
X-Forwarded-Encrypted: i=1; AKwUvBx7velbSTsL0FwMvPoU/gj1xrO1bjc2DqasUSavygc488ugAJ0qE27GeoaPZIzIdf/MazjoibrhsWMSEzE=@vger.kernel.org
X-Gm-Message-State: AFuF++nWt9n52TTD6LMEjTgK9wXGH/C3LDkEYTNLDPLVjLD32SZ8e+J8
	8VbqVzcemvjaHkqNoXFqPit66pyQXrD3R1JTF219s4PY0Sc0fxRfm1FM
X-Gm-Gg: AYBFou106C/9iBtL2knCp32f/Y9ST3FMnkMP9rVCssj6NGjY84mas73dvZHfHaHSjHU
	rxi9M6LxjRyYqy0qTmLtmWMB4m31Z2VwXqdwC/ONFvA9mOsOeoHcq4ZJU/enEQnC0OfbkP2nslR
	zMk3QTfbar1SUG3VOc6w9NOUrKU9ibx/OEUmXBucD3WsdQUwoxKWWfivY/FxnrwbhSY7vY1U4LC
	XlODk0+KMq32vGgyQe0F6ctrePHmaBYQhN5FvkfwkF04Tlsf1xKcLe5n2T0rezWvK0V0xl7hI2R
	ukKZwJQG/+KaSxD4ObA6am3+3j7lHE0gti2OUV5s1v9IiIwkGFB+JMO7zPRkVwahbJ45hWZ7swU
	31pWSN5ih7PF6mfcZcK7Sq3q/a3Lz4F/g5QjxrUC7S2w+JdmoJ3rkY55tLHzMS8eidug25efTln
	mWzXX5Gow2QPLz5Ppo4p77ge2aB7YjNFch6rTCV/upX2bp1RSRT3S/XEmidCRCMtnmvwK9uClqZ
	1+KfDifytYM90qVdGjZH5k9IwCwVt6iL2b0j/VZsDh7epnC6t6lZJhYw6hTqYfh/FzekoKg5850
	uDy8MRDJNpen0PaeGr6IZZY4MZQq4CGdQ0RS7cIZfabVBYzn
X-Received: by 2002:a05:6214:1d01:b0:912:d20:9b1c with SMTP id 6a1803df08f44-91997560269mr60576826d6.0.1791398304797;
        Wed, 07 Oct 2026 11:38:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919973a87c3sm25516746d6.42.2026.10.07.11.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:38:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3] net: emac: mal: replace devm_request_irq with request_irq to fix probe error race
Date: Wed,  7 Oct 2026 11:38:21 -0700
Message-ID: <20261007183821.928263-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_request_irq() is a managed resource: the IRQ is not freed until
devres_release_all() runs after the probe function returns.  In the
probe error path, free_netdev(mal->dummy_dev) and dcr_unmap() execute
while the IRQ is still live.  If the shared IRQ fires during cleanup,
the handler accesses unmapped DCR registers (crash) or the already-
freed dummy_dev (use-after-free).

Switch to plain request_irq() with per-IRQ error labels that tear down
only the IRQs that were successfully registered, and add the matching
free_irq() calls in mal_remove().

Fixes: 14f59154ff0b ("net: ibm: emac: mal: use devm for request_irq")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 v3: add Reviewed-by and fix Assisted-by.
 v2: rebase and add tested comment
 drivers/net/ethernet/ibm/emac/mal.c | 43 +++++++++++++++++++----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index 42027665f2a9..236603a381bc 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -665,26 +665,26 @@ static int mal_probe(struct platform_device *ofdev)
 		hdlr_rxde = mal_rxde;
 	}
 
-	err = devm_request_irq(&ofdev->dev, mal->serr_irq, hdlr_serr, irqflags,
-			       "MAL SERR", mal);
+	err = request_irq(mal->serr_irq, hdlr_serr, irqflags,
+			  "MAL SERR", mal);
 	if (err)
 		goto fail2;
-	err = devm_request_irq(&ofdev->dev, mal->txde_irq, hdlr_txde, irqflags,
-			       "MAL TX DE", mal);
+	err = request_irq(mal->txde_irq, hdlr_txde, irqflags,
+			  "MAL TX DE", mal);
 	if (err)
-		goto fail2;
-	err = devm_request_irq(&ofdev->dev, mal->txeob_irq, mal_txeob, 0,
-			       "MAL TX EOB", mal);
+		goto fail_serr_irq;
+	err = request_irq(mal->txeob_irq, mal_txeob, 0,
+			  "MAL TX EOB", mal);
 	if (err)
-		goto fail2;
-	err = devm_request_irq(&ofdev->dev, mal->rxde_irq, hdlr_rxde, irqflags,
-			       "MAL RX DE", mal);
+		goto fail_txde_irq;
+	err = request_irq(mal->rxde_irq, hdlr_rxde, irqflags,
+			  "MAL RX DE", mal);
 	if (err)
-		goto fail2;
-	err = devm_request_irq(&ofdev->dev, mal->rxeob_irq, mal_rxeob, 0,
-			       "MAL RX EOB", mal);
+		goto fail_txeob_irq;
+	err = request_irq(mal->rxeob_irq, mal_rxeob, 0,
+			  "MAL RX EOB", mal);
 	if (err)
-		goto fail2;
+		goto fail_rxde_irq;
 
 	/* Enable all MAL SERR interrupt sources */
 	set_mal_dcrn(mal, MAL_IER, MAL_IER_EVENTS);
@@ -703,6 +703,14 @@ static int mal_probe(struct platform_device *ofdev)
 
 	return 0;
 
+ fail_rxde_irq:
+	free_irq(mal->rxde_irq, mal);
+ fail_txeob_irq:
+	free_irq(mal->txeob_irq, mal);
+ fail_txde_irq:
+	free_irq(mal->txde_irq, mal);
+ fail_serr_irq:
+	free_irq(mal->serr_irq, mal);
  fail2:
 	dma_free_coherent(&ofdev->dev, bd_size, mal->bd_virt, mal->bd_dma);
  fail_dummy:
@@ -729,6 +737,13 @@ static void mal_remove(struct platform_device *ofdev)
 
 	mal_reset(mal);
 
+	/* Free IRQs before freeing resources they access */
+	free_irq(mal->serr_irq, mal);
+	free_irq(mal->txde_irq, mal);
+	free_irq(mal->txeob_irq, mal);
+	free_irq(mal->rxde_irq, mal);
+	free_irq(mal->rxeob_irq, mal);
+
 	free_netdev(mal->dummy_dev);
 
 	dcr_unmap(mal->dcr_host, 0x100);
-- 
2.56.0

