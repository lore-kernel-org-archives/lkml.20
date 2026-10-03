Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C5347F3DC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044157; cv=none; b=G6ROUxxpck1lPU0eSoYqHyGBqw1bjyjoF0lOughTdv3uNJPuBMv/6GM9orWwbxybkzitfWIqu9roGNwqeIqUFpXhvwtbCEd10Q/4BTde2pKn2ijCzDu7c8vHpn/sZcafGhGIZ9rFvICxVH0BDIpBnYHikGMcNeaI4OQ51lb3/Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044157; c=relaxed/simple;
	bh=TVbnBiDkRX1GOUW/r60HTN+J4gd5iYxSVj2doD4nlSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DOjI6x8JeDDlhahRGn0KsZ3iDrAEye1kVMcq1RwIfuaI+V+yauAOA1rZqocMZ65vlNsXBwx0gwQHUFVsbQaIJqeBcFuYwz5LTlBAIkUaOfrb3ny+XkMP9zx7EQWF20uOvqJ0gk/oD4MtXPe3AGBnZLMLQmNYPoE4IsV/YqEVv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joetYq5e; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joetYq5e"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so3828265e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791044152; x=1791648952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXy/DNnrFOcs2YniGE+Wy2Sq/wAf4lmRqZM5O5dATBs=;
        b=joetYq5en1GZlOevwcO8SXa2COPmNXBhw+/JxqDffqSbF/neFwhPPBa0nzGn4GK0bd
         2MHN+kSXgyQZalrKOza4yd/d4fp9eOhNScYeA0wtUQNMBREpyNCeO3MmmPMs3NT5Roo+
         7bqM/p9n2anjvxFUI+Uqr967VwIJdH/YjX08nXtMU956e2rJf6X4r5S+237fzdiRmcYP
         fCvcvO+YEOjCje0uue2f62OExvcIIv+Ch/IMRd+rhdlbQm0BAQ2XVquZTIBXSE9tAVb0
         7dLJ6d2jqWbeFXNqwu9htLwSzAUHs9ug68Vk1z9lEUyF4+KDMwZ1n4vKJ4Pa6QOKgdMO
         mMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044152; x=1791648952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXy/DNnrFOcs2YniGE+Wy2Sq/wAf4lmRqZM5O5dATBs=;
        b=DmVv9+2aSMx37rvGRBg/woY1PEwXnDaSazrt8ISSHRBMMBpXXG4VSpmwiBYHdRKUN3
         bWLtcN/qlQ3/JDfASeYBU+NYQuT+jAkLp7SZq220Iif6Ixu/o9i5fJINbmb+XMWY+Ieb
         75dTL2Ca+1Wm75+MO0sRnR8R18qgUWnbCR5/wANq3vcBMa9FRiVCIMLzzmnPNWHXortj
         ITxIB1yUKm4fDMjEb8RbwT5wxg02BN6EML3l/EohJ5tOrVH1A/phLES7LxsKGSEVq37o
         o8dyCHofyvg09rqooP9VzSZE2fcdawy6uJRNtwrOzObJ+NabMjTsvwXAYRnPWwXrOpmP
         pYtQ==
X-Forwarded-Encrypted: i=1; AKwUvByK+/VnsYL4Yd3ZWbFSjDbGLkt9ICEL+tZrU9sED1wRs2c9b0tZvYtfCGK3SkaD1rjD4GvIg9eqUaQmZks=@vger.kernel.org
X-Gm-Message-State: AFuF++nzWvBKMKcLHHwGdWFqKgepQE69iVW7xG8f4pAOLbFoMRISaG9Z
	mps0s+w852xNAJGkrZPACYaF1eBcoVqPYhhMrj6CgEhEQ0CdHsPsFY4I
