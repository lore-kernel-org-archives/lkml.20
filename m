Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D3D48F000
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990773; cv=none; b=Bzyz9LQ/BdICa9NtZSPrpsZYgUExTgx0NeNh/6Z/SyZl/c9rGDiEtBjif7NxY3l7VyX0kOkzUdu+dJdHNTS6+SWeN3OhSeCOUSq8YYWwXTSiAUMQ8ICNjVQz/dubQKLwXfyxmARJL4msVcLSpCrEEaUWz8tbAiqCefih5PV/GVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990773; c=relaxed/simple;
	bh=m9Mw6P2oxGsZ1t3n45KlrprqxCXpJXI0GfeDIMpOA8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X81CAE/DEbqLKc+e6v+TbeuL8ob5uE+zdMTU5WvrDQG2iG+gbtClUlFqzWd+JOgJG3QTy0hqpR7c2OpbMwRFWfBrbIZh2xeeUNsavUMWtwZDTsGs0fsYFIxWGVdFjr+WqJN6BASPamk1CWQm3d0EvQ5hd1m9JXbzu1QYqmLKpdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnlOrPRw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnlOrPRw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso2297407f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990767; x=1790595567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqNF5JZ6UPtOMyOPCzIVZh05aJF/SoOQw4MLana8W40=;
        b=jnlOrPRwB7McA7Zj8g0IqnSDdqub5HRewI80kpCcP1y/jb50SV/KfdUo1NB123ZtI6
         jT8RgaImmJ9+XYC5tOAQ6E+hL6Pa5P3G34UG+cb29iuvSIN04LrTEbw6j1IM2V1zdPfT
         bQR1EoUDnh4QRzML9plPlgBy90xYXuVtuqPCpuSeF1ZkbYit56RCtwuY0GA9ZLyPM09D
         L8TxMvYDubqd876sDSI0msZOwmHS1JC1lpCha06WPF5bPR5WX9sLhHP3iXR65IYXrHwg
         i9U462EJe8CUa5VTsVs7wOgHxVoeL75eywuSZJRpNGbpfjtfUx2r+pEjb/xjz19M4+nl
         wCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990767; x=1790595567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqNF5JZ6UPtOMyOPCzIVZh05aJF/SoOQw4MLana8W40=;
        b=tIX4ljYvriidwqJZ3Xt+CjBKHM7jSpN23c7o+H6KrmTIE0I59TBn1iZqO9TxdBIkIF
         7/9SNjuWc34pHzEfyJabaT8ps0/joBZahisXhdCnJaN7fG1rQNMi4E7nYBFacv1LZsLN
         tEpyCaLtjY/aV4mPaaNUK9u6tCM5A64ZScIvcanD9so5uTbdHm4hxJJ89RVl0IL3EAo3
         1D+JlTjZY0EZSgq8Gd5/d88wxi1/OVB32KHwLPK3ZWWv4/ZwFkRYxshYrAnrJZr6KgYk
         5fG/fm1UkIWW743F7sZG+a5od3Jiy7RdvFIPZCfkG+Bm5UiPpLwqwuKsNEIHfQigrccs
         7U+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZE3WPlTgyl+hXtF9JuHyajZEIPRxT7SafUKKW1caFdCN/rkmmkdql8vhw6SQfUUaJmdmHDqoBuTmJdoE=@vger.kernel.org
X-Gm-Message-State: AFuF++lNWTK0ebXZZ4UWW3d7gZfnXm5AmQ+u2qHAyXJqiYOlsfi0KQD2
	fK0Lg2AS1S82rGFkev4rZnAmxU8HNyZNUtaQ+C17wJfkw4ZNCJXSFsrt
X-Gm-Gg: AYBFou3dsfH6P8efSDm8gEgI3ZVGduodPcsPfNYg87mUZiMU97dLnxp2Fm8O9JI7CSn
	mKsrk+H5/sqgndkF8X6CJd6Eambel5ChqszOsaX0gVoUuyJZRPXozAciM9GPjDTa56r/6cxGX46
	NR+0m/4F+CJOYAXbzjBQvUXNJOfJFYwI2e7dPF4gwWyOWv8D2erJYzEFPyM0LymfdALjpjrKEuQ
	wKF8sPr47wtXWmMUhJ4u1K0PTwmlpOySRvdjuFzB1hx6Y+XFnHlYRhWWrGXzegnZJMKdi7sTDux
	cOvAGRP5EDOGr3rLkWcMf+0554huwjRgUhdEc6G/aW1TFUXbjvCbD5QJuTkx27i/XlcEP5ZtZsB
	dGY59L+qFO5bQi+UUTRTF4od83vrQP6yVBxOZrIyEOrnPG1GsoQtTgjLaUNL8T3BjHS+HXCwx4L
	89DyMkJ9xXugfOTZGHVND9qjdxTeJJ5t+gxCEtKX7vGD6JSHkAeL2jiw7SrsJk9F2ivaw=
X-Received: by 2002:a05:600c:1c05:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49fc56af038mr172418205e9.13.1789990767340;
        Mon, 21 Sep 2026 04:39:27 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Mon, 21 Sep 2026 13:38:55 +0200
Message-ID: <20260921113914.779393-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113914.779393-1-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

