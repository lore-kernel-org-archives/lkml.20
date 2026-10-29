Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248049;
	b=gVxqS6WpAiJtBvqrGRVmVphJhiIrJ0i0h+/8eiXqPSraNMt0oE/qkD3cfFLvS8eV1YIN
	 TGIvtwwSMJ9C4FxyJG8gALxPbazPBB4GuQbYeWvlorEBJm0/2eUSPg1Y85sNBYfY3te3+
	 jfcrE3a09/Mnc35G0QujzkIrM279KzKdcvHUHwCdXEnlRigWpCIPZLVx7Ac0VODsM/kL+
	 bQE9hS0S3cdn+11uYT5GevlUw2mc7HFtwE+WLl8V/aSL22ycXcF9zgPU6LpE4YS9A2bf/
	 Po8yAKY2xY0JVtuCGLcJ68sH7VlTAbzgl9cPh8TetQ3/7e4Y/yHvPVx15f+O6t5z5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mxbVMUzWax0uAxNX40g1OGro32Jp/gDaHDkDHqxdT/w=;
	b=RUblilPjG/O2gFR7j+WkE1JCn0uGFCG5KkgAwB1WZwdtQzn1kZ1JJ5s4y5XhoHK725ax
	 WLSFJ+9iCpID+5eX72/uR2LcVtNhqOR6fTywGhYrx6LiH7bVLiCS2uE9PhTKUAvPX9pqz
	 Rkn2MTxXm220akAlwHoEg3F9esQgHi54gf5FbNjV4+K0UbZeTsTHfVRC8F3u0ZeGAp+9Q
	 3qceaqW7383MelLRcLdYE+1s8h0cGD0ZkfeoGiDsAq9wBKHL4etTrp6DhUU2cbb8m86qq
	 xXAJdXpMMAGll8tvdwvAX/woy8ySyO2h7ODIYWSm5Quh2iyHVX9wzqacBc+bkHJW9sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sKpoZlHk;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CF1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87CF1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sKpoZlHk
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso11072825ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793248049; x=1793852849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxbVMUzWax0uAxNX40g1OGro32Jp/gDaHDkDHqxdT/w=;
        b=sKpoZlHkZAGlA4AwBctxXproaGE+nyIl8R+Z/dyRTS0KQYMudvu1eJs9+hOE7Lv+6f
         wL1gY3b6iQrjgY9d4Dr2rXdBYBa+y9NF51ifbRWFVeKfZYSo3PQBLgsWwj16d5dAEMHX
         7oVpqzqXpxSg8cyA2apF9+EyFRbrEKiIGpnzMXiL8xNQ5E/M7W8XtnIrNP6fzi+gGLz1
         7JAEhej67M/nISnTeQiI5Kh4m90uQ0KGaT+wyfTuj8cXTp7BjRxj0mdM0G50rL8xyvA1
         N+a4N7RN6GwitcQVOjHlw0OU9fam+Nt1/dtT6ivdPoVxr5wjFDsylpnl6sBn5E+BjpQ0
         Qn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793248049; x=1793852849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxbVMUzWax0uAxNX40g1OGro32Jp/gDaHDkDHqxdT/w=;
        b=NpEjb/n6fZcSTjoxrzn4dc3z5JW3dnL3uiiy5ylJPtzBty7YFP7U4A29zoM9aCHqK+
         ROF1/5tv+QjNwcQ3UpDZxeq+fO+RRybYP0JIgDOYXfN19i4BciyuRRii5SvX0FncApzJ
         jQ7JU4dTxtt62evfdmolD/jgtD27MX+k8SUlnvtqmaokX/z2V8GVtQVlDD/amlJPypRq
         Noj+4rM27y/eg6wOG0Ch3stXQlIay3l7/Wt2GeI0RAQaBNUUvYhSccoD5O8UkV59zTAN
         5x79g3sxIRnelSD4ztOQkQKcHsKymFMvFSYx9GwJL+yLLzCqUk/sykXjzTGxwBvpfBMO
         b7Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwjBVkew++MyiiWNKrTIZDM/Yi8Y6VJsrElYmbPkh+LaybLGnLBKqr3V1HYuAI+T8SlQbZfZrZ8IY9mBfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5KI4sCX1rNfkmQeJKy3hZZPxIVSEPBTMP0VIOE+Qws3ly3IQb
	f50r2rs6B3r6prI/nu7obT87GANUyp7gpSNSxIlOzzoBljPAjO9xuooJ
