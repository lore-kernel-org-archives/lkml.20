Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB44746C1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521715; cv=none; b=bV1AMYCyqjx6+twAgg0leQ1O6/HU7YISscZbHUSF5pPbKS/yNY0taIg1CpP4bz6jsGyjTgT80paGvVt7vYNabOiyRHiJ1XvCD6NftOa6S0Jxbh/uxlZ6pGAWmidWzL1C9zt5f6AC9TEbCNw6u/VFUNkq8ME1V6PTXQW2XGSi/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521715; c=relaxed/simple;
	bh=LvNaUvR3pthJtP6snjOrMCiKxRjIGr24iuFUPzakDdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkH/KxfLO9M2WX797UsI1joewJbN0GZ0FDC33kApLD69tp/ICLWkxxifJ7rFHh5J0E65lYU+iMFwHuiHrqegyg9L7LpPZnfn2RVTqeD+ytz5Vggjb7jq4vAZSuJbPfCD5B7ZKeHFnaUPftrOoZMZECscrZkppHgtU72qjN+vFDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgZYZUkW; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgZYZUkW"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1040364a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521710; x=1789126510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn587BuJkWSy519fT4Hj7vn43dZW3vpCxNv+IeaxXaA=;
        b=YgZYZUkW8/2maziJ6EMF+2TAaIRk1rryNPf7Mxf6540JKh9uS/Nc32ZDVRW8Fs02CL
         iaKi5YwS5Iej104NP1OQ98B5WQtfHfJ8k6I7fbieWUpveY5S8v3RYlM7RJneJPIjMRkA
         NR2Fw2he6sv6/nazlZN0MJnGDWmkkvB4Osd7s8y47O3nYpnk0fcCI75tYpNsQvcTGZ49
         5mfoulXn8MQKrJboNQK+aLWmE9cvThOWSri68qR+df6EfZ80xeZX3DeD2KTiGcRFQXM+
         QD0d1dL4O1MyRZYzcnwoRfnmJI9jzk3nvjkx8UoTCBiwiXeoCm6/B5X5/oLUpgSl4Xq7
         q/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521710; x=1789126510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn587BuJkWSy519fT4Hj7vn43dZW3vpCxNv+IeaxXaA=;
        b=YHRk/uh4lLb/BvT99ptqKL1Tv8q7LmQ9OFWttTAZ0YMlFHBYkFqJocoBv5AAPZAQUD
         yLrdEd98CLi2LcLhrqpwr1ymJrbZ7gK+7XHa9aCjuJ+aRrp6fEKMCAkQ0jnHsHF0ZA7e
         tY/cR608UhfmB+09NJnfQPlznI7dacpamKSd3XpbP/w5PMUgIy/IY+yxRghkV6kE1P3C
         dQ6izodTRjI7nL34eI2ZRjNKSPWRxTaXvDfiWNVgzGWRrXRiMnFTKASgtTUwGFmCVg/h
         80YXDaiKUuzl+ZL5AIFfDAn/lDx3A/hakRGSLvVRdvmKBpt+bqKWv0mARVCzjrxcZ8h4
         Y9sQ==
X-Gm-Message-State: AFuF++mC3ic2Sx+9VsXUSnKQFOsezY3PJEdPELSVs9V0OtbUhsza1Vq/
	SUvZ3RU1KExSDbYFA07OYlgVGSjJ1mhjgD5Jeh9mJW/DHjKlGL51i5nf
X-Gm-Gg: AYBFou28f5jyeT1LHcyd5dKka/sMGA4vJ5rcMyWpy3iX37ZUE21MhwO8Lk9CheE5POq
	MVU0xgXoVoBjx8EjhiXO6do9MJMAtJhO7lk0a9nKtK+PHrO8LvpMMuQu2IPcWrV/wa99iepAdKl
	6wXNWqriFD/woLRyRwuuFvwTAsbVp2Ltau3Zp5gxyLpj70qhbFRyIsTLg6ACmDSLvC+ZRmy1Ogr
	FNzRD36S1Z3J0SAwX9Dh77/DtHqWVLpH+tatUPt1fYSlT6shYtTOsJk863AHSylifpYF/pHFxNC
	vDkr5eb9MEv9GyojKj1gHOfWiGf7YxkkN8ig+GIYQ+dBlGEsmH7B3UuSYTI5LDkDHYL7NmmtZs9
	tunL61fwiUSMn3ss2m4XOBZHL4WP1oDpDraudRsM5t6NXZJ1kj2h03dRCMz1HZiDFm83Xpv5cVk
	quAWGAaWnb076Siy9+kkCQL/D2r/aSsnuaOka99/DMbNsRR0o6edVndkwt/OugV4hfTtfS4sXyS
	c0XnXLZiExRsdc=
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr9519678a91.16.1788521709841;
        Fri, 04 Sep 2026 04:35:09 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6054536c88.10.2026.09.04.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:35:09 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] media: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:04:43 +0530
Message-ID: <20260904113450.15838-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113450.15838-1-hemanth.selam@gmail.com>
References: <20260904113450.15838-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/media/i2c/adv7175.c                   | 2 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 2 +-
 drivers/media/usb/gspca/ov519.c               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
index f1caab8e2abd..b6f0e1b24383 100644
--- a/drivers/media/i2c/adv7175.c
+++ b/drivers/media/i2c/adv7175.c
@@ -209,7 +209,7 @@ static int adv7175_s_std_output(struct v4l2_subdev *sd, v4l2_std_id std)
 		/* This is an attempt to convert
 		 * SECAM->PAL (typically it does not work
 		 * due to genlock: when decoder is in SECAM
-		 * and encoder in in PAL the subcarrier can
+		 * and encoder in PAL the subcarrier can
 		 * not be synchronized with horizontal
 		 * quency) */
 		adv7175_write_block(sd, init_pal, sizeof(init_pal));
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index 6430f2ec8b32..8257759421f3 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -649,7 +649,7 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
 	dl->post_cmd = NULL;
 
 	/*
-	 * body0 is reused as as an optimisation as presently every display list
+	 * body0 is reused as an optimisation as presently every display list
 	 * has at least one body, thus we reinitialise the entries list.
 	 */
 	dl->body0->num_entries = 0;
diff --git a/drivers/media/usb/gspca/ov519.c b/drivers/media/usb/gspca/ov519.c
index bffa94e76da5..57219a738c73 100644
--- a/drivers/media/usb/gspca/ov519.c
+++ b/drivers/media/usb/gspca/ov519.c
@@ -13,7 +13,7 @@
  * Copyright (c) 1999-2006 Mark W. McClelland
  * Support for OV519, OV8610 Copyright (c) 2003 Joerg Heckenbach
  * Many improvements by Bret Wallach <bwallac1@san.rr.com>
- * Color fixes by by Orion Sky Lawlor <olawlor@acm.org> (2/26/2000)
+ * Color fixes by Orion Sky Lawlor <olawlor@acm.org> (2/26/2000)
  * OV7620 fixes by Charl P. Botha <cpbotha@ieee.org>
  * Changes by Claudio Matsuoka <claudio@conectiva.com>
  *
-- 
2.48.1

