Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF443D9534
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704244; cv=none; b=Jyt7w4NNP5HTAmQ7Q5tN8DjtlgPxdEeIixjSxG6zekPtnWILV76dzq1XjcCdodSqMWtR5V0JUgXoyXhN5AJUd7L50YrecrJcJC0eHY0IgVjLP2QWTm3Hgim8P+VFORbQIIG1Us3uRDklS17D+CqIuzMMvJ0nNoE6JnO1Iufc0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704244; c=relaxed/simple;
	bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixgkMwfEI3PUqNn6jNdXF7geXk/bDkFWB3I1Af78hIt4waTaVDGrHHF+jUUC3kBxPSQDAzvbj4JY673MQeYIMchJEhQCGEfy30Wok0eDw5DvurwwqDl4ONj/GoRfSsYrbGY45NMptUfaOT5Ui0dUtCU+SkkWhICxEWHEpobaKdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/y6WZcI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/y6WZcI"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1822597f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704239; x=1789309039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=d/y6WZcIZR7usfqSr27rbLLfe/LRprr1YhIZbvC3gEDrRV16wyqieeiOMUFC0tTB6t
         wyVIWl4QtgvHQSTv5dBwOcYubflL9IY5uQ+H7rBh+F/DmfWbIR7tzlhcK7126hRMiV6s
         b7QxnEA9wrGu/lXLpZLAI+9/FL3mJn2xS228XtychbRJAa9pO1FFoMUwVD+C6au7bcFZ
         RMcQVPmEWfI3CKdLhfIc8kkvVObGUXkkxKfbzfTRO5eA0ltXwDPVI5XO3W7ia7onguk/
         c7u0vX2Q8XBSy0qTuEHh0vXLcH4msO5rTAm/7oVowzqMQpUL8mN0pyXHcuCEaaPvINvA
         2XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704239; x=1789309039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=phIa87dDN4+/qPuZgDZNMk4eBHWcSmSvSEm2mUOhLyrIGOh5vTHfHhD4kUXii008Cr
         26DbBNX3Ztf41sUYcBCwZkD6woFDPef5Dv7CCKoy9MrbGMTu2TUQfAARb0jV8Weat7GE
         8bUvnKMAtOifFgQF3fccio7VRG/7yDlH/5AWrxoo5PftqRBuM3f59R2SLXsc4/pHm9iP
         Jj+nrz/pJkgJSNz4DiL82RiH1f5VWl3LEPpVu8LbOEc6xhYDs/r7GdR87nzgZS0JPjcl
         nN2yCGV+2dQZ1YVDoo8qdf8X/Fdz0ObDHxsVgqEXCceRzZ8t6LavK7htsDkh4H+dKq1e
         pIEA==
X-Forwarded-Encrypted: i=1; AKwUvBzgyOWJt82HW3GObhFw0xs81A8LqGDyukOWGfJNwMhp4WCpAV3FoyWsMLJDVZYJYsNtciTwqdAk61mwiXg=@vger.kernel.org
X-Gm-Message-State: AFuF++kRR+TiUItebbV1nDIyu1H22enbaYMjVgdocM6xjW/+Vrto0G6i
	KfaDhDUA7iZmK7KutA0t9LdPyZ/RT8YJhQ4eQ0TjBu9/CdbbkFGtrqdwf3YxFza8/MI=
