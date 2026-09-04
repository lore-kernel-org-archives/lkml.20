Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65EC46AEF4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522795; cv=none; b=as/qZx67aZuRO74OpYtKSBkR2Z/6qOsknR8bJBCl3IEonBqmF1HYC/xxEBJT5Cp/saYA+RGVrU+slV0+IV/daDwlPLeoWTJE6Q5gT4YK9Eq3woORWyZOivisYh6+RsBLg5EwQQavKZB+biHPmz7s16mt8ruUkghJgTkUpsWVYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522795; c=relaxed/simple;
	bh=SScZXkbAnXgnt8nSkpe9dZOfqBXgsPZesshLBsUkf8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nE9f85+1S9e2JqrrnZxVd8/5iTdibarM+vI8qvuKMlgOplTXME7Gncj5TUbHIeoRR6D59uQ7J3ywWSla2d3bmE3PPFVlRLIh+fI5yfUS+dFwuKbrt8KGDb5O154N2jzmJpD5f2ZTvHg5TD56rXZhXBCNCKsd62Y89fHMJD0VSOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zR9taRaz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zR9taRaz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso577820f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788522785; x=1789127585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Gn3T5GKQVsKNu5CjSN12Pg6Gz0nGtd35pevkWP3bfA=;
        b=zR9taRazJnaPqXzNK6lv6wXtMcHKShcA8UM3tO+bQiF6sx9C1GelPm17hU1hc+wN+l
         twBmYU/2pcU/M2N3yuK27qzjxWMnkarz1eC3iPV1QW2E6YyNuV7TEPcftkWZKqu3IYMw
         oz12HtEGKDDSmWw5YxY3GC0Kz5XE9NNp62/ljlT34PLQbFDiSgUoAAf2LTD+eOiTCWTz
         rX+3FwczaWpQyBOi5kqabtkFymUg/HcPIhJnOvuAfetApSmWaMrqjN7UjUEbBs9Upoto
         iJeBcxkZAF+7Wz+krlfkWLuwR7ihE5gPln1rKeNj8m6Fi12h+u5XZCXnxHS6lnuNt6jW
         p5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522785; x=1789127585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gn3T5GKQVsKNu5CjSN12Pg6Gz0nGtd35pevkWP3bfA=;
        b=aI7+QIKX9ZklIiibwzmvTVgYhSWJGd+0X4QJw5ooOPNvByYR3aeWX9qVtSzAwb3x/U
         TkxkmCI5JgA1xoOHcONCFG9wzFcr3IbU3T9QQ5diA0H/NLZinlwTFB1sOuTmVaKkHg/0
         N3sJ1XTWm7AMJhhwsSl/7074No5Swes0MjGe1lxOTvOJ8bKZ4l3VrVNN2llhvRdkn6KX
         maDP0G8N3EmHLWd7soWf6IgdnJXgd28XYrmCZr5Pp18e2OxnuF0vCPlPVuEu4QsMRXBz
         AIvbyG4cHiMUiIua9z72uwvZJDbjCw1RfO2vKZ9raikJA8uyK+UKL2mIxXicw3USj0q6
         FJpA==
X-Forwarded-Encrypted: i=1; AKwUvBy1BSokA8ZloQ+A/YaVgEOKmQ/f1st1CcAGSL9/+F4LTdJrYcXY2HY/s1uOquwiJfprZ1YrcuuvYvD11Xw=@vger.kernel.org
X-Gm-Message-State: AFuF++ngkSEHvQDYC1JuPGCOAVVbRNtpb1O433OaslkS2kHzmagYfHkM
	lGFSfIpZQcVtWoUo+/AjxhsRJQkoxYwS41NQG3YY1zXMQYNcjcbRnOYeSBsxkX8SBXg=
