Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A05013A9;
	Tue, 13 Oct 2026 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892946; cv=none; b=TQKXCCJyMKRTjciqLQDaQ+3ynYuhdVE1wD9kb3IMRfwKknsZjptM+LRjH2S8Gn7pU6px0hbbrA5gXH2h9+Kkk3MqkJG+zLfOGDZDtdZRwim+4t1YfDenG0WBcDmin7IcN00iuM5igZ2Yo4Em5FzAVpnirpt41TCfomVFXRXc4oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892946; c=relaxed/simple;
	bh=QdGkPhAC1/6m5HyQ1tu625R5X6M3d1tzcI9w9kA8Cbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PSFAp/R5yqm2Qdodzy0gRg02FIBGKa8U28wrVcnJyE4XfhHUwmCaEc3G7ynjCiQn2L0zCRk56jlW0atLiGN/EX7TyRU6H7mJp074UEibIxhNk3UTX82MLztlEV/DJkqXpxwWzSqbvGGmt5O6YBAmleNPTDUMZdrWBHZeT4R9LOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=yK29tfkY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="yK29tfkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1791892941;
	bh=sMgJshZ5hw4sD5fYhOQLtNjG0zanLqPAEfZRG+FnFYQ=;
	h=From:To:Cc:Subject:Date:From;
	b=yK29tfkYLyEgf2odEJ7NSdt+DlcEF5Xs9eE9cjumvfGRHKDxeEqROVEPPVHPx1760
	 dJTusL+jCcsdrEkdnXhNOVFjKhjJKl7n/V/OY4m9DBB+PYAJFbvNCl7RWgpjZqdptA
	 PVB2EtvM066L9Mt1MnkKsd96tbd6zs6rAwcTSb9/h0ObrY30Ha5eo60M0qTPQHz4DZ
	 fB+5SaORffiW0yOgYJVL48f3p58dmJopGEwfCxoOu6dcN29CJ3FNtrJdZNc6m6UV1W
	 TM1dIoW8yrEcGzWreyk9y7V+WxZileGuRA5CsAiH8vA8jN2wGvReAL4h9DDUfCQpMI
	 /irvJi/br4tNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4j3tHZ5Tzwz4xgV;
	Tue, 13 Oct 2026 23:02:18 +1100 (AEDT)
From: Matt Evans <matt@ozlabs.org>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Zhenyu Wang <zhenyuw.linux@gmail.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Alex Mastro <amastro@fb.com>,
	Alex Williamson <alex@shazbot.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>
Subject: [PATCH v3 0/3] dma-buf: dmabuf->file release-time cleanup
Date: Tue, 13 Oct 2026 13:02:03 +0100
Message-ID: <20261013120211.135807-1-matt@ozlabs.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

A fix for DMABUF's file-release path, to set dmabuf->file = NULL when
the struct file itself is being freed and avoid a stale pointer
lingering.  Previously it could be assumed that dmabuf->file was
always valid until .release was called, but commit 4ab59c3c638c6
("dma-buf: Move dma_buf_release() from fops to dentry_ops") separated
dentry release (calls .release) from file release (can happen before
.release).  Setting the pointer to NULL clearly delimits the period in
which it points to a valid struct file.

Raw dmabuf->file access is bad news unless the file is known to have a
reference held (for example, during export).  A single-threaded
problem scenario is a dentry held open (e.g. using O_PATH) but the
file closed; .release is not called, so the exporter was unaware that
dmabuf->file became stale.  Exporter activities using dmabuf->file
then led to a UAF.  Or, threads racing concurrent access with a file
closing.

VFIO uses get_file_active(&dmabuf->file), which is a UAF when the
pointer goes stale.  Alex Mastro has created a VFIO-centric reproducer
[1], which shows up with KASAN.

To fix, dmabuf->file is either valid or NULL.  get_file_active() is
then safe and a recommended way to access dmabuf->file without an
existing reference.  The only possible outcomes are for it to get a
reference to the file, to observe a valid pointer but the file in the
DEAD state (being closed, fail), or NULL (fail).

Patch [3/3] sets the pointer NULL when the file closes, which
get_file_active() handles correctly.

vmwgfx was identified as doing a problematic dmabuf->file dereference.
Although already a UAF, making dmabuf->file = NULL turns it into an
oops.  So, patch [1/3] correspondingly converts vmwgfx to use
get_file_active() too.

i915 GVT unsafely dereferences dmabuf->file for a trivial debug
printout after the file reference moves to the dmabuf's fd, so patch
[2/3] dereferences in the safe window.

Added comments to highlight that dmabuf->file could go away before
.release, and to use get_file_active() if a reference isn't otherwise
already held.


Thanks,

Matt

[1]: https://github.com/opsound/vfio-dmabuf-lab/blob/main/tests/vfio_dmabuf_opath_uaf_test.c

Changes:

v3:
 - Better comment for struct dma_buf's file (refer to synchronisation
   against ->release).
 - Added trivial i915 patch to remove unsafe debug dmabuf->file accesss.

v2: https://lore.kernel.org/all/20261009123601.94079-1-matt@ozlabs.org/

"v1" was the single "dma-buf: Annul dmabuf->file on file release"
patch:

 https://lore.kernel.org/all/f8efaabd-c06e-4f04-8cfa-489c148e37ba@ozlabs.org/

Matt Evans (3):
  drm/vmwgfx: Use get_file_active() for dmabuf->file
  drm/i915/gvt: Read dmabuf->file only while valid
  dma-buf: Annul dmabuf->file on file release

 drivers/dma-buf/dma-buf.c           | 21 ++++++++++++++++++---
 drivers/gpu/drm/i915/gvt/dmabuf.c   |  5 +++--
 drivers/gpu/drm/vmwgfx/ttm_object.c |  2 +-
 include/linux/dma-buf.h             |  5 ++++-
 4 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.47.3

