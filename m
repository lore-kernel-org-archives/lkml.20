Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939438;
	b=ZJNvcWci+jk5mDV8rbRtw9xIHaWmUGZz1viuqefggKcCFx9UfCrcHC9EfJMlOTF1iuzE
	 shGE0XH+NgdCr/RCF8ZBDCQp1q99LhUaZzWKGOZhGLWWswHxYDDxKoBU828J4Vejziwdo
	 Kg8yEwELTcEk6oQ2B2LPd9ynauK2UgSE+9S+oYesqLqyvVuNaQgdbJ6oqov7hcEp6PK2h
	 VHX1EEgAma0LCZG7nEfQdZe3Jutbob9HY8olYcT/M6sdnUK19hFLI6cGB0kqvvKkqbMRg
	 rRXruOryjS8w1A2+3s+g60ZKR+6Zq3PkWP2dxxjlgFcMt8fPCE2RCNu5dnP7grcboSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XGYG7c9MHyxS3+9OQ0z3RVY887WKgAZ1PDczO1+20nI=;
	b=MlSUsUkUFxFUTt8LruOjufCSNLzL9sjVsgPX4L28N5p+ArExucn9iNkYcgFTmX97zjgL
	 tlXkVBlJ/2nzmVllSu8+g0lnyc0DG/4n+YfTwxTLNBIFM6UbUvJ8wLHlvZggqXwme4kdt
	 71RAORr1skDh7kBNsu9HyhnR/os8gLk2TDnJTwTYHT8AvkXAN4O+jMg56Xbc4gcyBh8hr
	 ADz/hprYZkt4turJiccxWwqdrd1hZ4+awt94m3ASsEOe8KOfDJ+mv1IhbFUb9c9KkyT3k
	 EI1IqRN9uZIKuoqXkl1TbPoyPHmsCeWPgxOhCjkiaFbTiEruGzwuZSrzmRJ0Ov9STpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6rxnWm0;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4330C606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4330C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6rxnWm0
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b309147589so1555287b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939437; x=1794544237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGYG7c9MHyxS3+9OQ0z3RVY887WKgAZ1PDczO1+20nI=;
        b=c6rxnWm0BbsoBTUfQgHjYx9JIzRvbQUyr7MWRmUFhTbYgpt09Lt9CoQO7eVOjEIx6U
         xUgB4N7GDhEnPt6MLtitBxagIeT4e+Gp0eJLDYtx35Rx+BvaiALRBhjVCqnbhQZHFJ5o
         0of1l8hZCHhlxu/V2/+J4tvob6QTlK4LeOe2FJQADc3g8j4pZpIAgAxDZdfit06bUx+e
         vnNYsmkysizEOv8KrsFTx6SSD9L/NB/M4gELfB3t/nzkZlmmfAU0lJ9Cl+5IrFNbmNxx
         2yvpK/w8A4fOgHa7HcXyHh3um7YvoG0Cx2MQbikXEnVkHNl9mcyMdamkRPDQbheFYFgI
         HqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939437; x=1794544237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGYG7c9MHyxS3+9OQ0z3RVY887WKgAZ1PDczO1+20nI=;
        b=B9g8d3bRcgQVuWvgn5hlE2AOqw69fDctv0lLOTi4gulbmb10U57R32ZgR56poxMKs9
         Pi0bUOmSDqLb6NR1uAISt+f/wMn+bx5ucG3UpeONRRW/FuermkbG6senC5V1b+emA4Xd
         kkmOTq3MnR2mg4IyVWbqShI8yIBb1S5mmDT/lSRlMN/hqRIP5aPas1fjfWk9+BvWrVVX
         x8Xk+6gCmOU/lJO/fughgsLNALCaeoXMi6scNEWjhkw1q0jutnKIgxEPk7wZFo+L0pXS
         9UeyoeU0Wo7sOk+sJ0b/EWL9n7FyqeMTmY+ZDjtGcy2o1bttt5IDbQ1Dpq7SMH5UDVkm
         RSIA==
X-Forwarded-Encrypted: i=1; AL+hErFzsxYrNtzNsmciov2pjLEsaisup93AQ1myYVqiHXVP5Jb9j3iug09zNNnR+gAfUfkBheFbPOE1qSurEaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y9CeaoFzBrxoNp5lGOuF8OZHkP4s6b8TIQH7f2DRnyqsyZbBK
	hqJhCUZDGeNULdOLiOBDKLGXsBXah7mZkT9Et2iLDgzrECvGfYHVkG5O
