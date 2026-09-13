Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55022D8370;
	Sun, 13 Sep 2026 06:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789280633; cv=none; b=jLq6AVeu/f2o5CBsLlsub9I73TnRX7RNi+PkLX9wtJ/OcLbsD0YwXKwNMVwp8fUSC7ApUVBSz7xa+1GRqvPTCmt8LmQJTE8EX1cf696f5DKJqFkNDzZYkum28Kr+KrS5/RO9p/1cxU+a/M0efklxNxiBrotvbcq+N58nR2U4hvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789280633; c=relaxed/simple;
	bh=nzpakTyWjs8MvKY1d+8y4cgiK+ntyRaDC8/XJNkQLLE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gQh/XbpT7yh8Pwy8BeTjm9LrMLU2BX2JR9Y0sVlaw8O3dmX76BVVQ8ffB5JWK6heQPRvVMgfN4wpqm6Yb7OETIyBkHgTLZNjadIFd6Yg43UY0kiQOMO6aBTPC95fLFxin2TgW6pqhI+HhV5oVbdzfjkEkZB7mumZaMJ+kK0w0VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=fXtyPWq/; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="fXtyPWq/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=b041m3FFV3xdV8s944Kse+crSg3aFNdjdNDNILp69A4=; b=fXtyPWq/YGUFONUzpiG87CI0mR
	9nnElNXy7anUt0s0ipfiYloqOk39cCde2mMT28j3DRe2AqM7blvG+8uEqzO5zSj+MzpvjGQxx4/0z
	O8g87KXtRaD/RafjxsDowd84g04K+kw1VJjmh1kvbiX56c2F4OIMWWm87v94rhLjid4w=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x5cu2-0000000Dxg1-2GZR;
	Sun, 13 Sep 2026 08:37:24 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Subject: [PATCH 0/9] drm/panel: novatek-nt36672a: Extend with 5 new panels
Date: Sun, 13 Sep 2026 08:36:32 +0300
Message-Id: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EMBCA4VeROWvCoI19FXFoGYxIVzqIRLy77
 jp+h/+/QCgwCXySCwIdLPz1EXmaQDdZP5LiPhowQ53VOSq/FVobtGq1nhZRVJTWoDbGuQpitQY
 a+Pwfm/a17G6mbvtt4L4fOkZSOnMAAAA=
X-Change-ID: 20260912-nt36672a-panels-e34a72677bb5
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
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Richard Acayan <mailingradian@gmail.com>, 
 iAboothahir <aboothahirpkd@gmail.com>
X-Mailer: b4 0.16.0

These series make the driver for novatek-nt36672-based panels more
easily extensible and add support for 5 new panels to it, used in
4 different smartphones, all based on NT36672A:

 * Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
  exact model string is unknown
 * Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)
 * Tianma TL063FVMC43-02 for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
 * Tianma TL060FVXS16-00 for Xiaomi Mi A2 smartphone (xiaomi-jasmine)
 * TXD TXDI600YANPA-43V3 Asus Zenfone Max Pro M1 (asus-x00td).

Combining two init sequences into one was previously briefly
discussed in [1].

[1] https://lore.kernel.org/all/20260523035734.6602-1-chintanlike@gmail.com/

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
Alexey Minnekhanov (9):
      dt-bindings: vendor-prefixes: Add Shenzhen TXD Technology Co., Ltd.
      dt-bindings: vendor-prefixes: Add Shenzhen Zhuohong Electronic
      dt-bindings: display: novatek,nt36672a: Add 5 new panels
      drm/panel: novatek-nt36672a: Set driver name to novatek for consistency
      drm/panel: novatek-nt36672a: Combine two init callbacks into one
      drm/panel: novatek-nt36672a: Add 3 panels used in Xiaomi phones
      drm/panel: novatek-nt36672a: Add Tianma panel for Xiaomi Mi A2
      drm/panel: novatek-nt36672a: Add panel for Asus Zenfone Max Pro M1
      MAINTAINERS: Add Alexey Minnekhanov as maintainer for NT36672A panel

 .../bindings/display/panel/novatek,nt36672a.yaml   |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     | 549 +++++++++++++++++++--
 4 files changed, 531 insertions(+), 28 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260912-nt36672a-panels-e34a72677bb5

Best regards,
--  
Alexey Minnekhanov <alexeymin@minlexx.ru>

