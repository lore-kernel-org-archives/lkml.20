Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E335BDC7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035540; cv=none; b=NeS7Nx8vnhXMrR7ULLHNCk1YMUG+ntOjAl5tmhd2UEi7h7tUEIBW6JXWVFnZ2uTckl1Uj+cEKYnSPh+NIeyVFNz3RkfZi3MW3vkjFdG/L8oo/LTr6Mu0f4+3c11A4qlj2jt5NmWXdJ4ko2LG/rNSA9uLXcZB/Y0wE0cm3p6EYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035540; c=relaxed/simple;
	bh=Xk4H1w32FM2iXsEbHrwm7ZAgZdm0OsRsbRpsDhY43Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cg2uN7NAE3Ic7QWXOhBCXO1hbACxMohySgAepHx+eUmepQJAg1YMXNa1LJr1EODoueXmi5iP0SO9NlNDJkauxkptl9sInXs1RY7zJu2C/3Y3imUls8c6ZFtrQIarLMxQCrG19XF5iCHjxSJyzLC0hGAeyR5HQvDJzY1nyYCDrWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeQETKRi; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeQETKRi"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ea63f01606so52174e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792035536; x=1792640336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL3rBmSaHlPTL6GoPLD7XvMOLQUruV33NZ3+k7WKHNY=;
        b=TeQETKRiOeZ0AjKwrTAAy1CZmTjZ+Ix1CyJ0e6r7ptP9WkATt5K8q8J8dkZkzpuxdI
         9RGQiDB8zkmOwYvtpBIzNjYXVPetGH1E+WSBzN4QZf6RXS8Bszx7RqFDJjWrKa2PtkQt
         W+Wkpy0kItDNhwdDeZlnXllxSqzKAokFCrgB5cg/8vjXlivxwRHM9sBiY8AFxNuVjIpz
         RYVhtT/uJqQo7KOrlKGooPmW6FEPaYkv+vgSuqVqZF82NQsielr4oPjqQR9HmYVeTz1f
         CBN9EfUdrMqP0o+3VVDOTDyFhVhmM0GXJi2HoPBaZmlIbtjXX0mzi+PfZUg4byjNexnR
         etDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035536; x=1792640336;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lL3rBmSaHlPTL6GoPLD7XvMOLQUruV33NZ3+k7WKHNY=;
        b=tujCgPPcj+lZsFy4q210gaRKZo+918nZlspKA5uMOgu/k3GbWQVbG2hDOkLRiXvIY0
         WW9LGkOf0+cuGKW+q7bYd5Xo+KP+79x4x8xNQsMEv1zp3shdtj9/mXWME1iwo6gCW37H
         /tZXCfvA58mI+SzmJonxlHOFNsX71bEl+LOBDdgFWbQVQuXMzP56+fzlDoPWTb+Ryh7S
         9LmRqW3DA0UeYoCLfXpJvZ50ll4W5S0LMnmNfHklrpHRQ/3rULVX6lOWTZC0ITo2GX66
         bS+vFcazrxQ+Da/bBiKdK4Escy0gF9R+xpzqxeCXdVqn7UItup/A7jxLpNz/3WNU5Tvd
         ncLg==
X-Forwarded-Encrypted: i=1; AKwUvBz5VNBiBQNkbLtaGwlHxv8MSwNRpVzcQpO60JoiNGFFzmuNQQzRoCgp0kEJI09TiLP6psMIrESMbpgTKco=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo6PoGbHQjXz+LkBtczVbPYQZfDAMvgZ+vcL/gfJsGF8PQOi9V
	Y4lJsQSlcOVd8B1bjdV5iHGUfAQay65M5n8uvp4VZNxhLQ5CRrND1UId
