Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D523DD85E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672213; cv=none; b=qt003FAZWZOqOMxw3PcxIJ9CEfI9qgdz1VLj7wtweaB5WCv3uTt7qsgHz9JTcRLPqFVTq9JvPTbruX/4l3giVoZytXOUCiOjTj7kAY2v7zJc7ynqoq/HC5exAgz/K1MYB5Xv6/fVJzHLNiMzpZl/5rQCcLfhE2iMLeKklFKex/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672213; c=relaxed/simple;
	bh=XBQni7Y/Y0NSihYgwyZDcK5nopDCnmlSDhhpeREHqXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5RcZSzYxIaZtUxO8V4zh6dG93prilmkn/1za1jbyWKYivpKidas9NAUxsEH+LBpkcPjeVw0Ttlds0/Fh7SloI5nDxRIyBfHPqBdkFHWZgrE6j5aRIIzA605Ft2QGbFvXK5moBJ4f/6Yax94nyru1PxHmQ81Ry82UPRMjfxkEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DI010hBd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DI010hBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789672211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZLSwLuQl37xTTXPl3smRd+44VFQmLk3YryksgVUFqw=;
	b=DI010hBdGWbPTvwnrKYYkAq5GiuZNWBgr2OBAUMbzkvnjxU+azR+SIRqG5yRbL0lP5KxWA
	LFoATZsL+aWPFFX89TpzsAMZBHhEyMV0XxCX9xVYC7JOGkQVyaZudjzl5hPaXeG47qkYAG
	eSqAZWbVbAoZp1KWP3bJdnGsVi4VhSw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-L08vBYwrMvevo6MKfy0e6g-1; Thu,
 17 Sep 2026 15:10:05 -0400
X-MC-Unique: L08vBYwrMvevo6MKfy0e6g-1
X-Mimecast-MFC-AGG-ID: L08vBYwrMvevo6MKfy0e6g_1789672203
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5188818301BA;
	Thu, 17 Sep 2026 19:10:03 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ACB8919AC047;
	Thu, 17 Sep 2026 19:10:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>,
	"Timur Tabi" <ttabi@nvidia.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Mohamed Ahmed" <mohamedahmedegypt2001@gmail.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Kees Cook" <kees@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"David Airlie" <airlied@gmail.com>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Mel Henning" <mhenning@darkrefraction.com>,
	"Hongling Zeng" <zenghongling@kylinos.cn>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v6 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Thu, 17 Sep 2026 14:54:29 -0400
Message-ID: <20260917185916.1089621-6-lyude@redhat.com>
In-Reply-To: <20260917185916.1089621-1-lyude@redhat.com>
References: <20260917185916.1089621-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Now that we're properly saving the compbit backing stores on fbsr init, we
can start setting bEnteringGcOff = 1 again without things breaking, which
brings us closer to following the exact same code-paths OpenRM does for
fbsr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index a93a39ef7c690..469e7eed1d6f8 100644
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

