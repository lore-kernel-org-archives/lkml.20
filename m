Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692355;
	b=h5iMmj7KnfvXV1xtTbKNz7Z+CrZ/7XgqrSGszyInFDdcGhF36QFu21JqADrVLnHYbkSS
	 tKvg5YNR6mAPk2WZIH2IRI3E8gAH4b8hE+nufGkXuwdnvYbtvFj8KI4Z3h2pBy5cXBqjq
	 o5h1T8KoQJyysN1Y2BifYnNJ4DoSSF6AecQQLrDC5le/RBPKUaggjoRz/uBLtVVDqAJWN
	 BwZ/0O59qkjvXBsPNur0P8/dH81j/U/zN1o5V96HQvU6jgSNBND6wEuZKSi+7v9xBsZQx
	 TJ7d41JAs82dBbv/H/X4LDpNTX7MiANSzMbVYgxUgCVXfUDRCXs7hF6E0SPY/4KqJUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1zSXtHvPpLsfUt5yAbkPli0w54wQnxBQcvrvtnILKFE=;
	b=MiYfH2IE5hO9J15ccYs4ePjoInxCazdNJSMm7zELC0ldv5OOrvU6Wys1UgCe2xE8BJze
	 P4yEChK2Ius3ru79zEkSQ1Ia0awxPy5gTpwVehHJczyNVSjov/itzZj7uLUPmvMdRRok7
	 F9d1ddRQZ2tabjP8nduhksR68VPOmmifPqwANQCYhp/3lZJCk0UrMC/JG1YD62z9glj7M
	 wb2FKPg80NV+si12jidis0GxCSp9W7E3/MBtnSeSCMqiIszn0v21on7U2EaYGRy+dqM14
	 Ck5vFzbtyOmfvjpYQqKgIY2X5IA+Nz7NlLzdHDskrwVrRdQzMurpQqxkmd93mcd5z7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXMiaecm;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F765606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F765606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXMiaecm
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so93318a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792692354; x=1793297154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zSXtHvPpLsfUt5yAbkPli0w54wQnxBQcvrvtnILKFE=;
        b=gXMiaecmWs+UySZpVS0T/CtxT4fNYCxtTMWgas0Qjjg9B6oP+tRZsDAQc+8V9H+Uq/
         o5PRknHa3WLZ+JHJiEfKR8urT/+zGbRihNL0cVHJM1LuggK2C8ZFYz1R0VdtR5fWDzAe
         3RkGbhN+jlMTBK0gzId5Imc86K6tP2gUGHxsw1B6aeJFy2M+asuWmf4q3Yp+8hLWtSCK
         QBS/qzBi+3VPWOYz0IT48I0tq8RqQYf6/rG6YzTURG3b2ZmE7GDiO+FIhJibxPnmPYmV
         ZZQhMV+MUqGd3eyg68brQfwjDeh/7I4mB+UY23Cd3uvgxU4GwgVa7NDTKoYgOgAWQZYK
         A3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692354; x=1793297154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zSXtHvPpLsfUt5yAbkPli0w54wQnxBQcvrvtnILKFE=;
        b=fktUsTqK5WkMZObwyMaSzjBzHOjgXaMXOMpAnkMg0hV8Ih9JedoqAHkuD8RYJ3jlc7
         e8RRJphNrM3OlsAdnGCbSYTpPKwnIdcIAqR5V3RzrKBV1KxP8uwjsjg4Ldh4FuRHnX+g
         600QuciHeQ5vjClqozjKmlFQYUZTHGMNLeHh6mOdIq3XxkSPzeckvnzu6k9RiV96ubte
         blGL8nTyEAmDiXmkiuu1VOO9BAHXX0Zvs0RNS6+bAjjEdgWBmU/v14FPBqlPkY0wdBdZ
         VC1mZsiMm1zwMtV82CEFCDiqInkrcac8UVUn2cjAlT597LoLEqr5TnK9tqf5M701da1N
         ALzw==
X-Forwarded-Encrypted: i=1; AKwUvBxvj4z3lnzG9X6VclRaG2cR4d1Sko2DC0bTwoSNIk1gUn2i8HsK3Skn9M7bFRYSFgtdgKSNiQXk3TsuGRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdetWPPkZzDjPVC7XbHdFRjmBJlnT9X7c2zhpOUSMor/6/fvdW
	d2Nc2lqzQ28LxHLs6BTyDAonOlFYSTWIvDPA1pJIVA5rVTNqwlFz78rkDSdr
