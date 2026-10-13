Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A2D51EE07
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904667; cv=none; b=lkL1nlTSWk/TGuUIxlYG39wGCjAjPM9ZVo/PlJ6V+CX4F954TFrRQ1ZfOf5FiVsGulmuGEa3vUpo5G6sI1nfYKKI3SBeWrtnuiwScj0+KvmeWgOVu9/if/NwSRzeQS+FXnZX6mV+vfemiw8EOTmIQhhF3FFUUMRLtG6tBskEFeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904667; c=relaxed/simple;
	bh=gkLhZ9o7hxqWFSpVSb8hHClkkDfQJUhvSWSxQoDNUQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHf4FcYut/FrDF2u91xvmJFKgWo9xUuKlE4rc0gVxBhJ7T50xroB/asbEjeXsWxvR2rnevonAdjFw95aBlrlIfeRYjq22+IW8IBH73r+5E/AwqbbJXE0Tfrjy+wNXWNx/b2IT31KjRyfSGQSHEkaG7JfHD4/JC4sF2vPVIqSGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=q+6TCtDd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="q+6TCtDd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4207ac26so2985747f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904663; x=1792509463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQDRTMDHo67Jv1aCF1efiajgwTxDzdnW3ZpdVhzeRvo=;
        b=q+6TCtDdyx+D+4o5kjx32yArBOBzGdoUWgw+VVtVXLcFtCUCsZDqY+FuNTZkKXJbzN
         Iju2M1iTDeXrOXniJX/L0EhI+zMmZLa5ibbVtdylanfFS5PT5/Pu9V5SXWBGEL1q+Ajl
         tQZce/AzD78qpTCHKdBReuxrWIGdTjgUxEkYgSfS61kEslGzQbH7mw705vdDUOIO66Kw
         TCLruEnuuNnqrpDKVV0tqpGFAn3p61/Oo8McT7cJL16retL5gbq9X1i5UqluwdE01pdk
         NQ5oIvqqhv3tTruB5aD4FjJcZM+XIP2msIuL8kxeRHKqtkoH0a9J8RY0ETa9U8QY8KkK
         UBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904663; x=1792509463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQDRTMDHo67Jv1aCF1efiajgwTxDzdnW3ZpdVhzeRvo=;
        b=cdJbHROnneNpA6fu8ZdILa6Zr2gH7Ahz48RjePM64mlZ1p+jas6CTiFSO6JvbDov8o
         pMj6M/U+8fsTh8T5OZpth0bELH8i/rKUeKH8d7LzkUMdTRQ4N580iwDN05cPjj+CIKq8
         LvCYQsd1N+oyhvfffHFvhhXiXsVB4mi65wHWFEmkV64VlwUffmjPtFCdWtId1FeRF8lX
         7JIqsf32CuIy5OsYKf4iNyTNoozRLY+YKuiF7REgYEOt3fZkgoT5Iz/lzFXU1zN0pi4J
         0fCPDazd6bkF9qUM1RQ52bUOInQrOkEbR0h88kJO0S/ic+ByaDgYtSIqkfBdSC2lCC1w
         AHHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdcBgciqf38QsVinfHOaGUmcUisDwr5EuFvulaKNcfenVSLDqRj0Nf5lGdI5ZZeejzYGTKXZKkk/YyegY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqwo6QjWDFwk6jBaDKRF7AJcx8B+RoMS6PtjuAFCok9zm6EUMh
	VCHqacv5pP1w7poHAdSDAsvg8lE2BkMNLexwsEM1jPr/lajHBlEYf3y4y6wCHCQYt9g=
X-Gm-Gg: AYBFou2l6FYxnEf3IcVBQh0x5ShQYubBz6ViOkNtKIFA5rVj5rsJnPuJYy+QO7Z0Q3/
	T3RYbJ7IlZz2YYy5k2KjdPqgdpnKXZD5BULNXuIz2kLI8xIt/yniejo+P5dWY5x6l7VTEmhA89Y
	beTJiLh7EQw5yjE89nCtWmoUINtj3M7laAAF+XpjS97cb6rRJswGIpqvC9XQ+w4NsfFryg5dSLN
	vAekPC7kqX93747wgns3f9cSJT8IBbNSZNEEvzhUVknEWgdv1WTPvazsXO7cZjJIMasN5AYH5VX
	hQOWUYarKkQGzTzV6roqVZDz9strwl4jRGoD7oC9Wo24+Z4nBjy9jUNpZ0//T3Tx5fBPHL5WZ+s
	B8rwq/XF04Un89FV46HiC1QbdXI2hwCRxb1af54EGVWQyXx1cWaRwIp3uHdOaeC2DBP2UP9RTP/
	XWEonMX9QzYC5nKSJ4jmO1V0FcqmREDmsy3WNVHR+Jza6jQfXto2Tm13XOJPeMPv7bakoElO4RS
	iW66bWRxjgTNqMGeAh0A6mOyln7HIC3GOYluo384QPxA3P8PA==
X-Received: by 2002:a05:6000:290b:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48dbace156emr23493781f8f.42.1791904661225;
        Tue, 13 Oct 2026 08:17:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:01 +0100
Subject: [PATCH v2 02/13] media: sony-starvis2: Reorder link frequencies to
 remove lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-2-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 84e77aba92fd..c7fbc5c132f4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -186,25 +186,14 @@ enum starvis2_lanemode {
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	STARVIS2_LINK_FREQ_297MHZ,
-	STARVIS2_LINK_FREQ_360MHZ,
-	STARVIS2_LINK_FREQ_445MHZ,
-	STARVIS2_LINK_FREQ_594MHZ,
-	STARVIS2_LINK_FREQ_720MHZ,
-	STARVIS2_LINK_FREQ_891MHZ,
-	STARVIS2_LINK_FREQ_1039MHZ,
-	STARVIS2_LINK_FREQ_1188MHZ,
-};
-
-static const u8 link_freqs_reg_value[] = {
-	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
-	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
-	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
-	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
-	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
-	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
+	STARVIS2_LINK_FREQ_1188MHZ = 0x00,
+	STARVIS2_LINK_FREQ_1039MHZ = 0x01,
+	STARVIS2_LINK_FREQ_891MHZ = 0x02,
+	STARVIS2_LINK_FREQ_720MHZ = 0x03,
+	STARVIS2_LINK_FREQ_594MHZ = 0x04,
+	STARVIS2_LINK_FREQ_445MHZ = 0x05,
+	STARVIS2_LINK_FREQ_360MHZ = 0x06,
+	STARVIS2_LINK_FREQ_297MHZ = 0x07,
 };
 
 static const u64 link_freqs[] = {
@@ -912,7 +901,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1161,7 +1150,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);

-- 
2.34.1

