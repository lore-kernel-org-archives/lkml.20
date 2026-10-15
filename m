Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD7A38735A;
	Thu, 15 Oct 2026 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100900; cv=none; b=Ns6xddZbplP/AYVOiEV1/VDsJDs23dUwavCnD4gETbxu4Hh1j+HL92qSt01F2ldl6xZs3fQe+LcRaA55x/RAhJEVPNZbsXUUDI/0j/ffk8BvcD2j92k/pBvB3AIA/0OXpA/JdvHKhNwpJapFIJWMtb09CG38qHSaUqtlRLWdtLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100900; c=relaxed/simple;
	bh=uuL/CmNmBs+pWcemax67+AiZhym/WAPAdhBsiayJRHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzYfgzMpRKNkPlmbjn87PjgSQGkfAbTJzaKg8ahw5JKC8cXzkC4cvrZ5aDVvPRBcD2oLmMHk3K3HKZziSHuPc0IoJcQGp0WEpOnEsreDkbcdH0fTy6nIcKgxTjqYkSkQ/fDXL995csCf2qBRvd1MN7wXbFhXpqHaFdxzShAwjeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m29selP7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m29selP7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0426C2BD01;
	Thu, 15 Oct 2026 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792100899;
	bh=uuL/CmNmBs+pWcemax67+AiZhym/WAPAdhBsiayJRHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m29selP7dtddT61bI8NCsp2MSBCYNNsZ6RWb18vQRPDecV1/nE4G1t5Lpqfuvpi24
	 GEqIyK0TTNI08gilqR4imJuBkIyFCvkM92Re5bF2+z6znaOMgxJakTo7XcKy+/M9XW
	 llS/RsdN1iATgzhfRXeBet3xGEOEdwUFPWL3Hk8heDWEZI8CgkLK/2EKsDmMLtqWYy
	 e24AQ08OwWVaP68RiSYUV69uCDMZzeFC85GWxOUqFEtwhq2In4OGMM/l2qJ+H7NoaX
	 O5hPsV5s2F9oZ2SP0YBGGi2+0IBQDTVbD3P3c9c1gFmcepMa29ChZVEwQDlk+zq6+A
	 Pe2bdBqI4yBvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B14CCA465;
	Thu, 15 Oct 2026 21:48:19 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Thu, 15 Oct 2026 22:48:20 +0100
Subject: [PATCH 2/2] media: i2c: ov13858: Add device tree support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
In-Reply-To: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>, 
 German Pablo Lindo <germanpapulindez@gmail.com>, 
 Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792100898; l=3992;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=OUXpTuteW6O6z6fmSZaqFDa8zmph67QuMze6JaQ/PNs=;
 b=YW6OZZ6UCKTH5NC0I/hvoT38dHS1nULqijWt94YmJ33bOvJINTUy6OR+1Qw9RlYL4MUdVFvaY
 4vH7SFZRq5mAQKx6Yj5pg84i6Jt03rU5knP5vzH4Y+SpoqpLWPrWfBV
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

The rear camera of the Surface Pro 11 with a Snapdragon X Elite is an
OV13858 on a four-lane D-PHY link, described in the device tree. Add an
OF match table.

Parse the endpoint as other sensor drivers that serve both ACPI and DT
do. Wait for the endpoint if a bridge driver has not created it yet,
require four data lanes, and require both link frequencies, since the
modes switch between 540 and 270 MHz. The IPU bridge entry for OVTID858
lists both, so an ACPI machine with that entry probes as before. Without
the entry the sensor now waits for the bridge instead of probing into an
empty graph.

Tested on the Surface Pro 11 (X1E80100), with an out-of-tree CAMSS
capturing raw frames over CSIPHY1, CSID0 and an RDI interface:
4224x3136 at 29.95 fps at 540 MHz, the colour-bar test pattern intact,
and a scene captures.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 drivers/media/i2c/ov13858.c | 62 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 83eefba..587ee38 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1713,6 +1713,57 @@ static int ov13858_power_off(struct device *dev)
 static DEFINE_RUNTIME_DEV_PM_OPS(ov13858_pm_ops, ov13858_power_off,
 				 ov13858_power_on, NULL);
 
+static int ov13858_check_hwcfg(struct device *dev)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	unsigned long link_freq_bitmap;
+	struct fwnode_handle *ep;
+	int ret;
+
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver.
+	 * Bridge drivers doing this also add sensor properties, wait for this.
+	 */
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!ep)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "%u data lanes are not supported, only 4\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+		goto out;
+	}
+
+	/* The modes use both link frequencies, so both have to be allowed. */
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &link_freq_bitmap);
+	if (ret)
+		goto out;
+
+	if (link_freq_bitmap != GENMASK(ARRAY_SIZE(link_freq_menu_items) - 1, 0))
+		ret = dev_err_probe(dev, -EINVAL,
+				    "link frequencies %lld and %lld are both needed\n",
+				    link_freq_menu_items[0],
+				    link_freq_menu_items[1]);
+
+out:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
 static int ov13858_probe(struct i2c_client *client)
 {
 	struct ov13858 *ov13858;
@@ -1725,6 +1776,10 @@ static int ov13858_probe(struct i2c_client *client)
 
 	ov13858->dev = &client->dev;
 
+	ret = ov13858_check_hwcfg(ov13858->dev);
+	if (ret)
+		return ret;
+
 	ov13858->clk = devm_v4l2_sensor_clk_get(ov13858->dev, NULL);
 	if (IS_ERR(ov13858->clk))
 		return dev_err_probe(ov13858->dev, PTR_ERR(ov13858->clk),
@@ -1845,10 +1900,17 @@ static const struct acpi_device_id ov13858_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov13858_acpi_ids);
 #endif
 
+static const struct of_device_id ov13858_of_match[] = {
+	{ .compatible = "ovti,ov13858" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov13858_of_match);
+
 static struct i2c_driver ov13858_i2c_driver = {
 	.driver = {
 		.name = "ov13858",
 		.acpi_match_table = ACPI_PTR(ov13858_acpi_ids),
+		.of_match_table = ov13858_of_match,
 		.pm = pm_ptr(&ov13858_pm_ops),
 	},
 	.probe = ov13858_probe,

-- 
2.53.0


