Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F8489876
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780009; cv=none; b=IeJT9atbbCbJZAt5Kky1BhqHbudXgo+43nyqsqvbn8cCXYtOQ0PMJTMC9JwHI4QMikkSiseEcxhxxaQKgrwRhbQAVWKpwy9fTpzwTnZiqzw1+rMCuh7U77lS7NfF6LZhc6sdh8uPPTszv2G7wt2POaM9IivQWSDCQZL48S+m81E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780009; c=relaxed/simple;
	bh=J7awBibVXHg+ZynoE1GTv8WNYcoD5LqJUOY9xR1n0xE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pk40Rtvj14VHvrjHNsFFXzuj654tz5t0K0I+/DJFXXokdxPflpqTtwsjw1bUsqOvakwUwe+CbwFbRC1s490ZRu8HnWeD3s2omAv4/YVmXOkQMY67Q5BU51rNCxnYf2NnCkHcAlQgjAZeZjbzl+j/86e7T/S/QS/8XKJv+c0ziJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aVKQepFr; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aVKQepFr"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so25418a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787780008; x=1788384808; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cl9yrkZ+dGZ9BiHgGOnk9QZOqiTp6OUnu1pYLMOniSs=;
        b=aVKQepFrPva+opNOkPQuvPBDbvjbdJLW6eh2rcI4ut4ImP31ggpHnIwoh2KHO+l52W
         ZlFhaOubrS0BgjylYaU54ARLgppnxb8XFujnMp1+esngwj+EG2JaGt8lg0c4MbwJSrRs
         eHumljUyvCELUlrU3LCyAkWxqF4hEY8xC3skAuveS+U7U6qSPSAlborBsPGIMNXsKiXT
         JLxEePsZ9pCzEj+n/gC2nnwxLRC8MTDA1xhY86CmVzNIvKez/IDbifcjx24EbtlfqTaA
         iqj9qGafluVb9tVUk02jByb+OA2iQI2hzXyxlXpUMNbko46X/XlvzNKnpeCcy2lRf60k
         Vmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780008; x=1788384808;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cl9yrkZ+dGZ9BiHgGOnk9QZOqiTp6OUnu1pYLMOniSs=;
        b=Tu4t0YG/qX91U/jnGYeej1NJetVTPl+/EaCAuAi88Wl4ganZCpN85PS0lL+791nrxG
         7BlzJ7xu8t0fWum2c+TXBIPqhQadv98eiINnoU4jm+4Ms+mO49/zAtQMeK3JW/P1SNbd
         KqbLLPGFPZyUGaXwM/hzHuEtYSpIelEkpF5TZhEzK+TSYQtfBwViGwjNzYsUd828p/1G
         kR6tOWCi7vJXblXVZQn7+CO9ngxovCzC8APtSzBUC1fxEGEbp3pw9imVr8i8pDw3LmRW
         Y4cPmtMqmovEAMoTqwqCOkZ3KrGIULxc0pH7eMbCcvd5SqCaXxDdTZHCGzFhz0XxZBe5
         GqlA==
X-Forwarded-Encrypted: i=1; AHgh+RoUzhKpF3dU8I0MkA9iER0OYen4girvDe4HZeYVImCskJByht18oI9hx/3W7hcVHX8v6u+Mlj5WpfQJF3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mO51B48dsz075XIsLZbXXbbDovy3B+TalEDektn3bUOcqUHQGC
	U4Kryh38V07rMTX1grS9P57p9HopgY+3XH7jjHWOoB0o+48ZSxkOB86Np7JaOuxBUsPAfTw7oKk
	K4m46iA==
X-Received: from pgal6.prod.google.com ([2002:a63:3e06:0:b0:c9a:d174:5315])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a03:b0:3c3:9c4e:de3a
 with SMTP id adf61e73a8af0-3cf82a348a3mr22345482637.6.1787780007516; Wed, 26
 Aug 2026 14:33:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:33:00 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-21-seanjc@google.com>
Subject: [PATCH v10 20/21] KVM: x86: Use kernel timekeeping snapshot for
 monotonic clock
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

Replace the KVM-private vgettsc()+/do_monotonic() timekeeping
reimplementation with calls to the recently crafted, generic
ktime_get_snapshot_id() interface.  As noted previously, the snapshot
provides both the system time and the raw_cycles (TSC), atomically paired
using a sequence counter.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[sean: separate from other conversions]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32390b20a2b4..0352bd147c40 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1438,29 +1438,6 @@ static inline u64 vgettsc(struct pvclock_clock *clock, u64 *tsc_timestamp,
 	return v * clock->mult;
 }
 
-/*
- * This calculates CLOCK_MONOTONIC at the time of the TSC snapshot, with
- * no boot time offset.
- */
-static int do_monotonic(s64 *t, u64 *tsc_timestamp)
-{
-	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
-	unsigned long seq;
-	int mode;
-	u64 ns;
-
-	do {
-		seq = read_seqcount_begin(&gtod->seq);
-		ns = gtod->clock.base_cycles;
-		ns += vgettsc(&gtod->clock, tsc_timestamp, &mode);
-		ns >>= gtod->clock.shift;
-		ns += ktime_to_ns(gtod->clock.offset);
-	} while (unlikely(read_seqcount_retry(&gtod->seq, seq)));
-	*t = ns;
-
-	return mode;
-}
-
 static int do_realtime(struct timespec64 *ts, u64 *tsc_timestamp)
 {
 	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
@@ -1528,12 +1505,14 @@ static bool kvm_get_time_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp)
  */
 bool kvm_get_monotonic_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp)
 {
-	/* checked again under seqlock below */
-	if (!gtod_is_based_on_tsc(pvclock_gtod_data.clock.vclock_mode))
+	struct system_time_snapshot snap = {};
+
+	ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
+	if (!kvm_snapshot_has_tsc(&snap, tsc_timestamp))
 		return false;
 
-	return gtod_is_based_on_tsc(do_monotonic(kernel_ns,
-						 tsc_timestamp));
+	*kernel_ns = ktime_to_ns(snap.systime);
+	return true;
 }
 
 /*
-- 
2.55.0.887.g758fc8c411-goog

