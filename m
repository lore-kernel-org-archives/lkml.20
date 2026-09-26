Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF66380FD8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440303; cv=none; b=WHn7iae0htzaBO901KFuaBalZaZGoOp7GDLBZ/BJs/VMdZQD8lwuxtCu7Dn2eb13ucIhCu8ZX5C/k78YT2WlvotUWhL8MnnMTN7B9dEhe/+pZYcWo+V5oFMsDWVjcqQ1re1o3tES5F0IM4V+/SBdM3H+xvyFXUo2nvD2IWnXddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440303; c=relaxed/simple;
	bh=H3GXqyRWZmWKxgrex0TsuXWBaW3oWmtAgSFU2n4N7wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIw5JXHQ3SNuD2+3Glxol8BSBGzrsSONFgcyR9w+PhvDTxrUlCerOsKyifVKUcS+A036v864JveLOv2S3EFDCroxic+E2k63jgGF6/W8pWC3ChCfrVHl8jaueJ6oKuZ35FlMJxuy4rKjllnGTIin3FOdMO3kS87hKH3guPP4ECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qp7/6S8u; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qp7/6S8u"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104e54b1abso23482066d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440296; x=1791045096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSWaUNt8N3BGw3JWkfdkKuhOhB5GPof0nwVAxfKx8+0=;
        b=qp7/6S8uAdkD6RmSE431P/oqvxIr8gh1366RlyBcG9SCkafUu1S8Gl/voD27NORtsF
         tT5rEYWcEt02/sl0FLEpLaTn/2UCGPg/NW/hZQ1qm8MSM2oI+0AuMMk+FOQKnxAA18K4
         oLbNez/xFoHbbQcTvUM0+Lh9TuaRrTZtBK6+wmw22savvr0H1dw4xp9V6VddwZKev4fw
         OLeBhZhY8jJhox6pRCezTTDn3uSc9wpZ2Zt2zIxULDnF95vGzfvWOu9GyNJllVuCKP5w
         b2VpgLTp9rpuaadgLCGo1CL1r7h0PnB111aVJ6H5k+DOTt5E//AkLRsvnCnfvLNTxArt
         dClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440297; x=1791045097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MSWaUNt8N3BGw3JWkfdkKuhOhB5GPof0nwVAxfKx8+0=;
        b=dY456z8ARpTMOnuchiTBwu9QXHcHFP3eGLXVx7/t+dSNwiEHvtwvZ/KlSBEER7xxHg
         HfLQLuwb6OwSyCpIe9Vx77O6AD/yzaLv+4x9CmNm6USPPP7taZvlg2mOh9Y/Rgj0YxJt
         aDY+n+uIwIBBCC++Q2rXlYpHy5qk6kkaxvhfq3wo9ujr8PZ6leUnt9bUr7R2opgxP8mP
         4cNQHTnJn/HhEtmyNFJWSMTFgTH/pTRuIRFccFKY9TD5GCXa4lHI2fLBgPv32SFXlLz4
         QHN5mOwROK3YBbyclhSHOHOF2HcoU0LOob00iBmTHxJmkTHMYgJThuTAZbl+c/r8qDS4
         ZoLg==
X-Forwarded-Encrypted: i=1; AKwUvByboX1IsqwtCR1WB398SrP2LGii+iJ9eSMC/ZbcE21BJtjT9hpw+eFqYra0JN64Jh6wqZjdrz/xQ4NEV9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mML+1VgFgXvckZ4YIZw7UVNOb5FIW9WsGPk54Wnli+tpPAOkGl
	wyjnGW0U49BMNleS8imJZGBmQJbDeiD8jN/mdDDfJ2OmMsXYf5jylQ92
X-Gm-Gg: AYBFou1lh+aLb3ueiSU76aNsTwnSQeD6zz3ztllkn9FxQs+1vBW0iGgWoIB7iOQb5aE
	BDIbhZvoOkzSRvhHESdsef1eJTSbQtnpjoA/syWCjwYEyJ/oD36CqvntOvKHIEHEGpn8TJ/9Z5S
	MSZnaNis8fArKv5dG0KobaLZB8xy2/ZP/yfKr+Jm6mgBUbbGRpGBYB20Md16DGGEQOpK8OQevY1
	8UwcuHSIVQgpF3p6x//wopsJhB2ZP1NNmJo/q80U1rg+eCXFW7BcX3E1lqU23mPD0+5pKDWR8mt
	XGAL1DkbIDSBEv17kwxyDFHtkmfvHqvXhg2lcB8c5og2tMqxMbX7nybzowLh5WRUKrUGlgJM5jS
	Lu1UZ9RiPogiwoU7KWPAxN4GCowIVJzpWAEcrfPQyxxT8mSGTSnhDQr8Nb1A9nhQmJ8sEfIYVc7
	WSucfgxk7iNEwNZaFx0iw5VHliLSSS4GyjsvuM+luPipJM3MgkYOYoQmkV9ji1l+N+YYAWjjB9P
	quHCfy1n4ujJmamaQ4ydiRlbEQrReQWJi/nwgZkj8Z1PLyI4z85YzSJbA92EqEfMGE=
X-Received: by 2002:a05:620a:469e:b0:93c:62a9:d5cf with SMTP id af79cd13be357-93c62a9d67bmr260766085a.56.1790440296574;
        Sat, 26 Sep 2026 09:31:36 -0700 (PDT)
Received: from localhost.localdomain ([2600:4040:29f7:9600:f571:6178:b590:34a4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c4fe09037sm341332385a.27.2026.09.26.09.31.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 09:31:35 -0700 (PDT)
From: Dillon Amburgey <dillona@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Dillon Amburgey <dillona@gmail.com>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	christian.koenig@amd.com,
	krisman@collabora.co.uk,
	noralf@tronnes.org
Subject: [PATCH v3 3/5] drm/qxl: clear the monitor configuration for disabled head zero
Date: Sat, 26 Sep 2026 12:31:21 -0400
Message-ID: <20260926163123.39217-4-dillona@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260926163123.39217-1-dillona@gmail.com>
References: <20260926163123.39217-1-dillona@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disabling head zero leaves its previous monitor entry intact because
the inactive-head path only clears heads with a nonzero index. With
another head still active, QXL continues publishing the disabled head
as a visible monitor.

Clear head zero using the same path as the other disabled heads.

Fixes: a6d3c4d79822 ("qxl: hook monitors_config updates into crtc, not encoder.")
Assisted-by: LLM sparse
Signed-off-by: Dillon Amburgey <dillona@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 51087cacff74..05de8dd3144d 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -350,16 +350,13 @@ static void qxl_crtc_update_monitors_config(struct drm_crtc *crtc,
 			qdev->monitors_config->count = i + 1;
 		if (qdev->primary_bo == qdev->dumb_shadow_bo)
 			head.x += qdev->dumb_heads[i].x;
-	} else if (i > 0) {
+	} else {
 		head.width = 0;
 		head.height = 0;
 		head.x = 0;
 		head.y = 0;
 		if (qdev->monitors_config->count == i + 1)
 			qdev->monitors_config->count = i;
-	} else {
-		DRM_DEBUG_KMS("inactive head 0, skip (%s)\n", reason);
-		return;
 	}
 
 	if (head.width  == qdev->monitors_config->heads[i].width  &&
