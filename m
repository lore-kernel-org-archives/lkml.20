Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B433A02B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790520972; cv=none; b=gJ4+ZSFtEtQ0BzqKEa7xunS5a7Ihdl27KFUAkmHbbdeYY+icAlTqDZ9WrGfOS4Bplch2ZRjm9g0ghDDXqnDFU1L14kgLh3r7RYMBL9NTIT0xecQnkMNv06GhP5TEnHslv/PZUimRHdN93CAkBtkB2SGIawJVnwFKwAzIaYDfFCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790520972; c=relaxed/simple;
	bh=VVtr3IhdbhYdVvUDGu66p5dCWM/2ZkFNvUnI8cu1Txc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bX83hCGr1hmVjelAe4xQlfYXJdN3XteMOZI3O63VoGnKZ5lN6hCngCaMPhlubPXRXlLHSFno9TyaPy5WMaKpNg64ywa7Z3qE5GCOZVTKzJOziAWNi1SNyFoBYuNveybSJxf4ctVUBa+bNfrT/hFuUqR6N2cjqCW52C9bs5sAquk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJWlY62k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJWlY62k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2031F00893;
	Sun, 27 Sep 2026 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790520968;
	bh=iU5SiVe9iB5i+kPG90oa4hLYEVkiZAW5YzZdAQv2iEI=;
	h=From:To:Cc:Subject:Date;
	b=HJWlY62kgaKtabBg26a0ZeZ3VETWppdf2HHOz0t7z0UZ+TCZMUDG6vafOHrErhXDk
	 SB4xh3w3mgcZx83FwItDL60y6trkhbAK2nZdw8URXz5tpWbMzAlAILaAXlHyg/GYa6
	 Tmw29e8XfaXVKTEdP75fs34a65pUn5cpjfRog6ghIgT9aZN5ndIKBYPvvcJsJ4Q41s
	 Y0/3Aqi6Mb/orjhgmrbl4ut3sRew6gWugis5Fl06ajs0BbjGxD6oHkvI8hgHqEbpNJ
	 07216lHUg4MWog3Gmjr/SvpjvRzskLKFKePL+jWDijVxwV2UvKG0A0Tr6GzpcJt/vd
	 +z4gRznVRyf7Q==
From: Imre Kaloz <kaloz@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/radeon: Sun XVR-300 support on sparc64
Date: Sun, 27 Sep 2026 16:55:03 +0200
Message-ID: <20260927145505.16883-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches get radeon KMS working on the Sun XVR-300, a
FireMV 2200 PCIe (RV370) board, in sparc64 hosts.

Patch 1 fixes an Oops that any posted radeon card on sparc64 hits in
igp_read_bios_from_vram(), which dereferences an ioremap() cookie to
check the VBIOS signature. It is tagged for stable.

Patch 2 adds a legacy connector table for the XVR-300, which has no
COMBIOS for the driver to parse, so both DVI-I outputs are found.
The XVR-300 needs both.

Tested on a Sun Ultra 45 with an XVR-300.

Changes in v2:
- Read the signature with readb() before the allocation instead of
  checking the RAM copy, as radeon_read_bios() does (patch 1).

Imre Kaloz (2):
  drm/radeon: Read the VRAM VBIOS signature with readb()
  drm/radeon: add a connector table for the Sun XVR-300

 drivers/gpu/drm/radeon/radeon_bios.c    |  6 ++-
 drivers/gpu/drm/radeon/radeon_combios.c | 51 +++++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_mode.h    |  3 +-
 3 files changed, 58 insertions(+), 2 deletions(-)


base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.47.3

