Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784830;
	b=jH+z9t9jr5p43zIv7rxxnf98PiF7OYUpLVOsN7DTt3jY0m2mjMk+JmBaYh4E0fnKuMWp
	 LVmZqWHJSPGfgephvbhGpYNSkFKMD35lrToHyMU8qF6Y2FmN7Ty2JnJ21L+Uri1Beasdw
	 O8pHVlYR4KDjrizVZSbGbe3I3hxWRxdPxxUtBvSvs+4Yl65xo2uEqtYxyUMdu/vWTaWMT
	 ZEW6eBYZIFmtF2sZSzlPBy2eHmIL2L9aJpsiTOA4jklPPwcLjQcAKTkkbVZb2aqqIDKoh
	 rZ8KaheW4mnbDiO5PFyh1BtBUndlEpRkDGi4HFBk9dDLoOBPA+3SS+Jlz7sCNpcomYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784830;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r41/9PQYjci2f6gpFBVCJ0QhCW0b+3cxK/HrsuCDK2M=;
	b=EMyX8H4ouyb75F5Y25HQZq0dXVneMEvKm3y7tc87r/gLATnt9hLNMsfQyPFNbFqb1v4N
	 jnNoLvv9Dw7bRUGbX/lBNadDsTp3SDR80zIj2nExJAQ2SY8kBzS7YUuNuCqdViJhV/hY/
	 OyZdRhRgtqNm738DksTMwwpOkluIBJjJqrMeacHxUoTP9WYBlffojvZ9c2TeqMD5S2hFq
	 foXoRDkfQ8MzEZSEjTe4qzdsLHDktkR7Y4zCqaspcTb/yU5uJE+HhATbEjHYdtWXsYKlu
	 /f4oXQ3TT46BVAWcftvXBOVq89TQnNXHaR9x4ihlTb6LGlXLuwadUKos8y0mxSDZOCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=f0QgEvlG;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BBE606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BBE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=f0QgEvlG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=f0QgEvlGtr0hFGFIHu0ogaOFbcThCjuubVjB3QcGmZRUNr5GIZ7d522SC6ORdo8+RMhf82OVYgyqM
	 RP7a0uShwdfNnXX1vYPu8FH2xQrG+mFcoQhNdBBCvpRbmedruRhKnUGVBOStNasua9RMEin5t6de2N
	 JdPM7oE791PhuhwA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66aeafbfbd39-69544;
	Wed, 04 Nov 2026 17:33:47 +0800 (CST)
X-RM-TRANSID:2ee66aeafbfbd39-69544
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeafbf81cb-1d563;
	Wed, 04 Nov 2026 17:33:47 +0800 (CST)
X-RM-TRANSID:2ee76aeafbf81cb-1d563
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH 0/3] drm: Fix resource leaks on power-on failure paths
Date: Wed,  4 Nov 2026 17:33:41 +0800
Message-ID: <20261104093345.1674-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes similar resource leak bugs in DRM panel and bridge
drivers.

In all three drivers, a primary resource (regulator or clock) is enabled
first, followed by a secondary resource. If enabling the secondary
resource fails, the drivers return directly without disabling the first
one. Because these resources are reference-counted and the matching
power-off/unprepare callbacks won't be triggered on failure, the
reference counts leak.

Patch 1 and 2 use goto labels to rollback the regulators. Patch 3 is a
void function and explicitly disables the leaked regulator on failure.

Tang Bin (3):
  drm/panel: renesas-r61307: disable vcc on iovcc enable failure
  drm/panel: otm8009a: disable supply on init_sequence failure
  drm/bridge: anx6345: disable dvdd12 on dvdd25 enable failure

 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 1 +
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   | 6 +++++-
 drivers/gpu/drm/panel/panel-renesas-r61307.c       | 6 +++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.52.0.windows.1



