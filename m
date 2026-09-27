Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73D1D5174
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506633; cv=none; b=eNVYg3AlrV5u7TTe18VhjvhpHnS8Si38j4oyhrRJNElLm2djHB8KM8sq4kGtw0lRJu7DwHGAa1Tm0MtrouB/tiAexFL22b8EDvjQkGiAg/J7IcZu/u9DLymFK5f6lvaAkXGv4RUaHpRdZ32kW3kwX+nHqoqr2y+6hfO/Sawjo84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506633; c=relaxed/simple;
	bh=SPjFaC6/RkWLmnwuGm8C3v7Hw0AwEyc/tT1MEMTXidA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZOVlHKOKGf5E3zHvCSV0lH0qXolOqWns/8SdsT7aHOu2Wmr0q0DETS+EW3+qLwaKLYS0xaeVWZW3Hmlf7KoI2jXq8cAkyl66CfReAKnJXh4bCfaxkIFai8/cdvl+9PrH76jdJImWRldmrM3F4Ssg5JrMCLaulgT3GtZ8AmOTD0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfChARLd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfChARLd"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6188so9326785ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506630; x=1791111430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+R/aN0NQXpZlislYam6PzD5CESdwdMKZwsMqtHvKmk=;
        b=XfChARLdgSLn0r9WM98WQnpr0t39MFrMtheOahgUbP/Kqe0xajG1UKWiqdVGZs1PRo
         fRDHUZmKkTzEggCB4Ei4c7SnGK3OGvv9A9EJAPwLRJ3sYjvlEFcLfNXrDfaIGVRttmnv
         I2u1/xgsQdkfTjE6vuW40gggnilwLsYU33L+EERoKxq2bRxXmMFq31csY5z/MmfWYuqb
         1jRD7E5tnVbd1PeX3X8JjbViVBp2PSKsdDy8gFHtfFgGbJQQkoY4nVnsU/DfV83QOQWI
         aEFYWW6IJhDe5CYpoe0qWieAq0J147aYVfA53xgXgCDJq7Bjs3pUsbQMxS9CF5F/z/Yu
         huIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506630; x=1791111430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+R/aN0NQXpZlislYam6PzD5CESdwdMKZwsMqtHvKmk=;
        b=ZSQYNJB2keFSkEH4LAPcnxFf8MVu0W3V6W/5vgGeYQ9F1OrJ0ZeLxmXcjkjdQAynEl
         J/TH83tEwk6hQaCBb+a3KlgCQ21dQWG60sbcqku7bJaeIAL/prNoffoRLrGIP1QzPWxA
         bnywW07RkoVBTMDZ0gTaU9lmiv9Gz4QEm6FI+1/T7hTk3NMKPpaYqTVG2j5ePzdiTquC
         J0xfwoY3JTcM1/NjZoj5bBgMTENddUb8ovbjJhHt/XCxC4GxLoxlzbUtJEzE81tX5LUA
         YCU5Ap8spn0SRVwnbJmDZEYGtyiY4G+xRc5PQzKO2y8UqqgIgLM9oC7ldyNA5nwLJFNq
         4mfg==
X-Forwarded-Encrypted: i=1; AKwUvBzJsL+RKE2MyCKB3iJUJO3l7kUJNX2VZ8DdZhiH+L9OEC7leCDLDrs/UulxvZbru6QaO+RQlOzN1Of+NcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpTIYskKls1AE3qmFNnL7YBIGjw/Mv/WOQFyNnzs2SMtTjMnft
	XLwpd9uQAkCXtFQbfL/3oJAva7c1hwpJAc2WPhP9iyCYUvctsyuDRoF2LBF8T34OCOyJzg==
X-Gm-Gg: AYBFou24whPCcu5PgGd87dsv2he1DIS4uIoyyNfkEEPiXM06Y/hhB3Ld/fWh6kdFvOS
	Nmdo6P5fOeBGRytCnfeFC0kQnOFgKrdwJ60ovHN+ui1wt84+NKFERjdIUrflkhTF73ijZP9qg3E
	m5IKri9vKfddbb1eqD1UTIZqc78798tiL0r3fDCtTWFe3OgoibC5ILNa8Gl7CDdIyGEJXbNXHEh
	GHmqs6NphTz6VdDD2POknVk2CWmM6mOkqFfbTpIlgQs+3vK6yu9uhZelbO6VyF1AsESELfO3pZR
	ZqArqPKS36KIH/WmPTaQ9RiDw25EHc/sLj1IzYLO1FNDZzfDT0mk1dlbGzvGxx4YS7wapk09pez
	YohhLjzrrGKPKuiuUHDN4tUCvAet1soQ/xDb+UJIb1+cGxujTiu2liq3jNlK3dBVv4s2/kA6d+I
	1sfuqfHMi+0Qh36suwMmDDwMCnpTsYmQgLirmOAfGQ6A6P2wxyfV4F4LRGjTjV6jPldozwKAd2y
	ptN5kzxZZJjj91UIYFDTJuRC/Rd+UdRDV7cdhYPvv3I+iNshPiaxZhgkpbszTy+pU0WBs04TMS5
	VrO2m/yMKoAmA3ROQNciL3y8Ba94y07glm47DYLRZubH7SmBJdZCXAVPUH8=
X-Received: by 2002:a17:903:a90:b0:2db:331b:e187 with SMTP id d9443c01a7336-2df7dd748a5mr79579255ad.8.1790506630003;
        Sun, 27 Sep 2026 03:57:10 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91442ef4sm28521145ad.55.2026.09.27.03.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:09 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ntfs: fix the undo path of $MFT data extension
Date: Sun, 27 Sep 2026 18:57:04 +0800
Message-ID: <20260927105706.3111333-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix two bugs in the undo path of
ntfs_mft_data_extend_allocation_nolock().  Patch 1 makes the $MFT
runlist locking there consistent: a map_mft_record() failure leaks the
lock, a lookup failure in restore_undo_alloc releases it without holding
it, and the clusters are freed and the runlist truncated without it.
Patch 2 fixes a use-after-free of a pointer into the runlist across the
truncation.

Both paths only run when something fails while $MFT grows, so I tested
them in QEMU by forcing each failure once with a debug patch.  The
debug patch, the test scripts and the images are at
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-27-ntfs-mft-extend-undo

Thanks,
Matthias

Matthias Goergens (2):
  ntfs: balance the $MFT runlist lock in data extension error paths
  ntfs: do not use a stale runlist pointer when undoing $MFT extension

 fs/ntfs/mft.c | 63 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 10 deletions(-)


base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0

