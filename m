Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CF48CD63
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283693; cv=none; b=giTHGBheUavADQoR7tkk84aZaVDxa6aEzqNxk+DGs/2T5unSylqnLw7Oudki9xEuVMFcH2FgUmn9XuBcRDD0uqIGZskurpVWelJqm+ApGH2S0NrMUuwkbjubj2kNOBUaj+z27acUiJfsmnj073A08qkAnYrohCvaB8v2H99FPpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283693; c=relaxed/simple;
	bh=mj3SdbpcuVXLFrrUIf3KbnkVRVxd21IkNwP+DxYDJxk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QhMrE4Q9zmECznZ9bzgVJAcF+gGMyoN4zqvGZa293kVYj4xtuc2R2TFlOCF0YY0CFvW/dPu3d9m56ix+4xKX9cVm02OQk4laADi3yXFr1UVQlBusZYBDNMQbUSVp1dpXiO9KU3nIYdkkgkshUFHFq10QAoU0tz6ajMoe9l7eU1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eDy8n+D8; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eDy8n+D8"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2d1eb484aso514890b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790283689; x=1790888489; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtHl8hYmoYmzTRn6TIDSWRUdJUOUFOpNuKrI1Eig3qY=;
        b=eDy8n+D8jXnzMAz6BAu3kWf0EDjoxk5cOp8zItEIsq+1RxvyF+ZqsSqReSPnnNg8Mb
         xaVUgFYnsca8vBOWbNcP5J0Xpnskza/lRY0iCh4poJ15mfEKxoiY04LtE+UHQ1I3V1k+
         qWDwrZxevlWlKAV6eunVadxvaU7dCgOICU2LdcUEOmHOFKJPtMl1Jlro7IzRd3E5CMa2
         K4u9jYcE7MzKvJVF1mOk6F/nvVKM9VWM97I9W6+2XGp5r95jfBFbtVFyXKm2aq2jbW7V
         CqT0KLYEO+CELmKVsa8etlnkA7DBdWlB21i0fuZ/S04s8l+l5Szyz87uRG5z/x3+ravq
         Q1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283689; x=1790888489;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtHl8hYmoYmzTRn6TIDSWRUdJUOUFOpNuKrI1Eig3qY=;
        b=HjowTSrytCBFWQ5S7EaW1pfJ3BrShQnqYi0erpk8VztmQE5FERia/SSm3n/u9DYY50
         1rgKUCTFMVRoqYikdBrzssZHd8IR/nLoLcBXMbSl0qU+hJ7Cv4sX4gigDpIAb0KhhRfe
         GsTasf0moNWmqGiD3KdVBAroK9hR3pRgC8B+E842tQTfoKNPUU1etah/99htJUcMr+yC
         HFa1u2ekt8BWGelBOix6YxQdnQNXvLsUcybiqMJz85dK6rz/QIP+mwKqDq3ZHlCikZun
         jlbeTsIQjnChkfluCTyrTKQum3Q3qKlRbF1NPdZYuXM4hRjGFHSTsL7/jUr5HMjFk32f
         16zw==
X-Gm-Message-State: AFuF++kR91DRkOf4EUXMBiVD80w+j3vfsoRK0msBTTvxN/81zyUZ/3I2
	WziNjexjwra6v4yLrDWjiD8wWDDKYjeOFcVE/OGfdH5fVmVVYBpxWpiY8LNznW5N7yP39ugNEVP
	e3VpUGA==
X-Received: from jaar2.prod.google.com ([2002:a05:6638:c082:b0:5f1:d3d4:268d])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:3090:b0:4b9:e65b:8c39
 with SMTP id 5614622812f47-4d72aa5ad53mr4530494b6e.39.1790283688845; Thu, 24
 Sep 2026 14:01:28 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:01:18 +0000
In-Reply-To: <20260924210121.87032-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924210121.87032-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924210121.87032-5-avagin@google.com>
Subject: [PATCH 4/7] x86/fpu: Document reasoning of FX-only fallback
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

Add a comment to check_xstate_in_sigframe() to explain the reasoning behind
falling back to the FX-only state when signal frame metadata is
inconsistent.

The fallback is intended to preserve backward compatibility with legacy
user-space processes that are not aware of XSAVE states and might only
fill or copy the legacy FP state.

However, this fallback should be avoided whenever possible. If a process
was actively using extended features, falling back to the FX-only state
silently resets those extended registers to their initial state, which
can lead to silent user-space state corruption.

Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 arch/x86/kernel/fpu/signal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index b9dcd0cd0e41..d56819fe491e 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -54,6 +54,14 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
 	if (likely(magic2 == FP_XSTATE_MAGIC2))
 		return true;
 err_setfx:
+	/*
+	 * The fallback to FX-only state is used to preserve backward
+	 * compatibility with user-space processes that are not aware of xsave
+	 * states.
+	 *
+	 * In all other cases, returning false (to trigger SIGSEGV) is
+	 * preferred to avoid silent user-space state corruption.
+	 */
 	trace_x86_fpu_xstate_check_failed(x86_task_fpu(current));
 
 	/* Set the parameters for fx only state */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

