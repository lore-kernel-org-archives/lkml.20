Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBE747FAED;
	Tue, 15 Sep 2026 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461193; cv=none; b=uEznToYN1kgstC/BDIetD89ldYeahtSdIpmuWqZ7DEgPLWr1Qc6Jq7IL214K3Gsxhgm22HZySpMGReSO2TWKZNsieeVbMts/RIpRCJpP459DfwPV7RTN0QxvERKn5b2Qi/H9Qx+j56fDdgld1Ux2w0nU9VUy9qPmjgo8icPnU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461193; c=relaxed/simple;
	bh=L6VFKfmee1uTNc8tnf6QAD3qGZFHOm47O9UhCCytAgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQsKVIGTE6m/d/G5p0d5vhSMgSsMmWescfex2eY+vn47LvuBqMlOW9H4i3lmOSfBAOXgNKsGJVtYI2SDlZCg/YZP6DHmoGA6TpcnfffmYCCDlXh8psknPosg70J83bz85cT4zlNoxSUuaR8cucvYHp3weshqjkfAnXMKNG4VzTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ljRKywPu; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ljRKywPu; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ljRKywPu";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ljRKywPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461189; bh=L6VFKfmee1uTNc8tnf6QAD3qGZFHOm47O9UhCCytAgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljRKywPu1VFtBKR4dK9EbkSL790mVFb1SVmtVEqszCkUknOjXqxJfloWrAXnwJx2w
	 s82RnSfD98B7s3jzhZihDphUfQ2kwBh3CRX9iFd7nXaneSQZqzShlXbbvW1VuvSoxq
	 kC2ZDpeU8QPMZtKJohHah+SgqBg+0yXwrzJRZ782aT1xg/ioI7ANf75OxNjyer34/B
	 xC0EeNNf/+bYOEkyRueoUWNW7qEQjUfRa1/N/gDNnokgVNuh84hUiDOdVENu80d4ge
	 OKaErldUtBZ7xf8ujKwItUbP6CRmfRIXSsEeCrbcZ/U4IJXbbrJAcSR7/Gd7TtuYXC
	 e5TuUjJ8XD1/Q==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C6DFE40BA8; Tue, 15 Sep 2026 09:33:09 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461189; bh=L6VFKfmee1uTNc8tnf6QAD3qGZFHOm47O9UhCCytAgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljRKywPu1VFtBKR4dK9EbkSL790mVFb1SVmtVEqszCkUknOjXqxJfloWrAXnwJx2w
	 s82RnSfD98B7s3jzhZihDphUfQ2kwBh3CRX9iFd7nXaneSQZqzShlXbbvW1VuvSoxq
	 kC2ZDpeU8QPMZtKJohHah+SgqBg+0yXwrzJRZ782aT1xg/ioI7ANf75OxNjyer34/B
	 xC0EeNNf/+bYOEkyRueoUWNW7qEQjUfRa1/N/gDNnokgVNuh84hUiDOdVENu80d4ge
	 OKaErldUtBZ7xf8ujKwItUbP6CRmfRIXSsEeCrbcZ/U4IJXbbrJAcSR7/Gd7TtuYXC
	 e5TuUjJ8XD1/Q==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id EE0ED40B71;
	Tue, 15 Sep 2026 09:33:08 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/20] media: rc: Use binary search for adding or updating a scancode
Date: Tue, 15 Sep 2026 09:32:19 +0100
Message-ID: <042abeb49891d9d6be5035559c656da18eb22fc9.1789460680.git.sean@mess.org>
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

We can have up to 1024 scancodes entries which are always sorted, so make
this a little faster.

We need to either get an scancode entry, or find the insertion point
in the sorted array if no existing entry was found. The bsearch() function
cannot do this as it runs NULL is no matching entry is found. Therefore,
we provide an open coded binary search.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-main.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 37ba19164875..ed746255b0a2 100644
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

