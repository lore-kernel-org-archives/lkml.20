Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D14220F2A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122484; cv=none; b=qbv2sJV21Cji3fcCYkfJEjv3mCee7DOcPB4+UCv0s7NACxAt2V9/6Kkc9HYDjXYx7dEAnn6NkAoV1rGDpj+0EsMwZfYXUxdmlLVdVaV6hQWSxxkDnTxngL7yxikMWFPWNKDHYrhHkv++4reIWwYXtWh78egi2IAt4DKpkvx3f+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122484; c=relaxed/simple;
	bh=w/aktebwl1Y3XGcI23NvEGJ5CAnVHvAXb/qbZPYpZaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGYUD/64a/PphY7AU+eLXYA0K/p5aOa2ICsIoNbALRM7JoG8ZI5XK+ygcyj9K2bacbTXtF2Z0erH5AngbUrdcOyMfsK9z/dYiKWHcRJLVCSxtJx48CZtSjw69PFG9UPeGEO9+Yu/Wn3R5ept5h94hgjir6Da8j/c0QjVtpaIED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaFcAjuV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaFcAjuV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so2733455e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122479; x=1790727279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QVrNsixc1/5D2acx7HxxSlwhomqIkjYst8NKgVyIQ=;
        b=ZaFcAjuVYze3JesFBQXxiHNekH7ua22ghkYHsARl1JMy7QjA9bA2G6c1uE523IvghL
         cBNF0HqiJK1GWsotHY1oTEPu3dF7dhlWXKibZmqIEKq7WK5s+zHeXLOluRYXSCPaRru7
         OyO1+0qJyeG5qb35Bkg4jwY2J5ASQZiYJREy1ghtnoceJnF2lJA4Zu8qTeXJZ/Ijju47
         kkohcGNph8LmFK7KACCTb17sg5W7PjTI4qHeVCYjeuMSl9X2148/oBASzz9UoZnYQr57
         or5yn0z411Jg1M40G0FBgQFZlr8iwJQLywoJ8eRsv3hCd/SnWKcrhjYd4XxZu2SWLVd5
         Tf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122479; x=1790727279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43QVrNsixc1/5D2acx7HxxSlwhomqIkjYst8NKgVyIQ=;
        b=1GyshV4R2ceAYAV/BvUUnfc8+Ibn4qTFeHSv2tPOWB0C8whTSHZ8jM3l0lGm/6QLO9
         YCBrO5d9a2YPxcFQ8GuVZ7gt0yS/ZtUcOAj8jR/9L9WT0Cy5X75WbPlRhaFF1NeC8hZ9
         UmNtUruduBk1jAmZYE3WGqmSGGwPRobvxPhbCBs4E329fP7eniE6SRmraEElYLTqk+hD
         /6YKTkcBUCY5ZvnBvtXR6panAI7kxJt75GcBwxjXwRhSAX3kpBqX/6RusaUnBFIaL8ML
         IDXd+N9ZngwlCMuh7tXLZxT/50qBoPJcaNJaKwlPmADk7mAapwzWxs711zX+mmwOGSwI
         B9CA==
X-Forwarded-Encrypted: i=1; AKwUvBytESJv5BP7gxTuN4f9tHDqn7WNvEaYQUGoDQ8iUJ4MD10t+6tDdQQx9YGpqDBSWAEmp4keGF2wBLI5y48=@vger.kernel.org
X-Gm-Message-State: AFuF++nNbhxCUMB4nMVSUvl5MqUz6xIHYGCP/79hbKKcSwyASwrcmJ41
	u0KsBcNxpjd01xCddPfSu6LDYBOZBe8xN1k1khy53//Tu19HoPCq3RG2
X-Gm-Gg: AYBFou3w9JdjIotsqOY9SV8luAUyfdtQ4o4E0E0c0NyqVatdEXq+u6ApPiU/dDHTFoh
	fEMje4/D7Ku6gjXFlLy35pQMV5zZaEzv7UfAQQO4unE0aqa8+D/MQW+6+TrPmHXXjdVrc1fgMV6
	p2FIowIOv+9KChduxKF0c4wE27g/h+UGbgBktkyQjG8vPHSLCcdQPzVOYmJ/oj/50aIMfUKhuJk
	NU8z3+337W4LjNRu7LNKCBdcCNkTZm0GvT9HWg3B1Ks0ZM6xzMqMIBIp8kv3E2/U8kMf7dwQASE
	+eQdpWAK81M6Uab1mTfCThuMkQsNFJZX/JyUO/bMeTGQii1dfdbz3UAkdht4HdJB1E89DooY4WL
	RzvXOuwDnQXel8nYCO1XxwxY5NiiEUbeSIHAplcwJxRe2jGuoaqDJB3GOsxH0XJ0NR4GxdO41WD
	+kMWli5LUXYgkyl8Isbl1a0tt5nlEllCJlyt0MDpuMBKGdDczo9K2uWxsaV890+oDsDTm4x1jMs
	YiXsFv3ObRLDGK2ojoYOmltdYE1n+f3oa1qvGvO+P4osGh7O9aI64mYLpw103mfPh1fT6vhpi87
	HVSYxnY9lDgHmpAAQ1/BgqqbuvKn6BZASHIb4vNmI2bGk50/x9SiMlsE4qlNX90/W61i5lKyzmK
	Q8EnS9GbaX6E+80NA/jSpH0lRVu4IfxGT
