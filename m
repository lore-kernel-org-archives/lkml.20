Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97F36F41C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842077; cv=none; b=IUOSRM6TELd/tgxvXD3sq9/nUUhtm2Xm6+eyckX8jtOtGoGjRtU783EWgm/Re+VsPljV9QpFd5o69nx+xF9mt3FbqzOYZEYyzqTUz+LDEjQNIHkkzEJYur+Fsx2G2SGtJH9edXq6f1YSW5aT32bh7ql8GGlBlecHG45dpV+75U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842077; c=relaxed/simple;
	bh=9GI5Z4OXm6r2NqJVRrt9DakVj5uxrvUci+yMH6Y5JR0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u+QRUMTo0kFpL2nwIKBWFqAL7A+YrOMiK5Wt8+82lDSLws09fCEIWp/cHFUDazL7UJEEztv9epczYNzlRrKsOSUPnIb4SyVgYj17KQX8LeXaNlj6wHh+N9Gqn6XdoLAvxMnxxDfv5AuTSlR1HkW3f+rWN/SuyTxfz78bCKnBQYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pDa8KIQs; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pDa8KIQs"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b3962f71e7so4777123b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788842074; x=1789446874; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+3pXqdr3UPO/oCiF3HW/6/WAxnlQ8Fn84d6+8TUwB0=;
        b=pDa8KIQsI0At0G1wTC1w997r3SSbc0NmAwaZ4BT5NXlCj2UiIfMMOZohn9UOFcAaoA
         krqlDmGCPzx/ywCNSR6WUdVCO9C7WLkDqTZ79oaJHDHrFp4o+Pdh3oSpj07e2e3aDBQ1
         rxXLQ6TU2QmfitCx9P15demf5Ck61gS6B+Lg6FlrSEFLLmrsw4mqmS6B4iopTEknkAXA
         5L5k8ohABXWyl9sXneMUDECpZ4z1YK95z+LRHtB8P4rhcUlRq0ASMD/J5fS1FxWcL3SZ
         zTiC1vLvwGaKWLZtVZTXkb8YwO0YdaEn4vIswhcWWupyHcCDquaq3lLXVnJuLiVovYN5
         DvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842074; x=1789446874;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+3pXqdr3UPO/oCiF3HW/6/WAxnlQ8Fn84d6+8TUwB0=;
        b=faKfqx7UvUmQwceelGBZrxO87E1cO/+xQtj0DWleGTEQHTpYOTjlJm/J6hxRYxfHuc
         vBcGHwLkvOpuW/fwK09OTRXIDWZtH+WCZDwMwPB0Hq6MnFLcDhIvGBls+3RQN08JhoYP
         gOVa7Vn9T6Fbe1BW+/nrny/pxcHAykpLBTgDNJ7GpE/eL9OTG94TJjo18TcXUk7EE7wG
         7r6mvb0b8v0OfNIN7c5W+19dqy6rW2Q1T4CyJ1cZ9wK22e3rgzB4d0lyb0KXUeui/rva
         D1g8TZ04odWM/262pYOiqrqT71kzEWUR2J5/gLvgJ+0ySsTjATWkLmUHpVFkXjwnaIxh
         d0Rg==
X-Gm-Message-State: AFuF++kxaeBlOkem9HlP6CjRRexMgfu2DFd8h+ooiFgSBewa6d0Y8yMd
	/KuJzSPj/FiSa9GvLKENV4NlCZJkBdok5c9XlxloJONzAvz74N1I4BQaT/hDZO1CwL0n6gAPUB+
	cuyitPw==
X-Received: from ilbbe4.prod.google.com ([2002:a05:6e02:3044:b0:509:a53c:7df3])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:1c9d:b0:6b7:46fa:1695
 with SMTP id 006d021491bc7-6b746fa1a33mr14056827eaf.42.1788842073901; Mon, 07
 Sep 2026 21:34:33 -0700 (PDT)
Date: Tue,  8 Sep 2026 04:34:24 +0000
In-Reply-To: <20260908043427.1842515-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260908043427.1842515-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908043427.1842515-5-avagin@google.com>
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
index 60063a7a44f8..d686d5f7f3d0 100644
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
2.55.0.979.g7e5102b832-goog

