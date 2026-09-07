Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54F2DA756
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 00:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742564; cv=none; b=qOgbLd1ENQKD0WbrzOHaNjCMSM5arRBbDdKfR/ihN0X6DeDS/CK+9bR/t5Vx8Yxm0VxDAMIpMtzlVnXOt8Twh+H7kYGyEAfB/fsMmA2tQkOr7Sxim+jNBhws34jZC5vv2XZdvuI+ErHZSLx/EmC+1Qh7wGIZZ24ahf+GUkM7qPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742564; c=relaxed/simple;
	bh=uiohtiXWJOSW0hLwT/zlndua/TXVtDIMzqQDrOCwTDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ak22LwIn5pueIKXEJvgBU8Hxsu1TRxXO1O4hyODgJL5c9DsvALirPQCGmvIdKFI6IV3thZ2yTDUmEYhu8l/FG4qHIuf+Q6BrTdg8tQyciscZV3zL+8OX8MSQf4WQF8052vQK/gnagqNU5oUNG2IV93j+sInPB9d2yjoE/ZeU00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7E3v3T8; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7E3v3T8"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3562415a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 17:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742560; x=1789347360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sELXrw22H/IsIeG/7YwT9q2MiplIi3+BT1tFOGBMF6I=;
        b=G7E3v3T89CMycTKeD+MM665gcDfVaEmaCEpgWVxUVEtPKUm1uInzk6lhBrZF6xmSqM
         Cs3ZWOZkVsDc83ANS8InzVh5mmpstRa6NnEJO3TA5sYOtoNvM4VKNqewOQEzFpsGRApD
         cHcxfcobSGwJ8PfNzCagwU64NnGj7ITsX+Nwb875tN6YQ6M4d2XA6Q9bRZDRn2Z+xt78
         9FgEuxQT2XD+REcxoDYe7lzocMLfAspCyyf71aa2AILEiv9MECB52gFRqUBRr64XfUNX
         lsqCEuQw8LvgdwJJ88LCAe4qY3vvX71GUP+o8DkvbUw9pPLugUW7VIK2rawzunTD183c
         G5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742560; x=1789347360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sELXrw22H/IsIeG/7YwT9q2MiplIi3+BT1tFOGBMF6I=;
        b=EBWEklmCRjou655KfMGx5zk1JhyKTj9SvbMdn/bSvJ/Gq5KNDlpUrJ5cL3Uu33wZr+
         fdmpEZlyZBMJDb8N4EWnDSBlFLjldsOw58EJjTrNU8Col4Ek95qKmEDUMqIK6AsVMKbp
         m3ciOeWZEs1sDk2P5V9hM297ZXrvr4dAcojn5jzHTp73M8HsY0Rr/Fh+9ygCB8mbYZsx
         Nucc1LTNtRJc1EZvn71/ZfLfCfO2B/pRE2jrEvAlCOHbJiv9JO9BWg0PhDX70nd/r/5U
         m/KFl8jwYzm5gdmNHE5XI4MRws9UIt2x8olpNDvl8esuVkXAuDPSzWklqSQQwtKO+tJj
         Ni9w==
X-Forwarded-Encrypted: i=1; AKwUvByPmFx0/Y9wYyaZwn8gWZkoK5S/uxaFElYaoHavOceCeuqtgnXJM4Fl6ZRjde0nUTofRiZaq6AZExmdQUo=@vger.kernel.org
X-Gm-Message-State: AFuF++ka+1HAxnaJEDX/vWUijXvlidRE25UgfOsQwbXtG8b8mj6zP5gE
	YxYO47XN0eZTXZ5puIiIolAp1NLnvtq685qeJkRTxESCZlUKNhKD1a3V
X-Gm-Gg: AYBFou3rRR2ZATFq/rwUd7g6+27IPlX3gCWbpyhDDpo43h1RCEqmCvSI15IJMn7rdzU
	GJGJUKQp43xaz7RB0MTQoEznCP2NngB3uyjGBVxnRnytkoAz9QFum4ZY1uDLaBWm90mBxMxxJ3o
	r/pAej4jMi08T2RuYjZ2vHE44c+JAN04Ur8/77+ZXUbrqC/tOZEtr49mtpymM1YDGyyrb3sZ++N
	Zrts52Zo8TVE1UgyGU8Gktvjokj3UB5SCJMVzEsE6UFHdYUctprIRuQoW4TOPVUp8d75LW/10Ay
	OUXXWxXWyvo2Un2ZtcS803dWNs9iRo6Pu3bNqWqf3Wa25NWVtepk77cHn82K44Df9u8zvzw+Mkz
	Sqye9jgxdnMlrM4SKsY5O84eqzpfPOgxCCqivg3L1zAtGELW9FX4pg82YZ6NMK/KdUYSwI7qTtt
	TboWy9VOfgs0puGqyVj+Iplr8aZCh+LnYSCT8CI+lkcVdIfUzE0lXP73l99lnc7kqdMjgccI3zS
	ktbXCbpRkcxfhU+lQWj/2OG42BmzgW+rchDC5INMrBtJOOJxu95kjHVQMyPK7ZiVKj3wB7bjuIX
	KORRyQ+MSqu5I2aifVvkTvR8PTdnED6IJdTGfQ==
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr27718526a91.13.1788742560180;
        Sun, 06 Sep 2026 17:56:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm23328017a91.11.2026.09.06.17.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:55:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
Date: Sun,  6 Sep 2026 17:55:58 -0700
Message-ID: <20260907005558.229187-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the shared fsl_ifc_nand_ctrl structure against the controller
device, which outlives all NAND child devices, so it is freed
automatically.  This drops the manual kfree() and the broken chip
counter that was decremented in remove() but never incremented
anywhere, leaking the structure and leaving the freed pointer in
ctrl->nand on re-probe.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index b34524726dec..db6bb0bb43e8 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -48,7 +48,6 @@ struct fsl_ifc_nand_ctrl {
 	unsigned int index;	/* Pointer to next byte to 'read'	*/
 	unsigned int oob;	/* Non zero if operating on OOB data	*/
 	unsigned int eccread;	/* Non zero for a full-page ECC read	*/
-	unsigned int counter;	/* counter for the initializations	*/
 	unsigned int max_bitflips;  /* Saved during READ0 cmd		*/
 };
 
@@ -1034,15 +1033,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!ctrl->nand) {
-		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
+		ifc_nand_ctrl = devm_kzalloc(ctrl->dev, sizeof(*ifc_nand_ctrl),
+					     GFP_KERNEL);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
 			return -ENOMEM;
 		}
 
-		ifc_nand_ctrl->read_bytes = 0;
-		ifc_nand_ctrl->index = 0;
-		ifc_nand_ctrl->addr = NULL;
 		ctrl->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
@@ -1122,14 +1119,6 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 	nand_cleanup(chip);
 
 	fsl_ifc_chip_remove(priv);
-
-	mutex_lock(&fsl_ifc_nand_mutex);
-	ifc_nand_ctrl->counter--;
-	if (!ifc_nand_ctrl->counter) {
-		priv->ctrl->nand = NULL;
-		kfree(ifc_nand_ctrl);
-	}
-	mutex_unlock(&fsl_ifc_nand_mutex);
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
-- 
2.55.0

