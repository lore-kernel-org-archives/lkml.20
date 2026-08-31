Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB24A2048
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200356; cv=none; b=uQi1V+KH0RYf46vLuxmyeiA8clbJW6Ohk3yp/48bwfqkPyY8f/V9BtxCFLt8mh9wZ/inwcVCAEVjjfjNckbUTV8CzeFV10zMoIvcs2+ZaLl41AQ26GlExOjmw64n9n1xC8tL8yVNfAllfZnZWAASJfgLBpbN1Ae+HqDm3emiOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200356; c=relaxed/simple;
	bh=38NdsR7peVgmU+Oqd+nIHCO2SJKGV8pY8vX9DgyGykU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhUsApfrvRRIT23tPUnexBz992TSHtBMKoT+YS+UFVUZA3mKy46gVbCzaisVGJcNfgCqXLbnILPG4k6lRt4JdjOV0Tsd+Vq21nDO9QAqSjWrzT8QWFtYxl8jpAdd9DtBYK38rT3X4UgN6C42axRa8bI8lciTEGfRS1U/o3qb+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cit7pU/8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cit7pU/8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so13803615e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200353; x=1788805153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2abaWYtjVKV9VZXaLgXVyTO08oA7zY/lp6O2BFsx6Gs=;
        b=Cit7pU/8uR4akFIzlwQcRbKgon3icdWxW+vdCJbXVuYYaiQ4PWUfeYDMMrFfGG/49t
         uoH4KJDe9p2uVTA4qqcysNfBOg5JM+4LGxgsmYu5ZRnIe12Ht9dqLiDmxjiiEKcsMaBu
         C0B+wKDUZjZRkBZcr3IvbqYe7FKC7EAzoyysY2E5tBDGdNE4WWcOL5wF6IetKozFBoyI
         UUeYnsOLp2VWJupurv8G8GmZjJUZC74NzAN3NcoeCayCPxt5OYsFsAlbGmWPPxyfSSiR
         mrJtIpcKi12ZXHZJAWuPpDuiRX2/rc+D9FJ91v0Yn/tEoRvIASujSEs89oFwjn836lZH
         HbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200353; x=1788805153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2abaWYtjVKV9VZXaLgXVyTO08oA7zY/lp6O2BFsx6Gs=;
        b=Sw9EW1MZLEuKwSQ2vXduTEc0qz1ijqt9O0DanVoB+mfEX46LxuMjnslq0BS76jQ1hD
         Lxi/YJWPIKfI+tt+vr2r+444MQdaEleUvuKXIDt9Pa3yHzKMOlTcpoWPePJxCkNHutJr
         +gOjo2/Yhwyb/fifIT67I+nEkzPjBRmwlS5BMWtJYvze7tmXooTaJF6OejwqCVEelrII
         00QkO1DuQ/IxmUzU3yeg73zROaeRWlMgZ4ZQL9sMEL2A6d0RFnY80zXEra4HIelbscpZ
         wlnr0rc0XUAsGOWFPeoSRRE8x+W9haA92AUbLh6bwRrUNPU8dKqzYc4edc6oZd6/VZuG
         3OHg==
X-Forwarded-Encrypted: i=1; AHgh+RohGYu8uVQoszGATE/RyDufdNoQ3JZsMXR5cSiTK4msq01cg3Tb7kXhq29605RONbQeMHKqQ32h8aN5jOY=@vger.kernel.org
X-Gm-Message-State: AFuF++ktkuwXgZvbELD8MK43ugZQzMDaGQeIPtYoYrUAX78L/DkwVDvq
	5GENdN4MWgFLjpFdmEuJX4B1wK1WlaMRpzd0zbqATfHsc1LKK5Yrb/nc
X-Gm-Gg: AR+sD11cUyhmN/Tz0OxSde9xPf/fyVHt+OK4bn2hJ25dKe9R5yMOzpxKPaL+3Ch5be9
	mk7rlq+Ud1394xzlUqIn+gRlI7CQqtMniw9AsMd33h/kRHv83KMb+sTOwEHvR1as5ahcR0Eo+x9
	flC9QX7pxjcvDpn2QlLeeSmRyCvO3RGK/VsYoCTrUZfaT8sNIupK9ZB66YoCg7ywL72YyiTnqGq
	td692JXVZ6pqZt6VWWqfCh4wx+oQhyWUcE81mX0MhDpwA0rVb3ypvVt/tpohAdUrLsZvw2LaQ8l
	+ghKVipCaQahBvMLnBaSNZg5XUanA4HJI3qN+pOdPKlLi4OMyrxSo0lX9ZmlsM1In9SjTRRFNyv
	2YoBgNycHstwkZExon9cf+SzpsKF8QOQlZ03E0cU7nTDcFecdUCO6gaU6cU+MVY6uM4TFNUlzsx
	F3JOzxynxlYr7yMxCrETyaCqax9FnBzFYwxo9MEhBdpshLpYabWkTcUqpvG3PQcILbPoDiXAMQw
	m6D4qrw0EYw
X-Received: by 2002:a05:600c:4512:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cdc14d69dmr51045145e9.3.1788200353295;
        Mon, 31 Aug 2026 11:19:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:12 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 2/6] media: ipu-bridge: Add OVTI5693 to the list of supported sensors
Date: Mon, 31 Aug 2026 20:18:54 +0200
Message-ID: <20260831181858.325109-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPU bridge builds the firmware node graph only for sensors listed in
ipu_supported_sensors[]. The OV5693 is currently listed only under its
legacy "INT33BE" HID, so on Intel IPU6 Surface devices that enumerate it
as "OVTI5693" (e.g. Microsoft Surface Pro 9) the bridge never wires up
the sensor and the front camera is unusable.

Add an "OVTI5693" entry. The link frequency (419200000) matches the
existing INT33BE entry, as it is the same sensor.

Tested on Surface Pro 9 (IPU6).

Link: https://github.com/linux-surface/linux-surface/pull/2171
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..131c70844 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -95,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
+	/* Omnivision OV5693 */
+	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
-- 
2.43.0

