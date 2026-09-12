Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41986391E72
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242968; cv=none; b=uN+H/qWk79CmBryaWl3N0BgiEalzG5OKe+EAlfrUrNe2DD+2DxXoTkLdhqkOoV3aUVijJQomLVydEjYdwI1Y3TfyCv+pIUiNHi5ACkEGW39aqcCZRTIDT2fYlh3x9Shvk5INtL7GZzzWvYVIbCzcq/xOhZ5L3xxhbctkvuaj+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242968; c=relaxed/simple;
	bh=R7KzqYlc77nKhM8iwHaTEz7kvU3XedYSYPxeFsqKjG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DZMuoNndu+J8WHEZIh3qhxDfaPoQM/ox5OEFSCqgHlRiuyY2JTnoeMtzwFxco4czArUTFEqOjRC5CDYvTaG11jPYKW9fGluq5Shhe2bfUkaQNQ8effkmZ7J60Zcl15VFSAqfKi6Fw8cJ7cDNCGno2Fs538MZ7qPQUu2cMT0IYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYZ1HeFn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYZ1HeFn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e6e69d528so6344815e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242961; x=1789847761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GysJsE8mePqJNLXM00GRKUzojaP5JqBAXeEHJ7TcA4=;
        b=LYZ1HeFnQQbHEJmYgIoQL6I6Ij8AtBqqUmDy5Lzegm7AlriG6HY7BXTmlA0+rscQau
         diy7iBQcPviLQcyF4nF8pl0a0tBgwwMNlJgiDYaWseto31jdA3LIqUYAvn+QzgNlZNFp
         acGBSWg8Vl5bZkC8DYDUNZCIfrvbuCYDbMmpVA2xpuADYW8G9pbLp+IJtzYevmm/MAW8
         ns2WWumWOAH2jI+CfvXIz1hoYDatSmUCNElDQAK81cbYg+QbOZwW6T/nNxj0v08fYWvV
         723zPql4/XZfmXXdM6jjU+X19pVTpmUsD9dIhnP3W4a+NQfdFyAip5/4VTdChX+BtPru
         xLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242961; x=1789847761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GysJsE8mePqJNLXM00GRKUzojaP5JqBAXeEHJ7TcA4=;
        b=PEyP/V4ofZqI3shq4kfZQavNuQaWOoT8qTK8qQUqEriQhyzIBUD1sIPbn4l+Od79Hu
         07ldiE6aldZW2KkpLO+m9idYEmDrsw84Lw+JglPlDyfxItubyqYGusqFH7XoGhXOb1Bn
         +OMAILTiNAE5N2ZB7oKs90nz57xeYq0oOaj6ddb6MSoSSshuN1n8u4+fjL/dzq4TnxMO
         1WLPkdzibpxvWXWlF9CxWNvcAqk2ipgI8zavxY66Yp5UwihfUMCcYQoNcD4jIQTqC9IR
         s7bKrNJ+907t4lQLQqwb+63XzHeT4rVovtyZjr7Fw0PlCqg8oA7Upco7qN1xoeG/TBF4
         kvMw==
X-Forwarded-Encrypted: i=1; AKwUvBxazuBydhXAdsJnmHq0QpaHeejPaHzG8tPze8dYxAdp5O5TGRPTfLeGES6mwOY82vP6RLuP+ejMuTj/9yw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMrZfySfsXv2yebVa9ZS202sYDCJGRHLPmLWtq27QZoiainq8V
	XTkRz7rdD1X8bOjwxbl2KqveFO23bxmLFVSLBHEQtd11mrR6uv58NbW5
X-Gm-Gg: AYBFou35vuxFXPJVZASYeUQ0HbldkaPaNJhcVZ1Kx8CWGF6CH7mTCaslGAkMNAc9fBw
	InBEN9o0vXctrabMRQcNpN6BzLpDnuhQ5qnKPXWja4Z67ExOLyXQ/PnWFtYq/WJwqjSQX+Q3LFk
	XyOQtt8TTYsUt5zYkudQLyt/T8BJRXOZzgfFTMzbRHJzEgHFIyHxeuhGLNY2A2KTXvdCKihdjJj
	qFbGpSbz9WGxu/K8Kj/1vbOJKG6NUTiUVc5VhLEpS8PCQrgddMzOXXP7Ewim8A3v+2rdjHtnym7
	zhzXS5kFH+WwBaZlg0WxJHJfwlQBmmD9vfItm93PPDTwC2gHac4T8o1G7v240aO+yd5zwydf1xF
	hZWmz8cFW0ekykM8M5NHk6rUeh25ZRkjWs6tjprKAug/vcMkgycAT7vFkrdk7/tpyG5vwfBgztZ
	D/etxht9+eirCkO1Td06Agh23w1ny3KpP9LsG96PsRFX4124fdpuXOHxNrPhj93EEYnBGZkqpxm
	4/zidxgPHRRBfSAUber+7dA8Dq0ZhBqLEW0ipK6aIdxyDkRco6zahi/LHe0LwTscgO6HYB4dxA+
	ShiZPV6FUxG6jiZM4zAzTAnLPyAm7oImT2qVbD5Wz2RnoXvwCKycIraz3e8izH7WD8XOd+cxA6i
	NOnLu67g=
X-Received: by 2002:a05:600c:3b18:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49e61646becmr99559535e9.0.1789242960978;
        Sat, 12 Sep 2026 12:56:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.55.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:56:00 -0700 (PDT)
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
Subject: [PATCH 2/4] ARM: cacheinfo: count external caches in early_cache_level()
Date: Sat, 12 Sep 2026 21:55:50 +0200
Message-Id: <20260912195552.76673-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
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
-- 
2.53.0

