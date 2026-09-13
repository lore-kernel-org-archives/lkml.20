Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBDB37E5CD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332626; cv=none; b=XWCLEzDsthMQou6LT3U/6JrB+HcQ4cBZczfPQOojL3YRqpAa+bhNVus+sR4V71cJWLdGa8Mdhxmm/zsm2w+H2HlzwtSSsOZv9vgdfsQ0YY3zJTyfjDNESryfWDBkt8FknmHTwH5qwJg/dNBQcxmjQiapOl6c5n8LHL1j2Jf7jwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332626; c=relaxed/simple;
	bh=cjSdxH7baFihtM/V1AMCnUMKfob28Q3GgdzY21w2Wkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PwRHLJ5DCiQNDYPCR4+S/OytdClzDbxu9vpLZv1tIGkl4O8OYCCxZUuiy59N/IotSd5Z/AkvOaYMoHD7FIA50Ky8oQXhTZPGV835bkTHGtYmxO6hSbiNpQG5XyTzVH8aejAgngNI6Li+4/Jy1vYlfDOspccZwYO5u+RN1sLv8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rgYAjW+p; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rgYAjW+p"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530301ff353so14893741cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789332624; x=1789937424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMTgWivp0e7gelEPDHuWnCELoEKFxvhsWudexAHdLaU=;
        b=rgYAjW+pVNZoKaN9MRpHGtgEaRWlfwxDn5USyH4j+xgkWLa0f+idy+PW83mktI0fWA
         F5Z3t21dSe0Gnj/jl/EGeFLS2MccVIMrBWMLYG7gfqpWb+tmc7VToz+nD4ZQA+80Nmag
         dbgowVCqAaH9m9SDJFluappms85Tc+dkEvL8DoAkFZhl6asn8DicYq2B705p0grGFrvT
         T2XtnmK2/jTNKXfwB88wr293pUkbnc3Esq0ysyRMh7hK9CVTzhSiikXQpMvbSb6C1BF7
         VkMqq1l+2UTQvPjd7KiJ42+6aX7IMI31JcYNadwaWmeWlxg8KTGYc/8H/gOOQZQUSMJ4
         vhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789332624; x=1789937424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMTgWivp0e7gelEPDHuWnCELoEKFxvhsWudexAHdLaU=;
        b=gOP1y7Xr+3hSPITTRST7tPkzAXtMbti476JkK54cd4WBppfVbYkutC2hq7CBL/fRaT
         i+7g8h0oDHozaxE/jmPSmBk+86bqYkeHSpptOJHErcMDpeXVgcNJY0AcAbE3P/QnDLym
         c486TIW/UkiOflydFdYhqySbM7FZJcO2aT0dUSzQoHIKr0T/4C9lCqmvfr3h5nK1SKM7
         6cjBs0WWZO1foOuOFwJqIJMrqTeYyMKd59jmMgE0kBeMPnfC8yCd9+jldrMKfnYdLkfs
         F/VA7pJdtJcnu5dfu7VGKC24IewhDcMQ8p7UnQYLqbNM+FDSa5HQp/wfn31KmgJwsqdn
         Yzww==
X-Forwarded-Encrypted: i=1; AKwUvBwIixmOd51NnQgjrvv/Prxg3HDS7Adz4VFaR7XaF3z//1fS/N/Vk16Jx6CbGtS5g6wI9eqSdhyVLRKVMaY=@vger.kernel.org
X-Gm-Message-State: AFuF++mRd80Wq9ikByNESO9D7MEyVZNdRkUqb6KP+WFLqxLwL459MyXT
	Lx9CgPajtxPRDopcqpx4FK7/LiCjszibnvljJHOvRxf/Ng9uPW1P8VE=
