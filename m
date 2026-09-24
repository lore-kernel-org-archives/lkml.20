Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8F3F39ED
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247892; cv=none; b=sajfTm2C9A+G+TAGd7CH0aEM4mKYHbJYcAQX0teQQfrR0RuXCF+IF0MdOtwEqEr0+VCt25X6oJV43B6p8LohtPK5WAFyhXVpfpALHia9KjbKVNDwktnJ4lwpxsO5IrBZqerso1IErwZLCJlstsnmQb3y/aTH10FLoqKjCL+Bs6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247892; c=relaxed/simple;
	bh=FErskk5FNvOkMDXY676R7VSxtI1/h67QxFxplvDBh2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dWhQtZNJRoyzalsfNjgQRfqtfdmMu9Sh2NPdRoIGgqy9vKv9sUhsTZDJSPuHocznq9uPIXZukORlQSc4f/2uHHb744qMTAxd5OjWXItq6kEcDNNeFkUJ6OUwNzJPj+WK3zfGphayA9l+kjspY/D5MwFh20CpYsKwRRoV4tBrXZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PwOJVqgh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PwOJVqgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790247886;
	bh=FErskk5FNvOkMDXY676R7VSxtI1/h67QxFxplvDBh2I=;
	h=From:Subject:Date:To:Cc:From;
	b=PwOJVqghNA8B3L+mWu0Hrpz/MFW2qsmFQqfBa3/lqtKJv9782dX82gk3VFRUSpd0U
	 K7EIrHTUnUCL8/4Jsb7708TGLw3Lz1/eOyRO9ndENbgNzTGfWPfixs76Pcl0g8IAUu
	 aT35CneOUAnp2bA7JhM9O2Odk0dablutfgJUmLQmeUEdcXPYCU7tpOJ+5YtfE0jSFo
	 A023PkwabIwUNpTqxq0Js27Y1VXo2ddJbC2hfhnbsi77LAm71iWyL2jdhTRt4sj7ON
	 hvRyhqNhkriFy3Q7I8BBm8dIbvKIeqI29X5N01qTY8FqzJkCKfpNI1KYuYVnkScX4b
	 B4rkSteQwPhLg==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B5BD17E00A9;
	Thu, 24 Sep 2026 13:04:46 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 0/5] drm/panthor: Fix partial unmaps, again
Date: Thu, 24 Sep 2026 13:04:37 +0200
Message-Id: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NSw7CMAxEr1JljVGSfmHFPVAXJiTUUptUTqlAV
 e5OqMSWnd9o5nkT0TLZKM7FJtiuFCn4DPpQCDOgf1ige2ahpW7kSTUwo1+GwODolW9eCEd4+gl
 nwFrLsnJaqa4SeT+zzaXdfe0zDxSXwO/91aq+6c/a/rGuCiSYVsrOqdpZLC8mjCPeAuPRhEn0K
 aUP6JBB08YAAAA=
X-Change-ID: 20260916-panthor-fix-partial-unmap-a52034f21184
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790247886; l=1322;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=FErskk5FNvOkMDXY676R7VSxtI1/h67QxFxplvDBh2I=;
 b=4IFBqnF2jyKTQukNzXtRJ/tR7mc+ZVBXGPPoHOezl+zFGQ1Bz21WoSnQKEohx5KIfNmy1SBdX
 nIiaL8nvd7lDDMVt2y570NUVczDE/04rh09eJ+uFtL/s+Y9mq56XP8e
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

The first patch is just a theoretical perf improvement to avoid
unnecessary unmap+map caused by false positive returned by
iova_mapped_as_huge_page(). The second patch is a fix for a real
bug when iova_mapped_as_huge_page() is called on an imported BO.
The last 2 patches are just consolidating the logic to make things
clearer.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v2:
- Add a commit dropping a redundant panthor_fix_sparse_map_offset() call
- Collect R-bs
- Link to v1: https://patch.msgid.link/20260917-panthor-fix-partial-unmap-v1-0-c7008f15fea3@collabora.com

---
Boris Brezillon (5):
      drm/panthor: Avoid false positives in iova_mapped_as_huge_page()
      drm/panthor: Fix iova_mapped_as_huge_page() for imported BOs
      drm/panthor: Consolidate the is-huge-page-mapping test
      drm/panthor: Actually check huge-page mapping on sparse regions
      drm/panthor: Remove redundant panthor_fix_sparse_map_offset() call

 drivers/gpu/drm/panthor/panthor_mmu.c | 112 +++++++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 35 deletions(-)
---
base-commit: 45585c3aa285854face65293acc95eff73063d6d
change-id: 20260916-panthor-fix-partial-unmap-a52034f21184

Best regards,
--  
Boris Brezillon <boris.brezillon@collabora.com>

