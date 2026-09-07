Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A205140BCBB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763682; cv=none; b=nb12Y767q1HznfOmSTVRpuVd8QMNX0VzM1T+VsDlsmK4ZocAL73H754j21J0RLDBZHCjvY2Nq2iqeD3M1Pwjpxq6YoqQZQxeBVrolaQnbeuLkVupaLhdATt0HiPV5ZxPJu6nTei8Y5+37fgul1bZ1H2nguhaXT5qUnXhpejiCK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763682; c=relaxed/simple;
	bh=yXnUcv5qVGtYzgWj9FiGbfPJUzxRYD9YlLEosr6E6dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJ0L1ourN7WSjfzar9/ruMZL5T8gBMZ2WqInwi0Dj5C3fYqd0R3fpwqSYmgn48REnq/wNo25PXYvKUnqfQm6OweXlGDBVI0FzkHv0c4RkZe1X8V3S8VFTteCJD3JQUxAN1gPuvrILl2TUQ19sUYQK1QSzUbEO32HaH+QOAzoKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEkA2AXz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEkA2AXz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso2262512a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763678; x=1789368478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpKYH0amj/dwSRkLCI992Ocp0fThRc8J4K3VwmqlP48=;
        b=TEkA2AXzP1ykjfqACx/jwed0U0LNdDZW6cGOrZ5RQo//9jTV+EFTNwnnmVzXjhb2op
         6BPX5Ow09lMovUQMg3a5IJ+aIFH0adXTPVdP0+KC5v45Q5TFr0f11AG/7dNn7t5RbItV
         c/FOxNxh3mUnUZ2+Z5UAmFDnsEqqDhQAaznTL5N3yyR4KmX3CkHPYapRil6wIcYCS1+B
         6X0ch2njIoFDNS7TwVF+yChN9zUPBvQ3zn8HogDmLXr+Jpyh2s+XiGYvjuK/a5zqhILT
         J+innFog8GVkrLiD5DdP+1vhX0F+laIpVd0uaIFiMElXfHI3JY7CLHyK4iKOUZITTDw1
         P+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763678; x=1789368478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpKYH0amj/dwSRkLCI992Ocp0fThRc8J4K3VwmqlP48=;
        b=e6gzvZRKy5nQ8PxmtFkchIkGYYOFrTUUHBK8cHFJSD0yaw0y1+tEJQ8uHh4wDZzwGk
         6k3n/9ab8O7rI1jFIzrD/BDWwxpqgaV2kSvmiMN9u2kM+Yc+b64BRkOUIQ+1JSVQC3At
         Dqvn/V8kyYAQAXJlcQUUYJ3EJDzoT+wSGfiZDOCcAIBASEMSOmnSe9HLIY5qF5hdM9kv
         eDHm4yo8xTkl0vdDbR0BP6wCL29Mo/T9UivZZhz87t7ztDGMIfzW6MFjtSS6Kds98WEK
         JIjxQYYDpsUxM7wROUG6OY6tccApqr+TspK5hl360V9V6wBdtY4MQp/0cQDAxCXugHNL
         n3sA==
X-Forwarded-Encrypted: i=1; AKwUvBy34K02RdS4OZIZkxhcaA1R15rDE1IAeAhZlaBbGkn7E44y3d3E32Bmb/2f/mxPRZC5rUSAMA3FpQqaxDA=@vger.kernel.org
X-Gm-Message-State: AFuF++lVkWfGTH3wT5XN9nCCCohdFsBt9W/XaMZ+Qb4hlzx1Y3XCNYgN
	HY6CJxbH49BV//syNTYL1Q2iMhlMzzsstUwEb/jUnMajs9W+SL3xZH83
X-Gm-Gg: AYBFou2vQ/+OZGK4Ps0jRkos+w2acGw22r3gtg+NE7hgp1TstE6TncfcWoyLwpp5qoi
	0XuZP6OLPtPMakJDYk22sezJ5/HIIWqDpZ01h8ni0pJPSBCTJGXZfM2kBGSy0Ps3ggyrJNZV6At
	W873Ta2MeqNpSa5ALgsPbk694x+Oxtzf6EjI5yqfulK2uzJ3Q4u6oARxeZgun7ZjNJbqLPT7F8N
	m03JxQ6vf3RJ6xy1fFBk9l58lqTTU/NK80ltgzieTfSZSEzzQaA2O3UkPU224sCpS2e6TGJ9S6g
	RDT18ztXkHn2pfcIb5rh+bvjhrCCtpcY5X/n2onck8xwJuz1Kn4Pof3Q9jBBjR7L0n5c4/WzLZZ
	CJ17M2sDggYb/vMqGuMf/uCQVWisVQcitTcTcHcZApFPC9z7tt+iygdas+egiVGVuQGECw8OrAH
	hsxWDMqAOQIao0m2tgtCuqFsCt5LU8oEQKfb3F/bQiudIEmGucpVWrQLHgHdeInOGOqCEN9NZtJ
	x06fGHH+ZyVuA==
X-Received: by 2002:a17:90b:35cb:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39b261ae617mr36625720a91.11.1788763678086;
        Sun, 06 Sep 2026 23:47:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 4/5] cpuidle: fix repeated word 'that' in comment
Date: Mon,  7 Sep 2026 12:17:24 +0530
Message-ID: <20260907064725.10686-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'that', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/cpuidle/cpuidle-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index aca907a62bb5..d2fc216c38fc 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -281,7 +281,7 @@ static int tegra114_enter_s2idle(struct cpuidle_device *dev,
  * LP2 | C7	(CPU core power gating)
  * LP2 | CC6	(CPU cluster power gating)
  *
- * Note that that the older CPUIDLE driver versions didn't explicitly
+ * Note that the older CPUIDLE driver versions didn't explicitly
  * differentiate the LP2 states because these states either used the same
  * code path or because CC6 wasn't supported.
  */
-- 
2.48.1

