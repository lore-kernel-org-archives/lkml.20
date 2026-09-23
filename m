Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6D47F3D6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203461; cv=none; b=XGEqA3/UKSzTgtFbvQhqFD4iGM1jFgcHf4g7Gk5zReImLdp5mIGBuS8bJ/nPAdPFKu0t624pjZXOK1PXLsxg/acW4w8z8zgmgQuk+ovWpIQdLwVTjLC3gUgrfJuJokYoAi4fZWtX8Up0ZtME5w8vN27ifujFhmN57J4w4OLjcU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203461; c=relaxed/simple;
	bh=6meQNQ6TqF2Mb4uCSK2qQxVdWVcnzbfnViphUequMx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TewkBrZ+RFGKM9OewYspmTkHlxgtxDmFCJRvaKA9eM3WPkE6tWWpcw0EywVsCSRVD6XYKhJV1CmG/dGhiaBsq9O90sllAtyiBQdAlHEFSXqla4MhQhCL7IIYoQhAHizvDJPfuoR8Z8h/Fve6QVJj0tvR6n3KD9bxBwdmnfGob+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNekichH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNekichH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5391F000FF;
	Wed, 23 Sep 2026 22:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790203459;
	bh=UPMsCT2qvWI8EN+jpV7cX6nzZkhYVxQZfqb9tn+GBjo=;
	h=From:To:Cc:Subject:Date;
	b=hNekichHgeFu9YAHhsC57ga8KbZeqqYNoPt9qyeJkcA62yO3zslm5ClhEnnIVKNa2
	 lHX2WsoedAGQHIkLZ3XtC1PusAva9ljvI5XsjK28jhmt2xLfY4QeX2JokCV99DkqAd
	 cCdPJs9y/eFE0DFmdSiwOHVB7TdDofuG4c4htxyj8fZNK1JzxU62wzdVhJfp+wxciK
	 I9V7sq80Jl+7oEhUZyKPyhOag00hsGuRo/Q27LFbczH2Vu6jWpHeYsJuQ8xE1Jwusp
	 sNpPewsakzebZBaMFoaMuhk4XGUzBZP5ZLO4flQ9qK1kRtSe2dDsuMSfqHopso6zls
	 Xg4N/8sM0wE8Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 0/6] luo: tmpfs preservation
Date: Thu, 24 Sep 2026 00:43:59 +0200
Message-ID: <20260923224408.3745689-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Hi,

I brought this idea up in this week's Hypervisor Live Update bi-weekly.
I decided to try using an LLM to see if it can produce a
proof-of-concept quickly. This series is the end result.

The main use case is preserving in-memory files that have a filesystem
path. We already support memfd preservation, but memfds can't be linked
to a (user-visible) filesystem. This is needed for storing VMM packages
for live update on hosts that don't have a disk. A cold boot fetches the
binaries from network, but that is too slow for a live update.

David tried to solve the problem by introducing
LIVEUPDATE_SESSION_RETRIEVE_INTO_FD [0], which lets you provide a FD for
LUO to retrieve into. This is an alternative to the idea. It uses the
standard preservation and retrieval API that LUO already provides.

The core idea is to allow userspace to preserve a tmpfs mount FD. Once
the mount is preserved, userspace can pass in regular files in that
mount for preservation. The files take a dependency on the mount token,
and that is used for retrieving the files in the right mount. This saves
us from doing a full FS preservation and makes preservation of each file
explicit.

Currently only files in the root are supported. Files in subdirectories
will be rejected. This is mainly for simplicity. Complex mount features
like memory policies, id mappings, or casefolding are also not
supported. All these can be reconfigured after retrieve if really
needed.

The code re-uses a lot of the preservation and retrieval logic from
memfd preservation. It only adds some extra file and mount metadata on
top.

As I mentioned earlier, this is heavily LLM generated. The code is not
very polished and has some rough edges. That said, I have read all the
code and did significant cleanups of the LLM output. This includes
turning the 1600 or so lines it generated to a more modest 977 lines.
So (I think) it isn't complete AI garbage. And I think it does get the
core idea across.

The big exception to this is the changes to and use of VFS APIs. I am
not competent with VFS at all so I have mostly taken the LLM at its word
and haven't done my homework to see if the usage even makes sense.
That's why I have not Cced any of the VFS maintainers. I'd rather spare
them the pain.

[0] https://lore.kernel.org/kexec/20260901180713.4185641-1-dmatlack@google.com/T/#u

Regards,
Pratyush Yadav

Pratyush Yadav (Google) (6):
  liveupdate: luo_file: look up outgoing tokens by id
  shmem: add tmpfs_create_mount() to create tmpfs mounts internally
  fs/namespace: Add vfs_open_detached_mount()
  mm/memfd_luo: allow preserving a tmpfs mount
  mm/memfd_luo: allow preserving a tmpfs file
  selftests/liveupdate: add tmpfs kexec test

 Documentation/core-api/liveupdate.rst         |   1 +
 Documentation/mm/index.rst                    |   1 +
 Documentation/mm/tmpfs_preservation.rst       |  24 +
 MAINTAINERS                                   |   1 +
 fs/namespace.c                                |  59 ++
 include/linux/kho/abi/tmpfs.h                 |  83 +++
 include/linux/liveupdate.h                    |   6 +-
 include/linux/mount.h                         |   1 +
 include/linux/shmem_fs.h                      |   5 +
 kernel/liveupdate/luo_file.c                  |  21 +-
 mm/internal.h                                 |   1 +
 mm/memfd_luo.c                                | 558 +++++++++++++++++-
 mm/shmem.c                                    |  43 +-
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 .../selftests/liveupdate/luo_kexec_tmpfs.c    | 191 ++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 16 files changed, 977 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/mm/tmpfs_preservation.rst
 create mode 100644 include/linux/kho/abi/tmpfs.h
 create mode 100644 tools/testing/selftests/liveupdate/luo_kexec_tmpfs.c


base-commit: db3db4c33a1cf89a201ad1a11c63f503b248ee32
-- 
2.56.0.rc1.310.g51773c2048-goog

