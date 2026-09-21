Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02449F131
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998161; cv=none; b=H4ZJVSwN/k6kBk0YU6yew4C4fj3zdEvwzaAqv7d1K7F8MV1dXlAEFWJwRHGVsud/R+QI+W9PMSMgjyCziy262FpbTByQF3pYOXG6R9meZQVuYhZxcYYboxkTZESz8Ss9juc8R0GtrxUHFIuelxfj+BtFV00RDmOMwnMqYftiheE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998161; c=relaxed/simple;
	bh=eKBbq+cd+pa1ECuMI3RRu02NdgQieSp/fsXjwHX8CGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aNDkYK48t3QaBO2WQKuhcxyYrtPDFLm5GulXl1IfYz1LeUbVrIyk6L3i3mJckH6HtTd1QVVZ2UluVc75Zob9IVgSonUt3aHR+VVu6dHlM20PVMypk7csbCwLuDLfKrovNQqVCk1nLKui5c4COiig94OrCuxRa/XWWYlpedY0q0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com; spf=pass smtp.mailfrom=idkmanager.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=idkmanager.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785692e59a4so1639325137.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998159; x=1790602959;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igw8US+UUaQ7xFHWjPtidfissy+IxS4zwRUNv5NU2iI=;
        b=lJMER9+kTd7LBgQENx4rPAu4apHoGeJSNOMsAUy3vc3M3Wm+DsBQ7D6CA6pItx6271
         gCr1yRsGj/aszMybLH1czf2AAIpr/YM+zVsS+WY2uXUKF0RdvMyNspPkgUk8GbIoh5Nt
         PE0VFXfmgP9hpMmZEfA0NMLqIKSkhlektJK6Xd8fIyFUkMCzI4BrIS8UlCV+kFR3Lfqe
         aUAAM4v9MwIm2R/QEiSWVPhPYVmi5cKWAnyu6Oo+ALbMpBH3pxaT64GbO7IpxSXG4xKM
         9+vM4Hkp+ohFAQ1oZ6CAB6JJXbg6y3G43135a6UrlMhjt1joCXsG2KdWnrgkHQl1ttRj
         VZAA==
X-Forwarded-Encrypted: i=1; AKwUvBxMRdq4zPFshAC/eyHVyFc0bS02vfKeFHXjmkBEvbzfq5j6JtNJTkZGenPkZux8l6Z9FWxHS9Jsge49mJc=@vger.kernel.org
X-Gm-Message-State: AFuF++nhEBEOXm09eY5thLDZhZolCGKNHXKklgdyRrLhNeron4AdzrnW
	65bGhuK7k/W4JW16Wiq3hB6nUNY2brTPblGDhdihh4YNXLkm1FfEso/I/adxh3a/9dk+8LxXRdh
	0cGpOWZGLDA==
X-Gm-Gg: AYBFou34njU4cm6UmBMDurkYcU9kqRNi3Jxu7TyrvLLNgvmcrfFGQXQ8tUFw8oqvKPz
	wWYe87uashB3oZkkG5Kqm5JUGTEyBqajIYITazdyR02VOgBSh7grrdLZ9+W5C6Wd6yfqXKJQmsE
	JjAghL6PxQTksOzKewg5y6vIf1AF5bnHHqdFb88X+anNOyUvk7BPEcvWgVBWj0/41bHpqC29ACJ
	m30Z9/NARYZb3Q+bTZiZZsulFSfZO8Y/rQCSUUFcv53A2aiowXWnMURydKdtHqpzPpw4lRCV7nv
	99/54ASNh15e05n4C5OrvKpR7Asphxhhjd4NqeuSPpJ/qLjH2h20Q/6uIi5a1wNUjoihQm1h7nh
	tpSHT0ajrvqqQ2/akczOkWJuBPnlhh8z/JJpcWQXqDYjsm4afV/kXQW7pay8WQmx9Xzhj/nYuxU
	6qWFnKOiuUSThwQiB5M2qxEvABn94ziksSeD/2uze+F8LKv2OR4apR0FTv4mK+yJ4hdjXaJZj6F
	YTD6+5rQUBHsTI0dj17+fHml6FkRnHjE5vO0bp8/1IjV2i8GvcIp8RavQaDesGVyA==
X-Received: by 2002:a05:6102:1629:b0:7a7:19aa:8a86 with SMTP id ada2fe7eead31-7a719aa9111mr2954454137.33.1789998159216;
        Mon, 21 Sep 2026 06:42:39 -0700 (PDT)
Received: from [100.96.0.25] (corp-190-12-36-222.uio.puntonet.ec. [190.12.36.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a6ac5e08c7sm8343193137.8.2026.09.21.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:42:38 -0700 (PDT)
From: Ing. Alfonso Kuen Arroyo <gerencia@idkmanager.com>
To: Christoph Hellwig <hch@lst.de>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 mlombard@arkamax.eu
Subject: Re: [PATCH] nvmet-tcp: fix stale comment on NVMET_TCP_MAXH2CDATA
Date: Mon, 21 Sep 2026 08:42:39 -0500
Message-ID: <178999815960.27132.5021907314171265355@idkmanager.com>
In-Reply-To: <20260921065448.GA13764@lst.de>
References: 178978695312.43804.1554581215424967584@idkmanager.com
 <20260921065448.GA13764@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun Sep 20, 2026, Christoph Hellwig wrote:
> Maybe use SZ_4M instead of having a value and a comment that can get
> out of sync?

Good call - that also gets rid of the case Maurizio flagged (a value and
a human-maintained comment that describe the same number and can drift
independently). v2 below; the file doesn't pull in linux/sizes.h yet
(checked, no other SZ_ user in it), so it needs the include.

Signed-off-by: Alfonso Kuen
---
 drivers/nvme/target/tcp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -18,12 +18,13 @@
 #include <net/handshake.h>
 #include <linux/inet.h>
 #include <linux/llist.h>
+#include <linux/sizes.h>
 #include <trace/events/sock.h>

 #include "nvmet.h"

 #define NVMET_TCP_DEF_INLINE_DATA_SIZE	(4 * PAGE_SIZE)
-#define NVMET_TCP_MAXH2CDATA		0x400000 /* 16M arbitrary limit */
+#define NVMET_TCP_MAXH2CDATA		SZ_4M
 #define NVMET_TCP_BACKLOG 128

 static int param_store_val(const char *str, int *val, int min, int max)
--
2.53.0

Alfonso
