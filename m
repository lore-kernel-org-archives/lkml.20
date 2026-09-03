Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1DF386424
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419664; cv=none; b=BWoCnldMUhRW/+CnxMxtL7MTb+qOAdek5DAAnBN+B3VtbidsR6Oqu+B90dO35NCei273NzVBnRloJAGdjZ7eElEuPtkFoRttGvejqN3GttO6xZcsMcrmb/efvblVQtody37jqXgpKMW1VmlikF8SdCGl6yAdYxvuOXm+RQAg6X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419664; c=relaxed/simple;
	bh=ESuAv4SbeCyeFc33oJsRO8+fL8zEjorp2qejvugV63A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=q5aHVjWcKX00ASGvaW29B6haZrXs9Svuy6hfzK5CV4pLCxM5IX8TXMdgFEZ4IMLyqbjVFEhD4jNdVu+Gzx4wGaH2jDpQ6YAdh4dWJqcnv13gB8sj1O66ehtX8070mI+aFEdu5PN5fEOl+RTR+2333R35zqtYAt1fOpIGG1ezrKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLCxkhyG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLCxkhyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CAB1F000E9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788419663;
	bh=Av/f/dN04Dq0eOfSlSMt8bfPCIo+wE1Jfk+EnQ6m3J0=;
	h=From:Date:Subject:To:Cc;
	b=oLCxkhyG/dGOcalM5v/mirn56Qd5qzDkMbTqLhSdCAaqOff9HYa6UKxJW7Gs6ZA2W
	 dmY6U6lAYXUw1cMLZ8Y0Ld3rJlw90uUWaE5GVZ7PeMBGQ7TGkRRj1jNN+y6QwNk0Ib
	 SBGslTrDEAUAsT0dqegV26m/USa+4SrhvPQXuroXEFwi8eppLdJ+uuZ8e40K0n5R97
	 Pi8N8PzT7KL3cnNHFjjJKwhxPLuPrsIzt3cOeKsZlHSx0yNVWp8ZH4YmN4P05vmtvH
	 kW39UHdv7BVAgbtQakRqHR5B/NdXLUJ6iQU2xwFUeKyrXO/Zb5avAVqlQs2YQxiMCa
	 Zt17DuYOczwCg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so1726176a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:14:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwj4RUx8cd8iHyAlDBSbmP4nTCRB7+fKTvnhgDIHHur5raYQO9eJKeLPchb9jbtF1aM/fNkwy2H/Fqc8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l9dDrvoCOLcpSRKOerGASrl7K94SrvqCGlo3miRHdv7BIT7VwN
	vkQ3zhFOhU1kFTDzJ+nk9OoJYek01LBBK5n5uEu2S7Fq+UIT4gPIDtPOUgYUub3E6MfZYDphxXp
	p2vKfhYVJZEc5Pwp63k+xcJ0AR1r/vpA=
X-Received: by 2002:a05:6402:52d7:b0:6a6:32e3:9ba with SMTP id
 4fb4d7f45d1cf-6a6d8749a43mr549650a12.10.1788419661676; Thu, 03 Sep 2026
 00:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 3 Sep 2026 16:14:08 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-GgLoLKM4tX4wUqH+67nWVemjkH-pC7WzrM=aaCsXrnA@mail.gmail.com>
X-Gm-Features: AcwNN1Xx_CX2rNHhikh_oeRkBnOw4spIk2UUGxpPQGWxIB132iVrh_zfHrLgDP8
Message-ID: <CAKYAXd-GgLoLKM4tX4wUqH+67nWVemjkH-pC7WzrM=aaCsXrnA@mail.gmail.com>
Subject: [GIT PULL] ntfs fixes for 7.3-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ntfs fixes pull request for v7.3-rc2. I add the description of
this pull request below. Please pull the following ntfs fixes.

Thanks!

The following changes since commit 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229:

  Merge tag 'hwlock-v7.3' of
