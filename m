Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CAE3AB284;
	Sun, 13 Sep 2026 05:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789277875; cv=none; b=G+oPe72/h1ERbeJwRl5Ru32a2Au9pHvkYdvFkUj1pJvTi9LaMaJ+Gi/tzh/5S5QuCjnobd/w8t5mxggAvbSSH56amQjcWHCaDcYm2TpS0JL7ndtlwFfC6bijglht1dgZS6DqmYEMAE8BcwbNRT4OzTUJYC3r9vvp9yhR63wb49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789277875; c=relaxed/simple;
	bh=0BQ6xKjmIi45mmQDEUnZDOzwVStMOY+tGg4O4r/CxtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QKIB8xqYIpz7GW7CR52sIpWikBINq2I0HIHQA4LKJpVfYqDFWriJLmLfTTWNUs9+MTF9FQ/9xFNRqhbiWThjZmXtog8n4PGPMk0QeQxZttW69NstWBtGzIa6/sAFS1L7XTWBJ1Rj1w0K46kMxB0MFcHx1lr9ElkvkARTmjyzzEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=hor6mrqL; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="hor6mrqL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oZUBFJ8W3GLiJA6VWdpiMxHT4YD7XQYQBRfZWELdMIQ=; b=hor6mrqLAwcCVqHHEsBHNHX0dI
	kUUaiJcqOP7Y4TNNgkjnvauuMj2E4sa/HhnS4F0ac3HEAPxoVMDs4gECNofwIxm68T91p3DsAkfGH
	SsarMuq2+8b8nAyNKVVkj6PdAa0ePmpIVBA7dAtfGs5xBz8E5768OP7RuXMWpdptZdAM=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x5cuN-0000000Dxg1-0eRe;
	Sun, 13 Sep 2026 08:37:44 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 13 Sep 2026 08:36:41 +0300
Subject: [PATCH 9/9] MAINTAINERS: Add Alexey Minnekhanov as maintainer for
 NT36672A panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-nt36672a-panels-v1-9-ce097402c6ea@minlexx.ru>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
In-Reply-To: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
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
index 207a6e2db70c8..8a91d04447405 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8400,6 +8400,7 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36532.c
 
 DRM DRIVER FOR NOVATEK NT36672A PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
+M:	Alexey Minnekhanov <alexeymin@minlexx.ru>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml

-- 
2.55.0