X-Gm-Gg: AYBFou2mpv7+G4P00+n4UxmtQkilBPEVhAzYiv4hnzBV6EhgrxOfqV/wm+T5pAWEyQo
	AGxL3OawFUlzxYqimrlpLLwvuhmijBgSEvAL2bCuje37h1joM87T/MnKgg7E6abOMzyQ3x2aB9F
	RzcspQsOwdcU8wjDUwrkbwzgnkYf3dXWMqv5s2a/lgcFCnGbaczxyIrIISS/OcG00n3bnfTFguf
	jTEYO48TsY2lrt/4SeTBs04qC61jFCmHu7Fi3xzS8MhAFLOT4swMBM2ECcv8OGojk3As1LeXlKE
	gZ9INBHLvMLH15cubLTD8CKSrdVeVc0DHCpBs3axnXx470MiCTd7xiSFv8O05YLfaZH9y+UrvFq
	AxEh3CKA9eI+p+mX9QiQQ4I4mbitmSjcFBkyorfH2U0k640uH9+bb7TmRcU5T257DNuPA+bYdQo
	c4MrHf5CmMrc1WUKA4OEDHPjkYDONkjFL4Jbd4fo7zOh7pWMv1eZ2PKc/hyo2rrWKPK9weJWrmM
	10wxQhnih2U
X-Received: by 2002:a05:6122:4b8c:b0:5d7:2918:c648 with SMTP id 71dfb90a1353d-5e91f46d8ccmr6133267e0c.8.1792035536241;
        Wed, 14 Oct 2026 20:38:56 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:58b2:f893:fc2:ec6b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cbf7fccsm12099016e0c.15.2026.10.14.20.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:38:56 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (minisforum-um780xtx) Avoid overflow when rounding threshold input
Date: Thu, 15 Oct 2026 00:38:41 -0300
Message-ID: <20261015033841.390615-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SYS fan threshold store path rounds the user-supplied millidegree value
with DIV_ROUND_CLOSEST() before clamping it. DIV_ROUND_CLOSEST() adds or
subtracts half the divisor first, so inputs within 500 of LONG_MAX or
LONG_MIN overflow and change sign. Writing LONG_MAX then selects the lower
limit instead of the upper one, and LONG_MIN the upper limit instead of the
lower one.

Clamp the input to the representable 0..255000 range before rounding. The
result is unchanged for all other inputs, because the subsequent clamp
already limits the threshold to 0..254 degrees.

Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-171941@kernel.org
Assisted-by: LLM
Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
---
This applies on top of the GCC 11 build fix:
https://lore.kernel.org/r/20261014214522.243253-1-speyrott@gmail.com

A userspace comparison using the kernel's DIV_ROUND_CLOSEST() with
-fno-strict-overflow shows identical results for every input from -300000
to 300000 across several limit pairs; only inputs near LONG_MAX/LONG_MIN
change, and they now clamp correctly. Builds without warnings with W=1
using GCC 11 (module), GCC 15 (built-in, sparse clean), and GCC 15/16
allmodconfig on x86_64 plus GCC 16 on i386.

Tested on the UM780 XTX: writing LONG_MAX to pwm2_auto_point2_temp sets
51 C with the current driver and 99 C (threshold 3 - 1) with this change;
LONG_MIN sets the lower limit. All other rounding and clamping results are
unchanged, every value was verified against the EC registers, and the
original thresholds were restored.

An LLM-based coding assistant helped analyse the report and prepare this
patch. I reviewed the change and the test results.

 drivers/hwmon/minisforum-um780xtx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisforum-um780xtx.c
index 962ebf41ffb7..bbd77a0ce25d 100644
--- a/drivers/hwmon/minisforum-um780xtx.c
+++ b/drivers/hwmon/minisforum-um780xtx.c
@@ -205,7 +205,7 @@ static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
 		lo = points[0] + 1;
 		hi = data->sys_point3 - 1;
 	}
-	value = DIV_ROUND_CLOSEST(value, 1000);
+	value = DIV_ROUND_CLOSEST(clamp_val(value, 0, 255000), 1000);
 	points[sattr->index] = clamp_val(value, lo, hi);
 
 	ret = ec_write(um780xtx_sys_point_offsets[sattr->index],

base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
prerequisite-patch-id: 817e6d58067db84010e9c7f4ba73d312275021fb
-- 
2.54.0

