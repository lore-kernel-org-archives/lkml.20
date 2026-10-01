Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A037F8C1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816262; cv=none; b=qlJ9Sntj3FtdVlZuO7zcaaSYZWG2+VUdIKFf4USp8uEzizHlILxBxWOILaeRan6Y9IC/3ixosgPRqln4uaqh3QFOxHziyrAKZqLBRwnDACdE1mAPU4GHUVDGC/5O+BE9sJGyZ4lpMdenuHNUm8per0ohy4bZmzOnAVrFIOapRRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816262; c=relaxed/simple;
	bh=g4NNPbw+iUztIXU0OxYTKfshvA5yELUzU7X5lbD3eXc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eTnGYa84IG7E5zhC6Ky5MiX8NpbXtAbA5Gqro2KCrh+qrti5EydMSft5caBzadWIzLYq8sPyrPxoNTvCtUGawIMk6Li6zmo1FHwbWZ4R8RfF6Ft4fFh6cy5NRPWexS1+Qtotg41vpaSM5+aK9RnMXvNXxUyVPOKvgYY1qahOfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ivS2AwMY; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ivS2AwMY"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2ebeaa0a4so7980565ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790816261; x=1791421061; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TW/ACrzYYeMrBy3s3tjiEB934xbUSaPMMU4ABKPrx40=;
        b=ivS2AwMYsI0JI6k4lskouCWRVDyygf/31QNpERmGH0cMucOqobqSgVdEKTAadAM81/
         l5HxeqcgntbTcz0J23bIB7G4/+a2JM1NpsRAztVHncTfqRtYeWPoqBJMehZ9+bz599sW
         A5bBe7T3wJDErEX4gpUB6NVeGvQ9sQNdAw6ZSVtLL/OdmfqJoOwOK3pOuUd47Y57EjlS
         3uBkcNcsil7ZnzILEpsFu2tLTYsBPvBhu4oBGj6I/vvOdBa8B1twPiB5YfX9cclWHKV5
         CA1Kq2HJQBhPIRWdPiJCxWsAOcpuSQ6eXB1PjE+eg/zzWXOzU8wIKfJblYnZhVQPSgsM
         w8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816261; x=1791421061;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW/ACrzYYeMrBy3s3tjiEB934xbUSaPMMU4ABKPrx40=;
        b=ud0mZB1z9mO0e3KVXTFoASqA0aPPIqHjcPYgcOFQwqnNtUHqojQz0wTDGThQOV4834
         7CwSIkV7YWde6xFhu3azu8lBWk/B9EV5PrZL/olj/PF9bGXOyVksGgBFyuHrN8r/brNR
         YtMo4yvkwP4jQR8dldyzND9cN7PZ+pH8d8ZuAzTmwrsV7x0p+Tmj4uH2+JhBFoKJBPfs
         biIn6jPRZsQ33HklgVe8fCq3kqEHG546U+7ztvE3mhIzdPARhcLfOC/w9LF/tAbs6vo4
         exo4LxM3Vgq3m9XS6iSMh41BYXpWbROTSVgIh5i9EDmSbY6Md1tMV/rjK0cBqLgyD0es
         o57w==
X-Forwarded-Encrypted: i=1; AKwUvBw2XuS2iWnC+btr6vBXAY4ZDEK0Z5P/5XltEbdG3BZu1FkkMOHahuhwrkwbzQViB9SMObwpm5xT0Dgx57o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIB9lhJ4jDytW4pA5UEyZIWu5O0yMZgWq3Qhh3Rh+wNm3E7wQQ
	Hg4pSYIOhbyH9zJ76mJnhNOTt57LY8MWT/fB83BPVkvHLB+8tQ4UjQYJb4djSTzVAZsLO+pxXOC
	IcPKG6wLF6OZXhA==
X-Received: from plao6.prod.google.com ([2002:a17:903:3006:b0:2e2:c7fc:344f])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2c8b:b0:2df:81d0:7c40 with SMTP id d9443c01a7336-2e2e4b97af6mr19847055ad.55.1790816260459;
 Wed, 30 Sep 2026 17:57:40 -0700 (PDT)
