Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F11380FD3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659496; cv=none; b=B2ew1ht8JvCiyiBEgFCRq7zkXcUYM52VH5dLgNMUsXB4k2jq7Fs8WJQwfh9vXAB/UHmzYqCz0MiOXuLajrmFzS1ABlHSDPXhxRgW11/R7j4ImKWD93hke4uPmWuHIgVYnqCIcaTNldyBphl9cBIAQFHuVMD60PKiX9Op/zoXZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659496; c=relaxed/simple;
	bh=VCI4r23IY/yhxJkm7KNPDvZ1RbPcYzGhTCb+BwU0Onk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sWNsO3yAN3zex0O9B+I3KNVhB2QQ3zhhd/6QR7dzKwDCE32M7TabzO6bCPEO5xAhZe4cCFvs+2AGNjwI6tPHhxJ6NkCaIudYc1PvlJJTamuoT24LTdahKlOdrhEHYandlGamkgUdopY1cHR0cIJlxIdUKLsTZSx1m7lb1+mozSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpNYcaIK; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpNYcaIK"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-8814e797a5bso1279999b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790659495; x=1791264295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqJjaWtJymYwkfVBEG9NY0+ZN7tqwrmNxYsbKwMQHQ0=;
        b=jpNYcaIKGtIQ0rxY/sJTlUXcnwX77vMdE3gbJjQwbMpBpT7rRwbsMPCurEPM0xSoJ8
         UrfPyntsHLg5ZUV+iPw5xTqJioHsfmPDRNhD0lZhdCmjQJQX4kKDEKNPN3+i05Hh4M35
         djeFyEU9mvjFnGb3rGoM95rWe2VXb+/zhLvODGOHI3I1/3VHRW7lKeUCbIXxSMc4yAQ3
         z8ZU6ZPBRvlBwA8GIsDdbQQ9tFxdX0NoznEEw5uPlR6CX0hRe6t2s+HQi8zi3JeIEzDW
         hCmwHOrMtBbh2VuA38WgpTEMbBT5SIMkFe88gt+yXewE5cJXb+UmzdocW5G5RHqS0x9K
         3wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790659495; x=1791264295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OqJjaWtJymYwkfVBEG9NY0+ZN7tqwrmNxYsbKwMQHQ0=;
        b=wYvH1LrqNvVk8K4tiPIu2j8oSKew04xeA7Jkt/hgpLQ3kZFhMAG/M+U4zMhPK+J40W
         XIJOGg7p8iLXy3Qn6tA79UC2BG2ydXg2TbiAL6EY0IGWiQrPU0mO0hMTnjKF1iBT47fp
         hvsYHlYbFHB63mUdZBFGXZnv0l1W5aR1cZzZVNNQdcZhW6UYhUuqR8HYkF4uvqezelPl
         31v7GlxT/Pa3efWW1E1hLp7khxsaNKpqiEmPW2ejb5BS/XrADamIj1Zl88kALZvyX/Bd
         KZMVSh4suzfAFkvm8YA850NOX6Oyaqnrx9zTZTBoggUgiNeKnwFw6KUmzFf/nAqXJHvY
         wp9g==
X-Forwarded-Encrypted: i=1; AKwUvBwt2iBuuu2ezkpuWGlZXdz/3LJak9pLnPou6BsjjGIPFca2Uty9MeaQ35yheY+4b2L2GSCsgmnlzZzHGHY=@vger.kernel.org
X-Gm-Message-State: AFuF++nmnEE86OTC2fg1VCap4/0sbaBMQCFq/ZneLtd0OD/hc6R/tO/m
	ZmIGLySJUTu18yMqO9XXBdvmbO60Mr0Ql+y/Hvv8qKQk2NSV7UWiWXG1
X-Gm-Gg: AYBFou2wQOWRJtkZjWvRkiqNrzQFYmsysMhgpW6rH5xQQQCj970rYd2FkMk5XZplgzb
	+RND2N871BU64R8QTdqjdNI6oo4LJfpkrpXLtVXMjFH3OZR7tYOWE2QH3xM5uPGm+q4qiZ9IiME
	tOlxw28NVjqNNoWxWzLCgP3qx+3T+trHuA6vZogsGmnZWq1RT7UZjy1mkQMD4pE3soRHsqCAOCW
	8R/HS+KHebDOyIKS67+4aN44c+PyTKSf9uO835ARuA6LGIAFj1pKbFEyOzYOm156po1VqtbanrI
	PLgymmXyrrd9jK+fmvm0bqJ3+YCZoTAZw4/lOrhZVPVZe93utsD8NCM5z3N90Qj+U11QXrpsWdN
	1lv0norR/LDzy2eTJ0vWPvtmUI96S6nwkNPzfEYSJj/djbtgc+Apr+xCm6rbQ5EasoANuQeksE+
	owpNmuKzsSic05kdV500MqOxvVpXSdyftumNUyfP8xJ4tjSWr/1oyGHdWnRz6lMYSGGrl8eV/Tf
	SblwoLb9j8dWl8TPIX6
X-Received: by 2002:a05:6a00:2341:b0:881:bc81:e8f3 with SMTP id d2e1a72fcca58-881bc81ec45mr6635453b3a.12.1790659494629;
        Mon, 28 Sep 2026 22:24:54 -0700 (PDT)
Received: from NV-9MNJ414.nvidia.com ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e1066931sm161151b3a.16.2026.09.28.22.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:24:54 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rbtree: update augmented data on the way down in rb_add_augmented_cached()
Date: Tue, 29 Sep 2026 13:24:46 +0800
Message-Id: <20260929052446.159008-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928213736.GA2947991@noisy.programming.kicks-ass.net>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026/09/29 05:37, Peter Zijlstra wrote:
> This builds and boot, so it must be perfect, right ;-)
>
> Assisted-by: Brain
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Right, thanks.

If you're fine with me carrying it, I can take it into v2 with and
derive ->merge() from the same RB_AUG() list, so
rb_add_augmented_cached() folds the new node into its ancestors in
the one pass down instead of the ->propagate() round trip.

One thing I am aware here:  RB_AUG()'s cmp only
expresses "pick one of the two", so min/max style aggregates; a sum or
a count (subtree size, total weight) can't be written, where the old
RBCOMPUTE could do anything.  Nobody in-tree needs that today, so it might
be acceptable as is, but it's a regression in generality for the same
price:

        RB_AUG(val, aug, fold)  /* _val = fold(_val, child->aug) */

keeps the register-local recompute exactly as it is, drops RB_MIN /
RB_MAX in favour of the existing min()/max(), and a sum is just
"a + b".  For sched that's min, max and a wrapping-safe min for
min_vruntime. Do you think this can be accepted as is, or should I try
to make it more general?


Thanks,
Yiwei
