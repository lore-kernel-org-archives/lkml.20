Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC8054704C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512527; cv=none; b=mJlI2/DaFOKJoZ5tksnvUoTBhMK658iWEu/okWTY9bJ/Ly5jo6n0hElg0vC6M+N98hUbmu5Wc2a9n5HGDhwlVshksy9qpzPruUept7Q3qAS1eOCiFjT4kWA84FWmRCeOnofNRvjmB6zIY8znKwBm7UhvJvxfoCPBM6HT5eFpVos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512527; c=relaxed/simple;
	bh=fY7oMhBwAUeGe047Z0HOyz8XxMIIoEysscoAJzxQvRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z65HisXHddNmXd7w6mFVNAz6ahCiX5b8DyQopufNiXDzoTvmv6zWofwtPjUkLQzbY1nY0GVpm2HTDI3LXohRe/CyGPC1RGsujEOUE7MPB44Tcg9bdZ9JhO/YEcWoIeLjIGKvUOuytegZPdtjRGcEEgMCCXl4W0orbxBQMHqluZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCaUOyy1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCaUOyy1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7c6dbc60so1097245e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790512524; x=1791117324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kf/Q8MYoHp4U3NxSvVmt8RabsHm5In2Q3M6sgi6XDNY=;
        b=iCaUOyy1WY1+Pdumhsahzo6h7aPBD33iGgHz1mftp3f49FP7iUji0Xu9b58FrydplT
         wJ23SPeG2FWhjSEqrs1JS7fNdtRKQgrVq0ZBs4T97sfA1zM9kqKyBaf9nHByZy2hM1yL
         fLmqZPEaQArIOH8ZLYGu0HpUUIvuWrPmqSw1/Cwtuo4GnILU5j8JRDJAB1hRGF2/bX+0
         7JjaM2nchDHlw0qPnh/552cRLedyDU0Na9LWoDBoEBZuvyQFbRFRx5Rs3RCtbfZp0jSX
         ybgz8NJlTDaWfJDhAP+TDOneD7ePWLlGiJQxtq9Kvs7BYOukldJF3QziLbyaXoBTSIRZ
         7/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512524; x=1791117324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kf/Q8MYoHp4U3NxSvVmt8RabsHm5In2Q3M6sgi6XDNY=;
        b=b+3JtLTKHMhVub/5nskYRDBNMy4v51AEhfh5lL/M//z5FdRn7UCPcOqbOqUWtokS92
         j/qW5PVnajwUG4oAMrjr2V66bzpKXv/EQJBXO8xtj4Hg65pbd/1Hu2m3nE8d6sHBb8Yg
         8bnhyeb9EhONt6UDcpKDKbtEJTbJX9cuJ6Xu6ICF9xphn5wmpVlSXcl+TY2SKMk5MLnu
         4r3uRxFlperqqNRa+wGHCXwySDMNkw5ZUyW53nmmsQ1vic2BzQ+hdDDkW2Qf+H4IEBIB
         /XX/UTOuonxbD4IxSq5+AZwitCepb53sQKQdFMDKeiwKXdyvxCrrbqieOy6FJUAAKxYg
         ffyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlBuJKKHzKlySxkhNKFGTz6tY05O3fSJhnosK6vB3eIAhgqH/N2/fkIoMYm10MrniJMi4Q7Bus46vGYNM=@vger.kernel.org
X-Gm-Message-State: AFuF++nx97iwtXTBgmDGtpV/hdXcGaaxctXKwcU2XA/+aGr67mk0s+3X
	hlpCkDTeSZaVlgbTc7pzVyniM32BNwBRFzZmVOTP35ofQw3memr9aHyO
X-Gm-Gg: AYBFou31690EtJ6pW16PgPhRrYu9FYl5nwhfPmd3Wic+dKSnDsOs5uqxNQ3XGh1wYEQ
	6nZnFvB/8TPFRgF24jxV2sV4GwlNKxOkk053ccRHREqdTMr0JchdP2YBUn1J24DXaGFQq9rAUFd
	mARbgT6Mt7OUGebuh+n22mUFe1yBopnxXyuiHLUsQsVT2tLHr31DQOjoLgb3G1IM6S99WFeTIJp
	k35dgoLqM9ItbjL1OtqjLvq/hA0uTJUFX/FtVX8uXu9xvp4JSI/1D5/8peVKkBDkfP7vzY3YnOF
	Lftn4fHGkYFAB9pERlLfE9j28hwmPFr0R3s1oqjuriH76JvZOmj9w2QLggJOjLxaxiGC6Y+3/q9
	gr24bT0XeLMW0K6hAkcC3KcsbWoPNl8rgygIXDNh5l+AncDk4RPDpkcoW8EsEHFTDGQV3zZLFCE
	ihZ+0VJXtkJBUT9QfLzj0H9LfGXko9Cqh39GaxmygqrCWRrP0zojylzpsOGk3V92JvVYc4wl1KT
	wVwvp/rVI8HLg5xsuH6
X-Received: by 2002:a05:600d:b:b0:4a0:1a3:bf6 with SMTP id 5b1f17b1804b1-4a001a30da8mr18991825e9.0.1790512523852;
        Sun, 27 Sep 2026 05:35:23 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001771ce3sm58790835e9.7.2026.09.27.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:35:23 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Wei Yang <albinwyang@tencent.com>,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH 3/3] sched/fair: Remove unused autogroup.h include
Date: Sun, 27 Sep 2026 15:35:07 +0300
Message-ID: <20260927123507.39074-4-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927123507.39074-1-kayracizmeci@gmail.com>
References: <20260927123507.39074-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

autogroup.h is included to fair.c, but not used, remove it.

Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
 kernel/sched/fair.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ddf993a46e3d..051e93b495d5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -59,7 +59,6 @@
 
 #include "sched.h"
 #include "stats.h"
-#include "autogroup.h"
 
 /*
  * The initial- and re-scaling of tunables is configurable
-- 
2.53.0

