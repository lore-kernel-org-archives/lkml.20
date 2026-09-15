Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA794A3F29;
	Tue, 15 Sep 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461198; cv=none; b=fLY4DaqLfSw4FR/2vN54svQ5W5JkOlr5vCB3DkgFWDtaOlrfkpI0DN5szdDKWvO7DDb+alVH6ZegbG50VJDqonVZ/AjDYcuRwZRwyW+ItlV7f5LRvD0zHf2nSVDVn4ajhSdq0B/eHSR18yUH39COmt4nWxgflpgdVU5owU+/018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461198; c=relaxed/simple;
	bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwTvMbyIA880mWjBcbTsP8IP4dYUfr6AOoU4srAQBbZ/pNI9oaBzMCU68HgXx6dCkGjZLFBQ9PfCgglWfsH+vU/dnXNuxfCUEiF9HQG3sC6jl04dZkBQfw8jhP7vtTpvEf2e2jjd86MrCntF2gUL0LsfmjHCFDO+LX1KVTJAO60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=U1U0nl2/; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=U1U0nl2/; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="U1U0nl2/";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="U1U0nl2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461195; bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1U0nl2/Te8JTvxN6mrmt8eKQ+WZzTKJrGV4L6SuYePZOnhzw6R4I3IQXdHuM1Hb9
	 cLY/xy1jbBU8HbFxwc/4OOZQDUciTO2UEKqLjZ8R8B158eKmHsdrxJ43RdulCPS2RP
	 eOowehMcsyVKEECtHR8C49U9vMUq9Pvve7//L+/m9PHie870nfP8/MmweaVKIrMArK
	 Kf8aBa+VWCEmi2+hfbKksuJAEc3uPcZ2ahq05a0qUVE0PVIefkBoBrehy+Nh4nU2YS
	 bMfA5BSCdu5M0O8OMnTbfmiCw3Jgi8XEqLcOznaWAoe5Dahb+VyGHP/8ozExjgXvQ9
	 k92uQijvY2d8g==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id D0BB640BA7; Tue, 15 Sep 2026 09:33:15 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461195; bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1U0nl2/Te8JTvxN6mrmt8eKQ+WZzTKJrGV4L6SuYePZOnhzw6R4I3IQXdHuM1Hb9
	 cLY/xy1jbBU8HbFxwc/4OOZQDUciTO2UEKqLjZ8R8B158eKmHsdrxJ43RdulCPS2RP
	 eOowehMcsyVKEECtHR8C49U9vMUq9Pvve7//L+/m9PHie870nfP8/MmweaVKIrMArK
	 Kf8aBa+VWCEmi2+hfbKksuJAEc3uPcZ2ahq05a0qUVE0PVIefkBoBrehy+Nh4nU2YS
	 bMfA5BSCdu5M0O8OMnTbfmiCw3Jgi8XEqLcOznaWAoe5Dahb+VyGHP/8ozExjgXvQ9
	 k92uQijvY2d8g==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 30F6740155;
	Tue, 15 Sep 2026 09:33:15 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/20] media: ite-cir: Removed unused struct field
Date: Tue, 15 Sep 2026 09:32:23 +0100
Message-ID: <bef5e1ba30198881b2c718f3384b5a911cb4e3da.1789460680.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789460680.git.sean@mess.org>
References: <cover.1789460680.git.sean@mess.org>
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

