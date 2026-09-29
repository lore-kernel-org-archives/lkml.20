Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27313A3E67
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666969; cv=none; b=fiNeiikK/t/UmfrGC3pOXw5FQfG7EsdLyuMybnJVDzn2jYMJLTjCk61CPuxpcLxozqbuDsUFXY+mSTCeEVxmJIsjkbRhqY/ogjIiU3kVXmjBuT+Gdk6v0XBZKPS1zsjBsqIkjRzolWVgP4cMo0Y4NrKxjqehSNVsjlfFr6EiTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666969; c=relaxed/simple;
	bh=Lc512+Ll1yMqO8zV0IqSkkPumVwfnnRJuDOeTDyLKgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mNIP0FrnmPsY5hanTdSoOd1z+nFNQs2EpfQJhw14KYLKiJsFTQTRWgI7EQgbnRF9riOTCICA6vSvQlEz1b7rNpJZSZ3sLZ8ZwohKuEdAucv0ILaSikhy3oIBFuvXBr4Bt9lzFivYSCNtfnZmEP9V+PY/6+kFnOw3d2AXNx62pK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0QJ86uy; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0QJ86uy"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a491fecaa5so542868a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666967; x=1791271767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAHZSB2ddBrgCa6V2DPmMYRe8Qgi1eaVASoiFwj/jsU=;
        b=i0QJ86uyQXFCsdJxkWmH5nVqk5oxcdnQR0/NmQtuzHw4ObG7IblZXyZnPWOfyeVEFT
         gt1pnrUcztvDYL8vzvwtTgtlOeGZmJNkh68G7M6fynXiaJkcp2xQltj9HYztk+Y/P2xB
         SfmoqFzKLSvVCQSs38BU8QpH4v2FxfiBpMBVivxbPZKfVY5l8ZAnTj86k9AA5YhLg2HU
         fHTx7TI2jpdssfxpXHWtBQvU+qRtamKcgk1RtjRoGaKL6oKLzZvGxHzCDMUPWnlHl2PE
         SAYaswGBG0tk8Y9hNFa7k2C9D2MCAgRrsclSrohf1LIe4DdmRrq2ampXMpj6xsR/BdSl
         7P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666967; x=1791271767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAHZSB2ddBrgCa6V2DPmMYRe8Qgi1eaVASoiFwj/jsU=;
        b=dtTE3BFDVNwGHJzMyaKEbVIjopjBX5SWSTEqzeDxqA0yE+SdwZfFYp+1AcC+vTd9kd
         Vv1w8wZXpZetlJ8hcZNbPt+5jaUK6/cFRmB9vWc7fXNFdLXaIv8Do1nMik+fxP3rgghB
         rar4MxH2dSHgGdNqOq4QvknVQ5u4b88eyi55Nv2h9oU3MS/dypKliRkB3o6BdvzX8mXy
         PIWTezhgBxHUfVJpYWloXYDDmX4gahqCHmaYuHr7idtAO+VjcRUOYzhhAH5wFrMEbJjg
         zMwMI0WePjjvTh94Tk+XKFsVn5ruEUo0Rx6eCs7OlWDMRjRnLpZeszxuRrqwadcrcYrY
         X6RQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5k4iyF1EEB+zuUrHNFTkUT7gHFBt9GAOLkXtXh4toNvlIsRUc14LJuIxU6LGzNvZhA5+yTg0j72W6Qv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI0IhmAWU0/2P2S4bV4ujQCCwKYWlU40uFCXbG1/hWZqH47lPt
	lpuUSPLxmEtJjl3PIZm/E862dLt4KunRpbsmY5DRyFZt+d7b6/DJdU7/sWMeN/o+rpU=
X-Gm-Gg: AYBFou0K0f6kQkBeM29O8ogyb6gTHOJWwJXJf76QyiCU/aG+XWbzbpQ5ZtJdWasZ6LO
	ULkFkeQNUXyHstbUkKMGtf8DeTVpTZpJPrvoezNJECd6w/pG+jxJTFJ7ze+kxxKJTh3RQaqVIIZ
	DqY7zmB3pVDh0zDP2eA41p1Qh4uQcLS2SUPdsTGteJhss+lg/goHyvDkPV4O781qbYTclcjgOKd
	NiYXteQk8fQpH1Zc1mkg4591mAuJt5VnZoTbUYFqocLV30uBakqkwjnIVJmVxcy2pZshYfe+9yn
	GxP7VSa38ptMmU7w2UYvARVWYV8GT7kU3oM0rzPStVlo0vLA8ed8RFTKNkuIuLunwA0ywW4GXYv
	yltxl5O+SZyOE752guDrqfb+0fD6VJ9hSq8/kJ1LWgyg942HI0kJ+g4wFHLyhqzRqthx1LnskZF
	3OLooeh10BDBqVbCEqjtTpGdIbyh8nhq0RjvrnI3+9zU2x/OmV9WteF9hGq250BX62wHhr6ubI4
	206Q/OLm2wE6sMyfgBQURKGEWvrJ6zdg5A=
