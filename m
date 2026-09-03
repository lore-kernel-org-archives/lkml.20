Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0454C9548
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448174; cv=none; b=dDEv+gjwvoG6q1dug0xCm7PVCbp0XVk0Kquw6xq2XTZFgzBX5UNtVGF0+cwSdO2SGQV7JciQDlbb/v7GD2gpY6umCYrd0ipN0XwRXe4sQAOLjxtgDZQDFvz+n/jkkAObqOrUVJvOuVw/zS6+kNzRJxLpVeFNNEUITFu34aqFe+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448174; c=relaxed/simple;
	bh=WLq5Ho22bmD7v6KZE3c4vo4tWl6YYYaL+ylKWHH1z3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UrYG60QywkvBs+ZV9nf6+vP0S3X6HtUQE1/g9jq+Tq7JK0TSqlX6pDYUZ/qP3kC7Hfj+568lT+FzsDgwhbOpgfwV6COo2rqDXSlxHMdYOHbv7/iulGlPwqn24UJjGuKwsCIsr/IiNHM0QZpovbnGOlXlTJLsseU243puTg/rXuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbXnyCvN; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbXnyCvN"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485b358552so2314149b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448172; x=1789052972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLq5Ho22bmD7v6KZE3c4vo4tWl6YYYaL+ylKWHH1z3U=;
        b=ZbXnyCvNln74VouIHm+SJeWD9gifEcSd36Nw4o4hmYS6OdGxlHoUj1ZxPO2pgqVulU
         oJHsZujnO6830bMb3M8GdtN7ZKRQf1LTrGVofCmSkeXE4iwxztmCsaHuUBFZCm9FW2o8
         R6mIZVHW61aIJzlXLLoTYiMf0pGGqzW7kr0inDCDnSt9dwzHYGd+ugmtEbbg+8GSCV8V
         YRdIA2B8ixsr8W4rbBrK3lUKCrJfwC9eFE/0EJ5f6rATLyptm1+TgSVnDlDImulfSW84
         gRsomebg+XX6eHClARNJkKORBh8ibx9Jc+k7i0+CvFf+5e2JHw7x851f9U2jJgJmjj/k
         LktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448172; x=1789052972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLq5Ho22bmD7v6KZE3c4vo4tWl6YYYaL+ylKWHH1z3U=;
        b=qznpozoT8P47kHj/3j+BdtsDuOOPqamDTDMnzYd+b/JPvASGJ7TnK83G4HUZAQZA7+
         3j+nYbBDAu0YtkZWITfJLfvxnEPIuvowt5lWESvcxGvaFz1sy3UXIOnv1cyU6dD/6R0e
         mHsGoiqD35pd2A+1m1+IRaLk0RWIGxw3B+zARIL+6dXkP6NaK5wrYloRMhe6lI6twAni
         dRXWUlMsFQ0RsIMywVLpkC600h5kFZ9yury38dIUSfo5IFxUWkkmD0yqGRbU5UcLBSKO
         lMv0h0rJkpoHMmoLIvIi9WUVH6k7BrMZfv3OvhCkjwqYDN4pgrLB3BV9nMv80Y3szsOz
         XxdQ==
X-Forwarded-Encrypted: i=1; AKwUvByQi9WYwzT/myl4ZML/YC88jN4CTzKwzS529At8iC4kOt9k51FtjKnUpI4buVuYCsAMYMoYmONuQWbeglo=@vger.kernel.org
X-Gm-Message-State: AFuF++m8+uY6CQUGtDV/5g7s5L7npqiMMFwbFCLq8g0IN/OmeYU1E4Zt
	ZGFFAKFJF4GIk4At4/9ekO1lT5tsgMHTdWfPBXnxV+3b6waqw379Tkqu
