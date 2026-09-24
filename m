Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CF4A6CE1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270033; cv=none; b=vFmIIH3cu1rYAZ8Cf680TMDXB1CipgA0qHV2+nlBg1K638y3obftRKiDtDuTtPNAe+59WU2LFd7KdJP/OWbrxy/oDdiwaQhUfOvH/rH0LQpNI6sC/rBUA4l+R0oHZS3TXcvpn2acQyoAEAanLVa8fey75ZyHBaXep87RI1ycQao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270033; c=relaxed/simple;
	bh=yatFOlQEHKM1idOKtsPRhNKJVegoQq4WnaecfRgvFIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkVzaydvelN7oErFPOu/Q+9IqWJaPpn4c9sMU8DvBh+/HLE6k4dl93363iIx1+bNwS36PbRe6klqLNeGcpPpggk5ah0m8dILCkMF5XG1+odTgOz3IadxqJa/aej0k0ABRuLqUNJhIpgvF8kCq8DFKfDPmJruJx3N+L/uh8wD50M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIXp1dPo; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIXp1dPo"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so774389a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270031; x=1790874831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s03RzckkbfOoT3ESdTeh9le+Yb+Ao44F5P5+Eyv2U3o=;
        b=oIXp1dPoeDTbTCUB6HkskrDERRFI8tkIwZ01V9/krgpGIg/vAYJHdiyLt8rRuq9a2b
         vl7q36QgafPL6co1wBx2odfaIjdvlkpT7FhKx/PeWd5SXWCgWmsaUgOG7yWw2T+lppqL
         ZMQEwPyFD5YS4ty5r1eYTd7csVnd+gF8KMV7OlPcXYNx0ujPXe4DqH7X79dAWWjw0IuI
         8EdtFcNSV07P4YlSyAcSw7XFfXvvTClzSkn5nr6P+1QCTxZBl3316B9TAkNQTXt77cQK
         7xTPthbcrFAzPQaGYp37iqcxNFWShYKBMC0ev6d4iFAK5UqGaCr5IVPKsbsYHKAnyUuy
         V3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270031; x=1790874831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s03RzckkbfOoT3ESdTeh9le+Yb+Ao44F5P5+Eyv2U3o=;
        b=1DQY6wvQqX9wIc1fYp/l0R0lNLGhLbOQuxImn55pEHAz5w7QmARgR6uYjUOx656hWI
         QETELvAidgATPakmtp2wV1+34qqctXik0kB32Th4djsy4VF2KAQG6ocpmbiWL7wCkZUv
         xS9nQ13EvodX5y+mDUJv2Kk+dM79e+ZFF/gayBQcTHO22Jl380Gmm+WWO0HIZNJphD+H
         pMaRlAocU0A+qZhjTnwjSaDeJlFN1ZT8ysGoHJwhEEKMt/uI8S5o4XhgHoRtYjo9tuy4
         ey1BMbeW57aalAbcMSPY6S/PvwZ5yoiohvb2fo+g71m5vUmJFGAbupHsWqLqr9O/0mLg
         BNHw==
X-Forwarded-Encrypted: i=1; AKwUvBxxKxNfOM5WE9mUJ/YTRMCDyBMLdEt94DxG2/pr7/ASyyHs084EQ+Ff7Zk2i0Es5fwV0mCcRtXFfIbRV08=@vger.kernel.org
X-Gm-Message-State: AFuF++mPjfPCfa3rismW2EAq6WFwdb8nrki1w/PpprW0IUhpvKiAwofs
	uRBVW7h7ELNb3iB6fcBxiD/y0h1vn7nwjJZlGcDsZ54xLmUlH1RPVPLS
