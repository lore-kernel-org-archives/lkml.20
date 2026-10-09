Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94E375AA8;
	Fri,  9 Oct 2026 03:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515913; cv=none; b=b/59jT3lV3D65cWCWYGUlx9CAvWbu1gZMedNaI6btINrhiLv1e2c1PToOiYa9mDaofx3/ISOw9N0iIGe3yOFyKOjDWfVcZGd29QOwGgPmUaGO4+Iizl3ku3bihNUNLtY7jitUsfHw4H4bX9m9JY+GpexZHPRQDBXXOokL2C69gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515913; c=relaxed/simple;
	bh=146l0DN3W/8cc56zI/r+4Ok/KX8Zd6nBks+pkZ7RVLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VNHowP/CZ6MnDuV1FTeD4qylG9MldE5IssWnfcnfn7R4N1OIcSjbWnjt3jib6Tz4bxw+AoGk2nTQTB+CQEbdNqn+b9DZcXbZUU/0b+fpfOgpofCIE+yoc2jPbwTKyiuCNzFCGSwOUQaR+TajG+fDsca8+dXymmqomE9kyxHemAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515822t7f4751d9
X-QQ-Originating-IP: 7Pk+11nntTD5E8b/1b413pLXlghYhtX9yXW0rSJDyLc=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:16:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 559857501391731083
EX-QQ-RecipientCnt: 30
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH v2 00/20] drm/msm/dp: Add static HDR support for DP and eDP
Date: Fri, 09 Oct 2026 11:15:52 +0800
Message-Id: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOwW7DIBBEf8XiXCp2jYH41P+ocmAXqKnk2AEnS
 hXl34sTqbceR5p58+6ixpJjFWN3FyVec83LqQV86wRP/vQVZQ4tC1Ro1KFXcq6zDKucQgElg9M
 RAB32cBBtspaY8u2J+zy+cr3Qd+RtZ+yNKddtKT/PvyvsvX/QV5CNT5QcIWkk/ig+3Pw7L7M4P
 l7sEs+XZry9DsXqN56a79h51L3RNuKBDQaTErALiYjdEIwK1viBNA366fy30uA1kYGBrWMAGlo
 PtPPJWGeS8s6bnsHiviJfo2wuc97GzmLoEyenkHWTe/wCyUOxCFYBAAA=
