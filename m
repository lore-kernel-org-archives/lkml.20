Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE10396D13
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856795; cv=none; b=c3dJ3y0BmfuvGr1wkHCPBbWF9YgU0na5rH29oIP39K4Rx7nJO2xI0bB3RndAlqlW8Bbo1mT7Cf/4Hij8yeZMC6W+HHHPiz8cR+7D6/KMJThRnr8bug8AKUbe4/IStkso65UHr83n3uZa37AQk29H+E6oHzHTmKvpZx5v0wTii5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856795; c=relaxed/simple;
	bh=T1GmWOtBmVov9KDW6oK6eMhl6C3eIUI16bTC/bmkQ6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPnMlHh/A4ImmjRTF7UPT78aXyY7GOOGdoKOwTdQ+4FrOeyO1ZDTs6LG68OnFr/ARpxqJVszyFu0jfEnZm7q5M0rCXmr5hFu/mcm14RpRXvNbxxciy4uqkiCx8a+5iPCm4GZTXPlgStZgO3to6ZLh1pjSvW5lJNrll1MXX7W4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqr+9BDs; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqr+9BDs"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d20963so1207907b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856792; x=1790461592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XdLW6/h6dqj2ofldOtryaRDZTEFxtubsYMu+/kbzlA=;
        b=bqr+9BDszlPVekou9cuvrtoXo0fcvFSE+osbCmxtnF1/pma8SnuMnKzTSTVevA7y2y
         8r4ZxxodGNEufBkclxZcX0iyTc9us+bfKLiT5dQOgHG0gG9Fy+eAp056glkl8gw6yosp
         gaaPfjoKzMKWwFRCsuHIXypszmFMZXJKoc/bC9uXfG521a6lwftU0lMkxuFS6IExpJL3
         FLmJ54VzaRbSoHA44pROrS7MTi8ecd2FH+v0xzHiltZdN4z5Wc3Uf/EGMCBgZq4wtGLQ
         H4Jrzj75AgwpvvmUUBPCUSqNtlB5jEu11Wxi6Ce3qoled42RAOAPDtQclzpCDQyv0YDk
         e0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856792; x=1790461592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XdLW6/h6dqj2ofldOtryaRDZTEFxtubsYMu+/kbzlA=;
        b=KqPszhhJUdXoPuhBQn+3h5qE8lk27zJlV8sbB9hEgGKLfJxsovSrMFq+iS+2lEj8fz
         oAnE7gwdxM04kBOJTiChDAaiKz3dH/WtnfvRft6b5uj1LG0hUj0x7lRaSrY2B6hoPdKj
         vNWsV9jKjbc4NmXiFQGq0kfqB1Ewbdn3rJiWAE7P9+/tFcC1DrHhsK024Wy4nfVvuv+c
         NzItUEmaVOZOyTwD+8CVWwCb7rkXLG5CX7VRHodao/t6voj/amNHVRyZbV7sJ4zi4zDX
         oc/3xHmISlWE1O9eJqqYmGiUj06GrcElxzd1j+XGY+bQFUceK2IYidhKymf6eosH+nn2
         zU+w==
X-Forwarded-Encrypted: i=1; AKwUvBzefezsPsneH6ZQ0r+glYDNVQC3BnGspM+a6P71+mjnfDqg4t5m1W3dvhBVNEqL1V7YinGgGunUwMYpaVs=@vger.kernel.org
X-Gm-Message-State: AFuF++nQWlCOHj0Hf718OXt3j1yOZWhfBgpHcHQ0pYmdMhRsRa0gLIrY
	tThyNdsz13nNbvX/nIiM2S0S6FxED0qyuQrO6Rup8cK3HctsrlNou4yU
X-Gm-Gg: AYBFou0JgHCozZm7GufojcMcOXlmYGIJe9nn3kF4SQn9w7PW8EjpLkJrWkd/V77dTKt
	ZgwuTW62dg/heT75i24woGKcEFyyEaHlc7ufLrohtyIWzb134dqSDSeE9BLemwzKgIlDHc5pBB6
	c72WbuJN9iGNyk5T873/9XdeYn9zX/yrKZKG/hDi7P8oB24M8rrxrPYTJe0yuYiPpLqMEZMbVXm
	RJvoYBy6mEBJGfL8k20Andyp3GvthOHeV1xYZfymdC90oz7qbGs7TLH8/2uRordAlb/mMBoNRWz
	u7SZ1dB9U2FZZttZKaoX5YLErr5uHyZJHUcMozbkF8TA2z3xH+DLdcwKDxdImPvhMEs73ZDl9W0
	miLpJb4bSuSi6VP5sZuFzZuJ0GQEf866AmRTt+on6LaNyBFJjHsurnBjjfxoM8bWJv4qnKcwJ2T
	o8nheYimAR7/aRcurf8bi2T+frpemBRMdICeXkW5ZYBwX0EWEGkjx9i7RyNb7sVROcYAgQuKhh/
	MEuzeBSOSYJ1WeTU4JdKkQ6GIkPB3Mn5fLaxjlYVAvQfmN0pqSDJvNOL4peHyB0PWE8+quolFyV
	4Ykbce3ZzQ==
X-Received: by 2002:a05:6a00:c24f:10b0:878:3507:8d6a with SMTP id d2e1a72fcca58-87835078e60mr1766414b3a.49.1789856792547;
        Sat, 19 Sep 2026 15:26:32 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aefc0a6sm1360519a12.28.2026.09.19.15.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:32 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: marcus.folkesson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sitronix: st7571: fix hwbuf heap buffer overflow from unaligned nlines
Date: Sat, 19 Sep 2026 22:26:31 +0000
Message-ID: <20260919222631.3798442-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In st7571_fb_blit_rect() (drivers/gpu/drm/sitronix/st7571.c), align y1
down and y2 up to multiples of 8 rows before computing nlines so the
byte count written into st7571->hwbuf matches the allocated page-aligned
buffer capacity and cannot overflow st7571->hwbuf.

Fixes: b362de167daf ("drm/sitronix/st7571: split up the driver into a common and an i2c part")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/sitronix/st7571.c b/drivers/gpu/drm/sitronix/st7571.c
index 20954c33eca9..e1e95b360255 100644
--- a/drivers/gpu/drm/sitronix/st7571.c
+++ b/drivers/gpu/drm/sitronix/st7571.c
@@ -827,7 +827,8 @@ struct st7571_device *st7571_probe(struct device *dev,
 	st7571->regmap = regmap;
 
 	st7571->hwbuf = devm_kzalloc(st7571->dev,
-				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
+				     (round_up(st7571->nlines, 8) *
+				      st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
 	if (!st7571->hwbuf)
 		return ERR_PTR(-ENOMEM);
