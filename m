Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C19F35839C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476373; cv=none; b=dA+Gavy0oX9596AWFhv3y+hHonokKqnRk0pJ7nDbz9r5PKe5r492GultvyAh67axQpdUO0txH6hUN+Svq+pgQSH4pJNTg/Ts4uUmR5C6lVzetMN/P3mHW+3q3w4wDjkwIlV+JRgV+I7tfGUQmOWiqQvZWeANK/Yw963cs3wgXpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476373; c=relaxed/simple;
	bh=k1XGa66sdyRnrjmsJGkxGLl+Wzt3DuRWA8x+khgbtf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCoYVte9NRLa081sJ2UC/f+LuEPcUde7wFy185J+89a8W+pNoijw2WqcmPSojGO173PLRCdAwBQyrE2wyWVRyBvPLpaIJZxohRS06tfIqdZCTP3yHlnwjwE6ZQyEJPY/gxPEfgabdNWaaFYEHgc5wmQZdrOv0X+wdCHDagViXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFdkjD5t; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFdkjD5t"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48584dc164fso374025f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788476366; x=1789081166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2qhZe+AZkcGx7QLrzdA5uk1gfgMc92J6S2jPh7AbCc=;
        b=nFdkjD5tqo5o1OliOo/KnS+mzschbXbNUCyUNRwzpygVCCAsbvLeAZXl9AAoW9/PKY
         qNiXnJcGKbDlpTtUlpjjsl8ngThvdp4E4jPHb6PRtqWOf9mPxP45t2edVNJuILOmsLJ6
         bsXQnVycki9zvPFV5xT2DParoDMKG7zQJdT7D3/Enawk8O0SLnTczIG8DrazywwhQ6fJ
         eMr/tegVJTYtZkRWzqKHEcF9vlX9gvpoKlJLsyhOXr25dnq50ZOZr3bvZinV3PhWpwlc
         kZZNNLiWx6jZJer0p+UjsQo86PQXTBOLOO2loEpB3ce4AL+/ZEVfB6kcUsxphs5hLqSM
         HilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476366; x=1789081166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2qhZe+AZkcGx7QLrzdA5uk1gfgMc92J6S2jPh7AbCc=;
        b=FNXyvCSq0GekSoBOgYbJfNLqLDrMiUUoY5MAYTGODwIJ9LjfuzxNCBf+3YQk+13oWP
         LcpWueRBq452onP0ChYTZEyRpkWlpBPfTjPxgiECFJzc9/33l7//6cGgJPJSlbeg86VU
         6ZGWzVmR3gxAxPAgbCaMY9SBZ3Bh+Kmsgk6qmNeEPyjj+Hj080V9bCj5X2G9cQGc3NRB
         ghphY+Y4STTK7SRwRnylZQR2i+oA/87ciQ+OyHHylNtNicdW/VXj4KCqLFdHuu4pec/k
         xPryYOJpggT+Yu7lXa/WOpP3Co9D13jDjdIQyW3YjTEQr1XcOl1k1jOsAfNcQwEVoe89
         xOKw==
X-Forwarded-Encrypted: i=1; AKwUvBztQ65K9jViOsVK7Eza29HSYjio55kxE5gRKzEWIGQRXsoLPdLyUwvz2QNyWmcUW5Bc37YYoB0m5VMgN4U=@vger.kernel.org
X-Gm-Message-State: AFuF++kPlqseOKNVPC5m3ZxdVS9cPf4EWjERRi0tTWzM6vuWrnPLOn7V
	mMDn5AkppmUtu9YqoRgyRLdRNHZqusx8g25ASCOg3dZlUGvYTSuJYBajK3ZjPkg4tlc=
X-Gm-Gg: AYBFou1SuavMqg6xdQOKSQP+5Te59mBnJ1gXSdKcdAPxA5JAemAtEmFy+aFt6mvcWR7
	fc+1wJVvQKoVpaMl0Nha2tmNvqpaGkPIls70TKMxMWoeaZURE5VWZEw5x0HtsePaXYa1nzGbkbp
	xez+k4Vq8x0pDP2Qz0ga3QhXyLbJ3R+/NeuEgc8Z7fflCGfw470CWI1aWayT81QcZC2P5Hkp57h
	n+UbCnN39HWc67WyWpVRIu4uMAoy33QbBdSFUDcaeLZyumhOtqNKjpoCLEy4cD2w4oMNBroTsDc
	pD7rWWct69qGPU359SzAZgBMhsReNxNhtysrRTS+Whykn9RiCKdYjPhUD5fhAQjW85YMArYeUAq
	yVNbqxXvhJw3yw/Wbd5xk0YGbE161601AaZNTsW0XsToG7q3HRk8DaXWsJlbtk20NJyRhekc2DE
	+rbe8Q5LdrAKYLG6X+TRJCkVJPmtoqmUJYRmZXFDVkk+xN20SLDWny1+Ybd3pTSlBhzKvz
X-Received: by 2002:a05:6000:260d:b0:482:ea99:6166 with SMTP id ffacd0b85a97d-48587284922mr3907649f8f.7.1788476366585;
        Thu, 03 Sep 2026 15:59:26 -0700 (PDT)
