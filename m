Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4EA48B38F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780011; cv=none; b=cdZvx8aScGTRVWe/EBS4YT46015LJKymculLHmLzEq4V/98rnZANNjSzw/bn2CKEo2lKNOZvfVj/Ugb0CVrULvlm3rFwfoyhGJIYL0xZVEEkKhM3d1U+txWN4b2vUDevT8Dyt5gilYhIWi56Zgt4x7EJ5jPlKXh6zgbA3Y8f+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780011; c=relaxed/simple;
	bh=x9kqdAvWcySW/UFriv/XVSVV3wGHtlM1R1TTiEGvaKc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Md//l8V3Wnza6WTvtyFKbNVrxcUM+Yq4pEaD3/TrY3n0seAlaeOorA9l3W6GSqukCt3LbWV+vSbVj5816w8De78jvZFAX4LBllpjqKByYSvve7hBParUkmTUs4sqiJ/25MhXCQSJ0Lx3RetY4klYBtxs9MMb1FSiqzrFg8oJOwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a9raJv3u; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a9raJv3u"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1629842a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787780006; x=1788384806; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hxtXNEiVVHLTLVeOZPmDmbDA/5ZmZ/osRSTz6+H5aOI=;
        b=a9raJv3uywLEr3mXX36hLeUFvym8VC7a7qo212DBcpJKiXUnv6jx32p0c1hc1ErjXR
         OZzXJ8TDdLWKe5azUuDFfaqsjgIv+qykEAePUeKiwnDhubXYyVe3J6s/v5TRBzPUCJOZ
         ieqq7ynBEioOeSIZP9Mwty/0ZWpqP0KGSDHvaemZCHtHTroOd2SrmAfI9wBa6dx64xzN
         RelR/hSVsAggpgtYra1EL27ULVeQtHc7ExpmJl9+3xr5yPFcDzrW6w1zAzCXre+iSqn8
         iZ5IoMkNLt8ad19YHizBNqaDpUE9K+B7JnGMMd025LT9l5P7QvCpSTy2vGhKNq3ZDnZV
         GwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780006; x=1788384806;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hxtXNEiVVHLTLVeOZPmDmbDA/5ZmZ/osRSTz6+H5aOI=;
        b=bJ8VaH8x2TUPFyankzIgL7TxeaMswXXWgZdxbeYE7VD8F7eYL5nSuUViF13EiF0Odv
         Ju10VzRPTRgvNLZpHGyKYfAQ7o1zGhHDvt3xY8U98y1AZtS3/+euXBoro6zjp26AUiuU
         1xXTPtnD2I2OnPU7zbi2GzWX6hI0c3Z4MdI6355hBNibCnnaOlXY8eD8TgMQvmvJTPco
         eE44WXsPJSuj8U53t2ZcWuSChf1mtPEdRABYA8kZwo7q5xrQ9bRwv2zl5PaATNkmeIwL
         pqNfTerIP3l9vlNOXhJ5f71iq6eXiVC66DoQIlDGZTJQryFbGBMSGESyK8ukWc5r5H1/
         ITBw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5qTvvKTM4+i3APpJVZit/VtefmXeHS1IR07Gjr7fCbYUMSEIxsKmqmAB20qVH1AuComO2A2s6PCTsgJE=@vger.kernel.org
X-Gm-Message-State: AFuF++nzSiCfENbgyaoXrPxWl+HMM8X1fYXoZvLhXGnucWcnAIOmHIqI
	xTlGparFxz6//bVyGNR6mJ4EI8JSdqklIbB1I0tLzzODwZOxAiVTOUO/9DMHKK5orDBAUY9C99H
	nJ9mPlw==
