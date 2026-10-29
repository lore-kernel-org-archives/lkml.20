Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292862;
	b=a2ej6JfC2XqcKWkYRT5CAepOxxHmq7+4mgLSaccmx8A1jxsZsuzdDp1gQQSzTT2Zjc+p
	 qsXfuH/hnAxA1gd2c2ljBvqfbNZhtOCTzvELDzVpIHCKrN/4rrh2x4lICneE/Ey7hgC7/
	 rt6J9DuF+ic6kNx5tnCC9ZAA7cseczCQ5czL+AQAfhMVCWInD74oy2fEBJjKOLCatXNmJ
	 7xU3Vc6yktCZZIReQCSEdo0DJFbgO8n55BEOJWvLjms7QsP0xDqwQOtPDFDAlvwH1sDvV
	 L4WfQ/Ezj39UvQaCff/8S3C0L3Wdh72h/vNxY/qVpwiEEOAx1g+1psn/C9NuCwHx4OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=J4pAOPgS9W716epwH78Po5MHQbnVReeqlsW6HM0gOd8=;
	b=Y/LwLH85bE1CVG6J1OYk7W3YUMeKP515yjrb2QR82rJ23qRY2nNJ3T0NmmKdMoeSyNLV
	 FKd/u61U6Zb2PuGhqyXlhWnQnhBJi5HlmTifhaXohmCv3O2fIS6SgsrIJo0lzWNwqYeOF
	 muXIiSXthiiATU0PjPc7SdMZmi88Kq5bORLMI+7HfQPR2b0x1kcCpPFEgbRXYxhC5ueTx
	 DxhOOTENWHtBYewWpOjfbr9hmI97myHUkCy9IzFoUJByHzCncRSzPTT97oyKgtgF8kEq9
	 dRfA2t+ONMoHht92ghgw9kSF4eihVPN1Xr+ZxPOgP+4xF0v6VXb8JZTgUvcVXiQR98g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oIXd6otr;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2903C606A339
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2903C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oIXd6otr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso13835335e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292861; x=1793897661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4pAOPgS9W716epwH78Po5MHQbnVReeqlsW6HM0gOd8=;
        b=oIXd6otrjIIVji0vg2hQ48i+hHVpZP9wobjeUmIAeNwUl6BZpjtbCGkMTdcdcYy6Ca
         XBDiD3/tHx1LSEV3mtxmDYlDyhaQfQTSdMLrWHOf0pW4le171pfCw2z1DMAlkGGZ9vuk
         NQQAazR4fDb8fi89uxO6+KTfrjnNIUN+ANdsaoLwfaV/UUcSij9M52mpd/3uGmvLySYa
         KQ3bKHdq4aCxY8tdPbV5PxKHQ3JkLoOkHRBjdT4DTcnkmkntKQVlMh7ViUQYf7eLHil9
         luiHRoIMtTghae4OSh2kT+9BsUAC43DiuPp70P7gLTDptjSpu2/dmZZ3PJ4SGsoKM14g
         qT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292861; x=1793897661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4pAOPgS9W716epwH78Po5MHQbnVReeqlsW6HM0gOd8=;
        b=1t0+ujkKLvADkMbShe9ntRB8JmRB+mLPTYqkfgqcRZqtOSmD+xmURF9yF/xM9y9ekN
         kHYmQ5NJSjI6gvAyGySoupyGA8arNLdlaek6FICBvkddm4ZQFzAsUUSHWm3b6eADqlW2
         qOjjDdYRuDXwqoi00+URrS6zAyUoNIYQ75ruP4sMbNj3hUriEibzerYEzMggz80phJ1m
         ZqV+1kFZ/3P6D6x5Uw0Ifi8N72XNYVMOdIGNRgNzQMNyXYV+6TgqV5T0lu813uJie2Si
         jheWgK/7TjrhB3nFyvbOF909Ni38rWgZSB5ApRVToK4fVvPnbxJVqJJHo44LnWReNMcP
         RLeg==
X-Forwarded-Encrypted: i=1; AKwUvByvuUXyn+egeGluT7slZfeDw+HunYHiSCJxyQBoj7QsdCjy0L/yQB/8n9NB4mrc/wLmzDXjx62Opl3lmKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJejhXPmcdRHCRXXlk1PTqmtRskVDj2QNd5HiRLnGALxHXa1zB
	PUxr6MbV105Ik83vRrNUeuVmSqetR5MFCBIc59pxEejIgMFeKsAd+U/GP5RjcPnoX/4=
X-Gm-Gg: AYBFou3d+ZvEoX1O18jVJ0/MtPC6lLdDB7fINYz/QzAFZZ8JqmxS71VO47FuyTfE9rI
	OU+Qnn3ojpX8IXrzlkYzqQ8PJuH5s0y+g9qfzVC+k3PEXIN/d0L2OgpN85Zl7kObjk4lhtc1OPN
	ek3c73vPF0lV5aUWHA4spVmJ4s37CSsJykssQAE0mgkFiD41YIOhDKGl0rKWash0WBj6qItcjBq
	NAsmBgwyLzhwdCverhN253TzShbxzpffox+qS2Iwydx3tv0rCLsmZPllYLn3YuTiRnWVBd8Din7
	Wpmzmhxxn+Pmpqchc8kw92cAS1e89r+krQJTrs2AjE9nYnD05hU7RN4yFL1CubEOrEZUr39viqW
	5cnhgczNUMBakEwfA938/6MjSLtVEDdAGdx9qAdoi9jDcwuU8Qns8t4oGC0ap2mEqS1yakgAZ5M
	+mKIr+LcqCWCqwFjsGLg3EjSpx7p24t5qp3hkmDCGlAYzDZ1ckq/xy8DHp7v3QW+4FA8g2L3DRF
	WMIlgqBPgrFNZsy9sKC2Ij6qMtGZ4ttizkDs81LVtAz6qo7nIYdZXjR1TCMAfy+J3WhtGnTUnj9
	Toi2I1ZHh0RsecoaKJrEnZYRK95mv9NAdnq1gwRXGok=
X-Received: by 2002:a05:600c:4f95:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4a9674e5040mr148100035e9.29.1793292860727;
        Thu, 29 Oct 2026 09:54:20 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:20 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:15 +0000
Subject: [PATCH 3/5] media: i2c: cvs: Use named initializers for
 acpi_device_id
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-acpi-media-v1-3-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=1024;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=8HOI2v0oQLToY7ZJC/9gFqHVqIgcGwCN9OivttsRFBk=;
 b=PzlE0YHa6iBN8eGWQ32ssMk0D/RIi7xpbgLUYxn3mBTapAhw0oz0ZTibY8kd4C02dHrQjYpXf
 FlLJVauX6DsBksd5kJJ3R2NC84X2KslwVXJNn1vBxi1nDgZd+9Ex0EK
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/i2c/cvs/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index d9c51e1c0fb5..ce9f45cf942a 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -961,10 +961,10 @@ static const struct dev_pm_ops __maybe_unused cvs_pm_ops = {
 };
 
 static const struct acpi_device_id intel_cvs_acpi_match[] = {
-	{ "INTC10DE" }, /* LNL */
-	{ "INTC10E0" }, /* ARL */
-	{ "INTC10E1" }, /* PTL */
-	{ "INTC10FA" }, /* NVL */
+	{ .id = "INTC10DE" }, /* LNL */
+	{ .id = "INTC10E0" }, /* ARL */
+	{ .id = "INTC10E1" }, /* PTL */
+	{ .id = "INTC10FA" }, /* NVL */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_cvs_acpi_match);

-- 
2.53.0

