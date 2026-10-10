Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BAE4052A2
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629490; cv=none; b=gM3PSTcOMHoKKVwVVDK91V7fNQ7WhVYLh2w9Ud+BsYw0xlRo+dl1UYBjCZ87jLnnmIU3APuoeoHM4JJ40s8z8SPYnmbwk507w7OF2pcIZ+cLqXddY3VxLNBgGd+r0Sxv+/BgiOSSCPhLJeFGnzeOUL0vTdvejojPo1ex5mvmHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629490; c=relaxed/simple;
	bh=s0Fi+kfi7oO0PooCzIeRIQTCwIpI83GsMSHEMfr/TQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8NSJYxC6p36URZuN81xtyyUt95EZZg8K2RWbWMx54DhAq6aEYo1cPsP5wVqKmk51q0gmF3NkBCa1gRMl9PluB7z+wvFuMA5ZCb7HQX9JR+LZHsrg9fGTTy0bCHYvnAwd8MuuXVZn2QZ8S3lsqZKCrjXWfKmg827fb8qny0DPBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhKFXvRA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhKFXvRA"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e5e090746so54554566b.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629485; x=1792234285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WpPEfSUTmyAAHA+QHOcjQyi/MkcTZ3Ii+yrAHad9iY=;
        b=jhKFXvRAhx+8cFGR28Fkq7xjYpL7oVE1beu5/iJbWUynz5NrwHaHih/BM6kaHaGCy8
         fhhASRdj1tVd6sjsQJc72kuTQXt4qzVgWuKq2ORK69Vq8da/37YxBdUbDfjTA+3q4Y1f
         Gy2WzX4EQtc7uUEfA3MEl6ZAZiz7+3ce0OZJw4OmzWDxI/ma5gf+e8CQXsIG5Noio3k6
         ka5MPy0xVAhBkl72W1ZuR0q0A0dxDwAMTPD8t0EYBdCa2QzD5E+KE5aF+5SRB4+bwCxl
         73/V0TCc8d0/+vTNpjenWNyY/evk9utPRPDd1IcCJTsMSgoTtbB68Jo4jN/805/NWWV1
         YpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629485; x=1792234285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WpPEfSUTmyAAHA+QHOcjQyi/MkcTZ3Ii+yrAHad9iY=;
        b=E/0+nECaOF3fyC20z8e7PBZLvj/tqTNBguli7ENTUGxQtYNrW1EHBMy6zq7l7o38bz
         V7+Agb/yGH6m/ehbSowq+fX+F4ApGRMM4Bc9gQLGHhSBI7U6jVGi5PBR5d5Yj9t0P3TN
         1snGoOh+lBjwx+AI5dGTPFMvlg7TATz2Py7N5yNxxHD5TciKBskrx4HvvMAdVn9Zq2M8
         3yQq5yGrmrZLW0L32ShoPO+DswOXnn/U2mHu0OX+Dpz872+byHsgNvbp+ugEJOWQHqaK
         JMtolABJDrQ78vwNxzRwjAnZF6JDhanNeMhSRnEy/YHauMBqR5aLKkMg+YRmXg7W01cr
         7Llw==
X-Forwarded-Encrypted: i=1; AKwUvBy5GjzwHBTGkXvfAq1cPmy4czrlmKW/QS8UbKh2rNwij6pj9xYh/V8qkWNRtXr5XUMyJx4/a3NWc/POknw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW2s0QOZG6BKHy9R8IXtlfpg5w9VW/6PTdU4tX3zqQM0es3oxr
	Dla/b8JCxgRFTPnWZ1SEwJQBvtnG1nv1rII19FF3GhfhA0JzkJM/cR0d
