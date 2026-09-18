Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465C2E040D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741087; cv=none; b=hi6cYRkY2KRqcu7L1a75SVdE0ZVDzbCGCB1EWtyF4K5x/IN0UZ4CJhtG8L1AYgN5/7Y4kBv7QBpS1O2E+ol4NiA3ca7HujOSFCCVP2WymX5V4mxR6uWDiXWp32XbMDi5+mxcabqcyAbevbshyDojHOm1ObuT8Cn80A8NojTNLz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741087; c=relaxed/simple;
	bh=s3x/CelDelnBUWuM35fFS7nIrbnCXKUhRVqtW//Ntkk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cEcLPdNTkQn7QQNyMUmdcBy5IbDwtSjrBtYZEAJIGzZZ/30K2Vj65y0Prq7e28Zfbm4ev/Dw2RQTFP7vN7uAwWWEtAR3s9KBNZ6OqQ2wKSPK/+5B35p0SjKdQA7j3VNqxjiaB3qVQL81JLg35SWL9KnOpieDc1Hk+oTl4XnQX3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWpDblC/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWpDblC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408361F00899
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741086;
	bh=JSScKctO5J5ORmIk3FiImz5t27SKATRb+9joz3DIIi8=;
	h=From:Date:Subject:To:Cc;
	b=mWpDblC/9lZON0QroH3BmwumeUMC8NDJCtgG5ivVrVN3TXb7zs66FMEgl9ddZzoqT
	 KeZghG0TiV4T382z/KhnslGlaYFpHk+OiyCojY3MzKuXPa9bAri2YuC0E0w9v8GSTO
	 upokDdlviZye2aAf0DGz9dBoZdSyWKkX5/D1WZJ1m12pBHduO+yXf0qevc/0A6FKEg
	 MFja/ttnbOsiPshY2+FvAs25uEC7M8rRfZp2YqRihb5EFOBSMYEXCqS56pxoSYRRzq
	 jkbJtWXh0sEUUEBuY0MTwEdPDmL/TVK5+GL5FKXhIwu7bxfgVDFL94Uq7Yxq1B1CCu
	 WfhcSl6tWJROg==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so105926366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:18:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzeSrBn+PQv1U1dPXzowI4FXru0DjsZ0HR12aHpBi87YkRdA9YGDVTCJzQZJETXvMv5926MLL0x+aHG5U8=@vger.kernel.org
X-Gm-Message-State: AFuF++km9VmlKOu7jP59JUKp9y4xD86H5Lt3B/SpNXU+nlTCfpgdmgSn
	Svbqg6fOKviNPJkQA86Fz0tH70sL2cofynTWOFLPPMjJprIDoZs/HK/2IiR+0kzN3IPYa7tEneP
	CwtULfvkAeMkjohPH3i3qXN8ZCA2FSOg=
X-Received: by 2002:a17:907:94c2:b0:c29:5996:6624 with SMTP id
 a640c23a62f3a-c2a157fc32emr279532466b.37.1789741084793; Fri, 18 Sep 2026
 07:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 18 Sep 2026 23:17:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-6AzThE7XG=EbFvhzeJ7iJjJR78LJQxXGbZ2pMj=8nDA@mail.gmail.com>
X-Gm-Features: AcwNN1U2sDyJgqJJSMVpEMZ7QDfO8iVopl_o9v-1nemqBFAXpyduGuebrOngSlc
Message-ID: <CAKYAXd-6AzThE7XG=EbFvhzeJ7iJjJR78LJQxXGbZ2pMj=8nDA@mail.gmail.com>
Subject: [GIT PULL] ntfs fixes for 7.3-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ntfs fixes pull request for v7.3-rc4. I add the description of
this pull request below. Please pull the following ntfs fixes.

Thanks!

The following changes since commit bc35965f6940a9bf834d54187b6088b8eb09206d:

  Merge tag 'mm-hotfixes-stable-2026-09-03-17-45' of
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm (2026-09-03
17:59:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
tags/ntfs-for-7.3-rc4

for you to fetch changes up to 229e8188307b9724cc676a49e9600c4acd24b571:

  ntfs: fix $MFTMirr write offset when it spans multiple folios
(2026-09-13 11:41:58 +0900)

----------------------------------------------------------------
 - Make MFT extension work on existing Windows-created volumes by
   dynamically reserving MFT tail records, accounting for records added
   during allocation, and avoiding false -ENOSPC failures.

 - Repack non-resident $MFT/$ATTRIBUTE_LIST when its mapping pairs no longer
   fit in the base MFT record, while propagating allocation and writeback
   errors.

 - Serialize runlist updates with the runlist lock and restore both the
   in-memory runlist and on-disk mapping pairs when allocation rollback is
   required.

 - Propagate folio errors and harden inode failure handling by treating
   interrupted reads as transient failures and discarding and unhashing
   inodes whose initialization fails.

 - Fix the $MFTMirr write offset when mirror records span multiple folios,
   preventing mirror records from overwriting the first record with large
   MFT record sizes.

----------------------------------------------------------------
Namjae Jeon (8):
      ntfs: use dynamic MFT tail reservation
      ntfs: repack $MFT/$ATTRIBUTE LIST
      ntfs: account for MFT records added during allocation
      ntfs: protect runlist updates with the runlist lock
      ntfs: propagate folio errors
      ntfs: ignore interrupted inode reads as corruption
      ntfs: discard inodes that fail initialization
      ntfs: unhash failed inode reads

Zhu Tianhao (1):
      ntfs: fix $MFTMirr write offset when it spans multiple folios

 fs/ntfs/attrib.c   | 259 +++++++++++++++++++++++-------
 fs/ntfs/attrib.h   |   9 ++
 fs/ntfs/attrlist.c | 224 ++++++++++++++++++++++++--
 fs/ntfs/attrlist.h |   2 +
 fs/ntfs/compress.c |   2 +-
 fs/ntfs/file.c     |   3 +-
 fs/ntfs/inode.c    |  65 +++++---
 fs/ntfs/mft.c      | 457 +++++++++++++++++++++++++++++++++++++++++------------
 fs/ntfs/mft.h      |   2 +-
 fs/ntfs/namei.c    |   2 +-
 fs/ntfs/super.c    |  12 +-
 fs/ntfs/volume.h   |  12 +-
 12 files changed, 841 insertions(+), 208 deletions(-)
