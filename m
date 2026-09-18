Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888447C10F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754273; cv=none; b=R+22cpkTWzoYHGsUf83QhEXMKLk9PS/HFK1KCbCAtdJbjKnT+imXrC97TRM5QEU2Y+CJyHWfKQ23IAE33NOurxFiC0od9P0sdgoBY5MRH/LU02ivPZH71gJzNCr2IOCJ/Tt4tfymM7f60/dh9FeF0G+EIQ32DXF1UxYXmHzKesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754273; c=relaxed/simple;
	bh=Ow7Rwd+Il1QpdirFAZCaeWZNs6hGeXrAUZB7iTS0DXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiqq3OdyyYRw5lXh9hZL0kTDRlDBO3aVm/twX2S1M72kCspGdZ4z+1gWxCdE5212uBZLVJ6MvMGHtO64fookYcAzYEBVwH8Wh49eY/Ddp0vlwE3NDLuUKYd73gNr+EPN68GWaz5tChgt5NPqq78p0oCOJ0L1ScMfouJ79XaUSbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFU6gfJS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFU6gfJS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso835409f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754268; x=1790359068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=;
        b=LFU6gfJS4+nUCtUjGxM0oiYO1HMiNaESrb3YYvpGVKy5ikouc3NwphQUeF4c/92hPK
         1gVv0y5OHjc5QSHZhRW42FSaM2pJGOw38HwKGxBrzDYsWDRldQfSw/LBFi/QRxW3D/tG
         BUShc3q9FBwef0q1oeKqvCqD+awbbFTiaL1r+4vh9iLU7CsQ9JUSQ9gOh4s0gETdX/7x
         E9M+Y2yzYdiYsklFWj5pQQt2z+25CgnSra7A+egV04RKMbCHy3OLVvVQ5tbXDqToTA7I
         w29sSBrRXQlsDvccSZrLDL/EJJwuPg+WMiL7qwZmIWjlIcrhLg3Sz4KE2nh6oml9R6+t
         PtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754268; x=1790359068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=;
        b=qaeW8hCxJhUI+2B2Vyb98zLO4kcMDEHhEoFaQhU85UL8wqtE8rnq41zvkoR+IBFBSZ
         iz3uTbfHOAxKMdnOrucG2A5S6NvxIN+DpGBbVK1Y7a/3uZY1VaLpsFkXCnA0WEfxu2M+
         XflHe2rsCDgfXoV+1IpLfHAfs4RoGYO7y/32XTLT6ozuUx6WmmTBAdfG9p82ZxIkeowQ
         gLYEwyXUxDzYQRjitov8/GypQorI2EoA/DXJ4Pz/0x5qS/pEbC8TrA73G8V4Rp6lI+Ng
         Wv5Xz7SCBydyb8iV3jd13dzr7wRwR17tNAg+vZBlqDxtY4yV7syA7jg80p7ZExCADgVu
         /TLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD06NborqVJSb2XPfFbEr77GJSbno3Hu3jymJyYgHtptwOuAciKVKJ8GuSzBFC/iCAwm2X2N4/R+uxRGA=@vger.kernel.org
X-Gm-Message-State: AFuF++kLEKEoe1x3DvXGTRMhhTK8+lnneCOmcWjXEjdlBwj9YTXo5N9q
	KQsXi91ur3fqXMRUN1CoUk+Hbx+pXQZ1Ybm2WJQJlvhB08qbEDzbEmUy
X-Gm-Gg: AYBFou0q+O0WtaDrc6t7mA28hA8F7KOkbHD8KD2Nnyq4bUmjtxXxVbBCX0Rh/c9tmAM
	eM+l0/075Yv0KERgkeXk2UDHQ0yrQjp9aEGkUuTs3ZShpy5iRp958NDS91RjFA6fCyp46G88WkB
	bIBg8aj1dWRrY8ALFGvZrpU8lXv2EAje2Wi+LHB8jjOQV7ock+/ZkmPtAPOEASSsmJcXmvfQa9b
	Rqzq6KRRaXsP47OUbCj6CeZomE2qg3bMoRisyLqnL7W4pkNb2Pz+j7Qr2aV+47E1joiN0hhuQDL
	5eCu2HcChjySQSjmtKn5L/KI3txZgsRS8UE1L84BNEfOlzp4Xfs4pYG9zbT70VqpkEWajI/Mjq1
	TpJhSBROW1QSf17YDTXSKqbqN+bj+zHqxiZFYxxncQ7yrR8fp+HIXAfpMYv8Pum9CRA1N2d6210
	xWUN+cOHW6OT1Qr2FUR4SPImJhMiLYRYB8s46VFRJoXjQXgmkGHDtKX6ndJ9YEjh/7IPw=
X-Received: by 2002:a05:6000:1785:b0:486:f282:e66b with SMTP id ffacd0b85a97d-4871e20f97amr7779772f8f.2.1789754267647;
        Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Fri, 18 Sep 2026 19:55:25 +0200
Message-ID: <20260918175736.355305-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
one can be routed to a DPI display while the other is wired to the HDMI
block. They are not compatible with any other device, so add a new
compatible to describe them in the device tree.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..6cd96a5cd4ae 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - mediatek,mt2701-dpi
           - mediatek,mt7623-dpi
+          - mediatek,mt8167-dpi
           - mediatek,mt8173-dpi
           - mediatek,mt8183-dpi
           - mediatek,mt8186-dpi
-- 
2.43.0

