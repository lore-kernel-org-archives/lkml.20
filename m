Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088053;
	b=CuanANfmkQsLKgMDiVlfkPB74ww51hQM+RNrK9umw1HAXs5HORsxyWVKGL0ndc/gutQ6
	 12uMPfxy6/H31H1W/mCEeKEfhs0hgza4ypV2M4zG0C3oqldVx7ZbibOECGY+lJy288qRE
	 iF8knzxJz1w31KegpBsuWFORYWk2msxFPVwkbQbJvxrESRFVS8hqrWGeAQD/hkenAJYO8
	 Waciv5rGJhhOYQ9nZrSHShlhyX+47xM1nzX09JszXN2WLb9CNJ0t92OmxnjYjYsUY6Fr1
	 nLH/1YgpcVw2Fp9ge8iwc5nah3e2G7R/2AjsGCooOpJQhkVJQE/LlzmFfTDNCJRv4fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
	b=o2Sq7DaStU4Hz/yi0MzTUFLPkrRDXONTj3NBDYBaDnjVsdAW8XLdt1T74qIL3wqNWO6a
	 jydyUJ8Fu6uMhXx1F/xlmVrz5xDTVsg3lucY1qLi36l+darv4M3HitGQZWekIlM7NuM6v
	 g2xLFh7tq2LOFWvBsxOA+QuqKeih60xwbB8Yl80QTFC/1CWrJkkgFdoAkbFV751zxJcOC
	 nK8fnJZKXgef3xmAfcyTgX/Q+G+H5b0AwdTYqjx3t///yR2gzvAqw+Mq7q8WrWrWNOgUo
	 ykDUdMzVUATKfUY/9p24obWDvl7UY8YIN6OKVntjZyZaueJ41fUfYYmYArsBa507rKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+kcoilc;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C897606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C897606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+kcoilc
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843b6f8e2c7so42140a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 13:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794088052; x=1794692852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
        b=S+kcoilcKGFI0280YFMRk+NQ2H7HI7WepacwDABzTKVl0SCqQrkm99ya71pdu+lRlr
         UqTxZPXWL2VjtUpEt3CLt+5AdbhOvEdNlhXgu61aN0wAoLzTHvlGhFSLXuGjJXUedKma
         kJ1xVmbKAIJAZaLxl2jNxWn8/srgesDT7Pcg+2+TLHWfaqBexUrR7P8EOBh81qEiTB7j
         7qyeWHYw6fCP1yGJOLuL3CA94xzdpEDyMriJeRsjmzuCWS8BzLvFbLDxDYWSJhG95Top
         YbKvY7tuSIZYVRoOEd0x6vsdc5cw6x0Xh+gWOx7O8fiI8yUdweQYveOX8ziTWsJoeKDL
         w82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794088052; x=1794692852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
        b=b98Vn19SN9pY9zNLN3R07PLRfuFOaihRGyBmh7Tha+GON+KKAGNYuqa6LtEqKt9BOT
         cG1Iy8Zh1/BISC+st4TRwmGus9vWmiFIPooAfSMEPUTpQQ7+H9k22gOHa3Eg4Ln2ZyEk
         VpY0OtH+VCNnQGIpsKQ8dDbFLpstAcQk+V+g9gXyMkB1BJxQikwwU9DDsAjsNk4TpGeu
         9T8YUsskQxKUdSAVLRP/b5z7BsPX93lcJf2oz8fsi7arRRTvpqbQ1uCGmHdQ+QAZg6ON
         0YPxg+5qDjR3QlP8YpuVfTJiGzvZqWnR22VPRkKP3spI8DBpKA+eBUSkjeoO0N0nPfkT
         yalQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBfDa+2hzOW7niGCS6fKZHNtAbUILCyxuVepOwJ0Xt0y5E56MIAH5AGuf/klpT/8XCYZdWf7Q3DTdWPDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xEj3AEqTwkRQTIpWQfpdXQm9ASUj+IhzMz0tkrXO9C9rfRNV8
	86+Pemm4dX0tJKXn0o9lYKhPYdaYoZoeXlBCoCPRKqr25UhpA/v79LrO
