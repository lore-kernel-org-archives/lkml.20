Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA13A63EF;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225935; cv=none; b=MDWglHP5FfFKkq2IzrGWR/0pWcbkL2eORZ2nwJOR+JyM3jN2QVwYVFUoKTod/AHuaa1Ek3wJC9aQelWrcvPv8JyG48yI5+HwF34+TNw5/idIcyJzwtDkRwo3EI4nZjN43M9iN/7gPExHhRjawKMrIrYdjrAr9qlUyE5MnagMusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225935; c=relaxed/simple;
	bh=0yISZhF00KTqyXR8COXSag7+b1xFTHdXc844BCL8lZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVSMjLIw2tu9jQVCIYIXYb1zf0roLHH3JOxiI53TqQ1uEqaWZl1WQENJ+qzR1K+ZJz7FZ7OApdgKMPMLTaCdrFFjwZz1O9nPsKb+cYYmq4vbh7El2+NIsW0bKfjkvupx6oSpY9naE1GWp+Ph9A0w/RrgqQUSuvl2oWK7YLxBgFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxjvSS6K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxjvSS6K"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E8F3C2BCF5;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792225935;
	bh=0yISZhF00KTqyXR8COXSag7+b1xFTHdXc844BCL8lZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LxjvSS6Kmn2vEljL4xHHywPGcX7UPv/a5xlB/8OBiJAGjDSSHye79ap1SnJtyVbDC
	 12OsALEY5IIJstAXUEaR0wfyqd3p4I8L2/ulNq7RvEKt3ja9xr18UpARWSx4tL6XTQ
	 ibZ+ey0UIC9caVEZ1sSlRlckxNNbY3PFmsk4FgV7FGqXfLircv2maX/XUdLmeI888v
	 wMd5OKf/IXCp2f46C0s3oKfBJOqa7QuC9gQYClf9xiAIMjAdER74cE4dxbW517UpqB
	 HMrPvighENnZITWTI4pSCOBdFFfkboSI3ElFRNfVtz2+PRWfSXr8Ba6UYD0SvXMeOe
	 2ixHUhMa/7PGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5036CCCA463;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
From: Tin Posavec via B4 Relay <devnull+tin.posavec04.gmail.com@kernel.org>
Date: Sat, 17 Oct 2026 10:31:57 +0200
Subject: [PATCH 1/3] media: i2c: ov9734: Return -EPROBE_DEFER if no
 endpoint is found
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-ov9734-ipu6-v1-1-86eab22ae258@gmail.com>
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
In-Reply-To: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tin Posavec <tin.posavec04@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792225933; l=2048;
 i=tin.posavec04@gmail.com; s=20261017; h=from:subject:message-id;
 bh=JT2GJOl0pbtZgN6lvGHmUjRBY/6MhdLO/F5PS4KtNhw=;
 b=pExtRj6LrrgRcWLhnjntYE8W+OWWQGNCRml/3FuLz6n0iV+3a75sJw5v6jq+CkPUpp+OTVysN
 waWZNhlwemSA0UgE4+3cghmszKpIYwf4fb6Jl/ZubcOMdKjti7+IFmt
X-Developer-Key: i=tin.posavec04@gmail.com; a=ed25519;
 pk=SHQVmXmK88mO08JT/P9vzu9gKd208IICWLSbsX3TmcI=
X-Endpoint-Received: by B4 Relay for tin.posavec04@gmail.com/20261017 with
 auth_id=1222
X-Original-From: Tin Posavec <tin.posavec04@gmail.com>
Reply-To: tin.posavec04@gmail.com

From: Tin Posavec <tin.posavec04@gmail.com>

With ipu-bridge, the fwnode graph endpoint of the sensor is only created
when ipu-bridge is initialized, which may happen after the sensor driver
has first probed. ov9734_check_hwcfg() then returns -ENXIO, so the probe
fails and is not retried, and the sensor stays unbound.

Return -EPROBE_DEFER instead, as several other sensor drivers used with
ipu-bridge do (e.g. ov2740 and hi556), and use dev_err_probe() to record
the reason for the deferral.

Also log an error when parsing the endpoint fails, as the link
frequency checks already do, and drop the generic error message from
probe, which would otherwise be logged on every deferred probe attempt.

Assisted-by: LLM
Signed-off-by: Tin Posavec <tin.posavec04@gmail.com>
---
 drivers/media/i2c/ov9734.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 8f39609ad..f9280ef0e 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -837,14 +837,19 @@ static int ov9734_check_hwcfg(struct device *dev)
 	if (!fwnode)
 		return -ENXIO;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
-		return -ENXIO;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
 
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "no link frequencies defined");
@@ -893,11 +898,8 @@ static int ov9734_probe(struct i2c_client *client)
 	int ret;
 
 	ret = ov9734_check_hwcfg(&client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to check HW configuration: %d",
-			ret);
+	if (ret)
 		return ret;
-	}
 
 	ov9734 = devm_kzalloc(&client->dev, sizeof(*ov9734), GFP_KERNEL);
 	if (!ov9734)

-- 
2.53.0


