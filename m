Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6378E3803F9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440293; cv=none; b=Rd+N4Jl8RW8scgAt9ecZzWP3FEr31TbAFm+mtJBXV7Tv1LhGlJR2fSayfmvmhktACSUCu9jYDly/e7zQzSKsheUHzENovfKIOO0OKq+x2xGzpXe+b0/ExhidAdGu2W8S2JEwCfx91B6r2B5DCOC1GdZTxleFAR3nyrvWz/A6c6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440293; c=relaxed/simple;
	bh=QQLHPEkZmbpj70DVPITpOLcJJxjVmK33AzoQr5/JFAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMeIkyDpjlBpd4KmL49vZEPnRF4NaO+5ALqcNx/N5krdfnEOp5ONxE3R2p3kjEp/dBGolmHFGLkkNRMSXMtHwjA4QEwQRN7Eil8esem8xo6OpEJXaIhSU5L4PCREmYrqtG7jav2EB0mFIbPsQ/XZubCtz33muCdS4IjhjGoqEdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAYQqSWK; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAYQqSWK"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bef17c191so153609185a.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440289; x=1791045089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+XTa7v9YGLEx2g2NOBefUwMoQWTvFtXhbpvBGy7RY4=;
        b=YAYQqSWKDp2pAl2doTnzJjKiuWiTCq+9226II81Fy/g//mIDfrvuo/08BiOqG4xi8r
         T9B0LWG/2TyW05CdQBtiHI6l3K/BXbQf8OMqCfuFl73kZcb0QvLOY4SI+AHPSoFjks8s
         M6vyGkZJ4y6jgjkb4bUYonI1T82TEhxcHl9z8p6C6MaDc0R6cY2EsGolAw/ohqkUyghB
         CLBEmpVrb8mW0ltZqhy5W+sw+nrIQjrRJCdndfVcVZMYXS72b2cnsHpVcqsquZGJbGCY
         dndSM21aMTir+oPyKzLI/HTiTXqijw9RjIC8Ci7KTCkYFfbx75WdnnuTN/y169KnTkt4
         BFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440289; x=1791045089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+XTa7v9YGLEx2g2NOBefUwMoQWTvFtXhbpvBGy7RY4=;
        b=qCYyEB3XU4KbvNVZUEvZHl+I6X2k0zysT/ovyGB948HnqpXTprpKo3KveY+M8UZ9XU
         eFlHhEdYLcoWMktHbZubb3bojsJ/KQIT3T0PiwIzmWaD/USairYqHbfPuAAVepNrNVg/
         UW8BwfNPHPFp4uAyLKsCRq0sNuW7nupCxWi9R1x5TsJ7+bqNP88CFAfGhNUkpv4rNujb
         Xaa4clcUCMYsHUgUia6oRQAOayyLavGeXST/gIcTMu51RqpmDA/gurbM/oHDDyChl69n
         06++CP44o1TTm8+uZ3sJQ1W+JoRrQTQ/scaic5Qx2JymxKwa05STRpOZNQzT2GLHHLaN
         AowA==
X-Forwarded-Encrypted: i=1; AKwUvBy3M4FxttqMuOBD8m74kG9MG2W064ud3j4XLePRWAq2WIuSQe7uNEtH1y6gO5zQfylVDEn1GRyj0E2iR0I=@vger.kernel.org
X-Gm-Message-State: AFuF++nlJBH0t8xGDbs+jm2JOMn4Q2BCZwTj1LTZB7+dSj5xTCH34Ji8
	Lyvu1GD8nfWyZdTwK6Wnj9ZKOM/pmQVvaVhsB6kdgKhRUe06ge9j6dQt
X-Gm-Gg: AYBFou3zsfgo/OgAr6zFpQu0HNbGwucVyRWktqyU2lwT9Wrc/aHvX5/Ph0+elNNjZQH
	Zqvz3MaEJ8zBZZKvJOq86tsyrK90xRu5EjxWD3aFtQae7ir2+7d1C9FwsTshXfBX/bQ3cLlFu6i
	6sxQRJbYWiY88aOG1JM+gVlspuV4T7HqvraHyNAk0/edGTWO2J9TctV069Iik9VkU+hpQtcdJIz
	wXgz9Vj/jSZ9+Mgt1+SA7gNcAjDAjdeUvnd2MDPd3VDl1CUhMHV0j0+hFkIq5Wq6gqSzldYCjQj
	Z+IXMd/z8u4KOod9gsehDc0qSwpZX5LYyR/ueE4FIUsXssKddA7VEWFuHdi4oypY6jSotYZIkVE
	6+aR/qcsy544A34swTKrqr/c/6e0XpfrIlSzETLw4C2BcknzQyfzrTVXERif2BXMnWveMPSS2Bi
	EgjSrERbWJh+if38OMPEZjBczWSQ84ligWpnKjboF7CHpUUPCs/mVn9DymbChd/XVzh/YUbfI8Y
	aPRAItma2On+5tDfNxAhiRDsYMEieg0JYvYc5aQiLWUtBnphUzCsC1lZVEhgLjD7U4=
