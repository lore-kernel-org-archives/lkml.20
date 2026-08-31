Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1B046E017
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196934; cv=none; b=ZvJEwcbfSRow7VY4+ffn7QXlxsuS/D8kJZUGRhHQDobE2vsSoqiwaNFsd+BONmk/4Bg78iNOwd7MM8lFf+sbBaxp0uGYL6CWqvk7GrRUNSAltWOz7LtfFu3wTjSCA3wFrdZdEjKLbKL+U6rv4q/tNRfn6wPwyZvC9l4RDV61tGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196934; c=relaxed/simple;
	bh=kaQB+lrsH3P0HaaHF8RgU6g1gH74yTxaoYHjdcZUp/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKy7Hw+9sjW873B1jde5XNeOn4JcnVM2UdffLzR1vqBx8cnLkZB0qYU5ZyhGg0TwelEaAuFrIMG1HnehByw0sGjrOT/s4LgE6ByXGjmKTaOus1stXfw34H0XqEZIPyNksVWbaub3LuLFHaF80DspW1Ni6csCoxrM1ej1wljRZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5qMW3Hh; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5qMW3Hh"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2674a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788196932; x=1788801732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTWco8T03rFwAd35tBKC8oxqSaTdfmTFdjb2cniG45I=;
        b=R5qMW3HhU1ismGWFP/ET+Cp4eEjgqlf99tLQ2RITbvjpPNHq1A+ba+xuS78Z5efcii
         53pxKENaMKDiOOS6Ejcenu0u54qOc2TFyRM8zr691gUcThbjkYDbmuBBvmJ1VN+j1t0I
         XlHGRSTnBsOtDlKSMaQ6sfNC68OYXIqX7tDRN7kSBkeg+OMvL3ENlm0nADsRRxT6b0Zp
         i9FXxDikJgWe9gwRkYkOWWK2ovBkHQD4tHTEUyE/t7Urkr5dSjtFv9aPDrbB/P5T+aty
         RJI0+iQgtpkhMKKu+NT4tKNp/mHcqe4lefg8YurFS8c8W7YdfecTdWe9AGXCZd4u/9aO
         6mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196932; x=1788801732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTWco8T03rFwAd35tBKC8oxqSaTdfmTFdjb2cniG45I=;
        b=hmU+iNm4+7Hm5mwTVv8rTGPGNSsByFX6C9xpoUX8+Sw62gnz/oyok7lQCvz6sTquIR
         GlQ6B9Xmqiyw+TJq7rnbtnPKcwKsknlPAvRKTaFXZRUHAJwYmXsB3aUMcEjFq5Spu3Uh
         H09mIKkY+PDbJDpXqJb2Ql15AY2N+2oHee27G1NE2mqY1/F7Q7mwgBy/zzQIcX7PZzF0
         rnenqHvGt2zsjxCt/UsJJxSEud/E1XRfcI0KfBpULA1ePexlHQOP5ONoAavNFH6LOtgp
         i7UEDbyPY61eqz20rOzgBEAuNZtrhvG/WMYxehnGDo4qaJhA6xQnIao30E8+Ri6ONYaM
         CmBg==
X-Forwarded-Encrypted: i=1; AKwUvBwcHYLRVjn4pDaWVHzoz9/Ndh/Vzo7K58ZXqrMDxUJu9PqcsG6DPtj1w7TdhVy+eWiT5fvUWJq0or6MFiU=@vger.kernel.org
X-Gm-Message-State: AFuF++moRsMAf7B1elFcfZkmBCxenFT4lbLTKPZAuzl6H2VMizPa0Qi6
	jqQB99WuIoFvHX6XCGW+tVuKuaSPUnP8Z44khBoEpec0sQJuNuG9Q4Ht
X-Gm-Gg: AYBFou2DuHAENKE2duhzhCtqimdH3+yEoZNjtM5lLjuZCSCguCHxVaQJBak61A+JNbn
	rT3W6NJ7VXbqwvX1fCe4mHH07TKAD1gZoB2blOQND+toTeFb7l86PgGGFEVT3BT5swlzA137g01
	+cjE64cu2WlXUb+ttUMqkeUlPucH5pE6CqyBYL+EFQe6vszznS0vR/ust/8+9XTpRnkwQc7Cs+U
	xEhu04Wa5ZvwTLPp3JOL2cvzE6nj4mibUb5ljS6McQtoyXl8udIzqFxnj9QEJmtA+FgSmMl7dMw
	s+2ewGt7dJuBXDv4eEfmRlJUnfx4qSGxHgmftR9eD4TFeB+z5kpqJ5rRqSsY6jQpZ/ofygt/lx4
	Wp2ekX3+42tgGnAN3fcIXGnWbXecXy6qpOCwUHlynKpztHe0Iq+IzkTnXEybKNsYqw9t/8IqzUE
	hcihspko5eG7BrMxH/j4vUlPku3i9oiQ9mgGu11Dsf+Be/EVMhhrnov0FdgxK7AgvnN5/nFLZ3H
	BJRR+EtJSweybxgBTc8MrkscA4sH5LEjjV99M+ygmJ6YnOPgyCrxxwdsM8/aKQ=
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr29497513a91.17.1788196931836;
        Mon, 31 Aug 2026 10:22:11 -0700 (PDT)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm36241012eec.7.2026.08.31.10.22.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 10:22:11 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Andy Shevchenko <andy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [PATCH v8 1/2] i2c: mux: Factor out channel node lookup
Date: Mon, 31 Aug 2026 10:22:06 -0700
Message-ID: <6ff921823286515e75b62493e748ed08f4816358.1788181174.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1788181174.git.ahmadexp@gmail.com>
References: <cover.1788181174.git.ahmadexp@gmail.com>
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
 drivers/i2c/i2c-mux.c | 82 +++++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 68a4c34b5987..77921e5132bc 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -264,6 +264,49 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
 	.unlock_bus =  i2c_parent_unlock_bus,
 };
 
+static struct device_node *
+i2c_mux_get_channel_node(struct i2c_mux_core *muxc, u32 chan_id)
+{
+	struct device_node *dev_node = muxc->dev->of_node;
+	struct device_node *mux_node, *child;
+	u32 reg;
+	int ret;
+
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
@@ -327,44 +370,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
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

