Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D0534A78F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791701241; cv=none; b=WZwyrTsohIvCoRWCPX/CnrfZnqBoIoduDgaqEWlG1WoC+rCTyYm8xCxzMfTH2n3ICsRsg+Ywo3tlLCludhzzOywAJse2TXb2MlpOsRZh9oI2dzetSPP6HjFXMoJ1dfT29gTOwc9uAr+dGeZgr7bbct660NW+5HZL6e7n+jVnqQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791701241; c=relaxed/simple;
	bh=b9lFKuABg9FRexBM2bdC5Db/THMVYRfwn/iTTWMKBzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFWTjXgS56VR6KpADxtsJd16SJeUJCgUIR5VHFJRDlBFuz0XjgnnJmyDGeK/f9gfjME7Vc3vB48yM+JmYk1vOUHdSAxyzMBXh1ODQNM5atYTn+1G61Nc0ZUTtETQCtkdGm5iZrt1u/MJu2ruoGLKcY3FxJ6ST+QUbKD05YyqX24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCUCybgq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCUCybgq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so8000025e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791701238; x=1792306038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXG/OHOueFMbmPjMgjHa4I8+bxiyo5Fb5MP2BTqljM=;
        b=YCUCybgqfvGWo5fdOk/GXL7n6BMnpMWOay7xmdN4PY1jn5cO+JwBTuThIYY3dUCw4N
         UbWrzmsT2BT/53FkBiDNHj/qe0BAGXxJzeOy6AylD1u4PBBWsAe496FdYnljbnqG/SMh
         TOrVvTmSZe2icdCnKjtxUzsuqRnl9ujwPyGDxTUiFshNlta25KXLSvz9SUrztw2X4dOB
         VyJF0zHLbHh5avJO9fQpg0/hWGN7H2ejfy2y8x7UANe5kPM46xlyhGj9xzn86j9gVByE
         FPgxIKp/BgLZmmA3F+X3EtdUXWzuOt9FKo6kqfgXMMyPkxCOyfjkWyoJ9xN61dIfbngg
         TQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791701238; x=1792306038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXG/OHOueFMbmPjMgjHa4I8+bxiyo5Fb5MP2BTqljM=;
        b=AOiBdqeQkyRYiy97dE2514m4LVB4nf4JSE7z/Owxsjl0r6b8lfoZWk/SJWYBySiF4t
         MXI4ZxbBanCjaBddarrt3oN5+riJs1qXrD0HOGjVJfm/vyLqFRQUovr7F5QIkbJc7E9E
         bDUmbgjZ1Vv/tFe0Na97VkbBVzYJGCpMzz5e3uap8LmF1UfQjJ/1dn16vnWwE/vZjr4y
         frRIN8q3IkUfpvoESR6SYS3FFdb+PMsrhxg0A4JL/3EbKlHblsz/uM+Ri50i79IKUp4H
         BDFEgECfIwqGbu7f4Ew+hZj81lSb/EIMe7UD5fOozlPfFLaiH4oATlkOBLlD00HHXpv9
         q5AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxxL6HkKrsWy4zZ757AhXO3BUfRZdUF0l6U1IPM3IoToT94Q6EZ8ss3OyOK4kHAHetzSVSYN12Dco0xOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQtBjEKA+j2ZOgEnTRI4lwWWRabDQow3PufTQqvvxSRbvKomDE
	vMotIugzk3TCHd7zSdkDXzKi9RT5KKMbYowi2/+PAtQQAUZEfSi8H7yUk66yLyRuxyA=
X-Gm-Gg: AYBFou1ZorAkT7QIlX/7dlvxQebx0COUM9sLR1ZJylFofU0pm4zQLjEtUeXqjx7DMto
	jg1dqXm03Jsc3FVSYlyY4YkVylQHngeTeX8lysn2LhtZSjexAEXGEl70RKxbRg5cmvbLSJFqcoM
	EtBX/uG1+9O1TCbKejrHTGXB4OB2jlJQ7nSnbFmfb20/p4vbOxPnhlJktJ3m0sbGDYiHumiuXi6
	+stONRgiJj505jKbB9ADHFm40p3uxOGVndoycbBTXrj8Lho8N9Ff6SGQF2HuCORRyaXAyS20aVF
	wg1wNbdtTiBc2NmLw/guzRrx2oZfxZR05FWEIcKZjJj32BshgsptyvVm0HlkTwprx2sAjXRDjOL
	h/poIUIXNiKksSM2/dikdzcS6UDij9T5QMIqZwSgSAK7fagJWpbwZoeQC3r34XeOIr5DRgLRUAD
	9amSwGtXtQv8d0LM6Z8r9luJPUttcui9sf3EwCBxk5ujEgJZ2kkd9JMLxbWlDfesbpzJBn4/gS3
	DppomdzvP8v46crY0mtfB7MDxZ/VXlV+D0=
X-Received: by 2002:a05:600c:1c15:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a18e4d67e2mr131695315e9.30.1791701238379;
        Sat, 10 Oct 2026 23:47:18 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:e952:dc8f:95c1:823c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm194319945e9.12.2026.10.10.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:47:17 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/aspeed: Propagate DAC mux register update errors
Date: Sun, 11 Oct 2026 09:47:14 +0300
Message-ID: <20261011064715.2422596-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dac_mux_store() currently returns 0 when regmap_update_bits()
fails, implying a zero-length write instead of the actual error.

Return the negative error code itself for observability. No obvious
reason that this return should be clobbered to zero.

Fixes: 696029eb36c0 ("drm/aspeed: Add sysfs for output settings")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index c8746766f258..a933ad358852 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -268,7 +268,7 @@ static ssize_t dac_mux_store(struct device *dev, struct device_attribute *attr,
 
 	rc = regmap_update_bits(priv->scu, priv->dac_reg, 0x30000, val << 16);
 	if (rc < 0)
-		return 0;
+		return rc;
 
 	return count;
 }
-- 
2.43.0

