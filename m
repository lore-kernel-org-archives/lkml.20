Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AC7363C5F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314248; cv=none; b=Xoy1kkjhENcwiat5O8pTFjYolpJf5DoTgC1LPACiaR4JXlpgP7yjb0m092XUtMUjaT6NVnbwZoylPclp5wQ6GzBPGC0pZkbQWmgghaqXc2ZFJ+0z2fmmGuOcJqw+iJKNYCcDYMsxCBMWLUwbd60xS1iooA4DC+dT8F8iSHgEi3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314248; c=relaxed/simple;
	bh=Ik8QSbgXP5buhxF8hVJJ2LX4PPnIIT1KbX8G1W+E0SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liMLUdEpbatFgoi/ZDjmiDPMqlRX/562xxEPH/tdQ0595umhIkLbL/8Jsr4ePD7M2rpaVI5Ol3EAzZR3gcoWWCWZftVwN532OewBHDN4xT55lHgCY6CHrSHffRxebG7ALCzGXxxswVXCIh5q0bFG8tHV3XWxOeRvMn461wHopxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=Lgy4n7fc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="Lgy4n7fc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5335cf904so4380605ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788314239; x=1788919039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8NexaY5OOI9G959hLH28cElmfzdE2NH8o0S1EDtR7Y=;
        b=Lgy4n7fctmLm0VRdGB0LQd3y29ORZSxGQdnw5PrQ+Xwc/RVzHoPyoscLCqWSCL/cV0
         t5o50+BopFN/QtF56t7uzdshXY38OfQprnUGRu1fomkWM7eOFnVKsm6wXlrHyymhNba3
         LiPGbyzGPIfTMQeI+kPyXPcgqFrnWWeVEyoNdMl9ilaBTkA/dEY69qt7qD876dnDLdWd
         At8gHvXLs805Voihj5n1yRCUJaVLO41HGPj+T8yYwXrej+MfTQkMeV9DDogXdVLpf0DA
         WhSu/jlarygTuwN0ZPLq83SRSX2x26TCJDA7W+DjXt2280ZFaajbwmPY0C4EjkhbjD4j
         +ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314240; x=1788919040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8NexaY5OOI9G959hLH28cElmfzdE2NH8o0S1EDtR7Y=;
        b=RNFeNt89J/LXyeHw1zI5D1Tsgx2xdwqgUuGZUquj0C6HWrAbuGjAs/JGOrGeK5IOy+
         6aIiqnEoSOAR7c1zhKfLzg/XnFh9u9R3MkvNB98jtDznPBAw/GX/jIYe7sAHDBm5Del3
         8hag4KVD7HOVZbAMhUM7C5O0Te+DPG+cCdVYCpZdAf/X0ltTGlVW5x3A6Jz62fFzWsUw
         cfcGKPq7EdMimIdLsaFGy4vV1isNjdOK0sVgklBCLzkFL7RxxRYzM3YpzJsi6ZA6t4Or
         Begl8GLddKytwxtx1AkAOjVPbPOj3WcH+dghthCI3oGKqRMG5X1JuUT4HM9U8fMRl3+j
         Tm6Q==
X-Forwarded-Encrypted: i=1; AKwUvByRD05Kdw9bhzneaKK2OLu8ztPiy+67uH7A2uDnr7NzBoJTQB78xW++zbiX/fcCbF8WXtMPdQYslvOfVjg=@vger.kernel.org
X-Gm-Message-State: AFuF++kYFaEuk+cuK0flWpv/7LxZmb98CcpcFQwAFhPYdDBokeDN4Xzu
	SAKobk73+czNDcr/k4tm8NQteJ9qj1X2T2x8c0+j8ICnCD6BwUh8bIVbj+IUXXecFw4=
