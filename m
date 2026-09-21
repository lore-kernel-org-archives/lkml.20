Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD8E2165EA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970429; cv=none; b=GeE5ksxhCLTusnsKmO1kPVbDthxHj0oNIpNdk1gpa+ZmwH7GDtUBuLjdIoKQUXXW4bYeW0+vg/weoB5Hq5aO+laQ2iUe/hF+QHrAs4HrSoxgG2Kj9BT1PLyQmOUhACBmiQMkzw86Igm1Y1V/IkFDEYbW7PuiV4MYT5JV2kUoNPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970429; c=relaxed/simple;
	bh=onN4wmQ3R+mhzbGXit5pCMgHTHvfkzs4ty0N89GJZJc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T/4xUw3qcvGVgdbxpOsHg5iiHw2OKO+JR0on5dFEWBQqkLmQpUlhOqGj2jOhecdUmfH1KzVZ5X895hLvNz2uO8MIpPXBCPw5eJa7+8MkVSjYp3s+PWof5oaG16eLCI3y5xqAEKo6cYeJ8EeDkiPpuux4N1NBU95demTbuJ7HC3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mecFNc0B; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mecFNc0B"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so14249005e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970426; x=1790575226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ro+FMNk45PgRPb4vSmer/o4ptFIHYgVUebCic5ooA+w=;
        b=mecFNc0Bmgw4HI2iU1fW0sizaPljl9GySPubip6PUHB33anXkUSXrSoXFJWJQm4kTt
         /pyw+9/Hp/7ukseoTQR8U4JXCspuioKlD65vUH1yULijjad4N69jqoLo2Z7RC9ZPkX+G
         rZkdLSMBoObVgyUpiDgbpF8YIC8OEjzsArrZgvVymjaney2qA+PioQECYXIZo2K/VOAe
         AdQkFlgSQ9VYNGExyXdeOIDp3vDo+qju9BL5rkjc9kqnz9OtL98a1MB3g5ab5NMMQd5n
         sC8juWIXnlWo+oG1orFkL37mLlq8Yx/sSsmUkkZu2MbCM9LQMorbW+wTEfzIosLHuFKQ
         Xa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970426; x=1790575226;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro+FMNk45PgRPb4vSmer/o4ptFIHYgVUebCic5ooA+w=;
        b=tzuUnF9oJKr73SFtVph0lJgw1BXFSaYWuaHDc1tSR6GgkWcj9k87qnqQic3/6M5yqe
         7bv9jGu3ML5Lm4lXhfYOwIzzfY6MOv0ilIeWZ2BRNr1MnhM3KS8aDkFB+T5tCEJSt6Do
         g7nuVpJqh2KnpCSx5WBmZDgKsZKmXk9HFY2Yw8EQ4nTlh4fF8VO5CUdhNDsDa8qc7Pqb
         RxoaWmztbhT+QuO5fTUbUxcNsTfnx94+yut/DnqUU9KxR2AxPeS/M5O4wKRuAyn4fW0J
         6h1r6c32kfRqaptnxksfpC/+M6YRcmBI9dlXA+gnIJdUULwAjckCRCwctQ4KAa6PV4eM
         izRg==
X-Forwarded-Encrypted: i=1; AKwUvByruDyBgelunFM0xAeBI2nmsJi9hTSMClCs5hGPiVMSFcftmlrLU9vE8MHzBrQVirqGy5D6Od4+KjwoZu0=@vger.kernel.org
X-Gm-Message-State: AFuF++nQGdyA5gnTh+W5+SMuazqPzTLsMtZTxUmxVjtNV8VLdEKCs1hm
	ZfBktxn09HEQgAEhxZZKAsrhdv21PYTrP5ueF22QlfmU6O6C/xWMB0WC
X-Gm-Gg: AYBFou18Hy7ubPjffNc5NZlkf2BjkC13o+qBqifVEhIu8ZRYRldRrwftIfynnChWUA2
	31dbCtrHbTIE9W70PjtmoheDyBKqsgJ+ApL6taYotKmdUSWD0f6uYbCnoIdCl5bKqcn2gutMg/D
	qHkv1F/wfbH1kqrFQHIhzjHFVgqbOoLs7AI20ciuhyAwDqQjPoYheBWy8Qq7xW7g1dYE7ujxhcT
	UpoBEgRjkRfP0bV3qFz0kIDf/n20t9GIrY1v8JkhL++0jsUWrqO93EEXVfs7FV9CEzgO5mFTfNs
	j9XPZ5KwHNsB+GJCHOSLbELwOTYi47n3r+SUeHb0O1WlSYK7oqSvJINNUWwImjtCiwGszPuKK8s
	PM8o6cUBZqOFycxHZv8wzkFuxkhBBYuljJb9z8xBb+ZsqQ29JZ+DFkH/OjzBwCwiQnL8dZtKIUJ
	yMRiM6mlXdKb6oh2GljZbJojjf9Yxg2jZNCy5NnQdJqA2k1pby66v91SUilsHaJNrEC7vc7qGaT
	0qVQEB9dyLXAVq6qAw52TUFhX2vax5E5XN44Y++McmZDIN8IIvc5Om79u3eevFtfAysKsr6nWwb
	lys5TUFbCl55OPXxM3wauhrDQersLspqHwCT8qVQ21p+a5OjXa4+Z8xqAtwE6IR88pQkxLyu1sc
	6yj9juNMef+BP
X-Received: by 2002:a05:600c:6305:b0:49f:c2ef:cfb9 with SMTP id 5b1f17b1804b1-49fc56719a8mr103694715e9.4.1789970425753;
        Sun, 20 Sep 2026 23:00:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] ARM: cacheinfo: count external caches in early_cache_level()
Date: Mon, 21 Sep 2026 08:00:11 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-2@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com> <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

early_cache_level() counts only caches described by CLIDR. An external
PL310 is absent from CLIDR, and its arm,pl310-cache compatible is not
accepted by init_of_cache_level(), so early allocation falls back to
an incomplete count. init_cache_level() later adds the DT-described
L2, forcing reallocation on the secondary CPU with interrupts disabled.
This defeats early allocation on PREEMPT_RT.

Use init_cache_level() for early sizing too, so the initial allocation
includes external caches described by the device tree.

Cc: stable@vger.kernel.org
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260912195552.76673-3-kmehltretter@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Fresh full-series rc1 retest: three builds and seven QEMU boot/CPU
hotplug checks passed; see the v2 cover for the matrix.

The detailed testing below was performed for v1, before this rebase.

Without this patch, patch 4 keeps the warning on QEMU vexpress-a9
(4 Cortex-A9, PL310): the early size is 2 leaves, init_cache_level()
wants 3, and init_level_allocate_ci() reallocates on the secondary
CPU. With it the warning is gone and the cache sysfs tree is unchanged
(L1 data, L1 instruction, L2 unified shared by all CPUs).

 arch/arm/kernel/cacheinfo.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index 860eeb03cfe5..31591c947254 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -111,13 +111,6 @@ static int detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
 	return 0;
 }
 
-int early_cache_level(unsigned int cpu)
-{
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-
-	return detect_cache_level(&this_cpu_ci->num_levels, &this_cpu_ci->num_leaves);
-}
-
 int init_cache_level(unsigned int cpu)
 {
 	unsigned int level, leaves;
@@ -146,6 +139,11 @@ int init_cache_level(unsigned int cpu)
 	return 0;
 }
 
+int early_cache_level(unsigned int cpu)
+{
+	return init_cache_level(cpu);
+}
+
 int populate_cache_leaves(unsigned int cpu)
 {
 	unsigned int level, idx;