X-Gm-Gg: AYBFou1TLu1MaYRNliANz7NYNzyiChCWeN+FiFu5eSy7m1z9LnWiRLKoNE6sPxg9U1d
	/NJ+ylXO4a3yTQFSvPqgEsfNoEbaw+tHdRib3fI5Ijb2S6Fwuz4Pi8Q50tiOUnzraDUAa8eVhGb
	Qm66pOPDGR1CfrC7of3BNgb2SkgEaxgDq74blOsvPX7cBrRrEyAQdg9rIF7PZbEZF8BQrBatGPb
	W5glCQ7NvA9ngnkELV62KRL2PG+baUlKSXQQIP3lPtgFc6o2a2/977YQliQzKczHptUmSyAUjVS
	imwfVEV3+G9AxMHUxRRZj9GjvIRaj3k9BdcO4KGAzBsQlDPgHYE3xNmPCjRwboGrTxP9c+pXgWE
	DWrifD8Y2snIfQNlmTyldN5UYvosEajSbzAZxuDxPo1ttf4COf+alJXB77/3bnt2CloXSv4Gw0j
	KO/ZN7hiwwAJGDYL11POfM8NqVsp6GUkNN9aBYhFgl5Yi/9JQxbOmnFyE0jNS0UiX8UQKasUKhg
	0kNHApJOtNX6K2boSWzsh/IKBhT6JVEfB2qRDVcA72ZPgtVjtvOYZB3UDf+7GJxY0U58ZmbXOgT
	gV0=
X-Received: by 2002:a17:907:3f10:b0:c2d:c6e7:9e9f with SMTP id a640c23a62f3a-c31aa081161mr481202666b.27.1791629485459;
        Sat, 10 Oct 2026 03:51:25 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766743sm229984566b.4.2026.10.10.03.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:51:24 -0700 (PDT)
From: illofspeed <volvo.mail@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] dm zoned: fix two idle reclaim problems
Date: Sat, 10 Oct 2026 12:51:19 +0200
Message-ID: <20261010105122.398-1-volvo.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix two problems in dm-zoned's reclaim worker, found while
running md RAID5 on three dm-zoned targets on 27 TB host-managed SMR drives
(WD Ultrastar DC HC680), each target with a regular cache device.

1. On a target with cache zones and no free sequential zone, an idle
   target keeps copying random zones into other random zones, forever
   (patch 2; patch 1 makes the resulting -ENOSPC back off instead of
   spinning). After a full md rebuild every chunk is mapped, so this
   happens right after a rebuild: the idle member read and wrote about
   72 MB/s nonstop for hours.

2. After a reclaim pass that ends while the target is busy, the idle poll
   is never re-armed, so zones filled under load are not reclaimed when the
   target goes idle (patch 3). Users notice it as "the buffer never drains";
   the workaround has been a timer sending "dmsetup message <dev> 0 reclaim".

Testing: the three patches were built as an out-of-tree dm-zoned module for
7.2.6 (the changed code is identical in current master) and tested
- on emulated host-managed drives (tcmu-runner ZBC handler) in a VM: the
  idle copy loop reproduced with the stock module (340 MB/s on an idle
  target, zone counters unchanged), 0 MB/s with the patches;
- on the three real drives since 2026-10-05: crash test, three 1.5 TiB
  write benchmarks, and eight conversions between single-device and
  cache-device layouts; emptied zones were reclaimed within minutes of the
  targets going idle without the reclaim timer.
- with a reproducer that needs no special hardware (scsi_debug zbc=managed,
  64 MiB zones, plus a 1 GiB loop cache device): stock module ~600 MB/s of
  read+write on the idle target with unchanged zone counters, patched
  module 0 MB/s:
  https://github.com/illofspeed/synology-host-managed-smr/tree/main/repro
Not done: a test on current master itself (only 7.2.6), and a rebuild onto a
cached member with the patches (the first problem was seen after a rebuild
with the stock module).

Related, not addressed here: the double-free in dmz_load_sb() reported on
dm-devel on 2026-05-30.

The problems were found and the patches written with the help of an AI
coding assistant (hence Assisted-by); the analysis, the tests on real
hardware and this description were reviewed by me.

illofspeed (3):
  dm zoned: back off when reclaim finds no destination zone
  dm zoned: do not reclaim a random zone into another random zone
  dm zoned: keep polling for idle reclaim after a reclaim pass

 drivers/md/dm-zoned-reclaim.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

-- 
2.47.3