X-Gm-Gg: AYBFou2SqP5PT4Kc3nw7d/pp0ImHH8qDHc0KHPSgx3Zz9Ku9Fua+VVmZ+lAXRv+Ot8M
	llAs6/nIPi3mGuxEnQ6hpPopmO+FcbX2ir4mvqbjsUMHxycvHIc4alb9uoQJj0zbtP5GaiImVpF
	0nXmnxN5NN/HouLvOEW8J050spKBobe0fxxAGz/6IGY0n/0IKXVKfGZM1RBdwQCiDHEAv8RKf7H
	tI+1CRpyOyQaZz8Ls9WvlAFO/bnKee+nCHxnc6u4OcYQO4GywS0OFVpT0WHhaJ0nuEoIUAVnK41
	DWe8JD99WhhnMoAyKglzcS0Vqppgb7Gb/0tzBQSHmB2KH6EwBsG04DelWUacM+vESIlcZMZAbjX
	G/ieYW2O16cmz4VSpYoshXtfFdIynt4P1EGA+Iql2fjE7HPpqNo1ONWPE5+gjSBnGLcnt5HYKxf
	sSejos3wT050RyjAOeIQPu+N0JTJ28/qMAtrtpzZBgJnadyqs+jbdIBpMKEXK8DkXcl1JYebeHJ
	zFYFOoGQWyo4JXcGeIFIP3ZMINWYg59j0AW7Dv5DtNg76ZUh7EAGiJ6HvbkTxCuw2XSug5l24Nr
	5Cs3t1o3gAieHB2kwYwESX37AFQBSOMhOBXhDO9oO2Y6YjMbugQYPCpECF0rGtOZJHqsKdehxpm
	teLOikPvnVTw=
X-Received: by 2002:a05:690c:c22e:b0:81f:e7c5:f420 with SMTP id 00721157ae682-8b341911881mr7701877b3.20.1793939437088;
        Thu, 05 Nov 2026 20:30:37 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f76dba8sm11299177b3.13.2026.11.05.20.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:36 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:25 -0500
Subject: [PATCH v7 06/14] alpha/perf: ignore overflow interrupts the
 counter does not account for
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
Message-Id: <20261105-alpha-profileme-v7-6-c474e892abb0@gmail.com>
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6192; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=bXj+D+xqa4BexOg8ubCD6eSKsK78iA1471U5iAwEt2U=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht+9FmPUZtT20MF13Srr3vvrc7bNVM8xNdx1cbHle
 +X8c1o/Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaNnGG/wWupcs3yp
 pte8Qa9u7mOqFtM1n67FJXR9XwyUv1BVlbnGFkmLtk7+3I+uYPfAq2xga/LdduZp+VJzbt8Xrjh
 byNm5avZwMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The interrupt handler adds a full counter period to the count of the
event on the counter that interrupted, which goes wrong in two cases.

Rewriting a counter does not cancel its pending interrupt: wrperfmon has
no way to, and PALcode clears the request only when delivering it. An
interrupt pending when an event is reloaded, or when perf moves another
event onto the counter, is then taken as an overflow of a counter that
has not overflowed. It adds a bogus period to the count and can emit a
false sample.

And alpha_perf_event_update() already adds the period when a read finds
that the counter overflowed before its interrupt was taken. The
interrupt then adds it again.

An overflow leaves the counter just past zero, below the value it was
written with, while a counter that has not overflowed is at or above it.
Ignore an interrupt for a counter in the latter state, unless a read
has already counted the overflow, in which case add nothing. For this to
hold, write the counters at most half their range below overflow, as
armpmu_event_set_period() does. Counting events then take an interrupt
every 2^19 events rather than every 2^20.

Fixes: 979f867191f8 ("alpha: implement HW performance events on the EV67 and later CPUs")
Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 59 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 13108510d16e..a98be9b8b369 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -30,6 +30,9 @@
 #define MAX_HWEVENTS 3
 #define PMC_NO_INDEX -1
 
+/* hw_perf_event.flags */
+#define ALPHA_PERF_FLAG_WRAPPED		0x1
+
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
 	int			enabled;
