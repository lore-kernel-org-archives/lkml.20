Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289454;
	b=S7By2sBcUk4dkRZjVxWNYWlu3k8d9AXZrBzvswGJi+3qtdfgmNnNRPEYd2VCl4w0GtFE
	 k5OC1gdYa9rqsnr8GmA9AWk+rh8ti6JnYBcVh9bMBOpp7jD7yoVTNrQOp6h/0gLf6H67j
	 qXd8pD+98Fcu+2VmWMJIIckTr8oufYz45hT0wZDk8sG40lyuiz5VzO779p4VwdAoAsvQa
	 sAzvAhddbIrNQxmhF477REtJ3iuJfz554wZMMS2YXMt4KlX3tG5vleBovDf82dTeFAFS5
	 OM5RGEaaOmxn45v7UjhuaqhnA+x1S3aEmTZU+uzoCma51uaOXdaDd1KNgb5oiDqatqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9ljX0hqkFpVdDO4bWmsipvvF8GC2kb5FdkDBtLth2A8=;
	b=1EGzHssb7qqIGcjlbrJlUZ1RMdyGU+JTc5iz5uN4XHcf5G4cn3pob8xOnWZcYC9cavFW
	 NGcQf76uwnicEdjerQl+HcrzzVACsnQgxYVCoBSgNXalYK4j38aOSeAnKKnYA2RiJokeq
	 a6WHqFVuQWimzGPUEELITdHH2CbBtDJJX0bQdJPAhCcCPX159P+xeqfAyBpoVgtYDLx05
	 cFndOxE6XX+sALOGV6jLVS4WfdloQfE4biyGGChJlJ/X0uvdjmg1haqatP3K/dlk1U2gr
	 r6itYzp0X8XPjvKnDaMwBF2xVHruTKVp2Mgc+cmsCfHaZed5E/uYo+1PSx1ScHzJiBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=RhJ++tfx;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B2F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B2F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=RhJ++tfx
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-55e02e89f78so484727b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794289453; x=1794894253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ljX0hqkFpVdDO4bWmsipvvF8GC2kb5FdkDBtLth2A8=;
        b=RhJ++tfxyGJGDpKIOJ8gZfcgR0zcVVMYBoUUA1kFSVONTcW6gFCeveaHqWVII/dTTU
         hexjA6eF414ePESlgAYZmU6NyQ8JgEaGpanTuQIWjPatc9XaMyWOtVa4mm3z/teCA97m
         GatEe5tRuO2YgD2i6GFxHINJ7pAlNrdpacZs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289453; x=1794894253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ljX0hqkFpVdDO4bWmsipvvF8GC2kb5FdkDBtLth2A8=;
        b=g2Xp9ocI3VccS1YF1phulEYqfz3U0iSBs9d6aj5UVIi4weigE1jxUogvgyLJ3JXvr3
         RrmqjIraDzm7FDrv7QDzxvIiDI+RNGrTOih7/PyP4yTHUuT1b/HNM6w93GkwYU7ywcMf
         khmaXH1jIRbAug6KQDfMncMCqqqJv/U5298TAE5wvVRafMj4pG04P1Ob5W1kiqn6oRYR
         v+uvKlQQFrzbzJLaS5rYoCJwURCixERRyI/5M+IFIUJVEUYaiPO5YNCiHg4Jf0pwJhbl
         6a/2m93sGshVJy7fovxn3YGKha1x/Zf2d+X5Tsk3DydKHk+2TKNQSEZ7uMC6Ni2rLL5E
         +8uQ==
X-Forwarded-Encrypted: i=1; AL+hErH0lKp/D0X+vxiCZQbXEKO/JJ5GdyHBQ3/Tw8lBHSk906p2OQwfE3w/zVOPXCVC6l3WWoSfX1qiZEEHHgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QOwVw7TI/Y/aPmiYsV+m8VDfQ7ARZpoTca+248bDN12S31ruC
	s5FjdpCqnpdIybiiUUFYPHNrg5LndJAdTCsklcLdPW3T+DdpAa6xfRoNM/hQhj6+cqEJk44jbUq
	+rA5hkz8=
