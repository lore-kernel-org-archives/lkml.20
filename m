Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794248318;
	b=i35aiZ2mmKVV6XqjyRDW956BMb/g/96p7K+vm2VfhmMlXe4glDk4bhTraow5xPHicvZc
	 J47WOrUBHJ9m9jE8bvm9+09gUXZX5nHF9mXA4WntKJ4cT4hDWPtn7PMz5s/hJuuA7CR+x
	 GL7F0zmFdvtFSiMETGmfQZ+7153rDxEeFnNAJ+s/03qe0jheu3cwNMaeiU93uj83JXv9Z
	 tFxult18M6bhjGnrNEQ3z5uyt2biV7FzAGp+anhZL3Ky19w3pxCIaypFk7zJzq42hQjB3
	 b4wRbD+b5aqeIme50vdNWnF6B0AMVC2o8Vdwfr4oAB3Wpz0lDo8aoaZ8tI1Tx7dEaSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248318;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rn4jxzymr3xIQjsK3V3E5Saab8nvDIumub1F4bo27cU=;
	b=hw8QvA3uc9LZj+ce7ex5QB6/PeMB2ZwQ9WpaTopevbqWkje+87SDtYRDP1spRFbYmrZ9
	 AqaE+MAZGQeX+3QHea4OiW1gT+EPmynOhYEFjF0/ymsJ/WCmbtld89nuJKbsjsCQZwODu
	 /FF6Zu7ULZwz5O68rk+l/ZTLiuGHi8IcVakKK/pg63VvMCjTHHCqOcgVkP71am6BIxoBE
	 H92bAcqbpVvSLHPyezd7TrkicBGBM437+uqv0kkLUj5kMwWcbrllA6GbQTCAVESzTVm27
	 E2WbA2PvoAnmZ21TPIAgKv5V5mWW13606z6Wt7jPzfOFfLsC1Pazlnct4Fw2JVc6K4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGfyNEcz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E480606A330;
	Mon,  9 Nov 2026 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGfyNEcz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794248317;
	b=uiK60a7xnP+ysYFSILyML2HBxMUQX1WCzA+JKfdRWdwcGZEt27ABUuYiLwPvsmnEqyab
	 6pc0DcuLN0wfak+oN6sOo27LX9RcOOCPEZkLNbrViu1nKs1KLOyVhWKSAD2EU9MiZN6MB
	 iEvQd5emBA0+augwgi5Dp3unr/sV9x9NLgRMeeHvaXNv/sFUOFyEKQg+9zfdXL1ehRcw0
	 YswIPEydMBTo7tPPjD4Rys39cMmgxYoH79jsv4sX5SWNmk5ciMs3/cJOqXKmwkiVH4DZH
	 kbTrsw2lvIQZ99qhBTJJKjuetJCh3dYmIFWvM9BGYiK9RLwalk7aWR62ibt3aL7Mnmw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794248317;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rn4jxzymr3xIQjsK3V3E5Saab8nvDIumub1F4bo27cU=;
	b=IMIo92kivNUBAStOZEkg48d/hT7hsjM/K0yaM3zNP70AMzZndBxl8AiaEoVNPq5EICD0
	 lYrGgY1L66DCP5HidyNRcc47sUR2DuMuxcaRgM7AuxizIwbHNkghz1e/0j165VzdFhsVg
	 EsroHCoS+OkA4KL4aBe9Q44PCD+Va3CKZ5w/yvAILf3beiwb4bFKT9QyM0Y0sazMeBhLr
	 ggKRc28YnCFZv1KO8uSQb8U7H+2SiUeUEM0eehQS+2PYy/RAshyE6cb3f4N3tY0av1SMt
	 XeYISd4vYV+t5MVr/u67kxT3GgN2HQlLUhpzX6Wi0aaAgh263K+mjODJQC/31CqNbMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 691911F008A2;
	Mon,  9 Nov 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248317;
	bh=rn4jxzymr3xIQjsK3V3E5Saab8nvDIumub1F4bo27cU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EGfyNEczYF6bQg3N7xs0rmL4hfxeQvYHRG5phuKbPkXXIc3tS86rlVLUQdGQL1Crz
	 zuUk1B1zKao4VS3non5aXy2NcLA2B8jycBnsFmyNumtC4yHv8lcePmFo7lN+j3WEi/
	 XV6vDPlRq4S09iq6tpxhNcuEKzVBbVXIx5u+sNPiVgJlZChGUpTinGNphBxLeLOYAe
	 1iyuBxSs3iyf9xxJVb7JXYxKhVtX+UhPgVWoaRQZtBGAVv1q/dgVJ6/x2Xgu9Vr6wa
	 /gQraj6/4GA0QkQYIuTx1rhWQLXOA1A+pKRg7s4NvKTi8nVAG+dFrpRnizr3OCidZ9
	 qj7254DrU+FkA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF455485B2;
	Mon,  9 Nov 2026 18:18:35 +0000 (UTC)
