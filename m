Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E09282F0E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780872; cv=none; b=riWXKVgrKbHhi73EFTm8XAkvB5E0gSD0gb9cKrWAkrorP5YPNavCgBTAp/vs5fyYpyH9Tqsfkqz7jLmqScth3hXayyNfFhVMI/FodHA2JdGnbcFrUO7O+dGdykLR0WqSsg50be7b9MV090QEIjuW6TpfnNB/t1aCn+0GrxSqdNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780872; c=relaxed/simple;
	bh=+nF2Flw5JkUxcncitmamYA0eDBgoA3lGYri8sEbd1Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nb4/VYS0GtlSat2cSu/V2qHucGf5rfTKAOvyx3ae/65PG6rWmXiQ1AYitOz26WVXzxfqQJW+3Xn7qe+rFRJQVqWWEBF6N4A2Ia7YnxO9IGCoDMlvDiYXdk50qjjSskLkPLn1Ogfy9ElOoMhIek9uL/QZNentdDobuxcw5rLA6xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QElL+MH4; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QElL+MH4"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917997ab0d9so21613856d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780870; x=1792385670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PuHBSXV7yW2x9o5OulJKxyEwHsRVBDck1C3zxeqGePA=;
        b=QElL+MH4HN7OxMYWzK6rXvxNfM7NbEFBg2pigKGyc6USIRdQ1w3iO/ePxd4m01zz+B
         RBuK2zQIiHNZjSxvS21f4CBPUOH3tVwIC1zh+A8sp/9Bt4Rjg+MqDrMw70q/PhjCtAfD
         J9thZGJyjIeQGYBGV8sSls/iSvJKcrRUbgCKuHC7C7x5ru7wxub25QaZq9WhF8rzUlEW
         A7O7Me2XdPstx7+CMac+LR82jfO8daFXVd04Z/qhZcyLwVeyyyySpFaTN33XRPPHM5X9
         BdQ9WxM4pr6lD0yIVfNqtxhO8qxeAanGQmFrduDI0YVhjlhBtJPmpBEJNqBDmMj8564F
         2nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780870; x=1792385670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuHBSXV7yW2x9o5OulJKxyEwHsRVBDck1C3zxeqGePA=;
        b=EsgvFzyHMiTCgkXS2Q7TALtVdXh2h5CsrBc7kptW2C2ucigrXveHnvrUt619V+CuZ/
         HZpSsbvj/C5uGJOofSoPvauzOF1NCK1riQh0KHt46lIQ8WQ4l8oDUvQupe/hxicXg14m
         6ntbZCVuNp40+2fESyOaNHpJuZa1jk+OMj1O5MyT6cQbeWN08S6rg1i967Gs9Wc6MYBc
         v0M4E1gTTASeR1yNszI2RaRK6CH/i7lwtS8sqXXVLJI/rjcgP/Myu6kvwrLV0DvcipHC
         JI6UJojXpY0JF6LoQ3CmwLY6PCYTe47q49/KRZ6FMIFFIEWSFjXJwtkIDm3dJlPbZMYn
         8fAg==
X-Forwarded-Encrypted: i=1; AKwUvBwmGCZx2E0/b3DluNU0n661EQsHSMu3XXuFSqKBhPReJq+muVyYZnKvZzE6Rw1MxrpOR8ZqdEMeoyqlmW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrxV2zdP3SAtwXdAjywrNfn2hPyQnUUL+F+TEZq285wbOtbHQR
	Q0nzGrcYK2POTNSbkVnUJVudBb/9DI68s/yLXKeY1apwdjPw+UHdnAE=
