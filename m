Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835639;
	b=OVudhhZCLqyZzTX8FOVyBtnJvMHWUZ6jczJNjaxkD6tBbka/BhzKB8pYAG28bR9p0bif
	 xYQJyLOjEqfZb9q2EpOhunA7JL7ZaioQ/NGDt98nzFfaTuqol30YKVrfDZLKt6pIkxSF/
	 XxKasprj9/QISRCLUQaO2JUyOJMMwToWK7wfWyQvy9i2VjW2dbefCEsWuKqlcSiEIV5C+
	 jp+VxMVbMxRT9nsLvBVy0HqOS9SQ7ojKBO9tOC2RVj+RYA1Gkj6PzBJC9mW8AG96491oU
	 UiiuMaR3MlDjpfzt2U8AQLSeE+C5t7suPn8zKg2QXoYHSzXGIBg4oyS9pq7Ow+0J0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=O6r/oWNBOG36lWqoLzVVjpOTVHNbWXetI9wfOlj3IbA=;
	b=lVUtWyBeEp2DmJb9He+eWyegkjRtpXAf0Hk0XNslm72kpblHEYijdgw5akKvn3ebblDj
	 JOyzpKg2tHP+ha43pZuVjgiOJlJXDeozwuZmcWPH9ummIsTS2bCijg4+Y7LIdnIN7lKRP
	 +inN43Rxlqbt730BDbSXW63h9JqWB7mpFldysxflJmi9OAada3HvlGnfdrheTlQ1qQYDA
	 GkRjCFteWy3Mz37C2mj10vCk5aXOJ0sbZCNBQ16AUjoPN3yvBy+AquOOaEzF7YBVb6Asm
	 4UNIgLD2AcTr+q96mEqYV5x1ajMSjrG28nMRy2PKFU7Yy9Xv1Cg8PayFoQ39V6YzdWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxc71WcC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40470606A89E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40470606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxc71WcC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so9331595e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835638; x=1795440438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O6r/oWNBOG36lWqoLzVVjpOTVHNbWXetI9wfOlj3IbA=;
        b=yxc71WcC0PNDtiG/3VI+akPGxAM8vIG79iyihbcKqLVaXUuSreJijP1KDT2T3DUi4i
         3uLvdSwSsUkPIU/NEaQiC2MHJCBNvnZwAAv83bB3ftCCuIpjw1G4lyG3siZcH24dy2bK
         xS+3qSqyyvaLpQ+nIGttYnJTVk8N865dTPH0Br5epIwVlj1LKRQq+88h66yG4oRPgWBC
         0W3l2rRp0NTozIc5YSehARTD5CIdlMhuqdMbh76yVp9ODFC9Df+FjWzM6+GLtTdYZLTj
         0kers3ug7NTqthrXStCownYKLemQsggsZb1NCdlbHm2cetmIxAJBq8DhhNys60s9rD1C
         XOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835638; x=1795440438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6r/oWNBOG36lWqoLzVVjpOTVHNbWXetI9wfOlj3IbA=;
        b=tZnzGLv+CidEw6sBcj7uekgqEAzzaJ9YF0jEDnGLHoQwRXooGiasRpdcjHMGai74GI
         euntqH0PlZsK/kWZDjiXIidNqEalF57toyWvOGVmlt1t451edpRox/PNKcE/iMBh4J+t
         mmphH1EUYcUnN0XsyT8j4qa8I3pArMUqo0o/vYXStEoamQ+hOrlkopO+Fvn6rzQRdlFg
         iIxa1rP+MHmSShfFm/8fDnVmvE/buPl8YvyerCNcthIm2mn3tdKcVZSX9rBTB358n5OO
         RPQXvcq+ovUgMuJYSGEMI9ZJHNJJQhmC46jBgcp5ODp1hTGbHwf1zvTL0l52Geh89cqi
         08zQ==
X-Forwarded-Encrypted: i=1; AL+hErE0CrGvCcVTS11jG589OoNOewzAje8EEUU/3NxBMV94rum1rSp/ZDAt/6SAF7eVxkioetkFhaisFRtdSck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b18/vy0/pigzez/YZmtprkcpMbN3k/jxwbE2AxAT2QjjUz5OR
	wQSwwxPLwySE3tRjW5o+EcnoliV/nCwcV13JluqDJ4dA0286P9kM280+
X-Gm-Gg: AYBFou3f35U5gSQDNCNsPU00UbfMaF4EKB3ryWp/+gUViI/ga2LEs5JaS619I27TSRB
	iVMBEzHcTyatv1LBXYkFQBq3OG2zsDK5uizXZxjmHot/6crsf8OUpHXYrgQ2QmC7dwMIIHrMad2
	OdgmWUOaIydZnQrFfN81XhomgG54Md07M+YLUCczn5tVELYQtp9D5Csrpfgp2BPvldRRKzr4Mow
	tJ7MDe42qrSlLAbTc0VNSKXPaszlqqKxjxR8uoB3GasLRAS1HeylYg40TNOMCQivXQYBEO9ZRk2
	emgQIVntcpE8qnz3f5ocYYSRmOWhXMWO9cVG90+oeTfns+IWcHuN0ifRdes8G7nQKKsFVYELnvI
	7Tgo66cdGKTvGvtK4aSlEgBMJyRAEtyD+sEhsbSek4LHllPiTQN3qNohCFVzaHYm3XZ1ZyI0858
	TctgbdQ8Y/46r+aoGtAOSGJyPucxfgBMA7fzodqTFOHlyKQHEEHVTZBfykO7+uGWbpmCH8a+hIw
	KBi2E5hwpPg9Lg5Pq6KHQDUTOceJWEAOhLbCoaxorL6cZhBr1Qj+IWf5ujfpsBjTnYrFLCU4sQ0
	dKTZSHjy0lDyqlhUWukTan0ni15OQoXiuaIK4lgtidnoWWewdlzourAia9JFKWEXlIGPvWAPORb
	p
X-Received: by 2002:a05:600c:8905:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb55a57c66mr151263305e9.8.1794835637587;
        Mon, 16 Nov 2026 05:27:17 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm40370240f8f.7.2026.11.16.05.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:27:17 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/4] drm/panel: simple: Keep the enable GPIO as left by the bootloader
Date: Mon, 16 Nov 2026 15:27:07 +0100
Message-Id: <20261116142707.1299360-5-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116142707.1299360-1-maximpedraza@gmail.com>
References: <20261116142707.1299360-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The enable GPIO is requested as output low at probe, which turns the
panel off and blanks a splash screen the bootloader left on it, even
when the display state is read out and kept.

Request it with GPIOD_ASIS instead, and set it as output when the panel
is powered up, since it may still be an input if the bootloader didn't
touch it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a944c34642dc..9d2aa4d16f97 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -341,7 +341,7 @@ static int panel_simple_resume(struct device *dev)
 		return err;
 	}
 
-	gpiod_set_value_cansleep(p->enable_gpio, 1);
+	gpiod_direction_output(p->enable_gpio, 1);
 
 	if (p->desc->delay.prepare)
 		msleep(p->desc->delay.prepare);
@@ -688,7 +688,7 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 		return ERR_CAST(panel->supply);
 
 	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
-						     GPIOD_OUT_LOW);
+						     GPIOD_ASIS);
 	if (IS_ERR(panel->enable_gpio))
 		return dev_err_cast_probe(dev, panel->enable_gpio,
 					  "failed to request GPIO\n");
-- 
2.39.5

