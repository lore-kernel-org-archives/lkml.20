Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DDD4DAF9F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976359; cv=none; b=jMU/lu9hXnrnJ4Gbm3xo0PiW8UelLh5qXjpVEZy/qyZQCtIoDQAYxCF0x7IX/GMYOr4f1IJvUJ+qMT9AZ5Ab01SIcs5Q+1A724WRViMon3wD+yIpYSrGBaBw39qQOe/pgyEkXXYBVRewtTHK5KzfzqnqWvHwHeIWN62J+ZnXgJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976359; c=relaxed/simple;
	bh=TYCh17IzdfTqL8pvaT+GV1ivRrEDrSwahRIe1yk5/NI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kAxwBcwo9a+gcXGLlxytRy2xyY+9epTclOli/aCPtG7wwa4CT3NbxnlLjswBtU8eue84XClqaXrPk2VUu8lzE3oRU3SG0ErerLLE7P4EBDpUVolWYzw6h1pwRqzfs9MImYZP+6rNqM5KcVe0uQq+m+DT7cQ7nRW6DAVU3DDgzQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaoyn+U3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaoyn+U3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so33306285e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976353; x=1792581153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsaJRaFTcFa+k4eyPw8A1pPOAH2MrUoTczDBOfy0KPg=;
        b=kaoyn+U3VqAhl6M8NE2O3U9UjzFHA4ms7eabtMXqpNfbxZu0s5sCfVHqYKdqCkOloU
         A++s4Lfshd80YQ3ZZ38KihBOGaAMNDmjrWgp7t8f9nl/mBd/fxVVRov85Qy1GEIpiyFc
         RPbNYHrHbvs2Dm8/O5tSPTqOKJ6QDIdnleoxnpsiu5rVpo0EQtRoPQz1Vbn6nnov86oK
         hqdU+rfiKkVc3+aCSs+6YWOvQvroGDsj536Xv0/lNxH3z448TeJiCwXPvHwZKKsHgJ9q
         p1sSVXNg0j61AFplg8yrYyLrA67YWQF8gAMgYDukWx3j8IwCSqYBQbS0EK2r9t+shuBZ
         yhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976353; x=1792581153;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsaJRaFTcFa+k4eyPw8A1pPOAH2MrUoTczDBOfy0KPg=;
        b=CpxIXGSvnBL2bfAUUzNsMD6LZ01Nz64Tqw2yLkS/eSBY9y6P7bPil4Im8FyFMtt40O
         Rat8aa7lYG6jsEpS6vBF+YvYw8/8euPl84YONF9CeumJa6BjhbTpSqtmt31cmaRUnyFd
         x9OIPyDSkNvHEgzAQU+zT9RxFZ/Znv6PcbGUyq8vNxvsFoNPEmS5WAbbau2PwkLk6rII
         5+mAjh635hJfZBSAijTQ8GA3+o4zYJML8joSOXqUgufqg1b5MP4gdIlUHmEbnqOJM4+w
         FWSNUbc6QhdgW5UnBoe7d2X3I5MbPFmqiMnpbxv9vzSmpQ0eAq2OZ8bhXLtw/ocMgETh
         nY5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQQnF03KaBA+kebkzjFdRWqBY5xQYKB36T6kIkztBrBXQvZ2PWZmP3ef8j+BRKc+r2x4i1kbFZBQYe4+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKGmTiJOx+3V88HqIU5CN+TxRA7T5uVgeK7Y2AXt1EOv/SsR1h
	/yYkxbSjo8YHMEyJj545lj3QpqYSiffYKcEXwN7774iI0ARg6wXHgZEP
X-Gm-Gg: AYBFou2gY0854mIbqHpiNdeGsEEB2kJEOtm5QOwtQMEWlP4289PRxPrvZbAE0NcPPd1
	7W7Whp9w5F1BMs9ycX3CLfwXwwpOx5PWt8wrkdYGMkCZBw3hqHycN/yqgh7dQn0J5VMZvfLZLWo
	6VAAh6ghrqtX6vUNHVhuNoYY64plJPKGzTBFqeZKXXNW4na2okHpQtmUeGWNSh+iEy4TRWOiTJO
	VEhc+lWdUn6+6fR/Zpn4LdX534+2nmgf+Ls/XGG45TYpoLETT24rY/W9xXgWzntY1iobKBlL9As
	PeUekA3IuGDj7ed8aYKUitOq7O2nXfN13DR3G+W3VPl1n7VpOh/an87dZTHNYEZtJ6a1UXaD2fT
	1RHg47fHreRPScMuWaZ9a9OBJLuDdhRUEbl8NfN0kkNbKWVpLIQ4cVmLxai1uzwwpduMQw8SxJH
	v7rt+SQ1e0MiGUJg8zKefu2lGlzixHBoMOdltAMe3GZ2Lq7wi6alzNV1ymCtUXVk+0oBPeKv9N6
	SGNb4FV+cYOcEIcLMlcHA==
X-Received: by 2002:a05:600c:6990:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a18e49c43bmr309909955e9.6.1791976353342;
        Wed, 14 Oct 2026 04:12:33 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm1846481f8f.6.2026.10.14.04.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:12:32 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v2 0/4] media: atomisp: remove the circbuf library
Date: Wed, 14 Oct 2026 11:12:09 +0000
Message-ID: <20261014111213.1967452-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Andy for suggesting, in review of my earlier typedef
patch [1], that I look at converting the custom circbuf code to
circ_buf or kfifo, and for reviewing v1.

While looking into it, I found that the circbuf API is only used by
the local queue path, and ia_css_queue_local_init() has no callers,
so as far as I can tell that path is unused. The remote queues only
need the descriptor and element layout shared with the SP firmware
and a few small helpers.

So this series removes the unused local path, together with the queue
type that no longer seems to serve a purpose, moves the few remaining
pieces into ia_css_queue_comm.h and drops base/circbuf/. I may well be
missing something, so please let me know if a different approach
would be better and I will rework it.

Compile-tested only.

This supersedes the typedef patch [1].

Changes in v2:
- Patch 1: keep the includes ordered by name, as Andy suggested
- Patch 2: also remove IA_CSS_QUEUE_TYPE_REMOTE, the type field and
  the type checks, as Andy suggested. I tried to describe in the
  commit message how the queue handles are initialized and why
  struct ia_css_queue looks host-only, so that its size change on
  64-bit should not matter. Corrections are very welcome.
- Patch 3: use u8/u32 and the usual function declaration style in
  the moved code, as Andy suggested
- Patch 4: add Andy's Reviewed-by, thanks!

v1: https://lore.kernel.org/all/20261012230754.1914517-1-vladurares@gmail.com/

[1] https://lore.kernel.org/all/20260918214132.1135549-1-vladurares@gmail.com/

Rareș-Mihai Vladu (4):
  media: atomisp: sh_css_mipi: include assert_support.h directly
  media: atomisp: queue: remove unused local queue support
  media: atomisp: queue: move circbuf types and helpers to queue_comm.h
  media: atomisp: remove unused circbuf library

 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 ---------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 -------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 -------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 135 +++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 413 ++++++------------
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   3 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 270 insertions(+), 1207 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0

