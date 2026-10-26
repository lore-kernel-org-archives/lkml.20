Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030523;
	b=j6Beyv9zyBVZfwGLcM2cfHv+GuWpG/MHEKYBQZjjwFc2yMt7kX+2Af2VV17ZWmjwW062
	 UZXK8kRiRUkrDPPRqwChkMMpl+7BXtfdTbeoZvpOBrGwcM7tRuK4OUO7WRX2fIgxEcHAG
	 nBDQttYtbh0D34pJRO0BQhG2T1YPMiUMw+MbHns0otxtvmkQX+0ExgC5kDo6H92r5D2v5
	 JySgj40Ug7so5MEVagcGTKzpQWZt0wbsXeNP4Og52To2xIW2zc6BZ9PgnJQyj8z/37tTR
	 pAZhth6lsfDWbim7XC0JWttsY1RcukxEu2W+XSGvSKIqmdyRHuRvd91u7DorfokmHEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oWV1ZfObkbJp1Bm47yvpjwQQ0ChJKMhqeDewWbAFCRo=;
	b=MMfeoaeevxm5xY1X817LmU3B5LCsZaJgBjSOSN+/ogG0Q0rnlvyVavTJxGk8BCrw7V4M
	 zRIR123sGAWXTizMoIp7jY8hf7XcB47qJenfHdcsegY6Dc2FErib3ZtlnoEZqeZ8ecwhz
	 egyEt0oZ/SCHWIuUndq9QxwEP1qAfFxQqDvqiKQBadepAOGIk0C344ia68/0yt7LBo9/9
	 WFSV2RuYezaiZb6Zh6+EwLgfR6ttyWR2GdGQg5ork4EWvRfWBr1wQHhhKMuvhl+wgxbN5
	 EhmzHci/fSpvE2p1HIXe/sqtomut8MZomgPp6f+6P/GK/7Df8WMYtD9tFBVK7oipSIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Xids9wk2;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA4E606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA4E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Xids9wk2
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a208d93758so37243595e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793030521; x=1793635321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oWV1ZfObkbJp1Bm47yvpjwQQ0ChJKMhqeDewWbAFCRo=;
        b=Xids9wk2o3fqj7GExHLviPS7QioynSKyUfmjIUR3llN8d4zg78kp0/+ncKTaIHMEhK
         5emc4+MvnOUqsBZOPK7HnhDBEh1wmi0r3LS2TFlmHOjEmm1gYkBalYt34+ZvStgzPvin
         +KdhqnWoLz0bK2YY2db9PHyHM/wuBWtChoju565eV6dbqRm7ZYFu/PEvvRb8TU1IN5PQ
         qObds10avu8XiBMlrqBmwh83mmrWbp8Z1KpZ61TFuza6IPNwCEAs4TsX34rH5+59gPWS
         Lbc1Z29CEIYnKuGdoxoktz0cy8RbPujflQ2Xcx63fmCbSjUpiYCvb1r8q+9Qie+lJlnU
         fEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030521; x=1793635321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWV1ZfObkbJp1Bm47yvpjwQQ0ChJKMhqeDewWbAFCRo=;
        b=KaV1PVKqIClt2b410KiUp9ZGTYvzEa1J0LiUZJv+akVwu9YChrqPohdSa7qeYzzOlr
         LYoLaa1gpaiQcRMrIb1+8mUP6x2kLk0aoX5A13xpdEUhJ45qdQS10fE15hNR2JfByuw8
         +slR0N7twSfSgy42t6NehJMweJ7Xb9qQKQahp/X43DUXnNpzeAFciQjp1d91zgWW4O3K
         rwZlcGZfkktb8NnrNJtQpQc5umjEG+HZ+C/JkzC1PiO3dY8CY7ayD+iZIYFYmns32cxV
         lvMqoiINTzNj4nFeRaaDyszAXFZ2DU4GXM+IXz908biLCF7C6n8gdC6hcwm9/2iCjKLW
         fq2g==
