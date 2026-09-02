Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219F33F8C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314242; cv=none; b=gxGusujAVUHM2Lk2GVVJtmLxM7N/IpiiuotGSgK1g9f8PGEcP/ECwaPhJniZboTWvt476YFLLufokTGQv/iojTp5wY5PqZIr3QHz5hS8NjS3PhmGUni5rEe9+CMPYPwXyldMFuWYlH+8GnlHy3hIN6z9j+Jk+me4PmohHWjmGe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314242; c=relaxed/simple;
	bh=kjynEym4JkM4qLFWRtB6GBT9eT/13ERJsjb/5ssDOQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eo4plkNpTojnsUF0asU9F7GQ5oiPkQ4N9DRIjjsdA8iyuYDXrNaV02du+EzJ20xuogttYZE3SUKb+zl2FyzzFZ+A4Q5ohz7ElNfZqsDhaSX4IAjbKg92IaZ8nhTQ6abZ8z4W4CJzxuVODxBCQaEz15nA2eMcJl1oqhrDT+pLL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=neuNbo44; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="neuNbo44"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39927410578so969723a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788314234; x=1788919034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2ASlAu8y5yvnOMRkejZNi7wm/1MZgn7xMNUrYUfQtI=;
        b=neuNbo44bMNUajm357LiSzKnzPxriyzf3VQtr1yrdq5+8LYsxqaz7V9REmNxf03Xkz
         OHqxnbS1CLxomdb//e+Rs7Ip/1t5n3qYfwLabG0J/oHZSxQhf1uWerbrPTeFUBesMSli
         Kd5K+xcf04yV/xtMzdqBewpFFDfc4CHUdMCKPD0ekp1XeUfj4m3RAqsiTsIp2bJECUsa
         GgFcTT/CNo9O/CZrUPUCmF7Hp1o0bNx5puZ7SgxfXADOFBMzbI9Hw4m5WIk6+Q/niJhC
         8ml3F+oYNfBZqvq2TzgCh3CpE+QNttvN5llDk9yBO6OF2hQ1VmJ2pGZSizNkwtRSZwZf
         s4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314234; x=1788919034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2ASlAu8y5yvnOMRkejZNi7wm/1MZgn7xMNUrYUfQtI=;
        b=hA//jH4YrFGra6BFG0A2vpz7tf+HA+/VrEdqM5I6kal1Rtwk2pTPe6J134Vlu3lIUc
         aeiHV5yhK7pqyUT603jWJ6s9RLlQsjQdYAmj3/yW6GSiRbqY+SigkeRqdNmRW24tMBeR
         NpeOIFw0O+EMXOXj8BcAjVTmj1fxiJl9Y0OX+HF67DiNmp/4JHqJg8kekmME1JAzIfG1
         ioJryWWhA7HFTgbG7xAlKRFZ+6svHOAEgmH2cZQolgKLNhResbnIkYFzdGOvqvvAIS3Y
         Fm94wIqT91CyqGEd2qmSUbeKd7h3DNgQnHx/8dR9VznJF9zw2IKoPAlDRQFXJ0A0Owvg
         NtAg==
X-Forwarded-Encrypted: i=1; AKwUvBzpNnqkfKJPn00TXUXdy2vEq83RreUaNgXJgefjQRQ7JXmHmcYK6zzHZcbmaxv1MaQviYsMXafAOnz4BdY=@vger.kernel.org
X-Gm-Message-State: AFuF++l0C9H+1WTDir0uefpnSTAef6ZMNKLCYQRyMODtOjeBTO9dHqaf
	3rgzhlcRoUYqSqGCVA0rQoRpi+i3HHccR2ZGLke/yuHWu7onr84Dynd7Fh03iSN4HHI=
X-Gm-Gg: AYBFou0szG9aIOIbfwUu8sWqM5zP/T/HvE8be9WEwPdNsVlqPFgXYnCsZAJG8LsZ3hp
	T46QWj7/Qcly+VEAS1t7qqLZcrD36oZeDdkpZ95I7KDXILKUtxCVFJsrA8ZJnjVPlcMICfF410G
	8Do6WOEVzh+SJGszABzBKDfLJk73As026Aft/AJU0h8Pt5Druze+fV8F/QSDlzH0Xy7LnR5zTVI
	WTd1OCI/bmKhVdrZkvsWQ73qLH4Q0O4e6LKZ8ds+vZSAsOQf3T6k+GPVhxvhThcUs4mHIihB/1S
	Bz7IOmfko9j7WjNhjIorP1IeJyTdOWYVlOtZoEYOJ9HYm5snubgGODbOjQ3zCSfmaNbZ9qI2Qnv
	BPKVQyR1yVOUgY6y8uYEJYhzKx7LyiNt/bdVd0FhZeyUfyQKrpdv2PMNj/8GxbaUlRCYryhH+U4
	ek7JISK9dRbAhcenVKfNP/oVE1EvDMIdeZthKbypaBzOqzdaaAJZWy
X-Received: by 2002:a17:90b:4c52:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39aedf7c6aemr1801505a91.5.1788314233810;
        Tue, 01 Sep 2026 18:57:13 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d7a9sm2252710a91.12.2026.09.01.18.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:57:13 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>
Cc: horms@kernel.org,
	kalesh-anakkur.purayil@broadcom.com,
	colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com,
	linux-kernel@vger.kernel.org,
	raphaelcf@meta.com,
	Joe Damato <joe@dama.to>,
	Sashiko <sashiko-bot+sashiko@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH net v5 1/6] bnxt_en: Only restore LRO if the device supports TPA
Date: Tue,  1 Sep 2026 18:56:44 -0700
Message-ID: <20260902015652.2421609-2-joe@dama.to>
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

With a P5+ device with firmware that reports max_aggs_supported == 0, it is
possible to make LRO settable by attaching and detaching an XDP program
even though the device does not support TPA.

Fix this by testing BNXT_SUPPORTS_TPA before restoring the feature bit.

Fixes: f0aa6a37a3db ("eth: bnxt: always recalculate features after XDP clearing, fix null-deref")
Reported-by: Sashiko <sashiko-bot+sashiko@kernel.org>
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
Cc: stable@vger.kernel.org
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index d59bcca73a2b..0e5c2a48f313 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -5006,7 +5006,8 @@ void bnxt_set_rx_skb_mode(struct bnxt *bp, bool page_mode)
 		bnxt_get_max_rings(bp, &rx, &tx, true);
 		if (rx > 1) {
 			bp->flags &= ~BNXT_FLAG_NO_AGG_RINGS;
-			bp->dev->hw_features |= NETIF_F_LRO;
+			if (BNXT_SUPPORTS_TPA(bp))
+				bp->dev->hw_features |= NETIF_F_LRO;
 		}
 	}
 
-- 
2.53.0-Meta

