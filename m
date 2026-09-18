Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A523D7D9C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696284; cv=none; b=e+54kkyKnrhDnONm6PciEVNlQ632CojY/fX0LDY/HFi4SWadYIf9OdZfRC1kQ139PaP1IMMMNlMUjj3Mv5+5eCRUy41rSPWVEff8xV0x7PEOIZ4sWg59M8FhY1MUGO1/Qw20bMre46qjrGfJ7FGr1X378o5YKhx0MqH1cruTU9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696284; c=relaxed/simple;
	bh=AiEucyKYQMPvNWo+IIVc/9PMmV76gLA/FT7OpKG7L+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9IWi5FfuvXmc40qmoBlyxnxYgj3U7x9fVvfYbzyNIoaMKmMbk1ZIr4kxAoUKDZQu3A62Z372WL+1mVD9tlcTgWDccXH5kFADvWX95liA+ehdOPQRvwiAN41E58qWjYA9kGScVX/xY3lHbJqYTtuYU5VFKA90NUmGKzW+Qjcn3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=E1WzphlT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="E1WzphlT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so1244395e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696271; x=1790301071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vme7iQX7z/ojmxoziUOHospzzgi7+w3Pxzs6D7kYOBQ=;
        b=E1WzphlTuym0BKD8YQegEtuxlSOcqncihpr6N2tMg53b99Wh2CYt0h4Z2fJ5UyKxhh
         BwNppCewlexcbOXEc6UgdtmDa7igjMQmAx+/ZfXpoz2Y8YEfaEbPWOuFo624S7Tm6zSw
         X87dbYDoaNDTlfUN6LaerQ0HWLzJtt9nBcmUzP82Uo3CEdjcCSgKpQGwjkHAHrm8MNUV
         i635SDcz7AwZNMAyvWoJ0j73WNyRmAXthDLaHFF9pD8FRxAdxiHtBRHMP0eRQi1TRjTj
         bThEMNJP1qFFnBKv1Paenn/SdQJEwSYem1FaHJBXY6ORPppUlgEU4aiW8M8921xzVDPC
         3WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696271; x=1790301071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vme7iQX7z/ojmxoziUOHospzzgi7+w3Pxzs6D7kYOBQ=;
        b=GrSpLsSA4dVh4Oe9Li3G40KRL/WIs66X1XjjEFhuN1kKjOCcfnqcW5vjf+LPAReCuq
         e0pSoYSI9t7n3g+W+F2GYZMSt8rBWF2fU1LLSjXn/UcShRUMINLVaH0prdhYjHSaAMFr
         PqezmdWNeB5lc0PzkxEBgsjKixpfmk7PHclSMVYH+JYX+gRXQC59ExyzAVZOGNZm475c
         paKRqQQMJreIZKKhbPbBdSHj6sN8MgVBSvLMm/DWlYZZB+v04WsOtSxDxji5ZPck+R4+
         hSmiidhhCHlbtcholCx+JIsIQGrfL/Km5+plhbMur5Zas5VseCYPgh4ZQdf2T4BEbF8L
         2/CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmCnItucdZ3gBRzwmZYurMAx4roKnxyzu9Vi+11/Des2p4EimkoNRFEMYB0zvjaPyveCSDFkRptYvuorE=@vger.kernel.org
X-Gm-Message-State: AFuF++no8qTtMancT8i4qDo0cA8dD5vgdu5yFw8Yd6IJxy8LmwcnvKGH
	PUWvgtHHWczVVDqoHlDALLuEBe5rmg7gau22qCwOZQvsD8A0wt4wncGi8gJhuA8OWv4=
X-Gm-Gg: AYBFou0EldIJ7es/ZuN67VCt23dck2Dko5zvm/cpfwt8BbCCLEfpV+CGp5TUmKG5UGE
	yqadW1liso1lRPoAXonQGNPL5E+/dXtIm7QNXoQghTYYqNMV4ayD9K7i3CihWem7Nfb2WQ+8KH/
	FyGGDYe/ov2ytOT6ABjcXfBf2yTuPjgVKcqrV6qEyIXHnB0y0/oIhXodR6ZwbgKrtNNQwhUxQh3
	bPL08c4/9tWUGKVnamux93rXvp9WhzA8vJRjdRL1va6fUBWhnF+I1n3lx30qVNTwLrofptJZ+d3
	3z3dO7TTktB+bOd6+ovV97N/ifpFGWJmlxFNKGe6ICcKRNBDSEXZ8F3DGsUJWKEsmJjfeOfI5c/
	akVftKFOMfJHpI1rC16401rC7z6H/uYxIAohdgsvF9ZPNjrrX0xyIJLRNkgrTMnCDfKrIl2I212
	mYrxedpYyLEexW1gzF743LDRVWQw+9X9PfYkpUz8JTKUAFYRqTfQ==
