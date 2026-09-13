Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5D62E06E4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331498; cv=none; b=UPjOHiUdOPgANHyQ4COHQdgLZq/hwA7velbS8FVUpgzmRdhq7LMfzZZCkihMI1rALBnxmHAyJUCrGxYG09PRFYpHcm7cjpkO75VtmB1Cqz/iJq7F5GTKnAyl3OJ4Rtqwf02U3JDVOF0zbKD9nEqUMLKFV+7KGtWsnpKhqMyq2mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331498; c=relaxed/simple;
	bh=yDn7QK/ba+3RLVHPMTBb8o7wMnI8vkCF4rNDGAc/jgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNF1CajSCuG6LWlojRt+wV/gMECKK6ez/5GcJTlBbuiiekBibGzuD2v+Y2cqXUL3xe1Rqv8IF+YJUU82xtvXHu2Ivx4tgg4YoWOlyZgYVBgl3bSCYIwFKHi32fTVXlVKEj5ocVKIeDDSW+aCvi/NvPF8epW1RwnklOMTLx07R2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dg1MKUOP; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg1MKUOP"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2536989a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331497; x=1789936297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LszAmsFoGsrZf03eXVx9RZkN93lj99VFwvSyBMy7+c=;
        b=dg1MKUOPm/Jf/HEBRknTTsIHbkbEzm8H3MerCbHX9gG88ZTZ4d5Bp0y1/SAyGnUYzJ
         sdnIHukSRgxQSoqHcRLpN7dV9+AmKFIaXk/D3dEPVTDWfuQTFHQqK+XhPvDA4zv41SAL
         yMqlr44N7s99jWBrv7+5Gv7t8qz8BaebtCutfZex5BDWpT60EbibbfpYW3+hqsAxY6SQ
         iJmxvqBcTEsGicSREc1L5mL1yIm+FJYviyod36tyrSy3Yiuy+Tt0dU3QirCFQAhrEaFL
         8tqCC1f/gCQmUEzRBV/ZC7wd6C3HgZJMwda0PmRtD4uDMXp/kLbDEchaE+sRaU0WFE/o
         4VFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331497; x=1789936297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LszAmsFoGsrZf03eXVx9RZkN93lj99VFwvSyBMy7+c=;
        b=c7UQKqROZkfX8ThtdfdPBCaKkM6+fxWwnQxK3w0yV3v0Wwg2nWHdvZhkNMrDw2BhXe
         32cCPYhZyPFNmiwD2Ib2qRsZE/LBRpGMFjCNdp8qEUpn8EsFbrwbAWVYZgrkVn5Ax/Qa
         19QJW2WYh3pdGw3O5apgsimNlavqOjuaH5PNIE6j6AineyhjotplB6XwjBzIw1oQnKt9
         GyPcjnH+NXNFG7nEYgb0qyFeYehllR69bIM6f3cGyFz5UgPXwIBvqqA6tQA8DjoNqKCb
         Dp3vREU6SdLFYpfuPF8dN8g+vp/58R7+/u1PLl+6XAvsuZnTI2SRrhmlu7k+0uGqMzc/
         y63w==
X-Forwarded-Encrypted: i=1; AKwUvBzAlJxgM/xFIJWimNCl777Fs5zHNVWa5XF6TUJraRwRYlYsbqSGWjv61UawWe8ZzSr+pkMW87eHdt3mSXA=@vger.kernel.org
X-Gm-Message-State: AFuF++lDmsZqMv5qYU/eus1aJsZA462w1UeADKyMn74NdNFB7MEzO9J9
	N67CHb/upyVgooHS0sp7uIug84REF4VrHwMDkmTLBqp1jONB9mvszf0=