X-Received: from pfux28.prod.google.com ([2002:a05:6a00:bdc:b0:84a:3bc9:3bcd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f92:b0:848:2e3c:9955
 with SMTP id d2e1a72fcca58-85371fa599amr17200089b3a.4.1787780006189; Wed, 26
 Aug 2026 14:33:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:32:59 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-20-seanjc@google.com>
Subject: [PATCH v10 19/21] KVM: x86: Use kernel timekeeping snapshots for
 getting kvmclock time since boot
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

From: David Woodhouse <dwmw@amazon.co.uk>

Replace the KVM-private vgettsc()+do_kvmclock_base() timekeeping
reimplementation with calls to the recently crafted, generic
ktime_get_snapshot_id() interface.  This is the first step towards dropping
KVM's homebrewed implementation entirely (do_monotonic() and do_realtime()
will be converted in the near future).

As with KVM's implementation, the snapshot provides both the system time
and the raw_cycles (TSC), atomically paired using a sequence counter.  The
equivalents to vgettsc()'s TSC and HVCLOCK modes respectively are if the
clocksource itself is TSC (cs_id == CSID_X86_TSC) and if the underlying
hardware clocksource is TSC (hw_csid == CSID_X86_TSC).  In the Hyper-V
case, i.e. hw_csid == CSID_X86_TSC, if the clocksource couldn't provide a
raw hardware counter value, treat the clock not being based on TSC, which
which is equivalent to vgettsc() returning VDSO_CLOCKMODE_NONE.

Unlike KVM's current implementation, don't include offs_boot in the
atomically-acquired tuple as there's simply no need to do so: the time
since boot only changes at boot (duh) and at suspend/resume boundaries.
Unless processes aren't being frozen/thawed before/after suspend/resume,
which would completely break suspend/resume, TK_OFFS_BOOT can't change
while kvm_get_time_and_clockread() is running.  And if KVM does somehow try
to take a snapshot during suspend, timekeeping core will WARN and refuse to
provide the snapshot.

This is a step towards eliminating the pvclock_gtod_data private copy
of timekeeping state and the associated notifier callback.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[sean: separate from other conversions, massage changelog accordingly]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 57 ++++++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 51a8250e758b..32390b20a2b4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -35,6 +35,7 @@
 #include "smm.h"
 
 #include <linux/clocksource.h>
+#include <linux/timekeeping.h>
 #include <linux/interrupt.h>
 #include <linux/kvm.h>
 #include <linux/fs.h>
@@ -1437,29 +1438,6 @@ static inline u64 vgettsc(struct pvclock_clock *clock, u64 *tsc_timestamp,
 	return v * clock->mult;
 }
 
-/*
- * As with get_kvmclock_base_ns(), this counts from boot time, at the
- * frequency of CLOCK_MONOTONIC_RAW (hence adding gtos->offs_boot).
- */
-static int do_kvmclock_base(s64 *t, u64 *tsc_timestamp)
-{
-	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
-	unsigned long seq;
-	int mode;
-	u64 ns;
-
-	do {
-		seq = read_seqcount_begin(&gtod->seq);
-		ns = gtod->raw_clock.base_cycles;
-		ns += vgettsc(&gtod->raw_clock, tsc_timestamp, &mode);
-		ns >>= gtod->raw_clock.shift;
-		ns += ktime_to_ns(ktime_add(gtod->raw_clock.offset, gtod->offs_boot));
-	} while (unlikely(read_seqcount_retry(&gtod->seq, seq)));
-	*t = ns;
-
-	return mode;
-}
-
 /*
  * This calculates CLOCK_MONOTONIC at the time of the TSC snapshot, with
  * no boot time offset.
@@ -1504,6 +1482,29 @@ static int do_realtime(struct timespec64 *ts, u64 *tsc_timestamp)
 	return mode;
 }
 
+static bool kvm_snapshot_has_tsc(struct system_time_snapshot *snap,
+				 u64 *tsc_timestamp)
+{
+	/*
+	 * ktime_get_snapshot_id() cannot fail for standard clock IDs
+	 * (only for invalid/aux clocks or during suspend, with a WARN).
+	 */
+	if (!snap->valid)
+		return false;
+
+	if (snap->cs_id == CSID_X86_TSC) {
+		*tsc_timestamp = snap->cycles;
+		return true;
+	}
+
+	if (snap->hw_csid == CSID_X86_TSC && snap->hw_cycles) {
+		*tsc_timestamp = snap->hw_cycles;
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * Calculates the kvmclock_base_ns (CLOCK_MONOTONIC_RAW + boot time) and
  * reports the TSC value from which it do so. Returns true if host is
@@ -1511,12 +1512,14 @@ static int do_realtime(struct timespec64 *ts, u64 *tsc_timestamp)
  */
 static bool kvm_get_time_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp)
 {
-	/* checked again under seqlock below */
-	if (!gtod_is_based_on_tsc(pvclock_gtod_data.clock.vclock_mode))
+	struct system_time_snapshot snap = {};
+
+	ktime_get_snapshot_id(CLOCK_MONOTONIC_RAW, &snap);
+	if (!kvm_snapshot_has_tsc(&snap, tsc_timestamp))
 		return false;
 
-	return gtod_is_based_on_tsc(do_kvmclock_base(kernel_ns,
-						     tsc_timestamp));
+	*kernel_ns = ktime_to_ns(ktime_mono_to_any(snap.systime, TK_OFFS_BOOT));
+	return true;
 }
 
 /*
-- 
2.55.0.887.g758fc8c411-goog

