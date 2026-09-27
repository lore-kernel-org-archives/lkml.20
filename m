Received: from mail-wr2-f26.google.com (mail-wr2-f26.google.com [74.125.225.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40A3BED46
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540069; cv=none; b=oqmtKYlNW1O9zBFyTBOljc6mYcvP53zV/LIznXRNmHMfqYZHS3XDW54wPkL4Ga1+NViT1cZiUAEHuVm+GsCdGbkUSv6O7204f0TIs/IMZjiCN4Ox42/rETZfmhQ6FmRwbB90n4ZPxlYR221djefnTaq9nvFXHixv9vjfh5e/HlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540069; c=relaxed/simple;
	bh=xrGH6M3bJ8igFRHyhrXgCckCWaOGHyA4X0Rt+3qQ9UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYJSR8byvQwzCxnbv/xOk1HMkPQ92SyexbShMaMu49PLM3LJ9oFOujYjoxZNmDU/keJOYMUsn6FOGLXaz00X3jaY0KhIYiEJH2rZiINe1roDYPmZc4cflZRxpL14zIq3mcS6ypPXhgI4ngwPBYAbMZAYMxmc3bL/QIFuduwThuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdOOETRD; arc=none smtp.client-ip=74.125.225.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdOOETRD"
Received: by mail-wr2-f26.google.com with SMTP id ffacd0b85a97d-4843f22dc83so1994189f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540065; x=1791144865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=;
        b=QdOOETRDy2B4SqByUk5r6JUdngmxeF97hURyyrLtPrpdmGFGLcP4CjVegnvig2Xn23
         ZAdgKFC2DY4/5+dr9aPhf8JKuAAu/VioNeygkWkzDznxGAZ50jMXKsiU+pcU7SBPsM7S
         VgK8nWJn5exRgubrF7/FQsnMLx0W71Iq0wXMkjvt7uGV7e4Z/J7jTS9TVpxhXfoy/Bgw
         5wykndLk3sR0HAZmNJN106gjJ+0M4F7v/C+HL53XTw5HDHIM6sjhfQo/FuEKuZiUkEmA
         BHS7L+gw6rB3kXAY8kKvvpWiyzRnfSj7kvMlwHUF06jzPlHRoHn4KO0kcbOL3T+07zdM
         7ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540065; x=1791144865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=;
        b=FWmi3EwCgzQx+ZoKUBlZSiKDnb+3MZ6Esu4qZ6sq0fhNeR3hWO7CT/HNvoWZliMQt0
         EYbd1ElzBqeM7TFI775NoigkEzu7JV3IaL6tHlSfGBx8yoE7Gg95Otwd3wgvxSMUSwxY
         iEhQr6J24apauP9M2h7rKQ7F+6TjI4DztZAKxE5mD9Yy2ZnRCIaXxYsx6Tzq2ZksTJL/
         tq7YX+XN4NiN8t9Rm4I2dwt4qD6qXWmgmWWKHjKtae/Hl6vYLPcDs6tZLWmPLtL/OJfP
         K+WuWw+jQ0AWuxPAmDuapY1nc3+GMoViooyOe73uNs8wG2hgrwxR+oCc3xUuHntGexk1
         o69w==
X-Forwarded-Encrypted: i=1; AKwUvBztQpVmS9Fkemy4T/UxWa5HBtoXsr6UdoEhhOF2tcLNKshB2yC+JMOsif5nNAcjMYZRtvvyJkHCHQtEkNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9KmjUYomTIHQh1zETb/Ay4WPvbwEx59X0OAhbQpG7gZnGvOTg
	pRMZ2D5ov3WiixEpr9lx5LvDgOcBkcYl/Y9vAlHx+44CYjE0LcILyZ64ZlDhO+iBMPLGRg==
X-Gm-Gg: AYBFou2MfuUlzJnib2s4O+IqYd2gPlgHVAQuu3veWHLLd879IllBSp05oaW6YJnXFtS
	RkaSD2bUSL0H6v2a2RQ7Bl4zHFMLvkaeNRQmiXf/2oHsx23FfCdMWbP8CCgCMwkJmQ0yaS3tr8X
	8rTFoPkI0vZRgSH7xxi9pUU8ut53vuqVYci+COORK1qkQx1ZKhqkm7Vim9U2fOKLoWZE9pu1CPf
	5eftENrTsXLWfI/X0iZS+d9nWJPlR0TwU3QvRLPWA+N5LL4/sV8HnjvMAiqkDayy1TAFGb39DZE
	KyncuXW7SVjnwl7wIY34zPu2afSA4BmbIUqsLxdhWgEwx3rvaz+b3aRX2fE26ROp64GtXqNjLQM
	6vjbvgzmouWCDKtZ5C66wug1ksUPZ/bdc5qea3fZiDLNSzPmR7uAPXq41wc8vjtYpL5HbXJUImw
	Ej5UA1Jb9ibBZ4s+9grSqKzH9cakZoywZuamNYGIpAEXZOJa+7vN4xtnolT0r7/Mzguxkvw1nsI
	JgQAJmj
X-Received: by 2002:a05:6000:4026:b0:487:6ef:86b8 with SMTP id ffacd0b85a97d-48872ad79fcmr22373801f8f.49.1790540064665;
        Sun, 27 Sep 2026 13:14:24 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:24 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:35 +0300
Subject: [PATCH v13 07/13] clk: zte: Add regmap-based clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-7-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=xrGH6M3bJ8igFRHyhrXgCckCWaOGHyA4X0Rt+3qQ9UA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj1KioYaMuFgpmk6o3fz/pJlbFL7ofGVcvUv
 9YBLo9tepuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKxXhAAmPNWee2nVYKvuarHBJtpA5q2EvCQxub
 WzX5XFy1zIzCVV4rrqRfYZQaYjH5m59qLFa2MrqCFiaOw2VUR/4tymITW2j5MOTnLNem2qEwUos
 l6P3pcpMFV8oY//IS9u7O9x07KA23kxd+bBA0HGYTw/z21YAAHOTlTzfU42KiAc8j7vOqnhscFB
 eIVBMCPwt+DLUYXyPz4G4LuARN2ZKT1Z4QWqd3DrYxFchl9JskT8L2sIHB/P2FUeUkYT7Q6bAyj
 r45q+q8OWzIycB/9dwKHvaR1mjOujAOJu2lvYvSosVE+EmOLZ6EjgBhW9p9qt664Ai5FGcrxBZw
 K9ACtstEZclDtByWBpS9qkZuZvfbbB8ZKSvMmZ62uH7mCjJWNpOc7jINbxdHnZwu7I6YoTT+BA7
 0fMpHZcqqx+XxZ38ZzLt++EU0B1Cr3XxsINWiIZ39MTWaRgjJJygk8IzJ2dRqah38yqbDeeJNCi
 7ZP6X2S+5xvebdpWA8b470J/oINhom6vAYa+nLCtCsBqVpDpZCr5v0roR9jEkL50B0bsfIkdNW0
 czrB89ZdWRX8KJA/ngiKBjKlt8A1f0awyGGwqW90eb7bq05LI5bEWqu6q0S0LAeOJaz31e/L43Z
 fTnzO8SuYHleZEytxND9wB1cAT9HBkIFxKSTmIGkvIXchWA3dNpA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

I see that numerous clock drivers have their own incarnation of regmap-
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code like clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Version 9:
Register single clocks per function invocation, remove
ZX297520V3_CLK_NO_EXPORT again

Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 219 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 80332dba97f6..022b2be7bb3d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -1,32 +1,237 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018 BayLibre, SAS.
  * Copyright (c) 2026 Stefan Dösinger
  */
 
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include "clk-zx.h"
 
+struct zte_clk_regmap {
+	struct clk_hw	hw;
+	struct regmap	*map;
+	u16		reg;
+	u8		shift;
+	u8		size;
+};
+
+static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct zte_clk_regmap, hw);
+}
+
+static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static const struct clk_ops zte_clk_regmap_gate_ops = {
+	.enable		= zte_clk_regmap_gate_enable,
+	.disable	= zte_clk_regmap_gate_disable,
+	.is_enabled	= zte_clk_regmap_gate_is_enabled,
+};
+
 struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
