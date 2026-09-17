Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8A51DAFE;
	Thu, 17 Sep 2026 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663470; cv=none; b=ZcSRzfaINfe4aU0gv3bT7JOshC5C29OM1XF7EhXsgfJMCzco6FVh0Ec0t0HZVBJ3ddNJj4AJ34faseTZQ+arxrNs9fAxu5XrBUJIZATwMmP5Svn77h7gN24b2H4HGyyZga0pOLG6jZx0crRQQelg2CwgDAdik+wUzFPqFRiGv0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663470; c=relaxed/simple;
	bh=XB/w2KjdN0WT16TajgKPI5CXgOF71xFdtBEERo7qQug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJ+QRlSKl8V7dn/prdn2TIKuA5JLrO8n7r6eqzVEy4znEnNsVuFCRtm6jsaQuQsXHS2x9A0CJViNTCZbM/OvVMwPQXxhIFyiZ1bMXs92ePXQqgWrzqCGv3l9CEVS2kbErsSnkt+qvr8Fm92ozeurShC6xzt1zC9MNDPukYW9Pj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=PoyvFpYf; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="PoyvFpYf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/jYqEZuD4kf4ItHTv1lpi1LyvDnC63rE7RQMViuw13M=; b=PoyvFpYf2UQeVOovH1gAFrgzFs
	/aoWP9VKNm2T1VXgD4KKqHECl9/G+sem9GfEJ7QWF/Y6qnju1iugM/gwhVIFNe3bKjyf8qV0kWv+H
	3MISOunogeShgNzwvOzra8ff+At/VV4nI/oTYNbFDryaLT5CkiAlDTL+vii86KK1OrEU=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x7FDl-0000000Bw3I-2i0X;
	Thu, 17 Sep 2026 19:44:26 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Thu, 17 Sep 2026 19:43:11 +0300
Subject: [PATCH v2 9/9] MAINTAINERS: Add Alexey Minnekhanov as maintainer
 for NT36672A panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-nt36672a-panels-v2-9-f8de8be5b86f@minlexx.ru>
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
In-Reply-To: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
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
index 6e50747a621c2..80a065264aa86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8393,6 +8393,7 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36532.c
 
 DRM DRIVER FOR NOVATEK NT36672A PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
+M:	Alexey Minnekhanov <alexeymin@minlexx.ru>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml

-- 
2.55.0

