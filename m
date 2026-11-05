Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915264;
	b=HSuGfKihlLXRnmBBrr01OUICMR3jTffI1HdwhFFdj855LuLB6iinZ1YOQZOu1NVLUgC4
	 IPZXqF0Ag+dDvI0E7Z1rl8ny/pJDAqS1H82HEiAskkCs5Z5weVyVOmFFFDUNBdFJ/5Ygd
	 sroj4UooPQgn/uanKwZPy7Icy1kw3O81BVxGC0t3KQ0kClxdWORa0Lzw/t1MMPywhbCDg
	 0MsCKCejH36GRwByedJGf80V2w82+7JwyeoIQuCu8nEuYZJzi0+UjHOitHgqnl8gPYrh1
	 vJHA609ec5WWL9x+qLO5a/aN/qCw0p/IHf0ZupAnnG0mZ2opaTo13MXtLVNRZD42ogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+K9CkvCA3OlKWwDUexCGkgRgdQU4VGZAviFEBkAbsLE=;
	b=hiGIP5/AgVVhmv7ob3tqX8FQalhYcVPJA8dUGUtsgaQImZY7D6xbDFDFZ66FBPIkfRuj
	 DaSwSVQdEOnT0dzEQpNQJVEEaWjc4Ckzoirphwa7LazQbKm75AymxUVKUkO6YZhLJqRxp
	 yygx70Y7J5VDOXB2ozt8tgRHAstceUdLUGpbfmsefipnt0pfU55/1UpCZR/Ew0VVDmjFm
	 F2NXMJgxAUUQIB6cpVOu7/m87hnOmQeoZKogfUIkCH8AROQfkC+rRnwgyb/7ZpVgGaRFX
	 r9ECqrBh3ydGk99qcD5ZAE/ZSH6cZuwT8Auqv7pB5XRZX86Ob2m4kNV8wa/pky/yLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b="Z9a1I/jm";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C856606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C856606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=Z9a1I/jm
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1452949eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793915263; x=1794520063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+K9CkvCA3OlKWwDUexCGkgRgdQU4VGZAviFEBkAbsLE=;
        b=Z9a1I/jmFxNeUeUMG5LUHf/SWNFUaPxyJpqZGpvhk0TR5g3UJxn35EnGJaVT9sbauG
         2bMbPnmCUqUZM7T8IICk1hMr2xn/Cgabulq89zLANoNiM48w01W0pk1kWYX6p2iwB0bS
         uVNrPvPXYdMeqvqnXrn2DpjfTIFyX+CfanC0djo7yHmMnD0unVt1fjMJDokKHHJV9nHS
         aLHs5rEtcO0GeUWXRgon0hfoxXO7mGtsIB7d5Nw5jfrX9oHHL2koD9v/3i6VpHqzPznG
         0WCAJkjrqegQmmruJSMAgxzLp7KPZsmYfcYY/IPsoFusGhcvYoGsVD5uwxvPNSIA86oD
         VEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915263; x=1794520063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+K9CkvCA3OlKWwDUexCGkgRgdQU4VGZAviFEBkAbsLE=;
        b=oRbaOdMvPPJZ/CtJtCVj1ktASJhlT6hrLbFAv5wROc3upld5O2tcgZhAGqoA+hgOXO
         raovFYd9DnvGumtfLa6GPj+h7Xn8u+oY13Tq18dOMcwrA4LiYxMDkj8SqoK9DEZ6Vaif
         AZ13OUfWEkPKGyuw5v03XAcdABvGcCsdxhLPPGvOTVNmeibKGX3kz0anECfvhnjBPXLc
         Jpdx07Ozo1AGuCHHCI16b4V2A9hCgSPk9IDyQeyYTazAe3J78Ks2sz54tlMMBnEZLrMg
         t+hAI6KQwzylMjRG2ym05BWryojNg31RlpT8aCd8QLQUh1iQMDKSQOpaUZfmK9C7ts6y
         Hcug==
X-Forwarded-Encrypted: i=1; AKwUvByTDqsha2A7pDlqjJbKyZPm81SSUm3YtZQn0/17gFtF0dYbfoex2m3Aa8NaHxHGdEHwhoEXn1BAjFo9XDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KVWMhSXN47QpWSLiErWfKlDWHAhNysy0lwb0AvkTvBJyObWlU
	lRz58NhgCUaaEtg82kU532D7mHBwbB3JYLda589lLd7kWO5Mh0Paq+/z2nqpWv6N7Q==
X-Gm-Gg: AYBFou3B3HS3vF7q6kkSacTr6jmEvbAZHWt7LqFvUeevR+PdCScgZ2BWMaJUKVOOSkW
	4VFsvYCOblLVS+nlcdU2OJqFWpZSy//iF/VpF09XCB7/sCnzhvOjyUX55Jur8R79Pqx6b4bG4i3
	3NgnFKM2RY7D8xbemg+r542/GA/R3ywkQQNijtJ+duH6bTdoJ81rjAfbBlATTFy5UpCs/Fs+H/q
	0PmWtilvo1sqJO6Cm84mqZiSdJV2h0Y94X+4KaQOJlKCvzzPJ8Q8kSjLM3EzsSA/zjb+1s4rMRK
	fWWfT91JT3KZnbs6q9TS5+PSGBsVxtciw0WsyNvSNeEdQxgEgcMxUfXi1f8oe5aw3KS+aZIiYwV
	qKH9imUBgLJyVvWVU/C95CEq4OiR8eRnGuPMjIMmVQwsY8/OP9nZTJ3nypJHdmNHRIDMuKJ3/IT
	8hyY5g2bTXB1ux13f0Tg55Achiuk2+i/F/dFApsq9+SK0eEEyTAryJBkqdc5kpvZkoPPZVoMtdl
	b0bCLo3ZXZkNdSv+SQiRReBCy55bO1N5BH0oWWhlEg2kY4UUE4AAlXiwusRXNwpb6LQROgsYqgU
	gSafXb+AZGoPoCtEvqMyvx31PEWlkOOkBtYE