X-Forwarded-Encrypted: i=1; AKwUvBwPXo89ySl1NC5aaRRlF3SbLa/gJ04au3on6WbyeijnPg3SuEaFMSv+WmpOIWrbnyZHzR/arwIAHA33+o0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL14/TIsWeWbS7NMaUaeZ+vhtlcnNWdJtmQofzrXU6Yz7OhjS/8
	SAcTNYKQYRnhnkmFXXXt82Nr3o0DLLCybMwlIg448AWAYHscKlz5nf8KIwqDitwT90o=
X-Gm-Gg: AYBFou0RAbH9BcYp/X7b7VUZcLne82PqIpDJZPNsfLMzoTmg/stjHT4lJj7/wIpVbIJ
	yAih+d9CNfRtEFYbNgVSMGlCNmzet6CUWbWfW5pTlHDrvSCg3jJFwkqY0kpV2q1hhgVmX8+SIxX
	UQ73j1UsrVybXa0VDe/X6qhQK/A/zIvNIrst1BVU3KksDxRSOg7HC8D90LQQBbcZsPXkZY89sjG
	lLmMusmqQfdgBsh0x5XGxS3DWXTZkHltigZ0SpU/Wxj+h7Ql32fRL1OIsxP6MgFY/HWX/1Z2zGM
	gNa2iaK1EiWQCuPOgeLuzRWniZbvnWOWISRERCL3n2pBDx+hCXlH3TGFUyZ8gEW9K/6fmTSzZTO
	JsFYFjjb7CM2waba3F0ejMnX+EUZEokYFBkecMGZ4qf2cD8jknMQAY+Lq6KgAR0j16/YV3ld3ch
	A1x5X3BalhdZM0WWU/asA+DrQXqAUEcl+GvwBxDt7e8lny6V6gQ21nFXoqgkB/vQO6s1lq7iafw
	QbXPHnZ4WPgh2OdLu+u1CwF4FGSzxxY9Pp/EkJlqEYxY/g/SQPSWEzing==
X-Received: by 2002:a05:600c:6989:b0:4a7:557c:530f with SMTP id 5b1f17b1804b1-4a7557c5341mr29257955e9.1.1793030521006;
        Mon, 26 Oct 2026 09:02:01 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm190279185e9.9.2026.10.26.09.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:59 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Chris Down <chris@chrisdown.name>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH] MAINTAINERS: Add new "printk" mailing list for PRINTK, PRINTK INDEXING, and VSPRINTF
Date: Mon, 26 Oct 2026 17:01:28 +0100
Message-ID: <20261026160128.12581-1-pmladek@suse.com>
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

Reference the new "printk@lists.linux.dev" mailing list for PRINTK,
PRINTK INDEXING, and VSPRINTF subsystems.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e3f9f2751fe..bf0a12274e68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22211,6 +22211,7 @@ M:	Petr Mladek <pmladek@suse.com>
 M:	John Ogness <john.ogness@linutronix.de>
 R:	Steven Rostedt <rostedt@goodmis.org>
 R:	Sergey Senozhatsky <senozhatsky@chromium.org>
+L:	printk@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
 F:	Documentation/core-api/printk-basics.rst
@@ -22219,6 +22220,7 @@ F:	kernel/printk/
 
 PRINTK INDEXING
 R:	Chris Down <chris@chrisdown.name>
+L:	printk@lists.linux.dev
 S:	Maintained
 F:	Documentation/core-api/printk-index.rst
 F:	kernel/printk/index.c
@@ -29851,6 +29853,7 @@ M:	Steven Rostedt <rostedt@goodmis.org>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
 R:	Sergey Senozhatsky <senozhatsky@chromium.org>
+L:	printk@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
 F:	Documentation/core-api/printk-formats.rst
-- 
2.56.0

