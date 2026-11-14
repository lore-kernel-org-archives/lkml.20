Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625098;
	b=Aak2CUVWre+IXpzCja8twx0rCBwEMRdYSVZm0MoG56X2YIPMvw6gA1kEadSEG9zx+jGr
	 dd58yWzSIb0353snUSlAIn48Tt9JSGfRQEqKp4oMXCqZIbClFiKz0XRDGMTmPMSgQakRr
	 Baxjz02KBWKLd0Zh6B6a5A5rlIJqrspJUWqlL4dl6ujvcUpg+1mpICfa19N4jUZn00hpQ
	 RmF6Zn4EL8Vz7B+2OX39hCJaP1ySImuHFle4h0eNg+CvNQh8j1SqUdYMtJVkH4/lk0+GX
	 9EJ43llxelf8QqW6GrhYpJP7i+5Dxwga0aJQnXDqtoXPBkI+dEzv12yIW+AnVIudrqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JXqAbYuZ2vpS9frtjoNHLZmHrsnGeUx2jopCaJzDTbs=;
	b=igyn+MWW7tUonXteBX8xlLMjDTt5CJ+65zohecVzzvsEVIdfbJLMZFa7GIWFGN2TffYm
	 aezE+DjrrbLW9B8frszxO/718EsS2bOIR00kNQQxpKCfnaGcVOzVjj5v/kQYSSxVyEkt8
	 SWgJMPx+JE4Djc57PdPvAslAtHwTgijU4Nmy+9KvqgLtoIED4kYe07Q36jU6Jws1X4pwR
	 RjHEYcF7ogcPschUQD2hI32MoirvG62dd9C+pqNY4xP0nty8LV5nIndaDE6BvWu7qLf7W
	 fd1bMThGyMVsS+aC4Cb/XQneeddbdy2A24nUzyuHiNASW8DRhc+tegB9iafZn/f5k/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkvArAl+;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDC606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFDC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkvArAl+
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so685983a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794625097; x=1795229897; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JXqAbYuZ2vpS9frtjoNHLZmHrsnGeUx2jopCaJzDTbs=;
        b=wkvArAl+xjcXYLPgv993Lq0PsLW/D9prPV51TOZj76Igo7VPO9e+iKax8AAz5pKbZV
         bge1E/G0vYqhyAWPNfkpYPsQAyFCgxx2DFH0RzJNZZSFdS7Z5kmffC96GNVK8EQhPJp+
         Q6Ymh+yAuvy4XT9x6zPlPFTHIJo5aF488qBl2Iyz9zFPuMsZzCAaDlPp4IvcetjCkPc2
         stOKWb1TKV3WyzY3kyG/u6FOYI5dfeBZc7q7tH8uFBQiikvsO0sYUxjrP9wtbVb6XLmz
         lwziKvOLETk6m/LydyM2ENCUs3+W/JfM3gFKh54iOdDh5w7nhfAiT4rGakFYwCstH0Za
         L3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625097; x=1795229897;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JXqAbYuZ2vpS9frtjoNHLZmHrsnGeUx2jopCaJzDTbs=;
        b=wt9g7THgZm7FcF+DK9/PWjMzLO6UnjtRfESw17XArieZ15xgpLJ/nuA2H1fOuJd9Jw
         Iotlkl5dVkpdK3B8Dvw5oUMD4gMffB/OJ24vW7IQeuqG+XGA4V8iyaESsVFG2EpefcOh
         MAzM/zpWV+yAv1GADnRWi16/wyLsvbWMpCjh3RvPlS3tsVTMeagh9DQcEpsmtXcBVcyV
         Nb6Y+keLSaNad8l95Xbtt/8M48UfVeruwihgSJw4lAUa6tcuOSfFTvPJ10ccQpV8gOnd
         uSW3rONa6XG8ImCYlPHw1DYW6YDGHgJGBZf4n8juiyfDQ33EPBUTdTXIfWPCRyno6wSM
         nguQ==
