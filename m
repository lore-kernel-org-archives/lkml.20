Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792734597;
	b=W134xTwKzba2/j8KALopitgWXgRty1D2Zv3UHos/F72xjzVEqjRu1YqQVUG/wcGwJEvf
	 8k33laAwy2lwFC6JjvX7oHbFgjtp8GFZ7RY3OI+4eX6jkMGbebDutfXuJV0luHCqhF3mh
	 p64wj1965uXVZE2GXGHA1VUdVIs6AjjvAr1UCf6HmZwS1D1yVXjF1AaX1/O3C+oO9lLT7
	 RFNkkxYclmdg1mTgBkdEas2aynXLUrSX8swGkSt7oJ1VBgTS4f4q8ESjLI73BuBGXnjwt
	 TVuriuCfcOEBx3Vsev8UOhAYGXGgM7BJKGhEhmvZ82ClGQuWjlSGn1s3TK+s6D0FqKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792734597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PmRNqRMWYPJdyJeDx8osTz98COnYhm0n4Ki94bccpww=;
	b=wqIPO+Y7A52eIW2lcmx/e8fTELWKj6tR+ZauNKR9hbHQRxYKvCaEXurIHyToyzbyy6zV
	 1uiPv9ui/DiRV1GEbuMgtz4N3e+QlzaeH2dHLCg8xcdzu2aNKKZ+7AphGQVW1y2k387aJ
	 lMtKGk8uGLS1hVUbbaWLP9XyAsYfEVx7CBmpuRcq777L5iYoEQg2EmfQ6WZDyoJpMBGFN
	 V37HjPqMvZb7clqETZHDeGDiVUUmVca4rqSJeUsZK1pyvf7hPqRx69KLCE2NTkm8cpJpA
	 8i5L/6bStfRFkbaf3HmcUKlDGC2Tul9Imz6DDIOPLLcxmHpeToQbkGFjcj5kQrOREzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=U9xSUVQV;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3752E606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3752E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=U9xSUVQV
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a086ed8980so362596b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792734595; x=1793339395; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmRNqRMWYPJdyJeDx8osTz98COnYhm0n4Ki94bccpww=;
        b=U9xSUVQVOlS4yMLTwJv9K9dG9uwXHnjhIJIwyegbA12VG8wpBcu2YepkY+fuFJ5TKl
         vGKutMvaSqbdVdyIHx4h+QBR14mbn14lUNrUoa+ME4eRX5zhlX0hYr9giu+/SAmpyntN
         1CTI1xfYqQSFGlVcjzVjq3n0WgIh7h+HQjEF+w9bkeAnt7mzIzsE/0Pc1HtmfIVL03Kd
         PtYBx7WG8FxT534GnUA5O3qP6ByQY1dk486uU4Unrtbdz0SmqU8qGwcWP+9LULEs2x/u
         2QqhdsJFhKEmPwv5lio+OdMMSd2BzcV87z/UNCb3KU5cKBoUKr2sz0ia7SyNUMR/dfgu
         kg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792734595; x=1793339395;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmRNqRMWYPJdyJeDx8osTz98COnYhm0n4Ki94bccpww=;
        b=JHUOMz3eojE6k/vybOAEPp2wpUzokKqa0fg7v07JFC26nWAaNrBbqbqWsLRNBR87CS
         AY+Tx56UqER55GxIBHEPEVsKlTIybdCNiUMM3EKrYOc31pMa0mgH3ZAA8Sb/pPfMxoVd
         yfUaQWnGRp6N6Y1o8nGB0yccaPUSdd8bw4Y7IO2UqiYelQLIuhX38EqOsgMI0ng7H//s
         LI26KJOYdlt03bnJVatxDcc/YXpLoSQUYiXqclzhULHhnDoDYDcVe7G1ett9q62m4cn5
         scmpATU6UGXwukJiS2iowh9y08gKThIl3zKIO0CjrpWJRWPeXw4qGY5zJNkWNt51vlW9
         C3UQ==
X-Forwarded-Encrypted: i=1; AKwUvByd3Tl4CH9aYORf9eVvZfhqk4qx7KqecAzaIeP/opds7QE1rSU6qiZUCLEGxS5NZAxGuI1o/xxJVsoLf8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMYJtK6WcgIxk/dcOWqIzkbz3andtoYgpk6X+T3ZsjN606w0+H
	0xIUXIhwIk6vTNO6+zLS00pEOaum1EXR+s1aYQBDUyd78g7KON8iWGYl6ZAMTV2p/aEfC6FAYlf
	1i8WmBSioNw==
X-Received: from pfnj2.prod.google.com ([2002:aa7:83c2:0:b0:8a0:cc:2b89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ca9:b0:8a0:2882:852c
 with SMTP id d2e1a72fcca58-8a0a0510b44mr2447924b3a.51.1792734595332; Thu, 22
 Oct 2026 22:49:55 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:49:49 -0700
In-Reply-To: <20261023050207.2449976-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023050207.2449976-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023054952.2503540-1-irogers@google.com>
Subject: [PATCH v5 0/2] perf timechart: Add --live mode to the TUI and test
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
optional workload after '--' that stops recording when it exits, and
optional output recording (-o), along with headless shell tests in
test_ttimechart_python.sh.

Assisted-by: Antigravity:gemini-3.1-pro

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

 tools/perf/Documentation/perf-timechart.txt   |  20 +-
 tools/perf/builtin-timechart.c                |  81 +-
 tools/perf/python/ttimechart.py               | 901 ++++++++++++++++--
 .../tests/shell/test_ttimechart_python.sh     | 310 ++++++
 4 files changed, 1237 insertions(+), 75 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog

