Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068C775809
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088530; cv=none; b=Y+EhXW/oy8faWWlxLMKCwmf+6Ly4CfAYKDHa1o6+C/2cgzTT0Ix4bhB3DtdVPejk+kdLluWE2OOwADVcKEBpFrNlRcZHs8ziE0e8LP1PqHCx9Zr8iuSatcJtYg1ziXBOsVEjOxvhgjSQ3Ly7yleqR/BMuAiPy0Oz85shAtZfjic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088530; c=relaxed/simple;
	bh=h+o53Qix8aeQAnKvz263ljg3eLfqKPW/DCEjzSXhGOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qrb4s7Icf2we+R2uFKmtrRoQ3wxfRu8VJPQC6FX98qNnWkcFtUrsnkNvTaoMYA8SpuMl382zCCHdUVORrBlcQJKIMLQyCnbH8TLmUTueSK2peitIeXkiOiE5AinhVeSEmBmf9//xorXYUEIN3opB5EAmxx9Iu0HATGCqPY9Zvuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEMw1Q6p; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEMw1Q6p"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2555388b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088525; x=1788693325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWrbQWo0Y4gcocP0rLe2FWzofX/15YoGTuys2b43cOo=;
        b=JEMw1Q6p+MKzUazxmZbIP2L9erRa4o22nFy1JD9o+QlDc7nlWAqhxOSqEggjlWKE0w
         vwmLM11V3GgOaBINIENG28Ig/u8oPpp8zNePXc3eAsc5mFHKd1FSsdBsK5tJgAwseQDy
         wyD5Sm71sODN5uV6otAxJDz0lFPYBoarTxtZ+dZTBv8TrKctMailx/zCL8dH9eTsKjJ+
         bubLNhgIL6cCOTDydv3/Ay8qIx5A7WhY5AoRU80DT43FH5+wyiUr+vPNTwyfw2FiqQSt
         dDbYavJCGDHDIhOPy0UOjPGvsHUeSwBv3R7Fgfj5k9u8uKU+WcNTRJ+vBqeB+EgKoUer
         U3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088525; x=1788693325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWrbQWo0Y4gcocP0rLe2FWzofX/15YoGTuys2b43cOo=;
        b=oGecSQdFVZ+xJI+SNstVQvPriaqOkg9zgeTbvRBMm9USezjNFoS31PGK6oSspLnPww
         9g26GaRA2S/7QREZ1WwFvtMzfw2K0SoKOSJkiNYnL+gOUgrbkUZiZQt623PX9kBo5cjn
         /vUawD+6FcW2lKdRh9aFPCkMFLZwh5G4eHchNb0yss6tKMqTJqbWN8halFXPbjmHWt/u
         0GNao82jWKjJsBrYe6UOtN15fNNAqWHbFdHfopWGbNRdBo4ahQe/dUnK00k0jwSqa2XD
         UpFksfcPWssr8BGtFVycFu6ITRa0+Xk4E4cEBKRNS+3jnGR04EXn5F1J5ZN67Tm6Q8HM
         y0tQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoCQwkEy5RyPIWVtIjcJNs3LRmkeuLqQ3lmllf5sAGUhrNqfg8RyLkrNvYCWGVjtYCCQWsycptTmyvhkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nrOyg3mChaZ2IUI56fLNRP3Lyu5pE0zuOx8WmrJSa4dTHI4oTn
	Urjp36jnPCl80CCBTsoN1U+RU8z+ZrejJvwMQO1hGeTQxT0UmLeTqUwk
X-Gm-Gg: AR+sD12k+xBFSwJ9tQQ13wm8c5YOk3RK1x4L+c04JviVQXfPBSFnd6BDtG6BQ8jC/fO
	hwV778Py/QFdk4/XVJEsKney39GuK6BOJF4H171uLtdznkXbSwpW9YiGb9kY7m3GoB3td1WVMya
	txnApAkUQy1atB8kv9OsU3Du5tZuFCyXpwi+t5tJ+54nd0ShJ8YUClL76bnlJAf6Y/tcQmPSv5M
	kwGktceC/K0oaaIHx8iMu65lRKYuSj4786wzaOQH/6xH53QwO9yAIjzjQghOdJfyUa558Yq2V2w
	WQ39mDBwt04TUFgknoWPPofhl/s2VdsLZ4m1HURSvvAN1+JGZcWQaZuG94J7+rshBQ0dSS31zeg
	UdpjRIwdQ1M9k3UxhvY4sPqU1yrG75OQFWLPMAGu2lz0T+PNs0XM+7wVg2csMbvfjIEyXHK2Asj
	8kvPxG3RE2s4Xh/PidBffxzmkNz+urA/jiFk6RWoF4Ysqez72T1U55yCZKxoI+BAL2lzUdygzDh
	9HlSWSWiEpDTZ8CEEURSQgmPQWnIEv9vkdbdPRolV0vnvlh5Gg=
X-Received: by 2002:a05:6300:4049:b0:3d3:afeb:880 with SMTP id adf61e73a8af0-3d3afeb091emr18094821637.28.1788088525106;
        Sun, 30 Aug 2026 04:15:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:09 -0700
Subject: [PATCH 5/6] platform/x86: x86-android-tablets: drop redundant
 swnode group on YT3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-5-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The WM5102 codec software node lenovo_yt3_wm5102 is assigned to the
board info swnode pointer in lenovo_yt3_spi_devs. When spi_new_device()
instantiates the SPI device, device_add_software_node() automatically
registers the software node.

Therefore, explicitly registering lenovo_yt3_swnodes via
software_node_register_node_group() and listing it in .swnode_group is
redundant. Drop the unused node group and registration.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 54068a0f4633..cd8cee1f4aed 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -997,10 +997,6 @@ static const struct software_node lenovo_yt3_wm5102 = {
 	.name = "wm5102",
 };
 
-static const struct software_node *lenovo_yt3_swnodes[] = {
-	&lenovo_yt3_wm5102,
-	NULL
-};
 
 static const struct x86_spi_dev_info lenovo_yt3_spi_devs[] __initconst = {
 	{
@@ -1068,7 +1064,6 @@ const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
 	.spi_dev_info = lenovo_yt3_spi_devs,
 	.spi_dev_count = ARRAY_SIZE(lenovo_yt3_spi_devs),
-	.swnode_group = lenovo_yt3_swnodes,
 	.modules = lenovo_yt3_modules,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yt3_init,

-- 
2.55.0.897.gb25b4bd76c-goog

