Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616F35F5E7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788153639; cv=none; b=SNtIRhVI6SwEpHf28kaUqPfkducLNPL1tu6h0G5rIKWzx52Ymuzrm4A5pzaj2kGYOdVyfg8MtUo8meac6v5zJk3O+fvu5fLtLCOQFeVs3RC1AaCpJwr2AJZhIGbBKpICbaKJwRfvvK2x1CvzgWdpO2k5tzHYMiA+w1oy8DJuKSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788153639; c=relaxed/simple;
	bh=6bjycwJwoHTgtM+LiOnjD0YbOiOU3t4LuNN3XpnRkUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DE9lwTLywvlwmMtbqURxiVsr2qm6cv9AI99wSJrt2bZz81ukRTfJmJ1DG5V0x3kUqtR3xROJGH0I4FO7hE0ZfSfY50adyE0hsH+FqGnLPDKYchnVZvLJ862nYupvnBebbSOsa4M3pP9I8hMwnoRInlHxgqabWbzyd6pOZ1h3Tic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bERpR3M9; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bERpR3M9"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2428977a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788153637; x=1788758437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svT7/2yLoNCYGafpDjiaochGPtkcrMvh5TQU74Jif5M=;
        b=bERpR3M9jwni6LHuaDbrEgZhK1hwSjufhYlhQB1hrd68YYf9aJKVfkIVRXpRRQ0uI7
         ZgPJcZkh0FHxrgsGdY1QjHrZRzhhQhLt6M8Eg4CONWZ8a6JonHhT+EQ2kuAey43ydgO7
         Ao47jHg1trqjsoW086MFgGAMAiLtip+BVG1noqnyyxSwq/Td0tjLS/ODBhC4e0cFKWCD
         ZFZuUvaEfDNDtjjLG6XJ4q2nuiuY/Rk6Q4fTwjNd9wKc7sEB8LLiGnDZAZpRb91wa6Kg
         vGUBF+07yrJgNQjI/f/bU/ioGNuyub3BdHgHJ7j5AX4VNfaB5ckY/NRRO6TVDxvBM7Y9
         NCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788153637; x=1788758437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svT7/2yLoNCYGafpDjiaochGPtkcrMvh5TQU74Jif5M=;
        b=cXrRqH5C0pbmdYVGh0aI6WjL3HV0vGfctZV5H06dW0xlxyD233SUVp21J20lPyZzBP
         XUtNoAo1qgs33jMDLl/TqCvLVwABrgPFPiAdqSpqqvSOM74wWNYA/ffnKevvF5Xmkufj
         Defw7hy8Bgg7cfuEkPp+PEQlwgbVLRbPB2s4Ra2YLJZp3RSqtuvOyx4+VgN/HxuGIIDi
         Ay7wZiaDrA2qi6YR6jbLeVI99+p0G4hJwx+x5cIpwIDt9Wt76s3gLvV7HYultc6lnPRu
         dBopN2YEu5r164+iwuhQAlR7GH5Y/9x1jj1tq7/Fx408ZNSjMUuXEIqu9aMkkXCOfxLv
         6Gjw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/5DGIhgaViiaVEpl4nVqezlcvzpUiYPX0IZxKZxAygnXGZIEfpH8oo3PALtW07rJ79k6QeG1Z96v0/9I=@vger.kernel.org
X-Gm-Message-State: AFuF++lSGncGNAgdnDncVL4XuxGK3r8jhmyCspztnEfdMZWiZqiB9DLI
	oDvNXgleC0zedrzr1iVPfAZiP9+q2ssMHc3+FjPok/M8Jd0nKf+rEb2d
X-Gm-Gg: AR+sD10xwWFCuTh4fKnocMF9wt2hU6np4K44bqb2A3PiuIEjJJy1wvxu5+LuDOsF/IC
	LVpiWA2UiTD2MaTXg8piATah/sA2naZvuOP8P4rRneAex85GeWrBaA5g9LQDS8T+SQMJtjP6361
	S2BRwcw3DbQG8eA+pudFIiJ26o/2FX7ct83NVhH1/ggRPE2SQfvyBMaI7zFS9JoCz4VHKd+7Luv
	uEGO8wHU3tZ9HEiuj51Mvzs2MYjtUHkw53oA/vBzD6O0b+9TqzUM/3O7ONHBlHT3Z541lQqGu/n
	+HU+RdeZ8OjW8p5aB9AMhd1pbww9qbOFsVAxtJ2tiPm1SH3UMCYNvy4KBK+9BlEF8Aj/9YIKrGk
	1XBohl+gerrO/GSnKfG0WDMifosddxVr3gLhY2k1UdNv1wC/91lhHRvD0CAyCQj1LllRm3xfR5u
	So7Kcw0T9JCYsdkuFE//Zxvp3eVMWzeidE4xMxjtGZV9lqxp9ZVfEMyA==
X-Received: by 2002:a05:6a21:a346:b0:3cf:ec52:ce5b with SMTP id adf61e73a8af0-3d26819b3ccmr42325703637.13.1788153637148;
        Sun, 30 Aug 2026 22:20:37 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f66e9sm3418147a12.4.2026.08.30.22.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:20:36 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH can-next] can: raw: remove redundant NULL check before netdev_hold()
Date: Mon, 31 Aug 2026 14:20:28 +0900
Message-ID: <20260831052031.902699-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netdev_hold() does nothing if dev is NULL, so the check before the call
is redundant.

So remove it. No functional change.

This is the result of running the Coccinelle script from
scripts/coccinelle/free/ifnulldev_put.cocci after commit f83b8a58695c
("coccinelle: ifnulldev_put: update outdated helper names").

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 net/can/raw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/can/raw.c b/net/can/raw.c
index 82d9c0499c95..e1d05a0341eb 100644
--- a/net/can/raw.c
+++ b/net/can/raw.c
@@ -525,8 +525,7 @@ static int raw_bind(struct socket *sock, struct sockaddr_unsized *uaddr, int len
 		ro->bound = 1;
 		/* bind() ok -> hold a reference for new ro->dev */
 		ro->dev = dev;
-		if (ro->dev)
-			netdev_hold(ro->dev, &ro->dev_tracker, GFP_KERNEL);
+		netdev_hold(ro->dev, &ro->dev_tracker, GFP_KERNEL);
 	}
 
 out_put_dev:
-- 
2.43.0

