Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097410;
	b=p2ZPoO4yEXtpkZm9GRgkKdBQpWar+YtSWV0HSFHZqGvOq2lGfmjwmMDNyI0P9Q0Dx81l
	 WJKCEc+irrxlXU2o9NlqfKBYyWinohv2RmhpIaPhfWslztDUI+LM0wq45+TEp25vIKAIX
	 JOoK46bMXQdYypsezYy3KZenWi/SCkNdZfct+crcFX0IqXFP5UIrc1i+er3FeK4vNXJyB
	 ALvjacL3zSC85lTQgqN3hzg2bjdLoAMWLp0HPPSxmu509svnQ8YeO2paNXM0oMzyBT7su
	 EH/pED0Zoac3v2nPxoSVPMLRnkCiSg+OsiYn3ROQslXGs5g0K5GllqgheYyXpW7oO1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097410;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n3Kp2y440zQOXcQZ6MfG/c3d1gw0REC1gxRRl/jFmDs=;
	b=h9+JtzHEDdGiGl1PgQH8PtojOeJWXY/gH8PSuXbvaXF+A4/e8tQACrxaYAxjKYleaneN
	 QmNy64C4RJcvOk0k3S6l9Wb/TJk0TryoSHFFtUzxztkN5gcQ7PeZ/OIoSb8VOJpcj4CIl
	 snP89ap/Lax365dKt83j5494E41plIMktNGO94ilhmiVMmvar5pbhntjO7DAMpXzAp3OO
	 CbAbMKpzmI1OjLab4gZy95gglt33OokwuQyWy9bcMVSp2BGgVD9PvqQl5KsgLvgpzHirF
	 9sQ+uUdV0LuUPiMPU2PDzOvyd7SiYzQ3hiPVJvbsOoaWj96fc551DtBolEZCjlJ3Tjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUdMk3go;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4A3606A31A;
	Tue, 27 Oct 2026 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUdMk3go
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CA01F01829;
	Tue, 27 Oct 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097410;
	bh=n3Kp2y440zQOXcQZ6MfG/c3d1gw0REC1gxRRl/jFmDs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=aUdMk3gowDv3YaTRbsQcWTSyrJnudqQTcSpLbvGv8HxMHmpq1BJ5dwXY7v5eM7Jzz
	 6Lq84aa1CjUogI//esFI21z7caUvwmCrvmvenXBi42+KLKZidAKjxGOzkEl7O9QeEi
	 hwVqDN7LeEsSYAJ+dOMWDyTp/LbifK4LxiIXyG/x5vyy4IV6uaWI6mM3/xtl/eR8s0
	 0yOFqXdO3EQ2UgCWJSg4Bh/zLla57O6MYXu0eMM0hc+HSElt7jRBrWU2NpMWd51h3Q
	 lPyvZdNa4BoI4xWzEDfxOGw472nGBzXU+0iiJc3lpAG4NbiMAoDssUSIjSdwNkBAvV
	 q6XnYN0ccR4Fw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Rachna Patil <rachna@ti.com>,
	Pantelis Antoniou <panto@antoniou-consulting.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Felipe Balbi <balbi@ti.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/27] mfd: ti_am335x_tscadc: Retrieve parent driver data via dev_get_drvdata()
Date: Tue, 27 Oct 2026 09:30:35 +0000
Message-ID: <20261027093306.2812695-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261027093306.2812695-1-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti_tscadc_probe() stores the address of the local pointer variable
tscadc (&tscadc) into cell->platform_data so child devices can retrieve
the parent struct ti_tscadc_dev pointer via ti_tscadc_dev_get().
Although mfd_add_device() deep-copies platform_data before
ti_tscadc_probe() returns, both tscadc->cells[].platform_data and the
shallow MFD cell copy attached to the child platform devices retain a
stale pointer to the expired stack frame.

Set the parent platform driver data before registering the MFD child
devices, update ti_tscadc_dev_get() to retrieve the parent driver data
via dev_get_drvdata(p->dev.parent), and drop the redundant cell
platform_data assignment.

Fixes: 24d5c82f8227 ("mfd: ti_tscadc: deal with partial activation")
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/ti_am335x_tscadc.c       | 7 ++-----
 include/linux/mfd/ti_am335x_tscadc.h | 4 +---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 068c25401c6c..4afa9928eba5 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -268,8 +268,6 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 		cell = &tscadc->cells[cell_idx++];
 		cell->name = tscadc->data->secondary_feature_name;
 		cell->of_compatible = tscadc->data->secondary_feature_compatible;
-		cell->platform_data = &tscadc;
-		cell->pdata_size = sizeof(tscadc);
 	}
 
 	/* ADC Cell */
@@ -277,16 +275,15 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 		cell = &tscadc->cells[cell_idx++];
 		cell->name = tscadc->data->adc_feature_name;
 		cell->of_compatible = tscadc->data->adc_feature_compatible;
-		cell->platform_data = &tscadc;
-		cell->pdata_size = sizeof(tscadc);
 	}
 
+	platform_set_drvdata(pdev, tscadc);
+
 	err = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
 			      tscadc->cells, cell_idx, NULL, 0, NULL);
 	if (err < 0)
 		goto err_disable_clk;
 
-	platform_set_drvdata(pdev, tscadc);
 	return 0;
 
 err_disable_clk:
diff --git a/include/linux/mfd/ti_am335x_tscadc.h b/include/linux/mfd/ti_am335x_tscadc.h
index 4063b0614d90..4a048a897cf3 100644
--- a/include/linux/mfd/ti_am335x_tscadc.h
+++ b/include/linux/mfd/ti_am335x_tscadc.h
@@ -177,9 +177,7 @@ struct ti_tscadc_dev {
 
 static inline struct ti_tscadc_dev *ti_tscadc_dev_get(struct platform_device *p)
 {
-	struct ti_tscadc_dev **tscadc_dev = p->dev.platform_data;
-
-	return *tscadc_dev;
+	return dev_get_drvdata(p->dev.parent);
 }
 
 static inline bool ti_adc_with_touchscreen(struct ti_tscadc_dev *tscadc)
-- 
2.56.0.307.g5fe7bd680c-goog

