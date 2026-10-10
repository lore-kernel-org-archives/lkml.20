Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76749552B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633356; cv=none; b=bwgoWCMXUYlnPCp5mPt5M+PfOmxBddgEL3OQTi78hMPt0Vypv/lv1M9I2FLT0lpQ1cRR26cUJpPXPuhvlS7EoRzXrTLeTewf437MTyIKW6ev93rr1sz/tGcucP1rXF+Af8HdniIKL7siqCh467+IgxPWZyX9HlqF5kS4Eoqqeus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633356; c=relaxed/simple;
	bh=hzNGQdqo0pXTvPO8VPsWheGz6KN6mriYPP9WqpOJOz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNJNG6EIIo9QTN3FUI76Q7GgUfdU8lqVmgHOB8YbjzIPWkentJpCb0RaHoeNFTWkM7T/4noIXatauOs6GKs35w6Ob3pKVYXX06uiOVVwHCOlJ1N9Nt9ZouUF90uju8CAoP9Vxcdbo9cflTGK2oRend0VdjfJ5ap/A9y6vlR5ACs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOQGvfY8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOQGvfY8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso311769f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633353; x=1792238153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWSkHUKka7QH4eH23AR+aM1Gs2nsmpiVfZDP2dicIho=;
        b=FOQGvfY8s2HZ/yapuh+TiT5T6OIfVz65KaDu6YLdZeptyDhzkYMo6MSyPblNSmZya+
         hvH/nVWliZeHYMhdj3lT84oTZ+bQePMPFc3oJd2aERvkhe97xB/aiJ3ZP7ArRl2Hjmuv
         UdsgwSQYCFOfwYhrqy/lLcWMhm9BoeiyvT72YQvQNeoaUD5LFSV4dTlre3pXt7NttThL
         YMbEtzH103TclLEWwCecnHUwx8840B1ASvziGEkf+HCOsKQ1QdQfdxV7RMcMxalyOWqL
         v3iztROlU8lr2JJqJ7IqgT3qlBXlDy6aIQoFojQ3x/6MJI0pWc0DuXJBiVac6CPOMo5y
         ReWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633353; x=1792238153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWSkHUKka7QH4eH23AR+aM1Gs2nsmpiVfZDP2dicIho=;
        b=ERrFatAzCi3+QQugGCS94WDxWQspU8SPFKU+1LuZC2fJBV2sXTJgfzys8el6j4w0WU
         lepMHIKqlk5bamGAwtvrE/DC0iA4861/KFc41IPhb9cyES2HVMQ/SsqT5pYwXRhGDs6Z
         IyM9RpccQiusw82q6FqJtB8UIgF4B1kkAzMcnPlUdc6yTiIjKwCFhRAbrbJel6J4nuKa
         7lBDqxUUDER5IpXVT3bj3DRzFEPWqgvq7lv4t86Fcrb8mZb0mcw2SS/l6dOZolmVJzAp
         c01OtiMAO+b/DLLjSjMCzfbuc+ObyPPrC2MbFnRqwmTqMbsfYGgRmPgAxcOabhGpcb7h
         Wm0A==
X-Forwarded-Encrypted: i=1; AKwUvByr1K9qwl9gbxvpLmjMBDhxASE3mXOalaWG50WOoa0AdpOY1s0zXibnEgMWpzsLD6kX3pTF/KwCG/XXDNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfxbCxxjhS2Ttlc2KIqBW4UNPg8MKywq8O48JaXE+JICIf1aev
	ONrAdBY+6M2lfgiU8BkDIEgKhOFObWBpBZHxTO7yuGWohh+q+Vad9m/hAoAA1lsr
X-Gm-Gg: AYBFou3OLMd6F8ca6ZxKRQUB7+TZbtmGRhj4kI/7P+XCSg13o/ZscT1IFcvYII6Dups
	AmVmp39+EOfon7bUk6ul8toRXWOC6ocr1T1hqQUG7RiFRTfVLBKOXnA5Tn7YV9c3W/nP0OLZdTX
	EutnQnl8fLxIrIqejXYOFtDvKsIlxwjujUnZRa5+djsaKs0am50COBfp81y2n6jLMVQ06fUcJZQ
	zU06st0SvhY0clQghsNfwzq5noBlPWeXcDIHNs3ZjmqtJzEHW0c6A7bvzB0dpRIdb7bInTKujoB
	c9TeUeknZPLbGuk5bA4sD88qvuB0OQMSATK6/hrcE15KeBZzi7ny/yuR3uGseKqmm5i7SQHA0f1
	GEaZ00w5sVTrp0v0o1Zm3rSHEWnRRz3cCEOVCu+i4DYQCP/N9MFf5uqUH2u5IVjjQiw7fW6wbiE
	qlqb8BPRkNaL+4E8TV4pd/lHOIBrNunjAxxCgD136PLINCOSBtgKfZG2cOIuMrHvpPrw==
X-Received: by 2002:a5d:444d:0:b0:48b:fdd:fbe4 with SMTP id ffacd0b85a97d-48dba9c7d29mr7028135f8f.21.1791633352509;
        Sat, 10 Oct 2026 04:55:52 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:55:52 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
Date: Sat, 10 Oct 2026 13:54:01 +0200
Message-ID: <20261010115539.9237-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hdmi-phy for the MediaTek mt8167 SoC is not compatible with any of
the existing hdmi-phy. Add a separate compatible to describe it.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index ac93069f4801..f0c8ea2c72b1 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8188-hdmi-phy
           - const: mediatek,mt8195-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
+      - const: mediatek,mt8167-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
       - const: mediatek,mt8195-hdmi-phy
 
-- 
2.43.0

