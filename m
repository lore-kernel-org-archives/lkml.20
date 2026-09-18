Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37332502D56
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739821; cv=none; b=nBa8jfqTZqtU8toaEsXrEjz6iD7OnqYBJLqdfEqWlLU24wUdAv4GqVx7D4LJ18BxwA1mgRqeYVbnxPIp+2nIb5b6dLQYPYk8coWWVBmlmi1f1WYKeEweEizayjWTt0dc8yXN1wo3kCi/b5WZCFbaMkYUhXWFKCx1fpr2J1QFe4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739821; c=relaxed/simple;
	bh=pqNWQgF8ClsJh5Yi5qQY7AdMdYAk6BCqiLyzGAJKIe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaP80ilhMqmagX7DGOT48KhRHN9OngsiVsP3JvJZ6P1AJVWTMzEUW3/aDZ2ENee0Sn1e37xEqO1wkZpR/HWYHh9jXFWBhUcJyeSRvUbhlSGaEKTG7G//ykyM88+ZQyaNDP0USQo7V7o7OW3Ve737DofpC2NwJE4wtMMpQlQD9yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCfFSrah; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCfFSrah"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so1062044a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789739817; x=1790344617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVVY0F/3SoAAMbyWD2/7RYl6WppDgQD/EUsXpw6hsho=;
        b=oCfFSrahoPSR5pAJrOG+TtKbt/rvTJeF3BKJPfKv31E9zg2VIblpD6ZS4Oi/roIY30
         bmqVdY5rTVj/DmfGYO0H/H4MPCZS4DBjo0f1hfsVpm7GJWE+QunpdbMX0O1WCAcxhXkV
         i10k05J39ajHtoDBXaGCyetZCZEft2nwv3uUBMCFUjE9LEJSYRq24oOFSPVWORZd92VY
         8UORgflT5tNstFGjxsDsOGQBalidbl+dzDysX7gKvDIpVy2ggyzPQWoprQpdro/gSice
         x0kwyG0ND7DuHLcj3nQ0QAxrL3JuaRphXEpP7qx+UC8b82QScg8adBEUEJjc+9GEyFVn
         qMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739817; x=1790344617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVVY0F/3SoAAMbyWD2/7RYl6WppDgQD/EUsXpw6hsho=;
        b=q4zW8+iB2oaHeYKAZBJFix5z69oCxmmkv030laJlp1NVOgO5HsuXIPXFjoog62AVI+
         Hcl4DZRv8liG67EbSbe/smMATagFVQeGUaOvhSCkZuaR59UxCzYGgjdUy8sT9Svsr2Ij
         5c9AEg9tuTY9keztSzyJ8p9InFKDQ3J+C8VqqR9L7JbaQF/TsEJPE2cUFfsRfJ0LhEWd
         jG9tD1uvWAlg3kRzWTifPGmIHUoFaE1AWgMVp0Z7ugXMYc9hKWzmF94YaVK2NtcDUoOu
         RTbh2n/dH3MGl1Kb+bcUwoj4ZOogmp/xmUbBGaM2Li78bngX0MV5kAKyxaShLbZBWbBM
         4a8g==
X-Forwarded-Encrypted: i=1; AKwUvBwG3+FMBqAwHpR/OCCkthU44YmI1w0KKYB6xU45h926QafnKOozYEs0YcShdEtxJpwo28JaviAyd6G47qw=@vger.kernel.org
X-Gm-Message-State: AFuF++lgyqdBa13VstuDoIdpOLh8OmmUFNJRL9BrKLH/Y9JuS6EekfEY
	b+e7TQCN+gTyK6PlPtxTM21L3h5qbaGZU9KSrqwMzJfvhKs7SIf/XmmkmH7zvmOuaNo=
X-Gm-Gg: AYBFou0vAppcQNg9MMpRiHcfzudprub6VWwkj2ZoXRZTQA0s6ySv5kTigTuEZZ2HWn+
	N4K2ev5GADpALAIqD/XEPB6oFoVM9CgX2HJ/YLZUL17WjbvH+4/Xias/6PUC2Bj4x9FhSLAjGYN
	oNfrvA/qjK3WvMtutRS6mcfPKn4319QXimJ0LUaSCa7/QctrtlpXLYb/HLPOZaLGDtu/RwoNir5
	0xN3qc1OPO2T9dR5fjSOtvphZBTe6AAh4t0LqgVUonf+yei51dSx4cik9z/JYtstTXievqHc73P
	VuDa6H3Li2yZA6hClTGQK0x5+znJ7Bk6Y7AZpy8+Wktmm2igRdE65kRgRnRFNu8sHXWKGKEBCEE
	q19YTEqoANwemIPZYJUtaljIxLFCJU9zQeI0kHpeYHC4bQT40cnifTp9cahVyE7uJTSyq/r3ym3
	xsdX/QGYv/ke0dLUVEL2cqK7P+W7ltCsEcVVS1xk+UXM1xgp6UJHp4PQFyBCGrnuFYTL6lakRlG
	IWRWJ+M
