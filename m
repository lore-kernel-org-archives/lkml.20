Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687301DE4EF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506492; cv=none; b=rxScBtdOzSPs68Zu+hU3y/jCci+F+dQZYdxg4tk89WRDu6zAMyWnnPlo3p/3r6c78ot9PqD9RkHW2Gj3Gjev5nciXPYd+QJebFY4L+V/gSZUfsq6enf41+czhfh/pp0BzF6TIGuT/X1f2WuAlfMlHAoQ9/Jrni84ej25Z/lXQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506492; c=relaxed/simple;
	bh=gbb3dXkIQ2xoOszBsTpFOOS/uDjTWzZPHHq2HMZ0kzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUttyNkBtdtgkKZBLs0rAUobf/xfqtg7ai4cbGORP6zLkIApXleZpGAHRTy9+gOfNEbNxxdB0JatpJzWkzJ2bbdaDpSoVLR87zgshQRq1L0wZ4pqKG6Lm+0eP+tPwPOMe+K0YFC3WA2N9ywkFoo/dk+hDl5CzdeKN5nSd/KNlt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N61AfM9y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N61AfM9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789506490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ATpn8ez/0YuEtC0S+/A/Cw0hfbbKsjXiceZVuc6lSs=;
	b=N61AfM9y9k7BUzHYtievVbxPLKVPUXnvywpeui6B/A6Xuhmt9CiwjBB3HMcOgFcqMpSaV4
	khc27GFU8kpglbI09yv/+g5aXm0vAslN8KywW7y3lh+JRblXa/xZjtojbV2QhjV/UTMNj9
	67fmdc5aPHnW7ha62VYKdR5hyoSn9Rc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-0J5yZtvJMDi8q541Fju1Uw-1; Tue,
 15 Sep 2026 17:08:04 -0400
X-MC-Unique: 0J5yZtvJMDi8q541Fju1Uw-1
X-Mimecast-MFC-AGG-ID: 0J5yZtvJMDi8q541Fju1Uw_1789506483
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA9E11869BB8;
	Tue, 15 Sep 2026 21:08:02 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.179])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 53CD61800446;
	Tue, 15 Sep 2026 21:08:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: "Timur Tabi" <ttabi@nvidia.com>,
	"Dave Airlie" <airlied@redhat.com>,
	"Mohamed Ahmed" <mohamedahmedegypt2001@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Kees Cook" <kees@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"David Airlie" <airlied@gmail.com>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Hongling Zeng" <zenghongling@kylinos.cn>,
	"Mel Henning" <mhenning@darkrefraction.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v2 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Tue, 15 Sep 2026 14:51:52 -0400
Message-ID: <20260915210647.695187-6-lyude@redhat.com>
In-Reply-To: <20260915210647.695187-1-lyude@redhat.com>
References: <20260915210647.695187-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Now that we're properly saving the compbit backing stores on fbsr init, we
can start setting bEnteringGcOff = 1 again without things breaking, which
brings us closer to following the exact same code-paths OpenRM does for
fbsr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index feef5104a6241..11f18b3eb6b16 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -135,7 +135,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size)
 	ctrl->hClient = gsp->internal.client.object.handle;
 	ctrl->hSysMem = memlist.handle;
 	ctrl->sysmemAddrOfSuspendResumeData = gsp->sr.meta.addr;
-	ctrl->bEnteringGcoffState = 0;
+	ctrl->bEnteringGcoffState = 1;
 
 	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 	if (ret)
-- 
2.55.0

