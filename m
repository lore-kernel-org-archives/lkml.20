Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D442299922
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648545; cv=none; b=uWXWvWqh9MZ66M4nuRPExPhTV65XjKGzS8s57GO4TRSsXHL4rBh9KjfBA6hOURRTv4SDfAypnsJwHeuYujzHvOPGz4GqArt17we78+F+zS4mVdg5dW1Z/iWpcoQqY8lNu1CjynJQGK9Ld9DX3pKjfiNOQRE7t3+IoZ6SQm8/Xo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648545; c=relaxed/simple;
	bh=kyMAlxwnOfHTSNvgJBI7qVIQ6wPRvlwE7lq+wZpZTko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eEMQayPSiIa9toSyK8QfCxpgan2UwVkWwRPq3uPE/hp9g2UdZtxpC/EB9C0MBihs1ehPTGRaf/0oCEhWu77mZrgVYM+Z4Ow3ojxgy7E1+IRJOlKWI8a/OOw1All31VZyQIJD6ZJY4Ny1bwo3Ym7OGaL9utmhFuT6QbHagYTbpk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTtK60Ze; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTtK60Ze"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d79b1f928cso1157591eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790648543; x=1791253343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HvpfcFKcE/JRoU9XlOpiZhwmSIMSz6rVCTYuDZOglLg=;
        b=GTtK60ZeHzr7YsBkImQU3R8i2L/dLqZ8Oouz7TEMx62Ay1S2KsH/Vgld1B8/7UNVDN
         l8A1nPKi8eNQBtdD1VeRqzOGIm1avYEhX6boQxS6BzsUWc/L1IpARlu/LGCWmkTVz0hd
         L5VLTszNWzzF9etY3/2oE2dKEpQhsLylrotRFrGljaMWivyNI7zM2TQPy1czuU256d0A
         tppqWIctLkS1N98tfDx7wC074EJ0nZtJypYGUPY7YCK8naf0XtVDHKzMmgsSSuejP2jE
         Y+IxNfduLScpgpkIt0a28ODG497tfYz5ZiEvnpqbXdMOVCI4g61090qIaxmlub3SaT92
         sY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648543; x=1791253343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvpfcFKcE/JRoU9XlOpiZhwmSIMSz6rVCTYuDZOglLg=;
        b=kPEerA2LSRz2i9i4Btpk3MztLFnCqWcOLx1rtGkuGvjxiklGq96mm1bESsVeMVOHaA
         Eu5qkX1PHpDPuseN+IDM/twmjKtvMwaor7qUIZ7i5Zwe+sOcw0xAY/C0SDNNIc87o+CH
         cgl9xIDuYekJ14xfEXT6StSdncxm0G5UynxyVOwiQkkzClapl2VFZb8HnnlmzO24wEmk
         YGrOQOHYnsCxP9ttTRAKJvcvPjd+FlV6/9cp3h83C7HirRF3ybbNiWaFljEVNuwrjCq0
         FS/MbWdusnYkOQjvAXRGJ4az2ff2lUiKhR8Ozxs5ewYHTEPqIImBr6gj+24H0PDbXsqx
         Dabg==
X-Forwarded-Encrypted: i=1; AKwUvByd204g9/hFCXJOlPwLzkyo4k4wRWq6kIVqHY9qATdrbOBSHKijZozlLCPUckw0tKFgjW3gHbclC9B8Flk=@vger.kernel.org
X-Gm-Message-State: AFuF++lFLBvKglaegS1fEkKznzVq2Ey6dI7LuYn29FZGx44wZedZH5nL
	SuXUQot/S5pOdXx0FKWDqp5p8q11q37dSf5v6yAD1onqVppbDY4F7UU+
X-Gm-Gg: AYBFou35yz7RwwVRUbzPd8PZ5SPf+IpMDXdkWXH6uputA41iKZr4gFORS+NXhlS9EM4
	Z7hjXNWG8NSC8amKEQK7Bwes06YHME3+//5y1gRkA13YpO3do/TJXbDlkObdXCRfhCYqPZx9Hkx
	h+VoCLo++fPvIsmPGT/r2EcZ6zQQ8SQwcixQ9P79bOT9TUa9bs5kgdMeyThf+ijkUPm0a5/+Opd
	AHHA+EhFSN5usSFS24PBaS3F+tFiqcuYQqJTJ4AJ/pow77X1G40a36ELSShCTIppkFtXMQNGGzP
	QzsLZJsswufjkjP44CBw88972GRIljRRaml2G9Qj49Hq5cLndnfpqCEEock3juwN/kzXG2mlpaP
	yRVzVPVG+4oCPOzkaWN13wFPYhoOWKljRDCjbtmKYFNoV1IvdZhm0RcfyGNqFQKCueAf9xbzsuc
	yKIMtJW46b8SsBn3zneIVILoi1x+XIfQdAbmKxDzFmybcdNsR2DLD25ZekvjTbmIJUcUVnRfM9A
	28UFUUGukPiXXZ2PjvG4kuh7B6CWNe1wCpbSbAhVA==
X-Received: by 2002:a05:6820:1c8d:b0:6d8:6b04:cf39 with SMTP id 006d021491bc7-6d86b04d181mr5249340eaf.51.1790648542725;
        Mon, 28 Sep 2026 19:22:22 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d883395632sm6753798eaf.12.2026.09.28.19.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:22:21 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvin Owens <calvin@wbinvd.org>,
	Yibo Tan <lhfff@tju.edu.cn>,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/2] pps: generators: fix use-after-free on unregister with the file open
Date: Mon, 28 Sep 2026 21:22:17 -0500
Message-ID: <20260929022219.212024-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unregistering a PPS generator while /dev/pps-genN is open leads to two
use-after-frees, one per patch:

1/2: closing the file frees pps_gen in ->release(), and __fput() then
calls cdev_put() on the cdev embedded in it. pps.c had the same bug
before commit c79a39dc8d06 ("pps: Fix a use-after-free"). Fixed with
cdev_device_add().

2/2: the ioctls keep using the driver's pps_gen_source_info: TIO's devm
memory after an unbind, and pps_gen-dummy's module data and code after
an rmmod. They now return -ENODEV, as PPS_KC_BIND does for a removed
PPS device since commit 3649f9a6b897.

Yibo Tan's "pps: generators: Pin dummy provider while a file is open"
[1] keeps the dummy module loaded while its file is open. That covers
only the dummy rmmod case; a device such as TIO can still be unbound,
so 2/2 is needed either way.

[1] https://lore.kernel.org/all/20260911134952.648064-1-lhfff@tju.edu.cn/

Danish Khateeb (2):
  pps: generators: fix use-after-free when closing a removed device
  pps: generators: don't use the driver's info after unregister

 drivers/pps/generators/pps_gen.c | 94 +++++++++++++++++++-------------
 include/linux/pps_gen_kernel.h   |  4 +-
 2 files changed, 60 insertions(+), 38 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0

