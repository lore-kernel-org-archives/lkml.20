Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730DA39A04F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789278414; cv=none; b=aXzwga1TzrXfviJUNeacvAuHwnarfbR/sjNOL29X/GS93rD2MlhtT3sz9YBYRtcotZsRJICCSpJY+NF+O4aRt6zJv6OSskTAMyRQNvMvtj78hpdR06khggzyFHUkpCfBdnPheYF5t+JC7A3JCeyb/2F3PxV/oqtipN1fDbQEtsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789278414; c=relaxed/simple;
	bh=+uK+VsHDMRyMuUOAfV5y2lMUCDN12RBkE9fAZ3K9c2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYTO36/4PBxJOuccsenZwLwTWsWWJCFuAGEW7vs5FEAif50/oT8RhoXTnJ17fc0T6pClaY/uaE4KIn7kXkNg5gTtM5wQcwJiaW85mJBFCdBxoN+49e4Eirqg1GQ3PHjwZIN9BHZ+k9Gwfs0JWs8ubQHUDOg+8w0EToS6zUDn88s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDV7zskf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDV7zskf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49e717c9841so4481625e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789278408; x=1789883208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaDpZD94po/Ak35KQivlsGuKrpLRFzPRKG/6fz12Jdg=;
        b=bDV7zskfXFkAaGSt2v9WczaW44kPQBXYihRD3n8P8C6xZwqfolgQanhPsrsBO5VexJ
         kNiEhIYApf7AZZnfDY0MiCQWHy0KXu4tN0/8NtIeR1x/zfgPSjLPoUM5uvVCDkNvGFir
         MAQ4kJFb7AJh6gG099DGAgtIHt1GSDYB5DXx28w7n6lPhj21CiufKpWceM73WzWTco0J
         YP5OoQ4eKda71lr0HmO0nQaP33Ty4Le67+OAV2IaqkX/H5p3geNZM1mzlbpuzRu3GpF9
         GPe6jk4v2b/+gQzuYmaOk277u3O0omhhckhHP4qW27bcJOE1gW0gCsyEK8gm8fNRDeRs
         JOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789278408; x=1789883208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaDpZD94po/Ak35KQivlsGuKrpLRFzPRKG/6fz12Jdg=;
        b=lOdhN7rr2VaHCDQzgWrirvZGSM4dspI2NKQKcX2ZZc4JjKwIXt8s6Iszd1t7iTcCC5
         4+8OJTNF7RS0USPPyi8ZjrJ+KU8p01IpoLar63QgWdVlDBrWqRwe9RziY3JeO4b6F9Sg
         1E2ujy68ryfgsVorzgexYv92XSBd1avRmpD4fudfPDkzBwNTuy9ay/U/M9PhY1pU3zRX
         05nb9Pznr5VH1xOuu5sP3r7hbrUQGJVId+lsUVUSiUIQcaxOv680jjqaPd71gbkhEZxE
         SY9Qf/qBQGQo8k6ZoDfkVX71OCR97SmJ2YphDGw1e6QNn0ojb/Xi6h9+tCCLmL5lkbpz
         DE2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4uw+HKIhwiRTPw/6jCVGrHBUq9uBLkcpXjEzS6me7WZgDMn2NNRKYbDolu28YzMWxlDtrx2fVhGwUmcs=@vger.kernel.org
X-Gm-Message-State: AFuF++nRF36fnWWAV+yK/KUNsuHSOBFtFPQg6zElwnGRsPev/IplGP1z
	qnWG7b1lDmI+Txk4o7W0uRUpcWemdYWaoSrEXrYBEyzbs5QL7MxkcUQ0
X-Gm-Gg: AYBFou2l4OtfWt0J1BnWsjLgREsOMHoz3XtVV3UYdM+U9+AV0lmINCbwPRTySaiZIha
	6oqzlh5tGAq57I9tAtZffw9ZhCa6Du13MUm24yG9hOkKdaTDGC/y99VCBs3S9UP5pM+GA/Vt/aW
	Jp65kzGIpOHC4ccrScoR5deYTxpyF4mI9g1zS47RTHND5PlV3a9VG1dCsRjs/63Cdffhdcv5d4D
	rQQUmmdQyM0Xh9iZLavR0QQUXB/ZUM8mVb/1N33wVHNYlJRRT44yzeeW8krogRdakDOmBnj5MHG
	mxxe1lxEcoEIqecFQAsRCjX8auN0Bs90XZQtWodw8xmZTlehSBDcirX61/aUMWoonjDn/DJGxWV
	uZyUmxqeBBX5EGtuXJJAEdvsIJ1nz4AbMFU5Tr7rFnAoHPGgclDtiPAXNiI4LDVBQSK70qk9HFM
	7t1LWINDQKH3M5caR4Gpz0g0Z1YEHufOIEY/dqr1ERho+7Tns7cqgtZmqpqSIQJKXdkCkLtqPQ8
	V8W04DodEjmdYt698BQZG7A9XNHiHI6cK3ONHAlO7Sri2DfOxqAYc0=
X-Received: by 2002:a05:600c:5253:b0:49d:29ab:540b with SMTP id 5b1f17b1804b1-49e619994a9mr128731495e9.15.1789278407838;
        Sat, 12 Sep 2026 22:46:47 -0700 (PDT)
Received: from localhost.localdomain ([105.188.24.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm17394127f8f.21.2026.09.12.22.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 22:46:47 -0700 (PDT)
From: Walid Elonok <walidelonk@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Walid Elonok <walidelonk@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add support for HP Laptop 15-fd1xxx (board 8DE1)
Date: Sun, 13 Sep 2026 06:46:45 +0100
Message-ID: <20260913054645.58692-1-walidelonk@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP Laptop 15-fd1xxx (motherboard ID 8DE1), hp-wmi currently falls
back to the legacy HPWMI_FAN_SPEED_GET_QUERY (0x11) command because the
board is not listed in hp_wmi_feature_boards[].

In HP BIOS DSDT table (e.g. BIOS F.26), method GM11 (query 0x11) is a
dummy stub that returns 4 bytes of 0x00 with return code 0 (success),
causing the driver to report 0 RPM via hwmon even while the fan is
actively spinning.

However, the DSDT implements method GM2D (query 0x2D / Victus S fan
interface), which reads the active fan tachometer directly from the
Embedded Controller (EC0) registers RPM1/RPM2 and reports accurate fan
speed.

Add board ID "8DE1" to hp_wmi_feature_boards[] mapped to
victus_s_board_params so hp-wmi uses the working query 0x2D interface.

Signed-off-by: Walid Elonok <walidelonk@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1a..fd9189420 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -339,6 +339,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DD6") },
 		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DE1") },
+		.driver_data = (void *)&victus_s_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E35") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
-- 
2.43.0