X-Gm-Message-State: APuU4Z+w7qya4VUkLzBQoOEccGdtdRN8RhoyuMS4eeV0Xes2izpCTVlJ
	J0VDTjUmctdDTj1dHUDmkjCOffUK4bpQSoYoTnx0xMSe7WEsuxgFKzwh
X-Gm-Gg: AYBFou0bco6oyFGgiU1qAu+T/PNyh5HWqmcTqZDlza5xjjdbQiOJrGPMhwpIoITbEIv
	KzNpo3btBC1uWYfszFceZ/yqF3PCOeVH3On8SSDLNx7n6oh1CnxJYZHWjEFjAzbXvPBjtfmO+g8
	Veh2D8SZGYm8JRKpnq24qDgeFxs+lV6BNpiJ2tvgWD1WkaPx6dRtDp9HGjKIQ0pDGb4ZhxfhDrw
	vkjIOn0LFOSG9EHOCIoJ9URuNzLFWW2aSpo8hO8CsZDPquNmKv/tFMdkrBRH95zSqhA/BWf1NUC
	271G3ay+CRNhKFs8rM/2EaPGHxgh2KYeGBlFGibsZMbz5R5GKqGuQsDkACDM7Y4QTkkvDn8Wtlf
	0akZ7kR0kj6SmY+oRgeZZriVFyyMFxMJC4uqJ3prRTM2t0pIzvPpQK2c83L674XyVK9GIrSy2UJ
	ZOEnGN7GJeU0bFYB5eP0/EltwAIOKMtTd/QT/cTSHsNDY8Sl+mG/qvbFfdqmkNw4O03fHOPyZ3D
	d/Gy5cSrs6EjIvSTPkMKMkhcDqG+gIRn1AKZVLPvFCtUg9ZwxKBKjw/DOhs8qIbzNaKwk3gQpY/
	RDciq+nTK4yJzFnLhrh8JNYIw/H8Apzp2kz70hsc+drJHa29d544UiphoajttnOhgKK3T0P385e
	ExVLyEI+T0rpqE2+u+7tzNfmzoTWQBP8NTIKC1Z+YgvxeOrr+RTApMko=
X-Received: by 2002:a17:90b:5806:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b1b0a4cf70mr3720380a91.33.1794625096978;
        Fri, 13 Nov 2026 18:58:16 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2001:f40:90e:5ed4:d53:b5f5:a144:fe4f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm7141206a91.1.2026.11.13.18.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:58:16 -0800 (PST)
From: Izaac Chong <izaacchong934@gmail.com>
Date: Sat, 14 Nov 2026 10:58:04 +0800
Subject: [PATCH] configfs: fix use-after-free of default group in
 configfs_symlink()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-configfs-symlink-uaf-v1-1-1446154abdda@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ6CMBBA0auQWTOJJVDRqxAXbZnioBbSEQIh3
 J2Ky7f4fwOhyCRwzzaINLPwEBJUnoF7mtARcpsMxaXQSqkS3RA8d15Q1s+bwwsn49FVbV1aq83
 tqiGlYyTPy7ltHn/LZHty398L9v0AXpA4CHgAAAA=
X-Change-ID: 20261114-configfs-symlink-uaf-c5d84bb6a976
To: Breno Leitao <leitao@debian.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, 
 syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com, 
 linux-nvme@lists.infradead.org, Izaac Chong <izaacchong934@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625093; l=4212;
 i=izaacchong934@gmail.com; s=20261114; h=from:subject:message-id;
 bh=J+KkHfs0mzJGU6K6QSM4d4XD/5HOyjXhZy3CNgCcS3Q=;
 b=mrAQQ+OlG7DqTqvgoTQiyvjTue8vzz74E39xnsarPkOZ3nCwUlyMJzzPu58vmE637kNmAxcWC
 +nYbFUOXXYnCCmTdRVpJnrE7HHaXot7VvJRYg9//1IR4K1TIrVkGqKb
X-Developer-Key: i=izaacchong934@gmail.com; a=ed25519;
 pk=IFfOWcK2ZRkDtCqaNggolAwpvIidYMt3Oar3NEnvqzY=

