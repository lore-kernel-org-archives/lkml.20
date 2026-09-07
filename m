Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5245040F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775607; cv=none; b=cb8+NujOICKx3MVYpnKVVmjNv9+bWIJZtA7fvqv2obEXW+E/N6O7oNIYz1ymp6WUwt0kifBQEVzJArpfIJ1yA6dArrn6ctK2lpOOSb8sDpApxM6e3EFHvrahB2xrXg0BjASxdAnft4uM/6qhyK/X1P1HqD3xbCdlzvuEaBEzvEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775607; c=relaxed/simple;
	bh=6bJFOIKhic4ldS/dlNGX08qmB0YSmi0COg3qLziyhSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QOU6mmpbdAkUyPoWMDnbypFan5nL9q3+vLv3Nu8inZgpVif4Dhf4BckldQHcJURDGKA+QmAFdKV3C081nnT8CxyAtEu5tySaf8rd9/D67UWj2ORDAVXeUg1IKeE19zggmoU4UvS5WgVyTwU6ol6tnqrW0EIk8WZzTDCsgGZNi+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch; spf=pass smtp.mailfrom=cinemaone.ch; dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b=enCOD9xY; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b="enCOD9xY"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hdjQm2tKfzKpk;
	Mon,  7 Sep 2026 12:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cinemaone.ch;
	s=20250113; t=1788775600;
	bh=PeQAfuw42lPz1DtZPvCr2Xjocp62eubj5XDJdveTCwg=;
	h=From:To:Cc:Subject:Date:From;
	b=enCOD9xYPLtxHkCdPN6jBu/Dqi1/u1vf72NB/8/k72tuUMlZDDa9Sxx3yq7JpyMcP
	 MCYZL3DBheHrE0yqG5PjmxIy+nBuxOxgchijcD11aszKXRJGgwwyD2HOcTaDFbZGpU
	 vIQwk9BGmFEpzxHt+dt5uablFFmwPZasv8c2JQt/a7vx8GED0RjLN4PH3RCX4RZ7dM
	 lfWoxNBbCCXhPh34rNSlrWIKWrbB6pNCHVLnKvYF5j+LXEyzy3DGnJt2EpKERUkycK
	 9vtySfV8Jd6bfUPKzrNHSwj9bp8B53uthDpSXPvdGCnrA9iegDeBYJCChZp9Kl01Ic
	 yE8owfarET5XQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hdjQl2wPJzYqM;
	Mon,  7 Sep 2026 12:06:39 +0200 (CEST)
From: Adrian Betschart <adrian.betschart@cinemaone.ch>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/amd/display: HDMI 1.4 3D output (frame packing, top-and-bottom, side-by-side)
Date: Mon,  7 Sep 2026 12:06:23 +0200
Message-ID: <20260907100626.54465-1-adrian.betschart@cinemaone.ch>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

amdgpu has never exposed the HDMI 1.4 3D modes that drm_edid derives
from a sink's HDMI VSDB: stereo_allowed is false on every connector, so
a 3D-capable TV or projector connected to a Radeon card cannot be driven
in frame-packing, top-and-bottom or side-by-side mode, although i915
has supported exactly this for a decade and the media players that
produce 3D frames (Kodi, mpv with 3D filters) only need the mode to
exist.

These three patches add it for native HDMI connectors, in the simplest form
that works on the hardware: the source packs both views into the frame
and the display core scans that frame out as ordinary 2D; the only
3D-specific output is the HDMI vendor infoframe. The reason it has to
be done this way is in patch 1: any of DC's stereo timing formats,
including the SW_PACKED ones, makes the hardware treat the surface as
two views and paint the whole frame into each half. Patch 2 adds the
3D_Ext_Data byte to the top-and-bottom vendor infoframe, without which
at least JVC D-ILA projectors do not engage 3D (Amlogic sources send
it, which is why those work with the same projector). Patch 3 sizes
the stream and the plane viewport by the doubled frame-packing timing
so each eye receives its own view rather than a stretched copy of the
first.

Tested on a Radeon RX 7600 (Navi 33, DCN 3.2.1) driving a JVC
DLA-RS4100 through an HDFury VRROOM, with Kodi (LibreELEC, GBM) as the
source, on a 7.2.3 kernel carrying these patches; the series here is
rebased onto amd-staging-drm-next and compile-tested there. All three
layouts engage the projector's 3D mode at 1920x1080p24, RGB 12 bpc,
with correct per-eye geometry (row-coded test frames read back through
each eye of shutter glasses) and correct eye assignment; frame packing
is also the format the projector uses for Blu-ray 3D.

Known limitation, not addressed here: a framebuffer with DCC enabled
does not scan out in a frame-packed mode on this GPU (the first flip
after the modeset never completes and the pipe wedges); the source has
to allocate the 3D framebuffer without DCC. A separate report will
follow once it is better understood.

Two unrelated FRL/DSC issues found on the same setup are tracked as
drm/amd issues 5770 and 5771.

Adrian Betschart (3):
  drm/amd/display: support HDMI 1.4 3D modes on HDMI connectors
  drm/amd/display: send the 3D_Ext_Data byte for top-and-bottom too
  drm/amd/display: size frame-packed streams by the doubled timing

 .../display/amdgpu_dm/amdgpu_dm_connector.c   | 52 ++++++++++++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 13 +++--
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  7 +++
 .../display/modules/info_packet/info_packet.c |  4 ++
 4 files changed, 66 insertions(+), 10 deletions(-)

-- 
2.43.0

