Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522614DEC1B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549283; cv=pass; b=i/47Kz1gF2ikZoUzu/t1s+IkC2WYFtZaXAkzWHLnOjsDctomUtqnLXp+2/HmGmd/sWiad9RExgkii+GabfyGP1O5AflJQKS2pn4f4/vZBpbEYS7nhR6Eg1TAc0lI7dApu2+LHRCfMpNKBz8FAg+FCmgVbvspoo8yt8akCCpj/l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549283; c=relaxed/simple;
	bh=MeZupZWW/+NgVIa0QWFq4g838qAr5Nw4Xu2qa88GSSw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IBQURwN0VZ4okfATL3gpx7Wa0HeRYBxK2hYczcd5A3SHsyGcuq564G8Uiaxvt3oCLLLbTI9BTe6X6k3E6VW3Kx/SSvEhiVbe59iGwHgA1ANDoRtStQSbvqTzdVMV2QRrSOtaMxgc7bfqPB9EOmpzYSSYF4h6veP6xo3H88fjN3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=EIr2P8y2; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EIr2P8y2"
ARC-Seal: i=1; a=rsa-sha256; t=1791549239; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BX1pKhXnPfNWCvy3bRrTvHZdPRa2itZp3C+rh1LSYa4YizeJhpWPOlADVp9CS1lPxwalrYO+IUyfOWapPmNPP/OwIKLx6AGPocYoeAKJSbQvndzJi8X7+ICLmZpPT/EsjO4vBY17MSRJmc+/H2pZlvpTAUAsCnnoutRetfjtgkg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791549239; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cEl1Ttm0oC7OdEyzB881XBzNQGUQPdJv0QAAhEYfodY=; 
	b=PLmEge95XM5qCtKGLz8BQI+QDDwbjl93gQlsRHTUGLJJdoQ34/qXjo3SGP+hxEyL6XxN4jB81DLOAFFFqkayC9hO+XpfK7tY62w+k+iDYvdhmQlvA80jX+LqfNIAwcZ3uIp1k8CQJ9+1T+/CWNQ1xM+lYbr9fPuKACzDDGLP8pg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791549239;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=cEl1Ttm0oC7OdEyzB881XBzNQGUQPdJv0QAAhEYfodY=;
	b=EIr2P8y2617UDrYhk4/yJhwUcwGwyaCSzLn6dEVasH/O1cTwzgKO3OEza63D2Bwl
	SdbIYpZccHDBOwH01zPDaom434CLlJTsSukzu2o41Cgeck7a7VXcaa4KwU/LLd/wl5n
	FdOHxirMFTEks7xbSCBXDpJke9EgpbMNr5kKfhrQ=
Received: by smtp.zohomail.com with SMTPS id 1791549237591718.083152176741;
	Fri, 9 Oct 2026 05:33:57 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v14 00/15] Collection of fixes for Panfrost: Perfcnt, RPM,
 refactorings
Date: Fri, 09 Oct 2026 13:33:47 +0100
Message-Id: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23TSU7EMBAF0KugrAmqqnhkxT0QC7tcgaCGoIRug
 Vp9d2wQSjBeenpW8r/P3SrLJGt3e3XuFjlN6zS/5gGq66uOn8Lro/RTyhMdARnQNPR8CMck/Th
 9yNo7ijAEHFRw3OUjb4t8L+QT9w8/4/UYn4Xfi1F2PE3r+7x8fl94wrLvlzZ/6RP20KMRTxKC8
 srf8Xw4hDgv4Ybnl67wJ9oAA6oCKAPasolJMRqtW8CwAZZqYCiAojAaDDHB2ALUHvAVoDIA6I0
 bSdja0AL0BjjECtAZGJLxxF68Y2oBZgf8+4kmAza7PowKvNgWYPeAqwBbAMoRR2IknVqA2wAPt
 gJcBpgiRy2O0KkW4HcAUgX4DIh2bsw9MCjNFBB2wr8cEcpHaO3Jx4EZm1VC3BO6JkobIcVRB+3
 EsjQJ2hN1GbD00VCUCC4JQTML3AqJAHUYWBqZTH4OAzrtDNTE5XL5AnTUz/TTAwAA