configfs_symlink() drops the parent directory's inode lock while it
resolves the link target, and keeps a reference to parent_item across
that window. When the parent is a default group, such as
ports/<n>/subsystems/ in the NVMe target, parent_item is embedded in
the containing object (struct nvmet_port). A reference on the embedded
item does not keep the containing object alive, so a concurrent rmdir of
the port can free it. allow_link() and the final config_item_put() then
touch freed memory:

  BUG: KASAN: slab-use-after-free in nvmet_port_subsys_allow_link+0x41/0x2e0
  Call Trace:
   nvmet_port_subsys_allow_link+0x41/0x2e0 drivers/nvme/target/configfs.c:1059
   configfs_symlink+0x59a/0x1030 fs/configfs/symlink.c:196
   vfs_symlink+0x18b/0x330 fs/namei.c:5794

detach_groups() marks a default group's directory S_DEAD while holding
that directory's inode lock, before the containing object can be freed.
So drop the parent_item reference before unlocking dir, and after
re-taking the lock return -ENOENT if dir is dead. Otherwise look
parent_item up again, which is safe while dir is locked and alive.

Fixes: 351e5d869e5a ("configfs: fix a deadlock in configfs_symlink()")
Reported-by: syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0996ac2197dd7420c3e
Cc: linux-nvme@lists.infradead.org
Signed-off-by: Izaac Chong <izaacchong934@gmail.com>
---
Tested with the syzbot C reproducer on v7.4-rc2 in QEMU with KASAN:
without this patch the reproducer triggers the slab-use-after-free in
nvmet_port_subsys_allow_link() on the first run; with it, 3 runs of
5 s each are clean, and normal link/unlink/rmdir of a port still work.
I tried to have syzbot test it, but #syz test is currently disabled
(syzkaller issue #8122).

syzbot's AI patch (v1-v3, still in moderation) pinned the root item of
the default group. This takes a simpler approach: drop the parent
reference before unlocking, and recheck IS_DEADDIR() after relocking,
since detach_groups() sets S_DEAD under the same inode lock.

Not tested: lockdep was not enabled during the reproducer runs, and I
did not confirm that the new -ENOENT path is hit during the race.
---
 fs/configfs/symlink.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 89178f5d371a..1b2c9048a920 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -166,11 +166,11 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 
 	parent_item = configfs_get_config_item(dentry->d_parent);
 	type = parent_item->ci_type;
+	config_item_put(parent_item);
 
-	ret = -EPERM;
 	if (!type || !type->ct_item_ops ||
 	    !type->ct_item_ops->allow_link)
-		goto out_put;
+		return -EPERM;
 
 	/*
 	 * This is really sick.  What they wanted was a hybrid of
@@ -200,7 +200,20 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	ret = get_target(symname, &target_item, &target_sd, dentry->d_sb);
 	inode_lock(dir);
 	if (ret)
-		goto out_put;
+		return ret;
+
+	/*
+	 * parent_item may be a default group embedded in an object that a
+	 * concurrent rmdir freed while dir was unlocked, so we dropped our
+	 * reference above.  detach_groups() marks dir S_DEAD under its inode
+	 * lock before the containing object can go away, so it is safe to
+	 * look parent_item up again only if dir is still alive.
+	 */
+	if (IS_DEADDIR(dir)) {
+		ret = -ENOENT;
+		goto out_put_target;
+	}
+	parent_item = configfs_get_config_item(dentry->d_parent);
 
 	if (dentry->d_inode || d_unhashed(dentry))
 		ret = -EEXIST;
@@ -218,11 +231,10 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 						     target_item);
 	}
 
+	config_item_put(parent_item);
+out_put_target:
 	configfs_put(target_sd);
 	config_item_put(target_item);
-
-out_put:
-	config_item_put(parent_item);
 	return ret;
 }
 

---
base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
change-id: 20261114-configfs-symlink-uaf-c5d84bb6a976

Best regards,
--  
Izaac Chong <izaacchong934@gmail.com>

