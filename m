Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256165;
	b=ZX6tjmSzwbSBBIYrFGeDo9qGf/gkNZX4n+32krOXt0501YVRCWPWRHe5Y9eSYcFroptB
	 Jzxa190I9s/Um1WYHHximqOsKtBwEEYeui/yiW2yU+Q8f3Rom0yBHKhrcx3sbso/3ZILA
	 5yjcjUWY72HtwVukNXWIGIj//GD4A6GoEMgeYITAk+w7TmCFXq0JcvBv9gZaoqNp7p9J1
	 HNMQ4jUyIM77Mws+WJN1EsXmCwdT5Vn+WwZ+LMDfKE7bKM+mmLwnYfbw63asjW1SMXhD4
	 lvF0SefJFye9TumKyuHRaf65QkRS/L2t6vse4TmJPHAiba5Jds3F/xs9PeE4U+F5Iag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q9kT3fz3vzDuXqjcm0DKy/dEcUDkUtFVvLm4k11ssrI=;
	b=FcMoD6mNe77QzXN393dCW283xoAhcn6lB3s/tWoLDrGg33Odj/s1J7nxHRWwFFswvUk+
	 ydQiUIjE5sLeidtMgr2yMGmxlXsBnaXsMemhVMX9Xsw1cNqfq4lPMCb8S/RxhAgFXY1O4
	 bSX1YfEob0L91PnBkjEtQUUjq/5goZRZQevlFsN5RAWU+HArGfBflswF7FwWhlWZHCoLT
	 i8jEmIpOJgHd5E+tgOnyV3G4J1OYHJK03P8196Lg4XlAjl4RPnnSaPvHl+pL4BtmToFX+
	 +wHUqcU7D4c+ZPqDSXi/AquzAmSiMWVG9a/se1aT0Nyhu5PlrHGJ1PvhCXZLpESriDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d6cJ/SBd";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8360A2608
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A8360A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6cJ/SBd
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37071c0f42aso2412694eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794256163; x=1794860963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q9kT3fz3vzDuXqjcm0DKy/dEcUDkUtFVvLm4k11ssrI=;
        b=d6cJ/SBdX6/ehEp7fUvEZQHyH4npkIz/bk620SpXxhNeU4ycWM9MQ7rBM67z/By/Dy
         un2hBXuepA6rMAHdc5OXzIoutG2ABVr2M0UXeyOLKYsb6+N853l5qDZNMGXEzRNGoU8J
         /bdTYVTfKBBdFMa994el7JpOeeOhWsFBxd+Tna7800XYUgbuwpbSrQbAPZSuZxEN0u5w
         K0DT3JvVtGACO0jis1Ga0DQWyndLoVZANqJ5fpDcFQoJeciCN5Z2aeY7E4or6k/jm3wv
         zl9ZGBtWgVFtiNAuaDGxy1buvoon0G/2JKuFxYEbBnJlSFjEPOv6ny1uzT9KEnS1gZR4
         ZT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794256163; x=1794860963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9kT3fz3vzDuXqjcm0DKy/dEcUDkUtFVvLm4k11ssrI=;
        b=rOhLzNzAuezK2T+4ycqg9D4NPssREiLkBxvo34RVxsqceKH41+3elswKSiT0tk0uQH
         qJJn1Ot+ias0Vnm6F3SCfKMlq+1DLc/AQGPhy1hC+q7KB63F4XwaAZBNnad41WoaunrB
         DTowVHjKwD2MuhQwllB7nSm6sw0XeoTS42rQi65bY67Qhi9S6xoLF5Gh9BEuO5avi5tg
         gB7d+Ebw5teImI4iqVSQcll8A7GH99mC/LfXjDR1IyX8e5Cn0JdHsObGOpnBDDHy1R3p
         9/fsuDXXDPcP8//SA0dJ2aCuraxm92f5jD11zaFC0a91QV/myIWuteP+GRzFWC4c01pL
         hJ/w==