X-Change-ID: 20260523-claude-fixes-82b03a134a8c
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8849;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=MeZupZWW/+NgVIa0QWFq4g838qAr5Nw4Xu2qa88GSSw=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqyN8uY9C6tuAngZgRQpqtWXICHj8Odxtt4f0Ch
 sfgwpoP3QWJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasjfLgAKCRAOJn5M7lND
 PbaPC/0S8v6KibNwuvIGg/JRN3nN7dEMPSVdIfEiF7ivlWkeWQy/Hi5dTxhQF1fhJ0QS4eCBR+z
 QuSMm8OiDAuRVNBV6CavjRf02jO/soOKnJYBsVx8cJSSd/svziXl6hojCMvZ41aD6QE/8lVEPEv
 BJmU3+eV02q14PflUd6bhBRTxezaUJv8jJbb9ZGI3hZLYgSwbTavpUNsubAMG4Wsoy1gVL8Afxz
 GU6W4uZiaSVNvIEjr1TqMqd1ReAGSW/NenqX2KkuJiJQtavKFwMRDyR0hGMbzlP3YEXPuNdLS8L
 pod3otFjUUapjEvGOZB7sZrUrs5OKH5baQ8tqNra0Kj8UmNCzfzDaKhIR40Ui4dn6DEZ1xuDmvv
 K6uSVMj+/wt8L0fvpQ9UNJ5CeJayd7YXBOxc38daODIL+kdkJFYI0AdW+s+7v5WTb2L3wgxiXAV
 2DQH2E8bj/pWauM553eavSKL9LvFWWLrb6x/ygBU+oPgKSuktdGVELSwZ3yl+NWZmCFtI=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

This patch series began as an assortment of small fixes for some issues
uncovered by Claude. Over time, it has evolved to include many other
fixes for further problems revealed by Sashiko in successive revisions,
and also refactorings and improvements suggested by maintainer
discussions.

A subset of patches submitted in previous revisions was already merged
after they had been reviewed, to avoid this series growing to unmanageable
extents.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
Changes in v14:
- Fixed Sashiko-uncovered issues in the perfcnt-reset fixes commit.
- Changed documentation for new state variable in the main driver file.
- Link to v13: https://patch.msgid.link/20261008-claude-fixes-v13-0-d6a493185860@collabora.com

Changes in v13:
- Added initial clk prepares to avoid clocks being unprepared in the suspend path.
- Remove warning around scheduler's credit count in the RPM suspend path. 
- Reject all values other than '1' in the debugfs reset knob.
- Cleaned the error reporting protocol for perfcnt reset conditions.
- Fixed even more Sashiko issues in perfcnt reset sequence.
- Refined commit message for initial perfcnt cache clean removal patch.
- Link to v12: https://patch.msgid.link/20260929-claude-fixes-v12-0-62beb08de207@collabora.com

Changes in v12:
- Fixed perfcnt and driver init bugs uncovered by Sashiko in v11.
- Fixed stale commit message for PM fixes.
- Link to v11: https://patch.msgid.link/20260925-claude-fixes-v11-0-0dbf5a58e7ce@collabora.com

Changes in v11:
- Fixed bugs about user_count and PM device status at driver init and remove time.
- Documented new uAPI for perfcnt dump ioctl that depends on reset status.
- Fixed issues about internal perfcnt bookkeeping in case of reset.
- Link to v10: https://patch.msgid.link/20260924-claude-fixes-v10-0-755929b3cc19@collabora.com

Changes in v10:
- Improved the logic for the debugfs reset knob.
- Changed perfcnt reset race commit message to reflect true HW behaviour.
- Improved logic of perfcnt reset handling with a state variable instead of booleans.
- Added comments explaning how we handle PM status and references at device init time.
- Fix RM resume clock disable bug uncovered by Sashiko and also changed function naming.
- Link to v9: https://patch.msgid.link/20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com

Changes in v9:
- Extended clk_(enable|disable) consolidation into other runtime callbacks.
- Fixed uAPI and perfcnt/reset interaction errors uncovered by Sashiko.
- Link to v8: https://patch.msgid.link/20260907-claude-fixes-v8-0-c2bcb5e82184@collabora.com

Changes in v8:
- Applied fixes for issues brought up by Sashiko.
- Rolled back some additions from v7: job stopping, IRQ consolidation.
- Applied RPM fixes before moving most driver init code into panfrost_device.c
- Brought back v6 patch that enables MMU IRQs before device is registered.
- Simplified perfcnt reset handling procedure, so that no retry is done in the kernel.
- Link to v7: https://patch.msgid.link/20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com

Changes in v7:
- Again fixed some minor issues reported by Sashiko.
- Made sure the new debugfs reset knob works even when runtime PM isn't enabled.
- Added new patch that handles job termination at driver teardown time.
- Link to v6: https://patch.msgid.link/20260826-claude-fixes-v6-0-78119af409e7@collabora.com

Changes in v6:
- Grafted trivial already-reviwed patches from previous revisions into
their own series so that they could be merged into drm-misc-next.
- Added commits with multiple refactorings, code rearrangements and simplifications.
- Addressed all issues brought up by reviwers and Sashiko in the previous revision.
- Link to v5: https://patch.msgid.link/20260811-claude-fixes-v5-0-3d692c9e98c2@collabora.com

