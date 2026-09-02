Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CF135C6A4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314248; cv=none; b=nnkFP1yPaAwA7ncwb5KloPEnb4yA4iKA9tX1zdStIYgdyj/3YB/V+7rBlBXFV4HL84ySCqPeMRH9c0g2vsdxbzsfM/JKFlHkFPqgF8tgnb5uPr5jRkWxMSLauoRhWufYZcMZCYapny9drADm85CTkvitRHKs09b7saSy1SaPE3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314248; c=relaxed/simple;
	bh=gccopKJo6AMNY10hGDCTCtkumpeREXXBiisLLwf1er4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSbXIDN7KcqQ9GT89gP547EacQyX57h/bP+VpP5LPNJGjvxEJ+NoFVMU1bgMuSb58+t7FdA6iuRCxsrxycK8gnxCQVLqaG2fJ77FcUYLD/HbTJX3SWD0DCYYydOzFvPWsvWfQmdsvelrcWwmV3jauknAFT2BzFWkejEFW2YjlQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=TTXXe5Xu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="TTXXe5Xu"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d53197d8b5so4375925ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788314241; x=1788919041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wimfaoY+1kK1sxo3NPrBDMOhhGsT7Wm36ytAjDSTIU=;
        b=TTXXe5XuttfR+yczz59mBqblBnFMovbkhBNBNs2hUIzuscgXSpmhjGT+ulevxYL98Z
         MpDOIZf3SEURftEF98mP/Qy6Lw5steBzYsHOUV0iJD1MtYsmrrX7+eVERc8o6tMBXoIG
         T0E9GrLaFVED2X1JGEI5iMCe0sgZ/udgE6OIqYejugYS/ORNSlDav4EIl3pYwxbdy8JK
         sW+tgob18UM8zkfroNZLZieT/R+0LH2yY/iFGiMO4vrCRys6k8Gj1HPJ17Il5z0hb7Mo
         zviVK7aKWDK0htuxC0pVpd4M47+ZYWtaDGJ0Tr9xT8u1lmRpCEGWOcb8gu3iq19ayH5F
         RtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314241; x=1788919041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wimfaoY+1kK1sxo3NPrBDMOhhGsT7Wm36ytAjDSTIU=;
        b=ah4G4PVwS966czG1RRwIutOn+5RtF8QnDiPwWUHZ6mJ81ChvzwCu4KE75EgCiLnXZM
         Z0AjkkBiHcYwgKABNBDJnEt3Rp3MGdBwYukaos9XZhRYEglht0MaxOMVpoRBDvsSaYth
         31XRhbYetEzbZRTQZtgI/n2LKaufFOBUgPXzURt/jSE7WmAxjEYCS5bdgjXqSKgTL9nw
         7C7tIi4mcB4mS6hhn3kuRPVXOcw1WHw7trTAvn0YZzrX53ystyb8J0wGQKPhXH4DbFSE
         tprzsJOlULakL5ZHrZESEHu9wG6INx7DqCeTNaa2IUfrWkXv272UAUNi0nMhpCPGB/i7
         Vl/w==
X-Forwarded-Encrypted: i=1; AKwUvBzgU601gHyveYcWq+3P3S+ARi3szYHdKWlFqEfUQQTg918qeNX7oHEIQT18+KGt1GqwuXGqPm5flZMX8Hs=@vger.kernel.org
X-Gm-Message-State: AFuF++ku+3KmIt1yLxoWV07qF+5z2xsf1NPiKQrmZocoudEhvo6bRzB6
	zVpSAagd0RYUp0VKdD97U/+cBKjgmTpQgEdpx6o1nuKePMFlDQbA7pIJqcq2bzcDKJlL6qNKN/T
	PZfM8XmY=
X-Gm-Gg: AYBFou1ynG1drFMu92lMrJxm5kWEvMsG7kVo3uE1dgaP74yIPLghNxPX+AsQ0dNggAL
	2/5j9cjI4zrmdJmAwTsdyFndVy6fCszvPy7+FuCPO1BmrgnP9/qsYbskNpE+ppcFKlpKCc/Wog5
	j4rpotNryf93xXRvhEyj7ypaZmUJC98LkwtTqr9lMZRXiLLeSETI0+vgx9+Gp2VNofCsyARgs6u
	y4FJZ70iDW+ANaCTJIqy7V6+kkOroATK75j4LQT8cdz4rn2BLGH1XbXaO0RenEwQcTJvhogcB1V
	ScYCcFqFBB2+lHcKhIMTONLHFh9vOIXzjzTgyB72izK/PfM9FUL+fa2BQlAMp4pAYZHXVEQtGI+
	K/ryShOlMPDGu7SQSC9jCsXXNgb0DRXV8toAICt5tsrTXg6JcJh8WGi8l4+DS1/hgIf6I5eBgdb
	a+1KtDi6cE86D4ed2W/zMVbm4IbwY83+4WfzxCFOXjgjMJ1t93qMHO
X-Received: by 2002:a17:902:e544:b0:2d8:d4d1:313a with SMTP id d9443c01a7336-2daec77411emr18790655ad.17.1788314241319;
        Tue, 01 Sep 2026 18:57:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:56::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488d18sm5198245ad.45.2026.09.01.18.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:57:20 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>,
	Eddie Wai <eddie.wai@broadcom.com>,
	Jeffrey Huang <huangjw@broadcom.com>
Cc: horms@kernel.org,
	kalesh-anakkur.purayil@broadcom.com,
	colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com,
	linux-kernel@vger.kernel.org,
	raphaelcf@meta.com,
	Joe Damato <joe@dama.to>,
	Sashiko <sashiko-bot+sashiko@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH net v5 5/6] bnxt_en: Propagate RX ring init failures in bnxt_init_nic()
Date: Tue,  1 Sep 2026 18:56:48 -0700
Message-ID: <20260902015652.2421609-6-joe@dama.to>
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

bnxt_init_rx_rings() returns an error when bnxt_alloc_one_rx_ring()
fails, but bnxt_init_nic() discards that return value and calls
bnxt_init_chip(), which enables TPA.

If an allocation fails, this could leave rxr->rx_tpa[] partially zeroed
and TPA would be enabled over an array with zeroed entries. This would
lead to a zeroed DMA address being handed out if the agg_idx is
translated to a SW index at a zeroed entry.

Fix this by propagating the error out of bnxt_init_nic(). Both callers
already check its return value and unwind with bnxt_free_skbs() and
bnxt_free_mem(), which tolerate a partially initialized RX ring.

Fixes: c0c050c58d84 ("bnxt_en: New Broadcom ethernet driver.")
Reported-by: Sashiko <sashiko-bot+sashiko@kernel.org>
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
Cc: stable@vger.kernel.org
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index a8e5fdfcdf59..d2943de1b62a 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11341,8 +11341,13 @@ static int bnxt_shutdown_nic(struct bnxt *bp, bool irq_re_init)
 
 static int bnxt_init_nic(struct bnxt *bp, bool irq_re_init)
 {
+	int rc;
+
 	bnxt_init_cp_rings(bp);
-	bnxt_init_rx_rings(bp);
+	rc = bnxt_init_rx_rings(bp);
+	if (rc)
+		return rc;
+
 	bnxt_init_tx_rings(bp);
 	bnxt_init_ring_grps(bp, irq_re_init);
 	bnxt_init_vnics(bp);
-- 
2.53.0-Meta