-				    const struct zx_gate_desc *desc,
-				    struct clk_hw * const *clocks)
+				    const struct zx_gate_desc *desc, struct clk_hw * const *clocks)
+{
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_gate_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT | desc->flags;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = 1;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						    unsigned long prate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0; /* Gives a hint that something is wrong */
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+
+	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);
+}
+
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
 {
-	return ERR_PTR(-ENODEV);
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
 				       const struct zx_div_desc *desc,
 				       struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_divider_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }
 
+static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0xff;
+
+	val >>= clk->shift;
+	val &= GENMASK(clk->size - 1, 0);
+
+	return clk_mux_val_to_index(hw, NULL, 0, val);
+}
+
+static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
+
+	return regmap_update_bits(clk->map, clk->reg,
+				  GENMASK(clk->size - 1, 0) << clk->shift,
+				  val << clk->shift);
+}
+
+static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, 0);
+}
+
+static const struct clk_ops zte_clk_regmap_mux_ops = {
+	.get_parent = zte_clk_regmap_mux_get_parent,
+	.set_parent = zte_clk_regmap_mux_set_parent,
+	.determine_rate = zte_clk_regmap_mux_determine_rate,
+};
+
 struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
-				   const struct zx_mux_desc *desc,
-				   struct clk_hw * const *clocks)
+			  const struct zx_mux_desc *desc, struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parents[CLK_ZX_MAX_PARENTS];
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	if (WARN_ON(desc->num_parents > ARRAY_SIZE(parents)))
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < desc->num_parents; ++i)
+		parents[i] = zx_get_parent(&desc->parents[i], clocks);
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_mux_ops;
+	init.parent_data = parents;
+	init.num_parents = desc->num_parents;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }

-- 
2.55.0

