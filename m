Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9B94519BB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170263; cv=none; b=Tj28QXPA9gLzfQF165lFZ2eCeK7I4YqdvSAQmTAQR6KIXfu/1h1RFOWJYS4z4hISF7YmYHmucYvP4V1gk8SWzfCo1VuIOQGr30S7HpyAmCF78iMhTGKx9ZKEyedcWWuSEzLdH3JQBuWDN1zIyhXS+91Xi5oNGSji03ky78mVHK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170263; c=relaxed/simple;
	bh=kR6ZMycAYu+JXQaokJoeRAca8CcTzwMI8IDFajQGxDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPs7+c79mopagjhSGSkmc93KdTMc8lEBzfiE2u+ybgPxrMbWXZFquHimT/wzghN2JQspfZ1kyA5Vs+pqzqqttZi0uCV3tgx2ffPCXnq59M0wFGiPhrFLqHS5414SWuS0h7yLfGh/+NOrlmCcVnKzyWbR+E6gstu0yx920aCBGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV4e6ld4; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV4e6ld4"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac92391681so64431a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170262; x=1792775062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CW8x8+uhyj3ukfLv0uTbEFXfFQ+XLujbiKlxRUfHWg8=;
        b=mV4e6ld4/yrAt3ehhgfkCFy1ksPQxonluegORSe49dq589QpxwaQAYi71a5OeQIxdW
         ev70g99CjZEiXUJTJLwPeORDb9l7FYXnLcBW2qFsRgqU+vUtIUaKUUepWdYMB0wSaUTs
         e1ajZD7fkntRYxpEwFAr1dzFyu/g3nwCjSHEfPVGwFai5NHj/j+2zBCzt/cZA8TwNsPO
         /gD4dYqQZZgGVxx95OvF0zdURo0Of7t9w1ge9GzlRnwUfqh2Ro4rBZeacMICwqRmaBr+
         Qp0XB6rA0SoMMsjyForQZhkU9LdEXIOTlD9cvcGOeyfvv2CDQQTCnQy3zXiklusE3uaF
         5u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170262; x=1792775062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CW8x8+uhyj3ukfLv0uTbEFXfFQ+XLujbiKlxRUfHWg8=;
        b=TcJwLUMez23M7CsAfZoDBQiYVxexTiMka5A3xSn8jGWkVGGdTAvtqGOO/d6nyUagf2
         J5UTMm/EyZY8ry1frT7piQqYWrh57QaHiXkAkuhSdcsjZjWxoqPskm7HSiz89bRcZKYL
         lzwa3Fhf18Qpvl1SLP3XwqE/W3hSxusOM0AQmAydyFUqD6Yu0hKmBmyfJrShMGLiFxBj
         5BtRVwVR+8HKcfd69Cdg9DyiMNCVXadp8/lGARql7yolNPDhgaSkscUNGHp0/rAdmVya
         PJ5xq8F4r8pgGwXKhRAUjgKcF8ie2oUSITpJLWzOcyYffcVci6OibCn0n+b8iwYIQsD1
         VWDw==
X-Forwarded-Encrypted: i=1; AKwUvBxVUxPorKSCVPwdYRY22nnWmTor2uoXuyqDZZqkrhfdtpS0vQ4Uny5IYYqhiUndQPWuRGUXt+Wm35R1jCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzfRrUtHGGOlE2h+RE7pIf8kvwpcoUuu8AxJZSLdBn4bomyM45
	my3mbLq7818e9L6o9PQTt0rzbftR+Zr2d3g3yRIpDzeSOVcaQh+sbYpp
