Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB164EC66C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890512; cv=none; b=Ly/JNu0FjAMhExzZ5BcnO3A6s+kEPvln5x6qof6ixTa9K6jchRhxkviKQZPynge5jjj0ZtOeh8sEHB77U7EZfWOBAbhT6Wt/2ZN6+gik4RuYGV//S4gqOR5X78357RK/UtXmcU3sgerQGeeoWer+/lTvMnWfQ6tbA0aGGWRe9is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890512; c=relaxed/simple;
	bh=nEBAEcr1DpggMNA7XbubOTPWUzXKTrOJxdCh4sDtEpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqDI4fmLkN2maKCyiuvMJVvUaVmH+poxTjpose5y0c+urjR0m8l3bN1whjEZl12WkUtM/zCfOMGEizKujscNiS7+BoW8FJMvfQzThSk16Hptgf+JublTYfBppXpRgo5b3P1rwOSXevPMpFbaSSX9AQf4BD/Q93Ka2zexFmRsPjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0PTmbVM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0PTmbVM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcc6094d7fso2190451e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890507; x=1792495307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/Zy7Y5eanQKJCoQxPls43jtvnUNLhviTL0wISl0Q1Y=;
        b=a0PTmbVMGoF1ttebwqEUGwsMbUMyHnvOVd37Mk29nq81yyuD5kIs/7Ws4JRW/BUZBS
         i7eHo4eKJLa8vVtaCXxbW00t2VxyZF3ENwAJ2yJpxQae2BT4DWujaznK1aryC8WH1l1U
         IQeGfVaDixBVNSycTw5g+rvbb6fXPUJwNqVaA3A6LkVqp19twMxLhPlrPAa0sK+qW8lk
         o/DbczBRekpaTv5N4IXDfNRZtShs0zcZd5rmfigUVIlATirH+lM1E3W77QbGbOGu+niL
         4Cwea3vF8AzGKKeFijSER7tIYw8m+SPvalevfFkYQVM+QE+aJsIQbjTJxsLCMR2XKc6b
         PeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890507; x=1792495307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/Zy7Y5eanQKJCoQxPls43jtvnUNLhviTL0wISl0Q1Y=;
        b=hPzrG5izUEPkrvhXYQ83sli1K3arNP42ZAs/qLuaMgGLB2SnJ4xIaenfSsauh+Z9j7
         zWnySO6nb/anfcmSXETt5+at3Lc1gaOJRw25m5aG14e47TJBiZVw62aXyZCE2v78PWTg
         ethWAmYeXM7E+m9wSO1aPAx+Qdjb+qO/g1lcA363mnQJY/S4r09YtjBpghLttUZhuvN8
         QDdVLGoD8SN9cWv+M3mf44b9yiCTkTLZaYSAZEcNbK+yL8PvppbRyGnYUCp3zE+FyRyq
         JFAXkqoD3/PGtn/gLztuCs67eWoKcGpgG/4GbVrzo9tZWhCrwimIMWGc9J0rGatF7O5x
         FbRw==
X-Forwarded-Encrypted: i=1; AKwUvBxdqAeQTji6xu7akzmk1F2NFKME4IlCSE1gjUqR4Xo9DQxQtzGiPHVZnsEq/HVK2rcpR6BxTRLZFQ9ocLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzoV2QyCVcY6zzA78ZFfGcIzJzxLOW0ttXl1h9xhpNoQ84VLv1
	yc4YZn5YPCd7NJX/6Jg3qbZJx81wsOXWlBiReV/cT8D5TWAsg9mbt28k
X-Gm-Gg: AYBFou1MzQcmSZ7cshae4m0pSSWQusvKHVrOY4KgzDZ8luebi7tRtwo6XwJwj87WuG5
	i1pBy3C9IRDFX55fz8tMzfp2G34WRTHvysoGbU0WW51Csp5o68NGu3Mo588nfuZan6ITkfypX00
	MZhuSIlMuyBgdiFjbxJxqDQtFu6b3u/tpdPlWAGWalH8YGf8HGtLAySvzg8p8YZ+FGceA60w+fU
	qmVakOmdjbJ2EpFBsW9BUFLAolbHtuOQ7O6HGafxY548UnQvOW6u+jlRtdoHVFX3yaga6EaGBsY
	H0i7rKR0//ZmI39hIqbF0o5i32cy2zcOL349vaBSGrJHf9x5c2pKeXsROx2sFzKwuvvKA43qEzc
	+0QsT95bzpaw2KVO3X7ZTFCwc8spVPF1tA0axQrh4vT/3Eb6WklFXkQZ1AtaeJSmvb81NynQrtT
	wFiMiPN2HyaZLB75LnU1809QTqQ7UIKa/YIQ4SejuqfTFK8wCSFyHqcueQQxIBSJ5WmOFbk3isp
	Xo2HCWN/tdh9cZy825OOo2n3d61F+NcbZsCF2p53Ol6taK9ljITRxewXPX0lxzCO/k7m2vhfziV
	W43OvWgo0C0AZpmSMoL5VDFhjES9GA68xwLsog==
X-Received: by 2002:a05:6512:692:b0:5b8:f960:1bd8 with SMTP id 2adb3069b0e04-5bcde8d91d8mr3905853e87.61.1791890506767;
        Tue, 13 Oct 2026 04:21:46 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1116148e87.79.2026.10.13.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:21:46 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/6] dt-bindings: vendor-prefixes: Add ZillTek Technology
Date: Tue, 13 Oct 2026 14:21:20 +0300
Message-ID: <20261013112124.1878296-3-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZillTek Technology Corp. (Hsinchu, Taiwan) makes MEMS microphones and
barometric pressure sensors such as the ZTS8032.

Link: https://www.zilltek.com/
Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..255dc56edc36 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1977,6 +1977,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zilltek,.*":
+    description: ZillTek Technology Corp.
   "^zinitix,.*":
     description: Zinitix Co., Ltd
   "^zkmagic,.*":
-- 
2.55.0