X-Received: by 2002:a05:620a:400d:b0:93b:d7a2:dd29 with SMTP id af79cd13be357-93c43d2d070mr1066129985a.57.1790440288703;
        Sat, 26 Sep 2026 09:31:28 -0700 (PDT)
Received: from localhost.localdomain ([2600:4040:29f7:9600:f571:6178:b590:34a4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c4fe09037sm341332385a.27.2026.09.26.09.31.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 09:31:27 -0700 (PDT)
From: Dillon Amburgey <dillona@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Dillon Amburgey <dillona@gmail.com>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	christian.koenig@amd.com,
	krisman@collabora.co.uk,
	noralf@tronnes.org
Subject: [PATCH v3 0/5] drm/qxl: fix shared-primary lifetime and source packing
Date: Sat, 26 Sep 2026 12:31:18 -0400
Message-ID: <20260926163123.39217-1-dillona@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QXL packs dumb framebuffers into a shared primary surface. Failed
preparation and multihead updates can leave shadow bindings inconsistent;
packing whole allocations instead of visible sources also produces
oversized surfaces and incorrect coordinates. Patch 4 establishes atomic
ownership of the shared shadow before patch 5 changes its geometry.

This series supersedes the single-patch v2 posted on September 24:
https://lore.kernel.org/r/20260925033011.12560-1-dillona@gmail.com

Changes since v2:
- Split out fixes for framebuffer pin unwinding, DirtyFB commit ordering
  and error propagation, and stale disabled-head-zero monitor metadata.
- Replace BO-global shadow mutation and the shared redraw flag with
  prepared atomic plane-state ownership. Include every primary plane and
  CRTC in commit dependencies, replacing the lockless redraw of other
  heads. This addresses the state-lifetime and redraw-flag races raised
  by Sashiko AI:
  https://lore.kernel.org/r/20260925034208.6B9F61F000FF@smtp.kernel.org
- Separate shadow lifetime from source-sized packing, retaining source
  X/Y translation, packed monitor origins and clipped DirtyFB updates.
- Rebase onto mainline 6812ce4e4379 and expand regression coverage.

The series also applies and builds on drm-misc-fixes 94cf5971b1d0.
For drm-misc-next 98c7fc4219b9, patch 4 needs adaptation to the new
atomic_create_state API.

Validation:
- Each commit builds on x86 with W=1 and no new sparse diagnostics.
  The final QXL driver is also compile-tested on ARM and ARM64.
- QEMU/KVM tests cover error unwinding, commit/DirtyFB ordering, shared
  framebuffers, source offsets, clipped damage and concurrent modesets.
  Error-path and ordering tests used test-only hooks, absent from the
  series and final kernel.
- End-to-end Xorg/SPICE tests verify multihead resizing and DPMS resume
  without an application repaint.

OpenAI Codex assisted development and review of the patches and regression
fixtures.

Dillon Amburgey (5):
  drm/qxl: unpin the framebuffer when plane preparation fails
  drm/qxl: wait for pending commits before applying DirtyFB
  drm/qxl: clear the monitor configuration for disabled head zero
  drm/qxl: own packed primary shadows in atomic plane state
  drm/qxl: pack dumb heads from their plane source rectangles

 drivers/gpu/drm/qxl/qxl_display.c | 370 ++++++++++++++++++------------
 drivers/gpu/drm/qxl/qxl_draw.c    |   6 +-
 drivers/gpu/drm/qxl/qxl_drv.h     |   5 +-
 3 files changed, 229 insertions(+), 152 deletions(-)


base-commit: 6812ce4e4379ffc99c52401ec28f0d7ffbc36206
-- 
2.43.0
