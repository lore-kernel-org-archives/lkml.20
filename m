Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189705;
	b=ozpfIqajFo/8KQWIBkdRmuRwnjUE9QU/V/+0CpftlLMWi7uWXtRDkV1798Ju9AtLCpP7
	 IqVHO5OxmdfynlT68BJ9m89HatxvowtZ7s4u2Q7Unjkx/QUOfF3RtrZclsdQOy76Kk3uD
	 yA7H2EEz6ppzp8l9JI1MNe56dV01qWfSP+TVFKEfGIF5DmO9ktXPgnlmxTtZbx58o9szM
	 XgW86rBgzX7DFcFxyw1bCjjznnznIy+4KUjQp+KKHyiWdlWKo+lbaYDxFIfhaNb+CIv1V
	 wvoa7fKY9Vv6f6msElvU953/dM+6vShEF21qDXKXd4jIwjyMzTRORAvn8E2C8CRzsKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8KxBRO5Re9XYDN/KL2CHYqXPi9yMnF5dDqV6a6oJZqs=;
	b=ClcddtMM3VEP/gx//HXIX9nx2qgFUuIdUrq2lwXC3a7cB9/VGWmEJIkXc+wn5PdxK0ez
	 e8FS1X21Oo/gxQQhj+L37lr+NAqBS5QUTDN0d5UXLv4LlmvYfvWXr6CsqFO45SwBxH17N
	 Hb5/ICG/JpbUqMcjUy2Wn5aGfq2o38qt8GPK/yRgE+tdXzs87I4gQ/BkiM/qj2z9wwhzo
	 xR+AahwKLYJY/Oi7hQmAh0hyrGZZj2QsZGFHqpfYJsnBQPKNeyc23GTjgrs+mcR47hVUX
	 HyiXzcJBUIxAJI0l/vSuVut6EgXH6HVyk1do8GSiIdWW6QwcETEM2E6lHjGJYr3e6uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Or/Q+STa";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC83606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC83606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Or/Q+STa
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so459268b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793189704; x=1793794504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KxBRO5Re9XYDN/KL2CHYqXPi9yMnF5dDqV6a6oJZqs=;
        b=Or/Q+STazFsIo3FjcUyTOqi4KYvUXfDAp3gKR73iETChiV+q8+UFsXQRTjisYjcDfZ
         jm8wJ3ngrmT7XfAgURNjMLUTyPtXqcdfHwiTmm9WbqzN0rIQ9+kvz8zrW3/tgaurd4RW
         M1wlqUuz8GguK0CQgop6WfPDvfWWRuZ0m+ym31YTFD/t/CScvFdYtxQs5LhVWJEnnq6F
         xg9Ssj2M3YqBgamOtKhuAXwFw5hEzPgkJgsqNYFNJ81/7xuxTgb3hW2R5IW20ihxa2Fn
         BCEtHQ+CJ479Lwk+z5QS4cWbyB9M0+jxgBwSJa6/zeEYgcYO35iVQ9RXyG2ae1wgpvWS
         H5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189704; x=1793794504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KxBRO5Re9XYDN/KL2CHYqXPi9yMnF5dDqV6a6oJZqs=;
        b=YG/90UMBIhv2pAf4WyQTMG5/wkWNsyrbaYEBNeh+0ljhkV0JjTMlKXwmnT4oZQ96Sk
         9pP8UNYarZd1NK7knU722si3wJfXz25xTtjQe4g0eNfEDHZct28qPy0TSU3+YU1wJK4h
         Ys0Y4fNlarzJXvUgVY+LNiiDx+MhHizN6pVJPVl9gsloms0soh1MGTO24hepsArSUiTG
         htDpeiglrfQ/wnSqEBCw1S55rwOqBJUH9PkIbiUf0GV9NdkMhU3aRjGQMng6q/6fC7nL
         6hcD4XuejH7+ZGaLCw7cctRjTp/R0abNqlHTGiVk6zgHOoOvBB+BER6R04R8hi7EEvk5
         pPTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDVRVkmJOtW8yFffQKw8Ip28nIzH5PoNW4W7hfGtcSQ+91QteZ/R9qJ9Bn5T/l248yCF7Y+xFJZef3xMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ+1++qtqsL0yNoSg4obO4pJGB7aMP58nljd3jEYSxRlKZCYUn
	dij9kH2azya1iv4UjwYfxEcK6c5V0XZ0McSLBJf65blHTeR3d+2QtuP5
