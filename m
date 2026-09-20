Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22073EA976
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893158; cv=none; b=bqSILZznDCc7Ei60jYtuJFuJtGrWlPa2R8GjB+Resp4PX67XafticcN8cmCbn/EJaL1Sc4nBVpUvcoalC+jgoebcfSKknMjZ+i+uAYTWKc0Nikg8uB8ga077/Rbn7ampA/73SPaozVIZB/vqYW1Paic0sIbQAQmV6kXlvEkNIa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893158; c=relaxed/simple;
	bh=/CkXgnNuVYXJThs5XNYx5qmLIfoSFEMgjKeRhd6Yvlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9Jw/8T0XKyONVODn59GKdknImq+kWCTALktfxfx0oacC56d4DhZwPrw5hjjlM9+sBboVJEzY+1hgfPbWygJSowB7o2AGxSEuuMeQFIYBDKFascmOBDgekVkayUlIc4mevRnvavuUZ/E+W3JehiFSti9hjpX3cltqehBXv6RB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DBE696aT; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DBE696aT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Es
	rSMK0TnaMid68JzQ6v1hteDGa+S/QMxhbry3trj4o=; b=DBE696aTReZ5ddUqkW
	O1LKTw+tSF/HDgamXau7q+zhZr56E7CNCqKd09NcXlZd0vF7fTakLHlUgHtCXcSd
	LTdXAOsDuu0tah6bK2Y3W/T0YuH2M8ml5rwjO8hvphAn2yu4pWi7FDe4qYbqQ4Aj
	Yma/JAFq4AURaYiYiRe2UYryw=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S2;
	Sun, 20 Sep 2026 16:31:35 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 00/10] ntfs: persist Linux file attributes in an EA
Date: Sun, 20 Sep 2026 16:31:21 +0800
Message-ID: <20260920083131.1880061-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gw4DWF47XryDJr43tr43ZFb_yoWxWr15pF
	Z3G39xK3ykJry2k397ta12v3WF9a95AF4UXr1DKry8uFyjk347tFWfta12vFW8Cr1fKw1j
	qa1jq3ykZr45Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnhL8UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Qgn8WqvmeixpQAA3X

From: Baolin Liu <liubaolin@kylinos.cn>

This series implements persistent immutable, append-only and nodump flags
using a private $LXFLAGS EA in the standard NTFS $EA/$EA_INFORMATION
attributes. No new NTFS attribute type or formatter changes are needed.

The value is a little-endian u32 with immutable, append-only and nodump
in bits 0, 1 and 2. Inode loading restores the flags. Unknown bits are
preserved, and the entry is removed only when its entire value is zero.
The setter protects system metadata and sys_immutable-derived immutable
state, rejects direct writes to $LXFLAGS, and updates in-memory flags
only after the EA update succeeds. Fileattr queries also report mount-wide
case folding. Nodump is reported through both fileattr and statx.

Changes since v1:
- Persist immutable, append-only and nodump in the private $LXFLAGS EA,
  restoring them on inode load so inode reclaim and remount do not
  discard the settings. Preserve unknown bits and reject direct xattr
  writes or removal of this entry.
- Reject clearing immutable on system metadata files and files protected
  by sys_immutable. Report mount-wide case folding with FS_CASEFOLD_FL.
- Add prerequisite EA fixes for presence tracking, chain validation,
  error propagation, empty values and failed-update recovery. Use EUCLEAN
  for structural errors detected by the EA helpers and preserve errors
  from lower layers.
- Organize the series into six EA fixes and four fileattr patches, with
  documentation accompanying each feature step.
- Rebase onto 018344e6f555 and verify Windows mount/access/CHKDSK
  compatibility.

Patch overview:
- Patch 1 fixes the cached EA presence flag after creating or replacing
  the only entry.
- Patch 2 validates EA chains and links zero-terminated tails before
  appending entries.
- Patch 3 preserves EA write errors and reports truncate failures.
- Patch 4 distinguishes missing attributes from lookup failures and
  rejects incomplete EA attribute pairs.
- Patch 5 distinguishes empty EA values from deletion and rejects
  removal or replacement of absent entries.
- Patch 6 prepares the new list before updating attributes, restores
  both old attributes on failure, and shuts down if restoration fails.