X-Gm-Gg: AYBFou2ijiXp/3KM7RwmpGTydYwK13BQ39dLU+9Qo4h58fNSrTN3+ASthi8WExBPSG8
	AcBitNJWCnmHk2WIlTYoaGomUb6IirtOZ2JYd+fR0Krb5r42BYm2RG1/++nBxiZ4M3Ve/fOKqRk
	ogxq76NLodSb4CQQkf3S77l+rb4b5klIcEzobAqYdu77Th6BJ0aox119VMFRmohy+e8KCQRWSzJ
	OMDvcXCCmodwlFHt0GCKI+Vt8qYaWOhv34eG19S2p81v4t2HmreNogZ6awXzdrA4vCJmYXGd1VW
	N8xOhjk3OdNJ6nZ1FE+Fz4WpslUXB43GDBafG0uf3ECIuEAzuCCRGZ7MujA7XeVKiNIJfXjqrS2
	OWt63r7bKFy5NydshJYMKq+w4cDyWqjnLtddoGOk5kHLZ7bqW1/pPMF/1vGNfs/BBtwbRf5CGqH
	ZEPY1+pAb5OAFRkB4k2tz48hAOEXxTuyYUuyBDXMho1QA1yKOlWR8lRttoNwRA1Q8oMIpXzPDVu
	T+hSlbko+XdJ6ls
X-Received: by 2002:a17:902:c40e:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2df7e0069ecmr24891975ad.64.1790270030888;
        Thu, 24 Sep 2026 10:13:50 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:e904:a39d:67df:e3c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f965esm30940275ad.75.2026.09.24.10.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:13:50 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	Artur Paszkiewicz <artur.paszkiewicz@intel.com>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+75d7e96ad03ac2dbbd9f@syzkaller.appspotmail.com
Subject: [PATCH] md: take reconfig_mutex when enabling PPL on an inactive array
Date: Fri, 25 Sep 2026 00:13:45 +0700
Message-ID: <20260924171345.75894-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

consistency_policy_store() sets MD_HAS_PPL for an external-metadata array
that is not running yet, without holding reconfig_mutex.  But ->pers is
only assigned after pers->run() returns, so "not running" also covers an
md_run() that is in progress under the lock.

If the write lands inside raid5_run() after log_init() has decided not to
set up PPL, or after a failed ppl_init_log() has cleared the flag, the
flag ends up set with conf->log_private still NULL.  The next idle pass
of raid5d() then does:

  raid5d() -> handle_active_stripes() -> log_flush_stripe_to_raid()
    -> ppl_write_stripe_run()

and dereferences the NULL ppl_conf:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:ppl_write_stripe_run+0x60/0x1320 drivers/md/raid5-ppl.c:538

Take reconfig_mutex around the update and refuse it with -EBUSY once the
array is running, in which case ->change_consistency_policy() is the
right interface.

Fixes: 664aed04446c ("md: add sysfs entries for PPL")
Reported-by: syzbot+75d7e96ad03ac2dbbd9f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=75d7e96ad03ac2dbbd9f
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Notes:

This differs from the NULL check in ppl_write_stripe_run() that is being
patch-tested on the syzbot page: that hides the symptom but leaves
MD_HAS_PPL inconsistent with conf->log_private for the other PPL entry
points.  md_attr_store() has not taken reconfig_mutex for every store since
6791875e2e53, so the store has to take it itself.

Testing (QEMU, KASAN, x86_64): one loop assembles raid5/external/ram0 while
a second loop keeps writing "ppl" to consistency_policy.  Without a delay the
window is only a few microseconds, so I used a debug-only patch in
raid5_run() (clear MD_HAS_PPL and mdelay(50) before log_init()) that is not
part of this submission.
  - without the fix: the syzbot oops on the first assembly,
    ppl_write_stripe_run+0x5d in md0_raid5;
  - with the fix and the same delay: 100/100 assemblies, no KASAN report.
The unmodified syz repro only ended with -ENOSPC ("PPL space too small") in
my setup.

 drivers/md/md.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63cb3..5b2add94631b 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5884,7 +5884,15 @@ consistency_policy_store(struct mddev *mddev, const char *buf, size_t len)
 		else
 			err = -EBUSY;
 	} else if (mddev->external && strncmp(buf, "ppl", 3) == 0) {
-		set_bit(MD_HAS_PPL, &mddev->flags);
+		/* md_run() holds the lock until ->pers is set */
+		err = mddev_lock(mddev);
+		if (err)
+			return err;
+		if (mddev->pers)
+			err = -EBUSY;
+		else
+			set_bit(MD_HAS_PPL, &mddev->flags);
+		mddev_unlock(mddev);
 	} else {
 		err = -EINVAL;
 	}
-- 
2.43.0

