Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6124E06EA;
	Fri,  9 Oct 2026 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549406; cv=none; b=g1cGtULUFVaqzA2uP2HpQhntaQUcxLG+WRHwL877xbp1GakB88tAf2HbKLJi37/kI1i1OHGIF+EvTTryt0gVNts/o4R86rbNIrQMUIDenwse6rYLIGSVdQl3sKz4eF+o+//v5xTjmonpyz715eL2GWMPsxmB6XZVMj4XWoDUnwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549406; c=relaxed/simple;
	bh=+1NBZJiKNY7fEDHu/bKrUqETJWFLKZRxBOBe7Lk+bEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4LiSFICm3CS9KIee0kg9zfzroF8TlCLRrL3EsrSymWDQm9BnFeRNvIaT+CGoBDw+YeNF/YSQk3QiDEuC/dci3CrW8GUXbOVAZXoPoBbMXv/qSOJNlbwZKL1CGGQJcJ25e5CqQxIfGw5tYgM6aPtwP6KJqcsSq1oWwIvFtDmG54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=ReC4+v20; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="ReC4+v20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1791549389;
	bh=2qbrES/vWCnbDUUZLuu3B9O763NWZJJ+YHF5ifu/SfA=;
	h=From:To:Cc:Subject:Date:From;
	b=ReC4+v208BSYhoywrHlKoXIJu03h3JVKsi1PB4shH8S0U/LY6XFjppoRhcTjHNm1w
	 fOGykIZDa1Tet0XVPcBwdkwjb/J8k4lSxm+62figftIPejLsW90bJJd67RXSHmL6HZ
	 5hgDvn8h9aYppvqIN372O2dHuAKiiC7L8adaMEeCNS8L/ZbXgl800k8wwUy41R2ZB/
	 aJVbHN6e6kCfvvgXb/5LnND8AaJ7eSVlayl9nHCU/p8QKcJc0Nvh13QJg+cVsyhbte
	 FTznGcwkIdsAcgJh56V/oHLXylpnUCr2KwfPypHVA0JAd56Pr7IvAySfImyiCyCeY3
	 TaioIxxl5tkiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4j1RDq2w5hz4wLY;
	Fri, 09 Oct 2026 23:36:27 +1100 (AEDT)
From: Matt Evans <matt@ozlabs.org>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Zack Rusin <zack.rusin@broadcom.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Alex Mastro <amastro@fb.com>,
	Alex Williamson <alex@shazbot.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>
Subject: [PATCH v2 0/2] dma-buf: dmabuf->file release-time cleanup
Date: Fri,  9 Oct 2026 13:35:54 +0100
Message-ID: <20261009123601.94079-1-matt@ozlabs.org>
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

Patch [2/2] sets the pointer NULL when the file closes, which
get_file_active() handles correctly.

vmwgfx was identified as doing a problematic dmabuf->file dereference.
Although already a UAF, making dmabuf->file = NULL turns it into an
oops.  So, the paired patch [1/2] correspondingly converts vmwgfx to
use get_file_active() too.

Added comments to highlight that dmabuf->file could go away before
.release, and to use get_file_active() if a reference isn't otherwise
already held.


Thanks,

Matt

[1]: https://github.com/opsound/vfio-dmabuf-lab/blob/main/tests/vfio_dmabuf_opath_uaf_test.c

"v1" was the single "dma-buf: Annul dmabuf->file on file release"
patch:

 https://lore.kernel.org/all/f8efaabd-c06e-4f04-8cfa-489c148e37ba@ozlabs.org/

Matt Evans (2):
  drm/vmwgfx: Use get_file_active() for dmabuf->file
  dma-buf: Annul dmabuf->file on file release

 drivers/dma-buf/dma-buf.c           | 21 ++++++++++++++++++---
 drivers/gpu/drm/vmwgfx/ttm_object.c |  2 +-
 include/linux/dma-buf.h             |  4 +++-
 3 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.47.3

