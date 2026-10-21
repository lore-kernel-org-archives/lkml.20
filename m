Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584877;
	b=hY3fmN9TOG+NBid1gM80293gAdF6CahorzQwOMvqOqI8qFrcDW6VrFU703KrT13J/ZdI
	 9Nu4Wo3xx2OgpF2lBv1zhHC6lJwlZbwz+YtRd0evzApEOt5OyfDmjNSG8QY6r7/LVEolK
	 eRxn1G6Ob03K5JyQQA2aKuALNVXLdQGV4Hu3uhkHqNeFA7PfGbbLQXEsm1SIU2si82hoT
	 RMHgFvYeOOxOXfgvoGq19URbL4UIprByoRQDmKForQPtqeO+xmDIHWO6LYc03oRXAbzxe
	 dHkO61MXYTEfcGDuEKOjVLcQuquU+rNv/1VXTB/lWfPMeF4fDUdRc8Plk2GdjEFOMpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584877;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=woUB5MItRZQNlZRiksm5AaVqdkR7s1GJj9NajCN/Ps4=;
	b=xadoHBnHZpQAFkuJ/2mdUeFPYyJVRY0OgI90CObOslxSV3DAKByCmgMNlP4U1qtpHrfc
	 35Ul44C0ztneS5ZUIvLQr0hT8pZKsQMKlRXptlpa9Mk0rgzPPhSAOPXl+GZhzdtyRqzpa
	 RtwiUopi4DehQqjioI8mmIj/9Xehpls5T6rkAFTGicKwsFFUAW1dPa1MbLqrd+jlt4pW+
	 LwCw3GdS+fLTb7fYuvLaeHizhC9pzO1oBRiZoxQUiSyOcp+dPIHZakOfGcTRiWR+OuUch
	 V2ptjEE4v+EBdrq2mCQ2jB+nAuNc2zL5EuPQf0NwdclXAILrbwle9NkRTxFPsVbhOzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4fb+6gW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1961A606A319;
	Wed, 21 Oct 2026 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4fb+6gW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47CE1F000C4;
	Wed, 21 Oct 2026 12:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584876;
	bh=woUB5MItRZQNlZRiksm5AaVqdkR7s1GJj9NajCN/Ps4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=M4fb+6gWh53WiOsyexYu1mrc4L54nwpO7uy+6DdqS5sPMcN/zoqgTVjbjcQ4Sdz4y
	 vPDCoHPBLxhg0dVnjXQqaPhaPL6ixnf9pKjTaNfek1nbiAkR4qIuyaNli9u8w6WZpt
	 Y/dxRXbqWMuY/dVgi1V3FlUvihPyH0b7vYBDzCUa/hgBTNFNdr0oII28TAu3IbIZYQ
	 yZitZRKTFlYguJQ5ezizrAN9oBHl8QYPePLR4Fdqm+UYQptRzui485f64OanQomAKD
	 HsOhrvk1X0T5TOgaHUfyBo3QhRiuCV3QD48W0hChdZ9kZmBCz6jWI7fHVUmaDowmd5
	 wZPbze/Ngivgw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Rachna Patil <rachna@ti.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/28] mfd: ti_am335x_tscadc: Retrieve parent driver data via dev_get_drvdata()
Date: Wed, 21 Oct 2026 12:09:28 +0000
Message-ID: <20261021121245.3111563-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
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
2.56.0.218.g1ec904b173-goog

