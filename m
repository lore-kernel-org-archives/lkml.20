Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364832;
	b=LSxLLjlCZ4ezAoVdrsACMNReCZ+48sHQBw26ZLWTvJVrSejbUWjNuHiYn2hVhZzWrFrK
	 iophjp928smjOJ0UjEtcSHFiIWTnDWlSGbhEdbC/5UqSV5hwWAGXit88tmtWskqMtqUcF
	 vxvsZPfst/w8guuP7OOjfM+sdR2H6mIpruPMv5QjPfj0Rc0rrNk655hGDdwOXC1T2zOYO
	 nqys1vQ6JNgn66iqx0Vv4IeWkgTwyRRGiIm6lTUdtK6hF+hJg7kEdCJFZMNyIz7vYYRXr
	 0FZNXGLE02W9M+KCqD6MJ/g7EPm4Z/oUIWIrIRz6/HMe04TBBB7FDZMJc2ja3cnjkCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364832;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gEo0FDfWP2rBHOYzffmKUuZaHK928f06NWiJJc6SpR4=;
	b=v1OCcUCv/hLjtckPZi5NfX7p8GMBYa9UL0s6tP0lFssHwJ96L9B5fKc11gVzgccabIxG
	 5z+0Wvkx1e8mEQipXiVIuntPMXDQ9dcq7n/Ur1qpX7BE860LmpcPox4X7tfWA8dDS4W2Z
	 jOl9l3+FOmgZia/9tJAHDbMMNaLppPDY4dJF/HvR29BvqWeoGov0zCHGMJDRf3IPceb9F
	 P1uQU9jT7rfCWvYrODARezwCHESXZI9uhLYlfJwKozBB3/5gBsh0h7j3tnOL4MJIgWMhI
	 4Q3eLsysmUh5B8eUg8As2Ry0E7nX7shpwWHt/eBJmvPuz8/adOh2kRWU4rQrOD/ijHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHAlrSnP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B998606A31C;
	Wed, 11 Nov 2026 02:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHAlrSnP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECAF1F0089F;
	Wed, 11 Nov 2026 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794364831;
	bh=gEo0FDfWP2rBHOYzffmKUuZaHK928f06NWiJJc6SpR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kHAlrSnPbNl0mTDrm73d9q4Nu9GGyOhlKC36k3PlkmpE4yVHel/JU4h/UpHMGkZF/
	 MYsTk9Ti9Ovod1BVYiZVhDnf/3r9/w/2LS9M12ARugPS4K7N0YgZZ04a8jJNJra7y1
	 DvM1T1KQYoiB+7TuNVPPrg9wh/nDxfxw0Z5KL57O/9pSaXV5HBWFzcrtPwKyD2Jsw5
	 GS29erLAGMO3AmPDvX/YSzriS4PYlauOFk92/x8scBYZFl8zJcXzUUDoR/ekthgA4j
	 RUHsACguK0VzYqSGQnB92MPiabCcqIutuUd/oA3DZzkJs2pGAmd+1pjdzMHPqmFl5b
	 WoUtxunFev4rQ==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Johannes Berg <johannes.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] wifi: nl80211: fix double wdev_put() from the wireless-next merge
Date: Tue, 10 Nov 2026 21:40:29 -0500
Message-ID: <20261111024029.759859-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avNx0gmZTCIjln1Y@sirena.org.uk>
References: <avNx0gmZTCIjln1Y@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wireless tree has commit 5e25f6b1b18d ("wifi: nl80211: fix ERR_PTR
use on wdev disappearance"), which returns right away when
__nl80211_lock_held_wdev() fails. wireless-next changed the same lines
in commit a357675fd740 ("wifi: cfg80211: enable context analysis") and
still jumps to out_err there. The merge kept the wireless-next version.

That is a double put: the helper has already dropped the wdev reference
by the time it fails, and out_err drops it again.

Just return the error, like the wireless fix does.

Fixes: cf03388aa81e ("Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git")
Link: https://lore.kernel.org/all/avNx0gmZTCIjln1Y@sirena.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Mark, this is against next-20261110. Please fold it into the wireless-next
merge.

Johannes, wireless-next has the same double put on its own until wireless
gets merged into it.

Found by comparing with our llminus-assisted integration tree. Build tested
only.

 net/wireless/nl80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d695040cc85cb..8a5c9dd9d0dba 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -9079,7 +9079,7 @@ static int nl80211_dump_station(struct sk_buff *skb,
 				err = __nl80211_lock_held_wdev(rdev, netns,
 							       wdev);
 				if (err)
-					goto out_err;
+					return err;
 
 				/* try again locked now */
 				locked = true;

base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
-- 
2.53.0

