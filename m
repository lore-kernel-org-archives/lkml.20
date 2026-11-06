Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985728;
	b=OWxBRrgLey+6cZiBewbSltJ/uyM86TYexCypz5jE8YMSluTq7OyB1CYPIzltblwvFjd3
	 F2c4zdpXeGf1cM+LNlRmlDeDg3KgdhZn42oQZ8PCT+GpXg5cPGfPSmSA+u1RuZWFoq8Aw
	 JDT4ySrLIeqv6VZTCtQI34sa3S/5IpaI4dgbkjXtslsBtltqljdGO7MPgBA7Wi8wJXu54
	 hzlWhWpx2ywV7iCRCpLS4REsGqroA8E71FA3sk0fkn+a2OFp2f3yS18HYmkV56YaVVKll
	 M047jBeXyWz77sf24mUolPrCgravGmc+E07u0uZUe4XA+R8HsNbGaoqGYX+yVWedPgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z1d9Rq/osPQvOJOvEkzQXVqv9nV0kIEEShdUH3s8pbQ=;
	b=DC0rF93ZVrOitNlRcrJE7CfeL/yiEjXkY43JfScYXIP4A68qn73Mn/QCiMLryg5ywXCP
	 GtxVmZnwPaPENCB1hBhEPj6CZrMw6cXcBqtF4+7BirebmBbu5Ag+nXxKKD2YdrbLt+fot
	 K4YzVojMJovicwcnt9EQVZgDXqYmCheRIR+i55HakvYsz5UWyqSBXrQdlhnim/ZaXoQbY
	 d2CaQSfhsFbweKas9WRFMraexZG5TZDdm8Cxe9x1QEvCaxIPYu4ZaE49AGh9jSuPdeFdZ
	 Xx2qZRcx+XDB0scW9F6TZrRJCJvF3FtXew2SwP8Igb2aGPSJqBWwBrIksfDjYRrZe9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ct7xhBqq;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF79606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF79606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ct7xhBqq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8957615e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985726; x=1794590526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1d9Rq/osPQvOJOvEkzQXVqv9nV0kIEEShdUH3s8pbQ=;
        b=ct7xhBqqAjAHFAkxQe13PdnKjy1lYNKYDj46SYZIX60lPWeDdWjQC99xmcalzfv4QG
         +D6yo3wfYeDaGgFTRl6kOlQZVUArvs7fJv02YtBq8hnbsV+eyUcVOmkO/y4WqBVo6t3F
         X7jmcS/etL44pvfo+qlT5FAKKLcCZ6tycZwb7T2XUw2uVNnP7C9DfBL1ydKcKMwFJM4r
         CNEGYfKcGooe2GTvINgLTP8oGMDGUl/McwlholuPurccP500Flwm1dr6gKkDIWWe/I9D
         v/OiCbpaXGZ9KfF6Jj1Y280b2HZyZBRL2k8SnKBnpFsO1P0vF2ajB+FF+fX1VrzUabRS
         gVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985726; x=1794590526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1d9Rq/osPQvOJOvEkzQXVqv9nV0kIEEShdUH3s8pbQ=;
        b=Vnbs504ICLnLDAzppF4XNS+OmrGa9FrtfC3HmzvAEsIGShWO11C8Bm+kvFH+KJxLXn
         XntNFJJf+dU4k7XOfe+yehJdOS5OBO4CNOQDS+ep0BVHtC4oEHmjZRDxHq1zPpwSCq7n
         DG295pY4o03ZExaIJQ9KL9yYSQN2nhWNXqHGCNq9wWHzvyqulbhYlsRsg5I+8gBSDZ5K
         8EAoRxIM4QYC6gH9oynhm8OLig//oNhBNYrjmoXLssdBcdna/vF8W42MqVNCarmAX2fH
         0UEQgkpgyZM6Kzuv3YEdegq4fviMrkSbY+XcshK589JB9iiM+iHm+cOCW1WgW6OTLj/z
         rd5g==
X-Forwarded-Encrypted: i=1; AKwUvByqP/s+s2ZHuS4fke/3ZsT/oT/3/McjmYLAPOAQF68a8QKnVGaalgkzAEW1DUCL6+Ls/SHdC2NNca5F/ms=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OsWVEm9xW8jHmNfGLWRnuSP0mbHPh78OiLQo4q+i0UbmvySiP
	zVj4lPx6nKJCA2q8kGbR6G6KT/N7WFZTp+fyNliyVd+D8aY2DdECL6m31cpioM/D6H0=
X-Gm-Gg: AYBFou3IGOjWUDvpqKY90/tmEEfr0zo6WtcbmaAknW8C1jRF19b2BHF3+9scaIsmpHg
	mjutoTvWXVYL6UWNxhAd41y0tqOLWNcf742EclO7102w2g7Zjkf3S4WUziiccXuEXWko1aoWi8E
	rmfWSymdklux7Kw49P8CIrqGDfiYR3WLksml3dUxSIo5ckrOzQQsjGNeJcvz+6m/eImCkyOQkve
	4cK35pc6ipE+T4t+zCFah8VyVNG/I4bmCyn7Ve1ydAJHKhpkYQS/ooGr7bTPRCxeY6z/FiFyglO
	cMEffklBVlQ4zZI9zO1hNeCxGqLV7pMeElfSng7VIvkvgvT6QZuFxAus2F6oMqKZJVG/WjbDyKp
	PitfbPmy+cUExMkqKxAPwy0JzfJuf4rRN/vEqPmLVp0t2sHjL4xHEcR1pww8CfB4Vl6wFECh1jm
	7AGzP8AlD/vUFgsn/lLyJPLTsWVXPynLdDO0XcjA+I88q2w2B/HAYhKgpkbpuE4Zuc/y1OYf4lR
	thhzyTh8znDs00hkwaxdCVtStev2lNmaKMSzhdJivd9GVbi+qBYU9fn8eprARgoP/X9zszbuf4u
	2EcazFsuYLD5Ctn0a+nXL/t7yv8xqsRUXk4/q8G/6tzTL19d8zvE
X-Received: by 2002:a05:600c:530f:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4b6dfbabcf9mr52591765e9.24.1793985725981;
        Fri, 06 Nov 2026 09:22:05 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm6631065e9.1.2026.11.06.09.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:05 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 09/16] printk: Do not quietly ignore adding entry for a preferred console when there is no space
Date: Fri,  6 Nov 2026 18:19:45 +0100
Message-ID: <20261106171952.207909-10-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
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

It is hard to imagine that anyone would want to add more than 8 preferred
consoles. But never say never. And do not ignore new entries quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 60923b997e4f..1eb542a321a5 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2578,8 +2578,10 @@ static int add_or_update_preferred_console(unsigned int i,
 	struct preferred_console *pc;
 	bool is_new_entry = false;
 
-	if (i >= MAX_PREFERRED_CONSOLES)
+	if (i >= MAX_PREFERRED_CONSOLES) {
+		pr_err_once("Reached maximal number of preferred consoles.\n");
 		return -E2BIG;
+	}
 
 	pc = &preferred_consoles[i];
 
-- 
2.56.0

