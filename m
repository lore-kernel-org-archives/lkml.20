Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8859431D362
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741295; cv=none; b=PGVVK7atxL+OubvqRU3ezI90ksbvPCYN5/0KTeoieEX7sCqGdl7at+KGbV8QLXpoZnLdXWoevdHtNOtHDbRvCXurfBrgC61f0pYIb3j1LwBvzzI4IjQveGrmSoW9sc2HydOOwZD/gZ72D+vY5lPyw5bXtDe724Rd6abxLrNf5PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741295; c=relaxed/simple;
	bh=1u+SvA0K/piaqCP2bammpQ+xKV6gQwneMX4d2DzhNvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=reBssAbxMjAZroohue5R8RLD2nAqW6lxDWurmoD1Rq3TyD1lu/dXZ0ffBQQIK54YLeF4SUqy447KAkIyBqhmqsX3DavJdUE3D0eWhEHGAhmjPRBqckyN5z3tVYSkTu+AXIWPMo0Xn3i8ge6pgc+L3mzA+aZokloBNJ0WDcE5xFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYXXNaHC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYXXNaHC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6af9cc73235so450602a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791741293; x=1792346093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMz8tbwpxQBDLx8AlhOWU85jm60XxNjWVs22q2b3BTA=;
        b=aYXXNaHCYNdgz+ewxAaboveaAqY8ESt1KvekQiaXdL48mx/TbNq3ReJUuTr/tJ/i8z
         2jgp8YSLyK4Aq+g4eYNkdTGgDQssKuygPDmmhQAGUF5IxilCVCyosIXIv1gKOvMeH6Ez
         ZvoOd5eDhzuZF1hEby7LdwPHNmK6FyngdF6sfuUVQWasx4D31tufS/AJ44nzMwtxIJkp
         2hVd9K6xQQafb7zS1VkxOeQ4r4ffCusewg9UIOj4dNTnIL2iqZRLWs4l250Yyv6DG7mz
         vxYVQdQKEZPWoA9fMd7T+u7GiHXlq9kxalpVgnmLLGMFXjD5jpJHffBGGlLCLlBjj28p
         KxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791741293; x=1792346093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMz8tbwpxQBDLx8AlhOWU85jm60XxNjWVs22q2b3BTA=;
        b=vV74TqzKywrBIxsTV9+THkTiu5cVVz0lFFqSYCiK3FNCPae+cDGRysEElJoDGHZXBy
         475OHNssxljqszdJ+O+YkiWG0/fmYpgoEkLR8dGCyTJG6Bedqj3lqxkiupkoFAH8f+ez
         EvzUjbTODdZwcUzfendZmjYlHr9TMMaFGgaAO+KO344bmHQB0XoQnMU0lhJOaYSdjb4E
         i8l5M4I/BEzbNwBiStkYcEcf+PkPS7R3VeLAWNKrPuZJGQHj/1o7+kfpk+RekybdBfL3
         o8bwMQ9krFz1gr/H8jQvwrfU0topv2Yxe/4erSarJBsSiCw1uIqgEzPfSScpzITg77FN
         jSAA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ0VJecMUkE30zAw3ZySPERbIG+FdyA78NF7RuHUeNkMfTNbCGDevC55zNjEbeJKE2omx1A9bQWrOfJg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuRZ6s7WFf+yyysiHA7Hpgzb3KR4wlu1aCCP3F2OlOaZ5kHvj8
	4hF4YXslPTGYxpPGvGgfaGDOM/ML+wFYWt8vxxeBdNH6BC2kxGf63z1F
X-Gm-Gg: AYBFou2DVq24EW9jPN4psbvx5AATF5FvnF4gR6IhiEkxF/EyZ76QGA3yb9kp2othcNY
	ufWqT0SD+dovNbsc+3z/b2LdP6NCNFTXjxsMhhsGhRxpDhIxdRAU5Ni7fZyoSlvC2yxszq7qmki
	6YjMDckf4B4Ev/9RhwwG7k21lC4xKAg1ObmrebR3qGMWvK/qEoHZGrVxxTULIuk2XOz/z3GffWF
	L0kKwj2G5Bky2evrzorE5dvtG3CcUr/YwB8k5drg8wUeuv3EXrczSjZr8AEpHgrRFwMIV7hr+z8
	SnIwtjU/74WpAHko5Y+Rpl5Kh5hSVzBMtOLDAA0Oa7o4KGTNVBaeJ/sRZzY3++jxhjT+1EBKtVY
	JGcikumQNLIM9Sxe1PR9ZW26vdgomhBX6ViNyCkBlphKlO+Mk3IdPhOvX3d/UWM7kxItv5MMNDC
	uMtpvfhoY6NYEp476tRKt2JttSq/d+EDynSY4FP64PtZYN7CJYXZWjFySRt45FHowJuGalyt7Lt
	FVp87CeX060i7H0cOBNLw137QT4oIII7zk3qNIqo2mQTLw=
X-Received: by 2002:a17:907:c317:b0:c2d:c5ca:9862 with SMTP id a640c23a62f3a-c31a6eb4997mr763159766b.2.1791741292575;
        Sun, 11 Oct 2026 10:54:52 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm376806366b.48.2026.10.11.10.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:54:52 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] dm zoned: fix two idle reclaim problems
Date: Sun, 11 Oct 2026 19:54:47 +0200
Message-ID: <20261011175450.952-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Patch 2: reworded the comment and dropped the redundant
  dmz_nr_cache_zones() test, so the condition fits on one line
  (Damien Le Moal). Patches 1 and 3 are unchanged.
- From and Signed-off-by now carry my full name instead of the GitHub
  handle, as you preferred on v2. Thanks for checking.

Changes in v2:
- No code changes; only my author address changed.

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

Kyrylo Biryuk (3):
  dm zoned: back off when reclaim finds no destination zone
  dm zoned: do not reclaim a random zone into another random zone
  dm zoned: keep polling for idle reclaim after a reclaim pass

 drivers/md/dm-zoned-reclaim.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

-- 
2.47.3

