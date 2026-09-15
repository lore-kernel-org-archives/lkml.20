Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE84A5C38;
	Tue, 15 Sep 2026 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461202; cv=none; b=twdZCF1Dfauocalg2fj9+owtawV+068x1sVmyGOmItQt49M2CzyqBONzXfr4gxaJbSTeSLw8VllVOXctZmcjVJtRlR0KhZKFmIAXOU1lV8qZuQ82w7JBSrNJhlkosMtuAcBdY6E8eMVyY13TBHhYWSbM+9r/+opghfB1YpdC67s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461202; c=relaxed/simple;
	bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InavFmyJIYaOgtL7/g7c3YOojGT/y5USG+jRsnVbwxZul7jlUnfWzJiUnHUUWXuvaoDya87KWwOqSvYvr81fcReLfFrgilp57kyLBtIapNz6aCp0aJI7ol4fqFRvbkWdfIMcVFpeACcUIdSsjLCSLe6gyyDzqFCe6Uomg+KIH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=e6gKUmTn; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=e6gKUmTn; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="e6gKUmTn";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="e6gKUmTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461198; bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6gKUmTnwWO6qxikS9gcIIAyVAKooBz0GOEnuoIGWA+aRVjJ7W30YSzK3jJnwyNzn
	 SbOTVHWL9ne5f2nlDbS5QQdkABo0lPnAKbeLgQjaMwcR7j15V61uYTTq634ZkzAfPM
	 3ENwJcYltK2VYsEh63uKy1Vt1cot3hkCGcm7yQj8HB2UDVfgx19tmhMxEszgss/ye7
	 OoGGFrpEeb/f3SYvj27eko4rGvop4yxn9OORrmJhfrPs/O4USJmX6r2IIZV9rMdVwA
	 S5iCTa+ucuC7p2Z9VWrSN1aC4TBDLIxw9LfOKyGUjgy2I8+gZ354b+biWiD7xePujn
	 58TyEawJtJbog==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 8CD0140BA6; Tue, 15 Sep 2026 09:33:18 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461198; bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6gKUmTnwWO6qxikS9gcIIAyVAKooBz0GOEnuoIGWA+aRVjJ7W30YSzK3jJnwyNzn
	 SbOTVHWL9ne5f2nlDbS5QQdkABo0lPnAKbeLgQjaMwcR7j15V61uYTTq634ZkzAfPM
	 3ENwJcYltK2VYsEh63uKy1Vt1cot3hkCGcm7yQj8HB2UDVfgx19tmhMxEszgss/ye7
	 OoGGFrpEeb/f3SYvj27eko4rGvop4yxn9OORrmJhfrPs/O4USJmX6r2IIZV9rMdVwA
	 S5iCTa+ucuC7p2Z9VWrSN1aC4TBDLIxw9LfOKyGUjgy2I8+gZ354b+biWiD7xePujn
	 58TyEawJtJbog==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id ED4CC40155;
	Tue, 15 Sep 2026 09:33:17 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/20] media: mceusb: Remove unused field
Date: Tue, 15 Sep 2026 09:32:25 +0100
Message-ID: <9b099443da843c3112da122623a60fc649ae24e1.1789460680.git.sean@mess.org>
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
 drivers/media/rc/mceusb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 39ba7f6a2549..356a54f91d05 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -484,7 +484,6 @@ struct mceusb_dev {
 	u8 cmd, rem;		/* Remaining IR data bytes in packet */
 
 	struct {
-		u32 connected:1;
 		u32 tx_mask_normal:1;
 		u32 microsoft_gen1:1;
 		u32 no_tx:1;
-- 
2.55.0

