Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894600;
	b=XDBbpORIFHjmuvDSQZoDtvhWCE16eKGhylWv2BycA2e9PYQc1DCcXh/DbOUmx44UEvnK
	 6GZE9Hyw/F9QAzR+0ZkHG7bovEes52CnqlCJvUhUZ/CESz4oTwK/F69D1GSo6q80fAi/e
	 x+IP+BbrSucbQZVcYcFBVAukBALDkcIyduaNw4z9cu4k9S86Rksxn7t+vbMxo3NYaNaHj
	 jmXYquHtptTBeBzOsraAXWcjw8f0FGfBiYWUIt1BzGFgbWbMKjQ4L2eXSjej5aeRFpROU
	 e1oaeIyzmLneMA4C7L8AXe2Soq8jvmTAQFLWJe2urob3HF+p291gwgCosDP/4xt5IGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894600;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yAXMOqu/YK+JMbUbJ25Qkzhuqxk+/ADzY4h+ust/Uus=;
	b=rO3Jk9HR7aFFOjcwX++CKyEbOt5nSXR4RBOqvVBLkN1VZg4lg9jH9eEtHXjvsfcGExNc
	 /UPecTb7RibB4u0JGRFnR58xeGXC3sfWK+J8Zz3a7uG/JA5/h2asJz8oE5pG2lciuDEVr
	 B4nAGbFHrpXdq1fc1ybAJahpol1ieudqNfBPmCHo4EQkWL8DF25VUMRYpYEVew4IWtce0
	 XEZxMvtbFP/X1Sy8HB/iM6CzCIH/M+zGOkiBJQJnRwde5k5S86nb173i+4H7Jttyz8ME/
	 eCjc8OGmNTURWN3ZGXyNjph41ZSzgJHfMaqRB2b69ympfLfCb/OAM8VuQHyQ3zvCdDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoMGCBpK;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974E606E555;
	Thu,  5 Nov 2026 16:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7974E606E555
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoMGCBpK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793894600; x=1825430600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5A1ID+DV3XCVNTv9Mjjz9nlWW6YzcsEntOZT7aRGMNk=;
  b=WoMGCBpKXMifHxwx/8YZXa9x0tvX5M3TvMvyccC/Ob2EbUNvzC5ogPUI
   t0KDyOC8ffhc8eyoETsOM0F1YJ1JeYTWLCqEXhJ6I4fbHK/kJodUwsip6
   Pwr7jeFxPL82gI9k2snFfVctTMmGP+c6Uo5bL225L2yL5HnuYIZzridMA
   RgfIEMuiQLJNMOd4YvIXG+3XyyRHOv1FD1I7XR5Uf7A7sTAYo9kuKJ2xS
   oG8aZ4lJh7YMivTA+Qy91YDUQfv+S6QtJ4KeVPGwWV4mMQAXVaEgB5S2x
   BST7FqPnXhblfWjXwShjr28+yQnE+7xMiqz4QG01jUVp7yXYTQ1jD0d3i
   Q==;
X-CSE-ConnectionGUID: Q6PcZDqgQD+gaMBgjvc5Tw==
X-CSE-MsgGUID: nV0iWo/MS+i1CNh+/HS/+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2706089"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2706089"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:03:19 -0800
X-CSE-ConnectionGUID: C78hwW1aRtiqLgiCJitF4A==
X-CSE-MsgGUID: p2bUQgOBTUmb6bFfq3fetQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8795710"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kvehmane-desk1.ger.corp.intel.com) ([10.245.244.200])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:03:13 -0800
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
Subject: [PATCH 2/2] drm/i915/audio: Populate ELD Port_ID
Date: Thu,  5 Nov 2026 18:02:40 +0200
Message-ID: <20261105160240.2850042-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
References: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
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

i915 never fills in the ELD Port_ID field, so it is always zero, and
the ELDs of identical monitors connected to different outputs are
byte-identical. Userspace then cannot tell which HDMI/DP PCM belongs to
which DRM connector without toggling the connector audio property.

Use drm_eld_set_port_id() when computing the audio config, so the value
reaches the audio driver through every path: the audio component
get_eld() callback, the hardware ELD buffer, SDVO and LPE audio.

The value is fixed for the lifetime of the connector, so it does not
cause extra audio re-enables when the ELD is compared across commits,
and state readout stays consistent because it is copied from the
programmed ELD.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16693
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 32f8c5e55319..3277e67748ee 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -881,6 +881,8 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
 	mutex_unlock(&connector->eld_mutex);
 
+	drm_eld_set_port_id(crtc_state->eld, connector);
+
 	return true;
 }
 
-- 
2.43.0

