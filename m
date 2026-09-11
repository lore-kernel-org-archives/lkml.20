Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85FC486BBC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132964; cv=none; b=mT1+q+a7C5Izuuw8ZUrR45Ssh+i6G40JF4DqDXV182T8FPTSicQL1V/SXOG99WU0YYqLz1AQMi1C4GQDA8QqRq73wCtj2O5amySY/8H5yIRwgWllSRxJ/ie8S81H3OtASEmkPZBi+/BTTFC2O8hH0z66CH9Myg69X18CNXV4yds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132964; c=relaxed/simple;
	bh=k77MDK9fsxNk4IGQNE48VDjBKW+78svM58YOT6/utwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfHgDwjpDmBWJNqU2WWgMwnHYzh+As/DuojQ8Q7qHBJkQlmR/Q61B8LlJGxnd6AZ9XnScooKmuWSiGWboBFNV7+QCwUGpFZC/07z/fQmHH1j2GBRwwfuDnQH7B0WRr+MTOBXKebFnBW3AItbaU4Rpe1fwYsyI7L9QAzWIdXcCHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i1oXFx/A; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i1oXFx/A"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a309f92daaso7236971fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789132959; x=1789737759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/+Av6iKHP1iyPdUb9qZJLeMvT4uN92seFRWGWs39TE=;
        b=i1oXFx/AdmCyP/vWyS/aOash1fslOsIiYZJ1Uzbn1KxBtMK93J/1ULMaggahFOhdJ4
         bUnF6Io4fITNq5nMkI15t1fqsUAtmXpqowya8c/FVf5JBfSw2MB29B90Rj0GzllV6DOX
         PS3XWYG2uhT6MvgS6sPrR/tnArAMMOsL6/LoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132959; x=1789737759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/+Av6iKHP1iyPdUb9qZJLeMvT4uN92seFRWGWs39TE=;
        b=Td/vvL8Pj9EZogSUxEWkt9j4rCqNd3NDEK2MDYx9CIjt3T8M0WOnHayQJM0Ky8A/Mw
         p6YS9mlHoFquOO2ZGfKmFWW1qV7b5SIwl5Kd8WN4vS5nhM49e5nSG1QWn1akX5OiylSa
         zzJ+atCbYm3UvdexBCTs8tUaavF3Dev4E1T+g/24lLnupZRf82qX3qBL5Q756KvuLWOv
         xtPxaNLz80AsqIOhcKjrLNTkSKDAnBFSWMDNaq6Q+VOKgreBscuUEL0oFYxe06AzXLWu
         DiBbont4U8JBFIyV3+zD6Oea+POIrBqS6EnRFzsK9WTvpEQ1U9Uq3qDMbVduR/ivK3dC
         FN5A==
X-Forwarded-Encrypted: i=1; AKwUvByZVkDPi7zghhH+ldgxyAD31LCBEC2SqsekbCEAG0hD+V1ayNIyn5JxZKFKCzUPDOr7hLGnCip2sBmbrBs=@vger.kernel.org
X-Gm-Message-State: AFuF++m66sk5Gpda0lwjY9R+Ri/6Q+NOJOkjiMozqZHKjL7qXvDPKioX
	6ex0lDmL3aKSzb9Vssx0DYal+zQz/3uPn5J9pI9/VzExPNBqeRTwZ/dkogBASGb0Zg==
X-Gm-Gg: AYBFou0iutZ8f04BBX62af7yf3XNWFD2R0GO07I2E4/Gt7y7u2VROdTr6zg+IfntIaZ
	ZkU8YfBpfTA3t4xscTcLIPSsnJHXjt00znS+MutPRBDgzrxfR41pMdOcytVZiQUFwbM7iEK6H0q
	D4XKwpPOwlEErqXkpF9KwEZKLmdvJrz9qXe6x5CjAPy/BsZFqAsWVdstEQ3zzqQmKT+RaMHCMqy
	aAU0SouuejMJ8qNRyF3VFVL9VdaGTmX3b6t0G3SgMKPns20KnLVFLtAUIch6VRCwnE1DWStrLm+
	gb+/f7fFKb/mZmxmqYPF7GRHdE2BdktncyR8a9YIGnmsbdOlAK7S9DKxoz6P6TPVRrZPezjzdsM
	7pyzxi/z9Hwz77oGIWJ3q6e3SeYiDCHceECyagannGZv4F8CQ042cvkwR90gBa0PjqkF9SxVWBc
	dv0tCyVVrmpQSakTq+ODXBOtZWJQkmjPzfAUhB8VPqK3SI7B4vWy+ja9YInFqmHO7pC3PRXQqy/
	YQOq/1sNCsrkv8k7WKu3ao9ujmBPofZ+6zCNWd8SncDMUsG7LwKFkI5jEVj
X-Received: by 2002:a05:651c:512:b0:3a5:9c0c:9932 with SMTP id 38308e7fff4ca-3a5a52e3465mr4870481fa.26.1789132959667;
        Fri, 11 Sep 2026 06:22:39 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm6677511fa.6.2026.09.11.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:22:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:22:28 +0000
Subject: [PATCH v3 4/5] media: uvcvideo: Do not parse bmVideoStandards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-version-v3-4-604328d8a0dd@chromium.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
In-Reply-To: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

bmVideoStandards is write only, so there is no need to parse it.

Remove it.

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
index 8d99e857a69f..65f232de7821 100644
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
2.55.0.1007.g17ff1f9808-goog

