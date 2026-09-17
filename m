Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099CD535FC2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664528; cv=none; b=q6B95Jh3VoEcy/HBNaNeehr/rh8udxU+VirI05NeBGKR2AtTIQBKx+tjqZOQA4F8BIgr5LxQGVAI91oBXSQGbjxfvrkieTVd4RJfa4P2+sOxGECARY26bmXfQq5NkyIZQ1/lTXsbDY5WF88Lqfj8yowcYf7lhfSccG08iNVkS4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664528; c=relaxed/simple;
	bh=XBQni7Y/Y0NSihYgwyZDcK5nopDCnmlSDhhpeREHqXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XP4MA4WkktH4JytZAyHKCiMhPMkpB/1DLpCP73nCAKEyl4XJdVCsnYfVkKCqlzXa/XFM6HraBh4HYvinub+hpXZgf9PAYpD0ms0C+MdKeRZryq5VmDL92LYRY8nnNnzCZFqvQIkFnb26ZOjjRsxemUB1XMq2M0fX6miagETqGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iFTGqkDH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iFTGqkDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789664525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZLSwLuQl37xTTXPl3smRd+44VFQmLk3YryksgVUFqw=;
	b=iFTGqkDHuakX5SEH0WGtQH6O5dFcV+IpzR8AdyELgv8RvSWZIa1CLNlaeoD5kAkrNh6PX/
	NYVYUnGi/R1MooimcRoGceW/iau1+UBxiLbDbLsUYDcQZr7dIMK2RC7Ng1f0d3LjN5E2Eu
	m1LFqJlIMnXGeqQKRI6cBggIKpB/FBo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-zcun155HP1SPUUHemSdCPQ-1; Thu,
 17 Sep 2026 13:02:02 -0400
X-MC-Unique: zcun155HP1SPUUHemSdCPQ-1
X-Mimecast-MFC-AGG-ID: zcun155HP1SPUUHemSdCPQ_1789664520
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E459118E9B2F;
	Thu, 17 Sep 2026 17:01:59 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C26D30002C7;
	Thu, 17 Sep 2026 17:01:57 +0000 (UTC)
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
Subject: [PATCH v5 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Thu, 17 Sep 2026 12:58:36 -0400
Message-ID: <20260917170042.440276-6-lyude@redhat.com>
In-Reply-To: <20260917170042.440276-1-lyude@redhat.com>
References: <20260917170042.440276-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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