@@ -315,10 +318,16 @@ static int alpha_perf_event_set_period(struct perf_event *event,
 	if (unlikely(left < alpha_pmu->pmc_left[idx]))
 		left = alpha_pmu->pmc_left[idx];
 
-	if (left > (long)alpha_pmu->pmc_max_period[idx])
-		left = alpha_pmu->pmc_max_period[idx];
+	/*
+	 * Start at most half the counter's range below overflow, so that the
+	 * value an overflow leaves, just past zero, is always below the value
+	 * written. See alpha_perf_event_ovf().
+	 */
+	if (left > (long)(alpha_pmu->pmc_max_period[idx] >> 1))
+		left = alpha_pmu->pmc_max_period[idx] >> 1;
 
 	local64_set(&hwc->prev_count, (unsigned long)(-left));
+	hwc->flags &= ~ALPHA_PERF_FLAG_WRAPPED;
 
 	alpha_write_pmc(idx, (unsigned long)(-left));
 
@@ -338,9 +347,9 @@ static int alpha_perf_event_set_period(struct perf_event *event,
  * zero.  The value passed via ovf by the interrupt handler corrects for
  * overflow.
  *
- * This can be racey on rare occasions -- a call to this routine can occur
- * with an overflowed counter just before the PMI service routine is called.
- * The check for delta negative hopefully always rectifies this situation.
+ * A call to this routine can occur with an overflowed counter just before
+ * the PMI service routine is called. A negative delta detects this, as the
+ * counter is always written at most half its range below overflow.
  */
 static unsigned long alpha_perf_event_update(struct perf_event *event,
 					struct hw_perf_event *hwc, int idx, long ovf)
@@ -359,10 +368,12 @@ static unsigned long alpha_perf_event_update(struct perf_event *event,
 	delta = (new_raw_count - (prev_raw_count & alpha_pmu->pmc_count_mask[idx])) + ovf;
 
 	/* It is possible on very rare occasions that the PMC has overflowed
-	 * but the interrupt is yet to come.  Detect and fix this situation.
+	 * but the interrupt is yet to come.  Detect and fix this situation,
+	 * and tell the interrupt not to count the overflow again.
 	 */
 	if (unlikely(delta < 0)) {
 		delta += alpha_pmu->pmc_max_period[idx] + 1;
+		hwc->flags |= ALPHA_PERF_FLAG_WRAPPED;
 	}
 
 	local64_add(delta, &event->count);
@@ -841,6 +852,32 @@ void perf_event_print_debug(void)
 }
 
 
+/*
+ * Return the overflow that an interrupt from counter idx adds to the count,
+ * or -1 if the counter has not overflowed since it was written.
+ *
+ * Rewriting a counter does not cancel its pending interrupt: wrperfmon has
+ * no way to, and PALcode clears the request only when delivering it. So an
+ * interrupt can arrive after the counter was reloaded or given to another
+ * event. The counter is then at or above the value written, whereas an
+ * overflow leaves it just past zero, below that value.
+ */
+static long alpha_perf_event_ovf(struct hw_perf_event *hwc, int idx)
+{
+	unsigned long prev;
+
+	/* alpha_perf_event_update() has already counted this overflow. */
+	if (hwc->flags & ALPHA_PERF_FLAG_WRAPPED)
+		return 0;
+
+	prev = local64_read(&hwc->prev_count) & alpha_pmu->pmc_count_mask[idx];
+	if (alpha_read_pmc(idx) >= prev)
+		return -1;
+
+	return alpha_pmu->pmc_max_period[idx] + 1;
+}
+
+
 /*
  * Performance Monitoring Interrupt Service Routine called when a PMC
  * overflows.  The PMC that overflowed is passed in la_ptr.
@@ -853,6 +890,7 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 	struct perf_event *event;
 	struct hw_perf_event *hwc;
 	int idx, j;
+	long ovf;
 
 	__this_cpu_inc(irq_pmi_count);
 	cpuc = this_cpu_ptr(&cpu_hw_events);
@@ -897,7 +935,14 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 	}
 
 	hwc = &event->hw;
-	alpha_perf_event_update(event, hwc, idx, alpha_pmu->pmc_max_period[idx]+1);
+	ovf = alpha_perf_event_ovf(hwc, idx);
+	if (ovf < 0) {
+		/* The interrupt was pending when the counter was written. */
+		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
+		return;
+	}
+
+	alpha_perf_event_update(event, hwc, idx, ovf);
 	perf_sample_data_init(&data, 0, hwc->last_period);
 
 	if (alpha_perf_event_set_period(event, hwc, idx))

-- 
2.55.0

