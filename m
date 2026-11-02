Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593951;
	b=ucpcg4f43VEcVawL8HIIXYaeh0xWVPjD7cevb6Szx80a6j7B/vq1gQWB/gx0koLbdFDm
	 3lpLI70gVky7kQ2mHY85OsGI52Tv21GpVBMBInZOZSeNIfcG1S0+H/3930BviCKzxdRS6
	 Yq2RGuVac3J6CGX3+QIzJ36SZCjOunP5117arzEuZhBMCabc30w8vn9zgC9jOPSdTPq5c
	 bxPdye7VYtkDHKz7C/1pfrzFb0b+L9ZZ/8h48GJaomFG0+orPaKX5auszPhDSo7wJpZzM
	 aEqOg19L7gurJt1hl4HsslMKhrYZth7cLTXvBW0nnyJTgGZr8uZDoE1wBi3+ywx15Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DlXdMLkjEmJpYFky7r1GU2us5l+hwiPBAYsVgOOCBHI=;
	b=r1yfc+35hjVrxE3aOwhBQsBvcdvIUt1IGQ/EEa8DoGvGyjcSVaJJgaa0MdtrjvK+el6o
	 cgUfy78qVTXd0p79kWlJeHws7YdNuqTzOSY0UGySGHFZMN73n8pfoVa4jxSmt1fXjEwcB
	 R5y4fRHr3ld05Aekcc7nOFzMj/KN0o70SYIBSu+DVVMPFrDwRgZtGFMGbhNJy1r6/N0Yb
	 5y7GajcEbVbu08mroRWOxBW4YODLqQauTosiYNem0rIlWJFIsmeGRHdjOv4BSSf4BhLlW
	 7vihLW55FYll4vwPikEQX0bLos3YREl5tJxM/p1rEzps5E7EREQDULlz2YESiCpb83w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKL9LJuW;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B578606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B578606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKL9LJuW
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35829219da8so4250187eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793593950; x=1794198750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlXdMLkjEmJpYFky7r1GU2us5l+hwiPBAYsVgOOCBHI=;
        b=dKL9LJuWhFXmzdDRj2UHtPkPOz4qCqpwVk610eB0lS9womuUUIEpx1pOs5WobIFeDY
         Y5tnxRNze2ddcse61v7QG13uzcCOqky5RCVsH7Y7ahd1RPFRrjHNV1LzizP621X5GH35
         PHZQY9DgLnzg3yppqbaJTx62AHvKyd8U5DlnmVVmDRhvc6j7WqBp0SvyF1hQnvSpRgq8
         dmbe77h4+iqnPt0v73mA/lTOIw1p5EasjGAsgD7RM6g41ZfUdAnW9sbcMkfb7RhVD0HT
         9naMECFIBE6y9fQA7uejnipd1amQhVvpTUMSuFGNf69KaYMBbWn+jO9YXb6PI8tbV54U
         OsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593950; x=1794198750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlXdMLkjEmJpYFky7r1GU2us5l+hwiPBAYsVgOOCBHI=;
        b=S8KSX4e+oRZzhlwQHAdq1Jte0WbtgLpzLtrUV5YEQK1jLIUQgN33Uu+OhnqyBY12+U
         bTf7JgFvKfuQcsWEJKBcguTubKBJGFaJDxNNIIntRFcY0lLm3rUdNWaClQ6PvbNwkh/n
         lDRDklrIcllnZO8IXVzYvVoyHKy2E7fR2yQEQD1xhCuJZXubL1Nui58jw9EvqIoVYTgS
         wp3Wnb2OIBDhgUhCe/l22wlhwPiFmmmRlv1Oz0BvYYKAydHZU5p2TQO7eWtDT4bdNP2e
         UFtC4vixxl1C742iaS5dvYaYR6hDW0XYbSGHvOCK8jJORDDKaif7FSS5xtqzUnYZC7+r
         gb+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8B+7n3wDyWB3gyjX6tfsEeBln78XKRAjRofLtAtAWqdrfGF6QtQFE8P4+IgkgwTl6qfO/tru1wByDdAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NuhQi62dznzEehQkwa09CANHpdLybOAYv1ZtzFriMF3RbyQ6K
	f9gDoYXuk3hVPIv+tzCU3pNKvux1cab40ItyXBStm7Z9VkNrgF764HwX
