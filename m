Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1072E764D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779988; cv=none; b=doG2ku2ZFLj/7CmGV4KzDefmSmxWRH/oe24IrMgPvaDcGrpZ3C25PYj/5y2+lId5kSAgXqt77UPxplR46v2gAkRxryDLkZMNueH33VGgA2BkoAZJaccprJ9kWoh3XE08rRodA1KiAEMG9hY7MWmGG68xhoKgCuI5DzXNFpF17aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779988; c=relaxed/simple;
	bh=S0hjrjeSHb2kJaIjU0orALqDXIbu+1GkVZ/75jX0FMA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fh8+/oLYTG3Q+LHHi3OvB5NPtIzWe8j7Mt6P/4MPntk4Yr7SD7SF0A2Icqhfb4q98OwBEcdweB6ixhRSWlGQNScGoMsMYTBksheAxriZwp6iUMs8Cs6duuBVZWHKpLksVJuzTTMemP1b5r/3VblW7ZxBSzs0zqE+0mEsp4wYKQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=inYZDupj; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="inYZDupj"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c057f480so1416994a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787779986; x=1788384786; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HX64g1e+YNnFRPwyjdC5E39dn1LmH0dsFZuuMBpV62s=;
        b=inYZDupjGqThKNJ09IuN+TrH+CfUgKhVPvWImqTNZG2AZe5ZOak2MkTZpVCx6xUKXq
         Lcgf9y56Z0xxn3rsVsE3NQ5c/pfA77Ar1PJCGco5+RV/TDfQb3BJITllckutBcZTbo7m
         vwlIDN66/Z8QCzx1BZYUiocLyL3jptulCqRDOF2cfuDi8D9h70UxB48Yu+exoeUeJYr2
         o+Kj0lCz5egN+gAVR2xqa/CBQxfLM+VAEGzkHJLlZPTJi4mEvVmcQLtFsCYUUdWdEXCl
         WNaxgtBnN5mBephnx95kz8V+TO+s1ft8QhQnJrEQsY86deYinKUxRB8TgRkZIuH2Q1wr
         kOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779986; x=1788384786;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HX64g1e+YNnFRPwyjdC5E39dn1LmH0dsFZuuMBpV62s=;
        b=epYlNx6NNy7sd8xQqxshrKWYkegZlr0sfXT3EhWDrhFtGEja96ksCpjprpvruSOfI8
         dc33wwOVLHWNk7aJ8i8CMiozHTSWRDu5+ewkHbViOzVterpOzuKlYWD4Pa91qRfCReDU
         9anIRjY/+rABjbhIYaOBk15xCsk25lwN+1hwirycCHdSlf5s7fLZgRm2ZE48D6ZDzGoE
         VD77MYUCSbSdkorVgUGHR2Ob5XJhu9kkaVveaVDRsZ5Ucep/FSiD4P6xQ9oZu6uN4WlY
         Pk4JwpYNyOaIfe/mqoevhx24XItWh6lGdFj3NRj0MVBI8y01TVAMMPtKfaguc+jAbVxv
         kjgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqE2CcjbNWXuMyXeTUNUe0SRTTUXERPtm/lloTD0ldNuJ9vH2BglHWWYl7lMM5Ka/wTiBLOPb+cvEMveUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mG5ylurkMRAa2ASn8iJR5a5X26jx8TMefgkb9KU72OtUkJa+AR
	ZtZdQ5H6pT+fyA5Ga4y+V4T+sc1Tmbv1QthxqXhA8zIS57yn/m8C6WwQphbKlhdt8UEoK+NmiSE
	u7uaJUQ==
X-Received: from pgak6.prod.google.com ([2002:a05:6a02:6746:b0:cbe:9e80:c394])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:430b:b0:3c3:6928:8b25
 with SMTP id adf61e73a8af0-3cf84e51a6fmr16266744637.17.1787779985732; Wed, 26
 Aug 2026 14:33:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:32:41 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-2-seanjc@google.com>
Subject: [PATCH v10 01/21] KVM: x86: Update "last guest TSC" snapshot prior to
 enabling IRQs/preemption
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

When refreshing the last observed guest TSC during a guest time update,
write the snapshot before enabling IRQs, i.e. before enabling preemption.
If the task is migrated between updating the local tsc_timestamp, e.g. to
account for catch-up mode, and setting last_guest_tsc, kvm_arch_vcpu_load()
would set the vCPU's TSC offset using the old last_guest_tsc.

In practice, the bug is largely benign as it's not even strictly necessary
for KVM to refresh last_guest_tsc when updating guest time, as KVM's goal
is purely to prevent the guest from observing time jump backwards, i.e.
super duper strictly speaking, KVM only *needs* to update last_guest_tsc in
the VM-Exit path.

In fact, the update kvm_guest_time_update() in wasn't even added to play
nice with kvm_arch_vcpu_load(), it was added by commit 28e4639adf0c ("KVM:
x86: Fix kvmclock bug") to fix code that no longer exists.  As of commit
28e4639adf0c, kvm_guest_time_update() also consumed last_guest_tsc, to try
and prevent guest time from jumping backwards.  That code was eventually
removed by commit f25e656d31ad ("KVM: x86: fix tsc catchup issue with tsc
scaling"), but the last_guest_tsc update hung around.

Keep the update even though it's technically ok to drop the update, e.g. so
that the tsc_catchup updates aren't lost, and so that the guest won't see a
PV clock timestamp that appears to be in the future.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4b3681796c75..10f11e06d117 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1820,6 +1820,12 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 		}
 	}
 
+	/*
+	 * Refresh L1's last "observed" TSC to match the PV clock's timestamp,
+	 * e.g. so that the guest can't see a TSC that's behind the reference.
+	 */
+	vcpu->last_guest_tsc = tsc_timestamp;
+
 	local_irq_restore(flags);
 
 	/* With all the info we got, fill in the values */
@@ -1841,7 +1847,6 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
 	hv_clock.tsc_timestamp = tsc_timestamp;
 	hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
-	vcpu->last_guest_tsc = tsc_timestamp;
 
 	/* If the host uses TSC clocksource, then it is stable */
 	hv_clock.flags = 0;
-- 
2.55.0.887.g758fc8c411-goog

