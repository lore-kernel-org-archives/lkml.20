Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4A346E75
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197528; cv=none; b=dy8wtZ94C7Hw4UhKDH01BK+Rfi1yEZIh2RutEMDLLFvT0+aSNJVKl8/3pvPPtkMPKOcRPJ9IcreYU58MdgZx8KGyQAFyKZ0Ai48GzUMrGm75AvDfSwWxJG2dPm6QwieNeXZAixOXAOkutC4VUezfhEsrCjcIaYNwKRUJ1kfpABY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197528; c=relaxed/simple;
	bh=bTCuT3YDfl2lby7IRjjh/svKRwiHY4G7WKEbHKZAxrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0mDG5I3nipdqnORrWjtYfjT9Iu+9BydQd67eaKDZXOEtb3WrpVmW8dn0rAkQtBtuT2W2qqjk2MYdafrtMFbV5h736y4xzWLsLRHrhH8aLsI8kwcZru1DUFKQ5RC9R9y8MXeg4I70BtNdW8KQwLDJ2XRxAvOM6UxU8ftrZeChuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1QICH6g; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1QICH6g"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f13so675984e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197525; x=1789802325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rLeyn0OC1le5MSTZk6KLze1f/9azpPHpmNeLJDOBQ0U=;
        b=A1QICH6gZaHOOJcTEzhqEr5zWwErqyp06KeZtQDFUjcb1d6gQ4YpYvOBObTbT2E+kW
         ZUSjU7AIz5WlxFg8/LdZeJAywK0o6zz7WJpeLGIOWNGF+nPU2fTKb0j/6M/jigWTnZht
         18SteFdOblUCnUoL+eurRlbYZQSrJY8h9/8iRYhqSGZDi4RF+oOo0+MIVhGFo/0YxcjL
         9l5R6E8OhL8wcoC/0r6F3TW27bRtoUrYFRg/9+Ov9xadYMeylrIRl3ICYjNTf0TIhywr
         13xBXe2gGsf/QUSTsRvrMi91NqGqELARrP2zXEw2xzbsPRwZqUFiAzR46UdiZBE/awJZ
         Y/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197525; x=1789802325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLeyn0OC1le5MSTZk6KLze1f/9azpPHpmNeLJDOBQ0U=;
        b=hirzFmmZ7WHSIxQWz1efOuIPM8yDqXkbTCYpJ3plz/KGwZtERJnrGqPpsOHjx/uea5
         tNOMb1+fVbyP1Ujo9UYS4r6zaZm5N4R3NuM9MN7GLb35AQ4cAgMn1sB8aR/EHT4uxDgp
         Y7S1U8+X8qkC3vyvPy6/uwm+Xdb5GL4wt51xYUprdK3K8E/w/OneeWh1FREUl9xkpR4N
         rzOWvUb0c6kwP2xQp96RCMo5RhU6ORMU1K6oPPU6B09ArgeXxC8lVfMU6scm4gkm91fn
         xyZkdvwnBu4eUVa8f5P7iLqqWVdrH0W4a/Sq0YtKIRPHyEXtrXwLDKG/Oy9lmSdCuQjF
         rl9w==
X-Forwarded-Encrypted: i=1; AKwUvBwt7D0VD4oIRtZNOP1NYlcsarouoKXmkYmLCdHb119IKEMQC0o6rYlCYIZwyn7FCdA3vPx3GD41j45FpMc=@vger.kernel.org
X-Gm-Message-State: AFuF++nwlQzAIasuvIL0gai9WkIGwUaYvf/KZayWvaXIAueueZkT5ySE
	ixq5AcXa/vrbDYBB579uQzjGSHjc7Ddrcp4oLQrorTHQrTZcIwlpLHFT
X-Gm-Gg: AYBFou2umpft8ZA26K1oVjaMIB0/E8B2I+HKBV2JLzaibl1rK51ab4jDdxpeBe5XhhY
	8mc0oMnTJ98EAHGtp0NON71QftcOZl5ur0KteI07RW3HQs1L6XvrXRdMCOwlgELqcY99I3/hOMp
	ySPIINTrx39fTfhM8kZOw/bUAPucmDkz3nH1A/vX77dbRM+s6n+umegX+6/EYmTVpK8oAg76D4f
	L8yYZWalKUBD/FLUmAOVYgxcKWU7vjR/PKJhESw1vaAwCdhS4qXpt2Tz3tOIgDdG5VwYi668VpP
	sKKUrqmFvJWZ+Nu2ytHNIDXR4tkr6jdhCaDu4MHqZCrAi6inhG4VaFg6e8WVf58KLXft9cJRZW6
	KiTjccxG+96CDUTalUorvSOZ8XIDTBXvQgO19iX9ploawPqkFm0xgsTkIsCfca7IwSRaaQyyZkb
	lVoD23NHEuTglLm+gzaCSRPJCpc9R/ipW2tGLPNKBOa4eRJeKEH2A8H634vh/NO/t/sUewZxb3J
	j6+Yg==