From: Tin Posavec via B4 Relay <devnull+tin.posavec04.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 19:17:50 +0100
Subject: [PATCH v2 1/3] media: i2c: ov9734: Return -EPROBE_DEFER if no
 endpoint is found
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-ov9734-ipu6-v2-1-0481b512c4c0@gmail.com>
References: <20261109-ov9734-ipu6-v2-0-0481b512c4c0@gmail.com>
In-Reply-To: <20261109-ov9734-ipu6-v2-0-0481b512c4c0@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Afonso Figuinha <afonso.figuinha@gmail.com>, 
 Tin Posavec <tin.posavec04@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794248315; l=1997;
 i=tin.posavec04@gmail.com; s=20261109; h=from:subject:message-id;
 bh=hZlhgr7t27xWi5riQyDtNa929Y92ZQWSKOxXOnT5Jec=;
 b=1DQaXamNgIOeEsrMg8uF62lXMBw7Lki1z4WySjsX17gDSYQITGxwLmUDvjflXhtae4Q3fUsFb
 aoNOcnFjGK+Btf0U9LGIM86BCKPH24Fswcpcwlh0bplyCrWE63Jo0me
X-Developer-Key: i=tin.posavec04@gmail.com; a=ed25519;
 pk=h4O+VaAXzwd3B9L6H8RltugTkzF65lam1c1ls5knAVg=
X-Endpoint-Received: by B4 Relay for tin.posavec04@gmail.com/20261109 with
 auth_id=1463
X-Original-From: Tin Posavec <tin.posavec04@gmail.com>
Reply-To: tin.posavec04@gmail.com
Content-Transfer-Encoding: 7bit

From: Tin Posavec <tin.posavec04@gmail.com>

With ipu-bridge, the fwnode graph endpoint of the sensor is only created
when ipu-bridge is initialized, which may happen after the sensor driver
has first probed. ov9734_check_hwcfg() then returns -ENXIO, so the probe
fails and is not retried, and the sensor stays unbound.

Drop the check for a missing endpoint and return the error code of
v4l2_fwnode_endpoint_alloc_parse() instead, which is -EPROBE_DEFER for
a NULL endpoint since commit 8015a49d8b33 ("media: v4l2-fwnode: Return
-EPROBE_DEFER on parsing NULL endpoints"). Report the error with
dev_err_probe(), so that the reason for a deferral is recorded and
parsing errors are logged.

Also drop the generic error message from probe, which would otherwise
be logged on every deferred probe attempt.

Signed-off-by: Tin Posavec <tin.posavec04@gmail.com>
Tested-by: Afonso Figuinha <afonso.figuinha@gmail.com> # Surface Laptop 1 (IPU3)
---
 drivers/media/i2c/ov9734.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 8f39609ad..49711fa17 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -838,13 +838,10 @@ static int ov9734_check_hwcfg(struct device *dev)
 		return -ENXIO;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
-		return -ENXIO;
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
 
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "no link frequencies defined");
@@ -893,11 +890,8 @@ static int ov9734_probe(struct i2c_client *client)
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


