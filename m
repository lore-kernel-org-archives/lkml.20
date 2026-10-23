Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792729109;
	b=BvW1sHH9gw+7Nx6ovy1RZ9HrzBfdbLGGYRSsDRHxSwO0M5IHqjNQ6wTJwteAy3pLpq1o
	 bLmjxAusKOLva6gul61Zu/Pq+MHHVtKSm4rSSWQ+INGMoijytDt6ACbuUX4zAMZmWazUh
	 fCsQ+5EJGrZAo52z7F5DenSIACp8FjHoM3EeivUZ9zW9JuC1aFoX+ssTLkhNHsKQkq0fk
	 WdJtT/C20eLHQMq8ylLT+s9lVz2jhWEe0vbisXy6hFf8SauoJoGGviRKTrgtNRmEcRKV1
	 avzekXVChUVZ6JLySPxAZLMKS0O/cu3bEOFguLEfIVrqEUNo7Aj8joJwE8ZAPSqYyVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792729109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iIJmKLrzvxIg0OJqVcSfaYZDqKZjcxSxZP7eownyawg=;
	b=Jy8nisc//k/7keaHY/xnYlQRW1YuRglPG2T2vfrTY7YcvwrK/avVCMRbOfKi7DZnqFAn
	 r2OTvUg1WT9P/AvmHsjv2ncVy8VyFkuhOmaRWS1N9+YAzmXULsqFycaofKzo+xvQwuZiq
	 k23iQudgk31lCrXN+wGDwpxZq8ohuP2sJLBEAVn1tA3oYEjFrvK3o5weUs2mDPEVgJ0qe
	 NtS/TWmDwnMB6DPnCbmF4dBkKHOt5iBkl+bcZkT5g6/dF/FpslAWEi/fXZOf5tUDWNa+C
	 eK3SuaErSrUlaCmKjZmUp6XY+Jm5WLQjpCMHNxwhBBeBkF6pceO1yI/N45dJxrAGUoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Qns2m14L;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A7F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Qns2m14L
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso990380c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792729108; x=1793333908; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIJmKLrzvxIg0OJqVcSfaYZDqKZjcxSxZP7eownyawg=;
        b=Qns2m14LZlV4dszoi0utHSgyJhPq8uJq3cyA2ZM/9RLpZR70PNyZoRzuaVwle/oZfJ
         54YApc3biT+Sr0nPtPhOR3uiQpx+ANsVg0f/aUfeX7Q0o9O9z+T1sCJGzhDow9l9OjE+
         nsqWdju2MRR0extVUzWJOLzH8nLhPJKwQR6P/UXJPFERmqqCNNZv1EuYkQtDgKi01DN2
         LQrYrmU4NXpSdmm4Wxix/EZh4o/c43+XngAyZN0Jl0YZW1/gp0UlkkmBTXO0JlBRSg+/
         hwUMoyHa/m2UCCsnI/8zjN21+PAyeRo2swWnufHT46YIuL79XjLw7q2a50gejnzJ+qgy
         N6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792729108; x=1793333908;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIJmKLrzvxIg0OJqVcSfaYZDqKZjcxSxZP7eownyawg=;
        b=W6K1HUjqIFYLdDSHjQvgLj+f5h8pVBnI2wXvbhBPeJgR79ejRbsh/k8lWOPoqImU+V
         a7qcFzw5ZWaXID0caN0kylrBabIieep2AquHlETTKv6Cou6dcp5eJCa2cphbA5B/Xzvn
         IlumQmaxHa7ZWR7GRVioyT/KXtaMThKZd6XnSMvs3c/9bJIrSP33PA3GMFOBwliAHY84
         NTQgt5xN4gzMOxVeYZ3BKDnlV+DWbXxwZpdF2kaBtOBcfFW4bImYocLIJ1IdyHE47/C9
         B9lHappZFfIm3sBKzAtVKt5vxPQrfDBBZxXpWMaPYFLLZJvuYpRNF1KhPXiH3BYgKZoj
         5RbA==
X-Forwarded-Encrypted: i=1; AKwUvBxo/0kcemdjKbdMO6AO+YacHoOblLFIK1eNZpyUXZNuRN/ymRyMQZ3kVVkQgdGAJEEfKiVv3vqww0/xozs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGaUlVJnIF9TWn9+tNkwG9UkEsBegi/YRMGwTA5FrQnWmvdqoN
	3RJyAIOt2mOUoi3R+XKS05ggbix/596b8Hvb0FbjSRzt8djUqkTDr3pc+3J8PJy1FnJULqSa3rj
	FrKFSW5/Z0w==
X-Received: from dldz19-n2.prod.google.com ([2002:a05:701b:4193:20b0:163:a42e:b837])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2053:b0:13b:2f26:6881
 with SMTP id a92af1059eb24-1959a9454dcmr1700375c88.4.1792729107542; Thu, 22
 Oct 2026 21:18:27 -0700 (PDT)
Date: Thu, 22 Oct 2026 21:18:15 -0700
In-Reply-To: <20261014042249.2379829-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261014042249.2379829-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023041819.2361900-1-irogers@google.com>
Subject: [PATCH v3 0/2] perf timechart: Add --live mode to the TUI and test
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
 tools/perf/python/ttimechart.py               | 786 ++++++++++++++++--
 .../tests/shell/test_ttimechart_python.sh     | 303 +++++++
 4 files changed, 1115 insertions(+), 75 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog

