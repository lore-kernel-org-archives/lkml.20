Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0370751812D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062168; cv=none; b=nteW/XVzPqNak5bsjPim9Htx9asKSY3NMot+Y8+6K/FlvTM70A0K9Hzn9uiAvbMZ68rCJrxCXZoMOH5WI4w/YkpIFytWGp6s6it8HhTzGRVRWyIJGerm4pKXJJR3Uody4GmpLwzMw83X8mMNw9NOVft94VAfd9lmIchGtW0pXgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062168; c=relaxed/simple;
	bh=9YRIh1kA+u4lYxkKWuQvSE5rfD/xfftps0tycTQULKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXuAidUS6RrKM/H7RNSC3lkQVWvULZQqDtAaNSnhFS01B1oIN/gXZyRQPtQbxCyEn1FYccsKYC+kWC5ZeFYCIRNIAMVGE1UYPT/BeWqk3BpgRi9p7du284CSL4rhfjCW+ZMdl+VP5fwy1dkyn3KEO4IXDcqg55sPi421dipWlNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWS7jdB5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWS7jdB5"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b8f5e2ce5eso4677846e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062164; x=1792666964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=97yo0fKsgeGFqhnBbCjJS8TkGeGMF2V9RqeCMW7ds3E=;
        b=oWS7jdB5BwyA0YqRTvKYH7cCKDRTLjMhwus+S5eC5WddDw9VdZmFrAj0ajJxWcbmCv
         26qoLNWObYB5SmMALzZAAOLtZIOD7PqkSzOJ7oGAcwpW1ZBzgIJCBJHXS6AikP2bO0fm
         esPJg021EBYu8akMVyj2UCMnodKV2UKcdt50KYdt7gYCXQctifkeMA0vjV9eDLZkcI13
         ZgHQqdDqEoyw631xJciCUpbVraR301M1ZHFMdyTaJftlKWhCynU2wWDHnqXFKPDRjo1Q
         Lm8MnX8Iec0W+Xkgu4D4o7Sn3kEhAkdao1xk0GNoDHRFlOaf1DIO2RP4dHMTLFt/a7ls
         8mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062164; x=1792666964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97yo0fKsgeGFqhnBbCjJS8TkGeGMF2V9RqeCMW7ds3E=;
        b=DE4efKKI0VBWkKjKmPhfEgh5WVHu6pgGefhlhxIEVs6sZD9wsR9lvAvzZaRaFNe8Pf
         slyOIl/GumWD8yuvr4UQe+LBJBCkx/hLRYAqg9pNr8SnwSRl8QAq/N94kDDxDURPJmRb
         gEHgzgC08Rug6lII66TBkuSTxawhijorlTi8MqEt1oSlJawxZ2+4emC2BwFgA/nBtadA
         fzfiP5qHijjpKTEBu6EgEiVEZf2SRN5L0XCaxjNtAZtJxCk7k0B1j3gpWPt5MYZ5mE5Q
         1Dll8Ykahs+4rqLTD5t97keW9OyBWxCOSTiYX9bGY23FUM7jr2nOkKVuVFRCt4Z19hYX
         /gJA==
X-Forwarded-Encrypted: i=1; AKwUvBwkiLK7ix1lUThSf+ahPXLFh4B4gomgbp/J9rbJbjNXqp8PGsWqMwyMfA8VIpCiMxwub0GwAQwgs83FGIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk3Wkd1M63UhJI4/A+vvcImw/BOE2E15PO6N8xw254d+gE4UNa
	ydx1WI21oMM9P+RFVpb2DAOOvSGQ8hMGq4YyIHyf6PZxICkVNB/5LNFn
X-Gm-Gg: AYBFou3vJ8Ue35gCiPwiD85uBNHiRqjnKxff2a5LV9hNKnaNAcHqYjn5df2E4YdkVpV
	WmqVoXac1M0WUgtIoJkvYoBMU09iRMlO8K5850lejFhQqmP07VTITt0iKbB/F+petgkDmAWRac6
	jjW5Qg4X59//miYi9WxZEZqqGolWUfNq/T2iVi9CugbUG1Bdwt7DD6fbK+C111XgWdRpULzRBVj
	jDLlz88KYTHl1TPOOfk1JYk9ECfZHCn7gABKzYxyswip5R3aJH69UaRj34Z0NKM6QjAJF9i+zmF
	SjinxgIUY5h0X+wX7QTd7R0KGMHC9t7XIu365pD0jOoy2f78KMgq1TjnmS6TKpRbYV6HX5Kipix
	SWCPiP+qqqoWgY3/iX+0gHytCnA3hh/rTqjQd+DJCySl4d9BMio3zQUYhYLELFXCaHG8ln7eBPF
	jzufrcwfbf56gr3dKWxcP3GOtCXCy4TphLRDNDuJXXKihqJnJMNayuZUjIuGcOX3wkkkS/d1eXS
	YgDbieZi5Nx1YSLCQ1s9tb9+zH9MFBbh52u8+EHtuEj5wjDzhI=
