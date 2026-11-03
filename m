Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681237;
	b=lvaJDcAsuRyMUd7xkC8jl/6FYrMjYn/RnKUDD4T+UI0GOskAcvnQ2yE+MNxEEBgblcHs
	 bkA3eB1qYXE6tYklZKADnyshm+7k91bVi/gCcCUhvGSW8Ce/0/OonTNIqI2EgmzOdW+Ja
	 JYBDUWtYozwr0K12fiqBzJLyhXOkLYvKv8RcqfKC0a3kiQK/rvu4hsaTlRXihhDGItNca
	 21U15cPG7N1PhA2UOoWbxYhoFty2yFUleqDDYjCSzgxxy9dbIAgiNhFrJtQVEaNQZvEZ8
	 FJRBvwN6chIIGk4f/VEY4N8/taJR+/m0qklqjKUxmiTsigV50B646saQs4eCjWqj22w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=;
	b=CVkSexs5NK/gfuHgji8YWsOuap91xle4dvFXwFpFrM9Ydyac632cvzvpQ/s3NlGxY93E
	 omcSBbjh/3PsgQWMgIrtv+aV4MQzq8/Y88iezrdC4bOIkC1o04P131tJO8O/K43EznkwB
	 OoRi9xcrUvmV42aKy39djFfA5IG61zP/9MTCZJmQjM6hdmsi9v9YkVRUZN31wYRZoDg5G
	 +0uG28PRczHg07MdIWToGeZsSTPikZzdHTcy8N87f8gHYBLbAexMwvoeFLqe2yNvGgSHm
	 V0FUyXvzFERj4JD2yHVkXMmxLBzPbQxCsgCEu7pitQQg/BFKw3bp7y9vad7WfX4donQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpdWMr4C;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C105606D803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C105606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpdWMr4C
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a17a332ecso5784489eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681236; x=1794286036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=;
        b=xpdWMr4CCEXBgU+jpBv5B4Ec+3/7vWOt8kMfm/QVRgLr2EBsLjpzV6YyWrGhEn9FIF
         VU9eHKvMPM03dp6mavZcfNe4k7IAfTLbkzuI9croxWobp4/sJzRaM4E9rgcvIHRH48VD
         +GrO4MoR6WDSMCng9G+Go0/O31OCkwVW9R9Ys/KnuiAmpFBqIFeg95TqqEhk3SKsKP9/
         bJCoM+ntwFNBVweLhQIdhqeuVeuvwD6HsqkCSceqkpOhS9hZ2mTqnB57KKSMYh5v0dD4
         WalXV87IPZevVcj4QZwlxWYtUzfe96ZVGFlzSjof7PufSpiTnxL+9TZfgweOFKMGG6ae
         WIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681236; x=1794286036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=;
        b=ZGC00G0VnOpGxHLSn9WSYvyLwobKw1x/l6niLzynjQZD2ML6zfsJWPnmLytCxYmai6
         mgy/fxEd3AV8CeFzMaoziLwvwalVEOpYaxP4v06Y2tw0+mFvOCf1AGDGfo//cMxNQMUk
         S7Tbpq0Uk7IlLZbOJTlqawtwHPgQ3SZfPRgDBnDTVzaNtjmB5XTs9QXKG8JmNTv2BJFK
         Od84h8s7lhSpTQ6SHu+lGwDP7F2sHGwzDlCeMC4+Ii08Y8oQkpzkdOVw3vlodcwr+1yy
         dWSe8TX4/91/RGXn2QgI7kD/PFEGYnNUd8WFOH7V8FAdI1HjSu8qjmJQfl2arcQ+qIHE
         Dqlg==
X-Forwarded-Encrypted: i=1; AKwUvBySiLF4Mw0R0nKf9crGp9c6ZZx6+cy2oyQdUF/Xqx6ptH6OpgJbJTVVwvGccwmgA71whe96U46ZpW6G/Tw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uvYa1z0FImBKGZy7chJTU7l5UquwFheUpFGwKsSLZuUopWefc
	HmZZDLbPmg8zRTByXfWkC/IYk7yxCVtxp6arhKWOl3AuZ4RixkvJokDw
