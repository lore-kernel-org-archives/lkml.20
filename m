Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D04B4E432B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601007; cv=none; b=hJqrYrohQnnzBUu0AXKd/j0qL8Y9na+RgbAXdkllJWRSZtBizSM6XKtFvII8ZY3/4dkTlECNyLt3VjBKRbRIrsiCX34oUEJr3m6Q08xCc6Ih7VcroUT9GAYw4xP8g9sTYD1Unsc5am/UzRDQJSfl8US84kWiwTM6dgbsRVRDr3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601007; c=relaxed/simple;
	bh=ebQ3kkBOnMbGpYQizGxh7N6zJHu9JIKJfF0XRRz/hPs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aX855rilJgckCVN2GN7jmT1k6dkI/xtQWF6gdXS4jqA+y4pL4wWPJQoYXZFAx5/f/JSPzdmUa9Ow/6qM8+F2mFMcib/wkRbhD5JPlvoVfYGObXy1usjLXIVOoCWpemizXmN0dE6mVae5r2BAmqnId6ny0LwpK5J+ynid5l4cfgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e1d0JUAn; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e1d0JUAn"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c734afb8deso498639b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789601004; x=1790205804; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSSmIBW07WEV1TvZ4Ek3lr4k1UmQn4uFX87eg6ruy0w=;
        b=e1d0JUAnzqAXg5OEnFkvGEchvLvWF0Czhq3tEp0W6765w7mOGhrHzgfhqE2zp6EyU2
         yDNIfNicu3ANOyaMbJ3NB7iIwLhqM3oWSVuf8l8qfvj3fD6YAsMEql4Ldj96rf91IPEp
         KFROt5XsM+oQ1Cni1Qa4R1108sOnOu22VZEpQdi84+9PGupfmt1G5hP95QfNFKvos/a9
         GUI6pcldOC4/0W15cO0/lfO5iNnqoRcoLnLsRKesGxny5ZqN0Zak31tiXutyDvlEwGMN
         E1ubx79c/jq00H3cSXLbJ+xkFJxpnXHTn4J/u1+Zt4BJogR7KLsHAC/WfnHYdU/pTyrz
         boPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601004; x=1790205804;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSSmIBW07WEV1TvZ4Ek3lr4k1UmQn4uFX87eg6ruy0w=;
        b=THOr2itYYgG2K94B263KzsTitn9SlQEU3WSenwkzE9zV3tgxKpNWfeLh666Te5pgPr
         I6LiWwPC2EMB8LViCkgxZAIZLdtpkV0rXq4Hv3L+915PGNDlKYJer7TSnDoLHFEGr3ty
         Q9eETRddBJP4uycCf6gGh5SI7W0V7etrog36PiX+8+FL5iPd12Bk9KGe5ErXS+6icL6/
         8kcvU/fSSBGR10TMXxaP36ltf3oE1ik4GCytrl6GGJiyQROGBsbIEwk+4EOaUAELg+Hc
         leuybXyt9QaK98MeyGJKkAudBy6NjgneJ9S85eeDn4AYXVxFFeFiipJAsybI50Xv2VCL
         OVuw==
X-Gm-Message-State: AFuF++lwLPFdFqjNCK6iM4BIcj9nrH0ZilL1BmlWqHQ7KsKE1AKS7uxE
	CwqupMIuEVOb/41uv6Qh2OSV1HBxAUxk0XRY5isJuamb8TezrOngSRPMjSIgfPTR5VNZbDi4U7Q
	6YoWuIw==
X-Received: from ilol10.prod.google.com ([2002:a92:d8ca:0:b0:509:9557:9554])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:c136:b0:4bb:ac05:9ebf
 with SMTP id 5614622812f47-4ca49ecc9b2mr4306460b6e.14.1789601003946; Wed, 16
 Sep 2026 16:23:23 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:23:07 +0000
In-Reply-To: <20260916232310.490786-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916232310.490786-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916232310.490786-5-avagin@google.com>
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
index db069947bdb8..050e58691964 100644
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
2.55.0.1082.g2b9226bbc0-goog

