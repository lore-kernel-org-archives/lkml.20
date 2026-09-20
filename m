Received: from mta0.migadu.com (out-243.mta0.migadu.com [91.218.175.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591653ED11D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905006; cv=none; b=tHFxNOhvPlE/M++2ie63A9OZo+5N28v+h/WpXkgENkGl1dygvAuuR4bKuoxyEOK173n/EFy4kr+TgBqKcmLu2znNvuw3feBeX7AOmdxxgbiSymn0mSx327Eohwv7iBgRBZ30sw2HAsdZA7lqgw+lAPMykASKO8M9wv6nggrm+t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905006; c=relaxed/simple;
	bh=KH7FktkdMcieqHaTaKksUq53Yjn6UUlgcItyieml+Bw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VNwMoQ8GG0BJQ//zoP8cuej6YyS0g2CvsUksMIur4AwTgbIdx03Q8iBPkUkR9j2VfGnHAIf4CzQPOXJg3frXn9dxovEaGqyWarcXHJlndqDYHDagJjkK0l9Kz/BefeKidS1BgGQbtbxw9Co1lEdwEVTd/qZD522nXEiMVH4Wr7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hmAT4QVU; arc=none smtp.client-ip=91.218.175.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hmAT4QVU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KH7FktkdMcieqHaTaKksUq53Yjn6UUlgcItyieml+Bw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789905003; v=1; x=1790509803;
 b=hmAT4QVUpiiw1eL44wj0U2wQWpSIppl0qpeDcEurVf8uG3ffx4wF2m2rg00eaIVtLBeTqxLT
 lSnfqLSJC/BqespoR8Fv4PSpbmckvSYppjMiNs0wKz/MOhWOAb1w2Ijd40oPypJ6vGrGdsIWWK7
 jrPuq8W/RrPzyobF8LvnQSw8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 897b13857ccdc661;
	Sun, 20 Sep 2026 11:49:52 +0000
X-Mizu-Trace-ID: 897b13857ccdc661
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Kees Cook <kees@kernel.org>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH net] ppp_synctty: remove redundant skb null check in ppp_sync_txmunge()
Date: Sun, 20 Sep 2026 19:49:43 +0800
Message-Id: <20260920114945.2517-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The skb is already dereferenced before the check. In addition, a TX skb
passed from the generic layer can never be null.

Remove the redundant null check.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202609132245.txZXoUxc-lkp@intel.com/
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/ppp_synctty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 9e440e110e9f..b90ae0583c84 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -464,7 +464,7 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
 
 	ap->last_xmit = jiffies;
 
-	if (skb && ap->flags & SC_LOG_OUTPKT)
+	if (ap->flags & SC_LOG_OUTPKT)
 		ppp_print_buffer ("send buffer", skb->data, skb->len);
 
 	return skb;
-- 
2.34.1

