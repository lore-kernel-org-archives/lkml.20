Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C9732B125
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789233077; cv=none; b=j7vWUOOulzL4TsMRJ/1/8hWZHxSlSIcUUg5tfQw/uMmrdf29R1QE9sUfpms0sbemdIkK8GoVb7NMs2Lol3T79j0bBDyZlXEpoQifOXJ5w114gp2bK21Ff5F6ZKhKXcW5bsFGgiPb/0WX4eHUG4ThDiQKXnUdPj0AazgVME29JaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789233077; c=relaxed/simple;
	bh=RuTn9Fm+9IoZCNc9e0JBmewi5M9wnilk4wg2UKUFzBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N3iBpNOzuMTTi0MPksr5PqKcWvJzcByI1jNS8a80ebTHJbI+/nru7v60KMCAH4ASASA0PFOonMUK4MBNjsTu63gnaNRCvwQ47gYl/lBOunbw6pWLVLUf2zIBTLxT3UwuI6OivIF3/Cr3BxPjSXZG92UJV37sAXyRA+ovai2Ael4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxyVoocV; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxyVoocV"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so1090977b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789233075; x=1789837875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IJVOSmbNQ3bOhXTyeETR8LNIYP9BVTpAHs6ZZBuPTw=;
        b=sxyVoocVX0S0tLnwud7Gne0GLrmlClau0joSuBy1Q0zv+FN6jH8b/kyKeT0efmjf49
         q6buG6aVGC29f0TTBlWZU/q/EGVBeJHtmiKW436vBzeam2EVhPa948R6/Iy91NXISB1F
         WBtZGuBXBzO2Dcy5NpHkN7BJiQ/bN1bpcpTtBon+B4H3x9l+lmB4PBVEmmF0zU0mWaJJ
         HB15uI8/Qd0cHSz9rjlzmLYghTvRxCbnRsA3b7AXKkUGdX20+rXEAhvRseTgTp3w77WC
         rX2eNBNtHBLvvlTCGEtFX+kTmgMJFZmhQFndgz6DYRBqvoR4yCGGq6HCP6WUKtd+sAF7
         k95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789233075; x=1789837875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IJVOSmbNQ3bOhXTyeETR8LNIYP9BVTpAHs6ZZBuPTw=;
        b=CM0kbSAyvxqti/I61DHoZkTdHAN+O/2XO2sU+syM21u/t4HpZ22MYFpE3dKT6NLmQT
         P+WS+0p6AkL2jo1s6xcqwsotIIkD13HimWevJFgCnpYdbgRhczDGuPreX18kbAXpZ8TC
         A8nqeqQGgGfG3M5DfXTzkfM8pcnBdgIbPsVcdestLpOMTzXaHskmxwfZHk4ofJgmMad2
         kLO54CWkXjLPLimXE7njyBHehPwWobRUIajSfv33HsCbWO32/KneQC6CmkgIujAQgdsB
         R6XrDF26OqtCDVNoaa5NfaOuR8LNUmDlrwnfzByVSpOqtwQQkzpTtd03b92TrhjJx5FP
         G8ag==
X-Forwarded-Encrypted: i=1; AKwUvByFM+x9H+oOr2IPN7tqqLQxeuAiRTsiU5Ndeo7lnM8Q4z/gJmnMk9fFC5oygrS998f+IKYGUKVdAWcO0+I=@vger.kernel.org
X-Gm-Message-State: AFuF++l32s7AwhLnkS20msJoijhXrTeByqvs3nyqSDPrZY3EGM0A5gFO
	4yzf7iwxN5lHdyNilydTworHxwm8OETMy+2MLUjXN+r7gCdGWx2/XIyF85mrFJw5vnY=
