Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4644D797C;
	Wed, 30 Sep 2026 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772188; cv=none; b=Rsb+wbw3UQJ39c0iY9YTPaG8mjqMsU9qsXnu3WvmNRJ6jZ6KgCGtnAivHr0mnj7VHT7r6QWNf6OFS57jL/SsS8hFqKN3n6FENE/PYNUJaxDLWgs8MVYAbziQhUqTpcolgO3WcjD4QMpxivAUdoL4cB8ZHLssfWZQrN9vLzG2AMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772188; c=relaxed/simple;
	bh=B+91dZfpNQgBpc8obPUqZz2vS/XeV4198Uu6VYr4rlc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S5O9tHXHGeDw9J2ZxiWl9nnE2kFaxdLiK7x+/RHlGLkLfKNEPQ4Y9Uerky1j+XbscGUsbQRHgYJKel+jMNNuTorH+zdev3R80bzibuu9WCTLDj6gmsDZ82BKQGgtKZTU64sFfS09nfzoy7Hl254pcgt6M4EUvTVli1FDJ9JDQ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772137t8b4fd8d6
X-QQ-Originating-IP: fnE+b+i/ohPAIiUkRgiQdMNu/77rhCqcRG5r0WQ/Qj4=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14742789130746556607
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH 00/13] drm/msm/dp: Add static HDR support for DP and eDP
Date: Wed, 30 Sep 2026 20:41:44 +0800
Message-Id: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS2MD3dziXN2UAt2MlCJDA90UC5NUQ0MjCyNjQ0sloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAaLeMbnAAAAA=
X-Change-ID: 20260930-msm-dp-hdr10-d84e11282319
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3484; i=sophon@radxa.com;
 h=from:subject:message-id; bh=B+91dZfpNQgBpc8obPUqZz2vS/XeV4198Uu6VYr4rlc=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mRfkqJ/eZdqRefLh82MztReE/mYXUzWK5RDcsTH47
 e+8p5zBHaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACaywYXhfz6bxykmu/V6mtd1
 3K5ODLD/abbl9rN85W3iKX0OG0w2FjP803A6JZUpe3U102+rH7NkqrasrW7wyjbeYVqd1Z965Cs
 HEwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MPI5HzS7e4/K/y5BeTlTROmqcP6JyVor3d6EWJKNdBiShFW4ut/akEqM
	EH6KTkQVSiHKG9vS0+r/0gd/dAtkxOr/PGKecyf8yd6LjaQJZ0sSuaw/B/f9IsgiTcIqLjm
	T/ssVeBV1h4JuLNLlXaHeWXoCuXQKqdRdd1MWT+o/3kV6ulkqlhnDeoonzCkw8yS9WJsagu
	g7h+gD/6nmBeDOP3lbOA1tKuc5hvOFnKuRCgtIR49PfZ6mET996c8EVdGWesZD0xBHMbAT3
	q121PnOOu/HPSbxM0EcdFipYHBdCEhBwtBknqdUrs9tvnbEQ4BpsKoArPkSpEVym2sMm5k4
	OMbp7K15jZUBnMfbIOqissYJV6/LSzHhhmOnV7x15maFU8ljBNc0uWHps7YtRJI7UTa/dbe
	3zXbi6d9N3JG8Z28ccmNGJWX31wPq2hIpNjrApn4kxp98CAiTeEMymSqMxDIQLfml8Ig5zZ
	XEVGWFIuoAJoh7mtKFYPAoKVbKRzceUVaQNxA/ijKXVBuKGlZjWdlVipChbhOFByFNwsdpO
	hzKozhJzv2pVCWr50f/jQ1BTiVns9Wb5fGsA9e7FPPinODisn6O+dvk/08fgvZmgwv4184I
	EUOVC1J4lnmDFBrdSqY4cgTs+v/cjZ1gaL5EjXiPgcEXvJO8b6XJ7KbtIerSiqbUeIElta/
	RHEK655EGPVpjbrrkd1DBrGZZbPDrdiVyoec5VzAN3Dk/r5aOP1Cz3GTG2NMFrsHEdq+s5O
	bCuAUlGbWn++sJLyiRdQa8Ja7aw8gKG4nH23/uKc0TRsUfuuXCYUELsfhnFAwCteW2Nd2VS
	MamebdC+OE4jqN8t5XfoH65ufZGxTXYSdvjHtfYtc4x79ezHrmpbt+kVCLkXGLy7adkC9OZ
	BxY9+BPIurav7zgWd5Ewy1dmhB89PAIuxqGo411KIKpCMGadb105CzmqRwC8rZ5qFF/e1sK
	SL4Ohs4hJ1XWFbD+igfjv1qw/X8IDue5jKfeWAWjyg9gMz+712jyfBnBFzRmbiMw6P4VtUv
	a9/MVYnNZTzCy9bUXBiJA78+SL7Qc=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