X-Gm-Gg: AYBFou2hWLLBw4AK4SlVO/474BS11K/WXSQ6aXMvGL5pNvvSZRkyjQv4VyXdVMwcaZ0
	MzOzYchUcFKVe8QofX0bruFeU9tRQ8TuixJpBMs+DdSqQauo6MqtTZxAAs6w5wj3S1Sq9JG0YYV
	JaPGoWrZGWfgNHfkWoNPe1Ii7NY4zLI+PkiddOqycP1iRyDdycJ9IXmacBj9SUFKN0bOr4d21Lg
	NxzLJj7wymX0517JPklZk3frc5+fSZMshKwyO34Nouf0QfD9wLNmvlmyJwYa0KvF0JM5tZk9PLq
	2MuQKvzMJaSznIl86fgCEqEAZAVSc4UoQwIf4fQWBubDvSIfkA367exsr/rmITC3y9415IoqDkc
	Vcsb6OZBznkHPP45rlQ7aq9QyVSMVRjWMMl1mWMIuHDd6GEf+o1dw07enKyVIVo3EqPXMiQVtRj
	N2o2vnFp1lw1fZsuX76GRg2IPjYRlB5hV/xF6XXDvXpNCNVrSpqreTx9UHuM9ct8w11z2cTjjwE
	6EXyxr4gNPMf0qf/j6zPkftHQf/wpycPDPW+KH5jAxpavUB1lTLpYYam5hzZSHeSDWWaHmOIkso
	nnlqHSgghQlo4m6lwuf8tZjNEUfCIYPC2szcJJkI1gRmjoZfdQ==
X-Received: by 2002:a05:6a00:3d0f:b0:89e:7bfa:f86d with SMTP id d2e1a72fcca58-8a75a02536fmr776911b3a.9.1793189703875;
        Wed, 28 Oct 2026 05:15:03 -0700 (PDT)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6df0b5dsm1068172b3a.44.2026.10.28.05.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:15:03 -0700 (PDT)
From: Qing Zhang <diasyzhangqing@gmail.com>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Qu Wenruo <wqu@suse.com>,
	syzbot+5c01398781fb51df783a@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	diasyzhang@tencent.com
Subject: [PATCH] btrfs: set the block size before starting a transaction
Date: Wed, 28 Oct 2026 20:14:58 +0800
Message-ID: <20261028121458.23499-1-diasyzhangqing@gmail.com>
X-Mailer: git-send-email 2.43.7
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

From: Qing Zhang <diasyzhang@tencent.com>

When adding a device, btrfs_init_new_device() calls set_blocksize()
with a transaction handle held. If the block size changes, this takes
the bdev inode's i_rwsem and triggers a lockdep dependency cycle:

  bdev i_rwsem -> mmap_lock -> trans_num_writers
              -> trans_num_extwriters -> bdev i_rwsem

The buffered read path nests mmap_lock under the bdev i_rwsem, while
mmapping a btrfs file can join a transaction through atime updates.
Since commit c0e473a0d226 ("block: fix race between set_blocksize and
read paths"), set_blocksize() takes the bdev inode's i_rwsem when
changing the block size.

Move set_blocksize() before btrfs_start_transaction() to break the
cycle. Also check its return value to reject devices whose logical
block size exceeds BTRFS_BDEV_BLOCKSIZE.

Fixes: c0e473a0d226 ("block: fix race between set_blocksize and read paths")
Reported-by: syzbot+5c01398781fb51df783a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5c01398781fb51df783a
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---
#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
 fs/btrfs/volumes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index d3e6a9b429dd..a7f0607a5b86 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -3019,6 +3019,10 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 	if (ret)
 		goto error_free_device;
 
+	ret = set_blocksize(device->bdev_file, BTRFS_BDEV_BLOCKSIZE);
+	if (ret)
+		goto error_free_zone;
+
 	trans = btrfs_start_transaction(root, 0);
 	if (IS_ERR(trans)) {
 		ret = PTR_ERR(trans);
@@ -3043,7 +3047,6 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 	 */
 	atomic_inc(&device->dev_stats_ccnt);
 	device->dev_stats_valid = 1;
-	set_blocksize(device->bdev_file, BTRFS_BDEV_BLOCKSIZE);
 
 	if (seeding_dev) {
 		/* GFP_KERNEL allocation must not be under device_list_mutex */
-- 
2.43.7