X-Received: by 2002:a05:600c:34d2:b0:49e:6838:c813 with SMTP id 5b1f17b1804b1-49fc5865314mr7179095e9.33.1789696271060;
        Thu, 17 Sep 2026 18:51:11 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3b186sm80478f8f.12.2026.09.17.18.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:51:10 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net] net: phylink: unwind the PHY binding when bringup fails late
Date: Fri, 18 Sep 2026 04:51:09 +0300
Message-ID: <20260918015109.2518797-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phylink_bringup_phy() records the PHY in pl->phydev before its last
fallible step: on a MAC whose phylink ops implement LPI,
phy_eee_rx_clock_stop() can fail with a real MDIO error. The callers
unwind with phy_detach(), which knows nothing about pl->phydev, so a
pointer to a PHY that is no longer attached outlives the failed
connect.

What that costs depends on how the caller got here.
phylink_connect_phy() goes through phylink_attach_phy(), which refuses
to attach while pl->phydev is set, turning a transient MDIO error into
a permanent -EBUSY. The SFP path is worse than that: sfp_sm_probe_phy()
answers the failure with phy_device_remove() and phy_device_free(), and
it assigns sfp->mod_phy only past that error return, so nothing clears
pl->phydev and it is left pointing at a freed phy_device that
phylink_resolve() and the ethtool helpers go on reading.
phylink_fwnode_phy_connect() has no such check, so a later connect
overwrites the stale pointer and hides the problem. A disconnect does
not: phylink_disconnect_phy() hands that pointer to phy_disconnect(),
and the second phy_detach() on the same PHY drops references the first
one already released.

Clear the binding on the failure path. This is the same operation
phylink_disconnect_phy() performs, so both now share a helper. The
PHY-side fields are left to phy_detach(), which every caller already
runs on this path.

Fixes: 03abf2a7c654 ("net: phylink: add EEE management")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

Notes:
    Split out of the [PATCH net v7 0/2] pair (20260909204306.2374562-1-f@lex.la):
    2/2 is being reworked per review, and this patch has nothing left to wait
    for.
    
    Reviewed-by was given on v2 (net-next v2 1/2), lore message-id
    006ad9d6-b51b-46ed-8c5d-3649b70a4f62@lunn.ch.
    
    Code is unchanged from the v7 posting, patch-id 293623f600b8; only the
    hunk offsets moved with the rebase onto current net/main.

 drivers/net/phy/phylink.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a1458da8111b..1efb45ce8534 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2085,6 +2085,18 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 	return phylink_validate(pl, supported, state);
 }
 
+/* Disassociate @phy from @pl. Caller must hold pl->phydev_mutex. */
+static void phylink_clear_phydev(struct phylink *pl, struct phy_device *phy)
+{
+	mutex_lock(&phy->lock);
+	mutex_lock(&pl->state_mutex);
+	pl->phydev = NULL;
+	pl->phy_enable_tx_lpi = false;
+	pl->mac_tx_clk_stop = false;
+	mutex_unlock(&pl->state_mutex);
+	mutex_unlock(&phy->lock);
+}
+
 static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 			       phy_interface_t interface)
 {
@@ -2199,6 +2211,12 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	if (ret == 0 && phy_interrupt_is_valid(phy))
 		phy_request_interrupt(phy);
 
+	if (ret) {
+		mutex_lock(&pl->phydev_mutex);
+		phylink_clear_phydev(pl, phy);
+		mutex_unlock(&pl->phydev_mutex);
+	}
+
 	return ret;
 }
 
@@ -2349,15 +2367,8 @@ void phylink_disconnect_phy(struct phylink *pl)
 
 	mutex_lock(&pl->phydev_mutex);
 	phy = pl->phydev;
-	if (phy) {
-		mutex_lock(&phy->lock);
-		mutex_lock(&pl->state_mutex);
-		pl->phydev = NULL;
-		pl->phy_enable_tx_lpi = false;
-		pl->mac_tx_clk_stop = false;
-		mutex_unlock(&pl->state_mutex);
-		mutex_unlock(&phy->lock);
-	}
+	if (phy)
+		phylink_clear_phydev(pl, phy);
 	mutex_unlock(&pl->phydev_mutex);
 
 	if (phy) {

base-commit: 3b95a04eb5f95bf6a016a1bb9ff37d3eee48de63
-- 
2.53.0

