Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C43C7696
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789927528; cv=none; b=d+PE5/cGM6FJEdju7R9H6Pl9Xede506g6LTGS6uzedYwRgUnVcbTQwUGqalCwsv1v239qs059XcLtIk84x+K0RR+wV6OwRGNogVm8tv/wCUlzFl9H7vYF424n8Ewj/qymFVcmJNLX5gsheT6ZyNRousISUimeGb3w+72uxE/FAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789927528; c=relaxed/simple;
	bh=F0eZPhFsb0Nc+GldGGO+4zVnTR1/SUcvX28tu7Rq/e4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q2oJccI0a+WS4jawKCM2P+eshEHWVv4rIH+BJaVFPJw71luQiXiJez2jtUaV1+hC38XOhY8vsP+TkKsl7gJBKU0wtdQ9+pj+C0CtRILM30BRpOY6/1XPf3xcNGqLyQk/MdxIql6MYLmgRNHLJ8B0k/cHwf4tkcJt5XkBlt868SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIChzqAt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIChzqAt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so15614955e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789927526; x=1790532326; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PNSeyAr9HJpJvQqo0p3VPTX7NpDtcZg+nHgfUJD+2iQ=;
        b=VIChzqAtp+0MaO+Wokcj0jvK/S6bvdRNu1tu5vW1uvU9YSSMJl9QZgqzdosDg1nvP5
         5mqQx8pLZZQPyqUPzokeU0DnERO0TbhtckPZEY1fEyh8H2E8Z8DAHNEbATSYt8UUNv+6
         oz96jJQAYfu2lT10LN2pA8MVVgUcy1CoRffXM8UyDkxN8LCu7niRNiDKHpsOnJzQEI67
         ojANsWT+lY5JKYwmxTgbXIgR3IlDU4A9lfjONt5qHUITKeUc8AYpVeOpS+7pEaEWTBSZ
         nLA3SaH1H5YGP1oNtJ+N0WckjXfAh2isSJaxt93THbT8HQ/O3jPobrP1w6u64wzdEoeO
         tUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789927526; x=1790532326;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PNSeyAr9HJpJvQqo0p3VPTX7NpDtcZg+nHgfUJD+2iQ=;
        b=qfesKfFev2J+4WzfSXFsXns6YZHnKftpVn26BwaQszs7aGzs85sq1rMuPd56az3rtE
         oc4SJ6ncEyZ9aq+yJziPc6/Ib/9urEjyPOWIvyboxczKO4e3P42IDLJ0aVvuAN0gRMub
         RTzQwuYxABcemSrnNEN7nLga4thdH8NEw/l9mDHCnFXc5va4yMrVqykWhbWYPTqfB7Vk
         lyDx0crQgcYEBlk9F0zS7OBaqtlb3EOmrz8RKFsRs/oilSmxrVJ6kOnOc+OcswjLvUXl
         UMPeomIJGLayxaFUcxXcKpF8+6kHYmJvvdNZnVFJoHIG2xE0F2xubO2m0kYJ0354UkmD
         pJqA==
X-Forwarded-Encrypted: i=1; AKwUvByJszCJBO+JsqaHoCVgtsr3ncYLVDrDwFI0V0w1jNuD4PQsUicJhzw1zAm8Jy3/VEaRDFezOVQadp9LC6w=@vger.kernel.org
X-Gm-Message-State: AFuF++liC2ahTGvGKPO8ERVgLhzpCzHIs3rB5kkCbHgz+HvZTsJhZrxY
	CLZ8icwdR1LWGR6WgHw9Mnssuzr1rUh2GYdDL+fdIN9lHYjshE7rU1c3
