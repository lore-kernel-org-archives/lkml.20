Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E587525A69
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064102; cv=none; b=PhYgcjORZ+H6aZDm1kNI+NuDjqSKUHckmTuE+uCHZ4hanrYnUhkYpUMUpID0fXuYcwgl3tRYEHY5/nREweMBQmdofqBjEHuDVRTngCN/AIz6mhU6/BTkgmBjaBhtUgJNnZJDj3u41RjAA3i6oIGktxU1aExgB+nOU/yyBfqpig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064102; c=relaxed/simple;
	bh=CT/RCzxKrrCttvy9qEHMfrwnpwtAFxBYeP2FfoG304A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5SU87OmumqbgY9YnjNMx4JYM2zJ4C24MJ+48g0wXXFO8l1O5cvxtlxYEqEYWfshGh9AsjVdFz+fpqWu2AB32VxnWf0+oLdWTupofxn2TdVCytkkDhAgTopkTKJ7ZtFz7uf/zE2OzR4R/luJ/FnPXEuR8i1YUwo+zeIxSiqoesg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xsa2yV6B; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xsa2yV6B"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso2017835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064088; x=1790668888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxEjmrMLU3ArphO/8yrozyx0jV5tnXGHISJN2k9QOtM=;
        b=Xsa2yV6BCJsZXDyz+BN1mAjcnQftUKoKmSLj735UQaL8pyETkyzkCl+sqDwWdG9jf+
         2FxB4DwD82G0B0LRB7zNL1tfk6zsFHrArnC5Gi0kfActdq2YKEaD/9i0AmTycaqKxBpr
         ljMyN+LpPFkt6UybFjOHyMGbofR4Kpu3DV+FpBf/seX1pFDR5/ZTik8M881jP3LyRVuh
         TQOY6b1bFhL30pbXTGmc+8C0gOXxJr8Xbo9U2MyIHSm4S9u0jDmIPaCYEoDVa9IndhmF
         xg8ZrYPGnGpJhBjl6yuDxCBHPrLLfS1ZWQ4uOYLxzKpZ1dYEsAVtporNWu5XO00mQQ9z
         2gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064088; x=1790668888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxEjmrMLU3ArphO/8yrozyx0jV5tnXGHISJN2k9QOtM=;
        b=y24unNVJOrhgOkfeqosNhT+b8cuJMFgG/acOfMPvAN1JKrqP2pCeolGvNetlCzaRyg
         rTiIUQYLsSQP9113SZM8EnSoerLSaOGoRer0XMNEd0E2Vkhv8Xou8YQGBU7M9ef+dy/z
         3IteAvP6jyhGrsdVbILm/QZUNylLZ4Zj3qLLsFseEXBR827v0DZxSCM5pm+TOPYar/Ry
         pzBZFpto+sIQqW1RjIbJl2ojmwQ5OXqL+FLL1+Ape/1iJwJdMOw/iPT16mYEj+HxRVxD
         Hoyd8ui33xFjxKNsTqaYYsCmTwMaBk/kvMMTP/Ny5NDdOW3+XNRnJDRnnAh9KgO3YpMJ
         Fscg==
X-Forwarded-Encrypted: i=1; AKwUvBxc//Y36RPZkipfuv6BnT9P5vKXbqW5FUplWv0WU4VIiZq/6pdaXvMLU3AlrSPKEr7h/YXiBmOon1Izf5g=@vger.kernel.org
X-Gm-Message-State: AFuF++mCeAS1nxq3FSnwjYLVCXy2o1U05h3fTGQ42I9ueHJY/hu2OkB2
	LMRheaxMFe1RO7lQ3XRJPSRJ9YBdaOS7jmXT+u6u1L5WRNPeLNZo0LLk
X-Gm-Gg: AYBFou2os6NgQVGAtGBWlOod7UicnRx75Sqa34m7wQ2sKB3T+A0jRWp2lHW/ERcXDSG
	ZQ3k3aHHgDSFtimzH/UkVg4xQ14FvEpACiOBCqqdy5SfGM5NmmAr3MudCbYvDKjrKuCC2dLaQKB
	JppqiR14Co53JeTS+qrQr8KxdZjUMF/sMK/6JY696liBkJmunY8eotcNZasXplXK6UF1JwqUT2M
	ESw2G75+0gN6eJTjpTONVlhE1Wl1GHG8tL8dK04g2BkZzD6nHaCYNzxuLxmtyd2CSfw6hs/u16u
	BJWzv21vCyewO2Sk+LpyhNzDAx+WtRBxwJjan3pmgneA5z4DjngYqbrurhYatkcLYfDz51TVrBf
	hMkQzjqjRwzGke1JMUKKqCWK5G+9CrP580VqT97lxX7F5ARLx00o1dGuBrvLgPh86Ry5rQs6wkJ
	KDQZGE1W/ZXVQcvl69KQeDIs+UD3JNCuX4tYrb/XaezOryFIFCSNxwtumOsmzBQdd91xscxCVjL
	ehCeDD6hgA0Yv5T4aa1BKcv7lgDsttcb0Nnim2LzdLH5HesKGmo88S+B4bPKUGdj/7Pp+OKBb71
	TAs=
