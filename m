Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE34F47F2D6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862956; cv=none; b=uLygx682AklqOm/BiUktXQwDV8m9RsFCDmP7Phvx1UmjnUSN92fCriyhgzhHpo/Aabbs/ep6XGS4RV3L2bNKQ7FkVXp0muOzPevjYllAF62cQPZn14C3ViBt6TjXO9ANkLuGMRzLRFWeSQ8baqL9Gaj6aBNEL4Q2YuqgTv9f0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862956; c=relaxed/simple;
	bh=5l5rOMnqmUZDSkzkbMpjGa6wwNxhDpOe/T3B2RXhwgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELzR4ldNUJl84wggRD8yE/LdRCAcygjKM/xklTJOI/9BxXKsb6C2Eql8LyC3Lh9xSoOyUTEGtwFNnLdoRpUI8cQKV9GvIQgwd9k+pB8Vq+NDW+4xkAcIfOhNDYv0//Qznt8u/2jGn/agO/77gVB7Hzj2n8g0x9mlYFcUI+ix43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bN8cZ3XX; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bN8cZ3XX"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3916014eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862954; x=1792467754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCIUa8Lo33J/2KwMBZsXqmYyUZJ5D4WgEyODRjSabeQ=;
        b=bN8cZ3XXUjO+Xw9MdiwVS/x5yAB69JEB0TBQZsIGDrtSdrtm31DcqanyfySbykwo2K
         ika/pCp3f/tHexISEQSf2Z1vR0lKpGakOmJJ4SAKmYqLvnahkDmWdvUTijHUiemb0RS6
         +dilucNpiFBVWT1sDgj/ltUCQ5Htq6FJGNOkBtS/c/vRcny/Fx19p3nPr7pBOaLxosTI
         gitEA1bAEdb/Dav6hlliSUzsAhmGQyOyr3neIPJcLnatoKHLrkfAFKKC3RDLVeql+I0A
         EqI/ezsAuOJ0d0tfLmHhB6Tis9SoJJRl/45x5rf+BHrSvLponjhygrm3dwjp8BCfDGZ2
         +VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862954; x=1792467754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCIUa8Lo33J/2KwMBZsXqmYyUZJ5D4WgEyODRjSabeQ=;
        b=fA3ex3uZXVyjveKghc/8z0B6ZQsN4/YmKinoKA5+BqeIlyqkDVU0av9Bb4LpZEebS8
         27fx4N3hZ6gtbCro9eO1aaZE5mViSnlnaWdon6vzjIfg6RA8z4oZYx5YOkFYnHhdzTwU
         9AZUBznAqNyY1iq/sb/RgKQLdZ2dG+jMT88dwBUoTwQ3NmLSPMNRrJforFKhZorFGynw
         FLVfCviYtVdywxKX55Zzbg/NcXjfnsnxWEdIHUJvbWvUIyVruCSOrNTjE9XXRcwMOp00
         jUyW44tecjrz5ute1iTZzzcaDtNzt6fRrEbE3Jha+ZNlOthOkhchDOU8yJj3ykvPHFQw
         H0FA==
X-Forwarded-Encrypted: i=1; AKwUvBxaTPYQx+swKpOsXr+hkXLu2fNT3AYKqpJIO8Pckm2hL19qEEAtntrdc6TqFT34VYbNfcdLiOEOYX67mt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKovWqaI2n8QtFtCDbeZmoQCr74fhyvkpW84NQxEcSQLlYVvBhK
	PSM0qVd1DmddxGH2ktB9fscdmEuywv7jFvyp36zYczj83jmh1W/0aA+N
X-Gm-Gg: AYBFou2NBYHKY+uaY7pvtXs9nepfStyuyLD4yrbo2pLv6cQD8YOkzqrXYqNOrtM8DMH
	JZciR38ZuAILdXtco8X+K2llqEUWh3wnf+OIrql7GBRazQdTV6lbJEiS7bnG3eKkGVBXP0sDA/v
	i1w8XeX7dhbAWiNpIQfuMcRPkcxSsj3WlxOOWgp4bP4QYZ/dLNM3GO0Em5Y265OuaaWtJco4Ben
	7JuB39O4t0LwIOAuCHE1+Qyoo4ZJPakEpCeR+uQwKRQN9mfKdhpnzWfX3NXZZVbnykdt6Y3/Zih
	a66jcdSvaCrmM8wGDgqoyn9zEVwEegYEJ/0XOoW9wrVtxfUEUi0GVfF9qUMwFdW1YQP8s6WeP1J
	d6MC2swMWawzPHsIZieOFZwYSqtqMlNQQcN65aQhz91VfWNOMd7VFXPB9M4HO3v9tWTIduS4VGV
	DEyl87v3nrNdzMl44QH/1mpKx9cLK9r1OVUrqJ+LOJPi3GFVm/ps3HMhx/BBMniu7EEqhw1DjE0
	w7RrskOw7y0iuDpbzeTctjzKZLAD8YlMsHuwB/u5K6blBrRWQwZopVOOjIIhH0=
X-Received: by 2002:a05:7300:6d23:b0:35c:6ffd:e91b with SMTP id 5a478bee46e88-35c6ffdf3b6mr1436443eec.40.1791862953821;
        Mon, 12 Oct 2026 20:42:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:679a:f35b:7c29:e0f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm35268677eec.29.2026.10.12.20.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:42:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 12 Oct 2026 20:42:22 -0700
Subject: [PATCH 6/9] HID: goodix-spi: Drop redundant report ID validation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-hid-core-report-validation-v1-6-e0dd5cb60b2e@gmail.com>
References: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
In-Reply-To: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 David Rheinsberg <david@readahead.eu>, 
 Frank Praznik <frank.praznik@oh.rr.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, Even Xu <even.xu@intel.com>, 
 Xinpeng Sun <xinpeng.sun@intel.com>, 
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Shashikirana H K <shashikiranah@chromium.org>
X-Mailer: b4 0.17-dev-e56a4

Now that the core HID request handling validates returned report IDs
for report retrieval requests centrally, the report ID check in the
Goodix SPI transport driver is redundant. Drop it.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-goodix-spi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 03d549efbdce..81603581ae40 100644
--- a/drivers/hid/hid-goodix-spi.c
+++ b/drivers/hid/hid-goodix-spi.c
@@ -461,11 +461,6 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 		return error;
 	}
 
-	if (buf[0] != reportnum) {
-		dev_err(ts->dev, "incorrect report (%d vs %d expected)",
-			buf[0], reportnum);
-		return -EINVAL;
-	}
 	return len;
 }
 

-- 
2.56.0.385.gd3acb90ef8-goog

