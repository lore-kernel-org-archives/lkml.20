Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8A3A785A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779996; cv=none; b=T6rUmZIq5MHIQn2XGure8fX2oxwsON8DURF+hgpP0Au0aQ69oSBIGolOhS52p0e2Yle/L+sGwT53SuuLs3yScpF/FUoGVRxzXMiAvOtoEyqQIEsCyV/txEqyihbqN41mHEPulGpiOGnvgVIRqOXuJ7wWTfCmELPa7vH/fJGnQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779996; c=relaxed/simple;
	bh=dsaCIkuhvZqCjTZVeCEPOV45bBjnIf2n5TfEJj18Yb0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Djp0Vp/6kEB5PbZAuHoElvkRljefB2gJOP+eH8HTLVQIlzk3ayTgy/9SWf0E8F8vBaxcMqelCk9BDZd2fIF+Yv2x0f6kZGx19zKh6ZUtgVnstSRTz9IhqVK5kwC5lOkNqQAZUYZgdyb+c9utwxwE/69KiXNnc47bb9XW1zGTllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ixan4xUQ; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ixan4xUQ"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so2978512a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787779994; x=1788384794; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l1eygQedJKM5ekEKsn/E9bXYihX3nGywRp8RfIbS/YY=;
        b=Ixan4xUQea9JGSo9sfaaaA5G2Afb1fK8nv24uSr3maw5mEo6dbYrGj2QiLVFRcmtKj
         kr1oA0MR+nnSx7+KpfUacFC6GNd8u4aoNOTZSReu2AR3ExvkdeRru2szuYnzO01iQOJE
         3NkOstxS+tJ3wSv2zoWqSzyVkpdSCQ9c/qCiKU2JsiLQKLSsjS7orfxB5yqIfIKUK20d
         It8qSa31O4TotRd+CA5SMr82oTyGWKEngZjf/z7Y26ID/Ej+mvs3Pp0G7YyMApJMgWEv
         GHOSNoN3cNWP7oqBbyOl1gA03IgrIqHU5JOfXNUYmHYLDNIJ/lumpUPZoVHf1V6SLKG0
         oIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779994; x=1788384794;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1eygQedJKM5ekEKsn/E9bXYihX3nGywRp8RfIbS/YY=;
        b=GGDYdq3COQNBYFlsHokdzZ8KZeaALEFqG8qi5BjiY5hyVoWeb5FpHa5NnFtU1h7YPQ
         xjugEUZUp9p8fqL3dMMpfRU3QlSIpI/HKOS/Wqmq2mVNywr3IXZJcw1UZ4Fr39WZUEZw
         VvurIjqMX8YS7o3kuBozt7aX3qIMAkzc7UATcHrqLTc3Qfq1un7eMR+/2kxY4RRVC9+l
         NC2k3Vz8uXt28GuPCM8czioaeJ4yzkeLKuCu1V77vSXXHl0NTt5mtp9qMAJdpUoM5sdx
         Waaf6FEB7lnHnULzC2xZUw2slF+Nwr0oioNwEHKZo+gCeM4ITZsHjI67NuAvtBGD9aUd
         UxRw==
X-Forwarded-Encrypted: i=1; AHgh+RpNLfAx7Y9eEy6c3yo7yQg/xIIhLB7R9T2lfbD/8QrPzUUYIx5m0l13jPKffa95lhcWRYxTSyrJg2v6PH8=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ00KYK228M9Ti62mwzjTInevMo8cDFFhon+Bgy9yylTniLCVi
	WRikQ83YVJkfSqkDuoOScAmvT38xVLDEsoU9zaS/frLCoeDdhzzdccuauq/O9BC8/5eUoIJX4h1
	L1BIXSg==
X-Received: from pgbs63.prod.google.com ([2002:a63:5e42:0:b0:cbe:947d:d145])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9c86:b0:3c3:bbe6:95c7
 with SMTP id adf61e73a8af0-3cf84e4b0f8mr20727681637.17.1787779994090; Wed, 26
 Aug 2026 14:33:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:32:48 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-9-seanjc@google.com>
Subject: [PATCH v10 08/21] KVM: x86: Move "no master clock" fallback from
 __get_kvmclock() to get_kvmclock()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

Move the fallback logic for getting the current kvmclock when not in master
clock mode out of __get_kvmclock() and into its sole caller, get_kvmclock().
This will allow using early-return logic in the master clock code, without
having to resort to a do-while() loop and/or gotos.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 75b689ec074d..4f98cc71a671 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1653,12 +1653,16 @@ static unsigned long get_cpu_tsc_khz(void)
 }
 
 /* Called within read_seqcount_begin/retry for kvm->pvclock_sc.  */
-static void __get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
+static bool __get_kvmclock_master_clock(struct kvm *kvm,
+					struct kvm_clock_data *data)
 {
 	struct kvm_arch *ka = &kvm->arch;
 	struct pvclock_vcpu_time_info hv_clock;
 	u64 tsc_hz;
 
+	if (!ka->use_master_clock)
+		return false;
+
 	/*
 	 * Snapshot and validate the TSC frequency as kvmclock_cpu_down_prep()
 	 * zeros the per-CPU value when a CPU is going offline.
@@ -1667,8 +1671,10 @@ static void __get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 	tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
 	put_cpu();
 
-	data->flags = 0;
-	if (ka->use_master_clock && tsc_hz) {
+	if (!tsc_hz)
+		return false;
+
+	{
 #ifdef CONFIG_X86_64
 		struct timespec64 ts;
 
@@ -1686,9 +1692,9 @@ static void __get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 				   &hv_clock.tsc_shift,
 				   &hv_clock.tsc_to_system_mul);
 		data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
-	} else {
-		data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
 	}
+
+	return true;
 }
 
 static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
@@ -1697,8 +1703,11 @@ static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 	unsigned seq;
 
 	do {
+		data->flags = 0;
+
 		seq = read_seqcount_begin(&ka->pvclock_sc);
-		__get_kvmclock(kvm, data);
+		if (!__get_kvmclock_master_clock(kvm, data))
+			data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 }
 
-- 
2.55.0.887.g758fc8c411-goog