X-Gm-Gg: AYBFou3N3NVOfLAVIbBA6Szr09ccnXs/rRk1tkBFTpNnqxeh/J6TCCJNgxf0Lue2Q4u
	JoeYNu6piH52TaTqmWTKmynh48OtHKqzTMhQDiHpg4wcQP+PYuzmL8dxKz0DaQz7vbdf0Uk2k2r
	gSQ9TjkS9D4c6zmnKo4AUePcrEeSxkYZYl10M58UGyXpFILS2Oxi4kubfZHuLFIahxd2wZdHiDP
	Qyy8pGKkBgX+irwFzoqq/gBgwfYYxmFhxBFzE8/xL4mERVCXfWii5k61G6AYby3XAa1OaZ6nNnq
	LgvaE6b8u/CNcqtBUJEEKQE5qLik24/e8ZO59ER2Sq0NF8hxH+0vUDBSul5WqlKfH9HCW3QW+oF
	VPSdQJXwvcLktq+J1VOyCfzDZm4M/8QQgBWsWEyZBIk86lcAe41vNiv19l5WixSy+IKRiOnJVYX
	sWyMHlzIojzgxTlAGHUATvNyO6ew5owHxW7s1xqAt/SsxJtT7E7f4olxbdFo2bFzOSWe/MvDQSv
	UqRn1iNc+tSOIpUClWnlVyXEgEQX61JHmh7IBNYcpNa5gPByCS0gzi0kOPoV/jxl3UbVSQqg0W+
	RJj1Ar4xM5BoGMigfSTdVPTcLBXESg1P6w==
X-Received: by 2002:a05:622a:1355:b0:530:ba79:edd3 with SMTP id d75a77b69052e-530e832fe99mr121931421cf.62.1789332624296;
        Sun, 13 Sep 2026 13:50:24 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4ba156sm79460671cf.19.2026.09.13.13.50.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 13:50:22 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mfd: twl-core: unregister the auxiliary platform device on unbind
Date: Sun, 13 Sep 2026 16:50:12 -0400
Message-ID: <20260913205013.54777-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

twl_probe() registers a standalone platform device named "twl", but keeps
its pointer only in a local variable. Probe errors unregister the device,
while successful probe leaves no way for twl_remove() to release it. The
platform device therefore remains registered after the I2C driver unbinds.

Register a managed action on the I2C device immediately after adding the
platform device. This unregisters it on probe failure and driver unbind,
and also handles failure to register the action itself. Remove the manual
error-path unregister to avoid releasing the device twice.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: defa6be1c821 ("mfd: Fix compile for twl-core.c by removing cpu_is_omap usage")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mfd/twl-core.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index c024a28b0..128cd3f6c 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -719,6 +719,11 @@ static const struct mfd_cell twl6032_cells[] = {
 	{ .name = "twl6032-clk" },
 };
 
+static void twl_unregister_device(void *data)
+{
+	platform_device_unregister(data);
+}
+
 /* NOTE: This driver only handles a single twl4030/tps659x0 chip */
 static int
 twl_probe(struct i2c_client *client)
@@ -754,17 +759,22 @@ twl_probe(struct i2c_client *client)
 		return status;
 	}
 
+	status = devm_add_action_or_reset(&client->dev, twl_unregister_device,
+					  pdev);
+	if (status)
+		return status;
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_dbg(&client->dev, "can't talk I2C?\n");
 		status = -EIO;
-		goto free;
+		goto out;
 	}
 
 	twl_priv = devm_kzalloc(&client->dev, sizeof(struct twl_private),
 				GFP_KERNEL);
 	if (!twl_priv) {
 		status = -ENOMEM;
-		goto free;
+		goto out;
 	}
 
 	if ((id->driver_data) & TWL6030_CLASS) {
@@ -784,7 +794,7 @@ twl_probe(struct i2c_client *client)
 					 GFP_KERNEL);
 	if (!twl_priv->twl_modules) {
 		status = -ENOMEM;
-		goto free;
+		goto out;
 	}
 
 	for (i = 0; i < num_slaves; i++) {
@@ -880,7 +890,7 @@ twl_probe(struct i2c_client *client)
 		status = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
 					      cells, num_cells, NULL, 0, NULL);
 		if (status < 0)
-			goto free;
+			goto out;
 
 		if (of_device_is_system_power_controller(node)) {
 			if (!pm_power_off)
@@ -896,10 +906,7 @@ twl_probe(struct i2c_client *client)
 fail:
 	if (status < 0)
 		twl_remove(client);
-free:
-	if (status < 0)
-		platform_device_unregister(pdev);
-
+out:
 	return status;
 }
 
-- 
2.39.5
