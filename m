Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F5833DEE9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915194; cv=none; b=tlpCU16vU09flT94aBtLV+qXnE0aREDI3snIo1HhB19ImWxx+abVD0dMN+jAqBg87lY6JS+KForJxgyUEdd/O/sNJNxjKZDYTHpPv5H9+T7mUcLclbSDtD3YnJVE7pkNEbZef8LuXDRhwUzBg3dD1QYo6ESp9aZHIo4p99lF+pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915194; c=relaxed/simple;
	bh=Qsz1ondFtEZv9xSn3042JC36WDtLaOsnrBeBLxf3mF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fK8BQI3Jh5BQXAw1T1G6uyaxF0378PncTw48CFwwmjupQ3oo2ri7Iapq01hiHnybFlJ6ivzUVzHV+1DSmoqxG2spUD3a17ADcwfhpDWG5QicXU3s2pVHOZM3rmLkFi/B1tHecDmjB5BOPhPbATZSfSpXCIJQSjWk1JI7+X46OEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8EfumMi; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8EfumMi"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6d43df6bcso223579a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915192; x=1791519992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNWgHWFntjdcQwxESc9utnvqb5FHGViZ7zWGBxebvww=;
        b=o8EfumMiqpcNLpY5Gy3w0w+Y3hEYjlMm/VIuIXTKFkyCuP/00AmM1yS8ecfV1T+gsT
         NswW1PTZgbdDHW6c5MkaEEcVw9a7RwaJvpz43aIXcCtvU8Je5HwV45/7cE+fzMZ5O1f4
         p+vZUY5ZrKmM4aVAySKWJ4g91vN4M1iqVxVJQI5slU2HluF5JsMW3qpkhKin1r5xVMYN
         vk3WKOtpqy4t3X8+vgBZf7IVdo993OSe5ab7HmYXv78bEIyjTam4b2i4TIiJfZQ6QfUj
         XUr7cZuAOvI5j4Twu/e+aiZKtVs0xj8fw3O5b3XnB2NycPv4awMR/WWU2E54VP+x9imh
         KM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915192; x=1791519992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNWgHWFntjdcQwxESc9utnvqb5FHGViZ7zWGBxebvww=;
        b=Dv7fOEovFx1DKYXs3pOD96EGzRzHra/iXixh0hs84xiRGVGLtwELP4NjMgzlnJt6Y/
         wWgy1WYeCGnQQ+38RktSD2Pq3E1aQDNE+3NUKjNCneS5Hx2HzCpO8GyS900VO4mtYERe
         Ewjlek2IK5Bjq1H2QV/+L3G25rpHZFw5HnIbZqNr16WcbgFFlWlUl/r/tKPzzD/i2GDJ
         Kb6V2eIBHmXxJP5WoukF+kM+69iYpOf/JSbjJKfsZJnQFBwhZT0bqXtB+b07hwUgdhwn
         sIXUma5Evla+r56450bKsQL0flYb1TY2oRdfBwFzJsebXcQ4WV4gkmVCvxKYq9B8m4vt
         LAow==
X-Forwarded-Encrypted: i=1; AKwUvBx1cfg31QTYB/WhSwaX0uvBBSD27bvKd4pNdziioRyAKssplJU33o5o9on9yjOloS5MJVkazKAs++gWKcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX9a9SJ3TFTi/i063sgcKGsWJcdSdvbrEuiKJGYih0x8EesIRa
	OR/ZzV5IjnlXMZJZKIIQFX3eoySqIKJtNCwSlDaAlpjWHlhunynCBo9N
