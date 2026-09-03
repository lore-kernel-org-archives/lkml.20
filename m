Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B911331ED2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445978; cv=none; b=mbnFIsyOgj5DSyIqp+L3vaYBIjcVfgxpcAp5BvRda14sINWbNff9Hb74lvqLAL49gIK6CPhTZ9adxsCGUsRJsBy4TPLFNu4i8N0B48+TAxBEg1mHGsX3m2VK1bHQ2ZwoiFtYdnsJOd642FDXCtGF/XHBfx6B1SfKh6X943WggT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445978; c=relaxed/simple;
	bh=eqXNDrN7ktWPwXh7M+pj32JzWk8pz8LUIInw9vbCHm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=raOc8Sd48BuhB2U8r4sCwKRZkfb6w4o+WQ/ED1U4j/6455v8UWtM9JUq3eu88mGoY6sylnFzmFR+vxqLAsNGYdDutaDQnqyBgOq0Nq3A6ii/AVTIRbR3cT9IaHWNOr9528zD4dxFACjjq5l0AgNDbJ9Lp690mi7TUFyUWGz6plA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o31TKASU; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o31TKASU"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8541875f596so1137833b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788445964; x=1789050764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IacDR4V7VVo1kImUhwmBbgo6FNMbqfDdRV7nbWQPWqI=;
        b=o31TKASUIWh0JuOd2GWqfwu9z1xdn+zFFxm0V5wCx1pZUuNTko4w+IxDbrSkYEdxQO
         twbeq16AWqaLfC9VOlLFsygWXPaX0G64rFN0UI8VsLbbvpKgCu2cCE9jy7/u4HpjEzP8
         ki/YJH9XHO8T0+cXDD1+c52cUXlP/IFytvImB+PwLgbSucpyqn6uKbry3TmVIzsDvied
         v2yWkcOmeZPsIrl05zFEFRbHoXB2u+YCjA+VM062zEohtWRbBgIxNJb9YpNTTKbm7/oA
         FOEqZsPLzXNzmzxZLmgdEZJSbo7v+lRSu86KMhja2zjVoaVJ+c9n5J1xVG49LQ06juvP
         jvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445964; x=1789050764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IacDR4V7VVo1kImUhwmBbgo6FNMbqfDdRV7nbWQPWqI=;
        b=B6ACl/hfsrN5xhkH9UxynLh1Ax6kvT3urOkZYKzaV+xq/Q4QZAFz+5D8Jiyqm9FAbY
         NiiaHIFvGbZX32rdnBsTbUWBgEJHi4izewvf7XYZVfGDS1Aa87lOMGyHguM1jOu467qD
         ua03iPLoXTgsQWmthLTg1UWVubwUCKXs0aImqkxSR+ZRwrYLFlhrLzP3Ogo3rtfFU43z
         iADeCxzc55xOSf/VIUxNssUups2z2yHBaScZM2S0yVZd6rlIaoB1pdhVyocBqpAv2F1k
         Idi7xWuvfpLrdVRU5cU/6s9EqChMsrLIQltxZ96qNI7LeIdQO/Q9+O30U2X1swMFwx0K
         3BxA==
X-Forwarded-Encrypted: i=1; AKwUvBxMrDiuJCjpi4JC/FpcGYJ+8vkc4IIaMDQU0JcWdub7tBhCd32+h8jssqmD3Fs3M6dSw4cjcvS6V/2bPnY=@vger.kernel.org
X-Gm-Message-State: AFuF++lSfcS3QWFOESM3EHQaJNP6mz+hDn0OI/ns1yHRibF3gzalBxvr
	ju9rV7BfRJq8jhhCeNBOvxiMDXdaulv3o0F237NJaRx23CIy7s2hAkiH
X-Gm-Gg: AYBFou3Evhh8Nh5nvCXpGG1eH89s1OW3L0bcc6cvZpmScJE3Oc36c1fLmyh7KFMwZEG
	wLB0lMmSyQ+rO4s+RoNIvTh7ZQsH9COkC5bzUJriY5fyyPqBpOxaV9qDrMPvDceNfDwZicfIEdy
	zNvGDj4rVlUSnxBDNi2vovATmzkPewYTFpPa7qTehDKh7yMoC0KtblxtE4+9i+OmLXn0AvJcWZO
	DzkJM8EcFdPEjS+Z/ojcbutVptwePnhzIsM4wJwZ4E0sZxtxXEkyx4KHqn3WBQKvB3ZetTa/xmB
	LkYTnfY3thu7TyFz9czrIJR26noLbWzhToTyYzV3XH8DBHSh5uGcND8F8tj4qfa33VImB1R3LET
	W84A+Cuh7j2U8ZR7f6Kv9JjDuubrWwwgUV9LHkHVL8ZPh7ImuSv5kOMa78fb61p39m0oLZQVyx/
	42mwTd5/3QnM1hOujSawEFaqQ6kwRJHoPkze0wBej5S3oFfX7BuHcPjcWBZFTdJGPdiUNgvZImc
	ja29g==
X-Received: by 2002:a05:6a00:4408:b0:857:4dea:e2fe with SMTP id d2e1a72fcca58-85ed8ed8414mr20058383b3a.13.1788445962694;
        Thu, 03 Sep 2026 07:32:42 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f80bbsm2941802b3a.57.2026.09.03.07.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:32:41 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] mm: compaction: don't skip proactive compaction for non-costly mTHP
Date: Thu,  3 Sep 2026 22:32:21 +0800
Message-Id: <20260903143221.4108871-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825043833.2659350-4-zhangbo56@xiaomi.com>
References: <20260825043833.2659350-4-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

Sashiko says

"Does this change miss an entry condition check in
should_proactive_compact_node() in the same file? If kswapd is already
active when kcompactd evaluates whether to start,
should_proactive_compact_node() still unconditionally aborts ... Could this
prevent proactive compaction from even starting for non-costly orders,
defeating the updated mid-flight check entirely?"

You're right. I only relaxed the mid-flight check in __compact_finished(),
but should_proactive_compact_node() still bails out unconditionally when
kswapd is running, so for non-costly mTHP orders proactive compaction never
even starts and my change has no effect in the common case (kswapd running
under memory pressure).

In v2 I'll apply the same non-costly condition at the entry check:

	if (!sysctl_compaction_proactiveness)
		return false;
	if (costly && kswapd_is_running(pgdat))
		return false;

so the entry and mid-flight checks stay consistent.

Bo
