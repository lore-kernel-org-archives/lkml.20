Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF1284690
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787998548; cv=none; b=aJzRqBdDeqy5EJwgLSxbdhGoCxt1718/oHGIowBvEm8tuRZbrIG4BYueEwR5lpEMgjHPlgRxbaMIKk6+micRje2yQe8Do4+2kzdxCQ1oks+bPFbUSZd5MAJ6BirB4TroJEakagqHQiT0VBf5JJ5QkfbdcRDpLwMNwSU/m2Fu1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787998548; c=relaxed/simple;
	bh=KAZpAufm9mY4Vi7JaMtV/dylFfUr1203jvM1ywXIWX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f3T1NwYB5u7JmgNM0QYbIOYfFrhMv5mKD9cSgzR+zPh3FRQxn2eAAtSKanDqJ9m8ow7xyOhtJhvZ6DnAeR/QEeYLHYnozM5JDsDmsBKqicBMDCrEb+TioW9+mU0Y6X/eIL9PyV5nYHvmQeXtwqSxYZF3Ce5napYgLfvH/8HF+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPPojqJZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPPojqJZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso18326925e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787998545; x=1788603345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7EdZa0g63zlpWXBiLsDvt8kChhkbnx7osFInxK6j0I0=;
        b=MPPojqJZysp4cM3WfSCRNLKhKlpmekp6eL8W5R9bJ4M8H8EYrMNBLkzr85OPukdumW
         OLRkWuIi8q06H5ft0xiCU/aatfulPD4PoEelxuCD4OP2OmOvHYj9jwsPd2Fxm1I341ns
         cEALyqHhFueFClG2Vz87ULz9e0EtXR69Unvw1JPjGmkz4XUVtMOWrDRO1KOdcdDaIWRL
         /1E5/wi8PaLyH+R6uH64qVWFeJGpp8uMU6sDrOo/QVhggsCJLq7Ldx2r4TGQ7dd8N05p
         MdzLbEB86z796egt5mMKhDRaLit17dNqn1XXKhKYlhWDovagzMI7p75CuslVOlGgeQhJ
         xWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787998545; x=1788603345;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7EdZa0g63zlpWXBiLsDvt8kChhkbnx7osFInxK6j0I0=;
        b=GkzqAOphClqIgbQp+tcgEdGVWMTecvmCURdMq1f+EpGZYjR8Rx6Swr4k1jUr7r0iAu
         r9xbNGCtagaIwNKcJfWNmgzmy2EedeKspmEaVUViMEMacKiXSrgRxRxOW83XYosK4zXM
         Vrn3iIFYzxQmekpht8TjFLJmHFBqLeeqyp+KOStDtQVcA57SmlZud4EX33O06/1LEiPY
         QU8yqAKIYTBPvUAmRu7IFWtsVCuw788HTU9hpAmZtzPMkseVF1Ye1pR+I8x+CVaSpUzk
         JyZs00LJ8t8FqlV7FSnKjG0ipjD0slRUfwBoGRM4zBQxnd2z/hG0p9J/oOjJbMkz1EkU
         /jVQ==
X-Gm-Message-State: AFuF++mFAP3KP8m/smpCKA8GN1QLFLWdiWGY1SP65pyJmQ4WHYXiE73b
	Muu4/KzVBWr5M3cZAL/5bBmHWSwq2oyAB2iOSCgq61YC/ZL5mtxCeLTpzuXQ
X-Gm-Gg: AR+sD1002KVnjtl9Rsp/mjSeM9TloJGwPosasP632sh/eDCF2pTrGquCZNXK2mhMeQ2
	+rqPlPoI8g6yUjBUxnlx8E2FCVxkL2uQpwJa/ixQq7UazKDW02fw39k1TTv4gIbyKh1RgT5MAtX
	e5dW0InOKkpuYHktOp0pPu3RbSef5V1dqD9S1ZNXRQRnKLqWbAgHlAHTEu9TbWc1sfTnsnIpdUT
	utkD6GZS8ekuIAVNBiLuSa08iO6h+cR+9bGv/siyAu6JujLQrszIMDw8Rdy9XUG7CkLk8rd1dCq
	LCj3xmk9tvAquKv29Jbuyq+I1SDpXj8tlKamGeQj+RIuzASZuoezf8Ke30WojlfkjNnw05xCwLQ
	my/pPoWTlJnV6V/jhEU/LNQUqDzxIdbDhPoPWDWNvF2vyBOBoq4cRbjxGV60jcWzVfxb4XVny9H
	2G6A1azt4yxb4GTi4eLdF+MUSGsf8Kzr0Lkt4F/usUqSTjKMyYtaYcNdaNOE8PkspuzHlciGnHN
	gZHTKe5u8xpHhIMQq32q4lJRupqc4A6yj2sqAKwxXcSoLsJxAUxQiMXPk4qk+cE0+uF9LzXSybo
	GR+f
X-Received: by 2002:a05:600c:8b35:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-49b91c3b71dmr194656745e9.11.1787998544573;
        Sat, 29 Aug 2026 03:15:44 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm166010555e9.12.2026.08.29.03.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 03:15:44 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mac80211: skip reconfiguration when the last emulated chanctx goes
Date: Sat, 29 Aug 2026 13:15:32 +0300
Message-ID: <20260829101532.1471682-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drivers without native channel contexts get the emulated ops, and
ieee80211_emulate_remove_chanctx() reconfigures the hardware with no
context left, which ieee80211_calc_hw_conf_chan() turns into a channel
change to the default channel. A monitor-mode retune releases its
context before using the next one, so every retune costs the driver two
channel changes: one to the default channel and one to the channel that
was asked for. Nothing is on the air without a context and the next
context sets the channel, so drop that reconfiguration; the radar flag
is still cleared for the next configuration to carry.

On an AR9271 (ath9k_htc), where every channel change is a full reset
over USB, hopping across the 13 standard 2.4 GHz channels with an
unmodified driver showed 2006 drv_config CHANGE_CHANNEL calls for 1000
hops with the reconfiguration and 1006 without, a median hop of 123.5 ms
against 92.0 ms (p95 183 ms against 105 ms), and 99.1% against 98.3% of
injected frames delivered on a second card.

Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 net/mac80211/main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index a59837b9f480..b3f9b3bc3cac 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -289,9 +289,14 @@ void ieee80211_emulate_remove_chanctx(struct ieee80211_hw *hw,
 {
 	struct ieee80211_local *local = hw_to_local(hw);
 
+	/*
+	 * With no context left there is nothing to configure: nothing is on
+	 * the air, and the next context sets the channel. Parking the radio
+	 * on the default channel here only to move it again when the next
+	 * context is added costs drivers without native channel contexts a
+	 * full channel change per retune.
+	 */
 	local->hw.conf.radar_enabled = false;
-
-	_ieee80211_hw_conf_chan(local, NULL);
 }
 EXPORT_SYMBOL(ieee80211_emulate_remove_chanctx);
 

base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.55.0