X-Gm-Gg: AYBFou1NesRdnbjOuUQA3xvn2zo14QC4O8jgeo+BkuOQQy7J07uPdaR4Xgr18EWRcqz
	nwYAoa+TnkjiMa8EFWGZ9f3DpZdOJ9W0dvKt2GmiKkPJ+GoFVJAG76wRqS5aWULAUIW3Dn6YmHx
	A4mL1IU/lVYPuIFCi7zfo8kF2N909AxcrOrWZen/bzgwN6q1vslGa1eBp9yldkuP/9awTbr/Fvf
	qzwWOJKxI8dppTGooyAU4hN8byOjuW/5Thu5zLpfXT+pSFobLmZFdcT5/gN9IfhTzDcQc3YijFm
	JybX6Z1Id6CDRwf9tPLRoatRkztzlieEhzw66nFVMeNb5M51CkjB38UbGWFzwtMdPxazEd0ARqS
	29wV+9Q3dkD8Ja75ot0KOSUSfP676LVKDLvA4iKgPfp5B73574OFjaA4Xrejyrmr70H/vlTCcHK
	0K0ArslVe5ic7GtN8c4sA6J3cjp+SWo3Jq0ZGWr1xttP1+PuUBtOqa6cqtjm6j1mOWejur/+Z/N
	jnWepiScbLad1eFpwxVGtcPS3kxzb+49da/E1U9RI971WHv0P3pspiaY/A8nmsxqNNF
X-Received: by 2002:a05:600c:6217:b0:4a0:1ea1:477a with SMTP id 5b1f17b1804b1-4a0276a31b1mr96713305e9.27.1791044151611;
        Sat, 03 Oct 2026 09:15:51 -0700 (PDT)
Received: from localhost (p200300eba703ae00ca7f54fffe019321.dip0.t-ipconnect.de. [2003:eb:a703:ae00:ca7f:54ff:fe01:9321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f98ffsm13461784f8f.38.2026.10.03.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:15:51 -0700 (PDT)
From: =?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 0/2] drm/amd: fix HDMI output with non-HDMI EDID overrides
Date: Sat,  3 Oct 2026 18:15:06 +0200
Message-ID: <20261003161525.23600-1-johanneswueller@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resend: my first attempt at sending v2 went out without any of the Cc
recipients, including the mailing lists. This is the same series,
unchanged. Sorry for the noise! I'm doing these for the first time.

This series lets amdgpu drive an HDMI display at its native resolution
when a non-HDMI EDID is injected via drm.edid_firmware or debugfs
edid_override.

The motivating case is a Dell U3011 (2560x1600) connected via HDMI,
whose native HDMI EDID only advertises CEA modes up to 1920x1080. By
injecting the monitor's DisplayPort EDID (which contains the native
2560x1600 mode), the correct resolution becomes available. However,
the injected EDID lacks an HDMI VSDB, so amdgpu treats the physical
HDMI connector as a passive HDMI-DVI dongle and rejects the required
pixel clock.

Patch 1 adds an edid_overridden flag to drm_connector, set by the
existing EDID override mechanisms in _drm_do_get_edid(), so that
drivers can detect when an override is in effect and adjust their
behavior accordingly, without duplicating the override mechanism.

Patch 2 uses that flag in amdgpu to trust the physical connector type
over the EDID when selecting the signal type.

Tested on AMD Ryzen 9 7950X (Raphael iGPU, DCN 3.1.5) with a Dell U3011
connected via HDMI and drm.edid_firmware=HDMI-A-1:<DisplayPort EDID>:
- amd-staging-drm-next at 53750a937420: the override EDID is loaded,
  but 2560x1600 is pruned from the connector's mode list.
- with this series applied: 2560x1600@60Hz RGB 8bpc works, alongside
  another Dell U3011 connected via DisplayPort in the same mode.

Changes in v2:
- Rebased onto current amd-staging-drm-next.
- Patch 2: follow the move of create_eml_sink() to
  amdgpu_dm_connector.c.
- Dropped "drm/amd: treat max_tmds_clock==0 as unconstrained": The
  return value of adjust_colour_depth_from_display_info() is no longer
  used to reject the stream, so the patch has no effect anymore.
- Dropped "drm/amd: fix force_yuv420/422_output being ignored": The
  flags were replaced by force_yuv_pixel_format.
- I am (hopefully) sending this version to the right people, since v1's
  cover letter only went to the lists. Please let me know otherwise!

v1: https://lore.kernel.org/amd-gfx/20260315223307.45807-1-johanneswueller@gmail.com/

Johannes Wüller (2):
  drm: add edid_overridden flag to drm_connector
  drm/amd: fix HDMI signal type for EDID overrides

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c  | 9 ++++++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c    | 9 ++++++++-
 drivers/gpu/drm/drm_edid.c                               | 2 ++
 include/drm/drm_connector.h                              | 8 ++++++++
 4 files changed, 26 insertions(+), 2 deletions(-)


base-commit: 53750a937420a01acf41bf74010557666f679aab
-- 
2.56.0

