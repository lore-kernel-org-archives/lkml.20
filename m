Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270563A9D95
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933720; cv=none; b=oQK5zglG/88TCcO1tZM6eBFgNmRMYacAAbti1d0XkUGwcudSQlQfRB/6RvhKxuNDiRmxmkzfxMKUGkNuwHT0B1XSU+8I41/T23y9BNYcgeTFCKagih9FANa34Ghvy4noPnOYn7c8vdMeNju8lDL1DL7tVuStknHYCXr5pmsC8Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933720; c=relaxed/simple;
	bh=Wq5pAafYhnlX+730hO8eGZFTr6gc1skehnTfelhN2Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bhsvm3t/8h8/UR5F5jvgw7Bs7W+XYFXDVVDBp+WVUzdtv6JHudYhM7UxN6VMc0pMljb+s+PZ11e5V3MSu3nU+NPPH1tp7K8KEQhbi0WflF/2FDQXBsiMTCEINC0AOXryPqJEZ5yuxGn6Yb+LRjGh6g1y/xd9c+BNLZPwNL9m7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWNRe75G; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWNRe75G"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fecbb7000so421481f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933717; x=1788538517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnTmJHQexdV5oBlAiHI8qAl8iNKOtPsWh1YaKqj289g=;
        b=cWNRe75GS3g5sUM8VERlRuPX4pv7UhB5gMHKNtui5a+oKkAri+2fYKehGASZKIlz5S
         xTFjUyv/KUUaucjpszT1NdC4oFuhfUFhzVaQ0jaNJhBeRt3PFrU5jGQsHI00wluzWsaJ
         icFa5Nohsh9fN1c3xXY6jcCX7AbW4ire8bNGPYbovyJupR4ajgL7OvKm+oW4FI1a65wf
         rpJpNAyXewUtMMJdY3RqmxzHKpzgCYMriMiqBuPqzQQEXSbIZ71L8WpqxCQV1VmJ8aJe
         20wwojEWug7NpWJjY29iBmMgIo37kX1eCtKefsmZtJGhPhFVsV59NqoM5JZaL8hSlIjp
         cHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933717; x=1788538517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnTmJHQexdV5oBlAiHI8qAl8iNKOtPsWh1YaKqj289g=;
        b=e3yR9tydMAuczT3/YfyGn3iYc8ORcYEEuL5E/48zLAZg5IxEUQcrZc+MrDZu/IAZqy
         sbXIltey9D8aa7RRH8xLlk7eG5bNy/7eYjlen9chsR4t5qgh4xBmVA8cU0AOVDlod4AU
         yfkbwqbiK1kRHtLozcpmDKA0Tx1u2UUNE40oE6MTZ+7/IrMPHpg2syrMeqOJYhyD3Vq1
         H3V0PwpdAcpugcrsmT2+ATNzXEnTrM7SjyEHF6mwdwUqlXHRI/AvjSGBYrRDNc9k2gTW
         VyMN2DUXYogl9Au40FL3DSa9rJy/Swy0vQcd1FB4p6RStmzZ6S+m3lAacVDJIchKO5PY
         xlYA==
X-Forwarded-Encrypted: i=1; AHgh+Rqm/ll4M7xjt0hje7sIv1bzAY/uEfjxb8ljRa3WMxsXLFukNCtZThHWDa0ga2qt/j1cMZkfza5OUUijuRc=@vger.kernel.org
X-Gm-Message-State: AFuF++nD1SeNQ6aoMGiTwDiJmbglqinXIiT+5vCGaEjjAVo9bUeuGpe0
	D690DCNYS0/8tcBeUbd6eLbt7/e3pPgxER4SiGOS5Y0Ww3K9jNJs9BRd
X-Gm-Gg: AR+sD13/Pz9lR1Acc1N/JztqvJ0lmk+iJQLB36tUAEW2jpAN4SELFNW6miroCMiERZH
	3td/wBxsfClArrbNWoc49hZCs0l6ns0qMT1GxW3ROYx8ngfLndMpkKnjZCxxeOKwnM5y0bYWuKg
	nd11wEQTJGM9Aeg/gGD4jmDZxgQgD2skCaohMZ621J8dBgeTeEr/mzRL5ro3Khapsr/dGlwX1M5
	KapIq7E378pynJCzOfKO4uRkjklxEdD2d8sfmdBxa3jlBfCUoGvPKS5ucByl3R0NIOuRJ/pKY41
	Ea3koFvF+MJuhP4YbqC/ZAYDEvBwYqcVYKZKos0c4xd4Cufxo2HyaBqWgmjyL1uLbxFAxbg/9Hx
	BEjJYDgjMrEzfL1QvqPRhkdfR7iK/iF+tkHXomXaYtL4E3LM27yt66r5QrQnnVfvQA1GaTfAjnL
	Wn4wpIqOT8mZUSr+tBpFRxDaDVjRUt4xOCUYjwGdFNrGCHLa3tzrI1PXbcWqcMvtpQqCOnxSDGo
	jFxIFDDiDCa+7Ct7dTMWPuj9ApntUoIoCVtauNGCw==
X-Received: by 2002:a05:6000:653:b0:482:fa3b:fab2 with SMTP id ffacd0b85a97d-482fa3bfcd5mr10965461f8f.19.1787933717144;
        Fri, 28 Aug 2026 09:15:17 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:16 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 07/15] media: atomisp: Add Yoga Book camera configuration
Date: Fri, 28 Aug 2026 18:14:49 +0200
Message-ID: <445158bc6dd99ea11806d68b6d1873a2d0bfdd92.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
2.53.0

