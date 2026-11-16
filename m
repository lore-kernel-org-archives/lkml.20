Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792362;
	b=IprU3UvLOvJCtY+OkBy15ABZuUnI3ut4kR1/KYCusaZ62GROQFlSPIOO/7S/E7+hra26
	 Jou1xFlcm5mnTb/gTP6uveS6nRBRJfkrDmZqn8++xGH6n6y2hAaLtGc7gqho7wYtUZh6c
	 q/Qt620FIt/Z9n/l09VxDsHBhVUQqKgDyARj6a2A0TRmc361PF6NnPpeYSz0AR3h+R8sN
	 EMCB19Fgne6NsOVHMOUkS39yeZc87U4ZjliV2Feci7FX4kSOXzi3VJtgmlaQoEXMX3trZ
	 DKfQ5FFfutYDwSatQzfQ/bqhwpfVzvNQ8a4oKUqOSkwYyOoFHgyrfW66yzP83VnwBKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792362;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YyfCPlk7kua1XnBo21cfYhayhHCnTUJd02xfb9GeTXY=;
	b=jwcDIUy+28Glf/KJXb72qKNf/m6tFtFITWrSIh5H6sEX0I3IXEA6POUXTllwK/c9ggkb
	 loIzoPPPiF/eR0NCM+Oy1MQ01AqQna4iQqPuTXxvEqXDMC0DBIjztl1LPfmhMrcFVufpb
	 FtB32d746LqW74SoKwru7bGcYXuCbP7AAntNi5NFwbf0hAuJiBCXr0K0bskP0SjTObC3D
	 Q03Mdyamrcrni7dYPqBKw+BhY5GlWJxFqVoq8fquGk/blXBfMqHLcaS57Lz0KP6FzgWqC
	 p6rMBAt6/ve688Sxr87J45KhswIcONpdAONV8AtQMRqyy+Hm2A3Aoe7lQ/wHOLGGWiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kf8jSpja;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2D9606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kf8jSpja
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794792361; x=1826328361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s2WxC280Ky1U3JJ9u+VxKtRrkFH89DaLzPX3xWfs1Jw=;
  b=kf8jSpjanPLfjVg/8AxoU+rJWSxcAyzebLTZAZDUx8ZSK5/0/mvDyVvU
   UeZGk9ZdZFgMlcoM0ipr67OxPeBdgb40on68vAjCG6vgh3yBc7AQsEOtC
   89yFzsa0ypzcPh0eqdGzwK2zrRDP6EaK/8zwpXNhgCSaVi/4WnDRObMlI
   s+3x/Mwr8wPECtUeY1t3ObflQIOhG6uQJobLr3eVdy5hD1asxskWn0djd
   z0cqtTd3adfznYejTUiBLv3qrYIomxPVuNWDzVvWh9V1zFYtcS4Lx/m9n
   gO1/h5wwG/VEI684bHlhWXueAOCt+B9oDcAiU4mgtuMxN+8MeIO7VXeeB
   w==;
X-CSE-ConnectionGUID: YMvhtXusTPCD8xrqi2vCiQ==
X-CSE-MsgGUID: qBk0r/zgTnCq/0mMVspyTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3398674"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3398674"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 17:26:01 -0800
X-CSE-ConnectionGUID: fc34BERvSC2BZkG/rVDrSA==
X-CSE-MsgGUID: vas2ycPNRcCdvbZyXg6g1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9295543"
Received: from emr-371.sh.intel.com ([10.112.106.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 17:25:58 -0800
From: Baoli Zhang <baoli.zhang@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andriy.shevchenko@linux.intel.com,
	Baoli Zhang <baoli.zhang@linux.intel.com>,
	Yanx L Liu <yanx.l.liu@intel.com>
Subject: [PATCH 3/3] drm/xe/display: Free the KMS objects on DRM device release
Date: Mon, 16 Nov 2026 09:15:04 +0800
Message-ID: <20261116011504.3910139-4-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116011504.3910139-1-baoli.zhang@linux.intel.com>
References: <20261116011504.3910139-1-baoli.zhang@linux.intel.com>
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

xe frees all the KMS objects on unbind, from the xe_display_fini_early()
devres action. If userspace still holds the DRM fd open at that point,
e.g. a display server with framebuffers created through ADDFB, those
framebuffers are freed while still linked on the file's list:

  WARNING: drivers/gpu/drm/drm_mode_config.c:571 at drm_mode_config_cleanup+0x2e7/0x300
  Call Trace:
   intel_display_driver_remove_noirq+0x55/0xb0 [xe]
   xe_display_fini_early+0x37/0x50 [xe]
   devres_release_all+0x94/0xe0
   device_release_driver_internal+0x1c3/0x200
   unbind_store+0xa4/0xb0

  xe 0000:00:02.0: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
  WARNING: drivers/gpu/drm/drm_framebuffer.c:833 at drm_framebuffer_free+0x87/0xa0

and drm_fb_release() touches the freed framebuffers when the fd is
closed later, a use-after-free.

Resources visible to userspace must only be freed with the last
reference to the DRM device, see the DRM device instance documentation
in drm_drv.c. drm_mode_config_init() already registers
drm_mode_config_cleanup() as a drmm action, and the display device is
freed by a drmm action registered before it, so it is still around when
the KMS objects get destroyed.

Stop calling intel_display_driver_mode_config_cleanup() from xe and let
drmm free the KMS objects instead. The encoder hardware teardown still
happens on unbind, through intel_display_driver_remove_noirq().

Fixes: 5b6937b65e45 ("drm/xe/display: move display fini stuff to devm")
Tested-by: Yanx L Liu <yanx.l.liu@intel.com>
Signed-off-by: Baoli Zhang <baoli.zhang@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index d33052a98d942..1c7f08fb9d2ce 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -72,8 +72,11 @@ static void xe_display_fini_early(void *arg)
 	if (!xe->info.probe_display)
 		return;
 
+	/*
+	 * The KMS objects are freed by drmm when the last reference to the DRM
+	 * device is gone, as userspace may still hold the DRM fd open.
+	 */
 	intel_display_driver_remove_noirq(display);
-	intel_display_driver_mode_config_cleanup(display);
 	intel_display_driver_remove_nogem(display);
 	intel_display_power_cleanup(display);
 }
@@ -111,7 +114,6 @@ int xe_display_init_early(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_early, xe);
 err_noirq:
 	intel_display_driver_remove_noirq(display);
-	intel_display_driver_mode_config_cleanup(display);
 	intel_display_power_cleanup(display);
 
 	return err;
-- 
2.43.0

