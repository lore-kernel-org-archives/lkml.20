Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892103B3BE7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429203; cv=none; b=lyBslK/lWLnk02q1zo+yPcNbj9Y0ot71KMZVeKXJ2WfW18vdyhGkB9YLeELDqg8b5UfhWVBmXbQ8DijkVKNMdY875uI17n0Lo4n49vibsHkvC/LKET/eVV53GQHzpKM/ikQZemSWA+jfHpGJN7puyCuM13sy7O12Vcpmbwe1k5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429203; c=relaxed/simple;
	bh=3jb2/kWVNJl9v3Hi/zcI5iwfRsCGdIVq1NO79epUrUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bx2tLKzXEfX+paNFbFoiestLxLY3EmZjhD/FaNTgUA2P/9x5W11l8JA52xWiTEStW+rX2rhZCUV4ZtLcJdP1BbyVn+INmHGSQMrJcyOz6qA6vPcodvOdJJzYd//cbXgGdSpCvAom9munievaZtJBqLbhlB8bNaDPuG3l0xvjubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=gRWOfMoT; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="gRWOfMoT"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66bd7857841so3795359d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1789429200; x=1790034000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rY1dPCRtDEmpHY0DiIJuGYxM6bzqcXBiN17JhjWu5s=;
        b=gRWOfMoTsl34ONkRfjvayuPv1zeT9XJUKQuesk6WqhbK+gvdg6vuR1iqET2pHQ/NPb
         QY2kPT43RkcWervZo/nBZ7RC6FteWsgrPHIrxLlig0Q+myGuq320mtZztVG+YzFvzFZ4
         MIffdJS/Df6hbptLfdOOBibo3OAKcBwNXp2D64SiOWGR8wulu8NLuagpz2SowvTDBlOs
         2IiVpjiIryuOkEsq2777pDAweSY3A9kFgeiarpncEVGED6Ux538DsDbkiyUCPXB7zSpJ
         QuhfQIOmi9+hSbkdm6g5CHB+OPLS3i1A9m8BiG1QJZXuNMhhHnAOqq3rdupmMZkJddlX
         xqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789429200; x=1790034000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rY1dPCRtDEmpHY0DiIJuGYxM6bzqcXBiN17JhjWu5s=;
        b=M2zvdZcEZaoGPs5ZmAlv9NE4dr2ww5F8oOpDjdV+TSOvB3fchHChgQNOsEKaA7hz0r
         0IzSCbHzBPx0LMGdAC7V0C+6VCtwIqTv6RFnFTuvu8al+TABKw7qEmABAMZ7TsVGcHN+
         kADzQC1fQruAsdUfiT+e7jeNgWQu2q+9n+zVctLm+um49SphQJl9u6qMeJfNJtUhhiA+
         yQ/tUve4eTBsYT7VW5Q4Jnx5wa8kWh6P9dOFCcsCBTyQVWJyFmMDVow0cTCc+V3KZCI3
         fDtDuv0sH9JZxT1rsrJA6dNLtxGth7ic1vRkVXUtJtdQKiu11S6EHOLid2CtAJo0L/cR
         EXEw==
X-Forwarded-Encrypted: i=1; AKwUvByo26DGYTsd5x3hFWSBDf3jYwP3xIcln2qq2CIAb4bXwWF/dDu/4ZskeSyafJGDE0kBAtnUKRKYGwLa420=@vger.kernel.org
X-Gm-Message-State: AFuF++ndJdQXQYMVT3UVo7ePE1Q9EPi1PE2YQuQ/vZhSS4rZ3twpvtAz
	nKfM2u6NvISvSFe6LmvYonSTkTUJpEkvv8aElGcky/WJRv9tTKFjkPkWE/pDbyXlQmM=
