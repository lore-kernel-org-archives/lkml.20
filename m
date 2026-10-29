Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297376;
	b=vHqgBFRoeYuSHQn7NGp5PMpYKp868m2afCsD9g+dxoLH7WWkqKgsQp2KSziXP8JHjF1f
	 pRSYLXIPjg7maG1hc6M4QfILCpzTH2YDzMoc1tj6jafUeYsFVZPsBkqNFxDJb9hjXjflR
	 zGVBnjA8ymuDanFkH6DoynYJprx1a2K4UJJvV6LGmfvJeHGOZcZNKWXADqx5Zf6tBQCGc
	 Dxgm9SGM6b+8SOkxXvOAENz0cZ4mDedp2WZWMuCToFnAzeDgctQGIGRtVlGo7rQxdN9Li
	 47ZI7gBSVZOUPxlF9I10ejneUMwmK+KivM08TZBT2V2qR8AhZokM3f4jXxWmEgf7iJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297376;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=pqGz8QoD0yES0N8UDw6ipHv3HkyvECu9QbozjFVBkhc=;
	b=M8iwOzt67nTbtYHM/gtiiv718QtgWd/tSHvLoNWXT3ZHfvVmRFqRLhMtHKuM3TeZWgJ/
	 HKiViuvDLaNupjcUWiUlGJK87CL/VN0P6jBqoC1eH/nx0bUNuzVtu7yrTJMQWETENbQaU
	 fAF5bo31AAisnwAK28x0PvnJqDQtGkgTtarUPTpUslFYCPhDd2skjsVdmjPFSzx62RsLs
	 50pQ4kp+YewYre+k2GoD8ttWmroRbgOUDtzEzxRljtSgvJrWyY7PwgvCdy9GiflhREPvJ
	 qCQSF10h/nkhMwqRD6sybbrSXbmEghtJs/dY9z6DJSqpJgy5Iyy33WrYvYEyN0FyP4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=FZShw0L2;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E3B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=FZShw0L2
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2898B10BEB9;
	Thu, 29 Oct 2026 19:09:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793297369; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=pqGz8QoD0yES0N8UDw6ipHv3HkyvECu9QbozjFVBkhc=;
	b=FZShw0L2ZrAj0ygKjJWNIs1LDysfLDl1rVYnzQikBBHIUg9FYWgV/NhmmIcIvH1njprlp8
	GvpEaAsqkB/rQbU8rB68T8RAk8P3p3RYon52zkkXTBtIcX0olwy9LExjCl8oGUmGX4bB4P
	HFN279psgGaWDlvePnfg81uV726GBKCcCVr8AFQpSa1Q+SOLx28XVWJo6psUY6KB+UxeN4
	jVPqUTUfMqPec2RdP5EkvMWdLfjvRCDfUYVUsYtcr1im6HoRiisD81ypb5r1j35WvLDC8a
	qh7WOXoTBIMlZ0yrFCxdRxfZILgpufznzwsKacjwtDUFmuAMowfJAMKw6O0tcQ==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mxsfb: Update MAINTAINERS entry
Date: Thu, 29 Oct 2026 19:08:55 +0100
Message-ID: <20261029180925.26792-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
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
X-Last-TLS-Session-Version: TLSv1.3

Fill in updated email address, no functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75ef3d1aa9d6e..fa4dee57bcf8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19168,7 +19168,7 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/tuners/mxl5007t.*
 
 MXSFB DRM DRIVER
-M:	Marek Vasut <marex@denx.de>
+M:	Marek Vasut <marex@nabladev.com>
 M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.53.0

