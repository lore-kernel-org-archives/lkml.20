Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670940;
	b=Tq3yZ4rPomW9cOq6MvWImR8fz2K2FXw1o8AtFv6U8PbZzre/3k7sA3zdaQCZHuhW/FYT
	 HU2D08Xi8SErGhWMC7jIWYHyvb2yOrPxXmGE4g8Ec3i5PZYC4iS5hovu5sUC5+5oFF0R7
	 3z+/CRk7XnlWavqlCULQJ4VPDneJtPkyYMgThxJsakjYI4Oq9qrhQMJsTwv4Un9ZVdXrm
	 3dw99a1FDj0ZX/8q2GF7siJu4ZWC18GgGUBlOM/MWpZYKR+PevQw12xxxihiIND8k2kmo
	 g/vBQWHgz9blDWJYfieyKUTv4KORJbh0T2/dytW9AHQl+eznVyr3ToYCCY3WkzOZbDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D/QDiWJcNeIF083+fu+YVL4kUJSlCNjsA1ag+QXac8Y=;
	b=kWyq05x5abaQGxyj9O4g30md+z3U/P1TlYou68PgyK+CNv4S0sH6eeAjGqbiByRTS7rP
	 Lc/mtq7h1xAKYwhNVnFf0qsID2Mbh8hbssmI6mDuw5CCuCiXC7FJ2inkSlUy51psanCLJ
	 VRJyXAtwuYojM9AXAr/O4WQw3vct/PWjVM2KT4Zw9vAQM65AMrFT4G+xGRa4/q5hJe7Dq
	 xBf4ijnH1JfTgYkTrv/kz5GQ15iyLGGdRGsdNaFo23oXv9KeK/acaa/yX+SFyYo4BxZ0F
	 6ihACKNTidy2YWPy7SYtXH/TrvjxWKW+l9tazAJtq176WzW9uAnZJtZBSyniHWkFKvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IcSdNqlU;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB25D606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB25D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IcSdNqlU
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3712b6d9843so1732503eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670939; x=1795275739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/QDiWJcNeIF083+fu+YVL4kUJSlCNjsA1ag+QXac8Y=;
        b=IcSdNqlUjf0OorbJES0XjlyGT7niWbOtnCZUo8OtZ7MMNlC5PKahUlKpx9dfH+dbO1
         bI5qcsNiDqPqjkf1jreC2o3fRnu9Ml4lfqsl151YLyTpUfS9BePZRolC+1blq1XWe/95
         d52x+e3Nl5M4DmP1ooF4yCxAz7yyEeutCWvlwxqsvc25/f3a8veGdV6oh6o0cutNAA1Z
         uOGw3xpYLHBzAWwrSLo2b9yNKrQcu/5oa7uYMTr+pK0YGMrj43e2SV5fcgsTHGr+cOqU
         jjSdqrbT3cUGOTYxMAx0MjhDMkH49Axzg+xU4gxrgEcHr5P5P3xojYJ6MOCHn36QNvt/
         yceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670939; x=1795275739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/QDiWJcNeIF083+fu+YVL4kUJSlCNjsA1ag+QXac8Y=;
        b=ZFXZ8VVcDxZQ/F5DKITjRfYl54OROEsaI0bT4bp4EU2mjpUHPQsv8gej68O/LoOX3f
         WrJLhh/2awJHT26dxm2crL2GM2H+Xg6yC/ee/ZB0kFeN3l1JKofXslm6morM22xB2cBV
         hwuf7AIRX9gM6zcxiFCG++MhwG4Ay6Xi2KQ3M/9oycfWFo5AgS0G/9RVACzOYxpP49Jw
         k48ngfztFvT6txzHPTaOuaWRnwmV9hwm/ryrleq0o6riSflPs4CorplEeQMk08Li6jGU
         Q46MsyQE/aWr6fY3iBQYtTU3bqTXvORK8Y2WsNkjXsXZvxK9+PK+J0Hr/iZTzePIxH5n
         0TYw==
X-Forwarded-Encrypted: i=1; AL+hErEIPgVMiUDsb/uQimbn+u2o50Uj5S1c1jNgEkpxC1OYJSKVAVs2c428Bhn1SP1NWI+rn1Ntm4f0msgk+YI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DYhnIIh+fK6vQdXE02Nywwpb82qOT06Qzp3h0a0zn/2ki8uSJ
	KSwk5qauPy6pm9ZePrp8SsMArs52H0KdateGnkuQami75jwxyCeLUvZE