X-Received: by 2002:a05:600c:a013:b0:49f:d58f:1f8b with SMTP id 5b1f17b1804b1-49fdf12bd26mr8409485e9.18.1790122479138;
        Tue, 22 Sep 2026 17:14:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:38 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH 4/6] media: drxk: stop accessing a disconnected device
Date: Wed, 23 Sep 2026 02:14:08 +0200
Message-ID: <20260923001410.30297-5-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
References: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drxk continues frontend status polling after its USB device disappears.
read_status() keeps issuing I2C accesses, and drxk_get_stats() ignores
the error from get_lock_status(), so callers see "no signal".

Enter DRXK_NO_DEV when an I2C transfer returns -ENODEV and reject
further hardware accesses in that state. Propagate -ENODEV from
drxk_get_stats() so read_status() reports the disconnect.

Also check the state after the tuner's gate control in
drxk_set_parameters() before continuing demodulator setup.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/dvb-frontends/drxk_hard.c | 29 ++++++++++++++++++++++---
 drivers/media/dvb-frontends/drxk_hard.h |  2 +-
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 0815083e54eb..df5f5ea959ce 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -208,10 +208,27 @@ static void drxk_i2c_unlock(struct drxk_state *state)
 static int drxk_i2c_transfer(struct drxk_state *state, struct i2c_msg *msgs,
 			     unsigned len)
 {
+	int status;
+
+	/* Don't touch the bus once the device is known to be gone */
+	if (state->m_drxk_state == DRXK_NO_DEV)
+		return -ENODEV;
+
 	if (state->drxk_i2c_exclusive_lock)
-		return __i2c_transfer(state->i2c, msgs, len);
+		status = __i2c_transfer(state->i2c, msgs, len);
 	else
-		return i2c_transfer(state->i2c, msgs, len);
+		status = i2c_transfer(state->i2c, msgs, len);
+
+	/*
+	 * -ENODEV from the I2C adapter means that the device is gone for
+	 * good, e.g. an unplugged USB bridge. Stop accessing it from now on.
+	 */
+	if (status == -ENODEV) {
+		state->m_drxk_state = DRXK_NO_DEV;
+		pr_warn("device is gone, stopping all I2C access\n");
+	}
+
+	return status;
 }
 
 static int i2c_read1(struct drxk_state *state, u8 adr, u8 *val)
@@ -6319,6 +6336,10 @@ static int drxk_set_parameters(struct dvb_frontend *fe)
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 0);
 
+	/* The device may have disappeared while the tuner was programmed */
+	if (state->m_drxk_state == DRXK_NO_DEV)
+		return -ENODEV;
+
 	old_delsys = state->props.delivery_system;
 	state->props = *p;
 
@@ -6487,7 +6508,9 @@ static int drxk_get_stats(struct dvb_frontend *fe)
 
 	/* get status */
 	state->fe_status = 0;
-	get_lock_status(state, &stat);
+	status = get_lock_status(state, &stat);
+	if (status == -ENODEV)
+		return status;
 	if (stat == MPEG_LOCK)
 		state->fe_status |= 0x1f;
 	if (stat == FEC_LOCK)
diff --git a/drivers/media/dvb-frontends/drxk_hard.h b/drivers/media/dvb-frontends/drxk_hard.h
index a850a876deee..dc6ee0bb6854 100644
--- a/drivers/media/dvb-frontends/drxk_hard.h
+++ b/drivers/media/dvb-frontends/drxk_hard.h
@@ -106,7 +106,7 @@ enum e_drxk_state {
 	DRXK_DTV_STARTED,
 	DRXK_ATV_STARTED,
 	DRXK_POWERED_DOWN,
-	DRXK_NO_DEV			/* If drxk init failed */
+	DRXK_NO_DEV			/* drxk init failed or device gone */
 };
 
 enum e_drxk_coef_array_index {
-- 
2.54.0 (Apple Git-157)

