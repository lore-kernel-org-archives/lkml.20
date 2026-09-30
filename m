Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D541442E;
	Wed, 30 Sep 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750571; cv=none; b=k+yalRRv0sJDXfXotQ4E0rn3G7HqhCyFi08zrw5FhFeTjDIonAkM5tmYWqqJA7R9Vo7hYR+7q/Spakk93634yohScZrB6lnRAr5YDKqOTWjQSZgyEfcebsT+1KRqPI9GOrego4Q0HjPqF9honUwfxQUc7N5zx4gxor7BvGYQo/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750571; c=relaxed/simple;
	bh=jE+bRa7XNKGwY+fIBdkzn9mbfd6nW+7HNfoXlfs4iYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O6lbXneV6dZ5xJ/kBG/8NmvPKy9f6rRoZqxdhHHzWyxo+KqQTyCBKA4HEjNAJ+uDUscWjVl0NbOZ60WJ6bPaA8/j481dwSn7tbhMnKL8PnyTECdHtiHlJkDM8KDn1UVVE0W3b5/Zmi7hYmQhevzSjWG8dWV8mv/Rlsz+Tcl/78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7x2G/dR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7x2G/dR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5F78C4DDE9;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750571;
	bh=jE+bRa7XNKGwY+fIBdkzn9mbfd6nW+7HNfoXlfs4iYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B7x2G/dR6JkyPIhS2p50ztnHw8/MufTlTtsb1UiNFyYbR7raaspTr/Ic6Yalss9Ej
	 Jhvf9q4BzDmII2qVaLaEiXM+jjzsH/nMSlSz+soXTJRmVyOlKTFxOelbrU/lSIXkb+
	 3uihh3D0Bb2rWsumUoEAZLsqom3KXpZnuz8ScEwh1zQbjfus3ANUIPwmvscCaY13ce
	 QQseskeLMsp+0axC3XN9CpQOTjzfv//K23RkfWjN0r4pVuNosivhntDP4T+Xurtt/a
	 RHKqIQumQFTSOJEwGq1+JIGb4sEQ1h7UsSKSdUxQMDVJT5dU6P3zLvy5YwAJbjkmkY
	 VHHOlZIEulAqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DE4CA5FB1;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:35 +0800
Subject: [PATCH v2 17/21] media: i2c: it6625: require a DT endpoint and
 simplify endpoint parsing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-17-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=3637;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=dOEV92WmMHrowuuuHcjuk2PIHTZrkEk7yCzndowXggs=;
 b=yIpeI4puLSWHyg6opYthf+8uAJyGWFaEIz3KaSCQba6cWDHoa9OT/E94LbePlL1cgcA0yYACG
 cEgmGhnjbLnADjBGWUNcbqxFqdhbelCvEYNkeC7apwEUKJpQU5jPiu7
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_init_data() preset csi_lanes/port_num/bus_type before DT
parsing ran, and it6625_parse_endpoint() fell back to those hardcoded
defaults whenever no CSI-2 endpoint node was found instead of failing.
The binding requires port@0, so a missing endpoint should surface as a
probe error, not silently apply a hardcoded D-PHY/4-lane
configuration.

Drop the presets from it6625_init_data() -- these values must come
only from DT -- and delete the no-endpoint fallback entirely rather
than reshaping it. This is safe: of_fwnode_handle(NULL) returns NULL,
and v4l2_fwnode_endpoint_alloc_parse() -> __v4l2_fwnode_endpoint_parse()
already returns -EPROBE_DEFER for a NULL fwnode before touching
anything else, which is a strictly better result for the no-endpoint
case than a driver-local -EINVAL.

While here, consolidate the three -EINVAL return sites in
it6625_parse_endpoint() through a single error-path label instead of
repeating v4l2_fwnode_endpoint_free() at each one.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 7637418c5a214d32f75d197a1e0ba1bffe7235f9..01200acb6bda5cdd759caf70642fcd910284a8b8 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -2074,9 +2074,6 @@ static void it6625_init_data(struct it6625 *it6625)
 	static struct v4l2_dv_timings default_timing =
 			V4L2_DV_BT_CEA_1920X1080P60;
 
-	it6625->csi_lanes = 4;
-	it6625->port_num = 1;
-	it6625->bus_type = V4L2_MBUS_CSI2_DPHY;
 	it6625->csi_format = it6625_formats[0].csi_format;
 	it6625->mbus_fmt_code = it6625_formats[0].mbus_fmt_code;
 	it6625->timings = default_timing;
@@ -2122,33 +2119,24 @@ static int it6625_parse_endpoint(struct it6625 *it6625)
 			of_node_put(port_ep);
 	}
 
-	if (!ep) {
-		it6625->port_num = 1;
-		dev_dbg(dev, "no CSI-2 endpoint node found, using default %u CSI lanes",
-			it6625->csi_lanes);
-		return 0;
-	}
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(of_fwnode_handle(ep), &endpoint);
 	of_node_put(ep);
-	if (ret) {
-		dev_err(dev, "failed to parse endpoint: %d", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse endpoint");
 
 	if (endpoint.bus_type != V4L2_MBUS_CSI2_DPHY &&
 	    endpoint.bus_type != V4L2_MBUS_CSI2_CPHY) {
 		dev_err(dev, "unsupported bus type %d, expected CSI-2 D-PHY or C-PHY",
 			endpoint.bus_type);
-		v4l2_fwnode_endpoint_free(&endpoint);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_free_endpoint;
 	}
 
 	if (endpoint.bus_type == V4L2_MBUS_CSI2_CPHY &&
 	    it6625->chip_type != IT6626_CHIP) {
 		dev_err(dev, "IT6625 does not support C-PHY, only IT6626 does");
-		v4l2_fwnode_endpoint_free(&endpoint);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_free_endpoint;
 	}
 
 	max_lanes = (endpoint.bus_type == V4L2_MBUS_CSI2_CPHY) ? 3 : 4;
@@ -2158,15 +2146,17 @@ static int it6625_parse_endpoint(struct it6625 *it6625)
 		dev_err(dev,
 			"invalid number of CSI data lanes: %u (max %u for this bus type)",
 			endpoint.bus.mipi_csi2.num_data_lanes, max_lanes);
-		v4l2_fwnode_endpoint_free(&endpoint);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_free_endpoint;
 	}
 
 	it6625->csi_lanes = endpoint.bus.mipi_csi2.num_data_lanes;
 	it6625->bus_type = endpoint.bus_type;
+
+out_free_endpoint:
 	v4l2_fwnode_endpoint_free(&endpoint);
 
-	return 0;
+	return ret;
 }
 
 static int it6625_parse_dt(struct it6625 *it6625)

-- 
2.34.1


