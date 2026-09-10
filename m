Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DC6411A1D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.74.67.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027488; cv=none; b=kYAwKl9UFw7B8WgR1VC8tCjpvdZYmJ9jdUoMHvbhLkgc6qTGrXpN8/C3+WB6dRRedJ3vX2+sPalZDibabvbnB36PyEz6WlqC30YCgowWF7bhG6VCYTYiymWw7it2vu9lXRdz6TLHCHwYYkXj5Dj/wa4UYYeHt/1aACASY1fcehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027488; c=relaxed/simple;
	bh=Hdjzl0q5gTWrUYBpMfbk7MNGe07bPBAhEA9HoWgMxbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VeNPhJycYQUJGZ1iBbWJ1ZaigPyu6zr/uK4eWl2EkQJGZqR+z2InCGA4OQJqw2HrqE1hiA5HMALhr2/hbH2cEoCToU3u09DC7OUf5UjGqHLGcZUtUwRUQ3qfW5TZ6PeZk5TPevdy44Xo9MmHxtlSpW/Z5/MVYeRjqDR8EgA4luo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm; spf=pass smtp.mailfrom=poczta.fm; dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b=hVJS2Noy; arc=none smtp.client-ip=217.74.67.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b="hVJS2Noy"
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Thu, 10 Sep 2026 10:04:24 +0200 (CEST)
From: Slawomir Stepien <sst@poczta.fm>
To: syzkaller-bugs@googlegroups.com,
	johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	syzbot@lists.linux.dev,
	sst@poczta.fm,
	syzbot+9bdc0c5998ab45b05030@syzkaller.appspotmail.com
Subject: [PATCH v2 1/3] wifi: cfg80211: do not support direct add of station to AP_VLAN interfaces
Date: Thu, 10 Sep 2026 10:04:16 +0200
Message-ID: <20260910080418.725741-1-sst@poczta.fm>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1789027465; bh=E+1GBVXxYvETm6gPmUPJr9zKmB/1RPxE9OPJDw/ZhVY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hVJS2NoyLaAWYkIxJcaWX1Qrxx3ZhJMTCHvP5LgwxEZ3w77p1ctTUE9ClG9GM4OcS
	 H0Lz1UpLl1gcBAmPgCMU942oi5NFdgA47BZqNSx2UMcwidbYxEYRfSFfySO3EBlkpD
	 +Ehn3FbYgLOP/7uy8MoEy/YDh4zodGGoXaVk/HQ4=

Prevent userspace from adding stations directly to AP_VLAN type
interfaces. Userspace should first add the station to the base interface
(AP type) and then can use CMD_SET_STATION to move it to AP_VLAN. The
other way is by using NL80211_ATTR_STA_VLAN.

Without this path, we cannot check if the AP has been started before
adding the station - wdev for AP_VLAN does not store information about
the base AP interface.

Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
v2:
* Update commit message with NL80211_ATTR_STA_VLAN

v1:
* https://lore.kernel.org/all/20260813090434.2071318-1-sst@poczta.fm/
---
 net/wireless/nl80211.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 899b6374c550..fd784fa3fff8 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -9556,7 +9556,6 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 
 	switch (wdev->iftype) {
 	case NL80211_IFTYPE_AP:
-	case NL80211_IFTYPE_AP_VLAN:
 	case NL80211_IFTYPE_P2P_GO:
 		/* ignore WME attributes if iface/sta is not capable */
 		if (!(rdev->wiphy.flags & WIPHY_FLAG_AP_UAPSD) ||
-- 
2.55.0

