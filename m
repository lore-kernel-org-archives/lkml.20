Received: from mail-ej2-f24.google.com (mail-ej2-f24.google.com [74.125.228.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717043A6B66
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658731; cv=none; b=eH6n6FW3D3mTNEt/P+0nHe0E1TWBYfBrZHUXySVcyM+9cEsS96Bw8n505IQqu6vTv94BLAk/vnV4Bj3E0qUxWNrVUJHHyhtQgcJmU4FDK0gFpbXNV+V9ykyo0xl8Ro5Nb2yeAncKuOGkX4aO/GPuCm3vJ7QRpxdL3A8eSkbHzpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658731; c=relaxed/simple;
	bh=mbGaKzht6FTlTs32snTkWI2to5iPenkW5iUX9UmH+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbTInP0fZq/9bZgjztDawy02v+L5wvgdSBSY36h9GCOeM5c+6ND9JZFe7KvdVAjVJf/FX+KLHvWfdVLfP8sk7HFDrP6a2hYxbe7W2mqBSTWDN8qVDzfcfKvK3PvQP3sCwu1O/xStOJk1Phq/ipqoi36VSBK3tzWTp9wCXEibGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KhiCVbxR; arc=none smtp.client-ip=74.125.228.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KhiCVbxR"
Received: by mail-ej2-f24.google.com with SMTP id a640c23a62f3a-c29d33431c8so142655066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789658714; x=1790263514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o60JRFM5WA2Unn1KPhBnuEVA9Bwozt76P6e95xSEIP4=;
        b=KhiCVbxRQiHbhOuaqsMD/ufL5PWmqglIizZyaktdQtQ6vv6weKRfyU1sdtZUyJKga9
         y16JS/UCyiZKSh6JxCybNzfxD0mRf2ZnnuE6kUfBV2b8JKR1/mRwBQOvBRQGa0YyiJUs
         SEnFqt5tNk6MRsA6G5+gXVbN67beFmxbrdte6LBrNjSZswB+MrClgHjAW2hJTMCTiTm0
         QBOSYkMGVv7zqaTUN1N1VjG90MzyCGzEEVm7Kob2OJu0nQ9f+nru78OzfxU7rdnMu+U7
         VIaLrVHfXsaYIqGKSVqFXvmS19Rfyg2bOvjNMPsyJiISqwcsyOokSAzzoia2daqxHnf6
         nB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658714; x=1790263514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o60JRFM5WA2Unn1KPhBnuEVA9Bwozt76P6e95xSEIP4=;
        b=bkbd4PquDTvaxVWaEGXufhv+4wtZgs489a2erbPcj1iDL9fkAw9icoJ4tT6ip3CqYo
         ZlW4Cr4fSAxOzEA+I4pTs4QXCiIQWX6zUFGWP/WvuUPPH4ifSHcnlIGcURWYUZtNJrqI
         FNrHZj68A0pCMgDOgCXLyZHxOQ6EKsZDXWfij2+YxSh+dHxw88OySxQN++Va6HQpq9Lu
         5Xx4eBZhUi/FTnEs5awdATm7njhp5ZKL4QCeWJUnCHQFGaM6u2Tp4e6ayNPWZWBX56F+
         QrE0wU8Cj9JCVX0qrU9qchir5pKkwnuEY4O08MiG0aKHxeaelQYwq6Z4oZ6s4sFAWMty
         5JrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIYMeionYG7/DyUvikPTjF3R8zqplj/UQUS/oy20Yfyd4fqrfx73amWG6Q4pRhxiZ9uy5U8w0nDKYrdpY=@vger.kernel.org
X-Gm-Message-State: AFuF++k/qJdCACxPwCmVz9IGxLTrVFotr/zkOWOhgYroKHOpAEuHDX9P
	wtgAGfZqhVeJgMWphFTtrKvabWwDL1zQQ42USLyo3UBVlpk1rd4YLGT9LTUuHCMMLs8=
X-Gm-Gg: AYBFou24TfeuSNGRtC70HyN7/cny6omezPQrhdYlP1OgFgtI+RcP0Va9O8JitiMghTC
	EC6IZk12lTl3BGIcWeKbs5ojTLDBGDd9mERpvfJ3912m8J2JiYGpS8YF/dqV7p1rza/gQzb14dA
	jnESRQNiCofVT7hw2TnzGXB5ZaMUWu/bA0Po9mE0kfQwFWbwjmkxp/qI25fP1JvuJOXoOPVWhEM
	jp3fXI9Hkr2czAUggDQA7Tju5VBFtmGWFo7R0JRwVnyvkl9zq6I1utMl770plufG3E5HZqzrF2u
	XgC/uCurtgW+Fy1fNI8qTx712awGMhl+TBLiVBujledRodIPCAWaMrPL5R+HulzJ1rt237MOYLL
	LpNnz0ue8gPyYrAEwEmhxiKUNRimPBs4zD5Ddw1kBgwvxL+TPtXxr37Qxbalx8rmcdL7DuxyHVa
	5YNF3ev5r1EiE40IlkM2NS9GC1et9fD5tdFy1LAaCxsaejibjwwKBAhuZ9wDVwcIu6R3Rn/3GSp
	mbmj9iOrw==
X-Received: by 2002:a17:907:9710:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c29e53242afmr538141166b.36.1789658714541;
        Thu, 17 Sep 2026 08:25:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48755asm310587366b.24.2026.09.17.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:25:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 16:25:07 +0100
Subject: [PATCH v19 2/5] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-2-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4777;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=mbGaKzht6FTlTs32snTkWI2to5iPenkW5iUX9UmH+is=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrAZUHU+EUBv2jfs/6uvx3XSpJcXQOAF2wkNhp
 4xPSk+jVhmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqwGVAAKCRAicTuzoY3I
 Oj/JD/0cpegEhQJY+utxEKWKYDFyWdT/4jJLzXhcgV6CvyR3ZjDIylxCRO7VLw1hbn3ZNUBqTeQ
 RvlFIPUkPiwHrwxKcQ9IV72nAvFge9vf4EOfwOG4m+35E2LoSKyJDcQpl72qnizIBHpDw1b7pom
 pRyy63h3OTJqnNk1H9yW/2Iy/ngUemQLZNnght68QnFCowIjufu6y4ZgMT6/q2vqpSFe4NS2+9Z
 hWA8mJtFxiG5WHF2maX5EONgaQ+7edW8wWKcUVHBynIJiBNE2j+am9P/7I4xVhnQwqQNUV52F4C
 YlPz4hDIfD493XC7Ofufes2KwGNqimwi1IRnrT5cDfuQtF6vy6cdm0UUWsCuHwI5y6sggZybpnG
 IF3Q3E3zxQ20LeABfZrPdOx4MH7cyEeDsAmDzbvnc+39VXwbDpyeffztcpQCqxdEJnSQdUWD89U
 IjztmonFiLmRbJM1dx1URij3pdGi3PVSARx6A1LozuJzxvgLiZ5d3K197MRQJFMpt39L75Hipda
 WtenBqsGgQGtuOM1ijIW4X1yWjmAL4IJiCIjGYhjSz/5n4Z8er/nsQEu8Optsy5cj2K64qNWO/R
 ZeLkRjGYUKCT8yTBBqH0H05rUwW8/oZ3PYi4HsKytb9VVzxr643QhzzBzp3qyk8CrQGtTxUMQdn
 A5lPsQBjVKU33+A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 87 +++++++++++++++++++++++++++++++++++++++----------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 75 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 89addd732bff3..4a8e1d3cdfe75 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,38 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
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
+	lockdep_assert_held(&phy_provider_mutex);
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
@@ -620,8 +652,7 @@ EXPORT_SYMBOL_GPL(phy_validate);
 static struct phy *_of_phy_get(struct device_node *np, int index)
 {
 	int ret;
-	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
+	struct phy *phy;
 	struct of_phandle_args args;
 
 	lockdep_assert_held(&phy_provider_mutex);
@@ -637,22 +668,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
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
@@ -1001,6 +1017,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
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

