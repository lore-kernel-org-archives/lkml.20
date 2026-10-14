Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F16A2C21D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791951777; cv=none; b=M3tKWIFJOIAWLq3douIobzhUPonzuJNS87vnmchk/SwYGeAqINkkPfN007ljTcFrqpvN4ZZzsqE7SvUU/9vKOAxFgeLXOlF7Jize/QANQN/l1EWFPczM7iKMuFaBNcQedfN/ou3elgSlX9o0GD1IeY4Xqx+uN5Hij6AR8A1Nup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791951777; c=relaxed/simple;
	bh=pthNk02sT5MhtNVGjPzZDe3I9Gl6nBSMh/U26T0qcFc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X+N5VOCAKanMkSiSlf1kCXLLfbZTkbcx2QJfueVfdB/JdJYQDwr8Vmskz2Pq8XB+aCnUUFGGcGMnArAZ1juHmbIbuxCxP2TX3JYORWevmA2WN7EvRtnDHbVKNGIHZo5u+8gaPVkpHvAVAk/Jk7speN4VIO9M+tzCSxoPXZNAc+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PT0XI4dL; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PT0XI4dL"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so5565928eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791951775; x=1792556575; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yE9kiZyHPWW8D6z0CBqVP5Y77+hh44cVozCo1RtidPE=;
        b=PT0XI4dLQY95nC3BkiyQ+H2t/z+hs0MMUvzfZnRESLguI4Oq+xOu2iXbVwusSGdDgP
         TILmpvdUy/SwSjy2bmepUxK4TJSIqs8rMW2RkfhQ+2arr4sPu3UvgqGoRb8y+Y+EiNEk
         vuz/ZJZ3zKUAkmA7XntH7L4iDlwnRXl1rjUuo9m3PEkQRwcYYa8FY3GQ90kjsCVt+hYv
         oYKNT8eKxnY3HlVQlRA6b5x+PLqYHdpFN4rFbkrr4Spfob1Ggu7NCVigVYqSJWE1eSoS
         4D99JlvakOyElsE+18wdVIVjjHH3Xq/otAFeiuTw7jJeQNUnwOFNOc9WKkHghdZqUTlK
         UrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951775; x=1792556575;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yE9kiZyHPWW8D6z0CBqVP5Y77+hh44cVozCo1RtidPE=;
        b=Gz2MqugiOlBNzrzu5aDZfs63mAobl6PQGOHZzuW3WZZ8X84A9GqBTjPXanHGt867a1
         LMME1qJXNitweZ+k0etUC3kFhhNaPUIzwR+I0tWwY34eZu3dNs40Omt6VCzIF7Xx4l+p
         3B898v2StOSD8z6I8MLxFfkf9ojBXYkHU6y1VKdxpw62xs0wuOYhjSwoslqM5qy4rUkd
         nD1JTmNvi8obgnkFA6qC6kC+s8eM4GdCyyfAM3RV7iYXOtsQY276T7s8KsAvWuNXYHSH
         lShDvvXzekxXDHHNYiz00gdGzKLCxKFfOXnilfdM0hWxNzq0J8Hr+KmisYfKQUowhudS
         JWbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAcwhiwBUriHQ6wsqkUCK18FZeAr4YTUzIvXwYx+cZad33kiYEBP5P9DrHNZCx2+YzBLpk/7q2D2BOb8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3ONDuNl5qruaiYCfsnQrv0QnRnQ08A1PYSbBxBhTp0vPzSQV1
	o6B5wtJb1PF2X9CLZE77YcdpNv9a+jzbNeuOgJT/QLr7Nt456KSogijff8+wq3YhUxG/DMmx/mk
	MI2adnx6w4Q==
X-Received: from dyr27.prod.google.com ([2002:a05:693c:401b:b0:35a:be33:bab0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fd03:b0:351:4866:255c
 with SMTP id 5a478bee46e88-3537e058277mr26818915eec.32.1791951774700; Tue, 13
 Oct 2026 21:22:54 -0700 (PDT)
Date: Tue, 13 Oct 2026 21:22:45 -0700
In-Reply-To: <asDHqdVt4CKq_EoL@x2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <asDHqdVt4CKq_EoL@x2>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014042249.2379829-1-irogers@google.com>
Subject: [PATCH v2 0/2] perf timechart: Add --live mode to the TUI and test
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, alice.mei.rogers@gmail.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, atrajeev@linux.ibm.com, changbin.du@huawei.com, 
	dapeng1.mi@linux.intel.com, irogers@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tanze@kylinos.cn, thomas.falcon@intel.com, wutengda@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"

Add a '--live' option to 'perf timechart' and 'ttimechart.py' that streams
live scheduler, power, or I/O (-I/--io-only) events from a 'perf record'
subprocess over a pipe and displays them in the Textual TUI with a rolling
time window (--window, default 10s), pause/resume via the control pipe, an
optional workload after '--', and optional output recording (-o), along
with headless shell tests in test_ttimechart_python.sh.

v2: Rebase the remaining 2 patches onto perf-tools-next after patches 1-11
    of v1 were merged.

Alice Rogers (2):
  perf timechart: Add a --live mode to the TUI
  perf test: Test perf timechart --live

 tools/perf/Documentation/perf-timechart.txt   |  20 +-
 tools/perf/builtin-timechart.c                |  80 +-
 tools/perf/python/ttimechart.py               | 786 ++++++++++++++++--
 .../tests/shell/test_ttimechart_python.sh     | 300 +++++++
 4 files changed, 1111 insertions(+), 75 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog

