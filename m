Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916760;
	b=H0LMfNSTyTfoV1gdbMgdIFYDU4pmWT3Qi79AfRyWuOVal12VQN1+DJAbBlhuSbTIzmXI
	 nHI9dFdbwzq1BI2NOdJephJw0ekc+VGhm1Tc8hAK0fswFy+MFPe5Z1kIIWtYbgSlulmpQ
	 4i2fMJa6zOcD+ACwgieZXBa3OPiff/rgKmYiN5W/GuGNP0MLSIvXqgX709tu0K4pNLhTC
	 H+Gr8pWyC20L1q6OdaB4XC8SsRE0eSlBgwD2C3KyjKaek/DgRiMvls8AeqiUQoAkHiej0
	 jjPdA+sFreXCNOStFfGPEd2omrIeN5RP2j06PM8e5ekgu9B9glnfJ3EwTztOKjD7nwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=15yxV/q8YjFrn6nzwqjZB6fHZt5oZ0nwZLHbBbVuKnc=;
	b=frkSHW4Ur85Aoy1n66DJAn2PPMAvTTKxQwoFgNrq1QE2LWJbiNQ2wucQKhHLXwptpUYq
	 V0w/6sa5Af1G3bhlR4BE0sQUanrHNXK7bAGcsyQRfD653fcTPnCOC7Sdb7aa2/f7YwTel
	 kpRl3AxpmjHsqQMCmsGTfiF99kUeUP2phRfDade/L4ZtpiW6kWolyT+1pfXHQvyGZ2I6i
	 AlzyjJ1W8Wv8HBu8cHexI8p+atJENjV0bG+1YjblM6WvY7EVfDRQmUW1it4OSFvBX/q3m
	 qbUKPXNcCH7NCjn3s5RVT2yAq7EFda44EKPTVcj7v2zpdOs/rFpHj0hBaInFcqfaaQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkrioNJg;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CF8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkrioNJg
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50933bdf4bso174993766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916758; x=1795521558; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15yxV/q8YjFrn6nzwqjZB6fHZt5oZ0nwZLHbBbVuKnc=;
        b=nkrioNJgw33AYPzVqAyXELgTlwRRSxx7BozKkegw5uo2GPm+ewjT4J5IVNawo17SFn
         q+vHjvJ5moSrtPyOfeoPBGX60mnqxpk9te2qsZoeEqtNrrNBRlK//JVr3/o6i1aPMgse
         Ptic+pLhKxgRCF9lXGq8xCwXN0obL6h45LUFISaiYWuG8jzZhOoxoNm5QcodzwckzzT5
         2Zanz7DRptcRylnD//O3r4Tdaxtt4D9NvvaZMOf8TM/E/K06QPmRWj1Ykj3aWLhlMeal
         TBwiyaYG7F4hCDVi/9KKoRyCrBU4LK9kkDF/bMH3ruK9kzph9JXYkF+PxonXpFbkhED6
         tnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916758; x=1795521558;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15yxV/q8YjFrn6nzwqjZB6fHZt5oZ0nwZLHbBbVuKnc=;
        b=G9GYfRKYQBmAulS/3nSZ1sqICK5TOnZw3PF5teYmYz39xr/PlxvcmogBTsSM0oB3Uh
         Bh0oKQhPTeUyQsKrZq11f8ZmWXWrI+1/jDj2uaG6mGh+w2k3F1tDpIzrDwKJxbQEbIIB
         1yYh8PylQAbxrR942wcqsc+t15IkviWlO627AkLluYOMTnuUj4E+ZQvM+jz7pUX2wh1y
         CjP9PgQyaZx6D9cpOuMiOQZYD4hfMdgbQognhZ6ZFiIG2swvxJl8f1aLeVZ1HTv3Fskg
         03EnQOK4Bj6tx/FC8IdwN2V/Qv1LcTcCDNWXRoQ4egqLchUlf2dS9k8CAeJ5mwOraHac
         fDiA==
X-Forwarded-Encrypted: i=1; AL+hErEJF1xWj9OgyBpyWnX0pO/6IL4wPUu0R7e5GhTpEatghOdlM1EADG3vuxthpsz1IpKaV76jS6mIKQtrN4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0w/9NiqDdFc/1ZgQjrO78d2Yy0WIz6Xu1ET0oFP46oCX1n67z
	3S8BiqiD2RTGQyWR5GJ8yf+90g8YWv7mDXD/uFxTh2cML1rBptvLGXzj
X-Gm-Gg: AYBFou1d+zmtwfMHXsXHuYQ1vdMKsMhis0lji8aj8wqFsdxMTuN1u1yx3lvCy6+RYWA
	m8pjedCO3E1t3JPeK7aNjdIA2x/iUnITO+3sX7Wd7arkB5R2RUZxnnSGAj4v/jttwhHHUE+BxGx
	2K3eVab4OLgnqkFCGWlJziTM18jXcGqHZlvSmk0qp3mBexdJKWSQlXRId09GNpXVH20QQjPbFE5
	sEAJhpeW9SmXFR8X9a9mTbcmGDhN1o3NzxcNKqeZrYRG4idZITUPnTFOtOBvWrw+II6qtcPQTeH
	40BK4vOjLiOnvCRvKOKcRiO27PuHYdTHsDc7VBoxzPKBiAyUGRnRW4T+txCOLgcYOuc2IiLczTX
	UKavh/owv8A1E7l81yQuXFMndc8/2x+KIkvb3PeTG+bo+W6n3twVUsfU0g6kUOmoYc24I7e/biz
	Fv33R83C/1PN4OyJ4QiLzNPIJhFH5Fmem0cBQ3sBi1BcDY4A5pHcpjIsyAMfDz0l3E0LQWosTTq
	iX/q+aK3Ghv4mcYSY/UcHTr99d2TLtm1lhcdPsEEKU/LFr/d5zzJYXsdv4YJE497MbfFEZLBHg+
	XR7IsSr/agZs3fnreUo7F3lw5ypR4Gg2rRDHkBbxUQ4bAcheKC5XbIo2Vw==
X-Received: by 2002:a17:907:3f93:b0:c2e:204d:9490 with SMTP id a640c23a62f3a-c50f36c4a46mr204105666b.17.1794916758331;
        Tue, 17 Nov 2026 03:59:18 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42163sm530772466b.41.2026.11.17.03.59.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:17 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 0/8] char: xillybus: Fix issues reported by Sashiko
Date: Tue, 17 Nov 2026 12:58:54 +0100
Message-Id: <20261117115902.41359-1-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

This series is a follow-up to the previously submitted patchset [1].
It addresses Sashiko review comments on surrounding code. This v2 series
is the result of Sashiko's comments on v1 [2].

Two Sashiko comments from [2] are not addressed in this patch set:

(1) "Can unbinding the device while a file descriptor is open cause a
    use-after-free in xillybus_write()?" This remark is correct, but
    will be fixed in a future set of patches, which makes the PCIe
    driver hot-pluggable.

(2) "Should autoflush_skipped only be consumed when
    channel->dont_autoflush reaches zero?" Sashiko correctly recognizes
    that if two concurrent calls to xillybus_write() are made, both of
    them might block indefinitely in a situation where one of them could
    have returned. Concurrent calls to xillybus_write() are not an
    expected usage scenario, and blocking indefinitely when the buffers
    are full isn't wrong, only suboptimal. The user will never know one
    of the calls is blocking in vain. On the other hand, postponing the
    compensation of the missed autoflush until the last xillybus_write()
    returns can theoretically postpone it forever if the user application
    always has a few such calls in flight, effectively disabling the
    autoflush mechanism. Either way, the usage scenarios are bizarre, and
    suboptimal performance is preferred over breaking the usage model.

Regards,
  Eli

[1] https://lore.kernel.org/all/20261009074557.19996-1-eli.billauer@gmail.com/
[2] https://sashiko.dev/#/patchset/20261109112800.48663-1-eli.billauer@gmail.com

Eli Billauer (8):
  char: xillybus: Improve sanity check
  char: xillybus: Safer access of unaligned pointers
  char: xillybus: Return error in fops read method handler
  char: xillybus: Rely on FMODE flags in poll method
  char: xillybus: Refactor flush function
  char: xillybus: Correct handling of wait queue
  char: xillybus: Avoid indefinite sleep of work item
  char: xillybus: Cancel delayed work items before teardown

 drivers/char/xillybus/xillybus.h      |   3 +
 drivers/char/xillybus/xillybus_core.c | 109 ++++++++++++-----
 drivers/char/xillybus/xillyusb.c      | 166 +++++++++++---------------
 3 files changed, 153 insertions(+), 125 deletions(-)

-- 
2.17.1

