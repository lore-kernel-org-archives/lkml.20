Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3741B8CD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341235; cv=none; b=GUw+Lfz4LdxjlVQd6owLZqRaL8iukvVAbZ2E48Pq7sdUTu//P/2T6QgrQ//d8cFu3Obeurdx58Mr9KQMAs9T0m6MzofCqeH0cxD4QeA4KS8BPtlireC6eTSGk98Nut5zOGdmhateBXJE5P2/Rbav4GWDcc+K/ruBshKh49phtyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341235; c=relaxed/simple;
	bh=sXEVcnFq9jrgPve1Gy0ZcXcOTCTbTRh+HJbF7WchWJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtDXOnLSdP/IVc5PekpLQX9M2eJgI7quPfS2AyXkULZQXfaHyW0owIiXg/6M38/DKx1LNzo+jEDFxNfl0/kNTUFQtpsWUllfXblXwZ6CTKOx0K/hhoyFOehurDWOm+0cQveX+l8KiF6Tf35kxCfOJwIGk+fkhUoHmwCU1qgR8f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QILU2bob; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QILU2bob"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso859389b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788341230; x=1788946030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIbsbl7gfwlrb28FLNmpnU53Y/rL9tIcDN9wH1WM7zM=;
        b=QILU2bobtwQ9ai0rHjXXg/ikIIg4hspoKtrbWcZHF/k8kaFgwSDa8mwK7+2fk7v19E
         Wd4BBKkuWXdVoLmX4UpIHh0ZOsSLAIoq2DxsfKiHwgj8NY7klPq1PwR50+oe5CRxSWug
         vCVRNjZxnhIGnWqxSttHzpWKrKiTn1CqII55oQrGtBY5M0SLBAxCq5vVCll41y2GTOz9
         7iuI27iLkPoVuWAFornQRgcJTOdZYVjadUxhmb4+DiTO8lH9RuQwKRTq7QkhPgterT9+
         cVkAq5YpJ+wQpL2QtLOIRCb9ru1NiiVRUeqHFqMo7r/axMPaN7F64vK16/AY/MbfQ3Sv
         bKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341230; x=1788946030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIbsbl7gfwlrb28FLNmpnU53Y/rL9tIcDN9wH1WM7zM=;
        b=r4TYTVuwb2oOVYo+MVDsHsGfbsKCfrINU0nygAVlQyXc/w5/Syf5VCTZL0vlW2UzDv
         P9vOrb0vMT//Vs/y/IDGCR5/xdE8B8zarPLivWhcgYvwe07dlJw/eLmI6E7Z8JaMhr+N
         cx7nHtNUZ1rmIBBmde5aRtFoUJjL11TYFid/JAoPmIb3n+emzD22cxXmqNh/97UZHk26
         dIJvh5TJjau3vpTYeTAhDvyVrJLq4o0ZP+9aphBEJxntWHxXbVKk3YtK3rYDVL3dVe4n
         WzVEATB3kPBndnoV1nmuAQHJpkpqkH8oZ3Ich0NVYcmrZlavmh3JyjZpfjKq2SqLSU4f
         8sGg==
X-Forwarded-Encrypted: i=1; AKwUvBz3w2cX5inKyZp7LyY14JMdKB/wwjJQn/HxOmP9BuMNC/z9fNTd16wttPMlLJlWMADV+DiL8EPVPM+/15E=@vger.kernel.org
X-Gm-Message-State: AFuF++nMfmRThgW0rjLtKrTCgv79HrcAMQDWp5+wOqie1QluJRHvjnGU
	l3oYtZiY6dpGVCB3cPhlAeXiCC8Ayd0x3Xq0ejH6t1mw3AlrXI2XHMAM
