Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6883BB9F3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600249; cv=none; b=dZUMzd6kpeM9f8O4ajjc+GR0zpf5nnvT/fFN65tKyVz4L0kcpEUzBB7q2saxCK00t/Fjh+fbdsRR4ALpVGsRU08V0hpCImRLNpos2pzEz8WwP2f4JknRvuKl1Z6jN22YcVyQP7jLTY2O6JTi0t/drVemJfk/I8osjBhWRR2SF4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600249; c=relaxed/simple;
	bh=OX2VQ2se07Cq1rUKoXo3Px8pIIB6/flUHCfxWWariDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFUKvczJnCC2I/gRSUB7zXy8QoI/pIcSX0EfhMzd2Y8w3osu+sxhXbwyvI68+5B4w7PY0P9mhGTjgpxYUqngEBFuJMvIwZ0oB6pNyrQSEUFZf0F14WcW6JoytnUiQoVzp3mnyvbyEC7fvAUX1M0Vs9Kxvbc0k6ZIMhD9P+/b2eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=2MI6qpRj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tAw5z39A; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="2MI6qpRj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tAw5z39A"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id CD2E9EC0187;
	Mon, 28 Sep 2026 08:57:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 28 Sep 2026 08:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790600246; x=
	1790686646; bh=5MAHbyXQ1YyIgb7pURvvzaIpNOyYegvnkrRr9RZyu5M=; b=2
	MI6qpRj8qi0Bx80buV2bMW62V2UbeJZpyFYQMq4zXUdQ7llm8AKW63+BxSJWHYag
	WqYny5x5Pp0WZBnvJBujURkhIyWKW208tak/lMpBSizaabvRrxfnoGAFguRXwSzO
	NfG79RV39J/ck4ICRm1IiT6mX2ZPx2Dyblgxxh2LtaBk29tYiyzznNpjSQShz4tW
	u8SIufY0otdRqy/6M7bJYxy+Wc4QtfA5zzhnJMCKOu3cCS3HwBDWPWkTsdZAczcF
	epInX2AXyFX/XyveiAr6i2vywdiRu2cL+GUwMAPniutzcr50PL2yXsc9eO0AXlZR
	slsIGRwuBqneYS6yq0iKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790600246; x=1790686646; bh=5
	MAHbyXQ1YyIgb7pURvvzaIpNOyYegvnkrRr9RZyu5M=; b=tAw5z39AtYgnCOrUp
	6LhulSjibksnuP+BRdl56QqZSVfPdjwPaOdsCJrOvjLbvEAQmcU0HhmCit3G116c
	O0V64b2KG00pNHowhyvD9uiGewGZaaeSE19UHia4jh+7zwPP1pHqkQsiV6qpg5IS
	lvJCGQxuurojHGw7WnyXcDdmJdFVFxhNXeCET3giX7bCP7UAtWsM402II5vlwG26
	6mEL0DVbgPhDiDMbPrQ8DYdG1QZAaaCozOlu64KVTyrHL1AjRrfRKxnaPLXJ7Ghm
	WTPJG8kbGjYE1aCwwNpUy5CLHdUbVuvlCmcA8knCj4sLstmdPlg9Dz8Xirlt77sL
	oVLQQ==
X-ME-Sender: <xms:NmS6aiLb2mtA2hHFvimyRVfpDTDo6u7Z0XXBkTxoWCKhRm4bAN8Nyw>
    <xme:NmS6aoEiQjQw-XHZVeps2lFdRsEc1xXcJnRgfMSQx4ZbJGYolKElXRFeOWlV2f5VT
    vtG1w1HX3rIgpfP-npewozRNGq38XB-dRoR9qa5V8aYYDvzyDXA6sdI>
X-ME-Received: <xmr:NmS6aqQU20GyX61mqO0kGVpqt2FDIeBXMSLZVG5_nQ5ApqXvKdfZLzFcNfqlqVUIReVoIz54LzXJZONS6jMSbVwx-9Mq15zS-PsYqzwfq0F5xfQ>
X-ME-Proxy-Cause: dmFkZTEYPQEAqe7gPFHjplnO60tfuhjhLdOmqwPZBkw/sSX3x33K2ucn9ekowdHZ8vN8Ce
    YG5E3bsJ1R8Ji+09oOAUkFItFE58O4sD/8UfqKzqOHSTlT/QJ2ZZ/+lfSG8WUwpRWVEFxC
    +A25lxNWJTBn3Lf6y78WP9m8S0fo8FFZLSIi0lbmp1xWWT465YZxl4JH88g9yVS/HqC/Ks
    eOUF5UiIk9KzXfA9VNpGLTq1vgq3O7bPrwmvHF5vnJNGYLYqUl/PJ1LWyByERcUanUfe4K
    +FHR+Gqq3U4x537MgadHpxXMimkv35U/ETJ3HWHvviY/8f25uMv+qzDxmQgW+ETy0Z+Rjt
    dW3iqcH/amhjxp2tN8JheQqB2GPGn0bAbtSQKgHp2Tav/w+4qbuLDTNvKu2dPTxa4JS8kB
    m0DOeZAvPhVVdAGJGdQmri1MDpm2bwdKeHJNDQoWwGdCXUthQsDZaV/dKzHL2e5TPEWyzJ
    1Hy639s1EzeZ0/roVPPfcQpnlxd0VP5hTasb4wmnk5M2HgTHII+PGzxvLD6X91JSUT5Tgi
    8Sjp0OMQS8ZQ7sFLqCywLf2MbXt6JhPW3RzBsVDeSCbb2CJKqundLelBgpnHeaGudImSfu
    GwsuXUO97Q4yp+QgurnUQ+xnkIKzQd5j63eIQsQHK5qI/H857PHFZorOm8XQ
X-ME-Proxy: <xmx:NmS6akENm7sozNOfelkwH0a7WLwoOrnSks1hg75BpzMZfAB8Hv0VoQ>
    <xmx:NmS6am-9baCBauX8VpkfSEQhWtGHe3fzf_T9vrTJbZKMfZv7oQSHVQ>
    <xmx:NmS6auJZEX1Oee7W2iIJRwx5BYUQ7WW4gi00vxKRStJc0csrjgbcag>
    <xmx:NmS6apZZ-uP-oUqF1xwe4x_ZMu-HnkbZcq5c547q98c6_szzJ1WYCg>
    <xmx:NmS6ano8jznWGvrLFi-KDZeyLf7yYWtR93v9Z_GaA3MpQ7JCCDyGtDZh>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 08:57:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] firewire: cdev: use kzalloc_flex() to allocate structure with byte array
Date: Mon, 28 Sep 2026 21:57:17 +0900
Message-ID: <20260928125718.50974-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928125718.50974-1-o-takashi@sakamocchi.jp>
References: <20260928125718.50974-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some event structures have a trailing flexible array member of bytes to
store event-specific data. Use kzalloc_flex() to allocate the structure
together with storage for the flexible array member.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index caabaaf99cb7..60067c5b1973 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1020,7 +1020,7 @@ static void iso_callback(struct fw_iso_context *context, u32 cycle,
 	struct client *client = data;
 	struct iso_interrupt_event *e;
 
-	e = kmalloc(sizeof(*e) + header_length, GFP_KERNEL);
+	e = kzalloc_flex(*e, interrupt.header, header_length);
 	if (e == NULL)
 		return;
 
-- 
2.53.0

