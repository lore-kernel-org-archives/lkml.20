Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034068;
	b=qhbUkNcHZNhCul/AperMATGUhEQYoJHhMz4gx39ViY/wwHiM7tAz/HDqLkYgVAkYbtMl
	 ki8s/u/bqlQO3xS2BVygOjLAVgoZxnDhCeUp5MI4v3K57kAkuokHp43xtcavicoAJlfOG
	 NGPcF5dDT6uLGdLURZYiTG47j3M0YQEHTO69jV7egbrB+8iwzvVZEhxYD5+XXZzx39moG
	 PS22KQqE1PscHmmnTiIanaV65dwsGSfIdiZ8c6biJuRQvZBOI99kG5+peKo1OenGuOrRt
	 EWaocLeKXuD+ARnVvjeL0l7gNHhoOJ0dHCMSqCCiBAybFzy5NO0bPHy7zOFByfhCHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=5Ydy4SrZ5ujWtkPCvnsBn7qPeS/tADlr85tTPO/ygQE=;
	b=PZbnOo5dxogt69KP4QeRnR1wcif9fwDItgf8lCvAaclgfMPkOsyEivMk/hiTeRqAgCkP
	 nXTybPzAtwSvP4iP4fKGV7xkxv/AbbiAhfKMyO2zDgCNLEDliNJRdrXc6HEdff4Ffbyvs
	 5npMiraA/dmGvXA6d/MF3i6knBmmfIN1V9qs8Z6PJa1ElzevlMub9QX0/GSN7HfNSm0OE
	 nxvKpdWCy5ESOukx144HgABVj7LMlyo6q+ZNJ+TTxaFUa+zAWnFmlKloafgofiUdffxHn
	 I+lCzIkBgZG4GsQst6cL1fzfmR4TuXdU3VbShfltmJzZkT1IiJ04DVtqHcDhypaOjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=A2DuRq+o;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AB4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AB4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=A2DuRq+o
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so2271945b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793034067; x=1793638867; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5Ydy4SrZ5ujWtkPCvnsBn7qPeS/tADlr85tTPO/ygQE=;
        b=A2DuRq+ouNiZhDxs72yVkhAlv9jb4uTMtBCF77mn1/O2pHImsYX4ijhR4NBvk7wDGe
         pl2/1qRW7A22RsVvUOvuJeQoS3I7jcDSvu25r12mNwk3TDyXZl028AePohHMGizBOQ5N
         r5X0S6hIH0CTyV1mMtaMsNJssX+2a+PxVLb8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034067; x=1793638867;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ydy4SrZ5ujWtkPCvnsBn7qPeS/tADlr85tTPO/ygQE=;
        b=wDJZDkajHhhqB6pfFBdixRzrHG2CmySUA082bY8CvawCcRj5U4y1SjE5PS3LV2uK8y
         IUaMn7vPyNKcnZyVxuOIqiZ0E0Okhz1u7Big/D+MYOC/Fv5j/2o3pv5ZSLpDKOkx5pM+
         m9TpgvThgFoS9bWe+4CtOWMmwkPBIPLeJ/BCCI3vPyez17zqnEwZ3OK04f4zGqPgzgOt
         u9QRJXDj7nX9X250riOspOwn8ictEecdskmq8LNYOW35HMjXyrhJ4+co07JL8v0CKgI1
         6z0b5V6/UYjIZ4nK4JiNZ/j0PWcAGZgf4jk618gVCDYHdbDH31GL1BjT8SUz32Gc9Vca
         kSUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkGODQSu+oh8IuTyvALNy8/NNLLizIjQ/qmkdbDAupP8FF3bbp+WvC+qgsXWhk+aPyIN2tXlvXb4F36aw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3lyTtZWCAGiXwlOiErgwfGZgWPVFjytcgXkKrzzplnWDXqmCA
	6it3T9SH3mVDi8oPS7NVlqFU+jaf0MEZiLBuEdk61hYXHWSpEqQgln0oqMXfejXZ66g=
