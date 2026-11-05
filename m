Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897460;
	b=TNeUWL71G8H4pq5Vx3v+1VVVrsCBNKvBMqNcIQuX0crHO2s0xYVjwvJFNuwAqyl0l4QX
	 3gJdLwqNqI7vgb2rqwXpw9BJ/lTYKrYJwRB0RbhJ6iXtZojTfzfkn4FANmRkNxc7hjmIU
	 sBQQYhDrDhqejFu1x8nd8BDGHD+iE5TF5eBNHhPfNZnqENAYC6mu9BUVCNP7jzQ3GHzK2
	 5WXRoJPS0aLuuUWhcFqI9VupahorOcZZCf9Yan0Nj0Ras1cJZwXZuP1RtiLt8ais/bUeR
	 VbAuCgzMwfhPDk1Yki0ZbaLokIpeqHoC6H7Yw3RRVadPbLKUrJ45Ht3Ryl7YgH/iIzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Evd4zSRSoLM3wtvMWe5vBX2gWrgTZYiZmazmkRXzKvA=;
	b=yrylOaO1qDp57kBXYo02VS1n27CtyJbcofx+YFmI0nvs0WxYEP9LjgCQogxd5NLmpt3D
	 c8pLm7np4R276lZ5f9SyREowNifXcTUxxXIC9m+2nUg6CVmwdo4XB7PXgSZ4L13tWNKHH
	 pOOeQWwDrCNes2bSggT2NAPIiQvZIgj1mUgHSoO+J6My0tE+bAGmwqh1Y/4dJ5W8Kis1k
	 NVFsHiX1u9U2Tmd2tr/uxxLQoeBvIYT1pSuNSST3s8hUXGXrrO8JXXhGp0tbPP5AMUmxp
	 d8ACpsqeRmUYDj6wcCRmzT+9rBHjpsyBQ6Ab3aOirQrEnLsSE42TcaNJgZNmH2mXl5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ui93Puyw;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79495606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79495606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ui93Puyw
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1163573f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897459; x=1794502259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Evd4zSRSoLM3wtvMWe5vBX2gWrgTZYiZmazmkRXzKvA=;
        b=ui93PuywXMJzjXgS5MOsop1GhFn5R0ZhBytPXAoAZ+Gw+9iNb9ASSqd7sw2b9TtCO9
         Dpd7IxIcqU6COQrnQFNGktgjp/4R/79/ZU7kYRKa3YjsVepep/tb24YLgEaPtwe35NhD
         LdJXyT9M1IjrGrn7q0RcFptc2ymFrtOVNyx9Ot++scaAGUyirSboPOmRW7S1vrmJ1QhB
         Lt+hRhauFgNTB6ws/qU+4o8h2CFB359P5c9yg0OOHbBxRpUzQ7vPQSasLTrWAyYVyKRF
         GbyufdOZOaDh7akHpW8mXXzUNuH7T9phnxaQW/ofDDX4IRb5NKWTmXQxEofQ1NZt6Y0q
         D2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897459; x=1794502259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Evd4zSRSoLM3wtvMWe5vBX2gWrgTZYiZmazmkRXzKvA=;
        b=hkZrJPlgrAnvk3ZlkNcp2NUfkC96qvMcDbkD1KN+6qSj+6OCxT7TWLNbvD1gIMuLq/
         limxnRBUF/vvUzBSyxq0o5XZgFX9jzyVzG/1HHgoTcnREajfOTZ/EQNFDexRMso/hXi/
         TVG9AfXMEysMRLR1YGFZClkjnTS/169g7EI3IHQBPH9F1DyOrw5tracbL6smwsKhP58S
         DaQQZZ/BgfAsYQvuuKpFjBtE2h0ddx+8JYYO5Ms8fnD3bvtg3u9uLRPTctZ73NDlrvWC
         GSNFvTGof70zV8gNxMjS2B6gQ6dY2NuffpRI5GOEqlUruNM01h6KN4asM71cUhVtzakm
         9yOA==
X-Forwarded-Encrypted: i=1; AKwUvBwdGakv64zUAaHqH7l3aH9rjdC12AghM62WBAb8dSDxrb4xXFy9EYe2Pv9wKz48n/O2AhgBEP5K7h/L1dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2hewA04/0j/1LUfrLaJCTlTuCT6+S6X3sxPuzfRlwMXzmSBfs
	iiKG3m5MmG7pJECgNa4dET10+06FbIbe8ECubyVSmwCU8U8jT2JsuJm0