X-Gm-Gg: AYBFou0N9X/k+l+056LGqIGFoWBO+XxBJ1Q5lgV7JtYhN+szt3U7T5mu+60HGgcVw6C
	lYUg0DEu8bJ8KVYEP8+BfTexoDs0vCdfj8y30CtDzRRuMKzVi2DnGW73fs0nemCkM6Fj16PTLlf
	f7H1VfkkKFIMdkoYxOWD0seYocqv9HPylDbAbVwFoQz/MS8qoYPtfFjAAGB/PTfgxsmN35LAI9e
	ZfUy9ivIQW4zyzpmR8o016v2PMEX+koBnyystX/iMIfNH4p2Ue8ZQu4LmDrPhWlafNgaWu/Nhfv
	DJoJNxnuWuzd4lpLZifitBpLLSBh/wJRHDgdAbk8eXmM5+MfpJM+oRbaljlueDayG3D5NnmXe1W
	LMaFl/7CM/Hj53tE/7m6w69mPOdrf9qE650Bmet1NEcgno8DoAIQU3tbyPTWlrOzT7QNJF6PKAB
	yx0smGzhcB1q83QFN3/KKmUwSmxB7X4KPVBpCsPjN8E38eoJNFXF6TcvDPvx9DAQyBctkR/oIt3
	ecLS9qF8Trj66yzhAsL+FQafh2sftqKKwmlWLDIDz1ysXHdGsBNK4rI/AM4duMq304HgmFMGrSr
	QGEpXTOWspIfxYklNxnLklO8eEJSa+M31+idRj9+w4C4uaqqDlQuS875UyG/GzrL/MI1Km5pCfq
	gxf6mFjZ+8PChg40Trw==
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr21088734eec.41.1793681236195;
        Mon, 02 Nov 2026 20:47:16 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:15 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Input: wacom_w9000 - rely on touchscreen_parse_properties() for resolution
Date: Mon,  2 Nov 2026 20:47:05 -0800
Message-ID: <20261103044708.2461481-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
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

The input core's touchscreen_parse_properties() helper now parses the
touchscreen-x-mm and touchscreen-y-mm properties and calculates axis
resolution in units per millimeter automatically, including handling
axis swapping.

Rely on touchscreen_parse_properties() to configure axis resolutions and
remove the manual property parsing and resolution assignment block in
wacom_w9000_probe(), along with the now-unused local variable.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/wacom_w9000.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_w9000.c b/drivers/input/touchscreen/wacom_w9000.c
index 4a2629a54167..51c5301262d3 100644
--- a/drivers/input/touchscreen/wacom_w9000.c
+++ b/drivers/input/touchscreen/wacom_w9000.c
@@ -249,7 +249,6 @@ static int wacom_w9000_probe(struct i2c_client *client)
 	struct wacom_w9000_data *wacom_data;
 	struct input_dev *input_dev;
 	int error;
-	u32 val;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(dev, "i2c_check_functionality error\n");
@@ -350,15 +349,6 @@ static int wacom_w9000_probe(struct i2c_client *client)
 	dev_info(dev, "%s size X%uY%u\n", wacom_data->variant->name,
 		 wacom_data->prop.max_x, wacom_data->prop.max_y);
 
-	error = device_property_read_u32(dev, "touchscreen-x-mm", &val);
-	if (!error && val)
-		input_abs_set_res(input_dev, wacom_data->prop.swap_x_y ? ABS_Y : ABS_X,
-				  wacom_data->prop.max_x / val);
-	error = device_property_read_u32(dev, "touchscreen-y-mm", &val);
-	if (!error && val)
-		input_abs_set_res(input_dev, wacom_data->prop.swap_x_y ? ABS_X : ABS_Y,
-				  wacom_data->prop.max_y / val);
-
 	error = input_register_device(wacom_data->input_dev);
 	if (error)
 		return dev_err_probe(dev, error, "Failed to register input device\n");
-- 
2.56.0.385.gac671c819a-goog

