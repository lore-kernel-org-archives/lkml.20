Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840925;
	b=b9yrt1mR10VAIA8a+cSJjUGiDbZ1shFbnBwp557VxgGY+994QXn4ij6tkKL52RtLD0o8
	 yzFgbKgDQw01dpVYFTv2aOBOA8PBPfQ/N9jXw46KqX9S9iUWhI2KaDgoll1JfoL7FJZhD
	 ZssezICfaEtv1FdIqChVemPlIzs6L1KBTO45jgNUKwkZ6jYDFC8S7yKXttTKfPOUuQgir
	 U0QaxU4M/LWnSf8e8JrgLSW7pu+3ulihFpH773nRt/olmXITuW/GCMdI/LbP7Ke2doxXu
	 GoibYHT1XMXLVF62DG15itgFjtrtoZkduoRXy8nTmyZBDbaTNn8igTyzFzHsIG1MQmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840925;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cGiQ8OTVAeX0o47MTz+ktInH/fOBwJghtHtytzaWqSA=;
	b=pJRICJ5ZfO9JhFccVGAgAhD2jn7gwtNnoqBuVBtFKqyPgbYvvAdGFOBd4fRaa5C/humk
	 WWb8v0s2Es7NDT7+rjo7f2O9nfbkvjOO8+rt5himabCSpx3DSBegOdSRTUP3x8hGhgCfd
	 P21ID7w+3oV5oJGqCxo05aLlBv0YzZFoGRCYr9V7bStEBM6KMWS7kxhM0cSUZRcQiWV+h
	 AUfWFdE0zSA9bDws2ibHQso8z4h5bom/K41aCatMkTWqIUgn3Fe9K0JtmFpEqBRFjGeuh
	 oyNx7a+AHGltbl2QgCWZZKblXl1y5ml3cx0oJqn1ga6kytCGXZ7KtPaNAhqtpaYgDUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRNbwXhW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1F1606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRNbwXhW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA88F1F01825;
	Sat, 24 Oct 2026 11:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792840924;
	bh=cGiQ8OTVAeX0o47MTz+ktInH/fOBwJghtHtytzaWqSA=;
	h=From:To:Cc:Subject:Date;
	b=TRNbwXhWlrh6M/1ClNTKGyPNstnCcPOnZb6JJKfrQxHhK7/JK+RatDhSfByg57hNX
	 6oFHvIvyDJMBVMWPyZS9ugRtKgj4cqHmurv4A3xBJZMVjjPreNyP/DIMecHI4gvKWl
	 kva6WY1FEjD2e5PiBQCCZ6x77//aFUiU/7AtSgCapiJRh83Xr1Ohl9YqG4B86UjD+x
	 XpEeuXs799qQOIV+vDIJNnIsTTQdJLWZxjYVKpVRQcHYLPPdJnyH0KEKW68/7J31yu
	 DJZTU9CGZQRYpK1z5zfgDBumgHjN9fy2xKKHeyALrUhXc6iTrXfkgmtUayzEeqLwkH
	 NeqgDwLuidrqQ==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] kexec: updates for 7.4-rc1
Date: Sat, 24 Oct 2026 14:21:54 +0300
Message-ID: <20261024112155.3384616-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/kexec-v7.4-rc1

for you to fetch changes up to 833d2b79ed9520e77c5d83eb11644e5239b2c5bb:

  Merge branch 'kexec-7.4' into kexec-next (2026-10-15 11:38:21 +0300)

----------------------------------------------------------------
kexec: updates for 7.4-rc1

* Fix probe error codes and error propagation:
  * make architecture functions that probe loaded image consistenly return
    -ENOEXEC when they do not recognize the image format
  * Make kexec_image_probe_default() to distinguish image format mismatches
    (-ENOEXEC) from real errors (e.g. -ENOMEM), propagating real errors
    immediately and only continuing to the next loader on -ENOEXEC
* Make sure the next kernel does not land on hardware-poisoned pages
* Remove unused arch_kexec_locate_mem_hole hook

----------------------------------------------------------------
Breno Leitao (2):
      kexec_file: stop the top-down search before it underflows
      kexec: keep the next kernel off hardware-poisoned pages

Mike Rapoport (Microsoft) (4):
      Merge patch series "kexec: keep the next kernel off hardware-poisoned pages"
      Merge patch series "kexec: fix probe error codes and error propagation"
      Merge branch 'kexec-fixes' into kexec-next
      Merge branch 'kexec-7.4' into kexec-next

Mukesh Pilaniya (2):
      kexec: return -ENOEXEC from image probe functions on mismatch
      kexec: fix error propagation in kexec_image_probe_default()

Sourabh Jain (1):
      kexec_file: remove unused arch_kexec_locate_mem_hole hook

 arch/arm64/kernel/kexec_image.c   |  4 ++--
 arch/loongarch/kernel/kexec_efi.c |  4 ++--
 arch/riscv/kernel/kexec_elf.c     |  2 +-
 arch/riscv/kernel/kexec_image.c   |  4 ++--
 include/linux/kexec.h             | 15 ---------------
 include/linux/mm.h                | 14 ++++++++++++++
 kernel/kexec_core.c               | 10 ++++++++++
 kernel/kexec_elf.c                |  4 ++--
 kernel/kexec_file.c               | 34 ++++++++++++++++++++++++++-------
 mm/memory-failure.c               | 40 +++++++++++++++++++++++++++++++++++++++
 10 files changed, 100 insertions(+), 31 deletions(-)
