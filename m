Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478839;
	b=Al4YtHm5JxBgMU1VlqOwUD+OEQOa/lumlqporwZ0tX7AjJUCwjhhxLltMNkKHnPtYDXD
	 88kIgoTEZku1YdtyMyb4GlWQF66kKW4zfNS4yrx6+5UAwTh8bPvzUKIQeJRkMHoeu3Xdq
	 1Agkh2AE2z+Z0xDd2e8q9T62ue9wDfQXe7WKRLowGyP0WDE34pAlv7+OrqosezW9HdUOI
	 m0rhGCkSYMh5JWGVBVBKlNRwHppJJgQJCAcQ/eBEDvdFdx3bZO9ZQ/YZam0c2gPooyzSM
	 lwx9d2OhoSoAUKkNmdEIEr5b+ykWA5zBqXhUoS8464lmyCVwFzLk2NYQ0ITkyjjRCxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EF7KRxBo0qNjwVf72fb3/RBlZOqXFYYSTlSs7Me9Vk0=;
	b=GjUIUC7Uog2/7RRMfZvgMfPf9uog5NFT3ybfCU42FNBM+quojFpoOB3H1VHAN5jfkFJR
	 DviXRJkfiTT3k2H6tH9yN1iowK3TGvo6N0HXhIZO+ZKTggLMtMg4DBWLfYyzYjHbqvXhU
	 v2GlBNGvOhWjKInnr2xyeyGt+8UTwBxD5ayGrLIdUS7cEjjz3qqipdfgQ2k0DVw9jS/uK
	 HEmoKi5EaDyOT9mC8qHZXQ+EOOCYBfMSDtxecrqp0+DkPK7pq6RuswHUGk6tSUvE35/Go
	 jZjFsP9vry/cjiFJG+HdFF4pq1MqCGeY+zOk0lafiw5NkGeG4PY6up1fdLdB1xTzgKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=BZ0kacbc;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49952606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49952606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=BZ0kacbc
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f2f2edb19so335123185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794478837; x=1795083637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EF7KRxBo0qNjwVf72fb3/RBlZOqXFYYSTlSs7Me9Vk0=;
        b=BZ0kacbcCRVq6LBGBfa+HzANug4uNF5z0Lf8jwfzYrm1y6NYl9QHzLqnz9KNipWQWY
         nTZnUTi006r+tN2LBDLQNShf+oemvUPDqVuliBF+QIuyPx5oOqsuwbXLhOiC1CfSgcB1
         2Aq4jnAuQOsdy2mcuDvEVQRdXWpwVghQ7pJi24Uk7RGBGO1QiPHCslgbJpZ+IZwNNKCp
         mqOxnrecpPgEsRvQD3XCt57xznz7iMIvpw9KcteBARSdGVmxQJoLBvllPC2EEqBThiJ3
         laJ6SW7CT/viIhZGjKcCbeb4KTZAweFxs11Lo26Jpf3BVtEBCc7rSklk+mmRR4WLEk/0
         iilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478837; x=1795083637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EF7KRxBo0qNjwVf72fb3/RBlZOqXFYYSTlSs7Me9Vk0=;
        b=exFexXw6d5pg27PN42vHtT8MoXm9mtchRuiIwfq+S+1k2RL9BBC0yAHSxTy3ZxQTwU
         y6c8xorE/sgUnwv5O66aGDXRXkVzMDdB+3B8Q20kQqe/Nx2LxFUd9Z6CUSnB+Ozu7iW7
         ZeixjH88ZcHm2cH/Rpv8YUrIMqphhlpCJYIsUMyItFn6+aElzZkcRzo4YJ6vQxpuj7zx
         FOXjyuzyE4b7nsznJ3X2LPtXycs7hSmMycMSa9WR/nftq6aF/lTzyLgFYId35t3Cuhci
         a9GfB39d0vUjAT3GLe6BQTBHkOaL1mQ/qmhuFe2cyy1cOKrHAxLpcSL+zcQyTOxQAtzH
         NLhw==
X-Forwarded-Encrypted: i=1; AL+hErFk1Pj6xi4uuV84e0HxObUrJXGZZxPOyz0/FpN+wmDqyDoL1ag2OuyIBCnuyLU5ADZOwJ7veN7oA5NfHac=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nb9pllp9LRwjj2KYnC5kEcwOCwjGLBozVHakcqAh1z09cV1Un
	LxPL4mZ+98n5/4152luB58LDn6HR4SM+QrI7T79JtiqhdJFQR5GY0VNZE8hFTzMakg==