X-Received: by 2002:a05:6512:3b87:b0:5b8:9ee1:10fd with SMTP id 2adb3069b0e04-5b8a0343aefmr3048202e87.32.1789197524822;
        Sat, 12 Sep 2026 00:18:44 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:44 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v3 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Sat, 12 Sep 2026 14:18:39 +0700
Message-ID: <20260912071842.622696-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but the entries are
owned by the Gpu that probe() builds, and the buffers themselves are DMA
allocations that cannot outlive the device. They are therefore gone as
soon as the GPU is unbound, and in particular as soon as probe() fails -
which is the case todo.rst singled out, and the one where a GSP log is
worth having.

Patch 1 is a fix this series needs: init() builds the Registration before
the guard that clears the debugfs root, so a registration that fails
leaves the root behind with nothing left to remove it, and the next load
finds the name taken. Patch 2 adds a gsp_keep_logs module parameter: when
it is set, whatever the GSP wrote is copied into memory owned by the
module and exposed under a "retained" directory until the module is
unloaded. Patch 3 drops the now completed task from todo.rst.

Changes since v2:
 - rebase onto current drm-rust-next, where Coherent carries the lifetime
   of the bound device; the live log buffers borrow the device rather
   than holding a reference to it, and only the copies keep one
 - make gsp_keep_logs a bool, now that module parameters support it
 - add the dma_rmb() discussed on v1, as dma_mb(Read), between reading
   the "put" pointer and copying the buffer
 - build the debugfs guard before the Registration (patch 1), so that a
   failed module init cannot leave either directory behind
 - keep nothing when CONFIG_DEBUG_FS is off, where a Dir is a zero-sized
   type and the copies could never be read back
 - take the snapshots before acquiring the global lock, rather than
   holding it across three 64 KiB allocations

Testing was done on top of drm-rust-next with the TLV firmware images
installed. On a GB203:

  - with gsp_keep_logs unset, no "retained" directory is created and the
    entries disappear on unbind, as before;
  - with gsp_keep_logs=1, retained/<BDF>/{loginit,logintr,logrm} hold
    the contents the live entries had, all 64 KiB of each readable;
  - binding the GPU again recreates the live entries without disturbing
    the copies, and unbinding it a second time replaces them, leaving
    exactly one set behind;
  - with a failure injected after the GSP has booted, probe() fails with
    -EINVAL, the driver stays unbound, and the logs of that attempt are
    still readable;
  - with a failure injected into the Registration instead, the module
    fails to load and leaves no debugfs directory behind, where before
    patch 1 the next load would have found the name taken;
  - the copies are released on module unload, and three load/unload
    cycles leave nothing behind;
  - 1, Y and y turn it on, 0 and N turn it off, and a value that is
    neither is refused at load time.

The parameter does need a value: the Rust bool param ops do not set
KERNEL_PARAM_OPS_FL_NOARG, so a bare gsp_keep_logs is refused, where the
C bool would have taken it.

No warnings, oopses or refcount complaints in dmesg throughout. Built and
checked with CLIPPY=1 and rustfmtcheck. checkpatch --strict is clean
apart from the MAINTAINERS note for the new file, which is already
covered by the existing "F: drivers/gpu/nova-core/" pattern.

John Hubbard's r000 series adds three more log buffers in gsp.rs.
Whichever of the two lands second needs a small rebase; the retained
copies extend to the new buffers by adding them to RetainedLogBuffers.

v2: https://lore.kernel.org/nova-gpu/20260815050826.306717-1-vladazaharova2018@gmail.com/
v1: https://lore.kernel.org/nova-gpu/20260812113752.532537-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: build the debugfs guard before registering the driver
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++-------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 267 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  36 +++-
 4 files changed, 320 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 73e5616f3d197c1af5a04a481fe0f13aa3913bd1
-- 
2.55.0

