Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5E199947
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506424; cv=none; b=I3Qg6sci5G2zciRjAfK/J7wZJ4+bHLAcwwdifV8+gNDJ5X6zsE+ZhXFwdENoy342BcIbsCztMzjizm0MR4GOsj12GURKidVU2MoUFGcU6+sNvMzEWOeMrDYpe91V9trXssCPJBYiPurc8Y2R6+HWRNgUIqPjAGIfdft7WelUNds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506424; c=relaxed/simple;
	bh=1WYFqH4lWrR9hppQuguNE51BLkBA1ZVaf7I4eKzRY8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNMZO2PDo7DAbajrdEjV03sXTIF3MWpAbTxqVZ9BJqUlD4btaSxAkWj1CNKk5YuFShz6fokthJ4PqRtuz3IBQJwn59JQO8TugDbBKtfz6Rj/3db5f2tnL0DwDR6Ah4liQJOwWWJ7Yy5GqsR1ohGANP9WAdVmaUeciZyO8eml9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hMcRFhGv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hMcRFhGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789506422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XCC8shsiIFCG6ymQVfbHy2NkjZ0M95ZFCt7+WcSpRqw=;
	b=hMcRFhGvbm2XejCmeELHqo6fDofjcWT0R9Ob472Q1Oi5MS2ipN0qUW+pGde/tF4dt57Jq2
	RuQHIdMn2JiyLmJIUIw3LEO3l0csDq9RWJEWFLKyiKWcKazyFgWd4IZz0CTJ3OrNsUvfi8
	5Cc8Wx1OqbltxOaVx5XLYSufttdzyog=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-280-zYT-ogVEP3qBJbNo654LFQ-1; Tue,
 15 Sep 2026 17:06:58 -0400
X-MC-Unique: zYT-ogVEP3qBJbNo654LFQ-1
X-Mimecast-MFC-AGG-ID: zYT-ogVEP3qBJbNo654LFQ_1789506416
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 748E71828AA2;
	Tue, 15 Sep 2026 21:06:55 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.179])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 896101800446;
	Tue, 15 Sep 2026 21:06:52 +0000 (UTC)
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
Subject: [PATCH v2 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM process more closely
Date: Tue, 15 Sep 2026 14:51:47 -0400
Message-ID: <20260915210647.695187-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

While we have runtime PM working a lot more reliably then in the past
with R570, we're still doing things a lot differently then OpenRM. For
instance, we don't save/restore comptag backing stores, and we don't ask
GSP whether it's OK to enter GcOff.

This series fixes this, and gets our runtime PM process to look a lot
closer to OpenRM's by implementing some missing pieces and workarounds.

Tested on my daily-driver desktop with an AD102, a ThinkPad P17 Gen1
with a GA103GLM, a Dell Precision 7780 with an AD103, and my test
machine with a GB206.

Patch series based on drm-misc/drm-misc-next. Branch with patches here:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/nouveau/rpm-openrm-sync

Lyude Paul (5):
  drm/nouveau/gsp/r535: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
  drm/nouveau/gsp/r535: Add support for MEMSYS_GET_STATIC_CONFIG
  drm/nouveau/gsp/r570: Add comp mode workaround from issue #3172217
  drm/nouveau/gsp/r570: Start saving comptag backing stores
  drm/nouveau/gsp/r570: Enable Gcoff in fbsr again

 drivers/gpu/drm/nouveau/include/nvif/cl0080.h | 10 +++
 drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 +++
 drivers/gpu/drm/nouveau/nvif/device.c         | 13 ++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 39 ++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 43 +++++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 52 +++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 77 ++++++++++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  8 ++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 29 +++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        | 50 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +
 14 files changed, 336 insertions(+), 2 deletions(-)


base-commit: 5363e01e4ff03a204cab85292b89cf90c2d1b101
-- 
2.55.0

