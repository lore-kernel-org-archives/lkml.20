Received: from smtp-outgoing-1803.laposte.net (smtp-outgoing-1803.laposte.net [160.92.124.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BFB4825D5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206091; cv=none; b=WGZKRxoFAUVplqba1f924IHp/roCSKwq/edKgEx1hBg01vAGUTvRf3FYP3OMbmisfFFZDnoUhxiaxsC2NpBdFrUnZnZHQfq5ywvmTCfqlgcjwBFDxWcX8x7rUZA2tzWWLPoLtIm6ah24e66L7yI1HcVcKeafxFOOBR9tZM165d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206091; c=relaxed/simple;
	bh=w0JzGI4+Rj0ukqWNo8ylMXQXgrJmTHm7pEq5lr59G9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5iCz96/OfiADxAhI+x+5Mdwps0u6yhpV8j/N/GlcFx8rvlptRA/RCAXPNA8e+AbJkO0uOcSvnfMulWZa/E1CsCyHdOOV9Zw9tgQdOdmMRsSXl5L0ymLvNDCrbzvqBRoVBJnEniZ5u34Or1goZVWPXLSUbSY5a4ou5jJQHE9Sdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=IYm6KXVq; arc=none smtp.client-ip=160.92.124.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="IYm6KXVq"
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Gr36CGz10MQ4","contextId":
 "7682ca06-10ef-447b-8fae-32f653cfad5e"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4hz0Gr36CGz10MQ4;
	Mon,  5 Oct 2026 15:14:44 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Gq2zdcz10MQQ","contextId":
 "6d16b087-e524-40b2-9d69-a2b67756ca2c"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from PAR-95296130.bcg.com (unknown [147.161.232.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4hz0Gq2zdcz10MQQ;
	Mon,  5 Oct 2026 15:14:43 +0200 (CEST)
From: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
To: linux-arm-msm@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Xilin Wu <sophon@radxa.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Saim Shujah <saimzst@gmail.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Subject: [PATCH 0/3] drm/msm/dp: fix dead link-training fallback on Type-C boards
Date: Mon,  5 Oct 2026 15:14:29 +0200
Message-ID: <20261005131432.22840-1-jean-francois.bobier@laposte.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1791206086; bh=w0JzGI4+Rj0ukqWNo8ylMXQXgrJmTHm7pEq5lr59G9w=; h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding; b=IYm6KXVq2/fL7pjuMd7+C55gq8jR3kNnSEzGBCN9DfrB0rGVDPfE9A8qxtQBYeLmX64SU+rU74201HyC3NTUs2QKLw6yjcJW/NfD9jx6ClhhLktKzNqAsBRnJZIgudKR1qs4bUPb8IpZtYKn+K9vGYfl2lnfWP6aVbl4j4mFGOQLpGi53PY8/izWB3eyKns15cCo/y3BDezta86KcGI77R0NjtLFCLlR0tXOSCaF/Oo4vLA5tjXLs/2ZkXNwLeu2tZI9ZJQC540py5o0+uJ0j12nmvVw0k60lxn7d8y3YDFNWwLhw92ocIHa4Uv8xvsxyLBl31bzmdDe324FCi27bQ==;

These three patches come out of bringing up external DisplayPort over
USB-C on a OnePlus 8T (SM8250, msm DP driver). They are not
device-specific: all three are bugs in code paths that run on every
Type-C DP board using this driver, which today includes the Snapdragon
X Elite (x1e80100) laptops as well as phones.

Patch 1 matters most. The link-training rate/lane fallback in
msm_dp_ctrl_setup_main_link() is dead code on every Type-C board, because
its liveness check reads the DP controller's own HPD register, which
never reflects a real signal when HPD arrives out of band through a
drm_dp_hpd_bridge -- which is how every Type-C port gets its HPD. It is
latent: fallback only runs when training fails at full rate, so a good
cable never exercises it. Found with a cable whose lanes 2 and 3 never
achieve clock recovery at any rate.

Patch 2 demotes the per-attempt log lines in that same fallback loop
(plus one unrelated AUX interrupt message) from error to debug level.
Without it, a monitor that settles on two lanes after three attempts
prints nine error lines on a completely healthy attach.

Patch 3 sizes modes in msm_dp_display_mode_valid() against the link's
trained rate/lane count instead of the sink's advertised maximum, so a
fallback doesn't leave the mode list advertising bandwidth the link no
longer carries. It is a partial fix -- making userspace re-probe after a
fallback needs the DRM link-status property, which is the existing
// TODO in msm_dp_bridge_atomic_enable() and is not done here. Happy to
pick that up too if review wants the complete fix before this lands.

All three were found and verified on hardware with a cable that
reliably forces the fallback path (lanes 2 and 3 never complete clock
recovery). DPCD captures and the full fallback sequence are available on
request.

Verified against msm-next as of 5e4a3f7b2 ("drm/msm/dp: add
stream-aware link register accessors"), individually and applied
together in sequence.

Jean-Francois Bobier (3):
  drm/msm/dp: don't gate link-training fallback on the controller's HPD
    block
  drm/msm/dp: don't log an expected link-training fallback as errors
  drm/msm/dp: validate modes against the trained link, not the sink's
    claim

 drivers/gpu/drm/msm/dp/dp_aux.c     |  9 ++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39 +++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++++++++++--
 3 files changed, 70 insertions(+), 16 deletions(-)

--=20
2.55.0