X-Gm-Gg: AYBFou2jz3AVcjMZGOqzPXxN8qEF7wsdZGKUjHJP0BEEmUMMOZt946yM2eKt+GYNScx
	45I8zBFRNufAHlaHcPLzLuWxkyB2tCZE0LPMN7DPfnbjhnpsMJqHuCyTGV4odeAt6GgI/vQtVf/
	dK3ERgBINHLXuRJPrAWBgcwOP7yc8JX0hqL6d17gMvoroHkb57RBCgw0KBiTy333lCCvKAE9BZ/
	HcoXde/+p48SlDKX7rdCqNThC53z+y2vZE6x1VUsKdPBQXXwoT0/OaG4yZOrWSGTSsTtj+F7Eu+
	i9biXKMqa2w39JEKLrPjiQm9FPfEYyi3QJNXMZIx2DZFCcijrUEF+Mn9y2ZuJS5Ee2ps2MIImoR
	KL7UNm3iFpr+p5Wh3d0PCIACpWxsdW77DRnwM8ye3BAH5zbJdK1d3cNLTzLQtVzZITJXc+ihhCv
	CBw7TM0N/YQIw+Jv5mRnRwAQOoCHss9hiYezd+aaEdbdjNp4kzGqdarHlwPDYOMOahbvR8ImuC5
	34RR8OfCbV15D8NxBhJv2RPhVj4yflTrZi1ECCg8glj/hBndqjEscGj80kDgaci0LHGEMX6tHvp
	M5TPIXrLUCRIhxnF2JP66rSrwgiVkOnopV53UKxN9X6FM8gYVx/411SL8nqGWn9j8SpeQJkdfE+
	2Tszz03L0xA71+9spt8Tz0p4dfsgr4k7RIKL/8ManbeCnsw==
X-Received: by 2002:a05:600c:4ed4:b0:49f:c432:2e50 with SMTP id 5b1f17b1804b1-49fc5743189mr104226915e9.25.1789927525439;
        Sun, 20 Sep 2026 11:05:25 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f7b9bsm164648055e9.5.2026.09.20.11.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:05:24 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v9 0/5] iio: magnetometer: ak8975: driver cleanup
Date: Sun, 20 Sep 2026 20:05:22 +0200
Message-Id: <20260920-ak8975-cleanup-v9-0-1b0f00ec19ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0NL3cRsC0tzU93knNTEvNICXSMDs1RjA+PENAsDEyWgpoKi1LTMCrC
 B0bG1tQBWb6A4YAAAAA==
X-Change-ID: 20260919-ak8975-cleanup-206e303af804
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789927524; l=1676;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=F0eZPhFsb0Nc+GldGGO+4zVnTR1/SUcvX28tu7Rq/e4=;
 b=egoJo673W7NFvxUGauYmSf1CN4G3g/pOQ8OK2u1xcg46m2hMzw3LgTzvn23rrSEzr6kNzAnRV
 vLrOFK+uMgaD8UURmBzRad8lo+YxtCR9CzaS9aNfpwyi+s+ZxsdoaGf
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

This is a 4-month old series that I had in my working tree and
completely forgot about. It's a continuation of the ak8975 driver
cleanup that Andy and I worked on, all that was missing was to
implement Jonathan's powered_on bool idea. The rest of the patches
have Reviewed-by tags.

Very sorry for the long delay :(

Original cover letter contents:

This series is a continuation of the previous ak8975 driver cleanup
effort, as most of the patches were picked.

Changes include:
- using BIT() and GENMASK() macros
- moving to devm_* resource management
- adding a scan index enum
- moving from using wait loops to iopoll functions
- various code style changes

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v9:
- Add powered_on bool per Jonathan's review
- Move forgotten dev_err() call to use a local dev variable
- Link to v8: https://lore.kernel.org/all/20260518-magnetometer-fixes-post-pickup-v8-0-088d610108a0@gmail.com/

---
Andy Shevchenko (4):
      iio: magnetometer: ak8975: switch to using managed resources
      iio: magnetometer: ak8975: unify messages with help of dev_err_probe()
      iio: magnetometer: ak8975: use temporary variable for struct device
      iio: magnetometer: ak8975: make use of the macros from bits.h

Joshua Crofts (1):
      iio: magnetometer: ak8975: add scan mask index enum

 drivers/iio/magnetometer/ak8975.c | 213 +++++++++++++++++++-------------------
 1 file changed, 107 insertions(+), 106 deletions(-)
---
base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
change-id: 20260919-ak8975-cleanup-206e303af804

Best regards,
-- 
Kind regards,
Joshua Crofts