X-Gm-Gg: AYBFou21So7IDWm8oPMi3USMCjIehlOmTF6wpdYfnzlcK7ybCkPno+iZIWfqWj7CD8w
	zcYnuVhpO+V//uTv+nfDrmjjI7PNAVqm/GFKU09BvjqiUcuovBgaGHgvVLiAS/E18omnx+Fbwv1
	LqGhZJGh9wyxUkw4SEs7DHxLM2gEDIywGDQXunnmE3DiZxjAGpH2HAVTpFLgeC6DbXlw0jLwxR0
	tgzfLKwEWfxEpu7XWqBbDIA+in6uD1lUsEllsSU/WttDSFH3KKfxXPEY2mc5dCXtTzVPHYnpGoM
	zS9/xrph66GnKy0qYTywPXrVT74FXX78RzzU0+A8oxUJ2sYCY+HSNWYHkEBSZwYJ7KUq6GsU1G7
	irkDwFOGXe5E9QMlqHZlWk8qBrpuhqOUR7lMELV/8rZtiCUbgYDb5DWpmKdTz6IPrwMB/NSnuK7
	EtLiSIqArFGwBR6o9Q8loC9q1WhipY+oMRRML3nMKs1daJD0qoBZseYQFdijt7NIrFsDemnmGuU
	/T1Rc6phtUThelKXXsJXS7UjQa2NXCB7px3Ni/jSuuWb95wzkIZvJ6tKMa5JqPTrUqixdU6yctt
	saAOSZQzwGJGM/Dng6OZVCsWMykr
X-Received: by 2002:a05:690e:168e:b0:66e:62cb:bb6e with SMTP id 956f58d0204a3-6714dfca5b6mr1685285d50.11.1789429200102;
        Mon, 14 Sep 2026 16:40:00 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:df87:8743:655b:3824])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125e3fa87sm5207804d50.14.2026.09.14.16.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:39:59 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	hch@lst.de
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	willy@infradead.org,
	brauner@kernel.org,
	djwong@kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v4 0/7] hfsplus: convert regular file I/O to iomap-based operations
Date: Mon, 14 Sep 2026 16:39:34 -0700
Message-ID: <20260914233941.2966421-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves HFS+ regular file data I/O off the legacy
buffer_head/blockdev_direct_IO() path onto iomap-based operations with
the goal to retire the older buffer_head-based direct I/O infrastructure.

v2
Christoph Hellwig has detected that taking the page lock around
the kmap/modify/kunmap section is not enough on its own:
writeback drops the page lock before the write actually completes,
so a mutator that only waits on the lock can still start rewriting
a page whose old contents are still in flight to the device.
Mark the allocation file's mapping with mapping_set_stable_writes()
and call folio_wait_stable() right after taking the page lock in
both functions, so a mutator also waits out any writeback that was
already in progress when it acquired the lock.

Christoph Hellwig suggested to introduce a generalized version
of iomap_dio_end_io() that was placed into include/linux/iomap.h.

The hfsplus_btree_aops uses hfsplus_btree_read_folio() and
hfsplus_btree_writepages() methods. The hfsplus_symlink_aops
uses hfsplus_symlink_read_folio() and hfsplus_symlink_writepages()
methods. Also, hfsplus_setattr() doesn't distinguish the regular
and not regular file cases anymore.

v3
Matthew Wilcox recommended to use folio_wait_writeback()
instead of folio_wait_stable().

Fix failures in generic/091, generic/521, and generic/551.

v4
Fix failure in generic/363 test-case.

Viacheslav Dubeyko (7):
  hfs/hfsplus: exchange hardcoded number of extents on named constants
  hfsplus: rework hfsplus_get_block() logic
  hfsplus: take the bitmap page lock for allocate/free
  hfsplus: add iomap operations for regular file data
  hfsplus: move file related operations to file.c
  hfsplus: introduce iomap-based file_operations
  hfsplus: switch address_space_operations on iomap-based support

 fs/hfsplus/Kconfig         |   2 +-
 fs/hfsplus/Makefile        |   5 +-
 fs/hfsplus/bitmap.c        |  18 +++
 fs/hfsplus/extents.c       | 165 ++++++++++++++------
 fs/hfsplus/file.c          | 304 +++++++++++++++++++++++++++++++++++++
 fs/hfsplus/hfsplus_fs.h    |  26 +++-
 fs/hfsplus/inode.c         | 282 +++++++++++-----------------------
 fs/hfsplus/iomap.c         | 190 +++++++++++++++++++++++
 fs/hfsplus/iomap.h         |  18 +++
 include/linux/hfs_common.h |   8 +-
 include/linux/iomap.h      |  20 +++
 11 files changed, 787 insertions(+), 251 deletions(-)
 create mode 100644 fs/hfsplus/file.c
 create mode 100644 fs/hfsplus/iomap.c
 create mode 100644 fs/hfsplus/iomap.h

-- 
2.43.0

