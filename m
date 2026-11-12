Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526664;
	b=NbndG5es58qr6TMVL3Ig3CLiEkCuWrEZHfIDXyjUYrDpf22DBfJklcS8XSoyvBvKJuV8
	 tOAkZhmvvMndCSlWQ66nwXQnmis1bOPA4SkDLveH7VxCZwsgEqaKOTqiSgH9niknchbpJ
	 lZcO+wBWGkJwvD/2Yk01lhiswZK7BtF2K3UZFli+3sMvhB/3RIa2pqDdSAtqAgldu3/+Q
	 yri2mIp7lOXLSGZUxFnsUwPMZyQOqN4VBiNJ9m0Kvck6M3SeaeIblKOLB6ipaVE+GZqjG
	 +UrRUm1zrvtWoZT0OGLU/jjS0uhJltSVFkbKX9SxorS1BkSRg1ajHRBvIT0bsgUpF4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Rfpzb/ezDwI38PLxzrjqkaoWvyzmkf9DKdXHTzqeDHo=;
	b=wlhwyqzgd023upaD32BnWlQ9toSxESOGwa9bDYwJZKhvpt3iDEaWAWXq0KCR2Kzl9Hf9
	 Yhe16TQ1JPBUWrJG8U9bybZHcr+iy5tRVZ78toFRN8U8fpQG8OyzBF0bUaEszp97MdKkL
	 SXx2hIqa5mJTrNAhoTS3sUCP4DSROlUQC4MITlLwTjMEXSfWcbJX3p8pSHVzELzdMc3ek
	 APfjwl0nFdUq/O/DJVS3p1P3UpI9RmNPzgECZJTBHfgQcmzfeZEvlStO4MNsqRSVBv6Kz
	 ijSHIevGXSuf+UeT8OrbnTqBFu+sWvg0qf7QCdlIBkGlDX0eh/z9OkOZMkgIh8sJJUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dRjwUjW2;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E14606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E14606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dRjwUjW2
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so255275eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794526663; x=1795131463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rfpzb/ezDwI38PLxzrjqkaoWvyzmkf9DKdXHTzqeDHo=;
        b=dRjwUjW2UKdovWxEID3EkzbnWLLTHk2mgUZYMXCc51U73cat8RdI8KiDjgQ5Uc11vw
         SuRF/vhkgtERht4/+O0rSeJT96rCH3XJXROwsEIrxr/6NzaNNubG52l9olc63khmh7Kt
         HKDTO58AJOp8CupoVuNzGzUMgNdQbu9dF4hoMJcDOiQUU8twttGMZAaapuK6wxQPtXx9
         +ZnrrJJi04kY4HVmjalrqkG9qTZ4QshMocNKYWs06nZ1jL34m2L6Pp+lB1wWQNH6CyF7
         ZBfCshH5ZAkIpFA6TAaZL/97ryAP5eEYyYIYuj6fp+c3VB++Vt+Pkgk4FLaf4JTEO6Zu
         ycvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794526663; x=1795131463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rfpzb/ezDwI38PLxzrjqkaoWvyzmkf9DKdXHTzqeDHo=;
        b=XQDcaOj3MkcUIWn4yJfcfiKwkk4zEF3alTfVwWob2Ca+2MnyYV8xzqPeDmfvA6YLvM
         aLpO+fdVMj6cwdV2UscENIY6DsOy7j+9gA68Q5fJmMxtNPYQFcyFiPZHC72nSjYXOmdt
         A7hJaMAW6f0tKPDRWzOzbHKFCO0adP5IXjoVgYAGWPdX/JjDqo7YFjZHDfKNNHNDbCU9
         NHF0o1CGCRb/o01o91Aq/+u4hQQd3IROBNx4SWfD9VVkoDhZrdiRVZdhbLHqxs9v/X39
         KCS0wohNoaaUasQFSr11JazgnGEgHNIEDRDyzmJlnyjNGi2SBSedkZNz6QG0DFdm7XWy
         gtfw==