X-Gm-Gg: AYBFou3wr/OTNtjZ7LblMJz7wILl6mQuJD0Q4R/oDcm3nH792j1jgsESGeWs9yp7SDz
	eduq8JhgqWaQyX+Jlru1zcKK3CfuEqDWSj9xoN9/AzfNihjs5s7nUv+1szB9JG//XqkbWfwOkWF
	G7d2DwwxVq3Ja/CFnMoz5K0FPj1XcHLRYUOcxDSAK7CyE7Iipjbd1XqexozVnxTCsJa1Wad1cKm
	FnhLupL+FrcHBUdGyYjqsSM8lYK4LY0SXsM9DS39THZOmVVl2bXWWVFN7sN9Du3EPo8b4RCVD5K
	aax4W2Bh3XlYaDPrWKnVIshx5dPbXB/fE83xJtjQOYuHeYeGFbEDk7I7ahjVyOy/rVsS2oF4VL+
	Z9Tj+OpKHviGjJPnTidEQIsG3Qpdicrf7qew38+QBxVpTFenfEmTIm47nVfztgqVUrz/7XPgtN4
	GZ/LW3FD42/bLSnheSHkDGLvAfpftjyITycePiNW49Yrn+1RRALbpDsGBCuix6Ywog0VJS/teuy
	Eouhu65VPfJfa4=
X-Received: by 2002:a17:90b:5450:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3acef0f47efmr352213a91.44.1792170262004;
        Fri, 16 Oct 2026 10:04:22 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([223.104.67.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm9928587a91.0.2026.10.16.10.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:04:21 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-kernel@vger.kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH 0/5] Input: replace strlcat() with strscpy() in USB input drivers
Date: Sat, 17 Oct 2026 01:04:06 +0800
Message-ID: <20261016170411.51025-1-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several USB input drivers build the physical path by appending a
constant "/input0" suffix with strlcat() after usb_make_path().

In preparation for removing the deprecated strlcat() API [1],
replace it with strnlen() followed by strscpy() into the remainder
of the buffer, as commit 34b228b739f5 ("HID: usbhid: replace
strlcat with better alternatives") did for the usbhid drivers.

The series is split by input subdirectory:

  1/5: joystick drivers (pxrc, xpad)
  2/5: misc drivers (ati_remote2, cm109, ims-pcu, keyspan_remote,
       powermate, yealink)
  3/5: mouse drivers (appletouch, bcm5974, synaptics_usb)
  4/5: tablet drivers (acecad, aiptek, hanwang, kbtab,
       pegasus_notetaker)
  5/5: touchscreen drivers (sur40, usbtouchscreen)

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---

Shihuang Liu (5):
  Input: joystick - replace strlcat() with strscpy()
  Input: misc - replace strlcat() with strscpy()
  Input: mouse - replace strlcat() with strscpy()
  Input: tablet - replace strlcat() with strscpy()
  Input: touchscreen - replace strlcat() with strscpy()

 drivers/input/joystick/pxrc.c              | 4 +++-
 drivers/input/joystick/xpad.c              | 4 +++-
 drivers/input/misc/ati_remote2.c           | 4 +++-
 drivers/input/misc/cm109.c                 | 4 +++-
 drivers/input/misc/ims-pcu.c               | 8 ++++++--
 drivers/input/misc/keyspan_remote.c        | 4 +++-
 drivers/input/misc/powermate.c             | 4 +++-
 drivers/input/misc/yealink.c               | 4 +++-
 drivers/input/mouse/appletouch.c           | 4 +++-
 drivers/input/mouse/bcm5974.c              | 4 +++-
 drivers/input/mouse/synaptics_usb.c        | 4 +++-
 drivers/input/tablet/acecad.c              | 4 +++-
 drivers/input/tablet/aiptek.c              | 7 +++++--
 drivers/input/tablet/hanwang.c             | 4 +++-
 drivers/input/tablet/kbtab.c               | 4 +++-
 drivers/input/tablet/pegasus_notetaker.c   | 4 +++-
 drivers/input/touchscreen/sur40.c          | 4 +++-
 drivers/input/touchscreen/usbtouchscreen.c | 4 +++-
 18 files changed, 59 insertions(+), 20 deletions(-)

-- 
2.43.0
