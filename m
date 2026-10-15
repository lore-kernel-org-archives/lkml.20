Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4960751C049
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064006; cv=none; b=ff6MbuN6+NCb0pvHMgBYiDyji9UsauskEbi8Gl3Mbl+9cOBqwjwrDSdtJ93cI97FkedUn4NgmDL0lQKArio/5rKJ0hSw6KUsOI3Ir0KN//4dODUWrC2z8cNeSmIbYdvC4AMoKmJCPuz4klo5/Y71qjZqAObs45Bz4Yq8AylJ1gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064006; c=relaxed/simple;
	bh=fgA/DOzOgyFrie7kteFJYTL3C5kdV1edAhl0ExNfxMo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pJQ64fvPZVd9caTR4CFikNOUG/6Jj1QejMoKpCzOkfoFKaWaOhnBhaArEvhz4XN6nzi52g7BXcxrIjzSDF3hcKP2cUsOB7k4S8HUPaN8OsV9yY5D+PlnNih9Og0dMCeMZS2p3J9Zz2YlGjFgR7CMKUo7xytk9iPdg14B0aNQhsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jvcRnbac; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jvcRnbac"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1ad49096fso28230895e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792063998; x=1792668798; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=34I5YMYZwWqkMn99f1ZPfTg1ZL3IhEhk5unHI1E/+wY=;
        b=jvcRnbaca4mijtXgy2sa3Gp94txy/d0EKnvZ4QQZ68Cm58qXjGk9WCFz3GAPL/X3Hm
         Y0pNagVqhAgwpvWDqWqwjn2IN/Q3Dj3NqcgqQIqnYSjgXgRC4oynQb7hkCN4bwVDpkcC
         qntS+5bc15EI+EhM35SJncFhKG2QyobE+muOqcrqn1pg7TNUGUaWsLGqvzva1r/Jchww
         mRjbF1vr0IbkgUDVViFNoJV0JI3gMbp7DgbKPVbcD7q2gARMj9UzyZA3i74YhE9+lL88
         A552+3PvxSwNVH03gFhqccV1lpOZxuI2LCvsJ+BGioCqc0Oox6jZYcAtZS5A5qCbC+J2
         RY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792063998; x=1792668798;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34I5YMYZwWqkMn99f1ZPfTg1ZL3IhEhk5unHI1E/+wY=;
        b=Gpa3bTl10DhLva8mg1D145ooF0IedpW152/Z57R+z67yPYWm3CnmQ9GQaEeIpjKKdY
         8+qvY6bEDa639SbeyDEtzuE4R/oV44Rjy8tu/mIGvLtr7XvSM7qv+NcLzTbx47v/tjOK
         C9J8w25TD6bSdWp5AzzHAfvwLMOqlHIb1+roLIYeexGqsG3s4sc3vKfl5TJa+utHktsy
         A73N0Yi6yZinPpCYOMRT7Un3CMtRtMdZMmZ/siYwpclmjMzVoxqQ6y/PDjAdkQeoz8Y/
         vZe3kKtjnGSaX60JjbjIIDTPYvITmcqhmdIjihtA0PAOnLrdLR+NZhz5PvFy2AyvunmV
         W79Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMfBrnOvJvxpYwOEjuFuOGX4aC7ExH53IgYHjxI1V8QXl0cEeWGzRrbUm8e+BN4U4zWC3RoR08SKhFloE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIugt6swwIZ2fL0AV5LtxoKgDCr6v2BcQxxmWJ19wfh+XMDzPW0
	WyX+SGtwpmMDJGZG8eJYERshtQq94EdiPzeXkZsq9kPTrOU3flCk9m0QOzN+MG/Cv/7R5jh9/4k
	IVDy2Hj9C9JWe9dLPI0MPUg==
X-Received: from wmbjq7.prod.google.com ([2002:a05:600c:55c7:b0:4a1:939b:a0c5])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83cf:b0:4a1:ac66:604b with SMTP id 5b1f17b1804b1-4a1ac666a65mr165997135e9.1.1792063998106;
 Thu, 15 Oct 2026 04:33:18 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:28:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015112814.332084-1-vdonnefort@google.com>
Subject: [PATCH v1] tracing/remotes: Fix TRACE_REMOTE build when TRACING=n
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

TRACE_REMOTE relies on tracefs, eventfs and ring-buffer which are only
built and declared when TRACING is enabled. It is however possible for a
config to have FTRACE=y TRACING=n and TRACE_REMOTE=y.

To fix this configuration, have TRACE_REMOTE select TRACING directly,
just like other FTRACE options do and drop the TRACING dependency from
NVHE_EL2_TRACING to avoid a circular Kconfig dependency.

Cc: stable@vger.kernel.org
Fixes: ea908a2b79c8 ("tracing: Add a trace remote module for testing")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610142301.GBepPVmS-lkp@intel.com/
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/Kconfig | 2 +-
 kernel/trace/Kconfig   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 449154f9a485..e179b8ad79e8 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -74,7 +74,7 @@ if NVHE_EL2_DEBUG
 
 config NVHE_EL2_TRACING
 	bool
-	depends on TRACING && FTRACE
+	depends on FTRACE
 	select TRACE_REMOTE
 	default y
 
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 0ab5916575a9..6587450cfcd1 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1329,6 +1329,7 @@ source "kernel/trace/rv/Kconfig"
 
 config TRACE_REMOTE
 	bool
+	select TRACING
 
 config SIMPLE_RING_BUFFER
 	bool

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0.385.gd3acb90ef8-goog

