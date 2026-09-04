Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569C32AAA3;
	Fri,  4 Sep 2026 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527294; cv=none; b=dPwAptMJ/er/tZZ4BiW8Zc1Ooy7wByaPGSIolF+wMKyQ2uOA8NH/BM6dBmME87ztiy3NSbNH9m0Ranp8gwsqDkLQMWIGyqq+CT71/3RzFYd+slVIjqGRX72alFlVgaZX4RmRFeuenpgB41mTOwE8k1pjQbHHekI9maPTLiinAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527294; c=relaxed/simple;
	bh=hnHHBuzpLjKN4bU3wFT14jg48liHRAuR4F3yYv3N/HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmFvyX7cNVv+Ld8Mwew6aLrojGhZYIqWWYr6jajZjJGhdbF5amrbnMQ7NEevTDYoIjdvJe7ftImlwHklJPyHy78siut2KPHZ9WSVhUKkp0CAKNDwxrNIFe8p22N3UkDA69bAf15umoAQgRnbDL4AxgiW/08f+1CEiXsx3cFUVgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=fMlqzebP; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=fZpML6G0; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="fMlqzebP";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="fZpML6G0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527283; bh=hnHHBuzpLjKN4bU3wFT14jg48liHRAuR4F3yYv3N/HA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fMlqzebPRVetjLts3GWMeAX6m8LMzPxmkNFhrs1j8OvHYJq9pmo3Bkb+GgrSgZ1B3
	 fGA2QtkP8thXNI4aXk+tQoQmCfbVj/3QfnHXb14UQSUqfdFysFjMvJl5/s/f9H+oHT
	 8HQXR5M5ThRPsyKLOMHDZ/7YnJTRKDe0D4f+N+2QsLN/TrI/dUJvM88m0bH0SI2hQX
	 aSBM2tEeQl3Wh45ikXxV13RXEVAEXuovOnJJku71ZNqb6gwr4y2Ox9aeLupxfgekDL
	 iUYLSJFpFz6CFbjA8UPtYLqhNCdMZktwYi1m1exnOucQ/zdWkBr3KC+ckKDFcGKn/n
	 hDqTtDJOc+oww==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id CA7E541461; Fri, 04 Sep 2026 14:08:03 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527281; bh=hnHHBuzpLjKN4bU3wFT14jg48liHRAuR4F3yYv3N/HA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZpML6G0vkLUAEM+d9v/oE/MaR7LQxUQHFZ9EOk36nfg1KcQ92uwq4TWn0NIA+oNR
	 zGAS74WEkZ/yaE2Y0J5ToavkqGO8OcUXm8WW/S+oS/S+tgL1zNvLXvgNmks5hP+J8P
	 BzocytyU55n1qm9OkyarNTPqDVFbU6rAF/KxNHyAVYSnnDfWy0xOcemDUZxTHtLC2x
	 8w4Ul0kASub9HOCZo0SLrF9y8Hlh8CAJZlqEbtafGqgpfDPQtzSS1gWvVjGqhNcOJ+
	 rCEHkXe7ARQHKiDn8zNvXHtTwe75YF7C3m2zMQNn30qyyLPRM2mrTeIie/cuMlN3nw
	 UDvp5f/By4+mQ==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 13AEA41448;
	Fri, 04 Sep 2026 14:08:01 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/17] media: rc: Use binary search for adding or updating a scancode
Date: Fri,  4 Sep 2026 14:07:36 +0100
Message-ID: <420756ef768b8e507b83e9e335509ae2908d6874.1788526920.git.sean@mess.org>
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

We can have up to 1024 scancodes entries which are always sorted, so make
this a little faster.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-main.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 924b13fff753..795ac0fe4858 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -391,7 +391,7 @@ static unsigned int ir_establish_scancode(struct rc_dev *dev,
 					  struct rc_map *rc_map,
 					  u64 scancode, bool resize)
 {
-	unsigned int i;
+	unsigned int i, lo, hi;
 
 	lockdep_assert_held(&rc_map->lock);
 
@@ -406,15 +406,21 @@ static unsigned int ir_establish_scancode(struct rc_dev *dev,
 	if (dev->scancode_mask)
 		scancode &= dev->scancode_mask;
 
-	/* First check if we already have a mapping for this ir command */
-	for (i = 0; i < rc_map->len; i++) {
+	/*
+	 * Binary search for an existing mapping for this ir command.
+	 */
+	lo = 0;
+	hi = rc_map->len;
+	while (lo < hi) {
+		i = lo + (hi - lo) / 2;
 		if (rc_map->scan[i].scancode == scancode)
 			return i;
-
-		/* Keytable is sorted from lowest to highest scancode */
-		if (rc_map->scan[i].scancode >= scancode)
-			break;
+		if (rc_map->scan[i].scancode < scancode)
+			lo = i + 1;
+		else
+			hi = i;
 	}
+	i = lo;
 
 	/* No previous mapping found, we might need to grow the table */
 	if (rc_map->size == rc_map->len) {
-- 
2.55.0