X-Gm-Gg: AYBFou3DoVyjoLWeb/2Ut7PGDq9QSaJSq2JPgJkzUv3GG41hP4XcTYLw5/wabB1/Gnd
	pwNhft3cB6QzdDUgsjqY8cA502Hb2noxx8GL8Pusm4vic439znl274hgJo50/zCFBo5EAFnUCBG
	z55i5wEV0a++lgyNsTUTij+J56MxwSo/l9IyMnxqtjKdpf7gsRYxc0cv187uiyq5oZw4m+q5DYv
	MrkngY/TkgQYPlCW3e8Hr4VfubCQafuKFC733j7cImSry3C9/TAbttk8isQnNh5xj8IfxOWrMFz
	0JloGoT3iw8OMHI3dj0nDW38lklRTrnFoCRpMGNDaSOlxei9Y/GL64E/wgmnT4xuJdheDj6aOwb
	xdLMatj9xw3BeiCF88EiFekjTDV5cr5DzDImaU4HWdF/3yBqF8KfWkNSniHKS3ZZr6/ayg/RfYV
	7PQdjwIrShS4bCD0omPZ7L1yupYfvepMDIE/GxTsd6Ab7AuaFu+0GxOcQuvzayrEgY0Fam3hBRN
	Il/BAHIzxc=
X-Received: by 2002:a05:6000:4694:b0:47f:80d1:be0a with SMTP id ffacd0b85a97d-485872a0086mr16514274f8f.14.1788704239558;
        Sun, 06 Sep 2026 07:17:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm21669763f8f.7.2026.09.06.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:17:19 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:17:07 +0100
Subject: [PATCH v17 3/5] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-3-e2197a3e2551@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXXottT+aCtr6MjD/BRcmrfiSRLV+IZIlfnKt
 eM/LwhIIQ6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap116AAKCRAicTuzoY3I
 OqjlD/9FVmT5Cto23JuMUI5C5HJFt91vUFg9Zlu/nuBlbEVbwyeOchh9fygRZ63v8J1w+phrKNZ
 U1vrhEqqV95TfHiXhYW6bTSjx4JmQSzoGI/GY/tl3Eabvj/cjuhVOhE7eKTqwAYGjr3m/gmGXVK
 Dy7Nb0X9mUU0DkA1rknz8ZVgegHUCMfTFFJ0h7vRNm3qJk/Cx32Hi7B4ZOWHK0SG3WQ5ct76vaH
 kZP6dva1Wy3zHWhK9/gXgoS/xcghdXMsgo1OvKbBVP3k1kZqm5kRBaq8CGbeh4LJ5zIlzPiR6Ij
 LPcW29TiYYd5V4zhG49+JFaEGBMhidSCqTnrMijltFqT1zC5OX8I7hTCgijaQNSIqHTa8S46CaA
 zAvmk/Nvrb9Gv2ZKqL/kyMpchLuYc3H8HUKZQNq+Yl/xqqVIZmNrzFx2YnMBIW+M/ggpEdue+4t
 vLHQDhuGrh1XLpj3Yp+6jdYx4VIBbrzcR9HZi1aXWR1WAlfMm+hMLtuiSOxqHJLk7tVGSMWkWE+
 ddEMRnZ9ER1ulWtGeQOdzPjou1oWIvlesIN/1SoY/LzApIKsMFi7da9zizDieSeU7tUMQAtYT9r
 Zg8lkd487QQq994MfGnw/W9S85JPTWXYok6UjI/tHyxjc6lDbQE0kdn2JNEyWD9/pcYb8aC8xQr
 vYhRQI8R5DApCdA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a devm variant of phy_get_by_of_node() to allow for the familiar
pattern of having devres automatically release resources on the driver's
exit path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  7 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 490a7cde6d40a..2e3581ecb42ee 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 
+/**
+ * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
+ * @dev: device requesting the PHY
+ * @np: device_node of the PHY provider
+ *
+ * Returns phy associated with the device_node or ERR_PTR. devres manages
+ * releasing resources.
+ */
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
+{
+	struct phy **ptr, *phy;
+	struct device_link *link;
+
+	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	phy = phy_get_by_of_node(np);
+	if (IS_ERR(phy)) {
+		devres_free(ptr);
+		return phy;
+	}
+
+	*ptr = phy;
+	devres_add(dev, ptr);
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 71c2e16397130..14b924a88411f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
 struct phy *phy_get_by_of_node(struct device_node *np);
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
+						  struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