Received: from [192.168.0.35] ([93.107.91.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9a56sm1448006f8f.15.2026.09.03.15.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 03 Sep 2026 23:59:08 +0100
Subject: [PATCH v14 2/4] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-2-01ef1eced075@linaro.org>
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
In-Reply-To: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5245;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=k1XGa66sdyRnrjmsJGkxGLl+Wzt3DuRWA8x+khgbtf8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmfvGJt1zjBtwQ6Abzx2EPfIgcbCAp3sKMemHI
 dvh4tk7UVeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapn7xgAKCRAicTuzoY3I
 Ooc9D/9NFN/v9wQ+NLNklcLOIdKQf5J3v705i225e0kCFe2VK0eLuGYxyeyWQ5foYwLz73aViQ0
 ydKGszoNMu026Xaxi1NUynmI2QORqdRbz7VyRPaHsk2njMb5dGj78v0VHrHFAUm7Q6BSOOzLhAO
 Wk3Sah8SBwfw3X1vdzO7ineseDiUOz1sDldyRbVz9s2/UFta1i2PHgSqjBiAQatqEJCutSlhXbR
 R/WSIOnKDFwiSnqxfZT1kQb6uPUPV5X12xcyBdDmec/mAiqiDpU7bkHM0lq4dMJlxpfJIE9Gqgb
 5nAVUhjug74LUY5G6CfeGcoHdrWyr40MpQZFIuBD+EAOckl/w8rw6rwx3nm9LxyuHGL+T1tVR8B
 TDIimnRqGx5mZFAoAJus4NFKywM9Or/P9S/g5i0k/TclYN+pYZBVMohKrI+5uK0owl/up8NRZMP
 dCnZW0+5ZbDu+wkj8RGs0SGSejBznZDTkcyixMiNY7K9yLSWo2IJva9SWbJC8XrR4Eyz2qJduUm
 ps2RJtNeb64rcP3BZ8BHQs4+lBe26T2WiNKBSTvGRDf+CRl0Smk4PT8YbXBWz8M0y3qW9Soly/D
 U/iaBpi51SnhhdQL1+MnkpkObnJ2vg0o1f60bCRbemVIh9qegYjmXFYG5tJZ42qZTs4LAa88j5t
 1h8PgVdlVH3Syyw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 93 +++++++++++++++++++++++++++++++++++++------------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 76 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index cd9ace125567a..1d060bc22d02c 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -604,22 +604,49 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
+ * @args: of_phandle_args to the phy
+ *
+ * Returns the phy from the provider's of_xlate, -ENODEV if disabled,
+ * -EPROBE_DEFER if the provider is not yet registered.
+ */
+static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
+{
+	struct phy *phy;
+	struct phy_provider *phy_provider;
+
+	phy_provider = of_phy_provider_lookup(args->np);
+	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (!of_device_is_available(args->np)) {
+		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
+		phy = ERR_PTR(-ENODEV);
+		goto out_put_module;
+	}
+
+	phy = phy_provider->of_xlate(phy_provider->dev, args);
+
+out_put_module:
+	module_put(phy_provider->owner);
+
+	return phy;
+}
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
  * @index: the index of the phy
  *
- * Returns the phy associated with the given phandle value,
- * after getting a refcount to it or -ENODEV if there is no such phy or
- * -EPROBE_DEFER if there is a phandle to the phy, but the device is
- * not yet loaded. This function uses of_xlate call back function provided
- * while registering the phy_provider to find the phy instance.
+ * Returns the phy associated with the given phandle value after getting
+ * a refcount to it; -ENODEV if there is no such phy or the phy is
+ * disabled; -EPROBE_DEFER if the phy provider is not yet available.
  */
 static struct phy *_of_phy_get(struct device_node *np, int index)
 {
 	int ret;
-	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
+	struct phy *phy;
 	struct of_phandle_args args;
 
 	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells",
@@ -633,22 +660,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 		goto out_put_node;
 	}
 
-	phy_provider = of_phy_provider_lookup(args.np);
-	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
-		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_put_node;
-	}
-
-	if (!of_device_is_available(args.np)) {
-		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
-		phy = ERR_PTR(-ENODEV);
-		goto out_put_module;
-	}
-
-	phy = phy_provider->of_xlate(phy_provider->dev, &args);
-
-out_put_module:
-	module_put(phy_provider->owner);
+	phy = _of_phy_get_with_args(&args);
 
 out_put_node:
 	of_node_put(args.np);
@@ -997,6 +1009,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
 
+/**
+ * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
+ * @np: node containing the phy
+ *
+ * Returns the phy associated with the device node or ERR_PTR.
+ */
+struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	struct of_phandle_args args = { .np = np, .args_count = 0 };
+	struct phy *phy;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&phy_provider_mutex);
+
+	phy = _of_phy_get_with_args(&args);
+
+	if (IS_ERR(phy))
+		goto out_unlock;
+
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
+	}
+
+	get_device(&phy->dev);
+
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288ae..71c2e16397130 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 				     const char *con_id);
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
+struct phy *phy_get_by_of_node(struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