X-Gm-Gg: AYBFou2Qq1++3wRp9R/1WoiJwxwVhP78D9d/+jCO9yvrj7y0myLEzwFPTYs3GBH118j
	2Cb3G/Yd4j1/Ahuqrex3MhiYakaZz+5QQceIVDqekusM2xW+CTOxrzxmrJ3sX/jDAwKir9ZBWkb
	Ryxdp3/d6aqXS3A7D1iAJfzM+bgtQSnAErdGR68Mr6iwPBdrkZ3cQ8oSdpsN6EMQsb3II+zVqWy
	rMgBvFtvwPMxtFAHNSJBoTMd8GcMHEKdo9djO0BRk1Ltks2TihjoZGSqbhlPtxEQv5yB9/chWYp
	p6MCW37JEnlwTBU/S1KnOaq4lU/mgwfLZ5wPDWbtih7kcvVZvJYn3HaK4Q4Bf0urm89B7iLkJLj
	4FOTVfaa+toegbpVDGRmAQWiEpAlaWgJ97hqIKMPE50DWDsW8KsjJkDOu0UQBGUsR1In/4bBP26
	1m7cVNASm4DYIOa/Z36ARTiAVR0lpIYNFNUxxcA4U9KJkTgfwX9kb+LG9gaUTJVq8GbsYWE6HhZ
	eIebzSm15kRA9m34Vt4OeDDfHRbXNIYUYoZ9NTlsE1JndYqDtgi/IAXo8eSNHx/P3UBLzJ0Nqwk
	Yuv6VKGBaJRK6WbYyYh+9K9gv9FROyMnG+2ZWOghtjg98pcbUrcBxQfP95tFMXueQq40200fmtg
	shzUmgExji6Awhm4a8QErdPc=
X-Received: by 2002:a05:6a00:a21b:b0:89e:259c:cd77 with SMTP id d2e1a72fcca58-8a368d87aedmr6495038b3a.57.1793034065729;
        Mon, 26 Oct 2026 10:01:05 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c4e8616sm1699563b3a.56.2026.10.26.10.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:01:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 01:01:01 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add new "printk" mailing list for PRINTK,
 PRINTK INDEXING, and VSPRINTF
Message-ID: <at-HTeibj08ZG4YL@chrisdown.name>
References: <20261026160128.12581-1-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261026160128.12581-1-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>Reference the new "printk@lists.linux.dev" mailing list for PRINTK,
>PRINTK INDEXING, and VSPRINTF subsystems.
>
>Signed-off-by: Petr Mladek <pmladek@suse.com>

Huzzah!

Acked-by: Chris Down <chris@chrisdown.name>

>---
> MAINTAINERS | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 1e3f9f2751fe..bf0a12274e68 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -22211,6 +22211,7 @@ M:	Petr Mladek <pmladek@suse.com>
> M:	John Ogness <john.ogness@linutronix.de>
> R:	Steven Rostedt <rostedt@goodmis.org>
> R:	Sergey Senozhatsky <senozhatsky@chromium.org>
>+L:	printk@lists.linux.dev
> S:	Maintained
> T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
> F:	Documentation/core-api/printk-basics.rst
>@@ -22219,6 +22220,7 @@ F:	kernel/printk/
>
> PRINTK INDEXING
> R:	Chris Down <chris@chrisdown.name>
>+L:	printk@lists.linux.dev
> S:	Maintained
> F:	Documentation/core-api/printk-index.rst
> F:	kernel/printk/index.c
>@@ -29851,6 +29853,7 @@ M:	Steven Rostedt <rostedt@goodmis.org>
> R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
> R:	Sergey Senozhatsky <senozhatsky@chromium.org>
>+L:	printk@lists.linux.dev
> S:	Maintained
> T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
> F:	Documentation/core-api/printk-formats.rst
>-- 
>2.56.0
>
