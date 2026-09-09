Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08AC4854F6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940960; cv=none; b=P6vTU56yMs8mkLVmiuePbQ5OIHEfiL7Rlcv+/1pnFkn5x4a/W6Cp+lBOJRA+cty9IH5xdK5sJtA114DpiWww8/M/ff1hOj6erIoK3S2YFftVPCV0RJD7R20l9BFhpbKJQeMk0Z41bgBqluH4ZfEJf35CBTlc6UJ9aOgAs9z5fYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940960; c=relaxed/simple;
	bh=G/ASDG0i2X5q+TgHKlyYc/nq90Xa8cr8Xn8YDZT44v8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEAY1ffnZrISkPvAk+CMzNJOYtoBqOPL+ax+ihESYcIjBWnOIdcPZOW36ISzp93YD5H5RY/iHc2h0UUPZyg5RSmGUDWFwygOrsezkQ0oiuuw01jE865EvBhpHNhEcKZhWulSWgsclmLw2IR3rYKvAcsRl7bznxSK8f/8VTlxito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xj7Ik1bY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xj7Ik1bY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so51687005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940957; x=1789545757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLmsPg5ZGyo8iG6ZqNuUKwoiaFmV+CHE+/FRO+5M3oQ=;
        b=Xj7Ik1bYlx+KLavDpkr1zb2vVnIZnDObdog6paWYZtOKgfSANharY/n21+1zkp3hP4
         8yNb/EjFW+d7yI/Ay4P90lRhF7I6UXXb2l64exSJ9mT05lYcuQVOR8gyCSwvNtINfXEh
         mB4WxsQvOdTrePPtP/Dz9xVlTU1mikTLvzLncrZwgbmZ/QFiRVkHexbeF1kyy1vljUUo
         Bsj/2BBoertjVKuyrdA2HZxIwEBg3U82lgt09fGvCwo/FXjDsugCV9Z+CAOoixH68IG1
         psHLpw0GfbIG/dY8SkTCBrK6m9KJ3A52prxvQHGE+G8PXy4huZJPnnH9sin096fcdar2
         /lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940957; x=1789545757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLmsPg5ZGyo8iG6ZqNuUKwoiaFmV+CHE+/FRO+5M3oQ=;
        b=C72OplKWBfVDfmJsJgQoDH+hWPFydsC39OqS2+EBFLgYRoCIAeHoSRkl4mfrG1CtKJ
         LPo7Qi4odbxycCju0lwYm9L5F/izuXEqnfnxXdjwFcjWg5lfKxbD7/E2Y9qM+3VLLjmh
         zT8Bjf3qVkzku1tHGT1kS522e0viMHQwalW8UccbLKhKFyPVDeo4f/qXkL2vua7e3QCd
         SZ68mAOxnUYYc9/i0gV/f0m/Gw/pgooQSwffLdrwIoDbFZz4SLV9rNXarjA/3ndFS5hC
         ZsDFSlLOYc22MmcneIGCBEuG5uIzls2kcrKVkvvZGe2zYNYO9r+00xVJf00bhkH9L4Rv
         vt9A==
X-Forwarded-Encrypted: i=1; AKwUvBzuiTEap6QlvgxiLFkSzqzPWydwEl41x9y4i8JNy0J444VtZ4Oaa2sq9XHuuxXxVCs14Egz2zepAE4ZJNY=@vger.kernel.org
X-Gm-Message-State: AFuF++mDgTpB96ojnJ8JTHGWoHIbeAYKZjExco42gxoP1R9srIeL8sJh
	upLfw5it54Ez+9LRR2Ef1ZvAznRXiYCHvsf7MnKxLR8+cuHxTH/BB/tn
X-Gm-Gg: AYBFou28sFNIxViVs6K58t0x6d/lpNGB8MMYB6RsBjE4WKM/4doL2xtD/2ScYJ5w9OS
	OQhKp9wCgUhQN3yAW5m98lUFhAqhkzWkUCHWmfQcWBr5Ctxfjldk6rdXm6fAyfSjKbYRK+iv2E6
	0/7/+VPH3NotJVIiJJ7XyDY2m5GgMwYiQcanrbX5IPNz3BxWcTaBOPWl6TDzm2wCmKatlWy95EB
	C419ehZz10RmzYryXNnr/6Z60TeiWLUV0Zpxa1adBmU12/d9KVCcAXb7ZuKb/E4jaoAqQHixN4b
	fOuVm7yzcGzOagDdpnjdHiEqvmmwSUlxwjB23xP3IzeP8z2iF/BZx/556yESdbM5hhOReS3KV9Z
	XPdPD3y2h4p6c61K0TgXAKQijVzGx7ek9XmELFeONbM9lbLcjjSlfL32soXIVn4+WQ2KtaI7VrA
	nQ1J7WpKdIaBH/qCP4an78oqdm3Q6DHhXTjrOrJ9Ao14e0DQqvukJStlOv89Yafrdg4j29OnorL
	kNOO5zV66GcOa9LmdPW8EF1loTr7F8=
X-Received: by 2002:a05:600c:1986:b0:49c:fa21:e744 with SMTP id 5b1f17b1804b1-49cfa21e906mr280628395e9.26.1788940956976;
        Wed, 09 Sep 2026 01:02:36 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:36 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] media: i2c: Add missing v4l2_subdev_cleanup() calls
Date: Wed,  9 Sep 2026 11:02:22 +0300
Message-ID: <cover.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_subdev_init_finalize() allocates the subdev active state and only
v4l2_subdev_cleanup() frees it. These five drivers never call it, so they
leak the state on every unbind.

Separate patches because the Fixes tags span 2022 to 2023 and go to
different stable trees. The st-mipid02 one dates from the active state
conversion, not from the original driver.

Aleksandr Chubuchnyi (5):
  media: i2c: imx296: Add missing v4l2_subdev_cleanup() call
  media: i2c: imx415: Add missing v4l2_subdev_cleanup() call
  media: i2c: mt9m114: Add missing v4l2_subdev_cleanup() calls
  media: i2c: ov8858: Add missing v4l2_subdev_cleanup() call
  media: i2c: st-mipid02: Add missing v4l2_subdev_cleanup() call

 drivers/media/i2c/imx296.c     | 1 +
 drivers/media/i2c/imx415.c     | 1 +
 drivers/media/i2c/mt9m114.c    | 2 ++
 drivers/media/i2c/ov8858.c     | 2 ++
 drivers/media/i2c/st-mipid02.c | 2 ++
 5 files changed, 8 insertions(+)

-- 
2.43.0

