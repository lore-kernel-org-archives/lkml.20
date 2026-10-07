Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09A36DA00
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388608; cv=none; b=TDBinaj5Wp27Zi4k/DJu4hI4wKXS7pHZIL6Xn0oPZjxd0wKCakMCqdDLW6kCucNn9g9Tx6cDsA4GIsaZlSbD50HQmfgcfE9oHp0oIjQu26xwgs3Xejl2h05uZcqcYqDnC+E1Pq31gQDKi1Z/YigspniGFiIFXGBUzctXjPKIl8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388608; c=relaxed/simple;
	bh=pPVrV/2WzL7N96nw0kgeAidh+olLE1M63O2AzyLesmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9yoNDlDI3ksPINutTsjpXNxAWP+2J8RWYKUxkK0mSAIlvEMEAVBCl7idPvF5nKTdgwtFB0/NfwWRYXL+x1FRkiwnpJCADAmxl15nYooJe801PMP3GW4dX0Y7iVqO/bHiVKeNbhZBsR5f+yb61uZ6GRJAWgxU3Xt+atmSFKCnJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA6vG+JW; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA6vG+JW"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so1224986a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791388606; x=1791993406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7giGpQ+uI3o2xiXlAINjrMFLTWGSCC1i0BPrzI4PYPE=;
        b=VA6vG+JWzgrr02Ijgd+ho5+jzaTovoNHQG+5oW3S+LCPODY7sVqXBYv0+vlb6VHCQ8
         vsRUzOXBHoXctQoN3SHqsIRbG5n1xNicsMoPOsv34uqG4FyjcPKTU3xx0U6g+MyxPr/R
         zx0HPmJCiTesdwpeuW01I/HzWNdTYSvDHwUeOv5jAyQXFC2GxdicydKFmJMYkWQNxrbu
         /sHjAS6OEk0v45tpzf8tNobX9zuBD/Vua9K9g0GVyeEINum/4H8fh5uHRJW2SJjS/eYC
         rxnWUPfjuQBNko9V839kycpy56+f6cse+zDq+/N2ZeoKNmEgUApCTpCMMk1z8b/tyrrD
         X46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388606; x=1791993406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7giGpQ+uI3o2xiXlAINjrMFLTWGSCC1i0BPrzI4PYPE=;
        b=KgXmqS8oei4O5V+nE88TetxsONy+Euj5eE6y1CFiSzhTrEGX4Z8RPmPQmAJ4XLcWGq
         jLE8RnfTFTW6OFonio3k1IoImw0SbLXFZ53Sz+BfJHH3uluiggWmAbUeaCszsGUAQ50R
         yFYt7u/IudRXipuKsIW7vWCj/HERdOAg+37X+4bbrSbpMfyXJnpLhTmn/wqkt69TlnrL
         wuPFhc3kYLLHPrqTCH2s6t9FRgyO4O598SSROgtlIRB7C+rNWWXYd3OwHxEK3inYWMiR
         UMEFdcejTMmCJcVxzO1fj1C8wesIAngiJ5FAS2HhPFAd7tH3j87JtCKyPav08Y+ZPe1n
         N8nQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/aAVhCxEkXXYsZOeKmVjyA3E0l7MimR5+LAuoH/mmgQ/fJL2+BBtNMd9h+VUHeS8jblMGuQS/J4v8HBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7hBpsfo0hybDqh9ZAuJ/+QttJgT+I9rot6E7Wqre58Jj2dU34
	gvZxjarmYy6YZDyhuKLiemg0V+HHZ7GBM29SCv3V3wv04ymSXFuZs+T4
X-Gm-Gg: AYBFou1su8YFpPTW+Mc4dxVGYulwj6qrKas7yUQT+y6NK2bfy9B/Qptsmh9mEpd1cR5
	yZJNK6pNVGj+fT2BUS19PUytB34oV2YMmunDh4mLkhVm7YRa2D2yNtjNy6zLO87hYRDdq2mpFbb
	gkxX01HKh6mpGdOAAXgKswOaBMmbStSrkjTcbEfyAyWYyGBNMhPFu6smi7rcYKlk4HQqAQiUwDl
	tAfQyISMD24VmTYry+/BMIFpvPP0jvDFpKbPHTaxEnKQwS4jt2C06nI1N+jvQVEnVjQeiTt+PHB
	wP8XhXr2HdqqRQF0mjwD38B7qogtlBV4tus8kehv4vMQ4qI4Zmy2rCRATR76XyaUOSMxJbWTDT0
	/mqKXXPJ+1rFW1brg2zKqJmLTg0yM01ZLxOZ8MkKJlAqurDKzCaqRS+8FktdgoGVcQPMzUdsUcz
	gNDKqDsfUWHPbZRd7aOpxPtwm/bAQuZiCetXrly/bbOZ7fxuVampwFr7fFlnqrD6odqZ81t7C3a
	PokcQ==
X-Received: by 2002:a17:90b:3809:b0:3a8:6e79:6e35 with SMTP id 98e67ed59e1d1-3a8a0851561mr2418450a91.19.1791388606298;
        Wed, 07 Oct 2026 08:56:46 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:836d:b1f5:934e:51ea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff8d5896sm22432a91.12.2026.10.07.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:56:45 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: dsterba@suse.com
Cc: mason@kernel.org,
	wqu@suse.com,
	fdmanana@suse.com,
	shuah@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
Subject: [PATCH v2] btrfs: fix use-after-free on quota enable allocation failure
Date: Wed,  7 Oct 2026 21:26:32 +0530
Message-ID: <20261007155632.155645-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

The quota root remains on the transaction's dirty root list when
btrfs_quota_enable() fails to allocate a qgroup structure and releases the
quota root. Later add_root_to_dirty_list() accesses the freed dirty_list,
causing a slab-use-after-free.

Abort the transaction on allocation failure to clean up the dirty root
before releasing the quota root. Also remove the quota root from the dirty
root list under trans_lock before releasing it.

Reported-by: syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=947286c775f432b073a8
Fixes: 8d54518b5e52 ("btrfs: qgroup: pre-allocate btrfs_qgroup to reduce GFP_ATOMIC usage")
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v2:
- Keep the transaction abort from v1.
- Remove the quota root from the dirty root list under trans_lock before
  releasing it, as suggested by Qu.
---
 fs/btrfs/qgroup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
index cf8dfd5c692b..d5eaed5eec03 100644
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c
@@ -1207,6 +1207,7 @@ int btrfs_quota_enable(struct btrfs_fs_info *fs_info,
 	prealloc = kzalloc_obj(*prealloc, GFP_NOFS);
 	if (!prealloc) {
 		ret = -ENOMEM;
+		btrfs_abort_transaction(trans, ret);
 		goto out;
 	}
 	qgroup = add_qgroup_rb(fs_info, prealloc, BTRFS_FS_TREE_OBJECTID);
@@ -1296,6 +1297,14 @@ int btrfs_quota_enable(struct btrfs_fs_info *fs_info,
 		 * sysfs entries.
 		 */
 		btrfs_free_qgroup_config(fs_info);
+
+		if (quota_root) {
+			spin_lock(&fs_info->trans_lock);
+			if (!list_empty(&quota_root->dirty_list))
+				list_del_init(&quota_root->dirty_list);
+			spin_unlock(&fs_info->trans_lock);
+		}
+
 		btrfs_put_root(quota_root);
 	}
 	mutex_unlock(&fs_info->qgroup_ioctl_lock);
-- 
2.43.0