X-Gm-Gg: AYBFou2AP+zB0cB5hYgDp4Rwc2+a2GD2XeixbKwQNPRPADs6cd/KB0k2HWxeP8x2TKI
	6lGMvCCZSDBAEflj2NAeFmh8W1+kaUM+01IeVGX+AqkR3FnvccQxlTNjPSIO6xcbx9FMwn0HlxT
	5Oj+kBqL4KCKBEZsG3+Nk9ztTnanbp1ujSU8KOXKPcgGWC8y7KXtdcUSbQXAXDMAuoKdfwlL5LC
	M4zwe1ly0yN9PYwdVp3JogzjUmN2rIBFJy2o14i7ViTwHIQ6Nej6zD+Ga6+i4/QKE8BUeiavRxl
	AlDfMpMoS2eyvpF/sodCIKW5yypX8XXbRRni3bqcFf9JkB9/o/UPGgu8b4kGQH9Rd6f3nBYcWVl
	HKVuwjPs0Q0KwYoxhjbRfK/IDkL/6sFenMT/yRIb1Kzwo3kV7KkIA9IR6MKQV5tYnkoGeVTCjvY
	5dgtYyTTeh0bljDwDUMDXNwE9gBDedo/Sg/4nrxR2nHCUzAuKWp59YOyGJymzYEb/FI7WBeb4sU
	+CvMKX9nJmOO9rEKjUht5ardIJwX81KmiHlmhI7Ey5KVQoNpAXHjeod3yf9fDvStUNm2rZSm2Zz
	pM8q0dRk43pAMVQLjKkETyEySLXiu23GQ6zx9arjWIc1zfJ4k/8iipAhww==
X-Received: by 2002:a05:7301:fa3:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-37967dd733dmr5109847eec.31.1794670938852;
        Sat, 14 Nov 2026 07:42:18 -0800 (PST)
Received: from user.. ([2405:201:c052:b00b:9eff:399:c292:54cc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm18037395eec.13.2026.11.14.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:42:18 -0800 (PST)
From: pavankumaryalagada@gmail.com
To: dsterba@suse.com
Cc: mason@kernel.org,
	fdmanana@suse.com,
	josef@toxicpanda.com,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	quwenruo.btrfs@gmx.com,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com
Subject: [PATCH v2] btrfs: Clean up delayed inode items on transaction abort
Date: Sat, 14 Nov 2026 21:12:07 +0530
Message-ID: <20261114154207.73644-1-pavankumaryalagada@gmail.com>
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

Clean up delayed inode items when the transaction is aborted, even
if btrfs_commit_inode_delayed_inode() returns an error.

Reported-by: syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6af131f2.44d55313.247daf.0001.GAE@google.com/T/
Fixes: 2adc75d61203 ("btrfs: move btrfs_kill_delayed_inode_items into evict")
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v2:
- Add a condition to call btrfs_kill_delayed_inode_items() when the
  transaction is aborted, even if the inode update fails.

v1: https://lore.kernel.org/linux-btrfs/avMkGGHSH2scfa0t@user/T/#t
---
 fs/btrfs/inode.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index abaa33471456..b3a33541b8c8 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -5623,16 +5623,21 @@ void btrfs_evict_inode(struct inode *inode)
 	 * the inode update is released.
 	 */
 	ret = btrfs_commit_inode_delayed_inode(BTRFS_I(inode));
-	if (ret)
-		goto out;
 
 	/*
 	 * This drops any pending insert or delete operations we have for this
 	 * inode.  We could have a delayed dir index deletion queued up, but
 	 * we're removing the inode completely so that'll be taken care of in
 	 * the truncate.
+	 *
+	 * We must also clean up delayed inode items when the transaction is
+	 * aborted.
 	 */
-	btrfs_kill_delayed_inode_items(BTRFS_I(inode));
+	if (!ret || test_bit(BTRFS_FS_STATE_TRANS_ABORTED, &fs_info->fs_state))
+		btrfs_kill_delayed_inode_items(BTRFS_I(inode));
+
+	if (ret)
+		goto out;
 
 	btrfs_init_metadata_block_rsv(fs_info, &rsv, BTRFS_BLOCK_RSV_TEMP);
 	rsv.size = btrfs_calc_metadata_size(fs_info, 1);
-- 
2.43.0

