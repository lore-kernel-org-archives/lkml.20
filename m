Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D6850AC09
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464537; cv=none; b=DZ73BDGkJVVaKS/sGUmETKUmohlOpHNvhcuqLm8q6dF+ouP4AVjiUIxYlN7mlzHFCziL5cmxCkeUYH80J3SDRDPy/wnVHv1Jyx+m6vMUbJagJ1Aed0bkm/tvxkXT/hj+YJnJziTevTEcspzucb0kMCahlJKkkYcoc6s2hmafnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464537; c=relaxed/simple;
	bh=ZNs/pcmbcxUI5DPLKL73eEDoTCcdGLiiCICCOeiADuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKDHCS8y5oRWuSR8bSmhx8BHgGfpxQcuzY59JX9huYtXwTAfmgJAeQrCiHUClHSrel3ETmJt+x6eoxm9MBzVVi+oP2RqdHkz0r3fbN8PJoGakt1LOkBS1itQf3hra39YjNNaBTRxzse2IbQqD9guCGWHXqQpHzu/HcpOUHsVmMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzuB9Qnx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzuB9Qnx"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so324042a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788464526; x=1789069326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMLGnnXjyoLsWgMjvdIiY7tKz+XpPvMHXGXJiL7xF/Y=;
        b=rzuB9QnxB9b2nQX8VlLFkBEs27X6z/RO8HL35Vx5HL8qeSR78iB2W7xWN0KzIQwYKD
         CpXWpu3+5NBGReF6lZs/5PIp87f/3ztK1zHVcy1ffYYnw+ZD+MSRWCwUciSLiNA1GGYh
         bghSUTUoBhTBWVO25AiPRAku1wStOeY4wUl3aN8UsRJ6/AGAJQDJGdwMf14nF6OziwqU
         /lQppo1COe+ML+ZA+spyAuR61GtPBg8QGGr3uTD828f3DnJ9wMWu/j2XgTSagggsBLxJ
         H/2EIZFN3WAw6GX15bV8zWCq/OJUmNEja7mOXCJdd5ZI5E2+JWgMG0NPySnCnA8NObA2
         sr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464526; x=1789069326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMLGnnXjyoLsWgMjvdIiY7tKz+XpPvMHXGXJiL7xF/Y=;
        b=MuJ6UedP/xuCdZr6aOGkjuKxaK1TPbJeG3sS/nPFnDchsndeEcDFygRoWtgnrDh6wD
         dDmDLdvO5s8bavvh8SzQ1fwL3twjAwNXivgEob8Eo/g5q6P22ra1+mI/5o/ucfnjFD/W
         qQCEDTtHd7MqnJkypxCl/QiNnRxeq+j64OmiA9xt6xNLlop6fWCd1ZNCoAcx1W+Wihou
         hpzzr5EEreVgAvGpjHDqtL4fBnGJoOQ/Wt586NKG/0RdR3e7UC7itHSEyy1sgtVwiVoS
         zIyHo1Dh7AVccNeRGxjqYaXTa5UzOQXQ8ybwI8l+liReUfX8LR8QJA5d66FYM91pjYw7
         kMvA==
X-Forwarded-Encrypted: i=1; AKwUvByV5sRW4NuKtnJmdkb4kfAVmVI9g4o2vxxCuYerXAt6CfCBp1j9BLVuvm9WXGFxVq2aJjkoT6nh5rjKMCU=@vger.kernel.org
X-Gm-Message-State: AFuF++ny1k0IlJcT5G/FPNS+JA90vyTtWi4qLL3awGDnh5j4YoC8LI7g
	o6QP+0/ecnN8NVANhAqnEybsmx4SREGSJrNVNi13EGI2qeXn71c4WHhk4Ko+Aw==
X-Gm-Gg: AYBFou00D9Et/Mg8v7gWKMaI9Oe8+2LyMKPCwv9/ypWI1fJ5l9uHEg/Iy2G7KzxbK4N
	8qJKPX5b59MKTbVvFRo7IbV8+WEAg4DoaT5hs9n7n2RJBr/NI1bvzSrfyL9vrx9zRA+OidQsDB0
	t6R0XR/4Zk7g5/giNqQQLYz6RYYSPcvPk6WvXFjMA7PBWfLqIiHRv8K1UaRylEv2t89rh5l7QTj
	tj/xzGufJ7ofm5YSTUpf1ayim+miVnlfxc89sEpZGUZOVe/e7WhLnQvp3cZgdBQi04I7FUY9fpm
	X43Cz/xCWPVjSOceCHkRRO2EAPVmFqpeEo1ZihHE+tBmrZnjS3xfmEiJ5qCmUJthOBK2xGObLK4
	w+ALlAy0lW/ubZrJqXKsHs0sbuRpeVV5XlaK+1bT+7KhGLLMRKphMNR1eaRb5U4+nYiHHGTpE8X
	nBUesESifdiAL5EZqM8IAPP4cXhs5TpdSRJZr28LjosvrXvYgALFyBZXnisqSz2NUIzrz1ezFnh
	ihM2DwoyXan5sQKazeiDumRUROu/bRvyuwQnsc22yPyP4L7vRD76lf8neAFcf6Aicj0fruoJdAU
