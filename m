Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2315B3CB557
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506620; cv=none; b=oElBDegXfSrAVE3Aj7Jih95kdQg/Ws+DZZ/ABkq+NxrBadE/eGrn3D9RNlSt1LwZldQkWgTvSmmdG4VtAjsKuTECi9D+2HKmyfrZcEbSWCEZa1MYgZF2nohodA+aUojyqLtKcA2Elipkq4GT5uv4EyP30b6Q8TE28Mnw8eRa0+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506620; c=relaxed/simple;
	bh=4k1M7+SWp7DmYbXBdzs3wUisyddSUcsYF9chNgUkBNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCZcWxXTPwmXrwQ1AvFli+uQd/y0v9ssiGGyabrRkZ92sIOdq6QVhmzKpK5S0iXbTXkxS4QyvjoUd5jP/dBDRM2r2EIoFaHKMSz70Qhw4dAUKkvVVF1YWmsX00tDk5AJjCwRlLuHtxk9edXgp01dYgQ97zdTNBXheoTjPNRcvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmz8+enm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmz8+enm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB57B1F000FF;
	Sun, 27 Sep 2026 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790506618;
	bh=gkTKHKcoXI8bgfYLSB7dIJg5NEUl5n0kJSeQ9AUuWU8=;
	h=From:To:Cc:Subject:Date;
	b=nmz8+enmdsrfhLdhPE/S7Kx2I+5/Wx0ppgIGYG918+3auH7kMVEKuQmc3bh1TFrPd
	 GweOLw0sX9KpIu/S53c7zLQqbBetmHcL5R2lM2+8r4Pa+xiBLf7+hEpIQoMEFDVbrR
	 888YyT7k5OKlXQgYW3N4RcMKf3L7Au5BICS2/jSrsLrgqPvWNs//3CeuVInCCdKRgb
	 LInzFqoQLmHXOu6pykrUvj/Nxd35Y0ENTQWL2/ByQPrS4OBAgnUM9vXGiI3AX5aO00
	 Fx3Jkvt3ZL1Ps+UlUNjx3aWVxUcnp57UaR/6bgf7fOjdfpRf7r/cKI3u+MtW0RhaiD
	 w+Bk2eNuVF45g==
From: Imre Kaloz <kaloz@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/radeon: Sun XVR-300 support on sparc64
Date: Sun, 27 Sep 2026 12:55:53 +0200
Message-ID: <20260927105555.8771-1-kaloz@kernel.org>
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

Imre Kaloz (2):
  drm/radeon: Check the VBIOS signature after copying it from VRAM
  drm/radeon: add a connector table for the Sun XVR-300

 drivers/gpu/drm/radeon/radeon_bios.c    | 10 +++--
 drivers/gpu/drm/radeon/radeon_combios.c | 51 +++++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_mode.h    |  3 +-
 3 files changed, 59 insertions(+), 5 deletions(-)


base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.47.3

