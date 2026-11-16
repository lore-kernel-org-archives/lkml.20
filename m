Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815685;
	b=NAouxprmiUboVXfgaOMtPeuldtaRWcSsccEsupWSllreGuLN7WrqwNHZEp+sECAILCNK
	 VY5XrwLm4buWXo7Ls2kcLVlwtxPlxyKhN5zFhe5ag+Pm36CyHuDpBTh+Cz4Lzb0KQ+0XS
	 vz1Vh/S9uuohSYq4deTYdx39m8kmbufxhgsI0vj5I4WT0dx/3cyBS7b5E6ExDqRJ+5crX
	 debuyWayKfEWKVeONulKGyAMlxz2+Lzc4cD65J2dQ6QucTdJWDJSwffbO7ucpaJadF0tq
	 NapEWYNTQaeNj1BiPg1PyydJ6fhPHCp+4Ez0vjuns8ZfxREInuW1fOG5PVKkAYG13Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wJhyoVPyEIrD5yY2pde0MNrXE6PDsUwt9Ka8QuL+Adc=;
	b=wp5Yf4neXPQ05VO3GJJfLQSEd7Cf9E7GOfvV8G/QNsHP+wsCqelNvBy0tte9Ie9kIGvA
	 gKhlK3eSSuIu+xbdXhABb155K4TukMqTaourS3ohktkONxZN4QXP4ulqQG5q2O6WnQEr1
	 37AFzlASF4RDbUFcROg0ZLl+ixutBGfbu6iZ36Fold7pgoZbHix1P63xQ6FlAVy7Pj/d9
	 dAPa33qeImm2eg9MuWBq86lcFUA6l+9ijvJiOeGuSZ56VmiLAW04PO/vR+WaqCf/wA0dl
	 n2wIObE/X1ISCB4kgO5p+taweibRHY+SWv6Zc4GFKpBxzS9DI1qQL62yumHR5NGi4jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhQUqA5t;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A4606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260A4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhQUqA5t
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so38864485e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815683; x=1795420483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJhyoVPyEIrD5yY2pde0MNrXE6PDsUwt9Ka8QuL+Adc=;
        b=lhQUqA5tQxQyzdAeDP0B7IISnBLRD6tyu9/mhI4hP9HrceXSEkJxjHy0rFBtYK92KP
         ww+JIfzB9y9fTwlYgoxLMV6aCfUuf803kp0Wb7BuiJNjsugc6rgrDeTQPc8Ot/McY8Uh
         CthJEKswOASfsQojc2vA8sQQwbtE9k/FzVXJFpjsMeggFXWymyQkWRTGJ3jK/OR4WvBM
         jMpzSxyKl4fQBO9C/w7xFHjUETY0v41ewe+WSrGTmhjisZxsPh/z/ISrsoRbdb6KYDTW
         YVbIFrLAw0wvRLxIEcGqYdHs7FAV84jcRZkZR1aeR7Dud4q1J7M8Db2gslNLntI2wvuo
         mjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815683; x=1795420483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJhyoVPyEIrD5yY2pde0MNrXE6PDsUwt9Ka8QuL+Adc=;
        b=h/NfmEnfjDnZSNHIbZ01hIbEO+AGvasoiGMQiOcSluL5evslQbW7zCM8ZTnc2QBg4C
         9gXTO0X0hw2ms01AxaYekekqisNGwn4LQfYfBvggRuQTcYZwl9qCHUEpGwkM+akY0mCX
         Y5AsoEh9/APz9eE1aAQo21Swg/NT4KxqKP7L70zrKiOn8BM6CHwuR4njQ7rgb2Z3ivty
         rXp/YGq5f0mKl1lkPVHCh/QGaR2V+p0FoFK6GmDM3KQHDGtmCc+/Jmkt4vmXF7YtRoAZ
         TbEi03fXRCBcXT2bHbO2RJoDNAfW3urumHmiVRQL+6cpirIMh0j042McO8kg/MVhsZku
         NJwg==
