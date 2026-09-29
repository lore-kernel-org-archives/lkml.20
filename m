Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1281F511197
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686182; cv=none; b=dqfGUhQvFpEg/BTi/pZRWv8nGjOWMtge3RzfP8xJYnlk0wZNgzb4SAlku7/C8IkDbjQzWlohqdGRySpWQbSeQkU4mBSfc1dG3oC4py6tZIo7VTIW3y2IP9kTt8Xugei2Qt3k+VR2Gvqlbu+lBmm8knUdbstxkPOEgFdxrQlALpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686182; c=relaxed/simple;
	bh=UY13e5yRLLfEXKckAfTWR9xJpug/ASfX25W7kJBjFEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uYu9JluW0I7htq+YDv1L7B7fwlqzlJAfCLqxXEiHdUbI+VOSbp7YTv2iuLvI8lCb2NMdKMfmz6HneLMJEi+oErXiayeAza1KzwGPyBC3M22a6gv018uaDrIUpA2OxDP2pMyuhIRRU7VpWp4FWL9UkC7uSUOADiIJxZzF2y0cewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+NMRrMC; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+NMRrMC"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-80a71781323so2482685a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686180; x=1791290980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLoXg/7Qr+pTMRDjfk7Aq5tVMr+zeTRgDglZSp9wksE=;
        b=L+NMRrMC5dm+w9ytYJV5yIwyRnrUZo2OT9pVR8JDrkYaFTyIYW3UVsT+5a0x94UP1N
         NVaywlb1g53ZTb34D/RSilKlxKGGITPNX0oBEy+kA7Q6ME/tp3oZ6uobg5WGi7zbsKU3
         geIvD5SPIwWV24LaETNTK1UO1iidlI7RgbmwmJ5nA7yzbDoZTSI4t3N04mr8vNlLUPj7
         0nezFjgYoGi2K++2NhVfD4+sckqkZBRx0lkRSzqeIrvulqFATJus907WlEkKefnhCX+P
         2ZoWUjA+IG7AzmK9QdDlsRtXx1ZSFlp+OtZ2yJsJv48fsLRtBEBsubobPONEp+zLlMPB
         8mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686180; x=1791290980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLoXg/7Qr+pTMRDjfk7Aq5tVMr+zeTRgDglZSp9wksE=;
        b=qHoRZmNIVqZdjsdMcTmu0VDCxxnIOohl2+7sWKetv4w79gv+0PTnCgdDejfgBuzKJj
         pvIt0uqmO+skQfPsjO3gV3QMi9uA/toUuY4m7T+aXfGPP7fQimWcJ9iv5x3sReLxItkf
         ljaxX68dYmAXNR0ZaUxQyak1C+mTJUR7iDgiU2kphxEh8XXN5BP6oRgHBSlfkHhILj57
         gxV3bXve3kI1UyiAf50v8558PtmOfeGdgbg3Pb+sd37EXA/Ln/AmEZhASzvx+7nxtKpr
         d/t0Sr3uJD359PaEaBu2e5ktkd2Ob4Hkl580Wlf/yVQcX4QwzWXr2BjXtUQ8lHDxGmB6
         5X6A==
X-Forwarded-Encrypted: i=1; AKwUvBxrfsb4HoUc30sH2MH7XtHGT79VQ2/mGuNeR9agBHbusC99GuOka7y0cjdz9CSGmJ644mPXUPVs0rnhZhU=@vger.kernel.org
X-Gm-Message-State: AFuF++n5maInWuO1MYKWjgpmCXkpUaUyewKJAl2oCmmD9teiqHppzitB
	LmI4S9KCGOaLgBsq7mfmxYohOtCR6pbecLPq67deFxMgYYmCqXWh7yct
X-Gm-Gg: AYBFou3s/aC+m5mH9DeR/VwKauSdCHaQ78ErhwafLZzZr+2QEULVN2M4baOnv9vDIb4
	cbXPrGcvI4Ks5pAW/PglPmtj7co5LqdzmBeXmSSKymCrOX4TVLQru8/95WiwMejqpY/iYn5GIDN
	oeiVQoIHf0fm0xrk47PWBnuAlOSt1Jey7geI5qTkOLDjSSmA0ru3o7koZNmd21/CftIp1Zvlb68
	HP9H1x5iCOGeBaBr7R7SOFJJGwf+jG4zEd+uZHS7S/WfupClHE3HOmzf+sEIVt/6pjeJB07RC41
	idciUOkMp/ZqHD3RTKDXVlc3JY5WWuRcCV48idi0K1d2XVqyGjnZxiISsthR9iL6d5vhStRug+h
	g+xeHahCLvBilKrGIIT0i21zSEZ5BU525GRmTiGCsgK7CznXVG+1sbOu+Gi38DKgtQ1E0cxHxIK
	M2OEtsZjGz2eea32rKUnnqxFkxBdWq+athJPyLdynlfH4j/VeybscTN/h9t4bPyNkpSy9xIj//g
	d7/TI38OM53gBiO3F5QT1gW3xSe8+6U7him+jxF
X-Received: by 2002:a05:6820:2685:b0:6b6:87cf:d1dc with SMTP id 006d021491bc7-6d43f89b701mr13401793eaf.24.1790686179793;
        Tue, 29 Sep 2026 05:49:39 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8830ab0d7sm6781572eaf.11.2026.09.29.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:49:38 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvin Owens <calvin@wbinvd.org>,
	Yibo Tan <lhfff@tju.edu.cn>,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 0/4] pps: generators: fix use-after-free on unregister with the file open
Date: Tue, 29 Sep 2026 07:49:33 -0500
Message-ID: <20260929124937.51114-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes what goes wrong when a PPS generator is unregistered while
userspace is using it:

1/4: closing the file frees pps_gen in ->release(), and __fput() then
calls cdev_put() on the cdev embedded in it. pps.c had the same bug
before commit c79a39dc8d06 ("pps: Fix a use-after-free"). Fixed with
cdev_device_add().

2/4: the ioctls keep using the driver's pps_gen_source_info: TIO's devm
memory after an unbind, and pps_gen-dummy's module data and code after
an rmmod. They now return -ENODEV, as PPS_KC_BIND does for a removed
PPS device since commit 3649f9a6b897.

3/4: a PPS_GEN_SETENABLE, or a write to "enable", between the driver
stopping its timer and the unregister starts the timer again, and it
then outlives the driver. The core now stops the generator on
unregister.

4/4: a reader in PPS_GEN_FETCHEVENT is now woken up on unregister and
gets -ENODEV, instead of sleeping until a signal.

Yibo Tan's "pps: generators: Pin dummy provider while a file is open"
[1] keeps the dummy module loaded while its file is open. That covers
only the dummy rmmod case; a device such as TIO can still be unbound,
so 2/4 is needed either way.

Changes in v2:
- New 3/4 and 4/4, suggested by Rodolfo.
- 1/4 and 2/4 are unchanged.
- v1: https://lore.kernel.org/all/20260929022219.212024-1-danishkhateeb03@gmail.com/

[1] https://lore.kernel.org/all/20260911134952.648064-1-lhfff@tju.edu.cn/

Danish Khateeb (4):
  pps: generators: fix use-after-free when closing a removed device
  pps: generators: don't use the driver's info after unregister
  pps: generators: stop the generator on unregister
  pps: generators: wake up PPS_GEN_FETCHEVENT readers on unregister

 drivers/pps/generators/pps_gen.c | 111 ++++++++++++++++++++-----------
 include/linux/pps_gen_kernel.h   |   4 +-
 2 files changed, 76 insertions(+), 39 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0

