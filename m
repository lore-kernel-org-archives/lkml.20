Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B46548C403
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780004; cv=none; b=aiAV4G3D8C75VdTbbWWBvMrqGh+QGel1/y8uHLJoRyaf4slwNjnL6e9fXSjz7oYyZmRMUrRmDHk+jtdXRh9/GzLITL9Oo63W1mVe5bihsas1mtpMGDMlMCAPc/b9c3PhyC/GRRninKA+TO9yfEXwbS9HleLpWZmkIE/7L4wVfp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780004; c=relaxed/simple;
	bh=Dyer1ULn/a/i4L4ozp6ZOIcINMbH4yOkx+5FletSldI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UoO8mz9g0539hkeTvhL0QmGgg0nYjWDN86GIwgfvKulaVfl36IXGjg9HRFSvE1Tv2NOB9fZrBrvsz6xTCXDsAmO/mgHKEBqKq9AAmsJV81B3rvGJrTwiUAbrY+GowK5/NUjvXOOXcFkWEVa1Fz29avrZry91iV2WzXyNRe/qfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ERe9rvgW; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ERe9rvgW"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc132709c76so56529a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787779996; x=1788384796; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=goM61cDq5JnxRmzeon6yIX5IBAcd9O/5+qmf+efG8yU=;
        b=ERe9rvgWNMRNhq8CSzZF0bpo/QSW7+SbU1gXN5J8tzv32LQy5Pj7iJ9fIWGrIf3jc7
         uMuC0BByzFxhcuH57U6YvqacPdjbluk7GpxIqgBz2IWqCJHHd9/CdWa60+oa7Q3VnKkA
         6TZC9OAF6DBGz27LL31cz1RK9KXB+W3nNtKFUU+oO0XWyl4XxfoSfeTXQIh5svILkzxS
         Ri0nD4mfmcbwxp0ZE/UvMyLtZ0rOmJKCQLn9HrOS5Ire7BOKAZJbFdIOAkw/2yERTCQc
         hMC1nzzkVEJ7NdceuymLMK3MUSVIKQS9hR2/BcKopFbzHLagNtgINoXg6/ihZnP6VxZo
         m1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779996; x=1788384796;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=goM61cDq5JnxRmzeon6yIX5IBAcd9O/5+qmf+efG8yU=;
        b=p2qAba893y4Cxp1SHsNJzI2Uf1vPZseiYGP4LoHHjoFUeu5QwcpVgKANHpmQG6hmun
         thEHSPfTR0Sah0LJV/O0OhEw/tjgH3VD1OyMmsFzfSB2gJhAHi/F17OSzkx9OdS1KCHI
         SusuoUtingQO3DblMeIoP3UFtxyq1Z/AsCf636BEj3Kps8tduW7V0dysyTGgUHD7/7+3
         q0kjjKu++qVe2+pOXOEET9SvigGkAhqE8jWAcqnNi4Qjb8N8xG5qVpaR9t1XNco5ajS2
         kTxkFtlpAdsKM3N5/DFMvz6TjxWKj0EvE0aBiesCTVhn/fgM6TAS3TZK1r0OhlDBWV+a
         GUhg==
X-Forwarded-Encrypted: i=1; AHgh+RrJ1Sahwsa0a2nUe1fVbFCsB0sVxs2XW73g6NsYp5tuQniAXIwNy+CMBmQFpVc0rs7gtSVjKmJ0s8tUNTE=@vger.kernel.org
X-Gm-Message-State: AFuF++kF7+vl6TG/ROaagcEki3szbSUuLC74J5W3rUqvOaBvDHf7ykbF
	K9LQGZ3BiR0LGeoWFea1mEcQ+EoTegO665/dyOffbbuwXd3QHocrAQjCBM6OIQ9OPry8rJuy3L6
	m60zuxQ==
X-Received: from pgjh17.prod.google.com ([2002:a63:df51:0:b0:c8b:2706:11a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:93a0:b0:3c3:791e:5e18
 with SMTP id adf61e73a8af0-3cf83341769mr21745880637.7.1787779996284; Wed, 26
 Aug 2026 14:33:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:32:50 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-11-seanjc@google.com>
Subject: [PATCH v10 10/21] KVM: x86: Fall back to non-master-clock if
 clockread fails in get_kvmclock()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

From: David Woodhouse <dwmw@amazon.co.uk>

When computing kvmclock and it's currently in master-clock mode, fall back
to the non-master-clock path if the clock read fails, e.g. if the kernel's
clocksource is transitioning away from TSC but ka->use_master_clock hasn't
been updated yet.

The rdtsc() fallback was added (well, kept) in commit c68dc1b577ea ("KVM:
x86: Report host tsc and realtime values in KVM_GET_CLOCK") purely to avoid
uninitialized variables and compilation problems on 32-bit kernels (already
addressed).  In hindsight, keeping the rdtsc() was a hack and a mistake.

Link: https://lore.kernel.org/all/CAOQ_QsgVqS_PuJo8F10Gg5Xw+tKt+5gDx+kJf1j3CiPO4MAOqg@mail.gmail.com
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[sean: isolate from refactoring changes, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 64df8da3aad4..d8bdc64b31ee 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1676,14 +1676,13 @@ static bool __get_kvmclock_master_clock(struct kvm *kvm,
 	if (!tsc_hz)
 		return false;
 
-	if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
-		data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
-		data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
-	} else {
-		data->host_tsc = rdtsc();
-	}
+	if (!kvm_get_walltime_and_clockread(&ts, &data->host_tsc))
+		return false;
+
+	data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
+	data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC |
+		       KVM_CLOCK_TSC_STABLE;
 
-	data->flags |= KVM_CLOCK_TSC_STABLE;
 	hv_clock.tsc_timestamp = ka->master_cycle_now;
 	hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
 	kvm_get_time_scale(NSEC_PER_SEC,  tsc_hz,
-- 
2.55.0.887.g758fc8c411-goog

