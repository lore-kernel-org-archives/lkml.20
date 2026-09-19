Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E44825BE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818634; cv=none; b=ePOMpDNAaI7lmSd7/iIAG3UEo5NZcLEZsL/Na9sM5F2VL1HNNY7GbGGNEWTatmiBMz0X0+yMbv+K+q4wWLEO2+Dn2R9hfPSSSOtiI74q4M49AumDcVVz3UaVJ8+2FNwmFJPh9xHFxpJBZWEdVn27N1MoVGJOZ9lN5eLgtUU9VPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818634; c=relaxed/simple;
	bh=kcESpH6Gk72nmmcCt8rzAGINYkEgp40365wJbVz4BD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/30sMx+fAnAbZ03tctDLQ8Q5aTaL1Z5UBFg01553hc+C6V2C1OgqzSghE2uzEUJQbUAJ2c0ScC6A6oEwsQnt6KBuK5zQntBqQgkIs+hohZl7SSSh6hevNf8A+4BdglkIvjiP/GOkxr6rGxTnvDLOVzZkaC+vrWPDi5QJIEBbVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=OdTkaEgy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b+9pJFAi; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="OdTkaEgy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b+9pJFAi"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 393421D00109;
	Sat, 19 Sep 2026 07:50:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 19 Sep 2026 07:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789818629; x=
	1789905029; bh=4UTrVd1X6t7D1cKSN/r61DTTtOPeoTFTUu+eVFl26JI=; b=O
	dTkaEgy1tt+NgZKAU1a7YNevdyHOL5JM+cGWE+5C674m3a32IvVXYpfzpvwRr+Q+
	v+DA9gI8gfZZu1l082fg1B+qIHXH2y5xOH8aOKGtwPMi7dN/X87BqbvMnOUl3IHL
	k38hUq3iI7NyaI8ahlFUFIKnzCr/ulbExwWnzHFnbiPXLLBFd9CLeOM4ODA/yvGH
	JaQMM0a8Gkz8GNPGc0o6jh9yLuftWkM6kVafV6k41lQ+xWkcQN9SKHQr9+Uy81q6
	dyiR5P1e65aC/qzxlwf6QzkiNHxEvSW7YU8NzxN9K7daBi8njylrX95wYBytW2J2
	BF/Ho6RcTWmkCu0d38pkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789818629; x=1789905029; bh=4
	UTrVd1X6t7D1cKSN/r61DTTtOPeoTFTUu+eVFl26JI=; b=b+9pJFAiH/afjhMen
	wsFr0P1Sev3kZbe7sNJAHaEofrcOD9VmeTVRN7J1vdcZTeNG9i5768P9YmnLmLMJ
	tUPnpDXfssuVFmwwozHTTPdqPCzrIdCM5XQFprfWoJnTPHMKF75rc1Wc6amiLTK4
	7bSkdZYzHge2PjmxoaQbYgLpmrCPRD4kT0ppaYwoU1xbJMogHk0xZiu6xpY1Rsie
	wzdp7oOoeO3LD2Xd8Y/a7eIAmtXnGky+pgP5YMBC1XBhCXQ3qOREF6a/ZvByB19z
	rSNDjw26Heza5Cb6PGKjnNtDTqUk2OtXccAo+A9/qLv6B1nMr2Bznw4riJnyoTA6
	eyKnw==
X-ME-Sender: <xms:BXeuahEIEWxBtq55GlW-B-034XMPrPhHlFkADJoPFIrnZwXa_F1nYw>
    <xme:BXeuakT-Baa9v6y0qYD46pqJyAGPJywZ6_ntJ-15QWLzb1B3r3wCi6t2gflFW3Gg8
    9w2l37PO7wnKpjy720SStn4PSW3_zQ02DkMX6mXZc7dIZnNXvjV4g>
X-ME-Received: <xmr:BXeuaqvYdFtb7ySrY8-L66OPt5Cb4k_hvJ7vXhP3YTPMWpIUVgYCZyMcGitvC-8-bwsJILeafMLy2Mmjfi9oC1G1YuCcfFAhPQz9VTu5ObypCg>
X-ME-Proxy-Cause: dmFkZTF89Q54GLsKvm4RbZqlKDuUewYy1TCjGEnhC1YTwWhDVU1Gg8XUBhEJm2TFxVZvvI
    zZEWEbHGf2ZL/pZjpc45k/hrCyAQtJRuufvPYfjuTBfotRHi0VhVl9zEH589EBWb5B7mV/
    tfUd2RmdbhW/gTVcrpgviK+UD+Y5c9VHkMn0OFtbpmRapD9LbA6ckmj6VMUOy2adwzCJaQ
    BezE15MGm6MTQkkQRzD5EoBdxPXwsaCP1b5MkvdulSTaCPXedkrrOZFrvrHQtWUmA/MQcg
    pYWPbDXBkfElLnA8ESdXyHxJfOUX3+Xp1s4Nd0Jf5roMulsmIdACOHs9ds8uKd54CVcFSu
    FrJvfGeGAGadFwexTrwSUP3vAPG9WL3bkmiqFNVzs+ZkQw5baeQixF42QnnFrmdbwe2PdA
    W1u9W/SzS/jw2hT2wmZG5EMT+hg/Bwxwosm6QIp9kDmxjJnwPA/wJaZ9KOpkG7VI8tzuLD
    oHjZTgXV9MZs0ANwQ+fmsCU6ZG8zwjFgX1iQRErp7g4PsdW8Knzjf52+yr2nbK+RY52mgn
    kBOY6eQICHPofnKUzZ1wb0y2xS31YGDM1A8OKuZMilksabVoyFjaJHQot/FD/gW3CtUsok
    Vp6fGQuyyCx11x+dlQ4BwgfGWNLxzELowPZG1GrgrWVyCA5GU+W3cqjOIorw
X-ME-Proxy: <xmx:BXeuajzOpZBVn5iEMUwejxoHP4viuhrNaBzTQnkwaQ9qYVEoxmjeWg>
    <xmx:BXeuak5qx5AbaWIh5CqYsQG0mx7Wd5szk8emR9m6YuvCu6fKCDjubQ>
    <xmx:BXeuatVOJCTg6oA6oR6F-A3zcYqwwzg2zuf8Rs1UJGzSHDJcGCIZww>
    <xmx:BXeuag33IpkDOeagb2uHmpVPrGXRjxUomMkgaDUuuxcaOYTwO4pZog>
    <xmx:BXeuavav33Bfe5YDsqtxqkA4IggLah9_sqtTEHlOZPWFVGjU9tdCaU0p>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Sep 2026 07:50:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] firewire: core: use spinlock without irqsave for card topology_map member
Date: Sat, 19 Sep 2026 20:50:17 +0900
Message-ID: <20260919115017.859169-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
References: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Asynchronous packet callbacks are now always invoked in process context.
Therefore, the topology_map member is not accessed from IRQ context.

Use spin_lock() for the topology_map member since disabling local IRQs is
unnecessary.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 91ed85b7aa22..a2a8d755ad0a 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -1256,9 +1256,7 @@ static void handle_topology_map(struct fw_card *card, struct fw_request *request
 
 	start = (offset - topology_map_region.start) / 4;
 
-	// NOTE: This can be without irqsave when we can guarantee that fw_send_request() for local
-	// destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->topology_map.lock)
+	scoped_guard(spinlock, &card->topology_map.lock)
 		memcpy(payload, &card->topology_map.buffer[start], length);
 
 	fw_send_response(card, request, RCODE_COMPLETE);
-- 
2.53.0

