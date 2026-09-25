Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AF4DE734
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353504; cv=none; b=C3igVrWa20hBC9TdYw+5MAgwtrO8cYeqaPP10wlRhGZzuJ9YFZrPa/JULLJ4mVvkXrgiMlxBLAhrOC6fpVW5YbAF08LbJQ1Rn19k5gF6hred7CRw179rT95c+cUb0XrbkiQe1C3dW2Qvvz8pszxM0LEEyktlxN+drFDjQPzZNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353504; c=relaxed/simple;
	bh=mj3SdbpcuVXLFrrUIf3KbnkVRVxd21IkNwP+DxYDJxk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BmXkkJVYoP/xweue1kFoNOnAUAPuw9Oj5T+zKiEBt0wn4uQdv9y6mfiJzEPR5BrgSCzEK1+eqMSquW7eptCLNHbh+2/oOMcKLfxw8Mn4akA/a+gayj2Iah9PYeMqBfwBJpwh9ca+8ww8bKsPYIjDULfNfUDjLUsUGn0T4PNwaSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bx3qqZ/4; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bx3qqZ/4"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4db3db8687fso1738402b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790353502; x=1790958302; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtHl8hYmoYmzTRn6TIDSWRUdJUOUFOpNuKrI1Eig3qY=;
        b=Bx3qqZ/47IFKv3L2QVACeChkZsdOKB/aI94jqPJ+FA3rsfAYZT+VaRSEeDdPu3Wudb
         IEgLCmTXqZgQr/VAOCxVF6Ax45eXYHu1ZgVot7riUxac+FV7VZ7MLxw3Q43cq4x/wdEk
         zf85OtspQJmOY+hUQ8VPginqS0b1JszJ0cdRRmhEKPpGYZ8yL4kq43oc/ww8AdeVkLUK
         nvHNgWaby+v53P8LwgdmZaqi6a7D47KuCSKQ184EBKZ2RVp4bPpJ4H3uPtZQh0I+P7/h
         wRagTWaySh/Ee+YLgyH//dtAYhm7QFzDoQv2GKmTTNS0YBW2RM12JNgc65/FcdIVPswj
         ycpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353502; x=1790958302;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtHl8hYmoYmzTRn6TIDSWRUdJUOUFOpNuKrI1Eig3qY=;
        b=R6E1M4GZB3tweL2LFnI1nxovqB5fkiMgYMHJYcJYOqqbZ3eXSIsq8vHrs/LI5PSdZL
         lrMytvQuWTo/H7oRSxJgimhWOxaJTDVu0m4C2Qx/5NEDRY7bqJqh50xVaY3ZEdv4zc52
         YIe3I+fRRzEyUyOQY6v+optq2Ybv8VAGj7fd0EWQhiCK8jOkK5kzsAmvTlSh2GHmzUwQ
         6GMIzTnrKhbZKZ8X7P4ZQzRcqUbXnuxdd4O42gmv5d7GqgS7lV5WEPlxxgiOw8wlBwVb
         AziJYLfEPWRFFGsAWfY0bh/flYeM3zzwIvtJJNVEgYNHWhFcZoANbCz7wFMP2mrn+IKQ
         NxEA==
X-Gm-Message-State: AFuF++nCk8x0kJxFWn7J0Ic+mt/jMnr+xu5jSEuCvMRjv3DhiuFVqEJc
	pW7/oWWe+PGqzJVpvXSoGD/hy3wM6/yhWp8qrkNVlwdwoiplPmDpBmvW8jKbiKlJoUbpSiCX+ae
	qn2tesA==
X-Received: from iobms17.prod.google.com ([2002:a05:6602:a891:b0:9c4:b4f6:5f87])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:19a8:b0:4c3:ebb:63d6
 with SMTP id 5614622812f47-4d72e06f3d0mr7450761b6e.39.1790353501307; Fri, 25
 Sep 2026 09:25:01 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:24:50 +0000
In-Reply-To: <20260925162454.1403405-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925162454.1403405-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925162454.1403405-5-avagin@google.com>
Subject: [PATCH 4/7] x86/fpu: Document reasoning of FX-only fallback
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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

