Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AC74EA380
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548627; cv=none; b=XsVlB/5jDzX35g2IW0K3WLZJSXbXOne+ekS8ZsgMl8Yo+3i5wGpoEhZ+U+ML/+swl9NygAywMGAU+N3NUExMrhmymsrjANs1c1evEGFbWUEyqKSF7lovdpldT/V+QSTJB7Cf0FjuWgN5Uwo+mNmCWGhUA+XNP+7ZLywLth3mdLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548627; c=relaxed/simple;
	bh=DO7DMkjxZEigcM53tXihbKHBbiJ18hpi9zesU/hYX0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jnMicFLtPnuMJxZhE1HM3D5VRO4DBHYspEE7hxLa6vWFdMKv/bIicY2oh5mSR73jPGarZgcp8kr58UZhwDkit8/9kN84zTfw+XQEHyolbitxgst14tUX4s+XfhQq6jzhv7AApLcL1exzEtNmAlRs1Xx9VlEDxLE/Km8pQQaccDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b00fkyDn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b00fkyDn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8687630fso12599835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788548618; x=1789153418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kaSNtNQWzvcVB4C4f4zKpGCpc9emK5Xc8gRPrXHVrI=;
        b=b00fkyDnATMtBsVIWaOBe1GrJM7ZvAVDKyDFRzmNjh6lC2Ltuqgr6T7848MtDDRfAn
         0yBE02fOxMNpLoyy6r1JZQhn55AYJeCcuOeKjTghT2nXsV1oegs5xtEvNsrKoJujLjXq
         0qUkLYBZu2APv6tYOthcvU5M1grIpgl9cUyIBlqsG75USpBCsTnSE7j9/1PysTtjFeY/
         TEalx9gjwjsRFjnHXuHelxPQsj+s9XKuMEGuMWDP23Lnz8uJgcTxrJV5X8xgn9Pq6ZpL
         tXUAzz/x5y5eo+OIQXId8wvJD8/8t6GWVD1B4vSbRLJWUKoO6a9rb6R4/8HmNJc/5ruO
         G/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548618; x=1789153418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kaSNtNQWzvcVB4C4f4zKpGCpc9emK5Xc8gRPrXHVrI=;
        b=qhETWkJKR939UrFZbr929ciH6g096OOUnNwuL2BJAHsiGwD/g6KJbGyEixWMdL4Jl7
         ooGNDpgmI8TaxCQCrebKEPr7hn6onz66mKCxYfKmAJcuQDjqZw70WT+2hEWLAENoEIV7
         fgKykywBW+mQ1yDrcUMY2OAh0SvtUshouvfk4SsDH/WD1uUZamxdEe8kjhEvAI5Y2D1A
         FLEc4CuhkpoO8CHDQggMUX1uRJuAXKy1Noceb1Efr6VrfWDhao6XmZrkVx+D+pyWbPab
         WJwKo6tXKSTPlcDskUx5Im0FkcK+shV+eWgE5UQ/v7eOCpkrYNrBtjcIsIWfgM9G+ZuM
         BuZg==
X-Gm-Message-State: AFuF++m1UGtOyd3U/k//vRennvHo1jzb4/yqhydTMAmgJwYYpXKPTmRB
	kBLkngrA21oV4VjbZT7BMt5LLMZ7odIYHrViDHt8TiiQfCYbzsz0tgY=
