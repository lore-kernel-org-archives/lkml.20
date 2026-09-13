Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA4A1C5799;
	Sun, 13 Sep 2026 05:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789277862; cv=none; b=BHbXZXLjmVu5pezPX1bYxp16EiiCDYBXiWui1W2zAPOFkdZmSTEV8Y09yZvf8AtppYKqLMQd+1c9qdyYrBKaoFVcVwqXp/+8oQp5NHYkHoWJs03gsK1dMuKfGuuMzxaplYn3maA1R96YtBKeF5oC0Ylvcf3FykfaEd7T0L6xkuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789277862; c=relaxed/simple;
	bh=ZlkByB6dsSCg1vGFiI2LFeu/MRssORg05ev9IV3F2aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZQJn5kp8QlIXc8qEUIg/gn6A9GeWkTdMBAKSpe7wfiOc37HgUWf+x2m+hoALAakUEQ5k7V16yEm9UBahoyy3KtM0+e8F0GjSMfOW3EoLWaNJ+VuRURo3lshBFr+ZNC6WJpj8t/aTy1t5u7hzInSj4VpgqN+c85WveIKcXGz0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=pGF7jf1Q; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="pGF7jf1Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7dYWsdxGnuQpPz+ltIlRzQtSY4Ol6wjxycrTs1kf/Cw=; b=pGF7jf1QxG0ifmyCa3Tuwa7K6X
	cJurF3rSrZzxoVgpFY5nMBHtM8EV2FzFwn2bxum+ia/98vYCdPcV04jQixbeZvhdCkTETvLVIagIJ
	LnDOqs5FHxFK8XgSx8tILpn7AhVMpgN5mXhCNuFZ8IElT7lVKhMwsCGxHHRPW6o7CNcI=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x5cuA-0000000Dxg1-3hux;
	Sun, 13 Sep 2026 08:37:35 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 13 Sep 2026 08:36:35 +0300
Subject: [PATCH 3/9] dt-bindings: display: novatek,nt36672a: Add 5 new
 panels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-nt36672a-panels-v1-3-ce097402c6ea@minlexx.ru>
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

Document 5 new panels used in 4 different smartphones produced by
Xiaomi and ASUS:

 * Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
  exact model string is unknown
 * Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)
 * Tianma TL063FVMC43-02 for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
 * Tianma TL060FVXS16-00 for Xiaomi Mi A2 smartphone (xiaomi-jasmine)
 * TXD TXDI600YANPA-43V3 Asus Zenfone Max Pro M1 (asus-x00td)

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
 .../devicetree/bindings/display/panel/novatek,nt36672a.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 5d16d85117254..3671fd788a818 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -22,7 +22,12 @@ properties:
   compatible:
     items:
       - enum:
+          - shenchao,fhdplus-video
           - tianma,fhd-video
+          - tianma,tl060fvxs16-00
+          - tianma,tl063fvmca01-00
+          - tianma,tl063fvmc43-02
+          - txd,txdi600yanpa-43v3
       - const: novatek,nt36672a
     description: This indicates the panel manufacturer of the panel that is
       in turn using the NT36672A panel driver. This compatible string

-- 
2.55.0

