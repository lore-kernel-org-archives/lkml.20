Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4633D45C5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789782823; cv=none; b=MBHy9yXLmEZJbte9gYLMUyqZDPCF4ekxnS0A+1BMdREph/scURhDjy5hYrtTC+hGEKOz954bSUkJX6w2gYwHOvjvJjvgnxKMTHIdpA6vtdt7cKMgX81+WHDdukJuOUfUZyfvMjlH6dou3HPSs1Jvb/dIu8akbx0eznMyEBReMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789782823; c=relaxed/simple;
	bh=nb2kXHLmIRybkJ/H039Snzrs6VpQOYBmqw0+R+pTksg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7/5uCY8ts62YMcPoLAFbWTvPVcruN4/u/I9VfctzVH3cUD8SUUNKQOjNPAxHwyaUWDy0fwwOkVW5JxpfQf4h+DT2/R0XN3NyUKBphyYHJOUinulOB9jcLm7hMvbpWo5WvjjZk9Sp3YeY2U78zuog38CNZdBbRkMiKlQBF5vB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=WVX8/WRy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="WVX8/WRy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so629598f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789782820; x=1790387620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPMioQkYukUU4bkjSm6lAwt6qQJA/lrd+IqcZBYF/hg=;
        b=WVX8/WRyp56oYEy3YlbPUxLM+RlvZ8CuKSrwgV78THaAsMSKgalBOf8x5+Z7EB1iV0
         Oc5P9CVAhbkI8c2KisdZWCTer+RTE2LzIdIqHNBJV4Ul5gLwHhp4EnOPJzgTm4Jt5N0i
         IedE1dZikwyo0sMcCEVG7wjD5DdPtgJWbQ9tsoDpRNYzELf/Vl/+qIbU2Cja+e89V2Pl
         SQiJdqRgRFiSA++uwiPipGdDJoQGZGZJ5+7HEZb3guFWgZK8JAZFwKxlM5ewFM1tsycv
         vQYdspWw/px2FZIuUoQHM9Qsi7Hp/GvPWnnnxjTI5DZE47LMloqjyAZl3MYQV6S52Nr8
         YX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789782820; x=1790387620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPMioQkYukUU4bkjSm6lAwt6qQJA/lrd+IqcZBYF/hg=;
        b=Diwi6rPRdhAn8ApIY7fhF36qVnfSVoOlWly5W48o8HGhPiMNsHNCA00P5bg6kY32Zx
         DMtjy1vlj3bKO5UManrxTc8NtE6Na+xynDoCg1Yta/J1wIlQdEsI7AH79CYPtKD3DnGL
         hUSDVE8c6elIBKyTQI+VZpWqWuVmeCpEP7Zf+GNHLw0xETfhbXfetVQ/l5oY5f8IP2Mw
         7GfKCxajj4PROfxdv8BO+FgRxG2fgZYDDemjw0nKMeL/aWgKa8VTBPoZQl4gx/vmSxdB
         naYieLsFotlNswSAMP6wUuewKghL97HQVP8RCfzGHPM5NH6BJRqxHJyJacemGKoN6Eso
         muDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuBOj7bmfRgJdzFlUREAkM/UEB3aa2IywwL3aTCMRMRwipQKNQQTgLJiTM/lJ2+s9EaOZB4fxXlOu77Lg=@vger.kernel.org
X-Gm-Message-State: AFuF++lK+GWgOHxW62JoWBQa1rK2LiVrxRFtAD7Pu51heO8xbrsZz/0A
	Pd0/0jmU7tuun1RdxYbXavaxd9MmapIuXDInyzzZvdhAFH3KhYs/NqACqaZQTEK2Jpc=
X-Gm-Gg: AYBFou18CyT/3P3DAlyOtQwLASkpqFxkhMdpsFUFfK+TvwtOa8+8sGnI9YZ3trXfAu2
	vU/f6oxRjMIugKr28Lk9Hna0p5vqVfoH4ENsrZw4xYDrqadldScu1qHRX2T57L8xbh//yvLirDO
	auPQFKAXBoSkvHSm33PXm7BhYNAbkHLtIx+jMsWZC05x8ViYUY6VeVOKm7EhMQJxEmvXCpmEf+B
	uVWKZv2E2lSmJgbk0HAlRQC2FEye6q8tOc+cna1Cf8vFbpeLRya+0MkUGJUg9bXdXWfNfd9c9u5
	aEdGt02Ugk4HgmMEa3sP59GyYzbQ0sROFgsVyT8/kTY8uOwpApcRn0DUQRxYgYvZmLTIIv6/6Ag
	oQQL7Lu1GaygI28zD90Z5FjeQyhOy3LsOLeCZmMOXIsgpn6c5Ur0hSVEpVr8gWc3gyfjzqfeB6f
	VaSrh2ruaWpOaU4bjczS1WuOLWCEEXSpMzdVh3L7hQ5HRhIG6CdA==
X-Received: by 2002:a05:6000:2086:b0:487:662:cb90 with SMTP id ffacd0b85a97d-4871e26949dmr6454324f8f.34.1789782820537;
        Fri, 18 Sep 2026 18:53:40 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244225f2sm3016120f8f.3.2026.09.18.18.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:53:40 -0700 (PDT)
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
Subject: [PATCH net v2] net: phylink: unwind the PHY binding when bringup fails late
Date: Sat, 19 Sep 2026 04:53:38 +0300
Message-ID: <20260919015338.499611-1-f@lex.la>
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

Found while making a DSA port survive a PHY whose driver arrives after
the switch probes: keeping the port across a failed connect and
retrying is what makes this window reachable.

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
    v2: dropped the comment above phylink_clear_phydev(); phylink states no
    lock requirements in comments and leaves its static helpers uncommented,
    as Andrew pointed out. Added a sentence on how the defect was found. The
    code is identical to v1, so the Reviewed-by is kept.
    v1: https://lore.kernel.org/netdev/20260918015109.2518797-1-f@lex.la/
    
    Split out of the [PATCH net v7 0/2] pair (20260909204306.2374562-1-f@lex.la):
    2/2 is being reworked per review, and this patch has nothing left to wait
    for.
    
    Reviewed-by was given on v2 of the pair (net-next v2 1/2), lore message-id
    006ad9d6-b51b-46ed-8c5d-3649b70a4f62@lunn.ch.

 drivers/net/phy/phylink.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a1458da8111b..0e59b7ce8b7a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2085,6 +2085,17 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 	return phylink_validate(pl, supported, state);
 }
 
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
@@ -2199,6 +2210,12 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
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
 
@@ -2349,15 +2366,8 @@ void phylink_disconnect_phy(struct phylink *pl)
 
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
-- 
2.53.0