X-Gm-Gg: AYBFou0B/OBT7CBKx9TLoPJmnRHI7fdTKfYuGnsAmZVnv5GkK14UIeloSY90DTszn/l
	T7/TUFJHcmZsxYQt6+ZCfJnsMLBqFxo1wTiUMho5bHGC2dALW1JDo3SkoDgI3Ca/TkQlsOq0uZ4
	vs1U9a7XEj8eWZxdS7r8/9129Ojttu5MHaGz+WEmGLhJxHRmt5DjKj2rF3oHxjY7IJyLYbS4f1D
	RpZJMnAs0Sx+Lt1unm5RLf9tM9DTaelxYd2DrhI7GrkNlbBJI36Q2oAnm/YwKfj41iZY4G/d+i8
	R7HkaFJmE+LjnlNbTi7brIEM3GSfxJNzmUAXC98B4p1iQFlEjSr53FNFs9NKOnsEUW1hp8xFNCR
	AujtXMcqtVT2Cb+ykWzRa7gtGDu7DB70m8zI2+lpL+mqhzJWtkvq2kTpTbV0uJav+/aKThfMm7p
	jOlE5HS6iqtZw+5AQaNmiQ6YvGNDXNv3UHSOjXiVDDiqOJJTdJgwEJU70GIxIBDkX0NiOOAJ35x
	rjjNppHY+YCCyEACaJU6J8CKEKnRgvE
X-Received: by 2002:a05:6a00:c488:b0:86c:bf42:fa44 with SMTP id d2e1a72fcca58-86cbf4303b4mr3739515b3a.6.1789233075465;
        Sat, 12 Sep 2026 10:11:15 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86c7b4922b2sm1133637b3a.2.2026.09.12.10.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 10:11:14 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Hannes Reinecke <hare@suse.de>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	co+77553a7fc66ac133@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nvmet-auth: fix out-of-bounds write in nvmet_auth_challenge()
Date: Sun, 13 Sep 2026 01:10:11 +0800
Message-ID: <20260912171009.1513289-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet_auth_challenge() receives its output buffer as a void pointer.
sizeof(*d) therefore evaluates to one with GCC and undercounts the fixed
challenge header by 15 bytes.  A short AUTH_RECEIVE buffer can pass the
check before the challenge is copied past the end of its allocation.

Use the typed challenge pointer when calculating the response size.

  BUG: KASAN: slab-out-of-bounds in nvmet_execute_auth_receive (drivers/nvme/target/fabrics-cmd-auth.c:442 drivers/nvme/target/fabrics-cmd-auth.c:569)
  Write of size 32 by task kworker/1:1H/64
  Workqueue: nvmet_tcp_wq nvmet_tcp_io_work
  Call Trace:
  nvmet_execute_auth_receive (drivers/nvme/target/fabrics-cmd-auth.c:442 drivers/nvme/target/fabrics-cmd-auth.c:569)
  nvmet_tcp_try_recv_pdu (drivers/nvme/target/tcp.c:1119 drivers/nvme/target/tcp.c:1243)
  nvmet_tcp_io_work (drivers/nvme/target/tcp.c:1350 drivers/nvme/target/tcp.c:1382 drivers/nvme/target/tcp.c:1445)
  process_one_work (kernel/workqueue.c:3322)
  worker_thread (kernel/workqueue.c:3405 kernel/workqueue.c:3486)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  The buggy address is located 16 bytes inside of
   allocated 33-byte region [ffff888000554e80, ffff888000554ea1)
  Kernel panic - not syncing: KASAN: panic_on_warn set ...

Cc: stable@vger.kernel.org
Fixes: db1312dd9548 ("nvmet: implement basic In-Band Authentication")
Reported-by: co+77553a7fc66ac133@bugs.sh
Closes: https://lore.kernel.org/all/Ah6QavQXwvshtqyUcYD1P1R7XE0ND9fB7lbV@bugs.sh/
Assisted-by: Codex:gpt-5.6
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/nvme/target/fabrics-cmd-auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fabrics-cmd-auth.c b/drivers/nvme/target/fabrics-cmd-auth.c
index 92f8a76f10..dccdb55a36 100644
--- a/drivers/nvme/target/fabrics-cmd-auth.c
+++ b/drivers/nvme/target/fabrics-cmd-auth.c
@@ -427,7 +427,7 @@ static int nvmet_auth_challenge(struct nvmet_req *req, void *d, int al)
 	struct nvmet_ctrl *ctrl = req->sq->ctrl;
 	int ret = 0;
 	int hash_len = nvme_auth_hmac_hash_len(ctrl->shash_id);
-	int data_size = sizeof(*d) + hash_len;
+	int data_size = sizeof(*data) + hash_len;
 
 	if (ctrl->dh_tfm)
 		data_size += ctrl->dh_keysize;
-- 
2.55.0