X-Change-ID: 20260930-msm-dp-hdr10-d84e11282319
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7844; i=sophon@radxa.com;
 h=from:subject:message-id; bh=146l0DN3W/8cc56zI/r+4Ok/KX8Zd6nBks+pkZ7RVLg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYpYwyB1U2DhxqtNLvw0eEyze1M6YvEVOpKrtcsXb5
 qoDqWrrOkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWwIF6cATCRpBsM/W44Jc5fLv/MPfvWI
 t7DaO27ilVNHJoV6xv+bt2LFsu9Mcxn+u03q9JH/ulz0mpPWqTczGtOPiDG86tGbWlmc+Kxw5aq
 TTAA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: ONcd5u+FjiuQKDQ9m/VJxX9HRm3voESB/cvLf4dEaS5paZpSKpx+Bzae
	B3BPDr9xejahBnjw51eic470nfgOoalBkJzdUIuPNCES/UIoYIZ/wKrqF51zuebmK+MJANP
	jxDMOF8bqs+6QTMinz0KJUZ1vSaCF6pPLjTFkafSlQbKE0kmzLQhMW7+ZiwMkSYgJe2pv/1
	XJQPEW/MgF2bA/4EA88OtOOWuT1Gzi9ovhyY0ZxwPbvVdn5+NJElMztvyepwruymQN9CaIO
	wBTnY6OSD0eOhbT8Sk8y4eOVA7P20ne9giGaflpK5aBBfQ9vceRpNEGq1G07QRGR9+X9tc0
	gbgxCARnetBz/1yF22GrNmzB/3/dmozpob/TaNcqDt5uAPslV+0CCtFnVxdBOmkyLzbGNS2
	VWu8/fxbE9JYTto607B7GDiGY1jc34AZU9ADckaMt26uGCdFO00FMjbYdhwzOLzIqO+mtxL
	nnK/h9DydRV3JHZ6Dx4UxEipHHxp2r9QDZCPnAwYBKRIbdPMBWA/QZHwansfofAuMuJMM99
	iTsX/xiAZUW5Aciw+UJ7Ax1UmWgNu8ZSQQb4LPElLMhNCSBkf4dBNSJqNNK7WkmZEe8yOu8
	hybkJLyQ7IcD8Sc74ebajKBribp5B9wN8PHwxOfY+fEYLX5dwtW6pDI/qyLi62rlwxR/+j4
	5ewm26g1i1lys+1E04Ost4Ytj6cthHknxMQnpnf34kvdISVajq4QJopXXQFOXPF6YozD0yM
	BopTPDZk2Y5bpp2DjUtF0RkUXIErBpAogKyW6GSlcfhJ8rBu4uC40Xg69vKwAvLWLG5VHX8
	PATSbzNEJF5Wn/1cM04M2hYL2oSfvZrAZlb9Dz5uQ8PQSS+tUC5VsToklk2kUhU9DBrErhc
	nvAgL0ISw25BUhczEscarS6yfHMn8XvfY/V3G+OKmIBjHP47ycjU/8w/WHowj4dRNMJ8qfM
	h9dfPTwW+6Jgay5YUDeh/taOJOC7hI1Eoy+QNiC4d/XC+ZcNTKG+EZiv3nkxim0Q3v75evg
	pLmzX3ji0trNaTxlPjO++T7xSwYbCK3z5DpL9ZrA==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

This series adds standard KMS static HDR metadata and BT.2020 RGB
signalling to MSM DP and eDP, with HDR10 as the intended use case. It uses
HDR_OUTPUT_METADATA, Colorspace and max bpc. Userspace supplies the HDR
pixel content; DSC, dynamic HDR and tone mapping are outside this series.

Patches 1-3 allow max bpc registration before connector state allocation,
restore the attached property default, remove the early state allocation
workarounds and register max bpc centrally for non-HDMI bridge connectors.

Patch 4 makes the SDP header packing input const. Patch 5 prepares generic
SDP slots. The HPD state serialization and debugfs connector pointer fixes
are already in linux-next and are not included in this revision. On the
current v7.3-rc5 base, both fixes are applied as prerequisites.

Patches 6-9 move runtime PM calls outside the connection lock, serialize
stream operations with HPD, establish PHY power ownership and add stream
enable rollback, including AUX recovery for a connected external peer.
New error returns are introduced together with their cleanup paths.

Patches 10-12 add deferred link-status notification, persistent eDP link
capability caching and stream reconstruction for modesets leaving eDP self
refresh.
Patch 13 adds atomic output depth selection. Patches 14-17 clear stale MSA
colorimetry, flush VSC removal, exclude YUV420 streams from PSR and move
VSC packets into bridge atomic state. Patch 18 adds BT.2020 RGB signalling.

Patch 19 serializes SDR video-test state changes with mode programming.
Patch 20 adds complete static HDR support: metadata validation and packing,
10 bpc enforcement, Generic2 programming and teardown, stream restoration,
PSR exclusion and arbitration with video-pattern tests. A test request
arriving after atomic check cannot replace the checked HDR output depth.

This series is tested on a Lenovo Yoga Slim 7x using x1e80100.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v2:
- Drop the HPD state serialization and debugfs connector pointer fixes,
  which are already in linux-next.
- Restore max bpc from the property default and remove early connector
  state allocation workarounds, with regression coverage. (Maxime)
- Register non-HDMI max bpc in the bridge connector helper and advertise
  the MSM DP/eDP limit through bridge->max_bpc. (Dmitry)