X-Received: by 2002:a05:6512:3c8c:b0:5b8:f52b:8119 with SMTP id 2adb3069b0e04-5bcde6c3488mr6877310e87.28.1792062163946;
        Thu, 15 Oct 2026 04:02:43 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:55 +0200
Subject: [PATCH v13 8/8] i2c: mux: pca954x: use idle state from
 i2c_mux_core
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-8-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5947;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=9YRIh1kA+u4lYxkKWuQvSE5rfD/xfftps0tycTQULKQ=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LLFXHI/5KZNJWCwgy0qPKveBhWDSZ9kWT7/q
 AyVPJdh89qJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyxQAKCRCIgE5vWV1S
 MmpWD/919NDmrYuCr74+cf9mCKMSlAM88yzdunn9MN3qlJOe/PaFY7PQ8qCZbg+rSuK4sfNLFij
 62v1RWkIFQDitVLa9VhYmXbsqdDH76x8UZwdf35/otVNZrcp81Fhtw6Hl7QrX2SryJo5r917uLp
 1Cfi4zXX6MBE7WDfeEluqtX0262zejjkPdESy7F4yST+v6AZcl0RcVf6IVKFDaguZCm1jBCq4rj
 S9DSm7IPLgMZaHO8klaa68hFfdpn1WfxtJ5Klx3X0hCY1eI8qugvMPf2C/R0rDNcCiQAGQShYoF
 QWYqek2NUlTInrcfwG275/NPkvKmqz1iv6IBIwUuvmg+/H74V2aIcBnG4iSMs7vZFDqlT7N1Utg
 rAduVUusJoI63uU90e3pQMlFVOBVmBXHrb5bumQka1tUJppdxhgYW3n/fHn4sbh9zjtvFJ+o7if
 5R99FvXlAvMcZTGN7RzXwDmZJMZjRnVQMOqrifp9Nxo2aVBmvSA+xqD6XK2ghaKBMKXWDnFF2X1
 jsVhMJ3apt9ONeXK6Js4wcDa4nK3T9TbwNct8cSs2o3tdPhjD/fbLvT2DJOLHPliypGSjF2K6DY
 KmcyC2b3KrYsMrSsGXMZ/O5fkwgp/b3YhVi/4TT9APdl+9oOP6phAprFG9SfvJRw5vusQ8dVs0/
 3jMhpLOgG33/OeA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

The core now have support for keeping the track of the idle state.
Make use of that instead of handle this on our own.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 76 ++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 8fca709ed279..87bde07374d2 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -52,7 +52,6 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <dt-bindings/mux/mux.h>
 
 #define PCA954X_MAX_NCHANS 8
 