X-Gm-Gg: AYBFou1ps57+xCLm9kI2826vQAh3CEBmxYdjI5ZWOx5yh/wre3xOoGGQ0yWMGo58/nf
	+qBkncVSYhkHFdTrvNwtubjx3JBTIHzDbCEXQ8NLBSw2QqKjRxqUarklpi3QgS6Lw9i73Y7iNR6
	wILmRUXIXq9vccaOPlRNtgXXb4FAT2O1u2lwPFKXC5CSB0LDmkJRQsyoSaPSQNdn9oL0in9qVdY
	eMRDi/+lsCm/lTbMp2hALIHMBj00FVaLJhwb2CZMgA37qKyi6wMFG+D6ve4tdbw82cT1iMYjo/4
	NWXk+FVmnlp7MHzd0jra3QRKAyBM6kBpe1VXidA8rEslyQibBQXj3dmMGRJLYRdVzYyoMPlQ7Zs
	3QS3mdHqFSuqztXBnUm2gawjp38xihC8fVMVOjMOg9LsHml5FgqRCUUpKGR3huGrPBiDGdsB7AI
	13hYUB9N9vox2AR6KGHXMeJdaWkirrwuENOUnkQ6pLmeeqwCVvrnr5noFo+3j2SNu8vX+804nCH
	oU7RgEt2dArrTsROFdH/0EhwkGXUJ0dzPj/To42avSEsSlPFsaI4YB7peKiYSHNQbNIvqdbpXVv
	J3qUWXB8Ez58iegGzO8kAUtbh8PITAwj5Tk2MfWhezajuxFq3bPUov0=
X-Received: by 2002:a17:90b:37cb:b0:3ac:a11a:7c91 with SMTP id 98e67ed59e1d1-3ae581bbd4bmr3387839a91.44.1793248048779;
        Wed, 28 Oct 2026 21:27:28 -0700 (PDT)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e898317sm2010846a91.16.2026.10.28.21.27.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 21:27:28 -0700 (PDT)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haris.iqbal@ionos.com,
	jinpu.wang@ionos.com
Cc: jgg@ziepe.ca,
	leon@kernel.org,
	guoqing.jiang@linux.dev,
	gi-oh.kim@ionos.com,
	aleksei.marov@ionos.com,
	lgs201920130244@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] RDMA/rtrs-srv: fix use-after-free on sysfs setup failure
Date: Thu, 29 Oct 2026 12:27:16 +0800
Message-ID: <20261029042719.75868-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

These patches fix use-after-free bugs on the error paths of the rtrs
server's sysfs setup, reached when a client's info request arrives and
creating the sysfs entries for its path fails.

Patch 1 is about what remains after commit 5b7437339011 ("RDMA/rtrs:
Fix use-after-free in path file creation cleanup", CVE-2026-64033).
That commit reordered the cleanup inside rtrs_srv_create_path_files(),
but the final kobject_put() there still frees srv_path while the caller
keeps using it and frees it again later; the stats kobject has the same
problem.

Patch 2 balances the session device reference: on these failure paths
it is dropped without having been taken, which frees the whole server
session while it is still in use.  Besides allocation failures,
device_add() also fails when a client sends an empty pathname, which
patch 3 rejects.

I first sent this to security@kernel.org, since the empty pathname
makes patch 2's bug reachable from the network.  The conclusion there
was that rtrs is deployed on trusted storage networks only, so this is
an ordinary bug and the series should simply be posted here.  Thanks to
everyone who replied so quickly.

The bugs were found on v7.2.12 and are present in the rdma for-next
branch, which this series is based on.  They were reproduced with KASAN
under KVM (soft-RoCE, rnbd mapping a brd device) by failing one
allocation at a time with failslab, restricted by call stack to the
sysfs setup, and the fixes were tested the same way, with lockdep and
kmemleak, and also with CONFIG_DEBUG_KOBJECT_RELEASE.  The empty
pathname was tested with a small user-space rtrs client.  The
reproduction setup is available on request.  Failures of the two
sysfs_create_group() calls were not injected, and nothing was tested on
RDMA hardware.

Two things seen while testing are not addressed here:

- The same pattern (a sysfs helper putting a kobject whose release
  frees an object its caller still owns) is present in the rtrs client
  (rtrs_clt_create_path_files() and both its callers) and in the rnbd
  server; separate reports and patches will follow.
- With CONFIG_DEBUG_KOBJECT_RELEASE, a normal map, I/O and unmap
  without fault injection triggers KASAN use-after-free reports from
  rnbd_destroy_sess_dev(), run as a delayed kobject release after the
  session it uses was freed by rnbd_srv_link_ev(); this happens with
  and without this series and will be reported with the rnbd issues.

The bugs were found with kbound, a research static analysis prototype,
and the patches were prepared with the help of an AI assistant, as
noted in the Assisted-by tags; I have reviewed and tested them as
described.

Yuqiang Sun (3):
  RDMA/rtrs-srv: Do not free the path on path file creation failure
  RDMA/rtrs-srv: Balance the session device reference in sysfs setup
  RDMA/rtrs-srv: Reject an empty pathname

 drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c | 37 +++++++++++---------
 drivers/infiniband/ulp/rtrs/rtrs-srv.c       | 19 ++++++++--
 2 files changed, 38 insertions(+), 18 deletions(-)


base-commit: c3e8e9451e6f1b69f685b75e0fbf14f3d0fb2539
-- 
2.53.0