X-Gm-Gg: AYBFou1d1k3MqQEG2Fv/eb/Xo/c9kCltFTwCmeREyvbJ4OSQ45Pl6EfBJZK2aVH1hBR
	1APxXidzIDpr9MoAVLgztsVabvnUxKRnSdQj7CJX3LRZkvwjpf3CS6MaY7Q7Cyeb/UU00j599XP
	5Fz04ewHUWODefAKkf9i8HElwVmP4fUV67wv/8VpmsWTeXE5vyUpNBH+GC8ESHTHVD+NZCXctYa
	/se5q17DNCy2a6+ZCckAWmXDZCHNvQ6alT2wDKEoaFVVk3AQeWsGCSct1lAnYIK23z752/6HoVy
	x+xTEwHDeO2HOuWedGGUjLoCZHqz4d3WNPGNyJlVn2nTyR5N0LOuvM3qce8SZT7nSis1F3l2Ieu
	36gVX1eSIs8f4SvG5iGT2Ze2TG0u9NRDhU2rhmstLO2pEDv7VWpezyU0yO7E5v18JHj1Dmo1xtF
	U5wBn8hYOBhU3KmeYpLh+fivzRegsyeIZHiAud2JyfthHjdpiW/nlHO1AYSMA67CyAGm6PyiIC
X-Received: by 2002:a5d:5d02:0:b0:485:8c16:a35a with SMTP id ffacd0b85a97d-4858c16a5f9mr2923096f8f.50.1788522785044;
        Fri, 04 Sep 2026 04:53:05 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm5474207f8f.36.2026.09.04.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:53:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 12:52:58 +0100
Subject: [PATCH v15 1/4] phy: core: Fix use-after-free in phy_get paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-1-68b7916e7a3f@linaro.org>
References: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
In-Reply-To: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5238;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=SScZXkbAnXgnt8nSkpe9dZOfqBXgsPZesshLBsUkf8E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmrEcRRwG+Yi5Zk7Lrt1BMPnkhCjlvn3VMIIzK
 BkC/hH62jGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqxHAAKCRAicTuzoY3I
 OkyVD/0ZJAcLsU1XsHqDMb70c/J8/RnY0iJ9KDXjiaBsC/hPi9OkMLpMqpeEtVnj7y0MwZcxpk5
 7cxvGhdk+2/L/wsH0HmD4l2eyJxJMPVMq15Xs7ulS9X0vpdW/o3574Xvz9MOlv+0Ki0Thd+zY9q
 GVeVe06Kk07GJfs1VdpgGL9GyPUp+OWKFQML0FoFVsqPdzPRRvR3mTrBtneZdtVBHAPjIyjIjoY
 THd+0ouYoS3lEzLQ99nxkH/Z6QBDTKv9qG4z3vEivXxMYr6u0CLgDCYbDskyClUsbX5VOoAbafl
 TD8XcA3D/9EaODdsLayLeRNm4/auXmijSKatzdRMPVbunt6MfaRDz8lZ7r1ZakxZwN1PUV6Eauh
 XS3RrvnowEhIvrpNQ959rX+CgdUYDqzz1kq3B7B+Qco+ZOkCb1PRY1dUljE8u/AaAr3hmFcHj3l
 dH2pyfko9J8zQRF9lhu73sPgt2HhZ6uiDE6IF4aga+VnoBr2h7QCAW3E1vY6o13ESssUcnzVWv/
 kDO5G6IWlmxOYy25fR03muU+1a2cEoEspMfQGk+vWKvFZEP5ih9cO1xq+5+fkwVnkMVlLlVVJSI
 MO9S57sgq8Rh5beNrNPCQxX6ot9+4BWV/0/YfdFjw/d6U8+96RV3pSX4r+wYcDgTC5NNu1J3kZT
 SiBA0RjaoV1GKGw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Sashiko asked during a patch review if the existing usage pattern had a
race condition; specifically in of_phy_get() if it was possible between
returning from _of_phy_get() and running try_module_get() that a module
might be unbound leading to use-after-free.

Looking at the code this appears to be so, there is no linkage between the
phy and module under a synchronisation primitive.

Using the phy_provider_mutex in phy_get() will ensure there is a link between
the returned phy pointer and the module_get() bumping the module reference
count.

Amend phy_get(), of_phy_get() and devm_of_phy_get_by_index() to fix the
same usage pattern.

phy_provider_unregister() must take the phy_provider_mutex so amending
phy_get()/of_phy_get() to take that same mutex guarantees there is no
use-after-free.

