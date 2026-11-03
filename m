Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725821;
	b=0KMozSKfQRGuPE1+/cAhdj2kVp47ZkqTg5xE4gFh40gqjPO/jEbMmUtajXkz5pHcCCyb
	 ie8uv1dr7VpweKi++h+9SYIo9geNUrnz7OJcFKXRtIlOCHb1BfAobgXFJ8A+KzQ+LD60P
	 cliIS/QgAmMFKgWx7K0VI9e+negIdZG3EWozHl+Qc1+yUn6nLaOE+ozQYwx86LkvCwKaN
	 smoXZupXGDY079Jhns0diDv50FQmPc6LmFosPhQoOCnpo4wU+qebk5Ab/BqCrlP8alGR6
	 bwFCl8hSb3mo86422S7vvw8erzqjgLIA9VpacuPxYLImb2cl68k2u5msD57NfnmL6WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v98czZJjrFY0hKiKY11IKxTSpAh/LCSHwoFbHDSEB+0=;
	b=WnBjOLi1woW0EehTU0/+AfXHZncNyrDQ+NjLGz7TBoiz+ld95X+XdechdNJdNjdNc5Kw
	 OAMBmxB7wxUjTvsRIfqEstr5OiAtH46Irk+tM3etPGY7P8Cdpg3gm80YFvvVkpk4pz6zJ
	 r5pVyylPY8mamOYX6AC5c/d+VE2tRvD+fXY6ffraQmq/cO4rDEj+f+lqKhTLtPMQJ4eDr
	 YUhy9PVMTmIVHOFGH/mI6Ww7J2R1hwquLXjzFoeTpRSb5R49gDXouHi5SgFwrDxwsBLZ9
	 hBKdedcgl8X5bzKnAc1X0+h0mzKL+4fRgXV8GlvTgxnRj2Uows3C43eQKl6uPNaMX9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIjvoPlh;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6067606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6067606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIjvoPlh
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso44537865e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793725819; x=1794330619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v98czZJjrFY0hKiKY11IKxTSpAh/LCSHwoFbHDSEB+0=;
        b=OIjvoPlhEcC/mavN0s5g8B1KSJ3zQtXy7YeWfoqEhXVNkSWKQnNFAeJZz8I2Dh914p
         xxePxGvSW7Y1CE2m/+d9g/gYqpeOwSVuaE+5FzxISuuDYq7YdktGn2C7a9S3JDDjEqxB
         rOZREhKipGyNj27oBhC7Q/aJq0TkeQsrUP3J6zQKpBq9H8IXSgm6F7iWeE4n6YiBn2uz
         Kj0GjbZBofKvVDY+q1MhIxwMb56ytIvN8XmKi3BcSgnkYe6ccGACw3ydmtdvKag0cAd+
         711PVlA696c+VOhublTnygHUeb9ijDFrOQPjAzFUmKta3QEP1PMtHVGy2pwI2TNT2Lzs
         U9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725819; x=1794330619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v98czZJjrFY0hKiKY11IKxTSpAh/LCSHwoFbHDSEB+0=;
        b=uRx+QthFNaok6n5IFrMdgPDpvjqrCyF5AD4A4fdvNmgp1TsCtrPPTi1ficvpR265Wf
         i2ccOiFqFiLfkDpIIIqg8XcOR1QNKqY1LFFZtD7dGZwCTfuJ3nhec45xb8SrS0AyttDw
         KR6Ud7ztNF68zVMR2cyBZmOX2z8CIgUq+7HvJYXjUCEczFernogaaY3TXkWfg5YCvQwc
         tQ1tyHblLfEYce4MgbTkiqAkbLc1/gA3D5ejcKdYUbtOAF1nZA9FCn9E8nT5ryLMGokE
         swPOIMIaT1X3qCw8dHhNGtlaTl2kPCVf6YKdxX9XHBQLiGqJxUPteP+Au6vgNd5GSAh4
         IG0A==