X-Gm-Gg: AYBFou3UOk7zKvlLmgtRMe0idUXKFPiaXwoG9Dhp8VcL3NTTQew+UNkN2p8qGNwRYGT
	pBGFf4RmBT0o8x6j9BslZKdpgfUVDbYKegZtLKf47hrxpfr3UE0gnPC4Lj6lgsSbZ/+zv3qDxlu
	1m+sV4WVDBxBTqM2tExCXcvpLb6EgWOeThkQI1Km7QRkHvVGc34yjwYbK9W7e85S0ueQqZg3j8o
	qpH3ZKmlPJU1npBIl08IUh5IqA3IgEnr24eGIN8UJ7M1yTkToGrxnJvn3O/b455I0Yd4JUMtDdN
	FzEcRX3yQpyb7p/2dyFdX7QtPhMUw1MwuW6VXACOmGr4Oo3vjrFGt8TGpHfEmsJIdIwYFmZat12
	OolLKzyUCkbhPMjEKMB2+IeieZkJCBtUGq8KEU5cRgakhFfU2QMukNy/uVoUUt4nMA8SQL7k68q
	vpIOz4ZikJACA5MBPGkTgDNH1ia/yAbzTZBSk4OU+FdHk=
X-Received: by 2002:a17:90b:524c:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39aedfb8ebcmr1991272a91.7.1788314239469;
        Tue, 01 Sep 2026 18:57:19 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:71::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfe6b6sm2346061a91.1.2026.09.01.18.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:57:18 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Edwin Peer <edwin.peer@broadcom.com>
Cc: horms@kernel.org,
	kalesh-anakkur.purayil@broadcom.com,
	colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com,
	linux-kernel@vger.kernel.org,
	raphaelcf@meta.com,
	Joe Damato <joe@dama.to>,
	Sashiko <sashiko-bot+sashiko@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH net v5 4/6] bnxt_en: Handle buffer allocation failure in bnxt_rx_ring_reset()
Date: Tue,  1 Sep 2026 18:56:47 -0700
Message-ID: <20260902015652.2421609-5-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902015652.2421609-1-joe@dama.to>
References: <20260902015652.2421609-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bnxt_rx_ring_reset() frees the ring buffers and then reallocates them,
ignoring the result.

bnxt_alloc_one_rx_ring() can fail in bnxt_alloc_one_tpa_info_data(), which
returns -ENOMEM on the first failed allocation and leaves the remaining
rxr->rx_tpa[] entries zeroed.

The error isn't propagated up, so the loop in bnxt_rx_ring_reset
continues and at the end the code re-enables TPA with partially
unallocated rx_tpa array.

This means that when the agg_id from hardware is mapped to a SW index in
rxr->rx_tpa[], an uninitialized slot can be chosen which would hand a
zero DMA address to the device.

Fix this by falling back to a global reset, which is what the existing
code already does when other functions fail, but unlike the other
failure cases this particular failure has to return because TPA can't
be re-enabled since the allocation failed.

Fixes: 8fbf58e17dce ("bnxt_en: Implement RX ring reset in response to buffer errors.")
Reported-by: Sashiko <sashiko-bot+sashiko@kernel.org>
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
Cc: stable@vger.kernel.org
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 3755a30f8d40..a8e5fdfcdf59 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14604,7 +14604,14 @@ static void bnxt_rx_ring_reset(struct bnxt *bp)
 		rxr->rx_sw_agg_prod = 0;
 		rxr->rx_next_cons = 0;
 		rxr->bnapi->in_reset = false;
-		bnxt_alloc_one_rx_ring(bp, i);
+		rc = bnxt_alloc_one_rx_ring(bp, i);
+		if (rc) {
+			netdev_warn(bp->dev, "RX ring reset failed to allocate buffers, rc = %d, falling back to global reset\n",
+				    rc);
+			bnxt_reset_task(bp, true);
+			bnxt_rtnl_unlock_sp(bp);
+			return;
+		}
 		cpr = &rxr->bnapi->cp_ring;
 		cpr->sw_stats->rx.rx_resets++;
 		if (bp->flags & BNXT_FLAG_AGG_RINGS)
-- 
2.53.0-Meta