- Patch 7 adds fileattr queries for existing inode flags and mount-wide
  case folding.
- Patch 8 introduces the $LXFLAGS storage and inode-load paths, adds
  immutable persistence, and protects system-imposed immutable state.
- Patch 9 extends the persistent interface to append-only.
- Patch 10 adds persistent nodump and reports it through fileattr and
  statx.

Testing on this revision:
- QEMU tests covered flag and EA readback, inode cache reclaim,
  read-only/read-write remount, unmount/mount and fresh-kernel reload.
  Checked immutable write/unlink denial, append-only enforcement,
  normal I/O after clearing flags, and read-only SETFLAGS rejection.
- Verified EPERM when clearing $Bitmap protection, including without
  sys_immutable, and when clearing sys_immutable-derived protection.
  $MFT rejects SETFLAGS with ENOTTY through its empty operations.
  Checked casefold reporting and STATX_ATTR_NODUMP.
- Exercised first-EA creation/removal, XATTR_CREATE/REPLACE, zero-length
  values, zero-terminated tails, unrelated EA preservation, unknown-bit
  preservation, and direct LXFLAGS write/removal rejection.
- Malformed LXFLAGS length, chain offsets, name termination, value
  length and query length returned EUCLEAN. A corrupt tail following
  LXFLAGS prevented an update without changing the existing flags.
  An invalid resident EA_INFORMATION length rejected earlier by the
  underlying attribute parser retained that parser's EIO.
- Fault injection covered allocation failure, failures after each EA
  attribute update and rollback failure. Tested creation, replacement
  and removal with no other EAs, resident EAs and an 8 KiB non-resident
  EA; checked old values and protection after failure and remount, and
  shutdown when restoration failed.
- Additional injection checked ENOSPC write errors, short writes,
  truncate errors, ENOMEM/EIO lookup errors and missing EA attribute
  pairs, with old EA contents verified after remount.
- Formatted a SanDisk USB partition inside QEMU using the final kernel,
  and created combined and individual flag probes through SETFLAGS.
  A fresh QEMU boot with both disk and mount read-only confirmed flags
  0x70/0x10/0x20/0x40 and LXFLAGS values 7/1/2/4, directory nodump,
  absence of the cleared entry, unchanged canary EA and statx nodump.

Windows compatibility testing of this revision completed on Windows
25H2 (OS build 26200.9457), using the LXFLAGS_V3 USB volume (serial
4C3F-43F9). Windows mounted the volume and accessed the existing probes
with dir/type. chkdsk G: /f initially could not lock the volume; after
accepting its forced-dismount prompt, it completed all three stages and
reported no filesystem problems and no further action required.

After returning the USB to Linux, a fresh QEMU guest running the final
kernel checked it with both the virtual disk and NTFS mount read-only.
GETFLAGS and EA reads confirmed the combined flags 0x70 and individual
flags 0x10/0x20/0x40, with four-byte LXFLAGS values 7/1/2/4 unchanged.
Directory nodump remained set, the cleared entry remained absent, the
unrelated canary EA was unchanged, and statx still reported nodump.

The tested Windows mount/access/CHKDSK sequence therefore preserved the
LXFLAGS names, lengths and values on the tested Windows build.

Baolin Liu (10):
  ntfs: keep the EA presence flag after creating the first entry
  ntfs: validate EA chains and link zero-terminated tails
  ntfs: propagate EA write and truncate errors
  ntfs: preserve EA attribute lookup errors
  ntfs: distinguish empty EA values from removal
  ntfs: restore EA attributes when an update fails
  ntfs: add fileattr query support
  ntfs: persist immutable in the $LXFLAGS EA
  ntfs: persist append-only in the $LXFLAGS EA
  ntfs: persist nodump in the $LXFLAGS EA

 Documentation/filesystems/ntfs.rst |  24 ++
 fs/ntfs/ea.c                       | 451 +++++++++++++++--------------
 fs/ntfs/ea.h                       |   9 +
 fs/ntfs/file.c                     | 125 +++++++-
 fs/ntfs/inode.c                    |  12 +-
 fs/ntfs/inode.h                    |   2 +
 fs/ntfs/namei.c                    |   2 +
 fs/ntfs/ntfs.h                     |   4 +
 8 files changed, 410 insertions(+), 219 deletions(-)

-- 
2.51.0

