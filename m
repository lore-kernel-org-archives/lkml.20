Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625044AB8A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499039; cv=none; b=uz+i+wYm/zVI7RxpM8ZP4693wrWd7l8Gzrp2EndpjUVAVxgfRUev0QtpEI76khturCYGktHdSm0TRZopVKofnEiPHaHGYP2S+6Pqi53lUZl53ronz4mT/fLZA88tvKUlBI4oDexttOi3bgTYy3MbLqTP5wO9VMpS52cAnsqjLsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499039; c=relaxed/simple;
	bh=56Ig+iq1BKCTYcSM9xnOgOFWggZbgL06r7h/vH08FI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=giLrvcjeKZIQfI2UXe2E52X7BY+mhCTodsK5Kx4XuEpzqO/akTZk5nb/206pRmrwmqTM7EFETTyiTUDMJ2uxrg/aWthTFAKBcVJEp6+SmX9PojbNEROP4V/11Bl6gb80yJ5CWrnsKtGeEqUWo6sICh4vYaxLHZqjrnreWITzFIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5Vz8d+6; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5Vz8d+6"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c82b4d250eso57336e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791499037; x=1792103837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZACjmCS1oASftukGbD2aJ9Y7h6BQoT9c3bmi5RvtCg=;
        b=l5Vz8d+6dOSkOlTVyGxGLaf1zfyQJWFowWGtpWIIzOg99KOGFDYoA0ZEy9/bcpynt3
         S7ZD9UnPSFZwo6Ayo28MV45+xfCRV8n2iYcdIfK0498VkpACQJfbKLqlLQX3dQOx/0Im
         xWJe4ug/PR0wx8a4d1N3C5OsVSwu46QychpJkcIcvxqYB0iBVjf1g+QbKpE6j4fN1J8R
         qPX1joZM9Y18incYa5OUXZ9F2hfHgLF25PScTN93O6Ih9NWVNhu/1GOP6qv3jjkxZZmo
         elDDoTDrY5hn6Pc8FhJlnHKFRdPs8BDtCatey9b55TL671gAQ6DWIXasfl8OqObxbFMb
         20Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791499037; x=1792103837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZACjmCS1oASftukGbD2aJ9Y7h6BQoT9c3bmi5RvtCg=;
        b=1MURYhBXEgaUnI8ehDGx2qUD1waj55xnlV99XPaaPSoYofAkW8iypWKyBnPWNxjLAd
         wFXB9Q8R/i2w/eUFfWQEsk+B4m78fXqxw2MgZ7tSTFEWWuu7z82at43TWxrINMYR3Piq
         ktps5QJC8IS1xVQu/3a7AdtRXGrUHjA/MfVBdxBIAusCTNKp3mels8jcsQHxDstd6m+v
         kkurqM8aaX9kdL2d/T7bY/rxHj/GLPkjM/v5M480c+Y8zjD4mB9XdCWcptcxXYzJpXQY
         97A/8caGXvs6mXdHJTcZC15NSezayeK3F4RR43eLw5/xQxHzQdOjF3skzKk0BjZfyQYY
         8DQw==
X-Forwarded-Encrypted: i=1; AKwUvBy6UFo1UUxeA1lct4/t8egYftXcMlRsCCSHIszglZtC5qkXKlBjlrF/eQiJpOY5raQ5gsveRebdxQaO0Ac=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAl/iw4SwzPngvBLZ+WUSdg7npHGDoCsn/AE5RUuD2apuQUw7M
	fy7mIZtinQCBRszv/rzBI9TI2GpoxpoqX07AFv+grPgE/lKWiy47YlqM
X-Gm-Gg: AYBFou37Q0RPCP7gUCS8JcXmMagHw4jGauSPwcSzebOp2iaukma1XKgdP0SYCYFBHSE
	s5ZPGXmcKiwTvu7OC3SFbydZ96czGegbnRoEdsRZx1npvJ39Zlz07gLqHMPSzpAQvA1DLXe4YfS
	xXeFKAa2bgAB4arMSolQSHMiqoozfsoANJ+JsGQV1ljDStumumW9v1bbAy68FmF7w3davjXfmbM
	NXtyrsqHBIeV6EqyCcYQGB6TAQ3IePrYNM8FL8m4niCfJkwCN/0aDLxfENgKnw7yAm9SNfXf1wH
	YB56+Q5TvrcWgd3xFJtGuFA/U41A65VmMNH0+Z9vunZXZC1qXqad0vWXwR8O6INPz7qaeU3w41B
	eNVzNWIeaDAZrhL5XQGyWWWlRuh+DppwFROBhziSoxjM6EFGjCRIN8GveJ0LEM17hmrfsAZY/mv
	dhkL/g7DUhWxuBEEudV6FPhAywH65Ygf+Lcl2DnA/iZkZa0JjKnU9yt/KA6+7gaxRorc7W29jR7
	TNVerZs3q6j/22WCg6EjDl6kWX+/k3fOHUjl4g3+GzXbxqwUfjXvboSc2hP2r2P1VOf+ztaEM9E
	6oLanEtAq0B2apaNdjJloxV3CCOk9w==
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr24904e0c.2.1791499037319;
        Thu, 08 Oct 2026 15:37:17 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab8c40sm393284e0c.3.2026.10.08.15.37.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 15:37:16 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH v2 0/2] scsi: target: rd: Fix oversized ramdisk allocations
Date: Thu,  8 Oct 2026 18:37:08 -0400
Message-ID: <20261008223712.49827-1-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

A ramdisk page count set through configfs (rd_pages=) has no upper bound.
syzbot found that a large value makes rd_build_device_space() attempt a
single sg table array allocation above the page allocator's maximum
order, which triggers a WARNING. Patch 1 rejects page counts that
exceed system RAM and allocates the array with kvzalloc so that valid
large ramdisks also work.

A page count close to system RAM still passes that check, and the
backing pages are allocated with GFP_KERNEL, which invokes the OOM
killer instead of failing. On a 1 GiB VM, rd_pages=250000 panics the
system with "System is deadlocked on memory". Patch 2 allocates the
backing pages with __GFP_RETRY_MAYFAIL so that enabling such a device
fails with -ENOMEM instead.

Tested on an arm64 QEMU VM with 1 GiB RAM, with the syzbot reproducer,
normal and NULLIO ramdisks, DIF protection space, device removal, and
rd_pages=250000.

Changes in v2:
- Allocate the sg table arrays with kvzalloc_objs() so that ramdisks
  larger than 512 GiB do not hit the same WARNING (Sashiko AI review).
- New patch 2 to avoid the OOM killer when the backing pages cannot be
  allocated (Sashiko AI review).

v1: https://lore.kernel.org/all/20261008215709.46014-1-sanan.hasanou@gmail.com/

Sanan Hasanov (2):
  scsi: target: rd: Fix oversized sg table array allocation
  scsi: target: rd: Don't invoke the OOM killer for ramdisk pages

 drivers/target/target_core_rd.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)


base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.48.1

