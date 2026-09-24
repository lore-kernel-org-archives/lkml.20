Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361A7404BE9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223375; cv=none; b=gBst3mPp20ooRXdBRmNbsvrkNHiyIeWiLty7pbYd65HGzEOKNB7EgyHXhATXmPL8wprKMVoFDVa9IdyzWotSz7RMgyZcxe7KQFXBLVw9MmiuyOjbRH1zU35PTmyKGSVe7tM0Snx2NaxEYx+D/EuIXTnOTJt8QKa/qHgjxhBFHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223375; c=relaxed/simple;
	bh=4mNQWbChJAgFDbg2bTs/RQS9DczFtsrEoJsv+d9jZf8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H6vqtCP/5/W1xq/mMk9cfVYVQEiefHVFZUEKiOKN4SUnMXSPgDEM4XO9Slg+/BxWsDkkSMr5vqFUd7zER+az/xxApBWX65FxQWHZtsgknbBjjaAh5M5ofFn/qowuiefqN2m6+rR6/3kATwzn8b8gelHXVGgw5AQu7QXMUoIXaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n1GB0Nav; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n1GB0Nav"
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f4e8568ccdso2955854a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790223370; x=1790828170; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLR8sISmsxHCx8KzZxnkzJcWho2PP8br9Rps/xb8c2M=;
        b=n1GB0NavtU9Cuq3LRd0Ah8vP3pwhbBuyQpVBAd/8XdcxlRNHL0iflVzGbiFcL1oT0m
         XYGyQIiWaE+0tG4CzhXq3uU/DTs/TlykTSPp4LVvnDcsIGHXaN1hAOIbxR3trAsmgbJ3
         72cYGp6+FNTKsQ3QR0X1AAwcyyxOtB0y7TVo8ucanY93JXeLDjJjwPZkIQ0ac/zsYT6V
         9B8FMN0cYJH3sUFqFnOC9nQ6Y5psXx6LROgSuQ2Wyw/INwGU77zoAKxbdR34g2i9XHLZ
         HlCYIVCB8pPP7E3WmiPSM97ZA3guMpcwA0kgvbDdI0MZ/IcY5PdLJBcOBV9VyQ5RH1aB
         Rn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790223370; x=1790828170;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLR8sISmsxHCx8KzZxnkzJcWho2PP8br9Rps/xb8c2M=;
        b=VARs2PRHrfcSmy7MLZeCcHLAosa49RxURqSmBFn5dbxEydsiZRUtdtnKYAMj6TjmnR
         BhjDRN9lo3F6fRlYqzmNhbfsa5pORlB+U5TEn11HxGVagMH6Lvp3Bo90VKz2DHjPJGg3
         3d/8qZ8zsG45jW+wMQaVh2c+ug1I+m/wG/6Jy/l5NBELZ4SeMevj01NsWiC4aFJRTX4n
         oeyyyej7fN6Sy6aol+JVScUm7CWr8d32LCmGlj16WVIOmWm0Bh7l3riF0XfVKZOrpsYi
         ysT4i1aF4WzGbmNLLxrhzp293jvtDDGZwsmxt0ZkecI17QsNpWRBu+IhXO3Y/kmgzhOS
         IFLg==
X-Gm-Message-State: AFuF++l+pwj++RvqINw9UFu4f/LZRvBHPMgiecH74tsz5I6fs3O9b+vN
	xnY+o7+dTOCqgalqyP2GFgCwW0Ht1g8zgKDVtfEjX09BuFG/NQZD9IL/hexO2B7kF2LiFahu2bS
	UipBxHg==
X-Received: from jabfl2.prod.google.com ([2002:a05:6638:63c2:b0:5f4:158f:39f2])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:16a1:b0:4d6:85d4:8499
 with SMTP id 5614622812f47-4d728922d24mr1384307b6e.7.1790223369945; Wed, 23
 Sep 2026 21:16:09 -0700 (PDT)
Date: Thu, 24 Sep 2026 04:16:00 +0000
In-Reply-To: <20260924041604.3209659-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924041604.3209659-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924041604.3209659-5-avagin@google.com>
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
2.56.0.rc1.310.g51773c2048-goog

