Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6F43499D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465981; cv=none; b=cSNTPbREibklJcbW9yec3pdwTJJwaJ6an1lIY8IiToBP/8EbZUcwIwRdmgDERD8ZWtnG8y7GzOAhuaezeap6Rjj4fzZ+vEf5sm6HpZZsim7vhhc9K+0qRxjZORFyMyTswJ/M6gO28K5ZfGHFx4ZuKN+TwQQVHgEsU85V6h1BqaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465981; c=relaxed/simple;
	bh=0nRKFQWrBzNlqEB0me43CTQx8nsAcuxBbvMQdFINpuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s/9/ZIMan6Wwv5YHgup6c5RBfhkLpZRfb0az6H2WftgkEDG1RCKhgy4bi1Bd5+yShSZw2faa8VYIt/WNAUSQMqatKpswcUcWchSC0L1h3IzHKfXOy/2mucvjrKKFVsqYK4WlupbuT5c8f9T05/RoNWwDRzsPsjPe5dpZXmf5bmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LciBFKOd; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LciBFKOd"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso1675858a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465976; x=1792070776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6X/YlI37Obc7dyoQg+rOFZOTbmTrlvzXPbp1uaNO/g=;
        b=LciBFKOd/0m4K2mk9gv7GLcRYEQOzXpJSKWlA48AfRV7PK30SOZTR37By0Nh93Idc2
         AEcvvifqX1cwelHT4zYW2wgh1He2pEymCeqk11S/8sSHnF0uiR48becFxs/CiZh22YA1
         5S+FPUqTPITzBrGJfz6TcxSsmKYA2Gjcw+3O3VVpc/Zw0RYPZ9lMoh2bNNO6DmefiZlR
         RpAc28TFNLpP40jJ9/TQrPlogUKmQEZ5qP2lXKLGAX9zx5+kLNdXV9orjY5zG0aONo4s
         S2O1O3i/2omEppwIiJmOVmHYj+jOl84l4u3dTvSJzy1aAemROou9u7aFCnwWJgSdqqal
         vTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465976; x=1792070776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6X/YlI37Obc7dyoQg+rOFZOTbmTrlvzXPbp1uaNO/g=;
        b=WUbSVYw9ZVlMTnKKwo7zMY9Q/ozI8015Gj4qqdkpXgwmDX9BcSTD7RprB6627Tp1/u
         c4lWnKmSY7iChiMNJDfXRqrfa9s3nQapLUmr+cTxV6xCMhnuAbrg6MDvJIP49P0ZvN3S
         DR+/SmWsUxDC1gF60QyFyRr6qIQy5epjqHTKf83O/oSXL4u8SuEVzBGYGH9EXz0R8KlQ
         oYKoxku7JHP7xXsQ/cSyjGcNT9pmwFNBvngMzerhwRKBn/2mtvvsirTujqQG2V9qm8qU
         jT7GMPHgOEo3GnV05m5S0a73cPptBZVdo/byCYK68WrnMBVaW3xp+dugZN/dknhQ9gqc
         8kyw==
X-Forwarded-Encrypted: i=1; AKwUvBzqYOKCsNyDM1+3zvoBkhCm/Liwd1HRPXFtTLbK1O+NExAJnCLf4KVjVmfwcF90LeP6l1pv7F4nETg4+4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5tN5FDPujgXx8/QNDU9GbyrnEP7aeNEr7HTA60s8uKbzX+QeI
	Ka/PJVP4kSpv86/dyp2nZJFn40BKXa3SC1mDlLTofO7cZTFDQfgFECOi
X-Gm-Gg: AYBFou2SiGIWeWPeJYGQ/fOA+mMs6HDf+4Rl79X0WupH7VEkAyU7CerdkIcUFuv7O5D
	aZyAbUOzlNrDZtpfZcss0oxw9Vql2xsv/vGeIeH++qxBv/pwUTn0KAXiQhvfzxYInjy0KNbMVfY
	4+qMoWgAF1otmTg6CwUqgE5kjt75ZGIxqrcLg8vAYEcK+STeq51jW4JrPdCpOjRg8e2OYBVQH1T
	YW1nWgGg4hOU+gqmyz0WjZSDipzvp1kI8MLDY5XH4REuQXk/HjhOMnLOUn/TRRDNUFwG/6H7EB5
	s7K4fILdLQGeAroRnspeJqcqfNpqkgz2ERELR410eKBtUN04stkWRAum+3SHU/P4+8lK95G1JGI
	29YPR5It6i3XSZ6iFA9ajzHjhaR76UsyaERHTv7LzBGgf33zmE63oxvWVKPW41Gwe1bSBrHqZaz
	b7ZOWPEy7MzS4AmiL9Kxa905lGo7Pz4kOgIixodxcRHS97SXp8DrtkTmzqzP4A8NI1B5Ht0g==
X-Received: by 2002:a17:90b:58c4:b0:3a7:9ec3:e9f8 with SMTP id 98e67ed59e1d1-3a8a0ba2239mr3795426a91.27.1791465975637;
        Thu, 08 Oct 2026 06:26:15 -0700 (PDT)
Received: from localhost.localdomain ([2a05:dfc1:8bc4:feda::11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab1e8b7d4csm476312a91.16.2026.10.08.06.26.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 06:26:15 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Jemmy Wong <jemmywong512@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] sched: Fix proxy-exec use of curr and donor
Date: Thu,  8 Oct 2026 21:26:01 +0800
Message-ID: <20261008132604.98242-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the split between scheduling and execution context, update_se()
charges the open run interval to rq->curr. The tick and the runtime
sample still treated the donor as the task on CPU. Under proxy
execution the donor is blocked on a kernel mutex and the lock holder
is the task that runs.

The NUMA and cache tick hooks move to rq->curr, and only when that
task is fair, matching account_mm_sched(). task_sched_runtime()
flushes when the sampled task is rq->curr, through the donor class's
update_curr(), because that reads the donor's exec_start and
update_se() then adds the delta to rq->curr.

The single-task CFS bandwidth check is pointed at the donor, matching
sched_fair_update_stop_tick(). Both return before the bandwidth test
unless one task is queued, so the tick decision does not change during
a proxy and the third patch has no Fixes: tag.

Without CONFIG_SCHED_PROXY_EXEC, curr and donor are a union and these
are the same task.

Jemmy Wong (3):
  sched/fair: Drive NUMA and cache tick work from the execution context
  sched/core: Flush pending runtime for the execution context
  sched/core: Check CFS bandwidth against the donor for NOHZ

 kernel/sched/core.c | 18 ++++++++++++------
 kernel/sched/fair.c | 28 ++++++++++++++++++----------
 2 files changed, 30 insertions(+), 16 deletions(-)

--
2.54.0 (Apple Git-157)