X-Gm-Gg: AYBFou29J4LG/4NfzkAv0bkzeJ3h+X/0b7GOP/Y0123/aHRLtQc3IgvVgbHO6LwBlRC
	z+23oo1KJTLN3Uuc+SKbAgs7DngkGwXSgg/n9x8WWOZMvUVAltmRTnGPQUg4VCeyxiz3oILUEzs
	QPGPy12mX+mnVsO8FM7JvZV5q2yKSN7BCOowEvMnswwHYLTnDbd9MFsZcdAo+nG0kXxGS9RgprD
	IsvdRQcKOEQ5/+VBA8bhE6jTfjx9pDcs01APyKDRrNja81sXIx1UHDOnFSHBCoMTnMGycbVWc66
	L99qWVymczF8p3J9zz6znirr8t/zFWztsC7ft2NgmCfsHtVuKyhghr5U3Er6wQdg2fq1zmwjdpX
	TilY2NqP2rfTGCsTGqiyZEjWGtRsaz1eQe0maTd7qYsd1TKuoyQJEoTpED8x/mhLdkmuZ7e+6WW
	unA0jJgK1UjcAguTEwxVy9Cuz19YuKnPfJURS0zt8OXKRWYe27zY4xoe/0EjjcSexkeQkF4aeYw
	RLaDzIvzeEH7QkLPK3XJeXWdvEd8gbBXKFq51XG/RCYvbQgrt102q9GUnxsK5gjdoJTnhgtHwvg
	cQVkY1L6cBcIxoO9j4SHbaMVeLsqTL+8M7gnXEgLv2GVDJSyGFpm+FGvXK49vGwi/7SOsTpuG/G
	KfXgKbt4BIg8khjdiagjMFimzCLhCUA==
X-Received: by 2002:a05:6808:3209:b0:4a4:744:a4ff with SMTP id 5614622812f47-5683c99ce5bmr1527259b6e.4.1794289453346;
        Mon, 09 Nov 2026 21:44:13 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm1258958b6e.7.2026.11.09.21.44.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 21:44:13 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: linux-trace-kernel@vger.kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tracing: Validate user addresses in faultable buffer copies
Date: Mon,  9 Nov 2026 21:44:11 -0800
Message-ID: <20261110054411.75788-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

trace_user_fault_read() uses __copy_from_user() when no custom copy
function is supplied. That primitive assumes the source address has
already been validated, but the helper only checks the destination
buffer size. A caller that passes an unchecked kernel address can
therefore cause mapped kernel memory to be copied into the tracing
buffer. The original syscall-array tracing implementation exposed this
path to syscall arguments before the syscall validated them.

Use copy_from_user() for the default copy as documented. Non-user
addresses then fail the copy and follow the existing NULL-return path.
Successful user copies, buffer bounds, and preemption and migration
retry rules are unchanged.

Fixes: 64cf7d058a005 ("tracing: Have trace_marker use per-cpu data to read user space")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v1: https://lore.kernel.org/r/20261006225221.54513-1-kylebot@openai.com
v2:
- Drop the trace_syscalls.c change, already fixed by 097fd0050089d.
- Keep only the trace.c change requested by Steven Rostedt.
- Point Fixes at the commit that introduced the shared helper's copy.

 kernel/trace/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 4ccdefb5c3ef..e1127768c074 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6289,7 +6289,7 @@ char *trace_user_fault_read(struct trace_user_buf_info *tinfo,
 		if (copy_func) {
 			ret = copy_func(buffer, ptr, size, data);
 		} else {
-			ret = __copy_from_user(buffer, ptr, size);
+			ret = copy_from_user(buffer, ptr, size);
 		}
 
 		preempt_disable_notrace();

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.55.0.openai.911.g06873a30d2f3

