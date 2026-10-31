Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424426;
	b=3hBEjcWOjPdv8Y9Af7Wy5ZI2mdqBM90FDK2mr6YFOTEpVviOG0kd5S0GvCdLF5bXAguZ
	 W/wXza4ClgbPSWQ19uLQXZHc47YSI+6OKKjBBAzO6NcYPJ/5EixZa7aFXTpa9Tg7yxfeu
	 MVm0PS6SrOmID9ZJwOiRwgybOiB1sbvFN0TSOVq2Bsg19czpwR76jklbq5GtjIfauw8sd
	 kENoPPR/K3+zbX79nZxcqepyKK58z7cpDdOtRhepzt87xLEK8uWmLZaBse0vQ6fY3i8LH
	 f5XZD96SRPL9FPbnDjoGnrW7HmUsTdIcecaF0rq0aOe8SsMYMeJptcMhHyZ3kzCVNPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=isOGI4FSzz2pUsIsYAWF5XAAN1W0PAaZ0EywmlG30g4=;
	b=SrCuDEg9B03uVNZIbmWV1eFYjxJWf+qaK/EUUbNQaouoQGxVgRGThbMBGK18b8axH1I9
	 cqQju/oWA/iONJxvswLgNHKzrcIG1XASbF0i1RPcuZqI8Jwo3m+MeeyT1M1uPBnELhyYh
	 /ZUxjNJQdrj14ZvuQ0ZikkODQBylt7CEr4V4OohFWDuDp6hZLkuaCrqxe3hlAVZAyYndS
	 5uqmcxSowL+MAKCw+IzU8kPFKd9f76vWkDV2xh6d2H5hdTXfkM64ONThbLrEuty2OCxCZ
	 CtX0imvtyrB7yCwaNSYAJQvcdOiyhWf/xYvYZ0lnYOUnvp/D+XpijTYu+ngYk+z+NVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GxoOqM8+;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F672606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F672606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GxoOqM8+
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso12212015e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793424425; x=1794029225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=isOGI4FSzz2pUsIsYAWF5XAAN1W0PAaZ0EywmlG30g4=;
        b=GxoOqM8+UOka0XeuWQsrQLSw7IONpuBV0WQ03BssM4B9qFVCLAlwi6auFbiQ1VbynE
         8vxJDsSpbWi6WsYgp8gZQSJZj1DmxZV4txjyg5C8Un7oMRIv7i4U5sL24XAzq3wkZjH1
         XqQ9vk54yjQQptQg8PSrTk9Y979O/KOM0uQ3lsPFN0IGlkHxfbt53LEkuKalhkeJHcEn
         1MPfGFR+7L8ilMh+oTpwUoVOIdBtplS3iFqb9ORTRI1EYc6j8LEZpxQ28Qq+vBpDGQCn
         Pdeo9v+n4N7QiqVKtMPIhSSISi0IWShXN9erB7Y0YyCxhC8Db8rU6Mnn0elmAFLpmptn
         eqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793424425; x=1794029225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isOGI4FSzz2pUsIsYAWF5XAAN1W0PAaZ0EywmlG30g4=;
        b=UPUN6wStx7nLQL7W0jjL66qxJ+5RPItvTX7Mr6nap1NbqjhFpmcUcxVDlbA5l1wnmG
         hkEeG+MhwX9dnOWJegiIUrdtZPjEetbwNmVDDyXmti7uMP0sY9mMZqn53Vyf1djVsnUT
         EJFxCHtRVHaXwxDOnDtAs6pCOwKaNLFH92OrWNynXILH16uyjGmLWRJSr2E9InCaiz3J
         Ic4iSD5Vr1hqzvn8b1ODUedYBnZrxekdHxRn/FYFbKpvo8jeBIm4+IZ+lHSdKE6BiOmf
         MwbzYI4QEJ4IU7sKrMZZQtJ12A2bZbn4ia/21GJX8U8fnfN2pP1jv0YPcy8m1YGx5zyh
         LN8g==