X-Received: by 2002:a17:90a:dfd0:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39b260de667mr1265263a91.4.1788464526475;
        Thu, 03 Sep 2026 12:42:06 -0700 (PDT)
Received: from mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm1389184c88.15.2026.09.03.12.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:42:05 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Andy Shevchenko <andy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [PATCH v9 1/2] i2c: mux: Factor out channel node lookup
Date: Thu,  3 Sep 2026 12:40:55 -0700
Message-ID: <89780f7db207c7fe7adbd45e1f38f0a041794c8f.1788298883.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1788298883.git.ahmadexp@gmail.com>
References: <cover.1788298883.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing Device Tree channel-node lookup into a helper in
preparation for using generic firmware-node operations.

This is a pure refactoring with no functional change.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/i2c/i2c-mux.c | 83 +++++++++++++++++++++++--------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 68a4c34b5987..37529c7627a6 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -264,6 +264,50 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
 	.unlock_bus =  i2c_parent_unlock_bus,
 };
 
+static struct device_node *
+i2c_mux_get_channel_node(struct i2c_mux_core *muxc, u32 chan_id)
+{
+	struct device_node *dev_node;
+	struct device_node *mux_node, *child;
+	u32 reg;
+	int ret;
+
+	dev_node = dev_of_node(muxc->dev);
+	if (!dev_node)
+		return NULL;
+
+	if (muxc->arbitrator)
+		mux_node = of_get_child_by_name(dev_node, "i2c-arb");
+	else if (muxc->gate)
+		mux_node = of_get_child_by_name(dev_node, "i2c-gate");
+	else
+		mux_node = of_get_child_by_name(dev_node, "i2c-mux");
+
+	if (mux_node) {
+		/* A "reg" property indicates an old-style DT entry */
+		if (!of_property_read_u32(mux_node, "reg", &reg)) {
+			of_node_put(mux_node);
+			mux_node = NULL;
+		}
+	}
+
+	if (!mux_node)
+		mux_node = of_node_get(dev_node);
+	else if (muxc->arbitrator || muxc->gate)
+		return mux_node;
+
+	for_each_child_of_node(mux_node, child) {
+		ret = of_property_read_u32(child, "reg", &reg);
+		if (ret)
+			continue;
+		if (chan_id == reg)
+			break;
+	}
+
+	of_node_put(mux_node);
+	return child;
+}
+
 int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
@@ -327,44 +371,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	 * Try to populate the mux adapter's of_node, expands to
 	 * nothing if !CONFIG_OF.
 	 */
-	if (muxc->dev->of_node) {
-		struct device_node *dev_node = muxc->dev->of_node;
-		struct device_node *mux_node, *child = NULL;
-		u32 reg;
-
-		if (muxc->arbitrator)
-			mux_node = of_get_child_by_name(dev_node, "i2c-arb");
-		else if (muxc->gate)
-			mux_node = of_get_child_by_name(dev_node, "i2c-gate");
-		else
-			mux_node = of_get_child_by_name(dev_node, "i2c-mux");
-
-		if (mux_node) {
-			/* A "reg" property indicates an old-style DT entry */
-			if (!of_property_read_u32(mux_node, "reg", &reg)) {
-				of_node_put(mux_node);
-				mux_node = NULL;
-			}
-		}
-
-		if (!mux_node)
-			mux_node = of_node_get(dev_node);
-		else if (muxc->arbitrator || muxc->gate)
-			child = of_node_get(mux_node);
-
-		if (!child) {
-			for_each_child_of_node(mux_node, child) {
-				ret = of_property_read_u32(child, "reg", &reg);
-				if (ret)
-					continue;
-				if (chan_id == reg)
-					break;
-			}
-		}
-
-		priv->adap.dev.of_node = child;
-		of_node_put(mux_node);
-	}
+	priv->adap.dev.of_node = i2c_mux_get_channel_node(muxc, chan_id);
 
 	/*
 	 * Associate the mux channel with an ACPI node.
-- 
2.50.1 (Apple Git-155)


