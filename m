Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3585B51477A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018068; cv=none; b=P9N22pB2glRkClRdpXfBxChEm/VloprhBNopGOV7XyMb1GGIQNuJebTkG4THHfxngYuTqabRUUxbizoM6dXPf4gRCIESeL+3+WC+M8tzLqh4BJFgCC0qFKCS1/BWmPMVDTcFETvoM7zHce0L67R+0GtDPozGXMecfuN49bl3MLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018068; c=relaxed/simple;
	bh=/fduYVdhTiSZFVOb8ZbgmJZp/IyADMXN1YECjTLZc0c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bfoeb/MNxKcsDA2Kjn5ha9IEJMzbN8ECE9FYkC5umfkQGv2pjDqzn9uSX3IbxdOEbZlTQFqI8x4Jnljc1EeEKJV4Z9ZSgv++YnNsPzp8z3P2wMKlhGeziU38UU9ryhrqHCyP39eU8mVrXF3yhLwyOOas/6qxs8fImso22tLbuJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QBjmeItm; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QBjmeItm"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f75c1219so72075415ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790018065; x=1790622865; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BNDjdFdJNZ2KwNyt2OZWxN5CjAQkOsVS0m1OtXH+uso=;
        b=QBjmeItmh2HCog9jWpGTEjF9tEv2TmXkGcdEmjJjSaJN5xdeB4MRM+tabSQw90V75P
         vVuwkYaXPNcFA9uQEcbY+lpC/djUqcqLFCRBleMMvZtC3b2Y61/ralqYpTugnYlM613w
         NlLW/8NYVEEe5Dc3DXtFJDel32RRwgax+2lZBjjUHIDwZh3uhjWlb7ailSub++rpve2N
         OODixAVNWJY8l5uOkSjKyhraxb4L37vFVIze8jPwrhJpTix5KMNrCjgSxfHB7kyY3v0m
         HLcdE8mC8SO0tR9s52pDfdLsB8oghoM0GBYbPebSLSj8/gKwmbBK59zkl4N4TjldgW93
         Fb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018065; x=1790622865;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNDjdFdJNZ2KwNyt2OZWxN5CjAQkOsVS0m1OtXH+uso=;
        b=hD9oWpHYI6s2ijCnbB9cxPC6hekROzzxzb5jZ4diV3f+WJycW0STphHvQfsjCCzgFk
         BbfoCOvtqcTCPRM3VjfQufLjqt67SBDdIopoafM0SkczuETcyOb858yNXxX5Gx+v1ehY
         wJZioAF831YoVGY2CqTIZtkdjYi4d+A5yafL9mdOB0LIRrlYR9HNxKafxITF3SQo2Gm4
         wFGHCdBRs3gx/jLIePGNnLuZdoLkgAl5Mpgt0/1FySmEe54aMykGeU3iHGPx4K1p0/hQ
         +IdH+tyNlvaz79HGMKsDxhXKGgysJstVL0E4yNkPM44w+cLtSIylaB2dCU+vkX3fnVZI
         mELg==
X-Forwarded-Encrypted: i=1; AKwUvBwgwj7tVFLdj7BFPUJPKhieVf10DgOhhot85DkjfIB+0+hxsfEPCA/6+lNFTJp458LPf6qD14Np2uUAOiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mOdksd4Fcl4T9RV9cEV7npTg+x8hYpDE08EIPRFwC3lBe0csba
	lg705K48H9sqSxWlr1Yla3r2xfdPVvaVlthFWY0y68O++wV4oqBANkHJdDOi6TmSxC4h3lajeDx
	L++NUyg==
X-Received: from plmo6.prod.google.com ([2002:a17:903:18c6:b0:2df:3468:8a7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4590:b0:2dd:c100:3138
 with SMTP id d9443c01a7336-2ddc10031b0mr116434115ad.52.1790018064959; Mon, 21
 Sep 2026 12:14:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 12:14:12 -0700
In-Reply-To: <20260921191418.950933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921191418.950933-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921191418.950933-5-seanjc@google.com>
Subject: [PATCH v4 04/10] perf/x86/intel: Make @data a mandatory param for intel_guest_get_msrs()
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

Drop "support" for passing a NULL @data/@kvm_pmu param when getting guest
MSRs.  KVM, the only in-tree user, unconditionally passes a non-NULL
pointer, and carrying code that suggests @data may be NULL is confusing,
e.g. incorrectly implies that there are scenarios where KVM doesn't pass
a PMU context.

Fixes: 8183a538cd95 ("KVM: x86/pmu: Add IA32_DS_AREA MSR emulation to support guest DS")
Cc: Jim Mattson <jmattson@google.com>
Cc: Mingwei Zhang <mizhang@google.com>
Cc: Stephane Eranian <eranian@google.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/intel/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 4905296d99a4..0db55d90c3ca 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5364,11 +5364,11 @@ static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr, void *data)
 	}
 
 	/*
-	 * If the guest won't use PEBS or the CPU doesn't support PEBS in the
-	 * guest, then there's nothing more to do as disabling PMCs via
-	 * PERF_GLOBAL_CTRL is sufficient on CPUs with guest/host isolation.
+	 * If the CPU doesn't support PEBS in the guest, then there's nothing
+	 * more to do as disabling PMCs via PERF_GLOBAL_CTRL is sufficient on
+	 * CPUs with guest/host isolation.
 	 */
-	if (!kvm_pmu || !x86_pmu.pebs_ept)
+	if (!x86_pmu.pebs_ept)
 		return arr;
 
 	/*
-- 
2.55.0.1082.g2b9226bbc0-goog