Fixes: ff764963479a1 ("drivers: phy: add generic PHY framework")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c | 45 ++++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53e..89addd732bff3 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -124,13 +124,13 @@ static struct phy *phy_find(struct device *dev, const char *con_id)
 	const char *dev_id = dev_name(dev);
 	struct phy_lookup *p, *pl = NULL;
 
-	mutex_lock(&phy_provider_mutex);
+	lockdep_assert_held(&phy_provider_mutex);
+
 	list_for_each_entry(p, &phys, node)
 		if (!strcmp(p->dev_id, dev_id) && !strcmp(p->con_id, con_id)) {
 			pl = p;
 			break;
 		}
-	mutex_unlock(&phy_provider_mutex);
 
 	return pl ? pl->phy : ERR_PTR(-ENODEV);
 }
@@ -624,6 +624,8 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	struct phy *phy = NULL;
 	struct of_phandle_args args;
 
+	lockdep_assert_held(&phy_provider_mutex);
+
 	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells",
 		index, &args);
 	if (ret)
@@ -635,11 +637,10 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 		goto out_put_node;
 	}
 
-	mutex_lock(&phy_provider_mutex);
 	phy_provider = of_phy_provider_lookup(args.np);
 	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
 		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_unlock;
+		goto out_put_node;
 	}
 
 	if (!of_device_is_available(args.np)) {
@@ -653,8 +654,6 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 out_put_module:
 	module_put(phy_provider->owner);
 
-out_unlock:
-	mutex_unlock(&phy_provider_mutex);
 out_put_node:
 	of_node_put(args.np);
 
@@ -678,15 +677,21 @@ struct phy *of_phy_get(struct device_node *np, const char *con_id)
 	if (con_id)
 		index = of_property_match_string(np, "phy-names", con_id);
 
+	mutex_lock(&phy_provider_mutex);
+
 	phy = _of_phy_get(np, index);
 	if (IS_ERR(phy))
-		return phy;
+		goto out_unlock;
 
-	if (!try_module_get(phy->ops->owner))
-		return ERR_PTR(-EPROBE_DEFER);
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
+	}
 
 	get_device(&phy->dev);
 
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
 	return phy;
 }
 EXPORT_SYMBOL_GPL(of_phy_get);
@@ -786,6 +791,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 	struct phy *phy;
 	struct device_link *link;
 
+	mutex_lock(&phy_provider_mutex);
 	if (dev->of_node) {
 		if (string)
 			index = of_property_match_string(dev->of_node, "phy-names",
@@ -796,15 +802,18 @@ struct phy *phy_get(struct device *dev, const char *string)
 	} else {
 		if (string == NULL) {
 			dev_WARN(dev, "missing string\n");
-			return ERR_PTR(-EINVAL);
+			phy = ERR_PTR(-EINVAL);
+			goto out_unlock;
 		}
 		phy = phy_find(dev, string);
 	}
 	if (IS_ERR(phy))
-		return phy;
+		goto out_unlock;
 
-	if (!try_module_get(phy->ops->owner))
-		return ERR_PTR(-EPROBE_DEFER);
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
+	}
 
 	get_device(&phy->dev);
 
@@ -813,6 +822,8 @@ struct phy *phy_get(struct device *dev, const char *string)
 		dev_dbg(dev, "failed to create device link to %s\n",
 			dev_name(phy->dev.parent));
 
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
 	return phy;
 }
 EXPORT_SYMBOL_GPL(phy_get);
@@ -961,15 +972,17 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_lock(&phy_provider_mutex);
 	phy = _of_phy_get(np, index);
 	if (IS_ERR(phy)) {
 		devres_free(ptr);
-		return phy;
+		goto out_unlock;
 	}
 
 	if (!try_module_get(phy->ops->owner)) {
 		devres_free(ptr);
-		return ERR_PTR(-EPROBE_DEFER);
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
 	}
 
 	get_device(&phy->dev);
@@ -982,6 +995,8 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 		dev_dbg(dev, "failed to create device link to %s\n",
 			dev_name(phy->dev.parent));
 
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
 	return phy;
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);

-- 
2.55.0