X-Gm-Gg: AYBFou2vYtQLZx+/Ybj4y93i7FbyvnKJk5pG14hnyZi7YK7MRSTf04Sw19LZPjR6GAE
	J/UmkuNiZRjfRxjhobvWORqv29KpESo2SFVpMz27Jt+RkPZ28iAah/y/H6DoeHs9N0HwcZfPLHK
	njSJEltrtQ8BrOrfcUaar+bKiHWaS78ZQhbBBPFzIS74oAzS5B9ypDjrevtzoiyOPtAbEYBn+QN
	1a+2f80LBYxlg6VrL2cUHSeVhnMEeKX8G2bYrAeyu540YIArhtc4xYH3Pmz5tC9Db43lXekwtN4
	VY5Xm2qgmiPnOngU1ng9AMPd4BL74xjNmwCbz3wOgVQMX7zAbgOB1WIwakNovj/jnEqN3an/+SP
	3lJqXTs40LFz7T+T7Ia3VEriJxT1FOzpGnmsaKkRt7rS3KvB9es431brNtn0VCNzxoOUBY3tB39
	EyWx125rqZB1Wyz6mH8EpkYIXpFVtSL40rgJ4PDRW8EIPDePClDYMSXW/WLuh7/7VAdjPOHn8tx
	eXT/ihF3TpYZtJq06dXk12aVdIi8R2bqbGmzPcmOnRTk6ur9pDuXOwl+GgE0WRq1H/IKXPefRUB
	i4tBS7wbMlueQmyz6F9Rpk7Rj4ApbLIf
X-Received: by 2002:a05:6830:25d1:b0:805:9b38:6f7c with SMTP id 46e09a7af769-85f507d8052mr76511a34.29.1794088052220;
        Sat, 07 Nov 2026 13:47:32 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:b43e::1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb70ab1sm159512a34.14.2026.11.07.13.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:47:31 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH 1/2] ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
Date: Sat,  7 Nov 2026 15:47:13 -0600
Message-ID: <20261107214714.11392-2-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107214714.11392-1-samuelslg03idk@gmail.com>
References: <20261107214714.11392-1-samuelslg03idk@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Huawei MateBook D 14 AMD (NBM-WXX9, Lucienne) uses an Everest
ES8336 codec connected to the ACP3x, like the already supported
BOM-WXX9. Without a DMI match the ACP falls back to the DMIC-only
driver, so the speakers and the headphone jack do not work.

Add the system to the ACP config table and to the acp3x-es83xx quirk
table, with the same quirks as BOM-WXX9 (internal DMIC and 48 MHz
MCLK).

Tested speakers and internal microphone; the headphone jack could not
be tested.

Signed-off-by: Samuel Leyva <samuelslg03idk@gmail.com>
---
 sound/soc/amd/acp-config.c                    | 14 ++++++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3d4c8526c..32c4d6319 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -237,6 +237,20 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		.flags = FLAG_AMD_LEGACY,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NBM-WXX9"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1010"),
+				},
+			},
+			{}
+		},
+	},
 	{
 		.flags = FLAG_AMD_LEGACY,
 		.device = ACP_PCI_DEV_ID,
diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index eb0e9a6af..fb675774f 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -364,6 +364,14 @@ static const struct dmi_system_id acp3x_es83xx_dmi_table[] = {
 		},
 		.driver_data = (void *)(ES83XX_ENABLE_DMIC|ES83XX_48_MHZ_MCLK),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NBM-WXX9"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1010"),
+		},
+		.driver_data = (void *)(ES83XX_ENABLE_DMIC|ES83XX_48_MHZ_MCLK),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
-- 
2.56.0