X-Forwarded-Encrypted: i=1; AKwUvBwlLUkXcksSIpVeNYYE0jrapBlDTshyJgVNZ3+qkugcN0n/lyRzJ1lJfYkIlXFQgpJZXipZvLJQWKa/cw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJMuVAr5YdZknRohBNekkjLdBEU3H4dbq4ztjVxILV++5zSPt9
	zuId+qnbDqVymMsF3LlaO0cv7ZGzbYcCeu+WP80TQDSiVDBwGacSN9Cc
X-Gm-Gg: AYBFou3oWNdc0SExTMo7RRGLb1lqlSbI44LK6Q2u7i3uqTpYb/qCplOvLZWSFqM7Mkc
	JFJMlurkuOKH01uoZcqOAOZVaYrLAHj+ZFNu4jphnUM6aAdlflz0P1gu3Au4TXiBXE/eWJILr64
	H2PkIcZkWVxJDFt1llEsGCOhGhphcPyLoDzzkGn1fX2YNbX9cMy4daxBifJxWGJeOm5YrLGW3On
	y4LkOxBZvQ/taZ30DwxFXfY9OZR16EOiA0NfuHxJW/BpFAXdVcnLxf0/p1Xa2uLMV8A2CijP4iJ
	18/JKhDx4tFrxPw4YjIaa5uCA7VTMjYantvZXMuDdqbfjFJC3fkn0K78AyV/Nf53V4F3SADI7fa
	2DVon5fVwbykQl5LzcJNwp9jVoUdSG6Xrz1CUsglEn+oHsOwB1IAk5lfnXbrehn5gpGJnWPJ/6m
	PB0ThkQrCVF6S/vIrSriPwpIHAnIl3MFx/QfmIPrFGRx20roFVkle9xWUd1gV1q39oatkyUJIt3
	IRUANb94fkuzFq2ihvzZZIQLDZKiuJK0+bPtsnnsobolC71xULnGTCraDZETyiXCRK9ePsTeRWw
	2ISSlvKVva4zfCnxslym64Uex6akCsnSy11eMD7ZjxB0
X-Received: by 2002:a05:600c:1d02:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ac16bc4731mr105048385e9.8.1793424424687;
        Fri, 30 Oct 2026 22:27:04 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm180158525e9.6.2026.10.30.22.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:27:03 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] locking/rtmutex: Use EDEADLK for deadlock handling
Date: Sat, 31 Oct 2026 07:26:59 +0200
Message-ID: <20261031052658.2863067-2-thnkslprpt@gmail.com>
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

rt_mutex_handle_deadlock() checks for -EDEADLOCK, but the rtmutex
deadlock paths return -EDEADLK. These values differ on MIPS,
PowerPC and SPARC, causing the handler to return without entering
the intended warning and scheduling loop.

Compare against -EDEADLK to handle the actual error.

Fixes: 3d5c9340d194 ("rtmutex: Handle deadlock detection smarter")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/locking/rtmutex.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 5a9534c715b8..e968e88834d8 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1229,7 +1229,7 @@ static int __sched task_blocks_on_rt_mutex(struct rt_mutex_base *lock,
 	 * enqueue on itself just to untangle the mess later. It's not
 	 * only an optimization. We drop the locks, so another waiter
 	 * can come in before the chain walk detects the deadlock. So
-	 * the other will detect the deadlock and return -EDEADLOCK,
+	 * the other will detect the deadlock and return -EDEADLK,
 	 * which is wrong, as the other waiter is not in a deadlock
 	 * situation.
 	 *
@@ -1684,10 +1684,10 @@ static void __sched rt_mutex_handle_deadlock(int res, int detect_deadlock,
 	__must_hold(&lock->wait_lock)
 {
 	/*
-	 * If the result is not -EDEADLOCK or the caller requested
+	 * If the result is not -EDEADLK or the caller requested
 	 * deadlock detection, nothing to do here.
 	 */
-	if (res != -EDEADLOCK || detect_deadlock)
+	if (res != -EDEADLK || detect_deadlock)
 		return;
 
 	if (build_ww_mutex() && w->ww_ctx)

base-commit: 2a500a04d6f969318c05f46aedb6e73fc1963a00
-- 
2.43.0

