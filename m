Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730659;
	b=vz/uOKt4JCtZU+RHz6+c1RBiXYFIQwEKu7nUtSyYS4GvpKR7dKhIg8s9k7Cn4yuFg544
	 Nx4uw1LZzdtjxmAjTK8jfNSk0s4LrFNUO2kSssDUQirjQ6P5i5CzgUga+Gu8EA2yEzZGz
	 ZEQUVzvM28XcLWmzrWO6g7NcRMC7Kvy0gFjgaolvzqjqp/7j7r5waQpDSia05UlBu0/B1
	 YQZZ4/PUOYYI7ze/WigoN+6qEg4H8pBHIMDXeWh+ZG6eixdJEaNTRv5LHlBD6nhof82ox
	 sQpvlec7wH/rU7M3ijL5Fu7VJD23ts6r9nnNDPwfuf7lK6P4igaM8OaQ5vKDtxWB3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=;
	b=HCb3UaeYdGuNZ/YlaOaOa6vE/BOhLrQcbClD89GyA+D7j/XuJuuLH20xBGQecXG58yq8
	 Mp9plfNBppiUVSxR+mbm1Ux6TZ78YejSTXFBEIzyeEojBrhC38JxndykqWK5KZBOJSxRU
	 lPympIvq1/QEOiXRC7XJQz77lyJONUlPRlUVA2VWBh8nwsTUBXSYMdz3l2aNK0nq2Utho
	 8wl/E3MFXYgtZ4LWuozI5iVzGiHUZOdsapDFQhzck/Wyv3xbAa1FN9/+Yw/YhtyIoz0LS
	 AbZHFzmn6bxBG3Mp6TiUnPfHn8oF7xzrawbJAilRczF+zLuLuPnrz3hzd1tvvtgjcfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2796FpU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBC6606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBC6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2796FpU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so45780495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730652; x=1794335452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=;
        b=d2796FpU5fg7+pPLgDfZuaHg0vWJESQuG7eQifI/1ZPOBFdkWQ0rjuYLc8vkVZLg69
         tpT8e/G92EeQw+Xo2gMF0SrE2BU152EYO1VxuVt6is/sQa+huMcsafMf6ErjQ5qDYura
         XHPu9inmeYSQr3YAjdvU8Nz/fvGFH3HRXisW70RWAH6Fx8PaIoafhBfSgPN7ZjR/Wcrb
         yJFSe/Ko0vItmIZYukLKg4J7noxCvr1ZygvpuDhN7oNz8eUPdytB5NzNsBEwtW4nExxV
         vipdSwT3IsAy38FIyhg6yoEeRjZ+E6gGwNnL0OlHBsc+o1GWjTKxtnFVFJ6a6s3hWbo6
         Y1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730652; x=1794335452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=;
        b=sayN40gkT/HjogIH/umNjLgW7bYedz8OW1GJiHlnSFCaZ4fYeiByG688vYi6tu29Ak
         Z1+HkdCmt/+F5CuFURpIzUnYMYJwivnPb0pAn/lN8N4r476slbMy4t8BqwS/zKSP2xyK
         q+dgbxBqhDI3gsLhRTFz7op40vOzXlx9Va1rKbwzCzqziWKW5HqSOdXmWszvBoYCzrLU
         RTLYrcAwOTibaplexi4hw5UhnkI/qQCIiHvycy+R5QZyHYVgCYB1iYdfP4S1lyyRA93p
         ETHJIsfQKXaA/3mDjy1JaInCJmiyrwonKcvJX3kajE9+LBASpcvajAB4A0SI1fO9oRYJ
         IhZA==
X-Forwarded-Encrypted: i=1; AKwUvBx4H/xLwaY3HGko0K/gfRp3T7aakTDJwAbPKBC6YLncg5sD2haLvv/eWRzi049Rx/HPabShExg9XLcmMn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nYqDXwzKDH62oxUtnH7XVRgCTtPEioZBR73js/NaXE87wd7uA
	OU6/bpouJA1H/O7vs6tM5JuUp4TRtrgNrTzLb4n1x2k+pl+CkyZwfinM
