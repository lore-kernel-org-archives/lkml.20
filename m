Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D6A3AAF6E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020769; cv=none; b=U1EGG6SUBVhuf+KtCM66RqDHro1xjvRp8uvR4cbYfsoMsJZ4m1rgczVYd2nIRAhXjyD0OXMA5hGYd1OWhEzOP3XMSoUCv8l/AW/VjXWBZBkwG2CRtZNkerpit12i92GVnrDa2riiA+wly81s3VuvZUSPWwK5icHdkFi2hkgECTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020769; c=relaxed/simple;
	bh=JRj39m44UG7x7nuL83AF6glKV07IjewUYbAQNaqM7lk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JLO5lRfXpmn6DF9dTuGpdJu6uqOQ2QOgdjlCeBJhn7MUommH8jmqCK1A0+lSIiJx+5/gmJ56J6jhT6RLi79INZKZBbWpPKTB732QsZtogAm0+YabJk1xGzDjm3mFTkRS+XzvJc9OSWS5vGAxpUknTgEHjt+q3SwBBxlAocbo5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dY50TZ9E; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dY50TZ9E"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1752049f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020765; x=1788625565; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qCJSMZoS0QNd9wZ2SP5uBlAyYhJin6wW0R5sadc6nCw=;
        b=dY50TZ9E7jYtz27W5ZSHELio0WReBYA6z4GXq+H75nIN1LmsF98GKgA7QdYs4nE/me
         pDW5u5q8BipNXYnDEDokRQFVCfsCEkjOmGSlMO3XoqKvAv6FeVHSF3/RI/i6gcPnA5HK
         XhTS3yH/GqjC2u6LDmZgKoaC5tIrmg+qqKwAy+I1/lIBVeOBgwxAMemI6tfJ7eShyZ1C
         dyPQzoqqnoJs4Tj9GqKMVcl8qswKv07320v/zC4Cf+Ix1/xwj8g/QilaFTBAjB68yqaF
         vPQsAlzAK+KisroZje1xoIgp0HM+GpD97CA6u1bCuo9xc+nHNGfZnyxi281MIx8ezTnU
         J9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020765; x=1788625565;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qCJSMZoS0QNd9wZ2SP5uBlAyYhJin6wW0R5sadc6nCw=;
        b=bnSE20sB4PwJM0PWv8gvMIgd5Uyws+H6MJ+bLHo1tJkqhZT23NPq06RNU51C5Q7VyI
         xseqEgSsxQqiOnpRCsV8ae/AC+yJgJPkiODE9eF2Mn4EmnTDL+2tR4KoHrAMwGNW7dcN
         BbUGKESAC9kHVa7szyiHycSHBrAPDRTMTK7uMR/2VTXzePcixdfQzAWbcTxbvKd5uK4I
         Y8fyOMKP1uz22tdoOTUolKGWijPKgQVNdq8wydG0BTpmoGXxW9hPKTRZ0O9ob7jiKgz7
         syinIAalGh8Vgp77Rq+8XSmLBN+vLfEuIJsUW+gPGLPE7VhZyKWb2q7oXUu2JyA4ESvv
         atug==
X-Forwarded-Encrypted: i=1; AHgh+Rp5LVNTkA9szKZmF2ssb+qCviZkFfOWZCg6t9/ankeDJ7sulKRjLK5LcxBWLg0BIfk0xSAJx7icpWHIutc=@vger.kernel.org
X-Gm-Message-State: AFuF++mG+EwnAeCPgbYW4UJhZco1y+opoR50TLUtUT5vYhxWIQHWQTTq
	M0eQpzGlZQWxAyWphL4HcWZtETf7W54D7SEnw/whmOe+JjHu5L3xQyXo