X-Received: by 2002:a05:6402:2112:b0:6a9:ab47:e08 with SMTP id 4fb4d7f45d1cf-6aa545f1e10mr1610240a12.0.1789739817032;
        Fri, 18 Sep 2026 06:56:57 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59730866sm915455a12.18.2026.09.18.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:56:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 18 Sep 2026 14:56:41 +0100
Subject: [PATCH v20 6/6] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-6-dc244e124e71@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, Oleg Keri <okerixx@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3176;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=pqNWQgF8ClsJh5Yi5qQY7AdMdYAk6BCqiLyzGAJKIe0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrUMcaIz3wyLlou3OxIUAqDc7LpQ0TclV6L5O6
 W6PwUeeN9GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaq1DHAAKCRAicTuzoY3I
 OlrwEACgFIoqFiEREgBHed5k/+FwouGdl1N94FNwHz3Ju/kS9+7Go7eYTmPxlyEo2g66mlFzO6G
 mQ+CvwA5v0D00bg4MX4PSdFW1b907+AINo/KZB+DwNwrCmRwkK7MirL6oJ8b/MD1zUhrzkDX0D1
 ICvThBsPaBjuYvsj3UmxIZbJoymwnHopj2s/KizRoxfraSr/RCn//zD4TJmFcdWWTox8JmJjOZP
 wWKHWl/x8YYb0x88Z2GALZkmPP/R92WPwO3lNJUjiOSv00lpumNW8NEjZRGd0XEbs66GMpAaimQ
 wBRj9mo5i4Q3c6OyuAJ93x4ay0UBLFK2P+SDn/7zn1X/SrRi5scbGLpKpppowv89oejqzKQtyuk
 7yeglCJ/TqrwPk9nkMoJzHj15vut8RrGsvmZDOSgZnVg0IaPkrxJSWK6eUY8xfM2tqHRt2gmd37
 r9Rq0U2c8kkp5Mk26c7g6/eNf8TUnAqBhiKjAzdx95HEx3psZWs3fENrTKKXKHFWAIeG5rCMh3q
 va4QLj2+Lhn5fxLr7DyUIX/AZfZxK90rzG2n8naIlvRfkesaF1vwJSljqM4RRmZeHKptaOs+UL6
 7ADh2UwBCYYqKk0uhgVsPnN+X+6Tud40SQDRB2K0oPzTQWAmelVEcigHCgrQ4e3bNoIIoD0OWSi
 H572stIBMMlWv5Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Introducing a dedicated CSIPHY driver community feedback was both to move
to data-lanes starting at index 1 on the PHY side and also to match that
indexing scheme in the CSI decoder - CSID.

CSID consumes the data-lanes property to determine which CSID lanes to
switch on. For indexes starting at 1 we need to amend the logic somewhere.
The PHY side code normalises the input data to register level meanings so,
replicate that logic on the CSID side.

Introduce a simple flag to differentiate between legacy indexing @ 0 and
new indexing @ 1.

Existing bindings are not affected.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 drivers/media/platform/qcom/camss/camss.c        | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 7a357044b9fdb..8c3319f2ca1cf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -21,6 +21,7 @@
 #define MSM_CSIPHY_PAD_SINK 0
 #define MSM_CSIPHY_PAD_SRC 1
 #define MSM_CSIPHY_PADS_NUM 2
+#define MSM_CSIPHY_MAX_DATA_LANE 4
 
 #define CSIPHY_GRP_ID 1
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 84097d82d99c9..6f58e729eaceb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  */
 static int camss_parse_endpoint_node(struct device *dev,
 				     struct fwnode_handle *ep,
-				     struct camss_async_subdev *csd)
+				     struct camss_async_subdev *csd,
+				     u8 lane_base)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {
-		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
+		u8 lane = mipi_csi2->data_lanes[i];
+
+		if (lane < lane_base || lane - lane_base >= MSM_CSIPHY_MAX_DATA_LANE) {
+			dev_err(dev, "invalid data-lane %u\n", lane);
+			return -EINVAL;
+		}
+
+		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
 		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
 	}
 
@@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
 	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	u8 lane_base = camss->legacy_phy ? 0 : 1;
 	int ret;
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
@@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
 			goto err_cleanup;
 		}
 
-		ret = camss_parse_endpoint_node(dev, ep, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
 		if (ret < 0)
 			goto err_cleanup;
 	}

-- 
2.55.0

