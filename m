Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A03AEF46
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901501; cv=none; b=bHFbCcKUTBnP5XCChaXg+XrF3GLm0EL+IuDo4btGLlkTiulKRaxNe5XzgJsWnu9Ja/XL/TWvbDe6VVf65uEFtzKkjY0MIxiNBg2D72JFGsNi/ylRrdbe5QikQJ5W/zPtHFYQ5oNJB/ILadlVpFcqjQzHwmquXxKGDQhYv4s/2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901501; c=relaxed/simple;
	bh=M70UUZB8RbEdIQDSJGfK6gfuonjBPkMbGzk2H0VfuAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OOG0aUQOpQTFVT2nbnwBOQLyAtWFenv48j37563qZLN4dg3OKXMVApF5mSXH/OdmXJFt8htC9AJ9apCO3BOg86em2iZZCV31O9Yp/nwoMV1VHTXEg21MhHAWVBr7uYO/5t5fnoA3zwL/M6fQ3BgoXNLegut+sE7lRYeUhHGZGDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=ngaTBF5x; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="ngaTBF5x"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66fda8c0e68so2242436d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1788901499; x=1789506299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IymBD51GU+QA9NI7RVfxi4wRYbsFayp2/H5ySdDwOmE=;
        b=ngaTBF5x7jWKS2f/bBsDyboJrGq6KtbgmyKky32lNdD5tVwU7rSI1BJHPHu9rEaljK
         KPKZxZDvkGH0qyp/b+XwEUyYH9MqHAMJc+7s41Yn9gGf8LRLI+kw/n+MZyK3GJlhS4/y
         nIQTetBAaywTwInD7KV56aF7VbIjoPZrInHA694IowvdaY98xiX+dMEN1b0Qe7X3ULSg
         1Zomobih4eIkqo8dAhdooW8KZ2brycVAVWJCiPDqshDBTSxxRblKDwHq6ILDqsipyLbN
         eBwtP/ES3ZNdJ/VzYQglP61iY4qdMTDzN49nYeD91r06gDiXM815gJavXnqG7077Mk94
         JVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901499; x=1789506299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IymBD51GU+QA9NI7RVfxi4wRYbsFayp2/H5ySdDwOmE=;
        b=Sd/Xl5yuIlOJAndbfUvEWsbqgdf5c8zCj9nt3jzJEz4dh5NYxRQRYgpqgfWhafSZge
         NKzDI5g/QZWHCqJ1o+9T2jygRRnC7KpmvfynMWRaJBpWve6CZqCyZUjYyfMKM+sQ3CTF
         Td5+UJ8WGqaP6GDYfBwukBh/hh/pX8q8LT0HHSaH7GV3+dABAWQITh8e5ck8pOslwpKN
         dpw6vgm/nW8+XlayLtzS+E56w3iP4Q/pnUjlcScrxwxbE8ahfQipSlRGIVxMoTuATlyS
         TDqZDa2aycrKcE1YowctWjMLmHjY8LnhpQedTd5qyycUrQZW1OKq+R7wvpvD1iM1KrkG
         8+8g==
X-Forwarded-Encrypted: i=1; AKwUvBzwxMggkvHZJ5Vl/A6IQqM7/WoYm+1C5Rfl4xXKazCSkb63aWix/NYg9OkAwFTsWW71OkwyXAPP8vGHpzk=@vger.kernel.org
X-Gm-Message-State: AFuF++ldpxM3QHZ+DTWwE1g4geKrH1GeaaXxtWSdessbueWrKudLw8JX
	rF0gZJgwxzA1QD6Tof8uaRTxtRNFjSnb4XaAPvChmUHKQDIbizLZVUmmLFc7vfgyPIw=
X-Gm-Gg: AYBFou3cRTi3/qpbu6UANp+MyCzNAhgbutT6R4ATXvTJCgeyFcqpxp8mZ+MblM0YKSe
	JB9nj0DPh1XjT4v9YZeL3qnB38pZqQInaxkerRKuUR4Mbwk+ji7zeUVmuGaRzBEmJ6EEmKgTQRL
	DM0hi1TaMGv2I3lM+phvwvuV+S/Y5LNRVEQU25R/ZbfPjeHtzHDdQoraBvO9h64w8zpnOlnLw0n
	GrdzISn1vPzhqhn+wlBtMe/p7Drndt6VBWyIzTAJvjQ68UTssFeCXI/VKq9P9XvdajWf0WOo3ER
	47I89S+BtLQD3yZTsv/sPugSVzLmdcmcxQGmkYc0++kBjSqlChubyL/9Hi1eLhoTEAW1AKpT6SD
	jB042PHepMafGg+i//NzACp3YGNk41cY1I8jl1FTK5XGmrSzhtfVR2+SBFra2omqNx2lrsebPyf
	Wfq4lcUC6NLRqwNs86nV9qzWfFNeUYIB4701zJyhqcurJ90weUsiJnvEqOEN/hIYyz2JzQZBPgJ
	rRkDxncB+Ixm+ClCJzEGXd7pONiroveHn4dF3OOpcZgGOqGrPBPanM4cSFq8+VrdOiGYd1udQHp
	vYtcyxGjcQPO4jaC
X-Received: by 2002:a05:690e:439b:b0:66f:a87e:2fdb with SMTP id 956f58d0204a3-66fc1ae0b79mr5594493d50.8.1788901498761;
        Tue, 08 Sep 2026 14:04:58 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:1eca:212:86d0:4e87])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb495eccesm11078129d50.18.2026.09.08.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:04:58 -0700 (PDT)
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
Subject: [PATCH v3 0/7] hfsplus: convert regular file I/O to iomap-based operations
Date: Tue,  8 Sep 2026 14:04:41 -0700
Message-ID: <20260908210448.296772-1-slava@dubeyko.com>
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
 fs/hfsplus/extents.c       | 164 ++++++++++++++------
 fs/hfsplus/file.c          | 304 +++++++++++++++++++++++++++++++++++++
 fs/hfsplus/hfsplus_fs.h    |  26 +++-
 fs/hfsplus/inode.c         | 281 ++++++++++------------------------
 fs/hfsplus/iomap.c         | 192 +++++++++++++++++++++++
 fs/hfsplus/iomap.h         |  18 +++
 include/linux/hfs_common.h |   8 +-
 include/linux/iomap.h      |  20 +++
 11 files changed, 787 insertions(+), 251 deletions(-)
 create mode 100644 fs/hfsplus/file.c
 create mode 100644 fs/hfsplus/iomap.c
 create mode 100644 fs/hfsplus/iomap.h

-- 
2.43.0

