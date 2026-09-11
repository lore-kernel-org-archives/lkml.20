Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107613DB651
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165491; cv=none; b=DtuPxkaKfx6jPcqqiKk6tiQLYkPkfgyY2vjC5z6h0hc5aW7+YrOfp9pbLgAm3cPh7ykHnI+voG8Pm3CFG3IjhEQZc9c97uGuqm/GsFQSZz2hWjisIdI5394w7G0P8oNXnNwXX9vA5tcOuGCyR+xjHzWWJoUChySuvRCdDZp/5/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165491; c=relaxed/simple;
	bh=/3yYSnGEA33M5uN9KvFgeKYKLnii1+uHN85Ctr2VRfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JmC1S2fgvj7tLarPCLRMY3b3UMcDZjYyplvOXpiWGUpwZo8LsFkSc2JMJuKgVpvpeRN1SNCgdspQV7M4RgPGa994IiK7wt2eXRFcVW+5FC4hAQwT0jJcmfh/D9Zt+p3Sn5Q41KF9UuswcJt41HgVK3HmgkXrgU7ELwgUH2R89XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MiBQ2pIy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MiBQ2pIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789165483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MLcC3slPi0kXizJ1i2QlzDWQPcjnDpfhBQdjq8/AAys=;
	b=MiBQ2pIyOOqeQDuERRhSs3YiQEM98qmBYEGXjwti2wADAbYae2VXeFSeZ6Yyis7NllEVai
	0cS8HgS4RArEfbuIz5JKJ6zcldDdwKZ//EnlVfFocMQfev+zdcpkvUmXbGcSkKRn4MAuyc
	o7mHUXpcotdGMSqtKpau0vW2Y+EPtBk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-Bj706SCFOnaNXMRUh6bL2A-1; Fri,
 11 Sep 2026 18:24:42 -0400
X-MC-Unique: Bj706SCFOnaNXMRUh6bL2A-1
X-Mimecast-MFC-AGG-ID: Bj706SCFOnaNXMRUh6bL2A_1789165479
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 986AE1953973;
	Fri, 11 Sep 2026 22:24:38 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4A1E19560AB;
	Fri, 11 Sep 2026 22:24:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: "Dave Airlie" <airlied@redhat.com>,
	"Timur Tabi" <ttabi@nvidia.com>,
	"Mohamed Ahmed" <mohamedahmedegypt2001@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
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
Subject: [PATCH 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM process more closely
Date: Fri, 11 Sep 2026 17:49:53 -0400
Message-ID: <20260911222428.752641-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

While we have runtime PM working a lot more reliably then in the past
with R570, we're still doing things a lot differently then OpenRM. For
instance, we don't save/restore comptag backing stores, and we don't ask
GSP whether it's OK to enter GcOff.

This series fixes this, and gets our runtime PM process to look a lot
closer to OpenRM's by implementing some missing pieces and workarounds.

Tested on my daily-driver desktop with an AD102, a ThinkPad P17 Gen1
with a GA103GLM, and a Dell Precision 7780 with an AD103.

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
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  7 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 +++
 drivers/gpu/drm/nouveau/nvif/device.c         | 13 ++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 36 +++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 43 +++++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 52 +++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 76 ++++++++++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  8 ++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 29 +++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        | 50 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +
 14 files changed, 335 insertions(+), 2 deletions(-)


base-commit: 9d4c98219598e77ca7044c453ae6994519ac0a96
-- 
2.55.0