X-Gm-Gg: AR+sD11UZ0RFefRkIP3PK4SWKXQxFonEUZzzHwgrRH35YdusZQRVRnIGhZQPDXUBK5D
	43aTaJkuUEb6wgomfVIekazboOoNVIiB/FfIGI3uTlPT22GQWfF5dq6Iw6u1qChmC1fy+pwdf+t
	RW4QYyjiERgVCGkk7qYU36mzWbpz6dIM7ciT8xWnnYgO6Kt+lU19YYHyl3brzaPd3GTJoZMkxoW
	Xc61dhGd79dgq0UNdAnStMv2PSxO9pC7eQga4QClqizxRHhd2hZK6I9hvgtUCcI8KFoI7PrarOW
	chqikBpHgZBpeAqrMwda5ernBpg2hVRT8YNk227RyepHpesmUG6schjWHa4LhDClZyFvm//4V0k
	3ZQdx4UdGr7f6wdECi3C1JHUVdKkoGJMG8WleWJKHJHUx63mBjBOFcPbktwFRejko265SJvhlPb
	dsa/xftBlfcY16SAjd15/kOUvqfeW8hcs0jYOq5dPJ2RYI4ntJJI9aFA/JnwYo/cX+Gahje9mTy
	brGYoZc1NzHMN23y7hhqtHMziuv1u+z7KgaENB+NZbrdDthfxne0rVma/RJ0ZJ4SoAR8LUwEIqc
	fRJ3bOcVeIXYmzBMxYaxpBzudVuu0lnAMLAOlKdC323/NrYCxZlGx3n/Xfu1zE3RRuYPSaC43AS
	JYtFVkoVnMYqh53vn/3Ux94AM
X-Received: by 2002:a05:600c:3b20:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49b91bd78cdmr189918175e9.0.1788020765322;
        Sat, 29 Aug 2026 09:26:05 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:04 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2 00/11] iio: temperature: make headers conform to IWYU
Date: Sat, 29 Aug 2026 18:25:57 +0200
Message-Id: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2jFMfQCu/A/DotABJgI1U9NoC
 P9uJXHp8pzknrtAYBUOcMkWUI4SxM8JzC6DdrBzzyguMZjcnPPSEN5ZZx5xYOtYUXny0Y7oqhN
 3jqrCFSWk7UO5k9fWvdWJBwlPr+/tJtLX/ormTzES5sh8oIbMsWGiaz9ZGfetn6Be1/UDlXWqO
 roAAAA=
X-Change-ID: 20260821-kernel-header-removal-d95efd197d78
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=2113;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=JRj39m44UG7x7nuL83AF6glKV07IjewUYbAQNaqM7lk=;
 b=hR/2meirejwqk7Aum4g7w7kis+9c0lVjbw0i7GaYrzwy+BIaUw6lXx4kOmrmf2Na2JOM31Vup
 RuVl9jONATBAbzxenstawDr+1hGf5cDVG6osRsZQqd2YpnHwGYlRxVA
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

This series removes any instances of kernel.h in the temperature/
subdirectory and cleans up the headers in order to improve readability
and enforce IYWU instead of relying on transitive dependencies during
the build process.

I had Gemini generate a summary (a bit more verbose) of changed headers
under the --- in each IWYU patch to improve the review process.

This is part of an ongoing effort to remove kernel.h entirely from IIO.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v2:
- Add missing headers pointed out by Sashiko.
- Swap <asm/div64.h> for <linux/math64.h> (Jonathan, Andy).
- Squash small reordering patches with iwyu changes.
- Link to v1: https://lore.kernel.org/r/20260822-kernel-header-removal-v1-0-ee31b124be11@gmail.com

---
Joshua Crofts (11):
      iio: temperature: iqs620at-temp: make headers conform to IWYU
      iio: temperature: ltc2983: reorder headers
      iio: temperature: ltc2983: make headers conform to IWYU
      iio: temperature: mlx90632: make headers conform to IWYU
      iio: temperature: mlx90635: make headers conform to IWYU
      iio: temperature: tmp117: sort headers alphabetically
      iio: temperature: tmp117: make headers conform to IWYU
      iio: temperature: tsys01: reorder headers
      iio: temperature: tsys01: make headers conform to IWYU
      iio: temperature: tsys02d: reorder headers
      iio: temperature: tsys02d: make headers conform to IWYU

 drivers/iio/temperature/iqs620at-temp.c |  9 +++++++--
 drivers/iio/temperature/ltc2983.c       | 15 +++++++++++----
 drivers/iio/temperature/mlx90632.c      | 10 +++++++---
 drivers/iio/temperature/mlx90635.c      | 11 +++++++----
 drivers/iio/temperature/tmp117.c        | 10 +++++-----
 drivers/iio/temperature/tsys01.c        | 16 ++++++++++------
 drivers/iio/temperature/tsys02d.c       | 11 ++++++++---
 7 files changed, 55 insertions(+), 27 deletions(-)
---
base-commit: 350d1fb9204b13c5f95e511e98b8bcb47574d425
change-id: 20260821-kernel-header-removal-d95efd197d78

Best regards,
-- 
Kind regards,
Joshua Crofts

