Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8654718EF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206933; cv=none; b=IE3YUFAyQr4IkXbVbZ836YEVjVekDhATNsgosILcXtp1398jQtJGkfZlGL7Lmzz2zTgyZdGd3WdtTcuEToh86ZMmJ9utjFBUqLzHiXnU1MiurnPZy9iopyAHhb/nxTh4VgETYa5zywBW6mFpuWfJdApwmJuXpWHgrqztwXswmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206933; c=relaxed/simple;
	bh=pYjeim6rkRmaxSpwPitBNprXWpSBnwzEpUPN7fveHIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2C6DsG6mUE2DS/+c9QbNsXnUjJtIiLrTWNze2u5eWQLMq47BkmpEywtd2SvAAHh+LzIc9Yr1Gqvcj67RtalaC4Eb3DSDRVVc4tpZ13ApCReybEFxZ/TZ+bndvfCmU52cJCaZMMPXwUI+inO9fMkNob1CeeG2Pt92klobnM7LVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4hM865a; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4hM865a"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so1574218c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206927; x=1790811727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrUy8lEwXCvnZORNFDyE8boY4XaJRyADxOjRdBxHQ6Q=;
        b=J4hM865aVfy3DxSvThXVmoTUP9BSh84SLYtYPV/Imv71Ch+wtVeyeMpZE8tqKgsuhv
         rZD3JsV8nKormNgIbPO18UGJfYm1LzwgYrD80QkxMpuvmJWI4eq3gWjr/MVoMiJjLD2n
         WnC12Aso5dzMCuG6zKYWNJFzKR0CCKEcXDcPt/lZsUlt++HpRWDQwhlX4esFqdLEZ4Nl
         4czuu5XPkoCtxpAQXyd40mcO4hNT8FZ7lBKoMS6EiDrjGWagazlG/YmNCXOO4kISs3TK
         JJ0BPzHxPAnmL92CtalPA/+Mwt+MN93sn6Shsz96U8rDqz2GU6M9KH8mg4+bvnfRslsr
         wzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206927; x=1790811727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrUy8lEwXCvnZORNFDyE8boY4XaJRyADxOjRdBxHQ6Q=;
        b=FJfTfgnlu3fY2lijTeZV4vdq7nL/oqVgBXkuzdzRUU9r11El0tthTJZc2T62k1zfyU
         moH40pkrRL67FZffyzIJwJnKzyTR0Ve3nY52557wwgyjK0uy/HOBTBxuqF781ApRTLC+
         oYMmS+e9xQrT29GBMfmlDxDDU5liyCoSY7GWww+cD4BU22AQlqYpPnlgJfOtCIkfIXPJ
         e81lcO5AnT90ElOSIDeEjyhHqZrN24RoB44Gc9XNqgiYKCuBtREe0ZYtagiLDclO6V+Q
         +gMjHooWA82/CEBJfPlnNdJ3Y4aDwQ8DVM6Ldmckhwaa/kwhlEtpqhxKmrGYn2u+xKIo
         uvqA==
X-Forwarded-Encrypted: i=1; AKwUvBz8BiuvpRMlUNYCzxkhNFxS36zWjsSekuvqEhjgjWyopLPf5T+KyffuzoP9BMlKZpW6kTkWqpmiTCzgBMY=@vger.kernel.org
X-Gm-Message-State: AFuF++nHV3VxnABIsh1m4fBvTYrOfIN1kMjoESrg6fWiwz5J5bwquj2d
	9O2T2oBiQCcIgmpmgzXCx6lYdtsJM59Bk2mEJRnvJTyeVixABhawWDoV
X-Gm-Gg: AYBFou0xlXFAmBLEhPjV0Fv7EaxnJR5UoTUTULd6br/q4Qlqy7EtGpweIc7zLujf8Jj
	ansC2XLeuyZ147TH9/S5FT5NeU9bzwNY4eeMv2EMKa0audjAKvzO9EVZXpVEnCTLW14OZwR3D7G
	Raj21FPCCS9VikpY1O/KPleAKtdIt+Id96hKU1oauZvoKrueq97r5+g9v76MpIUbRKLBG9Ke5HN
	kAxbrTELhIuCTcx23wuqdC1NEsUwbKeg3OpCEiEZISHO4qy+uYDuFzVGIWzZBVvziRLQ+cMivCo
	6YUscuu4Db1AOhR6cB6xRreVDoz3cXljTJyveo2kLp+NfYJlqBvnquSitObFaGX9zynLwzU5iFz
	GVrTPPYKkKEmLX5RBAd8BjMVzr4T5HUlK+mntDVwPPNw9N6JiRDENvzOirY2Fe1iJKf9Ma1KI3k
	37IavklHFYXG5ZysyTZTe0Mk4ka5G8I5NRdwFyZuL40wxZ8Oiu8Nc7nri6C/j8JJGeeB+D7L3AM
	uMP80vPOsRysKeUj25pGteMOcWxbb4qi/Gt
X-Received: by 2002:a05:7022:b058:20b0:130:7246:10aa with SMTP id a92af1059eb24-1450404d324mr444369c88.12.1790206927261;
        Wed, 23 Sep 2026 16:42:07 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:07 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v3 4/5] media: ipu-bridge: Add the OV02C10 26 MHz link frequency
Date: Wed, 23 Sep 2026 20:40:59 -0300
Message-ID: <20260923234100.318151-5-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a 26 MHz external clock the OV02C10 runs its CSI-2 link at
399.479167 MHz instead of 400 MHz. Add that link frequency to the
OVTI02C1 entry so the sensor driver can use it.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v3:
    - New patch. The ov02c10 now advertises the 26 MHz link frequency
      on its own (Sakari), so the bridge has to list it.

 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 77257311d..6548691b2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,7 +93,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
 	/* Omnivision OV02C10 */
-	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
+	IPU_SENSOR_CONFIG("OVTI02C1", 2, 400000000, 399479167),
 	/* Omnivision OV02E10 */
 	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
 	/* Omnivision ov05c10 */
-- 
2.55.0