X-Gm-Gg: AYBFou3Uh1UMKb3L3qOf7CB1c4Cb1jmIWgvWQ3HYu7/5jdsTlxPdT1ucMZeL/A6hTFK
	v4ZnIng6gJVX40WHQMxVg85BBwauBJRmk02r4SfuXZIsVr94O4xzB+lUscg/FO/IVzWLGifqdIc
	0u+015Y8DksPJ/jl/uhgUOVwP0UtCPEU6JrA4TvHsRgCZtjovZEWghb0XxDeN/hbV5tmw52OYAW
	B1xo6bL8pjTGen8H8295J9vFvJFZEM/2fs0FlOYvdcHz6tGdBnTU0AT2GZ2LmSeenMIhUk5fnlJ
	MWgS+isb4JIfDy4jNjGp6IEgf6s20I8FicmSaw1DnAd11nPiXhfixNPK7frS0BtK7CuilFjQDJX
	2ML20T33OELrse210gYwr3EZqmNBHarAPTtMELRNe+uNZ4rJTAPNO58YtMVtzq6OSNUJzBT5bHO
	6ihjUkuXZ6eA8/84hhe9wOxxY+hcvCS0F+3z1hVqTqQfEseSLNtGCHnmppGDtJbWU0V/9QUTOXj
	R9kDtI2QRmi/NBVQXp6UlxwuH2MX8ndGqEP8QGmFPhWs4QTbGfYcRDvpWQp/2xcjgo69YLE9sle
	9cGbBkOKW4/HgXMJVFeYirNgN1I=
X-Received: by 2002:a05:600c:628b:b0:49c:fa21:e742 with SMTP id 5b1f17b1804b1-49cfa21e956mr54287265e9.24.1788548618236;
        Fri, 04 Sep 2026 12:03:38 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7710aa5sm89643535e9.7.2026.09.04.12.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:37 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: ath9k_htc: derive the PHY error filter bits from software state
Date: Fri,  4 Sep 2026 22:03:31 +0300
Message-ID: <20260904190332.815525-2-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904190332.815525-1-nerijus.bendziunas@gmail.com>
References: <20260904190332.815525-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_htc_calcrxfilter() calls ath9k_hw_getrxfilter(), which reads
AR_RX_FILTER and AR_PHY_ERR back from the device, to preserve the PHY
error bits that a spectral scan may have set. On USB each read is a
WMI round trip. When the AR_RX_FILTER read times out ath9k_regread()
returns -1, the recalculated filter has PHYERR and PHYRADAR set with no
scan running, and the device forwards every PHY error frame to the
host until the next recalculation.

The spectral mode is already tracked in priv->spec_priv. Set the two
bits from it and drop the readback. This saves two round trips per
recalculation, and the bits are now cleared when the scan is disabled
instead of staying set until the next reset. The bits still go through
ath9k_hw_setrxfilter(), so AR_PHY_ERR and AR_RXCFG_ZLFDMA follow the
filter as before.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index bed7ea2425a0..299064a7fa49 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -868,14 +868,14 @@ int ath9k_htc_cabq_setup(struct ath9k_htc_priv *priv)
  */
 u32 ath9k_htc_calcrxfilter(struct ath9k_htc_priv *priv)
 {
-#define	RX_FILTER_PRESERVE (ATH9K_RX_FILTER_PHYERR | ATH9K_RX_FILTER_PHYRADAR)
-
 	struct ath_hw *ah = priv->ah;
 	u32 rfilt;
 
-	rfilt = (ath9k_hw_getrxfilter(ah) & RX_FILTER_PRESERVE)
-		| ATH9K_RX_FILTER_UCAST | ATH9K_RX_FILTER_BCAST
-		| ATH9K_RX_FILTER_MCAST;
+	rfilt = ATH9K_RX_FILTER_UCAST | ATH9K_RX_FILTER_BCAST |
+		ATH9K_RX_FILTER_MCAST;
+
+	if (priv->spec_priv.spectral_mode != SPECTRAL_DISABLED)
+		rfilt |= ATH9K_RX_FILTER_PHYRADAR | ATH9K_RX_FILTER_PHYERR;
 
 	if (priv->rxfilter & FIF_PROBE_REQ)
 		rfilt |= ATH9K_RX_FILTER_PROBEREQ;
@@ -906,8 +906,6 @@ u32 ath9k_htc_calcrxfilter(struct ath9k_htc_priv *priv)
 		rfilt |= ATH9K_RX_FILTER_MCAST_BCAST_ALL;
 
 	return rfilt;
-
-#undef RX_FILTER_PRESERVE
 }
 
 /*
-- 
2.55.0

