Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894582;
	b=qLW53rWQBMlLWbFum5IG8I2yrj7KbnMU/RvuQCUSAlN/slvgkH7ePXlei3tvH0IyRgIh
	 MR1Q5Q4Gdjv4Fqb8PrKR37+jtHz6jWvVaXnNFtl9NLPHyyH5Rq6jxtV++sRArpXY1K4Nn
	 S2vcsJg8PuLzhXIWlv4xfA6NH/AgjjfyuMs2KbUGNHydK7RD41uxspn5Hsfajju1x54s9
	 LI6slTZAJaqo00Q2lpSJLxqGrjeDTlazQ9B2xBSVY8hZxrR97sNtOeDEnZFRKNzb/v1RV
	 SRJW/Z+1A6TwUtot+Auq6gEMXfgTfiUZvbOIzvjftPpw54xW9Jm1hWzqCXs640+jqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894582;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6AQzQankNQ4p5GSyZwTNeT9GWERJykoa+vt/ARzgYpU=;
	b=yZhWTL8EdqO1ViiZK12q+M4yJ2uXaR+YlMzb2UTGMfW0qrB0SmjObn9sUdD1dgrgfqW6
	 9l71FQv3G2kwXo8AnIX+y2+4hN3X4P5swRjwfYMYF8hjZi1xOZehEj3ffiAKO5jJS6+zi
	 3eij5EYP6BEUtkxy1QAkK5URNYZR5JGBnxhSIthMR/ZHQ7KtLD4Y75ON/35DcIVCJZqPN
	 GS9Ieuns9TudZ444sZDxGRFyvZR+4FkeibOUvS/5Zwq3/Q8TmGTbMyMv2rTREJikpjXl/
	 na4Y/feiS4JZHt7ydBmj5YQcpm52UAcdAzoaig57/MI8pqebWS9Y4vmOJI8j83VzERQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=no4OBv0A;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5656070786;
	Thu,  5 Nov 2026 16:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5656070786
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=no4OBv0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793894581; x=1825430581;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3Z0O4+5RumCUzr/1oec2XjDDWA1Q7OPMsIXT7MmiACE=;
  b=no4OBv0A6VASH52nsMJI7zbIXl452GJDWDdTa5eRZplPlP5JllUghY7+
   PDOBqhpJSDsxE+VoupueeBvUzSyUxpQo/1wBG5WaPcSre/QVW5Vn0ghjU
   dsBG5yES+ScGG6xSe1ddQb8iSIXT3NRH6J0rS2JzNiZDyOR89YIx5E282
   4aRQHKUkcfx8zFb0gqIknFmGPS5Te6gGI3ZCj5Z3NWkstv9S7Xcm8o4iT
   kVe215LSxgytrcEa0VoEIqYlHe51rgh+3ZEaoIxf8KgtfUKEIrUQmIsFk
   GhpRz673e9uZSKa0DWGmpT6LNTqAbFjC+21mJpTJAnKt4leQaB7VysoAr
   w==;
X-CSE-ConnectionGUID: 5f4yHJD3QTmYKWHZyasexQ==
X-CSE-MsgGUID: 2fD4sHJ8TBaChYCFN7YPjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2706044"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2706044"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:03:01 -0800
X-CSE-ConnectionGUID: TdoOQ5CpQm6EKMIBns42tQ==
X-CSE-MsgGUID: 56Suo9wMTtyvaYRpTIniFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8795674"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kvehmane-desk1.ger.corp.intel.com) ([10.245.244.200])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:02:54 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Hnyk?= <tomashnyk@gmail.com>,
	Wim Taymans <wtaymans@redhat.com>,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [PATCH 0/2] drm: Populate ELD Port_ID to identify audio endpoints
Date: Thu,  5 Nov 2026 18:02:38 +0200
Message-ID: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

The ELD Port_ID field (bytes 8..15 of the baseline block) is typically
zero on Linux today: drm_edid_to_eld() leaves it empty and no in-tree driver
fills it in. amdgpu, radeon and nouveau pass the raw connector->eld to
the audio component. On the amdgpu DC Azalia register path the value
is a hardcoded constant, the same for every port.
Only closed display drivers fill the value.

Pipewire added support for "Port_ID" in merge request:
https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/3025

As a result, when two identical monitors are connected their ELDs are
byte-identical, and userspace (e.g. PipeWire/WirePlumber) cannot
passively tell which HDMI/DP PCM belongs to which DRM connector.

This series adds a DRM helper that fills Port_ID with a common layout,
and uses it in i915:

  bits 63:48 - PCI domain of the DRM device
  bits 47:32 - PCI bus/device/function of the DRM device
  bits 31:0  - DRM connector object ID

The upper half follows the layout documented for the AMD Azalia sink
info registers (dce_audio.c: "PORT_ID1 = 16bit BDF"). The aim is for
this to become a convention other drivers can opt into. For drivers
that copy connector->eld to the audio component (amdgpu DM, radeon,
nouveau), adopting it would be a one-line change. Comments from the
AMD and nouveau folks on whether the layout works for them are very
welcome.

An alternative would be to fill Port_ID directly in drm_edid_to_eld(),
so every driver gets it without changes. I went with an opt-in helper
to avoid changing the ELD contents seen by all drivers and existing
userspace at once.

The value is exposed to userspace via the ALSA ELD control and
/proc/asound/cardX/eld#Y.

Kai Vehmanen (2):
  drm/eld: Add drm_eld_set_port_id() helper
  drm/i915/audio: Populate ELD Port_ID

 drivers/gpu/drm/drm_eld.c                  | 42 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_audio.c |  2 ++
 include/drm/drm_eld.h                      |  3 ++
 3 files changed, 47 insertions(+)

-- 
2.43.0