Changes in v5:
- Addressed more issues uncovered by Sashiko.
- Discarded two patches to avoid dealing with too many pre-existing issues at once.
- Biggest change is the re-arrangement of the start sequence, made to look like Panthor.
- Link to v4: https://patch.msgid.link/20260729-claude-fixes-v4-0-01968f2ec77a@collabora.com

Changes in v4:
- Fixed errors and issues uncovered by Sashiko in the previous revision.
- Changed the way RPM checks whether the device is initialised when resuming.
- Simplified perfcnt treatment of potential resets.
- Link to v3: https://patch.msgid.link/20260724-claude-fixes-v3-0-542af61abd0f@collabora.com

Changes in v3:
- Applied some minor suggestions for the first couple of patches in the series.
- Moved shrinker initialisation into gem initialisation.
- Fixed RPM bugs by moving all clock and power initialisation into RPM resume.
- Added patch for reset sequence fixes and also a userspace knob to trigger it.
- Reworked perfcnt fix by having the reset sequence restore its initial state.
- Link to v2: https://patch.msgid.link/20260604-claude-fixes-v2-0-57c6bd4c1655@collabora.com

Changes in v2:
- Fixed race conditions introduced by the previous revision, in the RPM and
HWPerf commits specifically. These can be consulted at [1]
- Don't attempt to suspend the device unconditionally at the end of
probe(), and do it through autosuspend instead.
- Broke the RPM patch into one that fixes PM refcnt proper and another one
for MMU enablement at device init time.
- Moved perfcnt GPU disable helper into its own commmit. Same for
transplating shrinker initialisation and unplug.
- Added 'Fixes' and 'Reported-by' tags to all the relevant commits
- [1] https://sashiko.dev/#/patchset/20260526-claude-fixes-v1-0-16e92eaa4949%40collabora.com
- Link to v1: https://patch.msgid.link/20260526-claude-fixes-v1-0-16e92eaa4949@collabora.com

To: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>
To: Steven Price <steven.price@arm.com>
To: Adrián Larumbe <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Faith Ekstrand <faith.ekstrand@collabora.com>
To: "Marty E. Plummer" <hanetzer@startmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Eric Anholt <eric@anholt.net>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>

---
Adrián Larumbe (15):
      drm/panfrost: Move shrinker initialization and unplug one level down
      drm/panfrost: Move lock and modparam initialisations into their subsystems
      drm/panfrost: Move debugfs initialisation to relevant subsystems
      drm/panfrost: Skip NULL checks for clock enable/disabling
      drm/panfrost: Consolidate device clock management and reset
      drm/panfrost: Fix PM refcnt and autosuspend issues at device probe/remove
      drm/panfrost: Explicitly enable MMU interrupts at device init
      drm/panfrost: Move all DRM device initialisation into device_init()
      drm/panfrost: Warn of RPM get failure at device remove time
      drm/panfrost: Add debugfs knob for manually triggering a GPU reset
      drm/panfrost: Move perfcnt GPU disable sequence into a helper
      drm/panfrost: Skip cache flush/invalidate when enabling perfcnt
      drm/panfrost: Avoid cache flush after perfcnt sample in fully coherent systems
      drm/panfrost: Introduce a reset lock
      drm/panfrost: Fix races between perfcnt and reset sequence

 drivers/gpu/drm/panfrost/panfrost_device.c       | 247 +++++++++++++-----
 drivers/gpu/drm/panfrost/panfrost_device.h       |   5 +
 drivers/gpu/drm/panfrost/panfrost_drv.c          | 198 +-------------
 drivers/gpu/drm/panfrost/panfrost_drv.h          |   9 -
 drivers/gpu/drm/panfrost/panfrost_gem.c          |  64 ++++-
 drivers/gpu/drm/panfrost/panfrost_gem.h          |  10 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c |   9 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c          |   2 +
 drivers/gpu/drm/panfrost/panfrost_job.c          | 103 +++++++-
 drivers/gpu/drm/panfrost/panfrost_job.h          |   4 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c          |  14 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c      | 319 +++++++++++++++--------
 drivers/gpu/drm/panfrost/panfrost_perfcnt.h      |   1 +
 include/uapi/drm/panfrost_drm.h                  |  29 ++-
 14 files changed, 611 insertions(+), 403 deletions(-)
---
base-commit: 3ab04dcce43cd4fdaed94f08f4e6289be4921ea4
change-id: 20260523-claude-fixes-82b03a134a8c

Best regards,
--  
Adrián Larumbe <adrian.larumbe@collabora.com>

