Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB08437448;
	Sun, 11 Oct 2026 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719721; cv=none; b=nw/HTjB1Ar8rnhGDyPLL25tEokAmroHQZfY+VIm0Ko3bvCNNLz7c64CPc6D46/wkqZ6f4NtfsPwL2iGufPSOQxISBZS7zPMspIfsElNMXW7zBowKniDv0UZJTsGj4eKaby0zOTya0vUpI5D9GgfFKN6iDi/p3U+fNumo+p6xfo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719721; c=relaxed/simple;
	bh=/TWmavkYJdn0p/8UASTT/w56jXfaGGxtRd6o4ZpVIB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mBsp3H6NVkPpLEK1yZiQyvCmOoUx0yuMKbUVe7JGMhoeBguz+0//ClbMmzLp51dJsrB6ZlxzyvJqJUkaZF6SFUAFEEKvnSZyOc53fey6sqZBkzwe87o94qxkCzRBjQARMn55e2Vd0xwKLxRXF95w6Fc9WQ0FItfkvzRuOEPJMFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=gyygpt10; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="gyygpt10"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4dQ4144MBdfgjwIdMaolyxFcu+/i4Ct9CKkeoZuUTs8=; b=gyygpt10OYmPof8qCt1Fvs+dEI
	ZPzXMJ2ygOAJXtehq/B8WS3A9KgvyuAfayw9NM/Tx52MP0tZTZxZPlWTih6xu39z//TER5SqkkbQS
	wMQxtlk1Y+aS+MkUYLa6hSMDeJBq6tBHEoei8meEUE437u5OMhmUmXHVUaCzh19r00sY=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xFs8w-0000000GkAI-39o1;
	Sun, 11 Oct 2026 14:55:07 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 11 Oct 2026 14:54:10 +0300
Subject: [PATCH v3 9/9] MAINTAINERS: Add Alexey Minnekhanov as maintainer
 for NT36672A panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-nt36672a-panels-v3-9-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
In-Reply-To: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
X-Mailer: b4 0.16.0

List myself as maintainer of Novatek NT36672A panels driver
to keep a close eye on it.

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 252b6d7ee1638..e85fbea55ae62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8464,6 +8464,7 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36532.c
 
 DRM DRIVER FOR NOVATEK NT36672A PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
+M:	Alexey Minnekhanov <alexeymin@minlexx.ru>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml

-- 
2.55.0

