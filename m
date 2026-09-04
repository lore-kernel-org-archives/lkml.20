Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3185C33F8C1;
	Fri,  4 Sep 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527296; cv=none; b=uqhOJ6ZI3R2sajomskB0Bfgonhb3pAVgjdT6FCiKu0j9RxXzvgPF/jy9oR+CE18k3sWR6G6PX6/hrkG+caAdHRwZOyTv72XXeLWB8E1EfnWUnbc/NmiXTndfGkcnfPgjsUZPmdOeaWjmMpkr1bZFV5ibeRRM7ngnTDX1ioPDRJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527296; c=relaxed/simple;
	bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QM23fNhi72FcbcHz8n2+bdkZTtdIHAqRtmg/UBUMYj9IwyRX4ID19aDG6o77nawSOkiywBqFt/bt5nC7ivheEteMgH7yFKWt8JfHX7C0b34IrWvIaXN4OpCluM2zNGkxAV+9sqMJaeDgdUTtXxJKOIs5oxjnDcW/KG6OORz2QsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=RU3Ypzz0; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=MZl4PFRX; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="RU3Ypzz0";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="MZl4PFRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527285; bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RU3Ypzz0N2bDrNX/8UY0K+/ZNlLQVBtBI5SbpRHuGtvxO7GtRjx578izNDJkzOCmV
	 b5Zdvc0yLMkFHMXvJBZwx7lwwSJ5khFk5EyvbcrHXUlg88ljMzOp7gPBS3u+HIM8Kj
	 SsQ1yymWYBnAboGETHHV6XjUFPWnhyOZwTXIvz/tJbZSTsE+bin/pJ8K4eEXwulVts
	 iFSHi4gfQRHUKofuOXp6SFcSBV9ypRQMgVIH7R1rGfHH/YSsVA3GOBZm5PL4zHukOK
	 0Ay89cal4/HLLWbIQc2bN+E8gwOluBc8gXyRRLaGQOBOQx5j+XQpNBripiXkoSmgHI
	 LtpYCooiUIpQw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 9F7F541474; Fri, 04 Sep 2026 14:08:05 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527283; bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZl4PFRX/UWrLV+kMnCgz2xZZ8sGAATyrKg1JTJxO1uBl5xN3nkDQ0CLgBBfuXt11
	 pIEveC4mlf1Q4WnY/1pPS7WRj+sNgIOreZze364Wf0HT/n76e4aD9/xR7msjfH0khg
	 caT9qUdMaPXQwwxVbMXAtgbyUwdSMRmRZWKPLQFI+Lw2ToMYHEhCZ+xbJHf4hS6Smg
	 rmqIm11fTMx4AyQtJmmHwBnhlnNiorJiSQ2KuIxCPeiK4wNsJ3Gd4G6e2tUyCsvSYF
	 KjIMMWg5f/hZ/sqTh9kxwO7JNfLA8E/qb/yOx1psAURxBi2Nx8vbV6mAGiIBsR5YtM
	 P/yqnq4TW12Nw==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 3BD154144F;
	Fri, 04 Sep 2026 14:08:03 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/17] media: ite-cir: Removed unused struct field
Date: Fri,  4 Sep 2026 14:07:40 +0100
Message-ID: <df9407a4a9142e28f9c373ab9c868cba191ce6fe.1788526920.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788526920.git.sean@mess.org>
References: <cover.1788526920.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Never assigned or read.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 1 -
 drivers/media/rc/ite-cir.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 1fbafcd8219e..d0e98095d1b6 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1359,7 +1359,6 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 
 	/* set driver data into the pnp device */
 	pnp_set_drvdata(pdev, itdev);
-	itdev->pdev = pdev;
 
 	/* initialize waitqueues for transmission */
 	init_waitqueue_head(&itdev->tx_queue);
diff --git a/drivers/media/rc/ite-cir.h b/drivers/media/rc/ite-cir.h
index 4b4294d77555..a8382aa9dc35 100644
--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -76,7 +76,6 @@ struct ite_dev_params {
 
 /* ITE CIR device structure */
 struct ite_dev {
-	struct pnp_dev *pdev;
 	struct rc_dev *rdev;
 
 	/* sync data */
-- 
2.55.0