X-Gm-Gg: AYBFou1LxXC7+wq0yPq/i7ulIK9GS4Vj48mJ4SDejGEG+yNA1NxbFnNJK7CQvMBB6+g
	5nNtv30PK0JO86TyAcJWToww0NhNeXLCbeWt/ILRrsF91yovp37MV1AmYt/Ejd+0iZ3YKGUU4K0
	+P85kJJ206kG6SfnmTHTWvN3T87MJkVZNeDjNIhXQ6Jjx2OeON33SVOITeU5+hpEwxoFCAYigv1
	7AN6cpo0aIW49pxtfOJmMYZgoRjKdYd6HLs6HFargeK/Wk40BquR6vW+6amu/6s6nlYxDQOVoak
	l6Dkba85AQEppwF9TjPMu2PTicxQX+aCMcSeeLx11aClRqK5IQ6iv39+p94I+IpJcqtMF4TdQTb
	zpeJ7RFqeKCQqjUSrzxK8fRVlL5KyQBaLdE9OIULqZS2tvv+WroMRHLaM62UZLGt5RnBcKDpVs3
	KuPmc7yTfq7sEGM2arnS/+NhYoBnjcodXQtR8+FmF2wW9c39TPQUq07U1HAJGxJvvsTrMG7bWyv
	8pGsSDLuZyFPjeHDGJabz02QUKS7td3fvpTJnNiIBmhlDrEdxq9GWDvTJSX+4SmJex1hCI47Ovq
	wp93xvcZyzCPwqD/G7//o3oA9JTv0CBIz29bqD0JhP3DhsfPSmhaVRdmZFs=
X-Received: by 2002:a17:90b:2684:b0:3a0:b809:b9e7 with SMTP id 98e67ed59e1d1-3a6ce5a1ea0mr1461129a91.4.1790915192125;
        Thu, 01 Oct 2026 21:26:32 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5ddb51sm2205054a91.14.2026.10.01.21.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:26:31 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com,
	syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH RESEND 0/3] udf: fix double allocation from the unallocated space table
Date: Fri,  2 Oct 2026 12:26:24 +0800
Message-ID: <20261002042627.1677228-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Honza,

Resent because the first posting went out without threading; nothing
else has changed.

A filesystem made with "mkudffs --space=unalloctable" hands out blocks
that are still in use, for two separate reasons.

Patch 1: udf_table_new_block() keeps the extent type in the length
word, so an exhausted type-1 table extent (the type mkudffs writes)
survives as a zero-length extent pointing at an in-use block, and the
next allocation from it underflows into about a gigabyte of "free"
space.  Filling a fresh 1 MiB image with empty files is enough to
overwrite the reserve VDS and the backup anchor.  This is the double
allocation behind the two syzbot reports linked in the patch.

Patch 2 checks the table once at mount and refuses read-write access
if it is damaged, for example by the bug in patch 1.

Patch 3: when a file's extent list ends in an empty allocation extent,
udf_next_aext() returns 0 with its outputs describing the continuation
descriptor, and udf_discard_prealloc() frees that block a second time
instead of the preallocated blocks.  On a table the block is then
handed out twice, and the fsx runs of generic/091 and generic/263 read
back bad data, with or without patches 1 and 2.  On a bitmap the
preallocated blocks leak.

With the series, fstests -g quick (2 GiB images; KASAN, UBSAN and
lockdep enabled) passes generic/091 and generic/263 on a table.  The
remaining failures (generic/131, 360, 563, 634 and 777, and a hang in
generic/346) are the same without the series and on a bitmap, where
the series changes no result.  The reproducers are below the --- of
patches 1 and 3.

The series is based on your for_next and applies to v7.3-rc5 as well.

Thanks,
Matthias

---
For stable: patch 3 builds on the int return of udf_next_aext()
(b405c1e58b73, v6.12, also backported to 6.6.y) and applies as is to
6.6.y and later; older stable trees need a trivial adaptation.

Matthias Goergens (3):
  udf: don't let the extent type hide an exhausted free-space table
    extent
  udf: check the unallocated space table when it is loaded
  udf: leave udf_next_aext() outputs alone at the end of the extent list

 fs/udf/balloc.c |  9 ++++--
 fs/udf/inode.c  | 21 ++++++++++---
 fs/udf/super.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 102 insertions(+), 8 deletions(-)


base-commit: ba5855e74bcd761123e39f4708834a0015a74a8b
-- 
2.55.0