X-Gm-Gg: AYBFou2dglmy2rz56ieqbkKEGkMxETtYM7GviksuKkHk7SU0pG6xVyPrS0Ybbj/ZSW0
	wPtggRItdPjR5Bj4yc391BTl6mErCDxugcQ2pnR2AhCuX27SfRdIXZYt17NUZmuPR1hL3x4OVJR
	7Esa5zG5uOOA6xE7GQbi+Yc4tMSxDKXUXPvvG3YahXFFs3FrX8cfl+PN3U515o/D29DO/N9YQ7r
	hAEEVVlJDJVFnkSh4EqRpmIegQkKtzDm7N7WvezvYBRYGfQqEWenGal9/9+2UdfF1t144oC8lP1
	w25/0C0+RHZNKzO3TIaB1H5DAvbaZqNA76dn5XKyYMPzVePrmcK7UwmricxpIHS4PQqVbC3SDQg
	djfd4/tDvlzvXsNntKA2PsCWcwg7y/RWW3K32UfcEvLBts+9Lec4vef6gK7T/sSZ0s+RyekDxMJ
	hxFFboFKlYUDi69YgWFRzoSW6EDMeFpZlTLy0b+KIMqIjZJdZW7tOC1kCrJAY7gfzzJ/YwaxfUr
	34VUrP99MIqKdt/GOG5scXGyi947e4j0+fYbKMJROW/4/oMIj2Tq6tKQIh06rRjT09j9qjVDAww
	FKbFGqYfzVnI0O9Pjf2H1QMr9xeHIKmRuhCNyLWALIJqxb1UJBCD25nHoFP7wYEiUcSvFR4lXXk
	zJFGvbO2XnztcCIHaYvQZrRNWjEkcf2O5R1McUgDAiLiSAXO1G4+ZPeD73UsM6A==
X-Received: by 2002:a05:693c:415a:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-36a647b3661mr4922339eec.0.1793593950041;
        Sun, 01 Nov 2026 20:32:30 -0800 (PST)
Received: from NB150512.ADVANTECH.CORP (118-163-147-185.hinet-ip.hinet.net. [118.163.147.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm38581063eec.26.2026.11.01.20.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:32:29 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com,
	osama.abdelkader@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hsieh Hung-En <hungen3108@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/5] drm/panel: raydium-rm68200: Fix prepare error cleanup
Date: Mon,  2 Nov 2026 12:32:12 +0800
Message-ID: <20261102043215.990351-3-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043215.990351-1-hungen3108@gmail.com>
References: <20261102043215.990351-1-hungen3108@gmail.com>
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

rm68200_prepare() returns without disabling the supply regulator if
EXIT_SLEEP_MODE or SET_DISPLAY_ON fails. Since drm_panel_prepare() does
not mark the panel as prepared on failure, drm_panel_unprepare() does
not call the driver's unprepare() callback, leaving the regulator
enable count elevated even after subsequent successful
prepare/unprepare cycles.

On failure, restore the reset GPIO to its unprepared state, following
the existing reset sequence in unprepare(), and disable the supply
regulator before returning the original error.

Fixes: 2b7ed18bed1a ("drm/panel: Add support for Raydium RM68200 panel driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-171393@kernel.org
Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---

Notes:
    In this patch, rm68200_init_sequence() still returns void and only
    logs DCS write failures. These failures do not cause prepare() to
    return early. A later patch in this series will propagate
    initialization errors through prepare(), where this cleanup path
    will also handle them.
    
    The error path does not send SET_DISPLAY_OFF or ENTER_SLEEP_MODE,
    as DCS communication may already have failed. Instead, it follows
    the existing reset and regulator shutdown sequence in unprepare().

 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index c535dc931903..3a59eb00274d 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -277,17 +277,26 @@ static int rm68200_prepare(struct drm_panel *panel)
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret)
-		return ret;
+		goto assert_reset;
 
 	msleep(125);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret)
-		return ret;
+		goto assert_reset;
 
 	msleep(20);
 
 	return 0;
+
+assert_reset:
+	if (ctx->reset_gpio) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		msleep(20);
+	}
+	/* Balance the regulator enable count on prepare failure. */
+	regulator_disable(ctx->supply);
+	return ret;
 }
 
 static int rm68200_get_modes(struct drm_panel *panel,
-- 
2.43.0

