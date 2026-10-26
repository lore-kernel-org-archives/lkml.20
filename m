Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044853;
	b=cn7L7EZdb2rADtGoxDUFAeR17TC3WouIQy2Z/TwEC+Y2BaavO9f0TwfustyO1roimz+X
	 uJGT2VxJWTnLGZuPoXGNsvnzr51eJoqyXszsOxAyRhUWrwmiMkJLaiTe1jlBcdKXDIfwb
	 935eMQpk0/+GJNnehy8jSae9pFgxeYpAK1MciQQwdWeeXC4CT6N2y6ccFr9fA03JK+Xo6
	 15y5CRsOViOc7fGz4sOe9eA5ZzdRfOlnwCX03BniIOqPLD1bizOQUq1+uMOsebm/de3pq
	 VJXSVS0q1S4m9vcooQYDE0ypjfrqUHswiprqDCxXtZw8P4fZWtUVyb36RLMzT02z0NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1DXhhIMIK7fDcj76+CfG5atBgGx0dVSteNxgi9Avyf4=;
	b=Gr79Iu9mncGZg1GdcXm7BGpA+BX/fVsy8e1aO9yzox5zi0viUQEdX99deOrDS64CoIqs
	 sPVkCkaSmHglOzBova+WMl1Xy39JNI9wVfYZrCHbWFsZfR97huLy+VuZxn4o14x3do+Zz
	 92HBQUYQHn2TyUIJMLpWwP5NQ7Wgrr13fRxityxZD5ehBsF2oA5ufzp4iRcivqriBra22
	 fNWofnBUCe2DXg5AX9ci/SztLeLyRARCef24k72DP4UTelByOCqoRumpjqZxtQMhAtP/l
	 XXDf6HKfJN3yKxS4B2JgQ7grPUz1jalWIZvM/ZgX5/r2NdnKbKvlVX7NYAV0EF+r+Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=hpJj1aXy;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610D8606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610D8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=hpJj1aXy
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jD4Hl5wswzlfvq0;
	Mon, 26 Oct 2026 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793044845; x=1795636846; bh=1DXhhIMIK7fDcj76+CfG5atBgGx0dVSteNx
	gi9Avyf4=; b=hpJj1aXyPPwS6IDjbPG9xCA6IHWua1r7+WmeEL0q2nTR46MbRnL
	TknxnSA8f6cY/pWAsHbto7g1Ef284NfOpzKveVHoCsnBZ4rGgnBFEqbGnAtADg38
	Ln8yHceAnMB8rYkLOTz9YUnrUaZwcaps7JBs2xYzlVpZIOmX4Zi993ic1RoN6csR
	Uv26LHe3fnlZsuUfJMOdyYmd+S6UzEk8PwBsoe517EVz9k1sakYp+moYCv1kw1pH
	YBjkMe16QLxWqll/rlvctNz2c9/x6lH+/pP83NppVHJi9N9w5cQUkpgOaRpQvUdC
	SsQ9DKJiGfWhM7lrcuiPUIVJjqEdHkCFpiQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 79e017b6FYzh; Mon, 26 Oct 2026 20:00:45 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jD4Hc4zZgzlfvpc;
	Mon, 26 Oct 2026 20:00:44 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	virtualization@lists.linux.dev
Subject: [PATCH] drm/qxl: Fix a missing unreserve in an error path
Date: Mon, 26 Oct 2026 13:00:36 -0700
Message-ID: <4879712fc70d92a04de63eb81a673cd3d023af80.1793044836.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If qxl_bo_reserve() succeeds and ttm_bo_validate() fails,
qxl_update_area_ioctl() returns without calling qxl_bo_unreserve().
This leaves the buffer object reserved and causes later attempts to
reserve it to hang. Fix this by calling qxl_bo_unreserve() in that
error path.

This has been detected by the Clang thread-safety analyzer.
Compile-tested only.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux.dev
Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/qxl/qxl_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_io=
ctl.c
index 591b026ceff9..40c1eca77b39 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -323,7 +323,7 @@ int qxl_update_area_ioctl(struct drm_device *dev, voi=
d *data, struct drm_file *f
 		qxl_ttm_placement_from_domain(qobj, qobj->type);
 		ret =3D ttm_bo_validate(&qobj->tbo, &qobj->placement, &ctx);
 		if (unlikely(ret))
-			goto out;
+			goto out2;
 	}
=20
 	ret =3D qxl_bo_check_id(qdev, qobj);
