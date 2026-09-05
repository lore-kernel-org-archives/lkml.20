Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37787434E21
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788606447; cv=none; b=YsLr8C5BbyhD/V49ZcDagwf1cggLZ+nbzrVhPIsf7xxZ3jzdfkcYl/hC/kIcUWQuY06bOT8fUfyfc3+/EbZ4e/7FUziIT2zH+M8YFqw0bIFT6vlppb2Qu/cGXKbRGwbNzz3FgWXdXKw/tYnfv5VF/RLeIilcksHxGleLdR4ueXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788606447; c=relaxed/simple;
	bh=ypaOgYr8SkldlyI5CBUa4bdeiCX+pOmT+GE7aoozdv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hl4dEQuDYcn0dWyc6gFD/9GwqxvY3gtAGOH4effjxjb9bsPPPhV/FTRCnXH+/O6YnFuc2qMU8GmB0UYk5LZX31w9Dh5iOJjw5J5LNRS5Jq/l4b2lbl/VPqdVoQjfnvE+SqELTZKpDjOd5AqDiZY5M0sCACGijqAb4BTfUA04SiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9jtBriI; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9jtBriI"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1385913a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 04:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788606445; x=1789211245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yl+A1TCnMoj0CT3g6Nbon3RjU8W/dyxhnmvmd3XUicE=;
        b=d9jtBriILpJ2Cg15vd1gY7x2PNblfmEbt3Aj2fc44QJkyev+f3XCNG6POCOwCtmD1k
         PMe4ZkJf6s2kDaOYSWX5IM/Y+nLNtLS0XoeuEn30JRomdKP/bqn6JufhS/d9UlPxHekB
         16RrUBP6zgOUXTmqosV7kM2BpY/kENNAl7yJuOVD2MYsHbBFtoeOfYDgbbK2po2RR7tN
         Tpx/gI/4BOMIG7qcget7HPNRRx5fZCnaOu1dXueJyhnKWGQkvOrz/cJVWK08/I7rYIDS
         DhpiRcPSNQ3PMaTgBE84Z9ifLYNhGC2E/4JVaQfLy0KZ8r1N2y1VMR2zDmVZ1C+Bx4CW
         MrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788606445; x=1789211245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl+A1TCnMoj0CT3g6Nbon3RjU8W/dyxhnmvmd3XUicE=;
        b=rM20R2qt944Pv3ZCFm/dGUKk0Z3c74hBfIKHSlkJ4W7xV7rvtjDGDJ1WElF3B+imi+
         bvFgu6pjglVPxSwOtEEg402GxrTGknmPqLG5E0SXIK+Nt8p55YXpagnQx+mrdRUTireG
         NqWKkUW/suOh2RAKI9SoW5vR2dWRMHFAmieIjjEAn55V0tFfhWYIpK1Io3pi5bFZ0K5w
         Ure2eZzdUSiQ3ndUnamC/LyobRdXklTAu903lioNO1/dUcfO3BoEiTKuH3MoUKlAiGMh
         QDX8fI5lO9+YQHlNHGhG+Wz4eOAPdrFJ/KLh3WBUDPhSjyYI9G3ROIL2WWI/nZoTYJ2x
         4mLQ==
X-Gm-Message-State: AFuF++kP5+qNL26dBU2JmMLBRAgxmBjTjyxlGD8DT9II4KpheovVZS24
	Wr1NRDj1/hiknh9H14xjmfckRpYcFEWU61lXnXFwaAI7OtzABAhJBjc1
X-Gm-Gg: AYBFou1W3kPbbWVXDyKm3TF0c0Ox6wyOkrpw8S+YcrNCoV7UVkjTHrgZ6P0LTzYBLbm
	3UjsSuzFVNQAJntvz0V4ERPmZXunOnvPgEW4V6+aMz918A/ps08yJVW2NBKTrLE/X2pcv1cfWfC
	4ULWXiovb+Q3twvoDQNRREeV+dHibnAwSSxOBNadDQRRt4guzlVg3UZZQfTNsQUR248JvXZcUnl
	3WgWalgBtN90YoICHJOlsVx61Inwpc1ir+QpDWB6cAi3dVXwDAgbnPJK70zL2h1EKuXZGIKUoYv
	i7NU1VyWyvprcdWeLU6aLXaiLfinwxcFHMM066Xy024w7XhLeyexvIGNxHhrrTTWK/SzWB+UPQQ
	YJLE+yF1TQGVdCCBiV1S4n+gHyVgOEoPBxBhBXbOiIdrsQ6Cbbx37SsPcrSPWHk5kw1iZ4//2wW
	FUZFw7ro4HqiqUPfaaBJ2BZ3+zwsWwuM4u5C4qsA6ghVS4lQ5H+9lDHdGP+VGUT3CNd82YgGqac
	IbWlttbZQ==
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39b26277b88mr17422556a91.24.1788606445325;
        Sat, 05 Sep 2026 04:07:25 -0700 (PDT)
Received: from fedora.tail24a085.ts.net ([14.241.170.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm15614755a91.1.2026.09.05.04.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 04:07:24 -0700 (PDT)
From: Mai Hai Son <haison120404@gmail.com>
To: dsterba@suse.com,
	clm@fb.com,
	linux-btrfs@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mai Hai Son <haison120404@gmail.com>
Subject: [PATCH] btrfs: wait for RCU readers before freeing a new device
Date: Sat,  5 Sep 2026 18:06:40 +0700
Message-ID: <20260905110640.152156-1-haison120404@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btrfs_init_new_device() adds the new device to the RCU-protected
fs_devices->devices list before completing the device-add operation. If a
later step fails, error_sysfs removes the device with list_del_rcu() and
then frees it without waiting for an RCU grace period.

A concurrent reader such as btrfs_ioctl_dev_info() may still hold the
device pointer it obtained under rcu_read_lock() and dereference it
after btrfs_free_device() has already freed it, triggering a KASAN
slab-use-after-free report:

  BUG: KASAN: slab-use-after-free in btrfs_ioctl+0x58e4/0x5d40
  Read of size 8 at addr ffff8881176fa870 by task poc/84
  Call Trace:
   kasan_report+0xe4/0x1a0
   btrfs_ioctl+0x58e4/0x5d40
   __x64_sys_ioctl+0x121/0x1a0
   do_syscall_64+0xf7/0x5a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  Allocated by task 81:
   btrfs_alloc_device+0xb0/0x3e0
   btrfs_init_new_device+0x4b2/0x3660
   btrfs_ioctl_add_dev+0x179/0x430
   btrfs_ioctl+0x11e0/0x5d40

  Freed by task 81:
   kfree+0x1b8/0x550
   btrfs_init_new_device+0x56b/0x3660
   btrfs_ioctl_add_dev+0x179/0x430
   btrfs_ioctl+0x11e0/0x5d40

Wait for an RCU grace period after removing the device from the list and
before freeing it.

Fixes: 39379faaad79 ("btrfs: revert fs_devices state on error of btrfs_init_new_device")
Assisted-by: Codex:gpt-5.6
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Mai Hai Son <haison120404@gmail.com>
---
 fs/btrfs/volumes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 9b66eb584..af59291b7 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -3133,6 +3133,7 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 	btrfs_update_per_profile_avail(fs_info);
 	mutex_unlock(&fs_info->chunk_mutex);
 	mutex_unlock(&fs_info->fs_devices->device_list_mutex);
+	synchronize_rcu();
 error_trans:
 	if (trans)
 		btrfs_end_transaction(trans);

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
