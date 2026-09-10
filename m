Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC930D3ED
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013461; cv=none; b=sT2dtxcKHUaHxPkNkry6qse4t0XwMMjNA1oZjLBORXewRz6iYC0q1bPsNjom8hHG26XT8aCDCQCe4MX5u39kYbtbuOJ46veZpR9EaJH0l184hxLBiSRNwe7gbGnv4dbCYMsCR3eb6D/TRCzG6RHS8KdTm6spDa8Qg3mwSQIl0G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013461; c=relaxed/simple;
	bh=VBRMGDnmTSoBVAayF4EJRhtYQQ+ry7lr4E1+xx5Eja8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L9Ho9yCPbqIGezQ8V+3DEoza1h0AA4GKl4GRxOBis34jJoa3qnc1vOiHo5x0ILtZHHHXpJtkrTDLpI7yswETM19Zf9BpovnHPdjMHsvnC+0g63wtK1niZn2nFcN+jk7qrG/MGpgOma6lXuX92nkKENiyqGbfySaUu+3ytIdp7/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPlmY8+A; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPlmY8+A"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db18e5cb56so66475115ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789013455; x=1789618255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cFzG545OB84YQ9peVUsBUfgFXji1m++Ini1JNnUg6R8=;
        b=YPlmY8+ASz0JGYPLS4Et91RzYmWDa0yn59n0tNEyjYa/kUKSVysvSUGZMQRssIXQqr
         klZ78DneUR9kq8rcwosahdk+rWi81E4PCgzTsjh4n7HvAwQN2fn23hJxnAleUgIS/bvG
         pzlxN5btWvOiYRB3CXVFY/RV6pYBPAATlrGum/QNohpqJnBHfhKNjyPT1aEg5OxfjT+I
         UnZwMEkz6y9kX6R62AGXVEVch3AT2hxYtfWcsV/B0oMIYAMhMla3oIJP/HJzZiHFf4Li
         Rd+26vd8VNoUZBtPmEPwrkBUXDfp7brX2we7E13KSVBEKXz7tzu+Ad1NUpXLytjNr6lt
         tkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013455; x=1789618255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFzG545OB84YQ9peVUsBUfgFXji1m++Ini1JNnUg6R8=;
        b=pPCK4WxonG8LDAqitci+S4ZZSbjz2wzYSGG95Odn6U7VMbu+lwxgfRlD0XsGbTfWjq
         Y19NMnEM2LMeybL18iE0f5u4G87v5E2BXulFbZCg+UWxR5Btd4qd2RnOx4GhbHSK68KH
         Fl9HlC3GM3TxcwwF7wm5vf2ncKkZ/HzKaOxCJXMNYjeT4xuvG0oo/MKE3OFKDKgPFmSm
         eCrEWDzTDK+sqpChI/T2i1/bL6MtcFWrgR3BdmxZnDPuiCdbojUWeVVuW/5PCMvvHPp3
         hHE2IrAcwqK8xixme0XgoBxjVaJHV9tsSgo8TbxQQBvZS50WOwiagzLFXjPQH+Lyz1k5
         n4pQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6/mJew9cK2bl1HGKLId/fZvtCJa0a83nBVnrMX721jrjNtcR1r7yzPZkLk5Yd8ZQLiQqoizLVSmOhm8I=@vger.kernel.org
X-Gm-Message-State: AFuF++kNrpPT9MJpKltt9Rs9zLeUcQKQuL6XuKX9z8KXupbUml1VJCyH
	6ePCO78Um1F0oKnlCpvGh+Op70ObI8zdHPYjt98MXCjJ3ABzAjt5lZtO
X-Gm-Gg: AYBFou1yQz8FEuiFNsxe9jTII2iF++4JyfwQL6XdtyzlOEd/FSkKisyGjEsUBXAaGPI
	vMV8cfZz9iCYFaXffWO+sKd9w+ZUats1LioWMmyn4sPcviZSJ+jGHdR6Mo4CCygx57V6XyLmoVl
	wA4j+EmVVqhlAE15rRLnePGDBDBH3EqsINavC/bepPYh9GjMfc9oG6OMNLZZOZCDT1d5v/zNudB
	pL8HfLs7/d3nLho2HI64W5fK8SbmWdeHYw6j5QPZt5+rU0dHrjy62GOUO8eaU8/Wl02FdI5S5Zf
	0vwmUVXyZj877JJ7XJneeyvzSQxY/+6HnaAcZkQTcwP5MTa2G7iDBBS6zXR1J3cBVJOS6AzC5jI
	vI4qkjvrDmMdVGATU1Gl6iyoEYkU3mvkDGM6F+/uuuMRdKeduPwN9t63ajDZxSaEmiKS1N3nocn
	SfAwvVTSN+S+a1aoRswNOn3jwiD19UVggalv9eo/9zHPCbJUGDmmhdiLrzqjj1ahIRzhAoHx0sE
	fHXV3RKaTjSW0KSP5k24RNQ63kv8IpyjA==
X-Received: by 2002:a17:903:284:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2db125ca396mr552411175ad.5.1789013454662;
        Wed, 09 Sep 2026 21:10:54 -0700 (PDT)
Received: from deepanshu.. ([2405:201:682f:383f:19a1:b573:237:5f99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c2850sm82946945ad.62.2026.09.09.21.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:10:53 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+d979bd35c8a76fd1b6f5@syzkaller.appspotmail.com
Subject: [PATCH] mac80211: fix using smp_processor_id() in preemptible code in ieee80211_tx_control_port()
Date: Thu, 10 Sep 2026 09:40:47 +0530
Message-Id: <20260910041047.24437-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ieee80211_tx_control_port() can be called from nl80211_tx_control_port()
in normal process context via netlink sendmsg(), where BH/preemption
is not disabled. dev_sw_netstats_tx_add() uses this_cpu_ptr() internally,
which requires preemption to be disabled, triggering a
"BUG: using smp_processor_id() in preemptible code" warning.

Fix this by moving the local_bh_disable()/local_bh_enable() section to
also cover dev_sw_netstats_tx_add() and ieee80211_tpt_led_trig_tx().

Fixes: d5a014204a3b ("wifi: mac80211: tx: simplify control port frame transmission")
Reported-by: syzbot+d979bd35c8a76fd1b6f5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d979bd35c8a76fd1b6f5
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 net/mac80211/tx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 74ab27534076..7b1a3c63e5dc 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -6687,10 +6687,9 @@ int ieee80211_tx_control_port(struct wiphy *wiphy, struct net_device *dev,
 		return -EINVAL;
 	}
 
+	local_bh_disable();
 	dev_sw_netstats_tx_add(dev, 1, skb->len);
 	ieee80211_tpt_led_trig_tx(local, skb->len);
-
-	local_bh_disable();
 	ieee80211_xmit(sdata, sta, skb);
 	local_bh_enable();
 	rcu_read_unlock();
-- 
2.34.1

