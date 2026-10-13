Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE3452E063
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915968; cv=none; b=o/pgFsGo27QuRvWUaqGxp4SPEJyLgfnrZeR20wJTBQ1Kyee8dSKsf6AHbnmWyS8e+LakIrYIF/eMeZNUJfEN4sViBG74Pj81IelxulGan8e5Jtqj3Qupojj4k+a9aKe+YVuyI+zGc7G/2pZwRYXlpzofGJQtpDpxQiyN6Da4VSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915968; c=relaxed/simple;
	bh=Nk86xwU3++I/ofg0CCePXYtenXXzvIS+7/oThiBmfHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVrpg/1iAuBxkcgKg7E7ECtbRE/QL2gkVroQFgx4+ERjyCdiO/xGXemGUdF9/VgkLE0BkfWvHaMdJiC1QBdQYmT1mSiSIAaPn80boZkg1rbfgA1pNdsrYvD/p/wB4/smLQzuP//hgBTQeWD17Tis29HCSEJkfNf01FWrCT58zsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=TjaD6GYh; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="TjaD6GYh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:subject:date:message-id:reply-to;
	bh=vSfk+1J5upYl2MAl2u1LdcjbhXqONFUKaBpM+2+0mQw=; b=TjaD6GYhGZ9F9l1MhwLCG37OTU
	KiKJ/eZhgh7ZRRRRxQBYkx4QBI+0v/f9iwJwKh7vfLo2xqv7v4YMnvLDF68A9LqNsjfWwXtSDOMrz
	5SIYBlMR0I+hWMh75JrPewlwrf2Lz5vXjHJywS5BHAXthoXHAtY6ZUGiUwoNWRrt8GF0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1xGhCP-000000000JO-0oxK;
	Tue, 13 Oct 2026 14:26:05 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: 
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: fix LCR register description typos
Date: Tue, 13 Oct 2026 14:25:58 -0400
Message-ID: <20261013182601.1167076-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam_score: -1.0
X-Spam_bar: -

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Fix LCR register description typos in comments.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 include/uapi/linux/serial_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/serial_reg.h b/include/uapi/linux/serial_reg.h
index 9c987b04e2d04..a0f3f8f01afc3 100644
--- a/include/uapi/linux/serial_reg.h
+++ b/include/uapi/linux/serial_reg.h
@@ -122,8 +122,8 @@
  * Access to some registers depends on register access / configuration
  * mode.
  */
-#define UART_LCR_CONF_MODE_A	UART_LCR_DLAB	/* Configutation mode A */
-#define UART_LCR_CONF_MODE_B	0xBF		/* Configutation mode B */
+#define UART_LCR_CONF_MODE_A	UART_LCR_DLAB	/* Configuration mode A */
+#define UART_LCR_CONF_MODE_B	0xBF		/* Configuration mode B */
 
 #define UART_MCR	4	/* Out: Modem Control Register */
 #define UART_MCR_CLKSEL		0x80 /* Divide clock by 4 (TI16C752, EFR[4]=1) */

base-commit: 36844ea19656fb41278799ef3d5cd52120d89149
-- 
2.47.3

