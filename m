Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76B483BF6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286046; cv=none; b=Fwn1B3LHvB797xDNtGHiDXgvAIHsQgympnBebbSXnqYHAH0Z/nHpFjHYMRkdXs8a/n8KBATa6EP3cz8ZrMnW6PaG4cpK2z4HB/XaBSZVIGmeQefi93S5X6iAwbkgs7IQHIl7IfjqMtXyzXF+GTnwAZkt7yHsNawMY0ckori2kx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286046; c=relaxed/simple;
	bh=oRMCmo2+oUH4Bu0S96AHaFeNGbJv/okR69JWUSTQ1Yc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QC+LSCUzFXxritqMT7ryiMgLPFeDWk7auTxaoc9psIT0lE5rTeP6IjE3VAPPSSNgZip5q7sOUzFV9ppiJNW2KM0yVgmd2czlyFNYNG1ZjiZiayOHZJq+M+0oxrRGy26Ee8hB8bZaOPS0z9/Z2TAKU2oRCPaWKcXKTDAodLY1Jik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F0OjW8Q+; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F0OjW8Q+"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso140778a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788286044; x=1788890844; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAVN67JT5h8WIfFlQUOkXfv2BuxQF89IX1lkYdIpCWw=;
        b=F0OjW8Q+07PDri3VSgGOSxzLtplCbj/+RmWiuGeQwPWOKNhuC1NTU0d3qfRFDpGIeq
         fIrMKov3QfwNGzgQ83jKxgkXjfX449jUFD7xflWwGMOXBmcgLcW4PnJ7JhHFDfJl8wla
         j/WTpCZ0E0c0FlFYlLtjdwNcilAwbe0pnid6VGbB5eMXV0UrUXr0nAZ+GbvvcXpDdoDK
         picwSn8u3OCWJXZK6Zkll8s6yjkzCrIUOyLxFbD7Bs3sjlMPfmDi+BPp2iVRj92CMmYg
         eW1XqWdygUupWb5Jj8C/Gymw0Rtaqm+kwVoiE346SKr9VL3zDeC0uGXqDz9UFCZo8fVG
         eW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286044; x=1788890844;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAVN67JT5h8WIfFlQUOkXfv2BuxQF89IX1lkYdIpCWw=;
        b=bvgRXymFq+HgwiVvj4JhcuOnUM/jYhQGvtSlt8wBtXfIri2nE8zyeS/tp5fuZqyQBo
         3LzNrbyva47hIVZtp86vygsWsslytrxoY+cLk/vt/c/pdHk6HWrm7XYrW6VVDKECjKZY
         UkV1CwWwMgopUWnIs2YkWQoI00xUz7XA1YrqMBgxHXtNl7M75pzer16U4eij9eqUsgbO
         GBL/yyj/utpu9tkkkAb0k+CZAQxV1zIJrHYkITyBIzH999/f3bKbfV1ng/HkbAQmrHxC
         tm9C/o9k289LuBftdCSMEVGaSWppq7eOaYBcw5VUQeFDzPbjz9UxnIc93dgi+VWI1bSw
         gp6Q==
X-Forwarded-Encrypted: i=1; AKwUvByAnQ057/6BOcMf7o8vllXD7AFMp5DNHyuumwJyYbBvsQfaUQy118FYP6oiUxkSshWNf4MDN7PojGL1Z3M=@vger.kernel.org
X-Gm-Message-State: AFuF++kBw5lxigRB6Mx/vMUac+OQzUjaMVh5advr98Ce5raWso6GKTKi
	conz9lvfohu8fc8NKQexFWIUjlLWqiUDZt7Gzv0OgdWOUCDpB9Su/PdULnUACEHG7bAj4+TOuoi
	EPznITqLzLl0Tww==
X-Received: from pjbnu6.prod.google.com ([2002:a17:90b:1b06:b0:396:61d1:58c7])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5544:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-398bd376c65mr32646461a91.12.1788286043659;
 Tue, 01 Sep 2026 11:07:23 -0700 (PDT)
Date: Tue,  1 Sep 2026 18:07:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901180713.4185641-1-dmatlack@google.com>
Subject: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a new
UAPI to enable preserved files to be restored into a userspace-provided
file instead of a kernel-allocated file, and uses this to support
preserving tmpfs files in-place without any changes to the LUO ABI.

The Live Update Orchestrator (LUO) API currently explicitly returns a
new struct file for every preserved file during retrieve() (e.g. via
memfd_alloc_file()). This then forces userspace to use anonymous memfds
for all in-memory files it wants to preserve. This works reasonably well
for VM guest memory but does not work well for other types of files that
userspace may want to preserve (e.g. in-memory logs, binaries,
configuration files, etc.).

Preserving entire tmpfs mounts in-place would require a large amount of
kernel support and would effectively make tmpfs an ABI, which is a
non-starter (or so I hear). Instead, we can delegate the reconstruction
of the tmpfs mounts (directory structure, permissions, etc.) post-kexec
to userspace. The kernel just needs to preserve the contents of tmpfs
files and provide userspace a mechanism to restore those contents back
into a specific file on the filesystem after the kexec. Hence,
LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.

An alternative approach to restoring data to a named file would be
supporting a zero-copy sendfile() that can be used to convert named
tmpfs files to/from memfds across the kexec. But this poses significant
challenges on the *preserve* side since the preserved file might still
be actively in use. The benefit of the retrieve-into approach introduced
in this series is that it does not require dealing with two different
files. There is only ever one file that owns the preserved memory.

By leaving file and metadata allocation purely in the purview of
userspace, programs can create the target files where they want, with
the names and security permissions they desire, before directing the
kernel to restore the preserved folios into them.

Currently, only tmpfs shmem files are allowed as valid target receptors.
Attempting to target populated files, or anything other than an empty
shmem file, will trigger -EINVAL. HugeTLBfs files could be supported in
the future.

The coding work for this series was done with assistance from Gemini. I
am not sure what is the latest recommendation is with respect to adding
Assisted-by tags, but I can add them when I send out the real patches if
this RFC looks acceptable.

David Matlack (5):
  liveupdate: Extract luo_file token lookup logic into helper function
  liveupdate: Introduce SESSION_RETRIEVE_INTO_FD API and core support
  mm/memfd_luo: Implement retrieve_into callback for shmem folios
  mm/memfd_luo: Expand support beyond memfd to all generic shmem inodes
  selftests: liveupdate: Add multi-session test coverage for
    session_retrieve_into

 include/linux/liveupdate.h                    |  1 +
 include/uapi/linux/liveupdate.h               | 21 ++++++
 kernel/liveupdate/luo_file.c                  | 66 ++++++++++++++----
 kernel/liveupdate/luo_internal.h              |  2 +
 kernel/liveupdate/luo_session.c               | 30 ++++++++
 mm/memfd_luo.c                                | 68 ++++++++++++++++---
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 33 +++++++++
 .../selftests/liveupdate/luo_multi_session.c  | 56 +++++++++++++--
 9 files changed, 249 insertions(+), 29 deletions(-)


base-commit: 4e1b74c6004371b046338325011a47cd7ab9dcc1
-- 
2.55.0.966.g6673acef38-goog

