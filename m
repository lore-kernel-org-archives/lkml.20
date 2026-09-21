Received: from mail-pj2-f23.google.com (mail-pj2-f23.google.com [74.125.227.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221A3385A5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961849; cv=none; b=h5VOKnQL3svisO5A6UhSInbQcqM8hK+lRdsxh9vOAaz1vn6LxAGr8XE8BiOE2YR+yOsosp8yKSSIb/m20wNbLNWsXeZOev2Dt0Hk5RKrNsCyVtn5FWiW/6aT314dcjYhpEZKWMOGXlogSQjbfioCQfRMmASoZg3UgzHHSBNNEk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961849; c=relaxed/simple;
	bh=x/6QvB9InBIhpi7aIvuJrdQOgjAvdt+ushjxl3YRC1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaqK9sHd/nlfnWphprln09ZvCZSpTH8uz8p89q7fXn3X980Wk7skypEBbEfZ4oJhwXRCVzqribhIDxmYDh2YQKxOUOn0V8UJmNhTvqBTYe3cjXQEBM+2cUQjG7gvO24/1CwmwLrPA7n8OH+hu6TjtXXeqgGCCbcLxipvKEklrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LB3abMeH; arc=none smtp.client-ip=74.125.227.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LB3abMeH"
Received: by mail-pj2-f23.google.com with SMTP id d9443c01a7336-2d747f066d8so8995205ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961848; x=1790566648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOn5aDKklfWuyRcWQiw2HtX9kHA+GiSG8zyirY1ZU/0=;
        b=LB3abMeHzcwmn8haOBaErtdqkMJww582qo+kyJVBiroFPfGRLlMYoCrhaPWQtXM8u2
         rdx+0J30ymGqxiGexjinw8fdLhxQA4ArmqHBIzyfLqKtR6vjQYwYOZ6Ji46mlvT7d8Jr
         W6mwkYE0pRd1u+IlkNv/QLS76lzD7eabVLuWAw+20nRpjVk+jwAbgOs9Hj743laKDt+R
         0OsM31AS596tadEYzjq18RAP4zyczzsce4hFvcFQQiLjbUe92URbBomPS2yqHOiR3p36
         R6fh39ViVZ5Sr2WLpz9dS4WDRcbGKQpBBQdBiPJUK/HkCqxZvKHuOxTcMb5Y4gnPdUgY
         HOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961848; x=1790566648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOn5aDKklfWuyRcWQiw2HtX9kHA+GiSG8zyirY1ZU/0=;
        b=x+067jlIQ+bo9h6eOZiEb18AZAPrl8xRMExihg4i/s0h7MPRXdC8IOjLdvwyPvyGIC
         ZdpMOy4+8elp8wYDsaFgOmMlvmgdiUu6WXBoBoGZsEiLCngv1RZa2hPkC7wwBvXXRB/K
         RbHXCEq2hviwooaevQ9cAkJ2eDwrmGRVc1rMBBXI7AMwMXlA535eo8FSaxCYkZ5rK1Qm
         aOFSLawhmIBduHypkoCMpF2jrE3K81RpIlMteM2I/2ejDCRugHaXeTC5FQQyr/WFGGVF
         E38qQu4VH9B2MM3lVkgsUA5qQs4t8GYFwmdRQ85+aebn+I8/0IykKvECRPHfctxPAm6n
         R6AA==
X-Forwarded-Encrypted: i=1; AKwUvBxSvSjeudoGg40auatR42sXHXgpuMMa3CZCkCYAtLk16US1AVyv+jOsJxaj3pBgfZ/X2glIZbeiq1XalkY=@vger.kernel.org
X-Gm-Message-State: AFuF++mx+HlyRNgVpUf0TjyFz/c9dBU01VgqbioeFa4a5WooiF5HsxCc
	GDBk+lIt1/w38r6RBTzrHCTTrbsbW0caz9f4ul2E21FPJirU2vRMllkl
X-Gm-Gg: AYBFou2MfRtxi4D9fVJnqwfuGWtXsbStQ32Uf4dRu07F2g4qVmH5a3oWUG5HomM2zjk
	GrRqg78olEQywBxW8GtMVC2DYDtmQpRwOvJCz2neUps0MVlzuxBKwB5P9qeLVO1OG7bAeRGPb4h
	jRtfk9vc1gOeGqcp0BC6AhiDpsilcRUv1L2BFpygnu4osa2IBPYwvzNXraZTheC9enA9m959wuc
	wFEpwLa/kKkJSiHX0qP+wC5sdTXCQwzRtl9RL5GBOQ5BnSk5YpYgifVhMDDOQEl2VWspY3Q+meL
	+SYVe5L1u6fot43VmGab/BeHhXeacA+1dU9g6p3o/J0at2ueTepxK04JeXMa93BUK2DsNnK8zwA
	hoFoIV39PMWTF/PH/c4MPRgvNJzj8tFcZQNZ0p2cOitM9M01sCqnFr3I5WbYjwqhvAHRZmGIqkw
	Mq7y3AnWAvTA3C7wj6PHIg45lC+gyP+2RjggdoKAJ0XecuXO68lBeQTvY2IURzHk2IhgxgVAakw
	RnESX3CMMhuRuXNPXz6gBZ/P1HL1AlmeOzt7PR42ThzfZa3si6lzwMeltwRDc4cW85rCvmuFJ6u
	2NlqFoadvb89Mw==
X-Received: by 2002:a17:903:2447:b0:2dd:7370:e19e with SMTP id d9443c01a7336-2ddb2233bc1mr94006865ad.16.1789961847686;
        Sun, 20 Sep 2026 20:37:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	rafael.j.wysocki@intel.com,
	Jacky Bai <ping.bai@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	u.kleine-koenig@baylibre.com,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] pmdomain: imx: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:05 +0700
Message-ID: <20260921033708.14433-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series replaces open-coded pm_runtime_get_sync() and
pm_runtime_put_noidle() error handling with
pm_runtime_resume_and_get() in the i.MX power domain drivers.

No functional change.

Found by manual code inspection.

Best regards,
Phuc

bui duc phuc (3):
  pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
  pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
  pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()

 drivers/pmdomain/imx/gpcv2.c          | 16 +++-------------
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
 drivers/pmdomain/imx/imx93-blk-ctrl.c |  3 +--
 3 files changed, 9 insertions(+), 25 deletions(-)

-- 
2.43.0

