Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D7C57267C;
	Tue,  8 Sep 2026 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882860; cv=none; b=PqS2DJLzfw5sbBaCMDUeHyxfygjwTzJApyQwyrlUPrhrvPjYX4o2wGCh/atkgax1+Ej47aM/UZWN6bMFtZ4/QZXbNDixATA+P9p6x7huiViTm0sp6YFZI/ZflgjuWjGYi80ppsFJVX1Uvcbb09tsBacu2xHGod0X/xG7cq3CvWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882860; c=relaxed/simple;
	bh=hnHHBuzpLjKN4bU3wFT14jg48liHRAuR4F3yYv3N/HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+MbTLWEmzSq7gJCwUCHUKKoC+uUasxUyuSoYDUM96S50zOsO6And0px/NNv1IOWxBot4pQ5LbhjAfN5a0NIYZadIClC63EzcG33m8ZN9aabOMwtvM/cUSV5aDmeE720mcHTaOE0O0xBwhy2SF7Z7J6NFqsI0/i5TlBGYXm4Sjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=T99KamON; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=UiUQkN3f; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="T99KamON";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="UiUQkN3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882853; bh=hnHHBuzpLjKN4bU3wFT14jg48liHRAuR4F3yYv3N/HA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T99KamON4PKQB7CuF5BzVoPXrDZpR5x40orggfBQCPiPLCuiiIP80NMtAH65a5RBL
	 nTnBVOKpUo+5+a7Qv3xb1i3O9RuAjazeBkzz3PBgfVMvOaCJJ26oR5w5JqlfevZgwI
	 /f9hUzApNxZ0ZSPvCB8V6zffxcvQMSjZuBXPQVi4qFEzTiuzdp6K+lH30gvqTOviHB
	 tSXkGira2FHeGjGlFlenplRBRD+9hwqakkl4mB2NCyOcx260oLO9yFzaxM0ygF66J1
	 QHK2DUdk5qbntKUTF3lilPOLs96hiXu6Xw9fNe2JzQsJFyu5tpjPDP5j9/LuxWKG3j
	 OXaFHGYJzer7Q==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 4C77541454; Tue, 08 Sep 2026 16:54:13 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882852; bh=hnHHBuzpLjKN4bU3wFT14jg48liHRAuR4F3yYv3N/HA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UiUQkN3fqOrACdUClRbk3HykgqrY1ZKQutMxMwuYZJ/t9/8byop0oMrdNE810ruM2
	 +uZABAC+8cln9ESvJdcTPVIwupWD9iOd+DiQRG/E54Fd15gQEBAiHRok5VyaoyzNaK
	 W7Mp4UfNOhWpudV7UMdezI/iigqwJVXhXrSDb6YAmd8CJZ7iAkt9YKiGR4ZFmhfsHS
	 0j44OY1xJfN0frGHwEavoVISx3ElIGWEN7ZMMqE3yx1Xh7Q3K3kXc+aNj5LWkTB8Zq
	 +kYUgFKI5k2TcekNGpIcRh05FMFBnV6YWfu0sOFiRXaR7GJ/4VN60tG9t7NByRkn9G
	 YC4VH+RG1P1xQ==
Received: from maru.home (host86-150-50-53.range86-150.btcentralplus.com [86.150.50.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id DA17441454;
	Tue, 08 Sep 2026 16:54:11 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/19] media: rc: Use binary search for adding or updating a scancode
Date: Tue,  8 Sep 2026 16:51:56 +0100
Message-ID: <afefeadfb3f69f8a77294f0194db4ec7f428d0f0.1788882189.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
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

