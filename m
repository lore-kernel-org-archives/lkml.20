Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E4F48C3E8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785424; cv=none; b=O47kvVfVsT38nshGEBGof03Ov9MaUPITF7iWTUmd+Afprvx5Jb+dTzXjhNJCZg4f4lA/cECp4Bco2OgW1brrRZrA4ZupalfWZXEa3UzxaswalvZcnDmgFufOGuhA1/I7F+jSCzdeRepUHnerOu1WVO77LK6XHvAAo2gs+2Fs5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785424; c=relaxed/simple;
	bh=xSbgvMzagllTBSgRf02MiJIEdnL/T4uRrASpN5vSRRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvYCVGtsWjJYRGmRBGo+DeD/NjGOulV2OKluMqe/q4e5EjVj62acBYb06N36X2pVXUqNEkOpv1jZkvs943LJ5H4nMIDeOACS6zHD4tGx/ie2pwfH72tg+u4gcibrgDCI/NBOhTTPrTUonBN9Hq00UrNpsGJRloKRDqsk2kt3R0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch; spf=pass smtp.mailfrom=cinemaone.ch; dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b=BSzhn4jq; arc=none smtp.client-ip=84.16.66.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b="BSzhn4jq"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hdn3b2TSczXs8;
	Mon,  7 Sep 2026 14:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cinemaone.ch;
	s=20250113; t=1788785419;
	bh=whRlL2++i1D+jNozO5BnCZ9UuYCEK41dbC6Ql96DMBA=;
	h=From:To:Cc:Subject:Date:From;
	b=BSzhn4jqse+BMqrp3imOxB+PXJ4+rkyU4jskopUimHGS+/Rx1ql+67XtGk55xKkjF
	 PGkoj3fXgcSfyMzwxyo7XzsyOrdyE4Ux1iF8EmSRZw1uv5kXvGLgUbNxcdrKM+tj1j
	 9szpNb9brcS3fS/8vtw2ucTMzfCCWUjJkSXil4Ep5kARRPm3x+fYduOh7S0hbasNeB
	 1m5lV7NvLX7+jE5iYcw9d8SXs1sPbUHSc4fba1aDzsQZKY+aLYcqOzopvqoR+2DR7e
	 7xT3ShS6GHM1sYPMmSUOJ6TaWopAR6KrjnO182HwMc5aHrHCj5a9aTdvl2QUMY6oPm
	 u9nxRnUdQ2D8Q==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hdn3Y3K4DzqY3;
	Mon,  7 Sep 2026 14:50:17 +0200 (CEST)
From: Adrian Betschart <adrian.betschart@cinemaone.ch>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm/amd/display: HDMI 1.4 3D output (frame packing, top-and-bottom, side-by-side)
Date: Mon,  7 Sep 2026 14:50:12 +0200
Message-ID: <20260907125015.69811-1-adrian.betschart@cinemaone.ch>
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
rebased onto amd-staging-drm-next and compile-tested there, and the
amdgpu_dm connector (308) and plane (95) KUnit suites pass; the freesync suite
crashes the same way on the unpatched base. All three layouts
engage the projector's 3D mode at 1920x1080p24, RGB 12 bpc, with
correct per-eye geometry (row-coded test frames read back through each
eye of shutter glasses) and correct eye assignment; frame packing is
also the format the projector uses for Blu-ray 3D.

Known limitation, not addressed here: a framebuffer with DCC enabled
does not scan out in a frame-packed mode on this GPU (the first flip
after the modeset never completes and the pipe wedges); the source has
to allocate the 3D framebuffer without DCC. A separate report will
follow once it is better understood.

Two unrelated FRL/DSC issues found on the same setup are tracked as
drm/amd issues 5770 and 5771.

v3:
- 1/3: pass CRTC_STEREO_DOUBLE unconditionally where amdgpu_dm recomputes the
  CRTC fields, as the DRM core does in mode_fixup(); the flag only doubles a
  frame-packing mode, and the previous `flags & DRM_MODE_FLAG_3D_FRAME_PACKING`
  test also matched other 3D layouts (multi-bit field). The saved_mode variant
  is back to its original form, since a stereo mode is no longer a FreeSync
  video mode. Both from the Sashiko review of v2.

v2 (all three findings came from the Sashiko review bot, and all held up):
- 1/3: a stereo mode keeps its own CRTC timing in
  decide_crtc_timing_for_drm_display_mode() - with the native timing
  copied over it, a frame-packed 1080p24 mode (which shares pixel clock
  and totals with 1080p60) lost its doubled timing on a 1080p sink even
  with scaling off; and amdgpu_dm_is_freesync_video_mode() rejects a
  stereo-flagged mode, which otherwise could be replaced by the 2D
  FreeSync base mode and lose its 3D flags. KUnit cases for both.
- 3/3: the plane KUnit mocks now set hdisplay/vdisplay as well as the
  crtc_* size, which drm_mode_get_hv_timing() derives the size from;
  dm_test_helper_check_state_scaling_caps failed otherwise.
- 2/3: unchanged.

Adrian Betschart (3):
  drm/amd/display: support HDMI 1.4 3D modes on HDMI connectors
  drm/amd/display: send the 3D_Ext_Data byte for top-and-bottom too
  drm/amd/display: size frame-packed streams by the doubled timing

 .../display/amdgpu_dm/amdgpu_dm_connector.c   | 58 ++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 13 ++-
 .../tests/amdgpu_dm_connector_test.c          | 80 +++++++++++++++++++
 .../amdgpu_dm/tests/amdgpu_dm_plane_test.c    | 12 +++
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  7 ++
 .../display/modules/info_packet/info_packet.c |  4 +
 6 files changed, 165 insertions(+), 9 deletions(-)

-- 
2.43.0

