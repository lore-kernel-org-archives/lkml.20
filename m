Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414D7511E8F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018063; cv=none; b=UBBXbqLJU9nHhXert5vpScMHWSSiEk9A3820r1EbsIq0tgXNfzSg4nlEL/Oj8uZTL1w5EURAnErwR/OR0AjzwW0uNrKL5sUm0hX2sDRiRn/NAqxd7iAeaT2S25l/u592eRKZIOfzjvxbGtev1yngsIGCDXTa/0U6hyf5qwiZx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018063; c=relaxed/simple;
	bh=vAIXgaa3DfXA+KfQ7T0dYWQlch3LEAa8mJXRZ7psQFE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ijg2I+5eNJ+LdIjjFG/UlcVty85Q3Lz0UmdAZODAf6AqJUOQ5A8KUWpW7801mGGHOUAxUalouR+qqvUxnuwFi8rD1jnj9rGEqK9iciFSC6XNQdMxAPxFqHIbk2BEVfQI+KkJ7S+SV9TqOM+hEIB1C3ukybTglgFx4+ymEl44o0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cjfmm1cJ; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cjfmm1cJ"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc435388657so4980369a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790018062; x=1790622862; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ie4lRRGMB/QtuXR80ZTHBxhVpLqodwwh8z23GPtWOvk=;
        b=Cjfmm1cJvfCsFtfC/K9TJ9Pa/LZKm2ng0tenSA2FRdLeZ/dD2aP+l6yZQHh7vnfmww
         0hC2KksVA4MHTmBAyg4RRX2+WaHbYuch9lcdZ4XDkJizYOBHwzL3pw14tg9In3rgM50a
         9YCrWo6HCTWOU4Q0g9PWVxDMzj3vjj3G4ROYK/n9DMKZ49lyIySWeTGaZtqk4Cqn1G46
         AMJLLh44tB184TkTTAxlKRMYj5f7TISpqGPWBx2issSxcS4/UUXBR9wSXeCy3u0kIm8g
         GDNsFwvwkU1I06NLO3vQT9pFo/ulTLtRPEUm/b8IbYUOqNdG7gFInoRGap5nIvMXJhQn
         HvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018062; x=1790622862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ie4lRRGMB/QtuXR80ZTHBxhVpLqodwwh8z23GPtWOvk=;
        b=dxdP0Cxslm+/dL7l2KAs862aZUmZQnMSgLEUYJi5R2H50+/By21Zxisp5IIsUSeI8f
         oSfFJpygG8PEl2z0zYNh9/BQBlUj+5w1KhzNQuztjEV1RumrPL2jdhFuyCWlY6lPfElE
         AYiV0i9JaF4+BFdiv31miTy8yG7ZMwhLzfknzkVEY04A5Fnoyl/A09JRaSsAf5OP5uKR
         tX185x24UM7PeC+1PtnbCdJv0YEF9d9s6pzmQE7UxC77fwovYjO51nv0oUndAbzMP2dR
         ho197XNu5Y2Pn4uKSe7WM/CwwFPU4Sfc1CwsllJFJKq8SrWJpaxabEscOV1k3yX7mHd2
         qK1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzArCyctfF3Vuvg5AkutmKH0X1Sg2F5rElV+cdZNopZFXhK6ODweFOFHTqEvKMbUC6CqU4AClibKzVEz2k=@vger.kernel.org
X-Gm-Message-State: AFuF++lUj+mdcxwlqhfCdj5UQnGMw9NIgD0Jl9zlKHob/AiSkpw8GKKQ
	nvrHstD9c0FVXMlyuv7unlP1Cw/Q6nXrJzFFtvcvgeFYKfqPkNOTbesd3GGWEXoV5r8owhveT8Y
	b6iC1rg==
X-Received: from pgdj21.prod.google.com ([2002:a05:6a02:5215:b0:cc7:4a9d:af5f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:140a:b0:3dd:a196:69ec
 with SMTP id adf61e73a8af0-3dda1967806mr11525924637.71.1790018061422; Mon, 21
 Sep 2026 12:14:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 12:14:09 -0700
In-Reply-To: <20260921191418.950933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921191418.950933-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921191418.950933-2-seanjc@google.com>
Subject: [PATCH v4 01/10] perf/x86/intel: Ensure guest PEBS path doesn't set
 unwanted PERF_GLOBAL_CTRL bits
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Jim Mattson <jmattson@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Stephane Eranian <eranian@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When reinstating PEBS counters into PERF_GLOBAL_CTRL for a KVM guest, mask
the value with perf's desired/original PERF_GLOBAL_CTRL value to ensure
KVM doesn't unintentionally set reserved bits in PERF_GLOBAL_CTRL.  E.g.
if the guest's PEBS_ENABLE value had bit 63, "Enable Precise Store", set,
then using the raw guest PEBS value would propagate bit 63 to the guest's
PERF_GLOBAL_CTRL value (which thankfully would be a failed VM-Entry, not
a VMX Abort).

The only reason this bug isn't reachable is because KVM doesn't support
"Enable Precise Store" (which is probably a KVM bug?), i.e. bit 63 can't
be set in kvm_pmu->pebs_enable and thus not in arr[pebs_enable].guest.  In
other words, this _should_ be a glorified nop in the current code base.

Fixes: c59a1f106f5c ("KVM: x86/pmu: Add IA32_PEBS_ENABLE MSR emulation for extended PEBS")
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/intel/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index e36f340e2dc2..f4674d93a5e2 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5392,7 +5392,7 @@ static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr, void *data)
 		arr[pebs_enable].guest &= ~kvm_pmu->host_cross_mapped_mask;
 		arr[global_ctrl].guest &= ~kvm_pmu->host_cross_mapped_mask;
 		/* Set hw GLOBAL_CTRL bits for PEBS counter when it runs for guest */
-		arr[global_ctrl].guest |= arr[pebs_enable].guest;
+		arr[global_ctrl].guest |= intel_ctrl & arr[pebs_enable].guest;
 	}
 
 	return arr;
-- 
2.55.0.1082.g2b9226bbc0-goog