X-Forwarded-Encrypted: i=1; AL+hErFM/Xux4gCeubjY9XBjwra/BQjcoiWe3TtBULaWTcwkh0qSVDjCkoeneoYc6YHwTBxBuplyyxS+B693L04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qoy1+heO8zWQZdJaPD/7T+XUJ62J3HhKcU8xMsufEjBbyptlo
	NKGJHm21/URxBEx2U8B2A4/NAhrav+utVPMA4QBnlikTovUfcYgCNWYhdLag42jSYRsjf5myiYz
	2Gq0/g8s2Nw==
X-Received: from dybpd9.prod.google.com ([2002:a05:7301:4549:b0:36a:1c45:2f79])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:2103:b0:36a:1a7b:d1bb
 with SMTP id 5a478bee46e88-377e1af5c7bmr3672824eec.22.1794526663031; Thu, 12
 Nov 2026 15:37:43 -0800 (PST)
Date: Thu, 12 Nov 2026 15:37:33 -0800
In-Reply-To: <20261023054952.2503540-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023054952.2503540-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261112233738.699031-1-irogers@google.com>
Subject: [PATCH v6 0/2] perf timechart: Add --live mode to the TUI and test
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	atrajeev@linux.ibm.com, changbin.du@huawei.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tanze@kylinos.cn, thomas.falcon@intel.com, wutengda@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"

Add a '--live' option to 'perf timechart' and 'ttimechart.py' that streams
live scheduler, power, or I/O (-I/--io-only) events from a 'perf record'
subprocess over a pipe and displays them in the Textual TUI with a rolling
time window (--window, default 10s), pause/resume via the control pipe, an
optional workload after '--' that stops recording when it exits, and
optional output recording (-o), along with headless shell tests in
test_ttimechart_python.sh.

Assisted-by: Antigravity:gemini-3.1-pro

v6: Rebase onto perf-tools-next and address Sashiko review feedback:
    - Patch 1: Queue pause/resume gap timestamps in a deque so rapid
      pause/resume cycles before buffered events arrive still close
      pre-pause open task and CPU states at each gap.
    - Patch 1: Increment nr_samples inside TimechartData.lock and check/update
      refreshed_samples in the same lock acquisition as checkpoint() in
      live_refresh() so final buffered events aren't missed when paused.
    - Patch 1: Keep cursor following in sync when zooming in/out, resetting
      zoom with '0' after moving the cursor, or jumping to a waker ('w').
    - Patch 1: Filter out all threads of ttimechart.py (via comm) and the
      child perf record process (via $$) on syscall tracepoints in --live -I
      mode, and ignore filtered I/O events before counting nr_samples.
    - Patch 1: Track record boundaries in LiveRecorder's pipe pump and emit a
      synthetic PERF_RECORD_FINISHED_ROUND when perf record goes idle or
      pauses so ordered_events does not hold back the latest round.
    - Patch 1: Always drain perf record's stdout on stop so perf record can
      flush and terminate its workload cleanly without blocking on pipe writes,
      and kill its process group if wait times out.
    - Patch 2: Gate the LiveRecorder task-clock subtest on system-wide
      task-clock permissions so unprivileged runs under perf_event_paranoid > 0
      skip cleanly, and add synthetic tests for multiple pause gaps, round
      tracking, and cursor following.
    v5: https://lore.kernel.org/linux-perf-users/20261023054952.2503540-1-irogers@google.com/

v5: Address Sashiko review feedback:
    - Patch 1: Always record system wide, as 'perf timechart record'
      does, as switches into a task and idle states aren't seen by
      per-task events when only a workload was recorded.
    - Patch 1: Don't move a task's state start back before its recorded
      history when its switch out and back in were lost, which inflated
      its running time.
    - Patch 1: Serialize LiveRecorder.stop() calls from the UI thread and
      the thread processing events.
    - Patch 2: Only run the live recording test when scheduler events can
      be recorded system wide.
    v4: https://lore.kernel.org/linux-perf-users/20261023050207.2449976-1-irogers@google.com/

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

 tools/perf/Documentation/perf-timechart.txt   |   20 +-
 tools/perf/builtin-timechart.c                |   80 +-
 tools/perf/python/ttimechart.py               | 1232 +++++++++++++++--
 .../tests/shell/test_ttimechart_python.sh     |  355 +++++
 4 files changed, 1590 insertions(+), 97 deletions(-)

-- 
2.56.1.703.gf848ed807c-goog