@@ -108,8 +107,6 @@ struct pca954x {
 	const struct chip_desc *chip;
 
 	u8 last_chan;		/* last register value */
-	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
-	s32 idle_state;
 
 	struct i2c_client *client;
 
@@ -337,14 +334,14 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
-	s32 idle_state;
+	int idle_state;
 
-	idle_state = READ_ONCE(data->idle_state);
+	idle_state = i2c_mux_idle_state(muxc);
 	if (idle_state >= 0)
 		/* Set the mux back to a predetermined channel */
 		return pca954x_select_chan(muxc, idle_state);
 
-	if (idle_state == MUX_IDLE_DISCONNECT) {
+	if (idle_state == I2C_MUX_IDLE_DISCONNECT) {
 		/* Deselect active channel */
 		data->last_chan = 0;
 		return pca954x_reg_write(muxc->parent, client,
@@ -356,15 +353,30 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
+/*
+ * The mux core only knows the maximum number of channels the driver may
+ * register, so range-check against the actual channel count of this chip
+ * before handing the state over.
+ */
+static int pca954x_set_idle_state(struct i2c_mux_core *muxc, int state)
+{
+	struct pca954x *data = i2c_mux_priv(muxc);
+
+	/* I2C_MUX_IDLE_UNKNOWN is internal to the mux core. */
+	if (state == I2C_MUX_IDLE_UNKNOWN || state >= data->chip->nchans)
+		return -EINVAL;
+
+	return i2c_mux_set_idle_state(muxc, state);
+}
+
 static ssize_t idle_state_show(struct device *dev,
 				    struct device_attribute *attr,
 				    char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
-	struct pca954x *data = i2c_mux_priv(muxc);
 
-	return sprintf(buf, "%d\n", READ_ONCE(data->idle_state));
+	return sprintf(buf, "%d\n", i2c_mux_idle_state(muxc));
 }
 
 static ssize_t idle_state_store(struct device *dev,
@@ -381,18 +393,19 @@ static ssize_t idle_state_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	if (val != MUX_IDLE_AS_IS && val != MUX_IDLE_DISCONNECT &&
-	    (val < 0 || val >= data->chip->nchans))
-		return -EINVAL;
-
 	i2c_lock_bus(muxc->parent, I2C_LOCK_SEGMENT);
 
-	WRITE_ONCE(data->idle_state, val);
+	ret = pca954x_set_idle_state(muxc, val);
+	if (ret) {
+		i2c_unlock_bus(muxc->parent, I2C_LOCK_SEGMENT);
+		return ret;
+	}
+
 	/*
 	 * Set the mux into a state consistent with the new
 	 * idle_state.
 	 */
-	if (data->last_chan || val != MUX_IDLE_DISCONNECT)
+	if (data->last_chan || val != I2C_MUX_IDLE_DISCONNECT)
 		ret = pca954x_deselect_mux(muxc, 0);
 
 	i2c_unlock_bus(muxc->parent, I2C_LOCK_SEGMENT);
@@ -478,12 +491,15 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	i2c_mux_del_adapters(muxc);
 }
 
-static int pca954x_init(struct i2c_client *client, struct pca954x *data)
+static int pca954x_init(struct i2c_mux_core *muxc)
 {
+	struct pca954x *data = i2c_mux_priv(muxc);
+	struct i2c_client *client = data->client;
+	int idle_state = i2c_mux_idle_state(muxc);
 	int ret;
 
-	if (data->idle_state >= 0)
-		data->last_chan = pca954x_regval(data, data->idle_state);
+	if (idle_state >= 0)
+		data->last_chan = pca954x_regval(data, idle_state);
 	else
 		data->last_chan = 0; /* Disconnect multiplexer */
 
@@ -560,6 +576,8 @@ static int pca954x_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
+	int idle_state;
+	u32 prop;
 	int num;
 	int ret;
 
@@ -618,25 +636,32 @@ static int pca954x_probe(struct i2c_client *client)
 		}
 	}
 
-	data->idle_state = MUX_IDLE_AS_IS;
-	if (device_property_read_u32(dev, "idle-state", &data->idle_state)) {
-		if (device_property_read_bool(dev, "i2c-mux-idle-disconnect"))
-			data->idle_state = MUX_IDLE_DISCONNECT;
-	}
-
 	/*
 	 * Write the mux register at addr to verify
 	 * that the mux is in fact present. This also
 	 * initializes the mux to a channel
 	 * or disconnected state.
 	 */
-	ret = pca954x_init(client, data);
+	ret = pca954x_init(muxc);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
 		ret = -ENODEV;
 		goto fail_cleanup;
 	}
 
+	/* Set idle state to the default value, or to the value specified in the device tree */
+	idle_state = I2C_MUX_IDLE_AS_IS;
+	if (!device_property_read_u32(dev, "idle-state", &prop))
+		idle_state = (int)prop;
+	else if (device_property_read_bool(dev, "i2c-mux-idle-disconnect"))
+		idle_state = I2C_MUX_IDLE_DISCONNECT;
+
+	ret = pca954x_set_idle_state(muxc, idle_state);
+	if (ret) {
+		dev_err(dev, "invalid idle state %d\n", idle_state);
+		goto fail_cleanup;
+	}
+
 	ret = pca954x_irq_setup(muxc);
 	if (ret)
 		goto fail_cleanup;
@@ -687,10 +712,9 @@ static int pca954x_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
-	struct pca954x *data = i2c_mux_priv(muxc);
 	int ret;
 
-	ret = pca954x_init(client, data);
+	ret = pca954x_init(muxc);
 	if (ret < 0)
 		dev_err(&client->dev, "failed to verify mux presence\n");
 

-- 
2.55.0

