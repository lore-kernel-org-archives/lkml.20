Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBFD371043
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924096; cv=none; b=rLVgoQQdekjFPt+ttPkHiTLcf9MtSuSuvJk4dQJymTciZx7iwZ2ReJO8rKcL3eczjHGvU7rSorLvD5TzeHH5AgTqPppopflwrePATbZucEbsJl5T8/jvnk+UBD6qVW9c99x8NIQWs9BgxFBWx4H4GSEzdU7oZVq+C4H1XQ16uTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924096; c=relaxed/simple;
	bh=mATLxGhtHoRr34Hi+u70BPVD8Z+G5I7u7VXOzXPjAQU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YUHScyZP4eBTl1WlPM755dUulaTLnq1+d4pl4xt0YBPVgAfrBiUYRnmCpFtgnKhhLptb+yo50iuSqF1s4MxXVlwydfLY4hZd5GnKByAlXOnrkVW379tGu2pgAqUddjVvFb2u8iQxBBMkSdOgFe2cywtZd8dPGAGpXjd0ylB1jKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m0ctO7lK; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m0ctO7lK"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5851905eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790924094; x=1791528894; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkUf0UFy1N8UPaFS6/FMtIhJnSVtb1ps3aqzuhsfVmM=;
        b=m0ctO7lK7y/zzefOihxlbGK1U4dkzzmg22HlYR3QB7hUcnpk5p/iBVjoL9AhONEeot
         DVZdCWD30/bDVEcdaIIcfJKKQYucvjuAhBzlATHhS5pT/cT0DBevsMVovVJARMUZqwIg
         bmIeWQGjMMhvgIg3VkO1Xgxh9Uug6XTZMVm7F+9jAz8pY6cXU0qEdJgoj/gYkfJZoPV3
         zSnw2rbLVvcxGz/MLyzXF4MJPC/M7LgCm3jT0QkmBTpW8kQeXGtt8y2Fmmt6EMe9v1Ni
         psCGGonledAUPxT8fShvTKRFbP1fXwBZsWaEDa9JaYYE57Pge5Q4FZ9sZbnivDnN32/A
         16nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924094; x=1791528894;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkUf0UFy1N8UPaFS6/FMtIhJnSVtb1ps3aqzuhsfVmM=;
        b=tbsjFkRUT+NTl9v26L8CrrJP/TmNMAgjZrB8pWyq+AXSVlRepUfOQgWDJyo7ODAW/e
         p62Jjm/5Vm9bJgNi2lYrsEEDbqPPo7gDb7pX00umkDthMyoWho/+k+Pjbz81vO4BrCFV
         4kq3TUm9hvEP9LSGqvCUAGe6GaMrKFR7QBv5fHf4nhYkETLT7buN68SThxmCD/zpy4Tc
         k+Qye/ZWO50jseQs/ZnekyRo9iykunzhes8uA/dPz/FJ2c2AoHcQW0G/tSAqgFqxfKku
         4nlm612U9wpo1wKdDKfQEJHnTHfmNTY1/PgDx8G2jb0wdFRkvCsyxyxOZGM0Eb86ErFm
         6/9A==
X-Forwarded-Encrypted: i=1; AKwUvBwYWjS8k78iYL/RP6k7g2CfRprmWLw6eC0DR7SnAlKDkJfvS/VbLvmLbthFviMv6qFQKaUG3lPZMuAEf18=@vger.kernel.org
X-Gm-Message-State: AFuF++mE8el/GzwEWJL4dcPeSaF5Vy3gpcBFjx6/kh1zxkUVnZCdyTf/
	Z4865StPYUxkQAMt+XIb9XA5FPZyLkPNxzUcDF29Hzkwj7bBxpQMUR4EdxQLUZZtdsmeEzHD8c9
	CIhYOTDXCrQ==
X-Received: from dlbsw8.prod.google.com ([2002:a05:7022:3a88:b0:150:3bce:27a8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2807:b0:14e:4a59:273e
 with SMTP id a92af1059eb24-15089321bc7mr172768c88.9.1790924093697; Thu, 01
 Oct 2026 23:54:53 -0700 (PDT)
Date: Thu,  1 Oct 2026 23:54:39 -0700
In-Reply-To: <ar6nzTSj17IxCy0j@x2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ar6nzTSj17IxCy0j@x2>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002065440.2781176-1-irogers@google.com>
Subject: [PATCH 1/2] perf trace: Only call bpf_get_current_pid_tgid() when
 filtering tasks
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: adrian.hunter@intel.com, atomlin@atomlin.com, howardchu95@gmail.com, 
	irogers@google.com, james.clark@linaro.org, jbrnak@redhat.com, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, namhyung@kernel.org, 
	peterz@infradead.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"

In task_traced(), bpf_get_current_pid_tgid() was called before checking
has_pids_to_trace. Because BPF helper calls are not marked pure, the
compiler cannot sink the call past the has_pids_to_trace check, so the
helper was called on every syscall enter and exit even when tracing
system-wide.

Check has_pids_to_trace before calling bpf_get_current_pid_tgid().

Suggested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c b/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
index d16e55706335..0b2ef9541f84 100644
--- a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
+++ b/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
@@ -494,13 +494,15 @@ static bool pid_filter__has(struct pids_filtered *pids, pid_t pid)
 
 static bool task_traced(void)
 {
-	u64 pid_tgid = bpf_get_current_pid_tgid();
-	pid_t pid = uses_tgid ? pid_tgid >> 32 : (pid_t)pid_tgid;
+	u64 pid_tgid;
+	pid_t pid;
 	bool *traced;
 
 	if (!has_pids_to_trace)
 		return true;
 
+	pid_tgid = bpf_get_current_pid_tgid();
+	pid = uses_tgid ? pid_tgid >> 32 : (pid_t)pid_tgid;
 	traced = bpf_map_lookup_elem(&pids_to_trace, &pid);
 	return traced && *traced;
 }

base-commit: 148cd3adf2df9e53fd9b3070ae1178d4876f8c67
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

