Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4287312825
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049627; cv=none; b=D+hMNmoMPTQpXrI3sTa/nghzJxD0yR6Uy/p4fQWxAcumVT1dd3m7Cv2SBQri51Wg+H8I6F4jbRZeQotYf91ykN8mldfWdPYNR18wbgpMvhhChIvxo20XJMd31MCp7spiSxkJFsqUexyrRHHjrIn/SSzjzBKNzXw5P0a0HtZFmhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049627; c=relaxed/simple;
	bh=BGmIBU3tF7TpbJxU/WgXUTbV7ys8yzcJGLjzBCFp4Ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mwDGuug24uxjLR/NprqGb5reIEK66J6zXQ8YHj48hlRI/JwQmvpxiMyBoFdIP0aQ6OZjyeDsp0dFKjDK7rQRnnqAlAU3lEifqw0aCCQO6Mg15/a7LhTr0ZaJQ8BBDDycNs5WLvdldKdJc9U8H7kC8QF97AW2CCM4KM4jt1N1iqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwyiUPEy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwyiUPEy"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3120952a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792049624; x=1792654424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ndo7bU5CbSJbisXie43oCLONWXZJBYZR9Gu8b5iBiZg=;
        b=CwyiUPEyTJ2sFPYsQ22L7RHMFaTNKd92312MWUB6gimazvcqpEwU2z33vX5bexF3DZ
         4i2SSnq/cQhsByeDlmQHcKrXEDJ4ckxOr5SZbMeeUaxZ+tn/LTCdVaeEdxTPosvk0kzq
         ciGA+agi1F7YCOYoYNSBYxyggiCr+eYihqBzgGe8dDAMbo4AkvYPaiQSk3hAZsIKDYR2
         rlzjZHbRn9WKdv3q9TiFG3X9P0xP2JJ/ogbMWCC4VMksWKCHlAE8Zb5XktFRXJ0i/kf5
         NjFwlOBWmmyegS1QIoFCTWaGxJOfB6fN/qzUy/VSGPS910/6AKODCV4UHeK/8PAgbBp3
         7HQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049624; x=1792654424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ndo7bU5CbSJbisXie43oCLONWXZJBYZR9Gu8b5iBiZg=;
        b=Pe1aS/fEMUTzLuxTxvEd5Gs0KpIeI9sufMyGhsD6zI65y2w7r0jv/fE/qHVnNtd7FL
         nK4ds3h/fqTYIgyhpCcpuRyMgJ3E6TbAyqec5DP6iVotuMSUzarCSo4T9rMmGShq+1aL
         BFEfP17aJB4n30cU3zNAqL1Rvj4+2EizH7gIqs+XP0/GngKEZ8CRBtW8qY5m8ZGtVJHP
         Pq7TRm8HlxHCcwbAOJCE8HLxdqEZ4CH7gLNZDf0dAwNFifbeRo0H+XipdPOKBGS0owAG
         Ya3lSp2cNHu/VG2bFUP34DKJs9yHQ9bkj7+VA4Ui2cxLEzF0XwhqbPSNuE5o3mDQXljP
         c4cA==
X-Forwarded-Encrypted: i=1; AKwUvBwJknttBromY5PWKl6+1PyW8qTBG/r6FFLB3Ntt3/EAfU7k7MrFhZY9Z2s+BKRLX8Bog6x3J+wfTSvMU9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLED3NPuYeTMFIInfRIh+VgAs4/0lagoEukagDVBkHbdhKSbUVH
	BSGNPfcomP1QjQrBDfBCz2Vt6l3tOSNO7u4pg0alKMjNz0n8nz7rKDkz
X-Gm-Gg: AYBFou3dHWDPN/7Kl2omQP8DeVI+LIjgLVSEaxySvR7XkG6cQ+91JVVlCjZIfqTxa/g
	Px+EXy/V7LPaQne8CSE6jrqM0K4SHVkWym1yTlFih5vH9VPEukyaeCOOY/a2SZUAK+/RugAIgUX
	+lP+IS7nPFtkcrnYEbSV+yXL9NW/Y7QYsH68S47mx9QzgbUWekgi/rzvONTzZ1CzTKxgAyMTS+6
	RoyLyr4i0Bwa/BOgfhtMvKmAWAXfWb+tV5pzTIM2A8tq5o+fNgYpaPKM5qeYzytP9N9wEKiWb1q
	/meHwHdIubzlMVMu59zkrLjk1S0UKFXRwD988XiPsrM+v274C/vTo1bBxbm2gEbyDPWGtb/HF+i
	TwyE/cegpCOKHN70iG0jarbIpVuYHTSZWoV+8mjGKa6lQI00rovKXqyGWmCgGKL12YOWi0JJYhf
	WegcpP6nqQjJTTUSowX/aRLKPrAwQ2PdEPKURr2l7CoT5ED6eelM24+T5Mt4aNAwZ38xQzP5ZiV
	wKpT+dDu7JRIdDp
X-Received: by 2002:a17:90b:3c92:b0:3ac:aa8d:19e0 with SMTP id 98e67ed59e1d1-3acaa8d2140mr133692a91.9.1792049623970;
        Thu, 15 Oct 2026 00:33:43 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94748c6csm3066274a91.10.2026.10.15.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:33:43 -0700 (PDT)
From: Yelin Fei <yelinfei66@gmail.com>
X-Google-Original-From: Yelin Fei <yelinfei@ruijie.com.cn>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: ubi: use GFP_NOIO for lock tree entry allocation
Date: Thu, 15 Oct 2026 15:33:21 +0800
Message-Id: <8b4e0b970271095df8321b1662aa464c5b9002dc.1792046946.git.yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1792046946.git.yelinfei@ruijie.com.cn>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Linfei <yelinfei@ruijie.com.cn>

The per-LEB lock tree entry can be allocated while UBI is executing on
behalf of a synchronous block-layer consumer (ubiblock), where issuing
further block I/O from direct reclaim would deadlock; see the
preceding commit "mtd: ubi: block: forbid direct reclaim I/O during
synchronous read" for the full analysis.

Make the allocation self-contained: GFP_NOIO restricts direct reclaim
to dropping clean page cache and shrinking slabs, page (swap) reclaim
is left to kswapd, and the worst case is -ENOMEM, which callers
already propagate as an ordinary recoverable I/O error.

memalloc_noio_save()/memalloc_noio_restore() in ubiblock_read()
already enforce this for the whole read scope; keeping the allocation
here self-contained as well means the safety property does not depend
on every future caller remembering to set up that scope.

Signed-off-by: Ye Linfei <yelinfei@ruijie.com.cn>
---
 drivers/mtd/ubi/eba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index f0c549e62c55..8fe68e7fff58 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -247,7 +247,7 @@ static struct ubi_ltree_entry *ltree_add_entry(struct ubi_device *ubi,
 {
 	struct ubi_ltree_entry *le, *le1, *le_free;
 
-	le = kmalloc_obj(struct ubi_ltree_entry, GFP_NOFS);
+	le = kmalloc_obj(struct ubi_ltree_entry, GFP_NOIO); /* see ubiblock_read() */
 	if (!le)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.25.1

