Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782241;
	b=lEyDWNVBVUQ2vGkoSj1aFmGfqkdagQmyfcwF68qX7hkQQ3AuSpLaOCgKbsIj+V33W65t
	 EprD50U2suCGgL7tHl4zj9lgd1aq2TS9r/jsUn6N3/zO15AoA2B/wQ5LXC4/oeGlln6N7
	 f5pTiyVMbqGnme6dwCRT699mkOTggS5CoQ52wP7Tv9cIAIOlgbBck85sR6r2V3VpboANH
	 gOLXV4RO5UbBaftxYnaxVtICR/kuXAEUIX1kYsM7ulo6y8Xctg5plSf519WrNSFwZM4te
	 pgBiCopz+tHzOSt9y803qxcvc6baaMzFdI7jHbulmeXBneMPgqs7DF3FQw/G/U45mjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782241;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dWth10FDJFU0jG0r1fbXQmUeY74B0J7jKneZzGnBmAo=;
	b=cx2wDndkPqC9XYo46HhCE7/uhKtkYL26gX+VUA16IE+RVjMmOYI5TYXTK1wH/n985gdd
	 NaNM3jMRggbd00AqF0eFvWHDsfK/Blc68PUXlQ3m/p4YoQYPpx7HrG/Pn6oZOsGpzukzR
	 HBnY3/tmFp2sQh6PPija7R3NFMN0P2WjkSEtLkynh1tuEk3p/e8w3eEXqlmJ43Dz7Aipc
	 bkA6Hx97ivDEo2zfp/BCNjKbmPrge/Z7op0blxfP9BRSfq3r348fT4Mjg3F7co6Zt4/ef
	 lVs7fSa5leQmUolQ3XniN1Hm+sU1oC6FllGQOZ8QkWP0hLk8EePcGGHHAOx4ebM/2CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="H06A/TS0";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9651606A335
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9651606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=H06A/TS0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=H06A/TS051Jqsx0O/xneDZwyB1eYClsnMAwRYCOz8TChJm1R/F0zSWa+2dkyEV42lV77IIGC9o8OF
	 36TsBtNcHPOC93TSN47eUJrHizAP/Vw0VClf0L53f052BpB4nA0ExKiKDKcde0AjhHR3OeMWSZwTRd
	 tIufOouHC7GYWmOA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86aeaf1d91b6-3beb8;
	Wed, 04 Nov 2026 16:50:38 +0800 (CST)
X-RM-TRANSID:2ee86aeaf1d91b6-3beb8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeaf1dc8a0-1bc06;
	Wed, 04 Nov 2026 16:50:38 +0800 (CST)
X-RM-TRANSID:2ee76aeaf1dc8a0-1bc06
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH 0/2] drm/panel: Fix pp3300 regulator leaks on prepare() failures
Date: Wed,  4 Nov 2026 16:50:33 +0800
Message-ID: <20261104085036.1441-1-tangbin@cmss.chinamobile.com>
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

This series fixes a copy-paste bug in the panel prepare() error paths.

Both the boe-tv101wum-nl6 and ilitek-ili9882t drivers enable pp3300 first, 
but fail to disable it if a subsequent step (like enabling pp1800 or 
sending DCS commands) fails. This leads to a regulator refcount leak 
across repeated prepare failures.

The ili9882t driver was derived from the boe driver, which is why it 
inherited the identical bug.

Tang Bin (2):
  drm/panel: boe-tv101wum-nl6: disable pp3300 on prepare() error paths
  drm/panel: ilitek-ili9882t: disable pp3300 on prepare() error paths

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 4 +++-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.52.0.windows.1