X-Gm-Gg: AYBFou2hiQbgPihM0Ztf2D0NMzm2p0HghElpFS+5an8PzHsDbynmsqWgQpGy/6MBL2x
	2SiOuX1miTIA8+SgB/6Dumx47HMpBrkUZU2Li7sKIo+Javy9ZOgWX711AIl08TRKM+cVUYa4Iho
	4eDBbQdxR0PChLEYKJhUr/V0qta23v3wbR9dhrz7oBSCOcldHFi7y8hwLDd02TrH8DckwQA/+Hq
	rVyfwT8t7q3D+7dIg8/oMU3sEy6WO8SDO22IAh1dQvP2B6ZPitzN0TvjtLxo8jlUOaoajoxhdGV
	8x/Nrs5/1GXhMj+f13ZFC0srd/vk4q3cMiYaLUZMsuoBbk9iO93qPtvKrVGmi9ZGzY8Peu3SYno
	6jUjaAJtKoaCO1K99Pae8wmhl9nwpxjMCQpJ475vWH8gb9/uAvcYWTrrqUIvW0lFzBlSV6uwuKz
	pLpbF9M7SDZ3mYDGHSl+l+oHgm3lTSeOsTFajRVdswV2afG9hV+D0y1Psw0W+KsNfwc/q+oMO/E
	mEVELH6JU2+odXErUB6NiKkRhn3fLksKroKFqrYKRvGQ1mY3lWyaT80XsQdVGqTffbwbicE0Trr
	O9ZxtejWjJUJf7QUvJk+M6Aj1OOmd2LYxPLKqo2la97L+c7E3N9Y+zhDIRag0wORiMztSAmsd1K
	hEKuOrzBzP3gQ/wKOQFlMQix5/4T9EARkX34ufxP8pxNND3msJOuckg099iQXmebKcIjn5P4KtR
	TMi9qNrNzEhJzWHJpt2jBAiLGpY+beCPUwVrPKPeqzDPbZD+2CIUTS+IcvvbnAHN4Sb/JTKFKl6
	4XJNK90s/Cm81T9T5x+QYsoEzovJvn2kmmCe7kc/eDMKNrczw==
X-Received: by 2002:a05:600c:1d29:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ac187a7678mr340616585e9.21.1793730651873;
        Tue, 03 Nov 2026 10:30:51 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/4] mmc: sunxi: Report manual stop errors correctly
Date: Tue,  3 Nov 2026 19:30:27 +0100
Message-ID: <20261103183030.81078-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
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

When a data transfer fails, sunxi_mmc_finalize_request() sets the stop
command error to -ETIMEDOUT and the threaded interrupt handler sends a
manual stop command. This has two problems:

- If the manual stop command succeeds, its response is stored, but the
  provisional -ETIMEDOUT error is left in place. The request thus
  completes with a stop command error that didn't happen, and as the
  block layer only checks the card status in the stop response when
  the stop command didn't fail, errors reported there are ignored.
- If the manual stop command fails, -ETIMEDOUT is stored in the
  response instead of in the error field. The block layer then decodes
  it as an R1 card status with random error bits set.

Store the error of a failed stop command in the error field, and clear
the provisional error when the manual stop command succeeds.

Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Allwinner sunxi SoCs")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index fe4c0f6d73f3..9744b6b860ac 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -470,10 +470,12 @@ static void sunxi_mmc_send_manual_stop(struct sunxi_mmc_host *host,
 	if (!(ri & SDXC_COMMAND_DONE) || (ri & SDXC_INTERRUPT_ERROR_BIT)) {
 		dev_err(mmc_dev(host->mmc), "send stop command failed\n");
 		if (req->stop)
-			req->stop->resp[0] = -ETIMEDOUT;
+			req->stop->error = -ETIMEDOUT;
 	} else {
-		if (req->stop)
+		if (req->stop) {
 			req->stop->resp[0] = mmc_readl(host, REG_RESP0);
+			req->stop->error = 0;
+		}
 	}
 
 	mmc_writel(host, REG_RINTR, 0xffff);
-- 
2.43.0

