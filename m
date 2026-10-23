Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792731731;
	b=QJALCd7NqSEZOY9hLVoSnMaRWXiG0Ekm9IIy0cTUJS5YJHh0f7IhP4cjlSVy187yXvQP
	 QthATWdVqtqccvWD59Y/eZJALrfv+0S6/484uL45R607fn2/Jk6FCRCeJ+kXFxuW5b3YX
	 gO1ca7eChJLhQVqRLJt/tq55yvDDQ4ZCAcH/8QlHlfPdgyptSlg/uXlrTb6hL7g8vsarx
	 YYHeaiWrUvbjB0lHC4v292b5hSQxoBONm/C7TgEvyaB6sDG9bk5JFJOqqLrAh/Hn8qk7a
	 0Hnq3PxAq7eZfz9oUhsqyN41YNpUmxpsPcaRZ1IVct0ztLTI2Yn/jkm/n5DlvXVKkug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792731731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=j0KfvoStPE/oWeU/D6LwKAOgnsFDdhuJc9bCzRL10U0=;
	b=SLU1g+H/j0b2EbmxsKVl5LjZT0Zqj5SoV4pCzdInmYHdtV5mfusDIVBMtHtahV3Cmc+P
	 xnW1VrpObeqmernxhuIG7tn6fcKUtRw158Hal87jOLGP6zyQSs3GZFg1ju7VWRyOW7sZG
	 t2vKKL68lLhrL4e+644HNVfuLTgBW7SkKNKFOlAzmVRhGpF8WV9OrL4cbpEPHXNxnb4Xb
	 a2jHZEsn5j4YC/6G/0q7nOOkJM2pb/4HhE5EpduGrBdoYQ6x1H4PrEtrm1gmvI5Q1tGL3
	 mZVWH9OI7VQfsl+vjfAJ7Ik9u2j+8sZmatd1OOqvL8CCpN/4n0l0n5oD7BnY6XAXZPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IT6teL8P;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B23606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B23606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IT6teL8P
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd8b299b05fso544513a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792731731; x=1793336531; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0KfvoStPE/oWeU/D6LwKAOgnsFDdhuJc9bCzRL10U0=;
        b=IT6teL8P/8WJyg2Qmivyk5+1CTe93ZN2wGCDi/jVdJ8uxQdhxn3ZElylxQVR65sck5
         fZ95ac+Q7wDuAZ83/yNmjQpgLWXhEV14IjXwybedVgJo935vTDgvkwJKW8AKp35l02BM
         TDGgUYpLd03GYE9HakwHXRmo+adEAb12vQikZ48bnJMVfqoI7treKusHSGgkaHz4nWPf
         nKlKwTcigDWG8/HYmoh18r6QXQxW2YpZsRMqAQ5d3HtzhaUQ/T/e5Mk0ma7cJh8AB59g
         X7zDZb1D0M1QKubFjdzprc2cjnnIAJfyPkcZ9+zeVoI59Bvuh3iwU1XGymk+A7v/30nu
         hYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792731731; x=1793336531;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0KfvoStPE/oWeU/D6LwKAOgnsFDdhuJc9bCzRL10U0=;
        b=MNlmAZAy1fPP1LeGSUqp5qyv6qL0N6X7x/7P1SMBcAO5C8Z6NJ88Ty63LWsLZcb538
         TeoIVYfg1Utk5uMgsz4V0bl6TxWjXMo7f1MIv5gvE0zY+hBrUE4EfAGuDCcQ6WjIrUsO
         xCyXi3Q2R0eutm5ZiiWdUHnGkWTi+DQXGKpcKMaTLBjX1dzEe7hPtM4mt5mornP/JrFO
         11Z9RRB96WFhDZ1nIKKV4JDyIp2zht0Fd6pxB51sKflOXmiRmCsr8udQV9xXwRFFbX5n
         DjOR21TDt4K+VGpKQxilbBpgERJOFtP69x3VMnCn9US+3hAxP+ZjRS7J1XeZX8e6IXdW
         kbDg==
X-Forwarded-Encrypted: i=1; AKwUvByOrO07b1v0QrJlkUgiCxTXYDi6UqnHZ9Are6E7G3eA5dRlGw8h09pYwUE9/R/eYwnvx7WDZWQBZrlljSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJOEl1KryVMCyTs7J/9psk3SJuTqatDKZgT/bGIgTyrB4WQ1Bk
	K+g8LTYkUzsVceRjm0ureLpu2FvR+4nXEDhivGESOXaKMETomYNSowdcGgaNxms6SF60IUITltJ
	txDsrMCGBPw==
X-Received: from pgmc14.prod.google.com ([2002:a63:1c4e:0:b0:cc7:cb66:8df9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9149:b0:3e1:c08f:16dd
 with SMTP id adf61e73a8af0-3e37666562bmr898625637.27.1792731730576; Thu, 22
 Oct 2026 22:02:10 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:02:04 -0700
In-Reply-To: <20261023041819.2361900-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023041819.2361900-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023050207.2449976-1-irogers@google.com>
Subject: [PATCH v4 0/2] perf timechart: Add --live mode to the TUI and test
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, atrajeev@linux.ibm.com, changbin.du@huawei.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tanze@kylinos.cn, 
	thomas.falcon@intel.com, wutengda@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"

Add a '--live' option to 'perf timechart' and 'ttimechart.py' that streams
live scheduler, power, or I/O (-I/--io-only) events from a 'perf record'
subprocess over a pipe and displays them in the Textual TUI with a rolling
time window (--window, default 10s), pause/resume via the control pipe, an
optional workload after '--', and optional output recording (-o), along
with headless shell tests in test_ttimechart_python.sh.

Assisted-by: Antigravity:gemini-3.1-pro

v4: Address Sashiko review feedback on patch 1:
    - Don't prune live history past the last event, so open states aren't
      lost when no events arrive for a window, and don't count a still
      running task's open segment as a switch.
    - Keep showing the window at the end of recording, rather than jumping
      back to already pruned history, and prune events flushed as perf
      record exits.
    - Close open task, CPU and I/O states when resuming after a pause,
      rather than extending them across the unrecorded gap, and close the
      running task when a switch away from it was lost.
    - Stop perf record and close the files and pipes if
      LiveRecorder.start() fails after starting it, and close the data pipe
      read ends in LiveRecorder.stop().
    v3: https://lore.kernel.org/linux-perf-users/20261023041819.2361900-1-irogers@google.com/

v3: Address Sashiko review feedback:
    - Patch 1: Explicitly include <string.h> in builtin-timechart.c.
    - Patch 1: Reject non-finite --window values (e.g. 'inf') that
      overflowed converting to nanoseconds.
    - Patch 2: Stop the fake recorder in a try/finally in the synthetic
      live UI test so a failed check can't leave its background thread
      running and hang the test.
    Rebase onto the latest perf-tools-next.
    v2: https://lore.kernel.org/linux-perf-users/20261014042249.2379829-1-irogers@google.com/

v2: Rebase the remaining 2 patches onto perf-tools-next after patches 1-11
    of v1 were merged.

Alice Rogers (2):
  perf timechart: Add a --live mode to the TUI
  perf test: Test perf timechart --live

 tools/perf/Documentation/perf-timechart.txt   |  20 +-
 tools/perf/builtin-timechart.c                |  81 +-
 tools/perf/python/ttimechart.py               | 883 ++++++++++++++++--
 .../tests/shell/test_ttimechart_python.sh     | 303 ++++++
 4 files changed, 1212 insertions(+), 75 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog

