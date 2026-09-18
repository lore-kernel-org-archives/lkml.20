Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549D503912
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739817; cv=none; b=VWbAvsWkl3MIeVOxbxpiXE4VXJHCrq1p+6MCv2rEpcdegTUVaAfyPbkUK5mb71gq0ASUlCuBkFVvVCxof6JplRgKqHb6wiE4OUJk/zmsyWS0/eeI4q/HC5r0jP++9F4+T2DoUWn4p/hTr2Ogm/j068Z98IAKAEaD6IDow+PHJcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739817; c=relaxed/simple;
	bh=cyFgC+qXLx7TbLlb087AjFkU/0sOlZUcyZhxSpOGPTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXIP24MR7dIfY3lXXZqB/uOeGSdNk0ZOxvAWNOK7Zqokxt0TF8nn+2Te3PtIOakJgF1VBMyRUNJ9+T77m8rIJ+15oYTh16grdpj/Ge7lcnhDZQGI+PFUR5dGieXCa5SfYscxDyDmJyciGEQqzcSZFhRjRUtMG3puHMDF15s6OPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZlvai9l; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZlvai9l"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso1097199a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789739813; x=1790344613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrzoJsyfGQAwVoj4rnXSLGvbnlKoCkPzZFVe6L0WIsM=;
        b=TZlvai9l0KmM93xXYcdnSEXUh+7IdfHCLcvzVtSXzPTIM4MzZGIEOzHqRsDqbLBSGs
         lSEKnwjWLfhtfqezjv7OlfFfq/vUOQiYiQdPn20RQO/+Gww5MfUeNhD1BpSBTNHZagrE
         ExvubaOvZfPX2v0lpR9JKPCmQEjsmBmvZq0dqswmC7hNNybSs1R0pcmGwpKEnPqKO8qJ
         YqsMp0u+OeVJ3L5/boOY62m2XoMnYtjVQyr/2V0xtcgOJw+f8u05Nkofhtic92UZxDlD
         6viF9h8uKFqdGoy1hivJICwJ3EwVrIBHOl6EFgMl02hxA6G2R7XRwPZ/yC32jB8hniOL
         +u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739813; x=1790344613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrzoJsyfGQAwVoj4rnXSLGvbnlKoCkPzZFVe6L0WIsM=;
        b=b5zcxJrQA9recoCtT0/DnwfwztnsyxifHdaZCvANUATOMZviYztVo03seD7MDVPTr2
         t24TKKkro+a0TmlP6cBzjBF2FDH+FkJzQPzNqzrddYjCAwXU/imyXt6LFCFtbXCrD6eo
         sLWPU7v72ZntRlopftairRUhfevWwRi/30fnR2wHMMq0IGYBagrn6cUy+eK9VYnNw1zz
         5w8k0RA/X8/S71bVLcAPhPYguM4zGmXAUvjLu1bv6XNoa0oHnNHkgO5CaFrPHXfLHuq7
         pYTRsy2SdRNCNnb9eO1bieW4iLrRCAmswqxXw0zoWS0ZzRqQ3CDS9+uHd6ET3Er9MAof
         JQiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8HPX6OQfCnVU5Nael3warOceKJ9cmXw9a4n5CqGszBE7WASA6tmp30PYxqofpLxZiwt9BLJvbTg7BAkU=@vger.kernel.org
X-Gm-Message-State: AFuF++nAmxej4DExswsrFDw9CK5+WLiBfNUI27/bsITlje+ykeVLiwfD
	OxjgppzswoAlvhI99d1XINpnohZ6bkw5vFwTJNzFTRixp8zYMbMa6FxxYKFSbLlTJOs=
X-Gm-Gg: AYBFou1vPv8R/VqTjDPjQ7bvRGQwxZ78VTl1bzD+Z6D6jSKsS/lnYapmW9qPCSJkkSD
	DYD7VTOB72mfbjWztwXAheaCK834EFnMOLYcgOEa3bZ9ZM6Nxnzov8TlWKKTTsX6tOFISS5hdql
	kwM57c9GZXvyAAet6nOMpvUPpgpY7RiHWAG7hLoeDqy2RPTP9mJQG3DvsqDjkaQbCnaBOoYO8RK
	8OyagWWEBY5JFuvwOm33hq8WUcrmTQumvrqaswSoZhA3WaogJiNSloM64DJJiGurvO+FvFXskc9
	8mMNGPw3/mCqlpKx9k1cVZEt3y+cA58u5Jj1rZrgC4JOX4qI5MQtMb19IW2ndpQ/pthKWo+ot9m
	Y0KTWpfF5xMULeqYax79dRLmr3MP9rEMnMz8BzAIQKir/cXw+EuKpHNF4oCFV3sepaDvkm5fY/3
	gyTY0yhm9oNIkmkfT3yOkXae32secgKpGltQPXJhrNhZeTu/z+/l48ny+ASgLY/MgulfycTez9x
	kuIZgAv
