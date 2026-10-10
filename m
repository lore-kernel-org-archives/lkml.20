Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8D431E826
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648979; cv=none; b=PGsiTZFllohLdH+SNSdTb1loqBhmJZ97srmZBbtwqsVMX3zw6AD4GBiWSYzN97ajgBHeDybRveBqo+sr/+/omJMKyCi8NGU99PZ5+14XT0hNzEX0J1+/h13KygPveo0YHtjbsxiAYwc+NjvAk7BGasXfEelsqHnkt8MAAk2OHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648979; c=relaxed/simple;
	bh=16YEyXk/B0TCzFsLgGwxCmx1xaDVwjamLfZgiX5djC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpRRcxUpIqQxPdsKwYhWekJWrhAw86oaiq7Q98rccg/5YjUpe9fBVbaZje7Y5VOSkMMP1D1uDcGgjHfp82BPW2M6E42i4x4k141IpWxlXY2Wb+GZeF5opbjKfEn0hQsUr2daFUo8z6vVRD7PK1DIjoAcmoG6O8Dq5EqkgP2Z29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqsHlYbn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqsHlYbn"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e5e801487so125990266b.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648975; x=1792253775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaD8+619tQtKAuJuh7WJ/qRr66QK9jKC/1Y9XhlPbJs=;
        b=HqsHlYbnKbCHrIUskvnYIcuv3KrerwHrTaM/lU26JVYUAJMSKhItZ7JRK4ovlHL5J9
         XnAcxJE+g0KgdRbmXFNXvKtpOotzCV7kwHYfE3dpozclkks0ZWezF1raZoo+AHvo4lWc
         1jD+fHh7vd5zjGTPLtLynO6Lxm0coDjKcFWxLCgPrz4IfbQ+GXU02Ph12iiIicoT1zmR
         MPyINWYfUbDpQipO4fRbzxQ6+IaWsSXWuRNILoqBoQSlygc57riALHFu5B+S3B8VMt6J
         DrQyvhswqN9FeZTdVGqNR5V1oO4xTFOtIEd+yWQ40LEYHNCbD+jkGYNnnS9eIAqDIf0q
         w1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648975; x=1792253775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaD8+619tQtKAuJuh7WJ/qRr66QK9jKC/1Y9XhlPbJs=;
        b=SZNWhV3tOMtGF+bZvwCexGoQkHIEQ61UNZVvBSK6qFJkTf1HYPe6G8c5yOB1HrTcx+
         nZyPrkf9AftyVZylfYiR9vEepvbQ+zZ0XeuJo5LN4MKX3rVEFrsTn7z0qIbSEUg90Ubv
         Y/YOSDnVhVsy5kiZvytgOlddOwrb3vFn1f7da7JkuDMRSnpXk5KwJiS0YRaAdiIcNHOn
         mGfcsUpSYeDSzC8MDrByqsfLakwUpUzyulGjgmqvduhdBHnYm+y+0hkNhI0pU8rxemYn
         8ZL5O10ITwu6Yj1ICPCuwhoqE/rZAdkSRGDZgZqRhgUFAS10O//gwskfxDAjCgtWVW+5
         dPjA==
X-Forwarded-Encrypted: i=1; AKwUvBw7TJV3FfVnttkH7ym5XZkPL6ZAFtBbgEiqVb2YiUSDDJZYYgS5MPnGQXBrinV3I5J3OEJNZMmtXrdRuwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKv8nBJg5cNRzgY3te6is71Wcy6/6HDa3icoRBfvQ6a3FdDnYL
	f8rkJw7Y8vsMjXr0ET+Imz6IZ3l+JNgsi5ZY7b5mlC1Ep2OewpiLbQsr4VOE8tdyDuBhrA==
X-Gm-Gg: AYBFou1NTrRdtjJ/ZJwmTnJV+gvHtk0tHZoySrcWeSgXPCO8UIW/R8PlMYSD+aLPpoe
	2atCCJtv+WoiveUOlDE11x5ir+B5/bYyBqj5oFWIHikZ2GDBEdK4uEVFxat0q0BJjGOsEk6kYki
	PuCUr+a2D5UmluxXZwQ78EabfvjP9cDvufS81DTxyGHboUod9J22K+Zk7HWlkfvfZqA0Ju4YRNg
	hirBJ/qUcDYpGo0cbhtweFVgNXiIqGyj3w2c5ohQepmXOoaHHXBB8GUWUEX3N0T6+GfLVmHFFs6
	RtKWv8/war67lwLRr+NgjT3lN8ZvOm4iTPd67EscFvvpRBKzB1cN7xQhWmXhLg7T/DRWCOZheMS
	fkFdHm/KcPRpxlFhJjjUjMKN1wYOyK6OASefKVYFhnR0EfMhxxZSTx1l8SsphvF5YIIWJ6EjQxZ
	ozy7HVVAYecoq1IOEiP47aSsqT1mYUzQTt0jHjVYKPc52U9Xcyh8S8GtjmmIwIwqfJPwv3edINh
	oCqeP1Fu/jA+3eaQnMIb+WegAw/dDOBKpycgwRIQKOSKtQ=
X-Received: by 2002:a17:907:c0b:b0:c29:5215:b2d2 with SMTP id a640c23a62f3a-c31aa016eb5mr575858866b.23.1791648975142;
        Sat, 10 Oct 2026 09:16:15 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bd7sm261422066b.37.2026.10.10.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:16:14 -0700 (PDT)
From: illofspeed <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] dm zoned: fix two idle reclaim problems
Date: Sat, 10 Oct 2026 18:16:10 +0200
Message-ID: <20261010161613.396-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: no code changes. The only change is my author address: v1 went out on
2026-10-10 from my previous address. Please apply this version instead of v1.

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

