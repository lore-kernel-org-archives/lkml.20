Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129549E139
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261921; cv=none; b=WKcXLAvDJAyQwcsoDnF+VpMHHO3nvIySoR9yfhKZTGTEm0uu6AtL71pmOjEekKdjg71Hqv7ijv0yngKr0JkuiLsJsjidlbfq7RsmF13NFcf4Ihxh04e5uYjWTesmN5pXI//zPpv/axlHVN7cRj3kWfyDncy4Cgu+iuRVS3jcxoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261921; c=relaxed/simple;
	bh=5Z9HBjj3BpRkfdWDMhxS9FgnjGjJlXwCNSHrKScn+9c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qYGgp78WzicKdPjR0xTsCv5MfbT3V1SQllRQRZ+2yy8lagT2fWOLuDKVkM2Z7o0anCbA9HXi+X0TcHnhi2PgxrCoF8bCVdrWFR590DVE0Azc4lTBL++zp2iHacjmq3cuiTV0EYbqLln0ouF0we86RHh0oBpQ0avQIdyjGQJCcCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ETGigr75; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ETGigr75"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e65f2f1baso20657775e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790261915; x=1790866715; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4s+Lr1be2QzPPE5UoKaJzL/Psyq/ahw8/pNYZ50pvpc=;
        b=ETGigr75IZJep4DcLv2qcGFpqw2SVcWtefG/JA1gaI6wKyNrIM73/Y0XgRY4G358R7
         +VFt1Gg6ZIdkpbCS/oZPs3nHzhqxdx0jpRORTLeGHk8yFpAiOILxU63ZMQ1qH1YvHgII
         BVIP8NPclzOz1L6lCJ8gFQe8Z4bHNgzeyb5V4iJ0KZ6Q6CkOKhu/QbsRXyjCmYoeiBkq
         dUZrdyfCkqqDNVRzvoGZ01QdZSgnzQlLOBUmYRRxtMYSUNdgHJl8xoj2kbf1w5D+LfnJ
         n0o9KD2CxZbS2yL65FNM47t33qJuMNlsjugTu9jX5Hy1g5uBQfeimvexD12O3SzUPQzf
         mQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261915; x=1790866715;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4s+Lr1be2QzPPE5UoKaJzL/Psyq/ahw8/pNYZ50pvpc=;
        b=PEKd8rkpV05u9/BVKaDCHuugID8AO0sHrFo6Al50a3mpMVaQWmo4bwP3iAOvv8+oHb
         7E98RN9F5SMGsSHYNQJl/q6MLaCwSecVqzu7IIXv/UypbuS4xFtUhLehtNC0M6FmTCbB
         B6u7vq5LWwy8ZfzTjOIKhxbXxWzR0RIkr6HRJo4kz3R8Gvdf1uftEbQlicx1IokXalmS
         KWY4P9NSMwNsB9eQkyUwtb/x8FBE8h+wUNE4jxEsIhOGw51le4PNaLYMIgj0p+u1Ldjf
         uKW2w7zuD7nCQVrwrJT8+4nUNJS5I0yxpA0RfGCejSmP1YBRoC+snb0MVjGpsQIGCfjJ
         NftQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaUGAxT6865ZKFvhY1juhjEynQMIBB6GN260pokTYHNJc8MtLlkD4Vv64hWxVJWDwuMPQIG6sQgyxoxvo=@vger.kernel.org
X-Gm-Message-State: AFuF++mtGvcKbSgdxVqxtcvURHTFUyJ5XvovMvoBmVllNZDBvBKmYIns
	Km/OjCpf+BUOfbOHEy9JUKWJ7xN2Jf6N1I/prEl7eBQ9V6QONtFE26FMkhAubODpqCvBjTgZau2
	C7aT/BwrELXLEqvzhjxmZsw==
X-Received: from wmpd22.prod.google.com ([2002:a05:600c:4c16:b0:49f:e43f:afd1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:698c:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49fe66c385fmr46796115e9.2.1790261915081;
 Thu, 24 Sep 2026 07:58:35 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:44 +0100
In-Reply-To: <20260924145754.1285146-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924145754.1285146-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924145754.1285146-11-vdonnefort@google.com>
Subject: [PATCH v7 10/20] tracing/remotes: selftests: Prefix hypervisor folder
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename the hypervisor tests directory to "00hypervisor" to ensure they
run first. This prevents the hypervisor tests from being interleaved
with other remote tests which is confusing.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../test.d/remotes/{hypervisor => 00hypervisor}/buffer_size.tc    | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/dmesg.tc   | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/hotplug.tc | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/reset.tc   | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace.tc   | 0
 .../test.d/remotes/{hypervisor => 00hypervisor}/trace_pipe.tc     | 0
 .../test.d/remotes/{hypervisor => 00hypervisor}/unloading.tc      | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/buffer_size.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/dmesg.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/hotplug.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/reset.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace_pipe.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/unloading.tc (100%)

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/buffer_size.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/buffer_size.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dmesg.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dmesg.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/hotplug.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/hotplug.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/hotplug.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/hotplug.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/reset.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/reset.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace_pipe.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace_pipe.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/unloading.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/unloading.tc
-- 
2.56.0.rc1.310.g51773c2048-goog