This series adds standard KMS static HDR metadata and BT.2020 RGB
signalling to MSM DP and eDP, with HDR10 as the intended use case. It uses
HDR_OUTPUT_METADATA, Colorspace and max bpc. Userspace supplies the HDR
pixel content; DSC, dynamic HDR and tone mapping are outside this series.

Patch 1 allows max bpc registration before connector state allocation and
initializes the corresponding state defaults. Patch 2 prepares generic
SDP slots. Patches 3-5 establish PHY power ownership, serialize HPD state
updates and add complete stream enable rollback, including AUX recovery
for a connected external peer. New error returns are introduced together
with their cleanup paths.

Patches 6-8 add deferred link-status notification, capability cache
validity and stream reconstruction for modesets leaving eDP self refresh.
Patches 9-10 add atomic output depth selection and BT.2020 RGB signalling.
The BT.2020 patch includes its own PSR disable/restore handling.

Patch 11 independently fixes the uninitialized debugfs connector pointer.
Patch 12 serializes SDR video-test state changes with mode programming.
Patch 13 adds complete static HDR support: metadata validation and packing,
10 bpc enforcement, Generic2 programming and teardown, stream restoration,
PSR exclusion and arbitration with video-pattern tests. A test request
arriving after atomic check cannot replace the checked HDR output depth.

This series is tested on a Lenovo Yoga Slim 7x using x1e80100.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Xilin Wu (13):
      drm/atomic: Handle max bpc properties before connector state allocation
      drm/msm/dp: Support multiple generic SDP slots
      drm/msm/dp: Track PHY power ownership
      drm/msm/dp: Serialize HPD state updates
      drm/msm/dp: Unwind resources when enabling a stream fails
      drm/msm/dp: Report stream enable failures through link status
      drm/msm/dp: Track validity of cached sink link capabilities
      drm/msm/dp: Rebuild the eDP stream on modesets leaving self refresh
      drm/msm/dp: Track output bit depth in bridge atomic state
      drm/msm/dp: Signal BT.2020 RGB on DP and eDP
      drm/msm/dp: Initialize the debugfs connector pointer
      drm/msm/dp: Serialize video test state changes
      drm/msm/dp: Add static HDR metadata support for DP and eDP

 drivers/gpu/drm/drm_atomic_state_helper.c |   5 +
 drivers/gpu/drm/drm_connector.c           |   6 +-
 drivers/gpu/drm/msm/Kconfig               |   1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c          | 127 +++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h          |   4 +-
 drivers/gpu/drm/msm/dp/dp_debug.c         |  26 +--
 drivers/gpu/drm/msm/dp/dp_debug.h         |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c       | 319 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h       |   8 +-
 drivers/gpu/drm/msm/dp/dp_drm.c           | 118 ++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h           |  12 ++
 drivers/gpu/drm/msm/dp/dp_panel.c         | 103 +++++-----
 drivers/gpu/drm/msm/dp/dp_panel.h         |   8 +
 drivers/gpu/drm/msm/dp/dp_reg.h           |   4 +
 drivers/gpu/drm/msm/dp/dp_utils.c         | 121 +++++++++++-
 drivers/gpu/drm/msm/dp/dp_utils.h         |  21 +-
 16 files changed, 738 insertions(+), 153 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-msm-dp-hdr10-d84e11282319

Best regards,
--  
Xilin Wu <sophon@radxa.com>