X-Gm-Gg: AYBFou3GF8fk5t5CQODcQ5DmTuTOZt1LgiayEcInWOzgwL1bVqefRGjcYPx401jWu+A
	p96NCd1TGM52u8VXK3I1l/T5uXTGeNoABesWjup6tWMtwTt55H5ozowVoGhtCbl+gqnADxQ+g7y
	M/sfAJAGvUYRv/qskpM9v/kY8eDZsCS6C2zEe9koKE8Fa+ErWX6GZdfXSoerKyV6FhTIEtU+Xwt
	G3G5wLMMGQTbjc4heON+Xpho/Y4OBlXwlWcJZxWuJrVQyAnro8sKr6nhtxs9rUOId0poA8K84o+
	gE/Mb2Hnd7fpU/aJrlRApmVpBB1YbtszUZx9KqksUvLpxn1c9uN5J9fPDVV2Meuw8kt8doOPO+8
	dK1lH+66uTfrXHAMvpI9DRp+YRZQ9nXMpresyt87yOV2nkSs3GyH5hmfIBL3n6Dikq7eHSEIf0i
	jaeDX5oCUM3+CYWZ7P2iLhkR68sTgJJR8my/WpcYBFwd+NppJ6NWj6Ge8zzwlW3+gipnDCgPLNM
	bUzge/ZQYEsIa1oQibzDsPYcMluxhhH2S3YHkLy4f2r8baGcmU6o7cbDFI5urg8/32yqrTomn+K
	OHJhtXDUi3xPNJp/lQVBHxQ+3JT2
X-Received: by 2002:a05:620a:2993:b0:93e:5870:12c5 with SMTP id af79cd13be357-93ebd1ddbc6mr1383552585a.16.1791780870545;
        Sun, 11 Oct 2026 21:54:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c6b4bsm768589785a.34.2026.10.11.21.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:54:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/logicvc: keep the IRQ within the display resource lifetime
Date: Mon, 12 Oct 2026 00:54:23 -0400
Message-ID: <20261012045423.166389-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The managed IRQ is requested before the managed CRTC allocation. Probe
unwind can therefore free the CRTC while the handler remains installed.
Probe errors and remove also disable clocks before devres frees the IRQ.

Request the IRQ after display and vblank initialization. Release it on
registration failure and removal before disabling the clocks. Keep it
installed through atomic shutdown so pending commits can still receive
vblank completion.

This issue was found by static analysis.

Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang, W=1 (x86_64): logicvc_drm.o and
logicvc_crtc.o. No runtime or hardware testing.

 drivers/gpu/drm/logicvc/logicvc_drm.c | 21 +++++++++++++--------
 drivers/gpu/drm/logicvc/logicvc_drm.h |  1 +
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4fc7f51..cf60bbb9800c 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -366,6 +366,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	drm_dev = &logicvc->drm_dev;
 
 	logicvc->regmap = regmap;
+	logicvc->irq = irq;
 	INIT_LIST_HEAD(&logicvc->layers_list);
 
 	caps = logicvc_drm_caps_match(logicvc);
@@ -385,13 +386,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		goto error_reserved_mem;
 	}
 
-	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
-			       dev_name(dev), logicvc);
-	if (ret) {
-		drm_err(drm_dev, "Failed to request IRQ\n");
-		goto error_clocks;
-	}
-
 	ret = logicvc_drm_config_parse(logicvc);
 	if (ret && ret != -ENODEV) {
 		drm_err(drm_dev, "Failed to parse config\n");
@@ -434,16 +428,26 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		goto error_clocks;
 	}
 
+	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
+			       dev_name(dev), logicvc);
+	if (ret) {
+		drm_err(drm_dev, "Failed to request IRQ\n");
+		goto error_mode;
+	}
+
 	ret = drm_dev_register(drm_dev, 0);
 	if (ret) {
 		drm_err(drm_dev, "Failed to register DRM device\n");
-		goto error_mode;
+		goto error_irq;
 	}
 
 	drm_client_setup(drm_dev, NULL);
 
 	return 0;
 
+error_irq:
+	devm_free_irq(dev, irq, logicvc);
+
 error_mode:
 	logicvc_mode_fini(logicvc);
 
@@ -466,6 +470,7 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	drm_dev_unregister(drm_dev);
 	drm_atomic_helper_shutdown(drm_dev);
 
+	devm_free_irq(dev, logicvc->irq, logicvc);
 	logicvc_mode_fini(logicvc);
 
 	logicvc_clocks_unprepare(logicvc);
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.h b/drivers/gpu/drm/logicvc/logicvc_drm.h
index e0f4787c69f9..f69538e6c0e9 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.h
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.h
@@ -53,6 +53,7 @@ struct logicvc_drm {
 	struct drm_device drm_dev;
 	phys_addr_t reserved_mem_base;
 	struct regmap *regmap;
+	int irq;
 
 	struct clk *vclk;
 	struct clk *vclk2;