git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
(2026-08-25 14:21:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
tags/ntfs-for-7.3-rc2

for you to fetch changes up to 0fecc393f2060e6bc25138df32cb923ec7071c6b:

  ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite()
(2026-08-31 19:47:53 +0900)

----------------------------------------------------------------
 - Serialize truncate, fallocate, and mmap fault paths with
   invalidate_lock, avoiding mmap failures during concurrent size changes
   and exposure of uninitialized data during allocation.

 - Correct fallocate signal and zeroing error handling.

 - Fix FITRIM range alignment to prevent discard requests from extending
   into allocated clusters.

 - Fix free-cluster accounting when cluster-freeing rollback or bitmap
   clearing fails.

 - Keep volumes marked dirty when ntfs errors have been recorded.

 - Compute bi_sector in 512-byte units, preventing silent corruption on
   4Kn devices.

 - Validate sectors_per_cluster values and prevent undefined shifts when
   parsing MFT and index record sizes.

 - Bound $AttrDef traversal to the loaded table size.

 - Fix MFT record resizing, memmove overlap, and kmap_local cleanup issues.

 - Improve error propagation across attribute, EA, and reparse operations,
   including returning -ERANGE for undersized xattr buffers.

 - Avoid modifying the HasEA flag when setxattr fails and return
   DT_UNKNOWN when directory inode lookup fails.

 - Reduce contention in WOF decompression by performing block reads outside
   the decompression lock.

----------------------------------------------------------------
Baolin Liu (9):
      ntfs: return DT_UNKNOWN on inode lookup failure in readdir
      ntfs: propagate reparse index insertion failure
      ntfs: return -ERANGE for undersized xattr buffer
      ntfs: preserve error code in ntfs_resident_attr_record_add()
      ntfs: return real error from ntfs_non_resident_attr_record_add()
      ntfs: fix kmap_local leak in write_mft_record_nolock() error paths
      ntfs: only count successfully cleared runs when freeing clusters
      ntfs: skip free cluster decrement when rollback fails
      ntfs: leave HasEA flag untouched on setxattr failure

Dennis Tighe (4):
      ntfs: do not mark the volume clean in sync_fs when errors were recorded
      ntfs: bound $AttrDef table walk to the loaded table size
      ntfs: reject invalid sectors_per_cluster in the boot sector
      ntfs: compute bi_sector in 512-byte units

Hongling Zeng (7):
      ntfs: fix incorrect MFT record pointer passed to ntfs_attr_record_resize
      ntfs: fix undefined behavior in mft/index record size calculation
      ntfs: fix memmove overlap in ntfs_new_attr_flags
      ntfs: fix race between fallocate and mmap reads
      ntfs: handle signal interruption in fallocate
      ntfs: take invalidate_lock in ntfs_setattr_size()
      ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite()

Jacopo Labardi (1):
      ntfs: fix FITRIM range alignment

Wentao Guan (1):
      ntfs: treat any nonzero dio zero-range return as an error

Zhan Xusheng (1):
      ntfs: read WOF chunks outside the decompression lock

 fs/ntfs/attrib.c   |  18 +++++---
 fs/ntfs/bdev-io.c  |   2 +-
 fs/ntfs/bitmap.c   |   8 ++--
 fs/ntfs/compress.c |   2 +-
 fs/ntfs/ea.c       |  49 +++++++++++++++------
 fs/ntfs/file.c     |  50 +++++++++++++--------
 fs/ntfs/inode.c    |  10 +----
 fs/ntfs/lcnalloc.c |   9 ++--
 fs/ntfs/mft.c      |  16 ++++---
 fs/ntfs/ntfs.h     |  10 ++---
 fs/ntfs/reparse.c  |   7 +--
 fs/ntfs/super.c    |  15 ++++---
 fs/ntfs/wof.c      | 127 +++++++++++++++++++++++++++++++++--------------------
 13 files changed, 196 insertions(+), 127 deletions(-)