X-Gm-Gg: AYBFou0QlhZx0k5ajibHd2LrrxIn7OsjG94x6vfmsybisiTpS01osjoMOeVoWJd+mpr
	75dcnYVUJ3uDUfrQvHLxsMUt8lMvxu+YtIUiQv+yXXVT8PqPUuK58LtFw+5HWN4Dhm6nHYDvyiN
	nmJ1LHuQMs7OUMAEgYnHq4P53n3jI57LVPHGlsq3MKavW9oni7DnsRDVTfCj65Ad8PmuTeBEMiP
	hZKqoAlwhpeZXNe1Hk3yuujSNFmRSFxZk+8ZgGGbpy6Y1/xendcFZdxfCT5Z9lCGVmyoKDi/G17
	1kfTM8W2/cipPfqRrYAe09qFeB96VNfs4gu8Azsj9/Q0RqcunoALkYbxfrMjntQ9Y4ujdgj3ela
	cPQ/kyzOdCmmDRctxsyx57bfQuL8poRBtI1hpi3a/byAVgMxEUofIMNBMb32+fRpjCWgDVMnov2
	l9EmI8MY3MO9z5nKWrdtdGdStWL1ovtTRol+js7T4/EU2OqKYXlYhr+IRnnWvjEQTcR12nrkeLg
	WAU4/KWYF0l6FYqDtZMxo35iLzXmD48A2Igl96apXhxsT2JN8ilqt75Y5hHxaSd7+XstoxzgQxB
	DwW87/SGl5Msy02NT4FGMrxxGEWzBfAPqwwdUeMFI1GP3qpZd+b2JOs6947GJatF+MVtyKnLKQ=
	=
X-Received: by 2002:a05:620a:4412:b0:93f:38c7:64e1 with SMTP id af79cd13be357-947affc99efmr842215585a.25.1794478837209;
        Thu, 12 Nov 2026 02:20:37 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7a8348sm691143785a.26.2026.11.12.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:20:36 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] xfs: fix f_bfree underflow in statfs()
Date: Thu, 12 Nov 2026 05:20:18 -0500
Message-ID: <20261112102018.3922571-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit dd324cb79e54 ("xfs: refactor xfs_fs_statfs") made
xfs_statfs_data() limit f_bfree with max(0LL, ...) instead of
max_t(int64_t, 0, ...).

However, the value is an unsigned difference, so max() never picks 0.
As of now, when the free block counter is below the count of
unavailable blocks, statfs() reports f_bfree and f_bavail close to 2^64
instead of 0, and df prints negative sizes.

A similar issue happened before and was fixed by commit 237aac4624aa
("xfs: ensure f_bfree returned by statfs() is non-negative"). Perhaps
the refactored code needs that fix as well.

The issue can be reproduced on a new 2 GiB filesystem mounted on /mnt:

    for i in $(seq 3000); do head -c 65536 /dev/zero > /mnt/s$i; done
    dd if=/dev/zero of=/mnt/big bs=1M
    xfs_io -x -c 'resblks 100000000' /mnt
    for i in $(seq 1 2 3000); do rm /mnt/s$i; done
    sync
    df -h /mnt

Before commit dd324cb79e54 ("xfs: refactor xfs_fs_statfs"), the result
is:

    Filesystem      Size  Used Avail Use% Mounted on
    /dev/vda        2.0G  2.0G     0 100% /mnt

After that commit, the result is:

    Filesystem      Size  Used Avail Use% Mounted on
    /dev/vda        2.0G  -64Z  -24K 100% /mnt

This patch will compare the difference as a signed value again.

Fixes: dd324cb79e54 ("xfs: refactor xfs_fs_statfs")
Cc: stable@vger.kernel.org # v6.14
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
The resblks ioctl only keeps the reproducer short. The same values show
up after filling a filesystem, writing with O_DIRECT into preallocated
space and deleting files.

Application impact (Ubuntu 26.04 user space, XFS root in that state):
on v6.13, "apt install" stops with "You don't have enough free space in
/var/cache/apt/archives/". On v6.14, it prints "18.4 EB available",
starts the download and fails with ENOSPC. GNOME's "Low Disk Space"
notification is sent on v6.13 and not on v6.14.

Tested on xfs for-next: with this patch, df, apt and the notification
behave as on v6.13.

 fs/xfs/xfs_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 5a06132aa384..42be6bd34d43 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -916,7 +916,7 @@ xfs_statfs_data(
 		xfs_sum_freecounter(mp, XC_FREE_BLOCKS);
 
 	/* make sure st->f_bfree does not underflow */
-	st->f_bfree = max(0LL,
+	st->f_bfree = max_t(int64_t, 0,
 		fdblocks - xfs_freecounter_unavailable(mp, XC_FREE_BLOCKS));
 
 	/*

base-commit: 48326a2382d80715475d10ce98734ac65d2d2150
-- 
2.53.0