X-Forwarded-Encrypted: i=1; AL+hErFBpkEIVs0U0SUgWM0jviPGOo1PnwqOTNCcw7l0dZtHPGo9mXo//dB1vP+N5q577vo/3cehS9/8L+vCMJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z81iSy8iATI+YbplAD4zozgvLlXyTOzAXssLAql1KNgaufQCLjz
	c+no5Och/ZtOsDd7qEvK4BoTArIDZ/Q6hA1z/JhmJoroe2SheWLGyOfd
X-Gm-Gg: AYBFou2ecLh1CtJ50BQzLki1slwjhWDK9PjCldKczJHL2ZY4qVIBJgjEYwV5V2dBjVk
	SFeXWWBk2ubbBz8w/EtqiBpmhAp7kOv7k5WKaQJ6rQn89C7ysQT4E/gIrf0TNNfOmGSqhu4Q7kO
	gAVHgq9i3NN6sywDHnnilNzOZ4k2aXlcQARvRcdu4N8YMewFyYqJXtyBh71z3t07dod1rM4sYzi
	F14KNiIkVRDU6UO7wVg9vl3G02oMRHNwmoaQXEO9kmqtDjurCpydp1d/1JM0/S+zWzvDDIZszET
	W9jFg8rhe8N7pNiexdeO1MMzyPfsZMP9mEq156f2C2fxemqoqK0s6KmOt0SWYrZefQoKIDl8vMC
	u4aOGovTcj9mhG3dJ8SKlrMA6uJi+Ds0So0KpqrQfmRjQvEvq36O3jzjrJgqCIz3WJmteXDwFKA
	4ym18+871JFsZE1CoIJI1lN0YDP8F8ZM1zDnCw9i+uu3+uvL++f2/djDunWyb7u4DcZKs8Su6z/
	8PcQNdhZxBDHxde9QpccIrXqHtb4UIyZejDlAWd6S4A7/MQmoBusrfxFhenO1WYP4HKPAPgN7O2
	9+AGJCXYX6AE2Xc3pwHkG34P4LgQl/dDRUDG
X-Received: by 2002:a05:693c:8845:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3751fe3228cmr430632eec.32.1794256163417;
        Mon, 09 Nov 2026 12:29:23 -0800 (PST)
Received: from user.. ([2405:201:c052:b00b:fe08:4a28:dbaf:f2aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm703045eec.8.2026.11.09.12.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:29:22 -0800 (PST)
From: pavankumaryalagada@gmail.com
To: dsterba@suse.com
Cc: mason@kernel.org,
	fdmanana@suse.com,
	josef@toxicpanda.com,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com
Subject: [PATCH] btrfs: Clean up delayed inode items on transaction abort
Date: Tue, 10 Nov 2026 01:59:14 +0530
Message-ID: <20261109202914.64371-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

When a transaction is aborted, btrfs_commit_inode_delayed_inode()
fails because btrfs_join_transaction() returns an error. This makes
btrfs_evict_inode() skip btrfs_kill_delayed_inode_items(), leaving
pending items in the delayed node.

Move the error check after btrfs_kill_delayed_inode_items() to
ensure pending items are removed when the transaction is aborted.

Reported-by: syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6af131f2.44d55313.247daf.0001.GAE@google.com/T/
Fixes: 2adc75d61203 ("btrfs: move btrfs_kill_delayed_inode_items into evict")
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 fs/btrfs/inode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index abaa33471456..397aa64b4816 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -5623,8 +5623,6 @@ void btrfs_evict_inode(struct inode *inode)
 	 * the inode update is released.
 	 */
 	ret = btrfs_commit_inode_delayed_inode(BTRFS_I(inode));
-	if (ret)
-		goto out;
 
 	/*
 	 * This drops any pending insert or delete operations we have for this
@@ -5634,6 +5632,9 @@ void btrfs_evict_inode(struct inode *inode)
 	 */
 	btrfs_kill_delayed_inode_items(BTRFS_I(inode));
 
+	if (ret)
+		goto out;
+
 	btrfs_init_metadata_block_rsv(fs_info, &rsv, BTRFS_BLOCK_RSV_TEMP);
 	rsv.size = btrfs_calc_metadata_size(fs_info, 1);
 	rsv.failfast = true;
-- 
2.43.0

