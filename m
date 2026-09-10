Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500B3D6689
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022103; cv=none; b=KXHn8rtgDeoRlErj3unC55BW93Ik1FY/WPgubajjUNygVv+3hRPBdVy/WjihxfdRr0pPQN2aPAG4q7Rs6OC6iKJAKdAUlc0+fI+s5J8MW3uid2rEe2Xr6sz0wFHEZ64IixpKZ+LHqVoWPQ11bSt96X5AajlbUPh3ICB9mUqUAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022103; c=relaxed/simple;
	bh=3dlewbAKl8NocA7IwnXM4yE78ovk2+W6PMjEtEdYDR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPdVbpttCSHY9wfkwnNMDNhLnMHIxACuOL66/pku1NE3ZRm7i7/AqiuSI/Mz1xQd0qG+tE0/0bFsYzHR8S0Lv6BGi9QLq5sioxY7rVMyGVHheaogjRzmN2ZC0AOoh09FgVp9cjrwX+wG/0V1tNlfjVDnZcGz8aeDeP19yFriK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuULb4aY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuULb4aY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so77142535e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022099; x=1789626899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=;
        b=VuULb4aYGg10uCYiwO2FpuTRTloAidOako1+/EOH2nNgUsjkApKAxVM1QavLD9zmEZ
         RtyaZvWScW8bt+eHSsXsxK/3Djcoyxdvsg8zT0jZq72Z0o7yJPWpfPGZxDwHNgYkdZf3
         HL7BuS5mKq5CiCO0oIiO+tlIcHT7HqPdQp5GOfgAe9Z184sm76L89U3lhEYM1dHT8lsf
         rp+MJh5f57OFest34CossKusRfXBv8QaWAoRAEVxusPfPLG7gE1Xjz2EPP6jqR8s8R9X
         rvqDW5lAudkZjuJsqNFmCO0WbEh1dQJcU51SaE2D2hd5e1sfCedOhs3a+r7DoCzBdN6h
         /WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022099; x=1789626899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=;
        b=rEmMubRhysytsa9NrWcz1rX54XIzXUJL9h5ZnOlyN82EjxHOjRMEX954Opuj6wJ4rO
         fwxx36HMlW/HIf3zyJCYteSwSCw7kMi5nRIjWaJqXR8Jf0XIrPQi6A5LoIfpXv6cK2Fx
         fLKdSeJp9DoJpoaYk/7dqBcyQUsCOGe81ASeRKlQGiyB6aOBngG2di9Gm3MewbGTzFa7
         T91EAAa6QXcR3d7/laOh6y2OArKkY/fEI8zYvoWs7zY3+Eke4ipFAKCr0YoGBjYAfwUl
         mBa6KlkbUnEYJaWR74fGLJhoUsqFXs8MF6JDkdVa1Wll/Ort+HqK85Xnb5QU+MoJsjDw
         X6jg==
X-Forwarded-Encrypted: i=1; AKwUvBwKfVSlBwdu3QZhIjoNVM6KoNqGKdmLt8stOtBGzIuMqRf5kexjfvMIOxF4C69tGn7pfvI47qKSWmIsr4c=@vger.kernel.org
X-Gm-Message-State: AFuF++l/BCGzZEJ+O/415zOPG1gyRLdWM4mbMpcUInkCfVyxPxxH0AvW
	k8EyoR+xFc0XK/lRe5nP0JB+ocvu6JwvEhVj3XUWXRsmq/sOECu0GT5u
X-Gm-Gg: AYBFou1OZni0GsnnjotXLMsn5VUbP9VgBp+c3ojb0DLzVOVKaprfrLj5quC4ejAeCAi
	rQ7ycAFr9DQ+7nnKAs7xcUnxGvU7ISCpLhCOadsizTkw9ZkR5or9ocJLv3EN/S5pGOR4GzBXgxK
	ssF+Toy63cdT19V72zfaN7TJTny59Lkbp5t8Y2tY3voAK9gVYmuHUBv0bAcWP5KRSmTp4XQggai
	IhqQEN+lnVFAn+NStRDs2nLJlT1euEEPBcPxg5HvSQJ1xAqdhtotO7jxQ+BeZydtM4zWRoiXxjf
	Y1rs8tgpBRJHjW7RGvTllnOWH0sslaQLdiaXhJcEX8Zn78IBHOw4QET6ZHxPCe3602yuNL6qZl7
	oat6/gXR7969G7oDg55lEZfpVpZR4C0Gy1Ah5c4ohE0WFzN712eHYx9VbZ8etcwpd/DtrFgYfeh
	pcy9vkHkD+86B9QOfEzLpYHe3xSw1xbTFWugSB6wUsAi2idSiWBTljXA6mXNQyvHHq3qunr3xnd
	ybeZ5jcNqdSg5wPyeD/XlPfKGknFmEYjstcdC2uBvw=
X-Received: by 2002:a05:600c:5254:b0:49d:5ff:f404 with SMTP id 5b1f17b1804b1-49d05fff5abmr273112235e9.1.1789022099342;
        Wed, 09 Sep 2026 23:34:59 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm2595255e9.1.2026.09.09.23.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:58 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	jonathan.cameron@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com
Subject: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 10 Sep 2026 08:34:39 +0200
Message-ID: <20260910063440.4677-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063440.4677-1-okerixx@gmail.com>
References: <20260910063440.4677-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Keep the arithmetic in 64 bits until after the shift.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..0eca321ff113 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
 	return freq;
 }
 
-- 
2.55.0