X-Received: by 2002:a05:7300:f195:b0:369:f420:8679 with SMTP id 5a478bee46e88-36f784c065cmr803770eec.38.1793915263163;
        Thu, 05 Nov 2026 13:47:43 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25c1asm2036943eec.27.2026.11.05.13.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:47:42 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: mason@kernel.org,
	josef@toxicpanda.com,
	wqu@suse.com,
	fdmanana@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>,
	syzbot+dc9291cf132691aeb478@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH 1/2] btrfs: overwrite a leftover balance item instead of BUG_ON()
Date: Thu,  5 Nov 2026 14:47:37 -0700
Message-ID: <20261105214738.111967-2-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105214738.111967-1-smish149@asu.edu>
References: <20261105214738.111967-1-smish149@asu.edu>
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

[BUG]
A balance ioctl can hit this BUG_ON():

  kernel BUG at fs/btrfs/volumes.c:5088!
  Oops: invalid opcode: 0000 [#1] SMP NOPTI
  RIP: 0010:btrfs_balance (fs/btrfs/volumes.c:5088)
  Call Trace:
   <TASK>
   btrfs_ioctl (fs/btrfs/ioctl.c:3523 fs/btrfs/ioctl.c:5650)
   __x64_sys_ioctl
   do_syscall_64
   entry_SYSCALL_64_after_hwframe
   </TASK>

[CAUSE]
btrfs_balance() expects insert_balance_item() to return -EEXIST only
when a balance item is on disk, and a balance item to be on disk only
when fs_info->balance_ctl is set (a paused balance, or one recovered
at mount). So for a new balance it uses BUG_ON(ret == -EEXIST).

Both assumptions can be wrong:

- insert_balance_item() inserts the item, then commits the transaction.
  btrfs_commit_transaction() can fail without aborting the
  transaction, for example when btrfs_start_dirty_block_groups() fails
  to allocate a path. Then balance fails with -ENOMEM and
  balance_ctl is freed, but the item stays in the running transaction.
  The next balance ioctl finds the item and gets -EEXIST.

- When the transaction was aborted with -EEXIST, for example after
  "failed to run delayed ref ... -17" on a corrupted extent tree,
  btrfs_commit_transaction() returns the abort error, -EEXIST, and
  there is no balance item at all.

[FIX]
Mount turns any balance item on disk into a paused balance, so a new
balance can only find an item left by a balance of the same mount that
failed after inserting it.  No balance owns that item, so let a new
balance overwrite it, run, and delete it at the end as usual, as Filipe
suggested in [1].

For a resumed balance -EEXIST is the normal result.  Any other error,
including the -EEXIST of an aborted transaction for a new balance, now
goes to the existing error path.

The BUG_ON() checks on the return value go away, and the one on
fs_info->balance_ctl becomes an ASSERT().

Reported-by: syzbot+dc9291cf132691aeb478@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dc9291cf132691aeb478
Link: https://lore.kernel.org/linux-btrfs/ZNzE6CFOzu9kDG+G@debian0.Home/ [1]
Fixes: 1bbc621ef284 ("Btrfs: allow block group cache writeout outside critical section in commit")
Cc: stable@vger.kernel.org # 4.1+
Suggested-by: Filipe Manana <fdmanana@kernel.org>
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 fs/btrfs/volumes.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 3d4ef6725..4a8e5078b 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -3998,6 +3998,8 @@ static int insert_balance_item(struct btrfs_fs_info *fs_info,
 
 	ret = btrfs_insert_empty_item(trans, root, path, &key,
 				      sizeof(*item));
+	if (ret == -EEXIST && !(bctl->flags & BTRFS_BALANCE_RESUME))
+		ret = 0;
 	if (ret)
 		goto out;
 
@@ -5081,17 +5083,17 @@ int btrfs_balance(struct btrfs_fs_info *fs_info,
 	}
 
 	ret = insert_balance_item(fs_info, bctl);
-	if (ret && ret != -EEXIST)
+	if (ret == -EEXIST && (bctl->flags & BTRFS_BALANCE_RESUME))
+		ret = 0;
+	if (ret)
 		goto out;
 
 	if (!(bctl->flags & BTRFS_BALANCE_RESUME)) {
-		BUG_ON(ret == -EEXIST);
-		BUG_ON(fs_info->balance_ctl);
+		ASSERT(!fs_info->balance_ctl);
 		spin_lock(&fs_info->balance_lock);
 		fs_info->balance_ctl = bctl;
 		spin_unlock(&fs_info->balance_lock);
 	} else {
-		BUG_ON(ret != -EEXIST);
 		spin_lock(&fs_info->balance_lock);
 		update_balance_args(bctl);
 		spin_unlock(&fs_info->balance_lock);
-- 
2.54.0

