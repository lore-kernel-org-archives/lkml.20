Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D24DEC2C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605947; cv=none; b=nj+ugPYLP8DvhiIDsUzboCAdGDwp/X9XfGIb/c5J8u3FxQveFGHIjA7xRKQZX49VN1BgdwY3lVL3zLeat0SuMV1x54ZHgrnonGAABSGoeqRXu/af/w8FXIN8niPNsZ3V5t2fBE0tHd4Sj4lfzDms7DxQRReZcjOseKFTGBxLoB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605947; c=relaxed/simple;
	bh=gKklwbA4xHxFTf9zhcCzZo69mp0IYH2X3pCyg+sJRTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnSFBITlyuL1Lr5Aq/1xWrE/Kn4CZfAe5qbVtNms3BZ41VIE7UPe+WS8+WWV5qoVIqRDLDmgCuDKCHySyRXG+dcRXebHPpmU0LhIu8JEd4iAd0mM8WZUGcgQYfj+PZSji+wL5W/ysBy8v/M0TjcI86LoEadm6LcbBlgnBgHnB7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e7BOorU1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e7BOorU1"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so1330521fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605937; x=1791210737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmW+RN8xwTQxYTKqM/f709I/w308mfcjTNfdEIlVobs=;
        b=e7BOorU1K701wmoxdS9/UDcwiDpl+iRy1twC+ndf9yRBy74n1xyjJyNuaZ6K3T84ho
         oJmwSVJDHRVx/q1xrNQKpwSSIeVpYR7BZvIk016BoqOfe2nodhg+1SdkC4Sky04UHmoy
         p2PyTP3FPzRdNjm+m79qDeOm1S4CynJlsBjog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605937; x=1791210737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmW+RN8xwTQxYTKqM/f709I/w308mfcjTNfdEIlVobs=;
        b=SQeEBWacEsfMCNaeRnyqaCQe5RYEiaIsOXXw40ZC9K6mJ1lR6/vnMeQ45bOACzNgao
         YtQDlqcgcRNgNQ+9bPXnSvhEID6aUZ0DybrZJi/9mtF0zv7moMLtHprOHmvL827D7Kj9
         6kqXkdvgvpkwNGwf7zhHWCbXPqbbfpJdc/bnJu2P4kZTtfPqSV862nxCqA61uuJ7qJ/Q
         A0gTEnHLP3Xu5yPB8rma7H9Uwufg/6KqXi8H6NLn/jv/QuRPNWCPsvSfsC4m/cyefLTX
         FrTOI9dKqajKEc7xK8sQe+4m9DCOTHH5bzIBNhVozqHuZ1r/3YGtKTziUq7mItN/l0qa
         A4kg==
X-Forwarded-Encrypted: i=1; AKwUvBy3U/GwmVMtbmgkxa+qxflZ+P8bl1izWc1Xt+GTLVtHqLxspy8nnWjqX1lP8tHsec2+zI2BgSB8SFccEqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIebF2ANf+NWrYg6tnb6WsGcQpx3c+zrx0Y5hPbubQyT4ofb0lH
	mM1lnKD4Ve6svv6JIZiTWjfq7RyprDX4pPef3fR1b722UMrmdAB7AIQwu8NMM+uf5w==
X-Gm-Gg: AYBFou3Y2PAXAXdz/DfcMWkkzv7NngJTQy1gBauE4tLwRCZw/deDLKMfE2OqzHEf9qx
	xXWbJey9CvomKPofMgSEc7piFRGd9qE509JmE90uBkLWpgpcxEQi4WuPmi4khvinoB0tobgTD3b
	ePlspWIeA61Gb1e9+W6/BByjNZWCYSi2uZPD8ZigCbRmzlW3Hq943/guNr2nLB7rrFftB3A7DMK
	YHcNX7RU6WKnp2SuXQaV33+sgpK+56+wgLhCvNDIR5TR38NfXU8ZozfVB9De6Cz5PfX9KGjklwH
	eoq1N8siMvA7sc8t9jkw1LkTf5pM7Q/I915IFmVJ9HoZIsDjKU5/052rbOzfp2JO4vWkHDAEK+l
	GgUO/93F15mlmhKGAJu/fFj/YP2EY0pt8AS4h1jjgGhwr82+BwThemtsfY1Hr8dIBBx7BjoigKx
	ShX0f/+ag7oIUHfAdmZO5u5ggkXsDujPPzeFcDpXggLwYaPuaDrUqY+VgWHqnFIRyzD+P4eSx9n
	dflCPcvyrTOZEOtefcpV1/5Bjk/3KKX2v+p+7zDsfNnbZOcMw==
X-Received: by 2002:a05:651c:18c6:b0:3a6:5c8f:857 with SMTP id 38308e7fff4ca-3a65c8f13e8mr15887011fa.8.1790605936912;
        Mon, 28 Sep 2026 07:32:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:32:03 +0000
Subject: [PATCH v4 4/5] media: uvcvideo: Do not parse bmVideoStandards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-uvc-version-v4-4-da0e983fcb95@chromium.org>
References: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
In-Reply-To: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

bmVideoStandards is write only, so there is no need to parse it.

Remove it.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 -------
 drivers/media/usb/uvc/uvcvideo.h   | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ca75f8d1ec46..adec9d1aa653 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1187,13 +1187,6 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
 		memcpy(unit->processing.bmControls, &buffer[8], n);
 
-		/*
-		 * We are not using bmVideoStandards, so there is no need to
-		 * warn the user if it is missing.
-		 */
-		if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
-			unit->processing.bmVideoStandards = buffer[9+n];
-
 		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
 
 		list_add_tail(&unit->list, &dev->entities);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b41ce01dc21c..0b2c05f6d381 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -228,7 +228,6 @@ struct uvc_entity {
 			u16 wMaxMultiplier;
 			u8  bControlSize;
 			u8  *bmControls;
-			u8  bmVideoStandards;
 		} processing;
 
 		struct {

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

