Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371634302FC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460318; cv=none; b=Wn0Dr2XOgQ4ejyD/SLIL+Sf0cCKQA4wSaVWiiuECZ6MVtC0Q/hU6n74l4gAgC/KHmYSNBKVoGk8bDYOQguUS37+l7oBUTh8GBtvRuzXVgw7Vm1FdBKXJWTt5K+HIgbDBk7yo74AeqzEc6ga9zcFwI3+2QIKE/DK4+u6TcGEBMDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460318; c=relaxed/simple;
	bh=25Cy4hLs//7T7QQPA32J2gRwiv8swJf1KlsN0jWfScs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsz+hdCGtmObWBlpo/AKJvwSIeueh1mbz++6cBzucrtJNOOJ5QeZLkR3S2E70s/4LvAAVkpg7kUosDP44ozD19IeiEWwaUK+4g0u5Oc3TSTT3BSuPhUtvpPmB8T9nLMKhpQsWDnVgcHZ5478Qs+IuTHDcRv8n3Lq6OzNFVUp91c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7vUz9r+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7vUz9r+"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so22473611fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791460315; x=1792065115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YfozA0kOqu0j23n9iWNtMreJdG+KsOuhldDG1WEkjM=;
        b=J7vUz9r+endiGLrt7US8Etgjx80m6jFGyLi2Scs31762cAfnRPu3C+vRTawwhdN97e
         3Cb/XTAqb/bS+XYLQwQJJ2ZRyo0pPIQdutu5UOH71XVzviAgFcyN5jXkDTFyafPeIPfN
         0FA3HfgEkc390cvd8Crl2GYzWt1qdrnkbvJ+vnvV1W4a+4QaTgVTsfMnMB/jvvNhzAh2
         sMQSt+5QDwCIXv9w8vgBqIz9cqjLqNrnnXmyfiivnuvx/71lti8OYIOjJ01p/ycPfqKj
         d52K8w57B2+/XuFmlX68cWyN6jTrIzLcSRC1HN9MifEg7rL+/aKTheYlajcWLI0W2UXX
         UGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460315; x=1792065115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YfozA0kOqu0j23n9iWNtMreJdG+KsOuhldDG1WEkjM=;
        b=FuXUsfRs/W1FjTCwJ54pwnWMxEhsHay/41oxSMJyG1WJjwy2GmBqPUJI3AYH21Nmno
         DT+6ujlD695tWXud0jod3uMW7bAHrXaZiQONa4+jW1yAHsrCBLLYvZaNSpbOu4w0Towh
         YTcq9X2iL4yKvpxlSz9I9dq2bS+vFgK+0m2he+10p0KHJ1dOntmKJwvdbVomYfY4At+g
         uuzF9clwjjICBWxU7MyXVmLaYjJ8TBJSqZ31QUorAxIAABzCI5mr+zt3UXIBfGYjx/ZW
         txv4yqCzC6urDwgaxsJFqgrSNtokWOVTE7uTMNpX8tSfopfGk5Qog478eQojEpf4Ir1S
         KODQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb5ZDCzNe7toA8Ryd+LkjDyflYWUSEYduQj0myZ0a+qwYL4r2jPUsPij4r0Ec9NRvXmdqlZLMH6LRmGic=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqK3OtLNy9gVXLREhCGmRYusB21gqy3PqrxHVSadvRw/lgGdKP
	2WjRYZp7EonkEhFXb8A7MzyhYYY2YzC4++wBV2eWISbbpe7ekxSUIl3x
X-Gm-Gg: AYBFou3uJOEUypBQ6yzyoTZe0FCyamcylb+FSPczdfToEzZ+EL43qw5hBZ0te8uQLTf
	/x9uFRfj5Er7ftvUyPYMSqaFn3Ll7w2uLkmB5Dr+7xpQcP/hiyUrj40tqxjJuzZRvWpkXVB4m8O
	Gf43pDrT7SO1M8wQI8ROojwsiFaDhbLL7NSKe0+A/rt5dnOdo2GT4Li8B9VN3cnrJ4ymcs3yDYd
	BowQAU/+B55TVg5KRCbh2tZQqsQOxHiRleExqI2s4vJ69HF7gU4RsKr5FttYjVdswqHsVrYtJeB
	yQoKfO2+5r2qcbxs3hw3bf7QGQ/Bfgp7CE7piqWlBhngrcEhyLt5lEeMeayO6gRXzXc61mVOQHv
	YT9u9ybO6bsKKsTCvD30w/F+Ay01eOu0XFCVX//v7NnmFxi5LHeUXNq0Y1KQ63zSZgFYTnBno3U
	L95fQf8xLlsPs1YDsuGjfLockrhGrt+CG0DrF1fX4tw3R8KhsVouDETqjYLCWj45zQPoojPMK5f
	bl9RYsy8w==
X-Received: by 2002:a2e:be91:0:b0:3a9:849c:128a with SMTP id 38308e7fff4ca-3a9a2cfcf26mr12750371fa.19.1791460314922;
        Thu, 08 Oct 2026 04:51:54 -0700 (PDT)
Received: from grower.astralinux.ru ([38.74.72.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d3370csm15427281fa.13.2026.10.08.04.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:51:52 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Thomas Pedersen <thomas@cozybit.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	syzbot+63a84ea9c0f57d6133fa@syzkaller.appspotmail.com,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH 5.10/5.15] wifi: mac80211: mesh: release the channel if start fails
Date: Thu,  8 Oct 2026 14:51:40 +0300
Message-ID: <20261008115145.83101-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Johannes Berg <johannes.berg@intel.com>

commit ae97fff6495a8764bc0ef281cfe5444f701e527f upstream.

ieee80211_join_mesh() acquires a channel context and then calls
ieee80211_start_mesh(), which can fail. In that case, the chanctx
isn't released then interface removal will attempt to unassign it
after it's removed from the driver, hitting:

  wlan0: Failed check-sdata-in-driver check, flags: 0x0
  WARNING: net/mac80211/driver-ops.c:366 at drv_unassign_vif_chanctx
   ieee80211_assign_link_chanctx
   __ieee80211_link_release_channel
   ieee80211_link_release_channel
   ieee80211_teardown_sdata
   unregister_netdevice_many_notify
   _cfg80211_unregister_wdev
   ieee80211_remove_interfaces
   ieee80211_unregister_hw
   mac80211_hwsim_del_radio
   hwsim_exit_net

Correctly release the channel on start failures.

Assisted-by: LLM
Reported-by: syzbot+63a84ea9c0f57d6133fa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=63a84ea9c0f57d6133fa
Fixes: 2b5e19677592 ("mac80211: cache mesh beacon")
Link: https://patch.msgid.link/20260908122838.201719-21-johannes@sipsolutions.net
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-98326
 net/mac80211/cfg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index afb1ad3e6ea1..bae9588ea913 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2276,7 +2276,11 @@ static int ieee80211_join_mesh(struct wiphy *wiphy, struct net_device *dev,
 	if (err)
 		return err;
 
-	return ieee80211_start_mesh(sdata);
+	err = ieee80211_start_mesh(sdata);
+	if (err)
+		ieee80211_vif_release_channel(sdata);
+
+	return err;
 }
 
 static int ieee80211_leave_mesh(struct wiphy *wiphy, struct net_device *dev)
-- 
2.43.0