- Split the const SDP header change into a separate patch. (Dmitry)
- Serialize stream operations and rollback with HPD before tracking PHY
  ownership; keep runtime PM calls outside the connection lock. (Sashiko)
- Clear the sink training pattern before returning a retraining error. (Sashiko)
- Use the link-status property helper and move TODO removal into the
  failure notification patch. (Dmitry)
- Cache eDP link capabilities after the first successful discovery and
  retain them across power transitions. (Dmitry)
- Discover eDP bandwidth limits before atomic check and reject unknown
  limits instead of deferring validation to enable. (Sashiko)
- Keep the checked depth during training fallback and only accept links
  that can carry the unchanged stream. (Dmitry)
- Derive PSR eligibility from the checked VSC state, including YUV420
  modes with default colorimetry. (Sashiko)
- Program the checked VSC packet unchanged for normal streams; rebuild
  it only for video compliance tests. (Dmitry)
- Split MSA cleanup, VSC updates, PSR exclusion and atomic VSC state
  from BT.2020 RGB support. (Dmitry)
- Validate HDR controller support during atomic check. (Sashiko)
- Pass checked VSC/HDR state through stream programming instead of
  copying the configuration into the panel. (Dmitry)
- Link to v1: https://patch.msgid.link/20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Xilin Wu (20):
      drm/atomic: Handle max bpc properties before connector state allocation
      drm/connector: Drop early state allocation for max bpc registration
      drm/bridge-connector: Attach max bpc for non-HDMI bridges
      drm/msm/dp: Accept a const SDP header when packing
      drm/msm/dp: Support multiple generic SDP slots
      drm/msm/dp: Keep runtime PM calls outside the connection lock
      drm/msm/dp: Serialize stream operations with HPD processing
      drm/msm/dp: Track PHY power ownership
      drm/msm/dp: Unwind resources when enabling a stream fails
      drm/msm/dp: Report stream enable failures through link status
      drm/msm/dp: Cache eDP link capabilities after successful discovery
      drm/msm/dp: Rebuild the eDP stream on modesets leaving self refresh
      drm/msm/dp: Track output bit depth in bridge atomic state
      drm/msm/dp: Clear stale MSA colorimetry bits
      drm/msm/dp: Flush VSC updates when leaving YUV420
      drm/msm/dp: Disable PSR for YUV420 streams
      drm/msm/dp: Track VSC packets in bridge atomic state
      drm/msm/dp: Signal BT.2020 RGB on DP and eDP
      drm/msm/dp: Serialize video test state changes
      drm/msm/dp: Add static HDR metadata support for DP and eDP

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c      |   6 -
 drivers/gpu/drm/display/drm_bridge_connector.c |  18 +
 drivers/gpu/drm/drm_atomic_state_helper.c      |   8 +
 drivers/gpu/drm/drm_connector.c                |  22 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   6 -
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c               | 263 ++++++++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h               |   9 +-
 drivers/gpu/drm/msm/dp/dp_debug.c              |  27 +-
 drivers/gpu/drm/msm/dp/dp_debug.h              |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c            | 483 +++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h            |   8 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                | 133 ++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  14 +
 drivers/gpu/drm/msm/dp/dp_panel.c              | 176 +++++----
 drivers/gpu/drm/msm/dp/dp_panel.h              |   9 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_utils.c              | 134 ++++++-
 drivers/gpu/drm/msm/dp/dp_utils.h              |  23 +-
 drivers/gpu/drm/tests/drm_connector_test.c     |  62 ++++
 include/drm/drm_bridge.h                       |  11 +-
 21 files changed, 1128 insertions(+), 297 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-msm-dp-hdr10-d84e11282319
prerequisite-patch-id: a243647e29c62d6ff1c8dfbbc85d60d76a5b4b54
prerequisite-patch-id: 41a4bb615c78c11b576a148af6786f0a8a63c172

Best regards,
--  
Xilin Wu <sophon@radxa.com>