X-Gm-Gg: AYBFou1vxigYgRZwdFheg5HHZlmQ911QUTfBG7fnlCxe9+nFQdUqHYE7A4LNmDRWmgG
	0To5k8usU2B4XXPnHda2CCzzuNaqbbWfLIX1g50CSvT2KAxBItZYuZpIYOqaNWTAFshNWGh+KCS
	3ATxbq31KicJwj+s3O1Zd5V4GLxg52OcUgU9rNr8GSRd0tPaCoWGovz+ZCE4Bi2fXVOc26YCbmk
	p6oahhEZy42dRuHsYPb6xNDhXj3IbuzmKK1HIksnmeDRbgA+EcJKA1YKp0XnIP3X6L87Ki1bwD6
	rUqkIzfRNIp63a4QmaF+F+as2SQnkd+NawQP672WIeCfqWPWoNhyVTc0Qd53gKjby7bJE9n1uJL
	YWEen3cSsOANSTJ4x3oOadNrenIIR4c5QGo9+e1LWxN5tF11Z/TJd4VsFvXOA1w72xgLLIlMwwK
	SUud13A6QAg/mEAMhDhwWmD5B3XjwYalvo82eTrNsMqCzehvkjrLpoIY1sutnXaUr1LEKoyQeoR
	rHR3G4OlM4TXb30YdGG
X-Received: by 2002:a05:6a00:8d8c:b0:851:c1f6:948 with SMTP id d2e1a72fcca58-85f448cef3bmr1497817b3a.16.1788341230276;
        Wed, 02 Sep 2026 02:27:10 -0700 (PDT)
Received: from 192.168.50.3 ([183.193.115.0])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-85dc11fae83sm1055963b3a.59.2026.09.02.02.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:27:09 -0700 (PDT)
Sender: Weiming Shi <thebestswings@gmail.com>
From: Weiming Shi <bestswngs@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Eliad Peller <eliad@wizery.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Ilan Peer <ilan.peer@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+36935f8953d6874a@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: mac80211: preserve RCU links during batch key removal
Date: Wed,  2 Sep 2026 17:26:57 +0800
Message-ID: <20260902092658.792735-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

list_del_rcu() deliberately leaves the removed key list node intact so
that concurrent ieee80211_iter_keys_rcu() readers can advance to the next
key. The batch removal paths immediately reuse that same node for a
private free list, overwriting its next pointer before synchronize_net().

Add a separate list node for batched key destruction and use it in all
existing batch removal paths. This preserves the RCU list links until the
grace period completes.

Fixes: ef044763a3ca ("mac80211: add atomic uploaded keys iterator")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 net/mac80211/key.c | 8 ++++----
 net/mac80211/key.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/key.c b/net/mac80211/key.c
index f45e792abede..a69617d8d1c7 100644
--- a/net/mac80211/key.c
+++ b/net/mac80211/key.c
@@ -1100,7 +1100,7 @@ static void ieee80211_free_keys_iface(struct ieee80211_sub_if_data *sdata,
 		ieee80211_key_replace(key->sdata, NULL, key->sta,
 				      key->conf.flags & IEEE80211_KEY_FLAG_PAIRWISE,
 				      key, NULL);
-		list_add_tail(&key->list, keys);
+		list_add_tail(&key->free_list, keys);
 	}
 
 	ieee80211_debugfs_key_update_default(sdata);
@@ -1121,7 +1121,7 @@ void ieee80211_remove_link_keys(struct ieee80211_link_data *link,
 		ieee80211_key_replace(key->sdata, link, key->sta,
 				      key->conf.flags & IEEE80211_KEY_FLAG_PAIRWISE,
 				      key, NULL);
-		list_add_tail(&key->list, keys);
+		list_add_tail(&key->free_list, keys);
 	}
 }
 
@@ -1132,7 +1132,7 @@ void ieee80211_free_key_list(struct ieee80211_local *local,
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
-	list_for_each_entry_safe(key, tmp, keys, list)
+	list_for_each_entry_safe(key, tmp, keys, free_list)
 		__ieee80211_key_destroy(key, false);
 }
 
@@ -1159,7 +1159,7 @@ void ieee80211_free_keys(struct ieee80211_sub_if_data *sdata,
 
 	if (!list_empty(&keys) || force_synchronize)
 		synchronize_net();
-	list_for_each_entry_safe(key, tmp, &keys, list)
+	list_for_each_entry_safe(key, tmp, &keys, free_list)
 		__ieee80211_key_destroy(key, false);
 
 	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN) {
diff --git a/net/mac80211/key.h b/net/mac80211/key.h
index 826e4e9387c5..f5a97213a559 100644
--- a/net/mac80211/key.h
+++ b/net/mac80211/key.h
@@ -63,6 +63,8 @@ struct ieee80211_key {
 
 	/* for sdata list */
 	struct list_head list;
+	/* for temporary lists during batch removal */
+	struct list_head free_list;
 
 	/* protected by key mutex */
 	unsigned int flags;
-- 
2.55.0