X-Received: by 2002:a05:6402:4020:b0:6a9:f88d:b6e3 with SMTP id 4fb4d7f45d1cf-6aa52444ccdmr1676118a12.0.1789739813547;
        Fri, 18 Sep 2026 06:56:53 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59730866sm915455a12.18.2026.09.18.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:56:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 18 Sep 2026 14:56:39 +0100
Subject: [PATCH v20 4/6] phy: core: Add missing kerneldoc colon in two
 locations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=cyFgC+qXLx7TbLlb087AjFkU/0sOlZUcyZhxSpOGPTs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrUMcInVhLdyaudbJKlI64/7xCw8tGs/f8+uvK
 Tr4ZbtYz7WJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaq1DHAAKCRAicTuzoY3I
 OujtEACYXwO198w8CrWRRdGcXNTIysDMDcAUvp1WCuv3mvY6fVpCxXIGF4CSCrfzLcFQr60bX2t
 //L21gFXW3rClTVpHxDa2/I7cBBZ9g1+k3k3lVMayQxOHFcOHCuFFlIrm9ZmaGln631MVSTJ0ws
 c9MrCNLCHA2sxIeBiTh/SaCsCDWRe6nAYIwCUSS7HZgKn+eqMhzh96iVZIlznfWdg8DPmoC+gD8
 lMQEaw+I8SAnAgVtSVER8Q/iyhdRjEgTGH++Iqpo0M8aQXkDewl9gaSAOQz/p1G4sPKUl+c3beu
 VRWWObQfVqlJKSdbAz8IDjKHbtkKiF61eQ2LE5DZiI2DUmXHrbQ8DgaGmFLKMct8E1/0wU6zjKW
 eS2TOdAdvifqQfbtrsNxiNrTYd+aVaUaAHFlsYBBwX+gfDaQnyUIFPlsaeW/ON2EyFu9xwT+3P/
 ltyfZ4TGmNVuhIKSBWMpabAjMkcpHbKtljsofWQsNJF5NJzwOxBYJ7rrrYQlbBwaixoUsZN0RPr
 pxsDiBOBPN5smxSysqmFNF+xPBA7GfEZr9SUAtdH13binQpUeNhdhHHKLZjKkUu2QQRwXpOXepT
 B8Qx7cu2Gy4pdLGzyQCLcWSLeA5Pi/mUNiliWh7A8mwInyO3VqPrbACzMIPZSNqT6W2ee8/8XUt
 Eoa+OjmpJX6fM+Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Correct missing colon after Return in kernel doc.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index f0d2b50d1c76b..597e6b234f5ef 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -643,7 +643,7 @@ static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
  * @np: device_node for which to get the phy
  * @index: the index of the phy
  *
- * Returns the phy associated with the given phandle value,
+ * Returns: the phy associated with the given phandle value,
  * after getting a refcount to it or -ENODEV if there is no such phy or
  * -EPROBE_DEFER if there is a phandle to the phy, but the device is
  * not yet loaded. This function uses of_xlate call back function provided
@@ -681,7 +681,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
  * @np: device_node for which to get the phy
  * @con_id: name of the phy from device's point of view
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy driver, after getting a refcount to it; or
  * -ENODEV if there is no such phy. The caller is responsible for
  * calling of_phy_put() to release that count.
  */
@@ -797,7 +797,7 @@ EXPORT_SYMBOL_GPL(of_phy_simple_xlate);
  * @string: the phy name as given in the dt data or the name of the controller
  * port for non-dt case
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy driver, after getting a refcount to it; or
  * -ENODEV if there is no such phy.  The caller is responsible for
  * calling phy_put() to release that count.
  */

-- 
2.55.0