X-Received: by 2002:a05:600c:1c13:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49fc7dc1e75mr208969905e9.1.1790064088073;
        Tue, 22 Sep 2026 01:01:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:26 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 02/11] accel/rocket: number the cores by devicetree position, not bind order
Date: Tue, 22 Sep 2026 10:01:05 +0200
Message-ID: <20260922080114.44662-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rocket_job_hw_submit() programs the S_POINTER registers of a core with an
extra bit derived from core->index, the way the vendor driver derives it
from the hardware number of the core. rocket_probe() sets core->index to
the slot the core takes in rdev->cores[], which is the order the cores
bind in.

The two agree only while the cores that bind are a prefix of the core
nodes in the devicetree, in devicetree order. Unbind them and bind them
back with a different core first, have one core's probe deferred behind a
sibling's, or disable a core other than the last one, and every task
submitted to a core whose slot is not its hardware number times out after
500 ms. The reset that follows does not help, and the inference finishes
with wrong output.

Observed on an Orange Pi 5 Plus with a KASAN build, over all six bind
orders of the three cores: only the devicetree order ran clean. The other
five produced 27 to 141 "NPU job timed out". In four of them no output
tensor changed with the input, and the harness gave up before its first
measured round; the fifth got through a six-second run with 27 timeouts
and a wrong top-1 class. All but one of the timeouts land on the cores
whose slot is not their hardware number, in proportion to the tasks the
scheduler hands them, and in both directions of the mismatch.

Number the cores by their position among the core nodes in the devicetree
instead, which is what the hardware number is.

The wrong value has been assigned since the driver was added, but it only
reached the hardware once the extra bit was introduced, hence the Fixes
tag below.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Supersedes the standalone posting:
https://lore.kernel.org/r/20260905135612.7324-1-royalnet026@gmail.com
Same diff. The message now says the numbers come from a KASAN build,
corrects the timeout range to 27-141 against the raw log (it said 140),
says what the four failed orders showed (the output did not change with
the input; it said an oracle rejected the output), notes the one timeout
that landed on a matching core, and drops the throughput figure, which
was measured under KASAN.

 drivers/accel/rocket/rocket_core.h |  5 +++++
 drivers/accel/rocket/rocket_drv.c  | 31 +++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d7382854ca9..46ed8352a79d2 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -30,6 +30,11 @@
 struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
+	/*
+	 * Hardware number of the core: its position among the core nodes in
+	 * the devicetree. Not an index into rdev->cores[] - that slot is what
+	 * find_core_for_dev() returns.
+	 */
 	unsigned int index;
 
 	int irq;
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 2bcfe4ab3c68f..7d927bb6b322d 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -157,10 +157,39 @@ static const struct drm_driver rocket_drm_driver = {
 	.desc			= "rocket DRM",
 };
 
+/*
+ * The extra bit that rocket_job_hw_submit() sets in the S_POINTER registers
+ * is the hardware number of the core, which is its position among the core
+ * nodes in the devicetree: a disabled core keeps its number. The slot a core
+ * takes in rdev->cores[] is the order the cores happened to bind in, and the
+ * two only agree while the cores that bind are a prefix of those nodes, in
+ * devicetree order. Every task submitted to a core whose slot is not its
+ * hardware number then times out.
+ */
+static int rocket_core_hw_index(struct device *dev)
+{
+	struct device_node *np;
+	int index = 0;
+
+	for_each_matching_node(np, dev->driver->of_match_table) {
+		if (np == dev->of_node) {
+			of_node_put(np);
+			return index;
+		}
+		index++;
+	}
+
+	return -ENODEV;
+}
+
 static int rocket_probe(struct platform_device *pdev)
 {
+	int index = rocket_core_hw_index(&pdev->dev);
 	int ret;
 
+	if (index < 0)
+		return index;
+
 	if (rdev == NULL) {
 		/* First core probing, initialize DRM device. */
 		rdev = rocket_device_init(drm_dev, &rocket_drm_driver);
@@ -176,7 +205,7 @@ static int rocket_probe(struct platform_device *pdev)
 
 	rdev->cores[core].rdev = rdev;
 	rdev->cores[core].dev = &pdev->dev;
-	rdev->cores[core].index = core;
+	rdev->cores[core].index = index;
 
 	rdev->num_cores++;
 
-- 
2.43.0