X-Gm-Gg: AYBFou3oFW998+uchtd/DfnEfoiG8JaOQUafP6Zo6x6HzFo7cCFCku5lzkyIlmkgrxU
	9NA6kDK6ZReF0ii622gnjU9TKxMl+Xv5Y0Qe8/HcYOWK5wFKMN4Sz4/T4C5tmvArs8tOgP5T5Kc
	oiyZW4JEWHBzGGe+qiqlXjkByXhvZSa4X9C3602y5rSaLHMWu5W+Q19qYDrIAq3AeHaQBnntiAz
	K83ehAU+Nm1xEd0puaHzSv3B+Iu9xkJAAga+o6f/B/DIVbSw/X6u2b9zuzA+ZgqBSGe1JZmdZ26
	H5+EvTrk12CaSLkvhfbwVHqwfZVN3fcQ3c9jYnDb7tyFZxgamsA/tgj/6CvWi/OZZ6XxCiwxRcv
	bUZbB9XBoGIXd2jD4HVxx9LxN8e8G2EZxL3NKskQvkyiOeDDnEhjWASeqNVZu1yEJcA4RDCqcuf
	8UUXJsg9Lk7B2vIByKCXWzBUW0fDuPrlIvrA+WIsM8tQc5YNwrIqLvvN9qyx1dSKtmj730f78Yv
	Ll1/0A1b6IqaT+xARgt13k2+2cL9I4g0uAl
X-Received: by 2002:a17:90b:51c8:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39d9bbc802bmr24389520a91.3.1789331496799;
        Sun, 13 Sep 2026 13:31:36 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b91:ff81:c860:362e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm17530220a91.0.2026.09.13.13.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:31:36 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH v2 0/2] tracing: Fix NULL dereference when copying keys for a field variable
Date: Mon, 14 Sep 2026 05:31:27 +0900
Message-ID: <20260913203129.941270-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A hist trigger with an onmatch() action copies the key list of the
compatible histogram it finds on the matched event.  Reading each key's
name straight out of key_field->field->name faults on any pseudo-field
key.  2/2 renders the key with expr_field_str() instead; 1/2 teaches that
renderer to emit a bucket count, which 2/2 needs before it can use it.

Link: https://lore.kernel.org/linux-trace-kernel/20260912094722.3271147-1-donggeunyoo.kernel@gmail.com/

Changes since v1:
 - Split the single patch in two.
 - Dropped the third change, which gated the ".stacktrace" arm of
   get_hist_field_flags() on hist_field->field.  It fixes nothing:
   hist_field_print() excludes FL_STACKTRACE before it ever calls
   get_hist_field_flags(), and parse_field() takes the "stacktrace"
   modifier on any field.  Measured with and without it: identical
   generated command on all nine key kinds below.
 - 1/2 is not separable from 2/2.  .buckets is refused on a value, so no
   expression can reach expr_field_str() with a bucketed field, and 2/2
   alone turns a working .buckets key into a refused one.  In this order
   no bisection point regresses.

The command create_field_var_hist() generates, for each kind of key the
copied histogram can carry:

  WK key                  unpatched   patched
  pid                     keys=pid    keys=pid
  pid.log2                keys=pid    keys=pid.log2
  pid.buckets=10          keys=pid    keys=pid.buckets=10
  common_cpu              oops        keys=common_cpu
  common_comm             oops        keys=common_comm
  common_timestamp        oops        keys=common_timestamp
  common_timestamp.usecs  oops        keys=common_timestamp.usecs
  common_stacktrace       oops        keys=common_stacktrace.stacktrace
  hitcount                oops        keys=hitcount

x86_64 under QEMU, CONFIG_KASAN=y, 4 CPUs, base 2f0c1cf72f46.  A compatible
histogram on sched_waking keyed on WK, an onmatch() target on sched_switch
keyed on SK, my_synth($wakeup_lat,prio) forcing a field variable.

Donggeun Yoo (2):
  tracing: Add the bucket size to expr_field_str()
  tracing: Fix NULL dereference when copying keys for a field variable

 kernel/trace/trace_events_hist.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.53.0

