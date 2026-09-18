Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F593AFAF8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713175; cv=none; b=q28LrBYtgXMjCAyOhCdgqvkufD8Ey/7J+y+53c09GHS1koqCPe9iQRgcFoZo7yhIEvn1opPl+jhjPN08BRpCuwFfkJQL65gLRcdnMFNQnlae7XKtaNDUZ3mmm+jNcwxXT3+5JdY1DGhKDM3TTNfBVW53ToVj3mzpkWVtqhuwUyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713175; c=relaxed/simple;
	bh=ko4A1J2/9PDrUIO13S+PhAfAn0LFIltv5Te2s35u0rs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YzGr1zCpezMQDto4sDNWMvrYLq+dNuRyYgrnntwHm4SqCgK77z0kEJJQrMpcpsvmpabi/Tp4c+PORa+bUsa1Ig4Y6/CMMb17NXY1CQKKlo3gK/W7C/q6habWP15deaEAgwWXgXzqWK+g/leIA2lmXcfNycVjpA/CNb8+OvpX6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ksJjfP/+; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ksJjfP/+"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso355836a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789713173; x=1790317973; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxZ4xoXdFPC6XaGj0naVKf75jA+3TooOKs3kjAMRfVg=;
        b=ksJjfP/+9fwHyIhnyYFVOrOK/Yrp4eGVNDvdwxlYa+r4cnXyt29jePpl+KJbOFOmVv
         9evQFqzh0GSFK21BbX2vZG5kz7H/Sm04vEAxTIR6eWbRxOpr0lpcEhvaQe1tKy6MGfmE
         ttdO3e3VEylKgn6NSAjhotExQVPnrGSsXvzYJ3EHR+CUmZvgmTX1h2wNkjM5Y0JvuIjC
         joA3s1FXTe0fk/ktgra5epTwKkxj7CW8ElXE6XDWLXxoFBHqyQGuS3ifo/MJAGEq214l
         UsIcPhlBzLfun+H+3TL1TxqCmFfU+h3BthU0L8d3eYXGodmZAKYUMoqXLrVAiSUWaCL8
         k5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789713173; x=1790317973;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxZ4xoXdFPC6XaGj0naVKf75jA+3TooOKs3kjAMRfVg=;
        b=WbMiSgKe/hMtwhC+7gV81AGlGozDtnPrOAtXNwS3fvC2JuQjbKJWhxunmTo89IXk2E
         eF8UpAzlRBodPGg9LdioX6jzEZFc+8bhoopE/zp3BKy12S4PBX/CJL4FJEXrUCtDAVi/
         ouUPxAC5J/PAQM0QUhIJWIcznUMKRiTePUHT3OaiyYCOl80o3tHGGKSIyKcs9du2gD8u
         2HZsmk54MIjFZoAO0zkLBwqxxWXGo0BaZgi8rxIOt14ESZfi/tJ+gpvysSvoAnEuMuna
         7Jqe7tnG5lhCof5aCPbc87y06+nxaVtiu+kmfXeo3TtvFNRL10K9qnsmQwuLuEiKpV7C
         julQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrn7q4++vL25GJ6HsWTyr/hfj+3IPUGdxvqQtXiE05VCrLT5k3sFgGpbZsdKtpsZ4YXhUaz0BulDoziRU=@vger.kernel.org
X-Gm-Message-State: AFuF++kc8KzzG+zHyRvXx1c9P+6zNCMmsJ6vZYuC6G69q/jNv229T/lU
	axn1a1hjuS15rDfn4+kutRze1SryfG1P7YlJ/lzX49L3yrk0INJrgtTRiLOJClyyLRbroKrNbrH
	rWnAYW8HpAg==
X-Received: from dlii10.prod.google.com ([2002:a05:7022:418a:b0:143:8afe:be58])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:270d:b0:39d:b1bd:b384
 with SMTP id 98e67ed59e1d1-39e54d0edbcmr3673526a91.17.1789713172701; Thu, 17
 Sep 2026 23:32:52 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:32:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918063249.2172589-1-irogers@google.com>
Subject: [PATCH v1 0/5] perf trace: Tracepoint format error handling and leak fixes
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Running 'perf trace' under address sanitizer turned up a handful of
problems around the global tracepoint format cache.

trace_event__tp_format() encoded failures with ERR_PTR(), but
trace_event__tp_format_id() returned a plain NULL when the lookup missed
and tp_format() discarded the return value of tep_parse_format(), so two
of the three failure modes were indistinguishable from success to a
caller using IS_ERR(). syscall__read_info() then dereferenced the NULL.
Patch 1 drops the error pointers and reports failures as NULL with errno
set, which is what the callers were already testing for.

Patch 2 stops re-reading and re-parsing a format file that has already
been parsed. Each parse adds another tep_event to the handle and
libtraceevent can only free the whole handle, so a repeated lookup left
a duplicate behind for the rest of the session.

Patch 3 finally does what the TODO above the global has asked for since
the code was added, and frees the handle once the command is done.

That in turn exposed two leaks that had been hidden because the handle
kept them reachable: patch 4 frees the machine created by
machine__new_host(), which was released with machine__exit() rather than
machine__delete() and so leaked the allocation itself, and patch 5 frees
the buffer procfs__read_str() hands to thread__set_comm_from_proc(),
which is only freed when the read comes back empty.

With these, and with an unrelated libtraceevent fix I will send
separately to linux-trace-devel, 'perf trace' exits with no leaks
reported.

Tested on x86_64. Every patch builds individually, and the series also
builds with NO_LIBTRACEEVENT=1.

Ian Rogers (5):
  perf trace-event: Report tracepoint format errors with NULL and errno
  perf trace-event: Reuse an already parsed tracepoint format
  perf trace-event: Free the global trace_event when a command ends
  perf trace: Free the host machine allocation
  perf thread: Free the comm read from procfs

 tools/perf/builtin-kmem.c     |  3 +-
 tools/perf/builtin-sched.c    |  5 +-
 tools/perf/builtin-trace.c    | 12 ++---
 tools/perf/perf.c             |  6 +++
 tools/perf/util/evsel.c       |  5 +-
 tools/perf/util/thread.c      | 10 ++--
 tools/perf/util/trace-event.c | 90 +++++++++++++++++++++++++++--------
 tools/perf/util/trace-event.h |  1 +
 8 files changed, 91 insertions(+), 41 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog

