Received: from mail-ej2-f21.google.com (mail-ej2-f21.google.com [74.125.228.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7173E4B53E4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643306; cv=none; b=C6fYQmG+thZxdXokReyWBqpDU/KIjPIcqu5sDqvhqyr4SueQEEART9Uqyq6ZcebU7eQwcHp5ChZpUXyQFzmSxsO+NBc0LA8VJmFNR8CrWXtU3jJ6uCJ566J1wpk/PIr3jvjsXs1htsCyRtAJgakxS7n7ZyRcCbXpdXVkpgsLtW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643306; c=relaxed/simple;
	bh=3K1Wns2lPwIAk0N4nkF5l6lG+fPy1HfHc9I4aSmbkCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZ+8Wd94rSereRLv6mHvumnJmYNf5t/vvWJj4ejy7szNdpuGZkfSOFqm98OGFvEmSor2YZxD+kHeF4UnpA++aohpDgLKHObGQ6Hfx4sQkjStITxXRhSzPDC9XMYMp+Ui2MVMN117+x9AgD0Lov1ppYBN9JpIyaZ7LAuAu/ZKnZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UB5WE7rr; arc=none smtp.client-ip=74.125.228.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UB5WE7rr"
Received: by mail-ej2-f21.google.com with SMTP id a640c23a62f3a-c254fa663c2so92893466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789643292; x=1790248092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9De4Bw8APMeoKIGZUf5pgiyvld0+No1J4AiF85NjjQ=;
        b=UB5WE7rrFoIFso30pur6PhoqZO3UsMWeTlC5rt8KyumKVWy5AfXSiQ58/5pUfwgVY1
         Z9PBWetiiY6WnN9PXRAOgMkWDb0yNlv2zVnDEmnVt2C5f/kQQSzb3nFTDelLTrJhxnSK
         4OsVCJOLwU6/envyhf6PD6tGMC51ZIYl3L9V6CKkiSh2lbojN/B7CQbQBRfxLCNwphi+
         zELHe5Zq3BnBOwFUyIE3Oov3qGi0AgMQO4VrIA0tyrVPQY5WxJC16uX2gBk/JDeD3u27
         fMowW8K8UHgbu8ueATVE/zAy1pQmZrRjeCgh4IWwzb/leXlaqGbqoSx6PpCkGqqp3Yyb
         WEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643292; x=1790248092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9De4Bw8APMeoKIGZUf5pgiyvld0+No1J4AiF85NjjQ=;
        b=Bu5Zi2JeajNfA0XcbW3N3xTel0QRjknf58G+Ec1x9nJev32gEIlQlAepoYH4BxX9wy
         lBeW6qeHyRkR1JbSJ9l/SfZ+YjRlq5k6hReAaBArQtNwCQPcNNd75OOJTUjbYHYc660E
         Ut5zzFyDfr/JlGQOFSU3dSJTrRBgiM88zhGwuEkTYV8+NK//LdeMbl7m4gP+8A5QL5fK
         tBQ7cOhWk4AWmOOwu2Ww8yTsoMsWTiY7hqsju7kf0kAakKBFfyi2sPC0aF+iWPP0wwHx
         vrF0dMxz3Q1GKaPLuqvhp5Unqq7o6DYuSb7rogC7z8bb0iOnWiRbm0QzNB+Jmjd9PMEe
         U+Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwJmy37uU/xtTvcfs0syyNEq2fS0jz6P7zYVyQmCAqHEfWR4PgLKDP8WzeQ/0Y7hUaI5PLnfLHolo1fVC4=@vger.kernel.org
X-Gm-Message-State: AFuF++nmCWYqT6JWT1zRA/TuJ+tdzLBoBHZxaSQq/vyF0ePXTTpXDHVv
	CZhAU6ygwWuJWP1+JEQmdD5P4p7W9XsZOlf4JXQ4zu63Eq2DOasa0ztIK3fhuMRCTBw=
X-Gm-Gg: AYBFou3jxcjr3zotVzQ8Q2J2IW30ZUgp8XGR/Dd+uwZv/mV3ol/ZBUwHxuBlCtxx6QB
	iNPh+y97FAQlHzTLPQ+ULRBhOoTjDmSq40Tk/aUPFG+1kSI7s9DcZCFbHVd7r6Pr41MDrhDQcmw
	5JKox3BVcnvdCqT27m0jhq4TVUpyozsyKvHbI9bYcyBOAUs9XPyY4fPoaCwcNthv6MxrhaoZw+t
	OFbANG0ENIN5ItCzVEemSAQ6vAJEfcUwxZotdcDr6aUOXywVl8YkKWxbyUwppJ0VVzK324bKgr1
	PdGXPDPpeUQQddKK7AO7czNtABE9QvZ+yj6/bSz8GQ8gElF1tjr9YNsejP9gG8SRCwA4z1OhTjw
	/HO6u7Jz4xz56AMSatRAuChCQhGgjypQjDILhhT8c3SGhw2b81H4BPBdDpP3DMyZ/1CkhnzkfjQ
	eUBDfKC0UCoPBuhaVmcltgxPOcG5BprOUV++b7eJEz9OwNAlxUfXyQ/UI7IvkQtWR3kns76iMSM
	ZZSKG7Pa/dn/sK3ENMG
X-Received: by 2002:a17:907:9413:b0:c29:f5d5:5a91 with SMTP id a640c23a62f3a-c29f5d56155mr214243466b.27.1789643291860;
        Thu, 17 Sep 2026 04:08:11 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad36sm3175656a12.21.2026.09.17.04.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:08:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 12:07:58 +0100
Subject: [PATCH v18 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-5-f85c9103177e@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3037;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=3K1Wns2lPwIAk0N4nkF5l6lG+fPy1HfHc9I4aSmbkCY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq8oOWuwN5GeQzkydan3FwspjkROv2M+IBYbix
 x82AYZOpFSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvKDgAKCRAicTuzoY3I
 OhSQEACPjJCybxAhAztKMpAOOfiJT5w5srhu+b1CydFNTScLP0PcSyghjchf8j6M3WnQqISen5d
 8L+TVJyakKdcBoXRlGukGmo2YZaRaEv6oKdtDg+TMd5NGx+yfOSt3QTu9+tRlWFKVhqufJGFHON
 CbHLo/fZ4jDVj7Yt4+0EohAl3mnhUFlDPIz23mULdcyYkCv2DzFYsEsfL9BRlc719qdkwGkQGTJ
 xw/XyXpiuwHYinUCSA8ScznX1rI1t3lIBkxafPK/eu1vEl9QPaIntMqXjRV/EjEgRIIfBiQeqFJ
 WDgtBrB+n8UY6PTXacTjlYTWRAKeInVMy6EzJdJf2FqgYloNRGq6Xp7keBeGFdSz/6OFnFnfLHN
 5JmB942iroMSpCsWbKEJU0qcJs11z7/sdXmVeY+JJBGoF/f0GxIKIjsToscqwMJSChofMzFHvWD
 RqWyZkuzfoPUNneZRO7YvRZWVgUA5aAoRNJ37maW0pG51ZABE94xOscPlREwWaRDof90+s1E7pH
 SNfk06cjfSt0QExu7N1MJ2rsIb4VB3lQ3wjRbv0440Eqa7Tb86ImjDawqRm8Y5vWEsnvxTWEuA4
 eHPO23rtzrZWGl8b4NEEXI0jEj6ud9KkNs1d0BLSZrIVo/NWu4DD+VqFNk50oC2Y9wCm34miscM
 Frsa6qGwGfBM2FQ==
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