X-Gm-Gg: AYBFou0aEewUvhD1aRWUBmyjyJycnjVMAPyQB+djjmIPJOhGm8GRAuwAKHgu56+xzYH
	cIfE2GHiu8BAY7Cb1x1NHskALycbKPgSJPCHjhV0dUHAwzucc15Sz++h/8m52YbnjtgoXW2JIIX
	2ZDLc/g9/D/rfomxN6K/ciIOQtwHkKY0NaPK/Ec3KSGmNXXsCE85ZNnmT76nJ0DNsiQevm1qRHy
	mApOj3yW7jLIp3HujoCA6KEAGcjUknwQpaEb6WQ0WK9Xic5It0CXerSEl3CbcSInql0kmpiIQgc
	ctPTBmsZlQ1ya/5hu0pRLHvTqzB533Ahk/S/UqFDcwF3C3g2iw/yMHxZI/Ez1tFm++QSzdxHlcA
	egxcP7r7rRmwPfCIHihkGpCwsxDETvGAuc7l8W2ZBlIFBP33ZHX4WHw1sSpyk+GaU8tZttfRDLU
	6bQU1c4zuA1kx5UO1ptbvFWYfkmh8lPE//Magp6nunX266dfYmUSZviXC6WO6pO6QHvXAITbtwV
	wjdkGBbk8LHIoLrtH7IuWNfQfn3zGr3dyXf6PfAQNwTrxPlcH/e6CosgvtcBN1c6ABar/4HRnKt
	gGtSRpVEQ9EAPQhyIDzgHx2Ah6SFmlRgnvEiTesDpGEkOaDoONihYSPlxDbaeLLcixekWmPUtI5
	LwWeUvxqvt9mH+RXfiJftOhbKsQpMSI9fGGMRO7MP4MTkWaJXRJqaRDb/2Q==
X-Received: by 2002:a5d:4532:0:b0:48e:28bd:e1ad with SMTP id ffacd0b85a97d-492775efe4emr291774f8f.30.1793897458618;
        Thu, 05 Nov 2026 08:50:58 -0800 (PST)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.0.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda2007esm10825835f8f.47.2026.11.05.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:50:57 -0800 (PST)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Breno Leitao <leitao@debian.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com,
	Ran Hongyun <ranhongyun1@huawei.com>,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH v3] configfs: fix slab-UAF Write in config_item_put
Date: Thu,  5 Nov 2026 17:50:54 +0100
Message-ID: <20261105165055.362-1-drifabdelmalekmohamedsaid@gmail.com>
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

syzbot reported:
BUG: KASAN: slab-use-after-free in config_item_put+0x26/0x90
           fs/configfs/item.c:149

Call Trace:
...
 config_item_put+0x26/0x90 fs/configfs/item.c:149
 configfs_symlink+0x6be/0x11d0 fs/configfs/symlink.c:225
 vfs_symlink+0x18b/0x330 fs/namei.c:5823
 filename_symlinkat+0x1cd/0x420 fs/namei.c:5848

Allocated by task 5712:
...
 nvmet_ports_make+0xe6/0xf00 drivers/nvme/target/configfs.c:2054
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1369
 vfs_mkdir+0x408/0x620 fs/namei.c:5439
 filename_mkdirat+0x289/0x520 fs/namei.c:5472

Freed by task 5712:
...
 config_item_cleanup fs/configfs/item.c:128 [inline]
 config_item_release+0x13a/0x2d0 fs/configfs/item.c:137
 configfs_rmdir+0x885/0x950 fs/configfs/dir.c:1580
 vfs_rmdir+0x3e9/0x6b0 fs/namei.c:5544
 filename_rmdir+0x292/0x520 fs/namei.c:5601

configfs_symlink() takes a reference on parent_item, drops the directory
inode lock around get_target(), and puts the reference at the end. If a
concurrent rmdir removes the group in that window, and parent_item is a
default group embedded in a larger object (e.g. nvmet_port.subsys_group),
the reference does not keep the containing object alive. The object is
freed, and the final config_item_put(parent_item) hits freed memory.

The syzbot reproducer hits this by racing symlinkat() into
ports/1/subsystems against rmdir of ports/1.

Fix this by not holding parent_item across the unlocked window: put it
before inode_unlock(), and look it up again from dentry->d_parent after
inode_lock(), returning -ENOENT if the lookup fails.

That is not enough on its own. configfs_get_config_item() only fails if
the parent dentry was unhashed, but if simple_rmdir() fails, rmdir skips
d_drop() and the dentry stays hashed even though the directory is already
detached. Default groups are detached through configfs_detach_group(),
which marks children S_DEAD, so also check IS_DEADDIR(dir) after retaking
the lock and return -ENOENT.

Reported-by: syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=63336d70e1af377d7388
Tested-by: syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
v3:
  - Removed redundant null assignment to parent_item
  - Simplified commit body to not rely heavily on repro
       explain bug and fix logic
v2: https://lore.kernel.org/all/20261023162906.2938-1-drifabdelmalekmohamedsaid@gmail.com/T/
v1: https://lore.kernel.org/all/20261017123748.4430-1-drifabdelmalekmohamedsaid@gmail.com/T/
 fs/configfs/symlink.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 89178f5d371a..62d13ce5b46a 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -196,12 +196,26 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	 *
 	 *  AV, a thoroughly annoyed bastard.
 	 */
+
+	/* Put the reference back, retake and check after relocking */
+	config_item_put(parent_item);
 	inode_unlock(dir);
 	ret = get_target(symname, &target_item, &target_sd, dentry->d_sb);
 	inode_lock(dir);
 	if (ret)
 		goto out_put;
 
+	if (IS_DEADDIR(dir)) {
+		ret = -ENOENT;
+		goto out_put_target;
+	}
+
+	parent_item = configfs_get_config_item(dentry->d_parent);
+	if (!parent_item) {
+		ret = -ENOENT;
+		goto out_put_target;
+	}
+
 	if (dentry->d_inode || d_unhashed(dentry))
 		ret = -EEXIST;
 	else
@@ -218,6 +232,7 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 						     target_item);
 	}
 
+out_put_target:
 	configfs_put(target_sd);
 	config_item_put(target_item);
 
-- 
2.43.0

