Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77BA478842;
	Mon, 28 Sep 2026 21:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629411; cv=none; b=GYWgR9ui06wq4ioUWQWjQfxPSsKfls7tzPgkZpy4oMm0nbHfIsLrYqQxesHzLozrnkPvbCxecpfb3FVjKsH+o2L+qjTQApSwazPmQCD4VZPsQB/vGtKag6Zd1fLa8nL9HXQYvBDpzG3v5G6JEO86c5PnCnslxrOIFAuMmYJ+uv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629411; c=relaxed/simple;
	bh=o/iGwYcaAWSYo8n+W9P1HcArGTCeCpFO8oPDrRgEtMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAnmZXTxlqGSciBdPU/YOilIINFzeCBhs6mvBRNZH+hLTMGc3iSN5+QjTst8FZ7bseSlHlaaVNowRmq0LzDii/lxH24WJeUOCu86OvFqy3tEMAKgG8UcZ0qFKvHaGHUnN6vTkuu72sRnJ4VUxycjoVodk3XoneiZlDso0E6NAVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HGuls2zo; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HGuls2zo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=35znb9juyNK8dZSrrZSjHiu9Q01rJN9c4XWQBBEqxg0=; b=HGuls2zocS7mz6+mimL80Ziqc/
	d5ssq1jPouwK9DuL4qkAsP8tf/AjVOJkoXbWElAJWM/tu465JwGdHhyCDnivs3qZEpkK9hrJxB4B7
	oLskYXEeFTXvC7ww0ybnanFwuKNA/W9YqFjvtLeFsI43igdJLX4jH2vIMRdoOYwyNjpwIhXXtHGcW
	B8mQzKI/Pd6nI0ET1wB7lsRF8c9e+1Ktvp0hc5FGgewkvhyQ8ae1gS/WY0WAVhjfrV0m2NyOqDWuE
	X8K0KReHudEU/QpO0otE3Z4pS0jRKjKhcWMnygJ5wNe7LlVenK0WvGiVMevEEdXC+iJE1WLqPrnxb
	O9RD6q/w==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIVT-00000001eAY-1bch;
	Mon, 28 Sep 2026 21:03:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/gpu: fix location of drm_panel kernel-doc
Date: Mon, 28 Sep 2026 14:03:26 -0700
Message-ID: <20260928210326.1526997-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source file location was changed, so update the documentation
accordingly. Fixes these warnings:

ERROR: Cannot find file ../drivers/gpu/drm/bridge/panel.c
ERROR: Cannot find file ../drivers/gpu/drm/bridge/panel.c
WARNING: No kernel-doc for file ../drivers/gpu/drm/bridge/panel.c

Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/gpu/drm-kms-helpers.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260928.orig/Documentation/gpu/drm-kms-helpers.rst
+++ linux-next-20260928/Documentation/gpu/drm-kms-helpers.rst
@@ -218,7 +218,7 @@ Bridge Connector Helper Reference
 Panel-Bridge Helper Reference
 -----------------------------
 
-.. kernel-doc:: drivers/gpu/drm/bridge/panel.c
+.. kernel-doc:: drivers/gpu/drm/drm_panel.c
    :export:
 
 .. _drm_panel_helper:
