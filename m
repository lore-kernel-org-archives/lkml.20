Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621755;
	b=lS99nfuNsXI+fkptsv5E1IfOq6Hrt0ebDeztH28UEFgQA59pG99P2xELPCrWXIpKIAbH
	 E+zjfDzywaJbebje22aXW4cnoonJG9hkCGnrpcXJLDiGv+yF0qtSWvwQPL1AHTQ6SeCEa
	 InhfsJtcl2pJokOFDQdiSFs3N6+IlyH182Od86MhThtNtsI/VKotP/Wq4DmFhGDpZJvgm
	 DtjlrSNkH1vJ60I3T78xDvZr7Tuz2jsS2EHbrIR5YSQYY7dQMpRxQFu8FbWWxpKowX+G2
	 TbsMZCHcQFLWzFwqc2FiMc1Ix0mMpAWntdPFY8qSG9G3hs/LSCbaikBt8B6lXd46ypw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=;
	b=EFtdIojGdJaXsTrbz9QgSb59zp1i+FCeIebJE+l04HYuKj1nX/LKBMR0laKHJaXOKQ9W
	 tO/9gBs/oeq4DhQwAvS8aSEvXCdFTl3pXAXS6QQgsxl/o2q37B2A/u+GBpZKohmn5tj/t
	 R5+tVZFM4o7Y3cJ9KqERO2+4o5S/jNSaP5nq6Ot4aG1YfdtzApT+ioatQWDUGqDEKDm0r
	 7yc6nPyMjQbM5BsSewTnlI2h6yj6k/gj1hKf6sPa0UXclVYiHm9xe/Dat2RKMyj70ujoN
	 VVQQG5fuLDt2d/vwu5sp9uQPkOyYTlH9NclNMyI/mfTrDi5ye65ST5gzQoNUEsNgouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jYZuwm4i;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3315D60A3828
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3315D60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jYZuwm4i
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so24748715e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621754; x=1794226554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=;
        b=jYZuwm4iKSkQfz8VriuCw5G+4HqM5DpQwNMCAhfmyMQBm+b9/ypIreMw1vR1AwMyjY
         njYOGwK91dVT1jVmUM2chqMZy8mC6qnwipKHRsCRFg9kc4qNsAo52O5d8Ld2/ArA41tj
         8MZiiaa4OSsIHDefjEt3MGzdBtSdafTuU6Uhxvrt12CM1sHS3f2BjinZXuYn0ZZuez4f
         2r9lIvkFc8HQ+a8JdaWJsIU2NVZOyf8hdpj+ctz1J5ObmH/LF6hWUndZeR7XvS7gKbYP
         K/2XA7u5r71NjplD8x8jjZZW6GOVIo4WzSqUT0U7nPeGmumvMeFnZDxmK2t817ImzKKV
         UFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621754; x=1794226554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=;
        b=INmbBLs04iypTnQmi9NJlTgCt+6EhGEt0HSliycp3tbvNhbTRqKC7uSDFFQvUORAPf
         eQ9vPfLEi+gq++claiCvCm+I6L7V9HWS3LTq/bxgrMmA/WWaCAb5FDiYqsxYqgiGXHiT
         XGKvdbrKghleVlOVAMNNaFyXx1wgpN7FN7UKnAVnOSnu5K7nYwOQNaZHZOI5giqEVqIX
         bD1KUELoiS+CYjpi9tysizr6kx4ompRFF5g9DgEFByBqm3kYzkdiHmzsBN6Z3EMTlHV3
         0NPQy8bCUEZ72P8r9bOxta8dtXUtpJeiwwIc1fFauTopEY5+7OGZl8NJI+oM3A2XhuZY
         ftEg==
X-Forwarded-Encrypted: i=1; AKwUvBzPf1cjQmNSrj9gL5Eq2KRYGDI4kWP8RjGmN0LeO7Wa0CO0jPpjY5LY8likGlTqJd286Az9uycdbXXU9jE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFExOGfqGtKOq46yLlIAZfof9TTKqY0+GScECk6Qygq5p5pqSY
	ryLpLAEXeh9s+fpwusm6i7240AqvZbq+0f0Mk7qdQJq5q5XNeQFMWt7Sh/Ks4MLrh9A=
X-Gm-Gg: AYBFou2OkU1mIsxmZ1lkkZuARB2Wcj6dAk2YoHk2czdWcF3orTlngvwoesXARk0Cyx3
	G4nu6j+sW3Hg6o60+NC3rzn9n2jUZ5k/NyvJh3eyVXVMgZyhZBLqnBAMdjjFfrVnWGnjQADoiNw
	3vUFuYAe3ca2xEnEN9w7Sg9jeLAKKyNP3ofLAUhkG19UKq4ejZD5ln7Aj+6wv4KwJZaaf3ZKxMr
	RMTHPh6Fm83QNCj993ZNaECbr/E1p5jILeYiEflHsxmdZ4Zu1zQwZvGCQqvK1ECBJYa6KJcSCHr
	1KTbUYj0ZJVPkbQI/Hc1pUxm7hRLfU15P0bfoeP63lpIM4WRTm+jRosIuMszuhwOYix1tiAUE6t
	Op6MTmc9CbRdaLELI7L43wMsUz0lPLBSgUv9HGxSfqhU58N5pcfq6XApFmqfw2qGmr8Rlpqs3Sh
	58WLX7rEc9TDaHyeowr3YlhfZ0UoOg1hD7sqX/OMzGwrNt7itgXmwMQaNzdxcjfNkHV+z0ZVZWH
	Fvb4wobvakGF9Jbm8Mekvf3H/vRbX+cGPHCkJ/Tr3Sz7THFc9Oe9ji8olmf55Mn7H8hcfLGLGmt
	FvPwY33NX9pOix45PC6C4fUM89kCDwe2
X-Received: by 2002:a05:600c:a103:b0:4ae:63e9:36a9 with SMTP id 5b1f17b1804b1-4ae63e93a86mr93551315e9.14.1793621753669;
        Mon, 02 Nov 2026 04:15:53 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:22 +0000
Subject: [PATCH v3 08/18] perf cs-etm: Use instruction length in
 disassembly script
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-8-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

The disassembly script adds four bytes to each branch sample's IP to
include the final instruction in the range. For an exception sample
whose IP identifies a faulting or interrupted instruction, this
incorrectly includes an instruction that did not execute.

Use the decoder-supplied insn_len to calculate the exclusive end
address. This preserves zero-length exception entries, includes executed
syscall instructions and also uses the decoded size for Thumb
instructions.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 5a7daf927bea..7cf0af5d2780 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -315,11 +315,12 @@ class TraceDisasm:
         #     [ sample_prev::addr .. sample_next::ip ]
         #
         # sample_prev::addr is stored into cpu_data and read back as
-        # 'start_addr' when the new packet arrives, and sample_next::ip + 4 is
-        # used for 'stop_addr' so objdump includes the branch instruction at
-        # sample_next::ip.
+        # 'start_addr' when the new packet arrives. Add sample_next::insn_len
+        # to sample_next::ip so objdump includes the last executed instruction.
+        # The decoder supplies a zero length for an unexecuted instruction at
+        # an exception entry, excluding it from the range.
         start_addr = self.cpu_data[str(cpu) + 'addr']
-        stop_addr  = ip + 4
+        stop_addr = ip + sample.insn_len
 
         # Record for previous sample packet
         self.cpu_data[str(cpu) + 'addr'] = addr

-- 
2.43.0

