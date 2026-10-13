Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0715F52CCFF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904696; cv=none; b=i0Lrwh8PZC8S5cIysSJgBc4g/QZsegZXjhrhC/PWQj/8E2KpbIVY9VN0JlD+dCFnk4jIlGmH1cvuoORy7wE0Hv8i4/JBoTCu+OwuqlfzdH3L/3fyAuC2GchQu07bOPknVFq0OPLA55f5stK/OB5Ovnnr1Gws3GnOGcenBNkeeg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904696; c=relaxed/simple;
	bh=kDw3JVwwLMY2ZAItn6vfGH2uVxj0+SVVpSNQKLAhVuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3a8DE1cIfI12ug/xN/6Vnd/IlHOu9ShXgmU1SL9yeQqjDILUw511JfK03peatqSpPafnjpdNHxe+IYCbUML6eh+oXiQevzy757X9zi3P0jMoaFK19rFpiYEywnjtpjR7yzO8WISmx0prNlI/GKDgnZpoFhh80CGfLI7z6LbDeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tv6NKuqL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tv6NKuqL"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1068640b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904693; x=1792509493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FG8GJ1kN4E/0cy1xDer4O2ZZHhjOfvJCaudPcmzQdI=;
        b=Tv6NKuqLhZRtz1fYhq2QJDl5dgqEOaUZLgphNt70GLq0AgoJwbf21jo0ptzAw9M3Pr
         KqhQTzrqv40xV8IFEx8X5gu2A5r31xCQ1OJnltAajM4AQK73QWXJRXm9taOcjS3R4dtF
         XIqGgTUa5n6u6qwQ+4uMg00drlVwot46Mc3hpDoVCMYp2Zr0mD9AXzdCdoWfFjDrQwgt
         xyht59eVAr4I77HB5lkZhnYO2inigCdE1NotsPxF50ypvI4pHEa7KVU515MUuB6z0O3z
         C4n0xFvxJ5MN7FPzWpnKQUVTxc2xipXxXZe08fcZTKyZdr4MKP0gLDm7MdFDBeLffeI8
         Debw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904693; x=1792509493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/FG8GJ1kN4E/0cy1xDer4O2ZZHhjOfvJCaudPcmzQdI=;
        b=TDWe5mVQP0Htzx5wPh+Pq3GpvFEFvn9rH19tHr4WdHgHumPrg2PzRXuWzbxEzePj3K
         wIfVGIdjTRrVW3mrYTrcrbV4vR15PHHgTrQ0iWUKwNSOsAaWFoGqWP1o/kwRdnZylWYx
         aaJk+4atiLqyAeWbCLoTSz+Zw3BV+L0XOGgav8Mq2tVDjQLO0jaQxJXjrHcti+om9SEr
         GMfRW4lYFHqcQIOfCyPc3eJ7lB1lmhJwIOz9Jege5blkINrZO+vNQ+oECb34a0ES2V8v
         ve1E+jOChSEP0FqCGMzR13MOgMaBBtCOKE63CL4S4ThFQ9M8KEnQWqpS7Cwt8lb8/uRn
         l5gw==
X-Forwarded-Encrypted: i=1; AKwUvBzF/jIJXq3UvEXM/x2khWho7roA9MutAM7x3eCEX5R3sO1kDq/9kc/bBjPFEjpZDQPKcsL6hABipD+3t3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYInKehLmfaBAoJeTUSvckCX6aCq+8D/lpWAliryYHpR7HPyH7x9
	ZHkTz0CvGrhCFoxt3hEgS0myvkYhcj71HKwyTIJ4GHbZlA+Us4AoTiwa
X-Gm-Gg: AYBFou3QPXIb8YGyzF8yAAUUDgOVdxsg84N6Hq6LwjqRhZiJEEniNI4+z1xO+7erQio
	llVVI4YISUjMZYplsAk7h5eugZ9JNfeZfDWqZwga6OIjYk3p8n5GzYv09/q7SYreXxoeEy3ZmW3
	2zt9mK535Refb7n1JeueMVK+QG4rbiJHRtTS+X/tIEXilNvSDedghphr+/CDp196lLB6O8ovt8Y
	0N76qoK4QcmH97l0KBHK6+vNTH+YziXXwV80WgJCypKm7wU2M/QipQ7hBxe8n5Dt4AKLgy9noqy
	UhQxQ3bFqsj6Op5sRcx3Wbp/K+8lt6yV4p4pojrFZ+XOEllNbDE1AeJkkf3XGtWbw2tZPXGbn8Z
	7NeNHMXAYdZlIpxruzKrN5xnlvEBAqWWfM+ZNbd01PjU5xhvaMjdL5+IO/KChtm+3FnW+h/zBcF
	3CCMHJwvStKSs0BpcSBPDB0/L/WRnXPWmqkOPEhVUajPToHAHWXrUVXqvhi/ScZqJH6twGLYIdD
	OlTjAxa63bgMgw/wjP06CRKmyAx
X-Received: by 2002:a05:6a21:3289:b0:3e1:c6b9:af11 with SMTP id adf61e73a8af0-3e1c6b9e13bmr1675977637.56.1791904693394;
        Tue, 13 Oct 2026 08:18:13 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:13 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 03/35] clk: mediatek: mt7622: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:02 +0900
Message-ID: <20261013151734.3177690-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..fae8abda14b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,8 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..cec19447d637 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,8 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
-- 
2.56.0