Date: Thu,  1 Oct 2026 00:57:28 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001005734.1033516-1-skhawaja@google.com>
Subject: [RFC PATCH 0/6] Introduce file handler dependency level
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

LUO allows preservation of FDs into sessions. An FD can depend on other
FDs, and for some FDs this can mean the dependency must be preserved
before it due to various reasons including immutability and performance.
See discussion on FD dependency patch series [1] and documentation [2]
for details. Also see the Liveupdate IOMMU [3] and guest_memfd
preservation [4] patch series for examples. These dependencies are
enforced by the file handlers, and userspace is responsible for
preserving the FDs in the correct order.

This RFC proposes a mechanism that allows userspace to preserve the FDs
as a batch, and the kernel preserves them in the required order. This
allows the VMM to preserve a bag of FDs without worrying about the
order. A new ioctl is added that allows userspace to provide an array of
FDs and tokens for preservation. This gives the kernel the token and the
intent to preserve every FD in the batch up front.

This RFC introduces the concept of file handler levels. Each file
handler offers a certain type of resource or functionality that relates
to other file handlers. These can be represented by levels. This RFC
adds the following levels and more can be added later:

 - Default (no level set)
 - Memory Providers
 - Memory Mappers (or users)
 - Devices

The levels are optional static configurations of how the file handlers
relate to each other. Each level represents a class of file handler,
which fixes the order of preservation between them.

The levels are spaced out to allow addition of new levels. LUO can use
these levels to deduce the order of preservation of a batch of FDs.

The batch is atomic: either all FDs are preserved or none are, and on
failure the index of the failing FD is returned to userspace. The
existing LIVEUPDATE_SESSION_PRESERVE_FD ioctl is unchanged and behaves
as a batch of one. Note that this does not break compatibility and
userspace can still attempt to preserve FDs individually using the
existing preservation ioctl.

The patch series builds on top of the Liveupdate IOMMU series [3] to
demonstrate the FD dependency. The full tree, including the
dependencies, is available at:
https://github.com/samikhawaja/linux/tree/luo/fd-dependency-rfc

I will present this at the Live Update MC at LPC 2026. I will also talk
about alternative solutions I considered.

Future work:

 - Allow file handlers to be preserved at multiple levels to allow
   resolving circular dependencies.

Looking forward to your feedback on this.

[1] https://lore.kernel.org/all/alrDpAMknlYN9jL9@google.com/#t
[2] https://lore.kernel.org/all/20260910173659.1945246-2-skhawaja@google.com/
[3] https://lore.kernel.org/all/20260921004834.2601285-1-skhawaja@google.com/
[4] https://lore.kernel.org/all/20260728121138.1103610-9-tarunsahu@google.com/

Samiullah Khawaja (6):
  liveupdate: Introduce file handler dependency level
  mm/memfd_luo: Set Liveupdate level of a memfd file handler
  iommufd: Set liveupdate file handler level
  vfio/pci: Set live update file handler level
  selftests/liveupdate: Add API to preserve a batch of FDs
  iommufd/selftests: Preserve all the FDs in a batch

 drivers/iommu/iommufd/liveupdate.c            |   1 +
 drivers/vfio/pci/vfio_pci_liveupdate.c        |   1 +
 include/linux/liveupdate.h                    |  24 ++
 include/uapi/linux/liveupdate.h               |  39 +++
 kernel/liveupdate/luo_file.c                  | 316 ++++++++++++------
 kernel/liveupdate/luo_internal.h              |   2 +
 kernel/liveupdate/luo_session.c               |  45 +++
 mm/memfd_luo.c                                |   1 +
 .../iommu/iommufd_liveupdate_kexec_test.c     |  27 +-
 .../liveupdate/lib/include/libliveupdate.h    |   2 +
 .../selftests/liveupdate/lib/lu_utils.c       |  20 ++
 11 files changed, 379 insertions(+), 99 deletions(-)


base-commit: 945d61765894dda2f0344de50cb1ade2e51b66fd
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