X-Gm-Gg: AYBFou3s6BlUlVPHMUCtN9gkemxs8+F+B7iTCdwzPDXEoLH43x8KKYUv3PaS0rAIrGx
	lPOLQXorP6r1JMvXJn4sazAOCS6GIc2fY3B98WT/RiAa2acBIuojpSifr7m1owWZlUY2S6PL+WP
	IY6RxAnbqsDg61R0LL/yCaq8mXAzaGdzZ65oL3OIO3Fd9QoX32ko/loRwd2f4468XnSojroap+7
	snjS4AWwlEXtRmnnX6BSEShRp8PPSS4MA51S1RSvxrzFzSK64sATk/+0Q9kwFNkjsvMSJB7ukmK
	fy3JgSK0pbZULgy97A3t4GdXkDnlEveOo/ehqCybKWbtUJ++gjb3Ww1Mr5WUxHPJJ0yFHU7qF3q
	AI6Lu88jsBI3PaFUWJDpcOQMwbnK6AmODjKL33s3XSYpovh7vgQyb7w9/xpFBZMde07Isu57VHr
	GZRNqfqoTfoh75O/tQeJnvjWJVitI6PAlySjRsqFckWgTBTJ7pvl9zJjRVWpdcI5hXXSoQrC2GP
	2gnxQ==
X-Received: by 2002:a05:6a00:301f:b0:852:355b:2430 with SMTP id d2e1a72fcca58-85ed23e043emr19151323b3a.10.1788448171946;
        Thu, 03 Sep 2026 08:09:31 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f871fc6sm70289b3a.7.2026.09.03.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:09:31 -0700 (PDT)
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
Subject: Re: [RFC PATCH 4/4] mm: adjust free_pages to make __zone_watermark_ok() mTHP-aware
Date: Thu,  3 Sep 2026 23:09:17 +0800
Message-Id: <20260903150917.4112784-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825043833.2659350-5-zhangbo56@xiaomi.com>
References: <20260825043833.2659350-5-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. (The "defrag_mode & order" bitwise bug was already
covered in the reply to Xueyuan Chen; it will use "&&" in v2.) Replying to
the other two points below.

1) mTHP count discarded by the percpu_drift_mark fallback

Sashiko says

"The restricted mTHP free_pages count is being compared against
zone->percpu_drift_mark, which is tuned for the total number of free pages
... won't this condition almost always evaluate to true under memory
pressure? If so, it would unconditionally overwrite free_pages with the
snapshot of NR_FREE_PAGES, bypassing the new mTHP logic entirely."

Right. percpu_drift_mark is calibrated against total free pages. Under
fragmentation or memory pressure - exactly when pgdat_balanced() matters -
the >= mTHP-order free blocks shrink relative to total free pages, so the
mTHP subset drops below percpu_drift_mark and the snapshot overwrites it,
bypassing the mTHP value. In any case the drift correction shouldn't apply
to the mTHP path: it reads free_area directly, which is already exact and
not subject to per-cpu drift.

2) Restricted subset can go negative in __zone_watermark_ok()

Sashiko says

"Since __zone_watermark_unusable_free() includes all order-0 cma and
highatomic pages across the entire zone, subtracting the global unusable
total from the heavily restricted subset can push free_pages negative. This
fails the watermark check permanently and can cause kswapd to spin
endlessly."

The operand mismatch is a pre-existing pattern, not something this patch
introduces: the existing defrag_mode path already feeds a subset
(NR_FREE_PAGES_BLOCKS, only >= pageblock_order) into __zone_watermark_ok()
the same way, and my mTHP subset (>= order-2) is actually a superset of
that, so it's larger and less likely to go negative. Going negative would
require an extreme case - near-zero free blocks of the target order plus a
non-trivial amount of free CMA/highatomic. If the existing order-9 subset
path doesn't need special handling here, the order-2 subset doesn't either,
so I don't plan to change this behavior in the series.

For point 1, the initial free_pages goes through zone_effective_free_pages()
(three paths: blocks / mTHP subset / total), but the percpu_drift snapshot
fallback only has two paths and has no mTHP case, so the mTHP subset falls
into the NR_FREE_PAGES total path and gets overwritten. In v2 I'll make the
snapshot fallback symmetric with zone_effective_free_pages() so the mTHP
path stays consistent (the mTHP count is read directly from free_area and
isn't subject to per-cpu drift anyway). Point 2 is an existing property of
the subset-based watermark check rather than something specific to this
patch. Suggestions welcome if a different overall shape is preferred.

Bo