X-Gm-Gg: AYBFou2Ix2wx5YtGWtWk4pFbR8RGNG3GRTWx+WKWMSwkbgIJM765mBrAbaZsGJlpgFq
	p3ZQCD7EmAZbypyhEngeE3MXdrx8L+lXbPoTL7jdp8DdiW6W6B91BIar/LE5xiPXtIl19DPeGnG
	Uk+I4UhapGWqJBybUNZ9MggfhEYXLrnSoI+XriGrpo0AWXfpCz8lR9GnMwdEV5JSCocoNgPaAxg
	CkwUML1dImMGit+KQCU9MrFEa+wrJpSXwO1bbMtUlZJEv457s+z5lUEC12J09dQ3ZZYVRGdz645
	74A0tbYVuy+PzMMtItosjK6GUJi0Bv/jndw+Aeu84THD+ucZpc2hvibR3JEhaS29V+ypxsG68La
	AZ18obv5+qLUVR7zx+Xfx3QGmUu7QEv2PFSdezfMxrm/2m62M/Cvjob+TRR2JYh7DhZKg+6Bujs
	eTt5bX51X4tqdNeOe0IGyiE4gCS4K97U3Vm7OyrED9yMU7sfdHw2DjILvz9bNAYP5jfm8uIvbaM
	fQHjfi6qdeQExKrM4rw/6XvXiVLlVpDMcwtOTd8mFJ/77EWaJZG/KjBRiB88hazGyeIbowmdISL
	ubCxm5nQSu9J/LLp4p6+UAacpIOcuYEZU55+BzM=
X-Received: by 2002:a17:90b:50cb:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3ad86f650acmr5217438a91.52.1792692353889;
        Thu, 22 Oct 2026 11:05:53 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adc961bb13sm136044a91.3.2026.10.22.11.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:05:53 -0700 (PDT)
From: "JongHyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tracing: Reject a filter expression that ends on a dangling operator
Date: Fri, 23 Oct 2026 03:05:49 +0900
Message-ID: <20261022180549.3260375-1-malhyuk97@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

predicate_parse() seeds every program entry with prog[N].target = N-1, so
prog[0].target starts at -1. That -1 is meant to be replaced before the
second pass runs, either by update_preds() when a pending PROCESS_AND or
PROCESS_OR is retired, or by the prog[N-1].target = N assignment that
fixes up the last entry.

A filter string that ends on an operator reaches the second pass with
neither having happened. The pending PROCESS_OR of "a || b &&" is only
retired after the "*next == '&'" early break, so update_preds() is never
called for it, and the trailing operator is not itself an error: the
inner loop breaks, the outer loop sees the NUL and falls through to out.
With N == 2 the prog[N-1] assignment repairs index 1, and prog[0].target
is still -1 when the second pass dereferences prog[target].

Reproducing it needs no tracefs mount and no privilege, because the
filter can be set through PERF_EVENT_IOC_SET_FILTER on a tracepoint
event, and neither ftrace_profile_set_filter() nor create_filter()
checks any capability. An ordinary user can open such an event at the
default perf_event_paranoid of 2 as long as exclude_kernel is set:

	struct perf_event_attr a = {
		.type = PERF_TYPE_TRACEPOINT, .size = sizeof(a),
		.config = <id of any syscalls:sys_enter_*>,
		.disabled = 1, .exclude_kernel = 1, .exclude_hv = 1,
	};
	int fd = perf_event_open(&a, 0, -1, -1, 0);
	ioctl(fd, PERF_EVENT_IOC_SET_FILTER,
	      "common_pid==1||common_pid==1&&");

On v6.12.112 built with KASAN this gives, within a few seconds of boot,
from uid 1000:

  BUG: KASAN: slab-out-of-bounds in process_preds+0x151e/0x1b60
  Read of size 4 at addr ffff888102657c74 by task poc/123
  CPU: 0 UID: 1000 PID: 123 Comm: poc Not tainted 6.12.112 #1
  Call Trace:
   process_preds+0x151e/0x1b60
   create_filter+0x113/0x1e0
   ftrace_profile_set_filter+0x10c/0x6b0
   _perf_ioctl+0x992/0x1830
   perf_ioctl+0x60/0x90
   __x64_sys_ioctl+0x134/0x1a0

Four boots, four reports, 2.7 s to 11.4 s after boot.

A dangling operator always leaves its PROCESS_AND or PROCESS_OR bit set
on the operator stack, so testing for that at out covers every form of
the expression, including the ones where the unresolved entry is not
index 0, such as "a && b || c &&".

Note that this changes the result for three shapes that are accepted
today without reading out of bounds, because the entry they leave
unresolved happens to be repaired by the prog[N-1] assignment: "a ||",
"a &&" and "a && b ||" now return -EINVAL with "Meaningless filter
expression" instead of installing a filter. They have no right-hand side
to evaluate, so rejecting them uniformly seemed better than resolving
the pending operator at out and giving a trailing operator a meaning.

I verified this by building the same config with and without the patch
and running both under KASAN. The trigger above goes from a KASAN report
to -EINVAL and the whole boot produces no report; "a && b || c &&",
"a ||" and "a &&" also become -EINVAL; and seven well formed filters
including parenthesised and negated ones are accepted unchanged on both.

Fixes: 80765597bc58 ("tracing: Rewrite filter logic to be simpler and faster")
Cc: stable@vger.kernel.org
Signed-off-by: JongHyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 kernel/trace/trace_events_filter.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 1111111..2222222 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -602,6 +602,13 @@ predicate_parse(const char *str, int nr_parens, int nr_preds,
 		goto out_free;
 	}
 
+	if (*top & (PROCESS_AND | PROCESS_OR)) {
+		/* Expression ended on an operator with no right-hand side */
+		ret = -EINVAL;
+		parse_error(pe, FILT_ERR_INVALID_FILTER, ptr - str);
+		goto out_free;
+	}
+
 	if (!N) {
 		/* No program? */
 		ret = -EINVAL;
-- 
2.43.0