X-Forwarded-Encrypted: i=1; AL+hErEck9hj9B7K7WoBH7wiJq4N2CGXSPYEAB/fWpxV5A9YMTi2WB0s5FHZNdggfGmMYBZwqcR+7vu9ITDLmR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lkbBpw+gtMQC8q+Cc1jeqPeHEm99QJiwjBeDoqepY8n3ZkU0v
	rNQkP/yuxtUsZv7JZWGIjfunXAjs9zLFaF9WsUihP8/ju9gW89SV9SAZ
X-Gm-Gg: AYBFou1ix9iOuNREEB9Z9yxZgNV7+XQP5c34yoDtdAbdNsQS5Mj2Do6k/BGpZioxTb3
	DYhTkmgxkutVFqV4VVFNPfo6KS05OAd4JJ2mJ7uv0ApZk+S6h7t8hEz4lU/nwSwPuPcLzRKRrML
	MkWfUAXfl9W37/M1vY3twGhlwu5qXzNXWT0bdypkgUt9PHpRVfD2P7ptYPTce9bxU//xL9jN2kT
	t4k673ayMUQWvyxWIOEAPxMOCqD4JToCbx7UgLAnwdz7DIIkXKNgXmCsSfxJXvklaPZ77qgr+/l
	3gPaHlU8XerahReRVPKiMj/iK9ZTIXzmXZ3V6jq9FeF7n1OqfF8MECev+KQ9B7LrGBElC2pUSBc
	sivLMLf3h1vC5TYEhWKb7JZ1w+uy2WEld3ACQcNVIFiIjARCi/oaHuHzkp8pB8ApqKXVB+aCbvb
	OWC/HzU9ZJ2Sc5gu5qoCMwHuhxfPkRZCMdNW8q8On1SmvxOsNWciF2OFGa7ocCm2UJU7urvwBeA
	JuNmXlj7o042rtJAAfgCJW1uRgROCOKHFbRnefgWjYJ0zqPzBlMb7raudbGYYTkyjIvKGFRrj81
	4g4hoztBjjYA4vTfzhiJ8k7JqF8sgM/V3HpKY4xYN2ipJhYkzgmu3VMb4WdckDk8xblIHLJ04ct
	ss5bug6RZKZCowXQ6e4BK+UnF6rI8XE4kTJ47rHJuKtMhj+aqE4tjoVPYIVn0Tmkl+uwzei+ugW
	5hZ5KnpQ8=
X-Received: by 2002:a05:600c:8b23:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb6f6a1e5amr67223255e9.2.1794815683432;
        Sun, 15 Nov 2026 23:54:43 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-148-032.95.117.pool.telefonica.de. [95.117.148.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm210329875e9.14.2026.11.15.23.54.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:54:43 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 1/3] arm64: Always inline raw preempt count updates
Date: Mon, 16 Nov 2026 08:54:22 +0100
Message-Id: <23dc25d010cfeb8eddde12be5212fd73bf1cd5c4.1794814699.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794814699.git.kmehltretter@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
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

From: Hongyan Xia <hongyan.xia@transsion.com>

Raw preempt count updates can be emitted out of line by the compiler.
For a noinstr caller, that puts the update in ordinary instrumentable
text. Force __preempt_count_add() and __preempt_count_sub() inline so
their code stays in the caller's section.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
[kmehltretter: split out the arm64 preempt.h hunk and rewrite the changelog]
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 75a592b7f47f7..f3a5c2cd1936d 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -41,14 +41,14 @@ static inline bool test_preempt_need_resched(void)
 	return !current_thread_info()->preempt.need_resched;
 }
 
-static inline void __preempt_count_add(int val)
+static __always_inline void __preempt_count_add(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc += val;
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline void __preempt_count_sub(int val)
+static __always_inline void __preempt_count_sub(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc -= val;