X-Received: by 2002:a17:90b:2649:b0:3a0:b223:683e with SMTP id 98e67ed59e1d1-3a0b2236bfbmr10560613a91.48.1790666966647;
        Tue, 29 Sep 2026 00:29:26 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3900170a91.12.2026.09.29.00.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:29:26 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Wenjie Qi <qiwenjie@xiaomi.com>
Subject: [RFC PATCH 0/6] f2fs: retain clean node blocks in a compressed cache
Date: Tue, 29 Sep 2026 15:29:13 +0800
Message-ID: <cover.1790665952.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This RFC adds a reclaimable compressed representation for clean node-cache
entries on top of the F2FS metadata cache.

The node cache avoids repeated NAT and node-block reads, but retaining a raw
node still consumes one filesystem block.  A large raw cache therefore has a
substantial memory footprint, while reclaiming entries early causes later
accesses to issue node reads again.

This series provides a middle ground:

  - active or recently accessed nodes remain in the raw representation;
  - a background worker compresses colder clean nodes into small private-slab
    objects;
  - a compressed entry keeps its NID identity;
  - access restores the raw block before normal node validation;
  - compressed data remains a discardable optimization, and restore or
    validation failure falls back to the ordinary disk-read path; and
  - both raw and compressed entries remain reclaimable by the F2FS shrinker.

Compressed representation
=========================

When the feature is enabled, NODE_CACHE uses an extended entry to retain the
compressed payload length, private-slab allocation size, CRC of the original
node block, and compression-context ownership.

Compressed payloads use per-superblock private slabs with three object sizes:

  256 bytes
  512 bytes
  1024 bytes

A result that exceeds either the configured threshold or the 1024-byte limit
is not retained.  Raw entries stay on the existing node LRU.  Compressed
entries are placed on separate 256-, 512-, and 1024-byte queues according to
their allocation size.

Ownership and restore
=====================

The conversion path may briefly hold both the raw block and a newly allocated
compressed object.  After publication, however, the entry owns only one
representation.  Compressed bytes are never submitted directly to BIO.

Restore runs while the entry lock and lookup reference still exclude normal
concurrent byte users.  It validates:

  allocation size
  compressed payload length
  LZ4 output length
  raw-block CRC
  node footer
  inode checksum
  requested node type

A raw-buffer allocation failure leaves the compressed representation intact
so that a caller may retry.  A malformed payload or later semantic validation
failure discards the optimization and uses the normal disk-read path.  The
compressed cache therefore does not replace the on-disk source of truth.

Background worker
=================

The series reuses the existing per-superblock cache thread instead of adding
a new kernel thread.  Writeback and compression keep separate due times, but
execute serially in that shared thread.

Each worker pass is bounded by:

  maximum raw scan:        1024 entries
  maximum candidates:       256 entries
  reschedule batch:          32 entries

The series adds two sysfs controls:

  node_compress_threshold
  node_compress_interval

The threshold is the maximum retained compressed payload as a percentage of
the original block; zero disables compression.  The interval range is
100--30000 ms, with a default of 1000 ms.

Reclaim policy
==============

The series lets the node shrinker reclaim raw and compressed queues
independently, so every compressed entry created by the worker remains
reclaimable.

The shrinker uses fixed reclaim weights.  A raw entry has a larger weight
because it occupies a full block.  Compressed entries are retained
preferentially, but remain reclaimable under sustained pressure.

The same weights are used for:

  - the effective shrinker count; and
  - per-queue scan quotas.

Quota rounding credit is carried across shrinker invocations.  If a queue
reaches its population cap, unused quota is redistributed to the other
queues.

REFERENCED second chance
========================

The worker and shrinker use the same REFERENCED rule:

  test REFERENCED
  clear REFERENCED
  move the entry to the tail of its current queue
  skip it in the current pass

The worker remembers the original raw-list tail so entries moved during a
pass are not revisited in that pass.

If an entry is accessed after compression completes but before publication,
the temporary compressed object is discarded and the entry receives the same
second chance.

NVMe-backed QEMU test
====================

