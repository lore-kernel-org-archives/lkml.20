Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793573607;
	b=O/GGcpPxvhmDDzIIPg2M6DQSyC2fdhUhNHI9mDGOHAYynzYl6TRrvE33teGJVyOgRB90
	 5hgQ5fuMbNO2PJTRD2CdLQyVG3YeIJnFTV3tUJCEaDouQKBMkycmezGAtiA7Tz0JtyMEB
	 gsD2a8vz3ywzoWP9ogcWgBkwhAtNNVB/0N6AP1Ii/uO+Mc1WkVEZK8Op6Db5eSw7mZCpW
	 YIVF4kucxauVwgD0nvZJNbmtZ11FxcXko98e88mie6I8EOHPp/xGSK9f7XFNK4wUbIF3w
	 wtZD0d4hljLNqhIDHJIDAeN2a6T/Ewdgni8TCvjEKK1qyUG+yGabk9JFoHbAJl5GWwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793573607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s7+GOe5TlTu09tPuJuAXaS5FmzeWJcxHvWMkwG9Tvkg=;
	b=SHSu9ylb+Qy6DL7KWeXDge4fiWqGzwVQVKCnH7S+GTBUAzGeFlWazODvlo1UzhOFJoyi
	 CIS0ItW/f1ag9LH7eMtirEqzkDbHtn70om6ZeR6hyPzxTUX4lL9l7/vR076DDUxKfyU/9
	 xaNMbEbadk3s51quGgKuB51CdBoUtsRx+QIhg0TDEl2je0GOuge9PZgJslnvtvQIJqH15
	 D8bdc8m9VrIyCnW08JRwEsL1ERh3ysi/odR/c0wAfxfHGneWo/JQ1z8YzAhjGaXErdTMs
	 ybsognDZI27QJYNlR1YWMpWd7RwywiBKcJq2BrU3l5TVBcnot3P02CshKJJfwK6m6AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt+xcV6m;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1375C606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1375C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt+xcV6m
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab3d3c5761so21539567b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793573606; x=1794178406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7+GOe5TlTu09tPuJuAXaS5FmzeWJcxHvWMkwG9Tvkg=;
        b=Dt+xcV6m5cRh3HzDi6la1vjl+eDGRzkv5To6LfF5i7pFI371Pn/w6vpPvwFjlAQXbu
         ld97R+/8cySxY+WLdJSXJsBpvo2ZiM8IhCJMTyfJEa2HXWJeZGiz+2NZwey33Ob8UdKt
         rHW0xr/SQ4OVrzRJFjb/NHwOUHhrUCbxuzD5u/Cn7KAR7Lfxc2kfvwQWEGmdZtp8DTnl
         Z2rmjpYGRHdrAbd/5xbWVXRHpvOBVr2YcYocBQmKsX9ZjJBQb+HcJn3usiWcBNg7GxSs
         0uExB39On4MpWjYp+btIRL+RHzFFXiWzv+pCG4qHEo9KgfcSdlEW1UB2QwDkbwVc4MCz
         U/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573606; x=1794178406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7+GOe5TlTu09tPuJuAXaS5FmzeWJcxHvWMkwG9Tvkg=;
        b=NWe42kDa5NQQF13a6wPDRY0d8xRZyK8cRYvPUUo6CZFQdvIIEgJJnkieribG1UhDYf
         Cc/8bAoywLmaV89dbLzZOi3vxJ5RMLuAuvnPzTGT542y9bXQEBPVYEdAML9U3TAIkPyQ
         wg8YpuW3gwYQ+fRW9vuW68SqNzop4g8Vc+eWpzeBL3Xn/TaGK4VddZ5nezFUdZz5ryTO
         vEc+v/3zgKWcSeEHmrlp98b8XBjechQxIKIYGkvrdtEMfh27PIsvcl8/qyOcDzt/vVfk
         nY/Eq5TlIvHdtHMlrqb7BHx7Ew+DXpGt2+M6HCFVoOBsCRjGMsOCqQZI9RFsom99iMUH
         VHtg==
X-Forwarded-Encrypted: i=1; AKwUvBxv+2sH87htuPXMkDy0Q99j5Ph40caRDd5tXFujxJE2MutQEbLUqfFKNdRMHM0hLs7C4psq2ahNPDYPNVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHzGTuMen4YW7Atusq7pJKGjvMltsxBvrSNimytEjPReT6HLvy
	ceuBWX2lwF/M3tqkJwvtd5SpUHBgBSCH1MySsZYVfU8Z2cQ0NQMQzEnRqjVstw==
X-Gm-Gg: AYBFou09D9avRncFH8QP0+bCH4iQHG6DfIxaDhe3WLn4um5Jnl1i8x+Z+F+gmBjK6I0
	XX96Id/XJ4ytuj1g8HY8nIsmsg6rFiT4mF/ykXjzCCXRwRvZPrmOJIvNu04PUB87RgJ1v8fFx1i
	2PSZpA86270qGR7UHgHdSik/RFjjxt4EtYgfWPscbGuUqyCbQTECabf4SXoEyejqMWTRNFD1zqe
	AENWYWSc7bgn99L1L52m30vBB5quWiPixCa7n6XxsZ4yhUNdZGzfWK6VouMIhic3dDGgyhaX/dN
	34IzMQ+6brF7xAeXmaawljl4FNCSG8uVQNwQG8dXv7zxFHDIYhSUNibm9WzcuLIZyMa0X6KXBds
	nLzm83fisowSjwLEM5GeMyFdL9p6CuCoNeokTwVSCaXq2wWIO7jDm6eSxT6iFIksd4IFn0mBKlF
	DnvqruqXHJ2QE38dZDtLg/Auu7962zITHoaob71mnspEdQyFmLZ/bcoOVYiBiseWk75gtyUoEJ4
	aELZl758wQCKgj57RIW9L4Y8rGEHwlE9XK8xnN1sVNkekn85z4LgHZea/ZpWeM6DTl48mqqgKFb
	/bk2y6o6qtAQYUGmhgLJ9jgRFY2I4i7eRDajo9ivyPi1NIjXOW7vZhtzMKWEsUVTgNaNnXDzpvP
	R9RaUrR+HluvrxIlWM6gTvgUBmA==
X-Received: by 2002:a05:690e:13c9:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67ba4c806b6mr7372011d50.14.1793573605653;
        Sun, 01 Nov 2026 14:53:25 -0800 (PST)
Received: from tux ([2601:7c0:c37c:135::5a87])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71b70fdsm41846847b3.43.2026.11.01.14.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:53:25 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Riana Tauro <riana.tauro@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/xe/xe_ras: Use xe_log_info to avoid passing zero as error code
Date: Sun,  1 Nov 2026 16:52:52 -0600
Message-ID: <20261101225252.556741-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.56.0
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

xe_log_err() expects an error code, but in the case 0 branch of
handle_page_offline(), 'ret' is zero. Passing zero to a function
expecting an error code is incorrect.

Switch to xe_log_info() instead so that an error code is not
expected and zero is not passed.

Fixes: 12b427cf8bb0 ("drm/xe/xe_ras: Handle page offline requests for device memory ecc errors")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index db3cbc186a51..7942a2a48887 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -304,9 +304,9 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 	switch (ret) {
 	case 0:
 		action = XE_RAS_PAGE_ACTION_REMOVE;
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
-			   page_address);
+		xe_log_info(xe, DEVICE_MEMORY,
+			    "Poison detected at physical address 0x%llx, page soft-offlined\n",
+			    page_address);
 		break;
 	case -EIO:
 		xe_log_err(xe, DEVICE_MEMORY, ret,
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore

