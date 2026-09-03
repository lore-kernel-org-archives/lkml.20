Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47673349B19
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470373; cv=none; b=eGPaivKsM0H/+egSUVM7ufCb7wlvvRcwos2xwaqzeDgQNA2mAzsKHWu0PUDWQM0GjJKcfY0RdgL+Sv+0tQUr+lEX57CBDEUP5Rl2FoM8LJQWMHl74OUX0n1cqGrE6BY1LxkhOTd0rH/oit8UUXJK0JroRasOUE/hwEFqU9Ksav8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470373; c=relaxed/simple;
	bh=ccFv4LBX7kauYIDgIPN8OUqXPDJPIm+Na/RwFRzfmhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txcrT/a1eEkRgJD+QZCpwOF7YNGGoqqbC6NxRu7uJd7Yu+cHu5iE4dn9VnWyFK3IU/Jznr0W1lGbaMMhh/L0UNYsN8bgh1MPMDOCymaqRe5gfbMcRYBNsSA/u88rCTD316oV6XdACQy4ALqV5xxIuDm6+S2UWtSqecI8e0x22+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ifJUSp+V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ifJUSp+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788470363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V+ivPl/bBPynzPSC3l90NNDtIXavG6rGZEe1eNaVeWQ=;
	b=ifJUSp+Vei3HY2xJy31bBVdYtAS0pH7G0YKhKf1y5YG+CfGHRLCCxyLOOEDsIcoiwRdmNR
	3A6ulLLkgfQtTOfI9uDPHTvhLTyiuoLCgRc2+h8SMTA7Wqpu7P3zw6LyMukUfQB2SBCtSd
	14uuCosLJmURKQ7ujKYpJ+F5dO7Qa2c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-uXVg2v7uMqCraDfVrEM2tQ-1; Thu,
 03 Sep 2026 17:19:20 -0400
X-MC-Unique: uXVg2v7uMqCraDfVrEM2tQ-1
X-Mimecast-MFC-AGG-ID: uXVg2v7uMqCraDfVrEM2tQ_1788470358
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BC301955F75;
	Thu,  3 Sep 2026 21:19:18 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C53ED1955F70;
	Thu,  3 Sep 2026 21:19:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@lists.freedesktop.org
Cc: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>,
	"David Airlie" <airlied@redhat.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	"Simona Vetter" <simona@ffwll.ch>,
	"Gerd Hoffmann" <kraxel@redhat.com>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Christian Hergert" <christian@sourceandstack.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH 0/2] drm/virtio: Damage clip fixes
Date: Thu,  3 Sep 2026 17:15:50 -0400
Message-ID: <20260903211914.1109100-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

A previous associate of mine asked if someone would be able to help with
upstreaming some work that they had done recently for virtio, and I was
more then happy to help. These fixes help maintain FB damage clips
between framebuffer changes, which were previously discarded even when
userspace provided accumulated per-buffer damage.

Patches apply on top of drm-misc/drm-misc-next.

Christian Hergert (2):
  drm/virtio: preserve damage clips for rendered resources
  drm/virtio: Recalculate ignore_damage_clips on every update

 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)


base-commit: f9c2f70ee41544717b3c209083073db1e21f919b
-- 
2.55.0