The test environment was:

  x86_64 KVM
  4 vCPUs
  3 GiB guest memory
  2 GiB raw F2FS image
  host backing filesystem: /dev/nvme0n1p2
  guest block device: /dev/nvme0n1
  QEMU device: nvme
  cache=none
  aio=native

Each test suite created its own empty, formatted 2 GiB seed image.  For every
guest boot, the host copied that seed into an independent sparse image, and
the guest rebuilt the same file set:

  /mnt/bench/
  |-- files/
  |   |-- d-0/f-0 ... f-63
  |   |-- d-1/f-0 ... f-63
  |   `-- d-255/f-0 ... f-63
  |-- shaped/
  |   |-- b-1-0 ... b-1-3
  |   |-- b-32-0 ... b-32-3
  |   |-- b-80-0 ... b-80-3
  |   |-- b-128-0 ... b-128-3
  |   |-- b-192-0 ... b-192-3
  |   |-- b-256-0 ... b-256-3
  |   |-- b-384-0 ... b-384-3
  |   `-- b-512-0 ... b-512-3
  `-- sentinel

The files/ tree contains 256 directories with 64 files each, for 16,384
replay files.  These files build a fixed inode, dentry, and node-page
population and are accessed later in a fixed manifest order.

The shaped/ tree contains 32 zero-filled files ranging from 1 to 512 blocks.
Their different extent and block-address densities diversify node-page
contents and compression outcomes.  They contribute to the initial cache
population and subsequent compression and reclaim, but are excluded from the
timed replay, which remains limited to the 16,384 uniform small files.  The
sentinel is used only for clean unmount, remount, and content verification
after the measured workload.

The workload compares memory use and replay latency at equal node counts, and
retained nodes, node reads, and replay latency at equal node-cache memory.

For the results below, compression-off means compression admission is disabled
at runtime, while compression-on means background conversion is enabled.
Attributed node-cache memory is the sum of cache-entry bytes, raw block
buffers or compressed private-slab slots, and known fixed context bytes.  It
is an accounting metric, not measured physical RSS, and excludes allocator
metadata.

At equal node counts, both modes retained 16,676 nodes:

  compression-off attributed memory: 69,792,344 bytes
  compression-on attributed memory:   6,008,152 bytes
  memory reduction:                      91.391%

The paired median foreground replay regression was 0.845%.

At equal node counts, the compressed representation substantially reduced
attributed memory while typical replay latency remained close.

At an approximately 3 MiB attributed node-cache budget:

  compression-off:    3,199,800 bytes, 760 nodes
  compression-on:     3,207,992 bytes, 9,208 nodes
  retained-node ratio: 12.116x

Node reads were:

  compression-off:  15,668 reads / 64,176,128 bytes
  compression-on:    7,209 reads / 29,528,064 bytes
  reduction:         53.989%

The compression-on configuration also completed 9,175 compressed restores.
For the one-pass foreground replay, those restores plus 7,209 node reads equal
the 16,384 per-file node retrievals.  These counters cover F2FS node
retrievals, not all guest filesystem I/O.

The paired median foreground replay delta was -24.984%.

At the same node-cache memory budget, the compressed representation retained
more nodes, reduced node reads, and improved replay latency in this workload.

Android phone test
==================

The mechanism was also exercised on a real Android phone with application,
memory-pressure, and cache-lifecycle workloads.

Each successful trial performed:

  reboot
  launch 18 applications for a seed pass
  pre-pressure normalization
  allocate and hold 1 GiB of memory pressure for 30 seconds
  release pressure
  launch 18 applications for measured pass 1
  launch the same 18 applications for measured pass 2
  restore the original policy
  clean up and run an offline audit

The seed pass was excluded from the reported measured launch-time results.  It
populated the post-reboot F2FS node cache with application-related node
entries so that background compression, pressure reclaim, and later restore
operated on a non-empty cache.

The application set included messaging, short-video, shopping, social-media,
browser, and video applications.  Each application record retained the
package, Activity, PID, process start time, launch timing, and F2FS node-cache
counters.

In the snapshot statistics below, attached node entries are the current raw
and compressed cache entries.  Attached raw bytes count 4 KiB raw buffers,
while compressed slot bytes count allocated private-slab bucket sizes.
Node-cache logical bytes combine entry, raw-buffer, and slot accounting; they
are not measured physical RSS.

After restoring the original sysfs policy, the final snapshots showed these
trial-level means.  Restoring the policy did not flush existing cache entries:

  compression-off:
    attached node entries:      14,509
    compressed entries:              0
    attached raw bytes:      59,430,229
    node-cache logical bytes: 60,823,125

  compression-on:
    attached node entries:      25,331
    compressed entries:         16,402
    attached raw bytes:      36,573,184
    compressed slot bytes:    8,769,877
    node-cache logical bytes: 47,774,805

At the same final snapshots, the mean compressed-entry distribution per trial,
rounded to the nearest entry, was:

  256-byte:     373 entries ( 2.27%)
  512-byte:  15,116 entries (92.16%)
  1024-byte:    913 entries ( 5.57%)

Under the F2FS node-cache accounting model, compression-on changed the above
values by:

  retained node entries: +74.59%
  raw bytes:             -38.46%
  logical cache bytes:   -21.45%

The node-read count is the filesystem-wide F2FS FS_NODE_READ_IO count for the
/data mount.  Each event represents a submitted 4 KiB node-block read.  It
includes activity from the measured applications and concurrent Android
services, and is neither a per-application attribution nor a count of all
storage I/O.  The counts were:

  compression-off mean: 309,360
  compression-on mean:  287,417
  difference:             -7.09%

The compression-on trials also exercised raw-to-compressed conversion,
compressed restore, compressed-queue reclaim, and REFERENCED clear-and-move.
Each compression-on trial completed about 70,441--76,786 conversions and
retained a mean of 16,402 compressed entries in the final snapshots after
policy restoration.

In this Android workload, the compressed representation reduced node-cache
accounting memory, retained more node entries, and showed a lower filesystem-
wide node-read counter.  Raw and compressed entries continued to be reclaimed
under pressure, followed by restore and recompression during application
replay.  The observed node-read reduction describes the direction in this
workload rather than a strict per-application causal measurement.

Patch layout
============

Patch 1 generalizes metadata-cache shrinking to accept explicit lists while
preserving the behavior of existing caches.

Patch 2 adds the extended node entry, private slabs, compressed queues,
ownership, and memory accounting.

Patch 3 connects queue-aware reclaim, fixed reclaim weights, and carried
rounding credit.

Patch 4 adds restore, length and CRC validation, complete node validation,
and disk fallback.

Patch 5 adds the bounded background worker to the cache thread and exposes
the threshold and interval controls.

Patch 6 gives the worker and shrinker the same REFERENCED clear-and-move
behavior.

This series is based on F2FS dev-test commit:

  1b629035be4a ("f2fs: rename nr_pages_to_skip with nr_caches_to_skip")

I would especially appreciate feedback on:

  1. whether per-superblock 256-, 512-, and 1024-byte private slabs are an
     appropriate allocator boundary;
  2. whether fixed reclaim weights for raw blocks and compressed slots are a
     reasonable initial reclaim policy; and
  3. whether the threshold and interval provide a sufficient initial control
     interface.

Thanks,
Wenjie

Wenjie Qi (6):
  f2fs: generalize metadata cache shrinking to explicit lists
  f2fs: add compressed clean node cache representation
  f2fs: bias node cache reclaim toward raw entries
  f2fs: restore compressed node cache entries before access
  f2fs: compress clean node cache entries in background
  f2fs: give referenced node cache entries a shared second chance

 Documentation/ABI/testing/sysfs-fs-f2fs |  22 +
 fs/f2fs/Kconfig                         |  12 +
 fs/f2fs/Makefile                        |   2 +
 fs/f2fs/cache.c                         | 145 +++-
 fs/f2fs/cache.h                         |  52 +-
 fs/f2fs/data.c                          |   5 +-
 fs/f2fs/debug.c                         |  47 +-
 fs/f2fs/f2fs.h                          |  17 +
 fs/f2fs/inode.c                         |  20 +-
 fs/f2fs/node.c                          |  55 +-
 fs/f2fs/node_cache_compress.c           | 915 ++++++++++++++++++++++++
 fs/f2fs/node_cache_compress.h           | 144 ++++
 fs/f2fs/node_cache_policy.c             | 211 ++++++
 fs/f2fs/node_cache_policy.h             |  54 ++
 fs/f2fs/shrinker.c                      |   3 +-
 fs/f2fs/super.c                         |   4 +
 fs/f2fs/sysfs.c                         |  59 ++
 17 files changed, 1713 insertions(+), 54 deletions(-)
 create mode 100644 fs/f2fs/node_cache_compress.c
 create mode 100644 fs/f2fs/node_cache_compress.h
 create mode 100644 fs/f2fs/node_cache_policy.c
 create mode 100644 fs/f2fs/node_cache_policy.h


base-commit: 1b629035be4a085f59d47edc62f4e695c763a94d
-- 
2.43.0