X-Forwarded-Encrypted: i=1; AKwUvBz6hXIRdynnXBYOJKKJ1U7Z1uTn+ZyTPmv0MF9y2BRE34DZ57OMVby6D/WYvnh/K/2mccerjqU5oeeDU24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CQ2/aRT7SYQcnWH6WIGGECGinC0WDxsvlmYj8n8w69vkqpoxC
	vvgolT2kNOKaYUeBZDWAxe7M2AgKuKdPwdSuevyK6FE3zoMYqZgcDexS
X-Gm-Gg: AYBFou3iJFUF+QKTr00olAo/UZPDdMgdYhwMz56U9jNYhapQdlvrw8mUJrkGzgWGkfo
	fe+rKOnc2eEg2LtUbsI1R08gWEiuJA5tUQXdnSVljNKxn+VBp9UVNqZl4QZvx835XFKc8vSQyQR
	rhF/WnJjEoCuylzGtP566MHfIAKtQYdS9yg0Ztisdl8vUJJFpAZFOE7wyfO6EkxZ2QIEH4bPrko
	4dX8Geg2hnVSbLLapbfWIeoMGOOg1hbJMT4yhnodA9ukgfGJ93oOT7UM54xS7JdqiCSv37Wbn8m
	GETiB/+ysa5xu8m4xYiOg9gqjHoH6mAaMnmmQHh3YS67Ruu3oCWF1V+oiGaJghA+ImFRJIkqN2k
	AAJrH/YuYKBRu80pT+19Ju54QP3nNhnFvmJYBnUtk0Nl3uQECma35PDkFOqjYUUki9nemJLKdqQ
	ZKbkYdO38xrcZjmKcfZ2MDXjW1ShQvZ7UHrSurBRWXC0+ZmQ+HxKlrnEP4SknE2T8972HyV+5qu
	vvh/ERuQCsSIvDB5i6WzelcpuGcX/jlbVvLxmaLOylQ//pS3tI8IGmSCY66jE/6No+5931e3hEp
	aYJoF5FjC2YK6oMFbXvBFU98NiXDDCXporeGOcIUckqnOFtC8FQLLPqk
X-Received: by 2002:a05:600c:a48:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4b22ec58f9emr97823365e9.10.1793725818948;
        Tue, 03 Nov 2026 09:10:18 -0800 (PST)
Received: from LAPTOP-AVI.. ([147.234.101.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm112749075e9.3.2026.11.03.09.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:10:18 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	tommaso.cucinotta@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] sched/deadline: Clamp negative runtime in sched_getattr
Date: Tue,  3 Nov 2026 19:10:14 +0200
Message-ID: <20261103171013.2511027-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

A SCHED_DEADLINE task can overrun its execution budget, leaving
dl_se->runtime negative until replenishment. Dynamic sched_getattr()
copies this signed value into the unsigned sched_attr.sched_runtime,
causing userspace to see a value near U64_MAX instead of zero
remaining budget.

Clamp negative runtime to zero when reporting the dynamic value.
Keep the signed deadline accounting unchanged.

Reproduced the overflow on an unpatched 7.4-rc1 kernel in a QEMU
guest. Verified that the patched kernel reports zero for negative
runtime, while positive runtime, static parameters, replenishment,
and non-deadline queries behave as expected.

A five-run VM benchmark of the unchanged static sched_getattr()
path showed no apparent regression (median 110.62 ns before,
102.10 ns after). Negligible improvement maybe just due to noise.

Fixes: 2e7af192697e ("sched/deadline: Add reporting of runtime left & abs deadline to sched_getattr() for DEADLINE tasks")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/sched/deadline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5..7b098da8076c 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3870,7 +3870,7 @@ void __getparam_dl(struct task_struct *p, struct sched_attr *attr, unsigned int
 		if (task_current(rq, p))
 			update_curr_dl(rq);
 
-		attr->sched_runtime = dl_se->runtime;
+		attr->sched_runtime = max_t(s64, dl_se->runtime, 0);
 		adj_deadline = dl_se->deadline - rq_clock(rq) + ktime_get_ns();
 		attr->sched_deadline = adj_deadline;
 	} else {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

