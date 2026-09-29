Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643632FD69D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724387; cv=none; b=loEjDN9DkgQYdRy41R3mOxOeYTsnmnK7U9Rl3Ev75mb24bPhPy/h/PaDdFm1isk/wMdLZ1eQtZQeO9rr8r+4Fl3a+GXpp/j9ONBf94tAQJry74+CjrMGrBEo9BPKoVCUMAN6TmZklsXFgChjfttBaOs0AfuAb7Paejuw7PeipgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724387; c=relaxed/simple;
	bh=tSh75QPcfog1DneI/ac3y54u2JUwSin9wbd+ya/11xQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ARGXdOA+bDnWeuxJIhgitvVqfMmGWbsk9LykgwWcXsN+lpvnUsaakwWIwzZeQ4uoW1qSrqKpxzw80meTWPGHQnCgxYrYsUWX2y2CX9I1nZ4LKx/YrXUBVj38XIXkA9uWA2pkbULS7KY72sQ0B4bhYdYxcq7kR+Gc3nv48Y4bplg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+7HkKIL; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+7HkKIL"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so2255143b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790724385; x=1791329185; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=st0YkXN12FtAQZuzndZdHnlJpw+XRRoOUg1nK/46Ke8=;
        b=S+7HkKIL1Tmt3JPQnfxuVI1SARLNXpL2t3s5+hinIXVAoe5pj8j+cosYYlopuclAjW
         J0WIGwK40IutqVqnyVuI9Vc0f1wo2Cqjz8umqYkEwO6hzak0ARzWJrXKIf037tHrEfjZ
         wndwd1TSEjpc4FRRRjc2EQQRv+LciHf19uuz6xiDCsg9B2ZuP7lSiCqRCcysr9TrMbta
         vQGTDxk3Sg7IRL6pmBZ8xcnU5z9Se+d+K2U1mWASGOPBJzTAOIez1pwyCRu/fG8OctI4
         07aP1ITNZG+DeQx5v+qT7i9QM9uBCbpg6GzZwKZLrX2Le7wP70c5YRQtdjMhBB6z+xsB
         9Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790724385; x=1791329185;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st0YkXN12FtAQZuzndZdHnlJpw+XRRoOUg1nK/46Ke8=;
        b=rhUoAMF+x3yLgYiSZYLg577w5930S3YgMRsKEhmn/gW9jdUk1Kg+ksRXrpWN8njohN
         2yddZ8Ax1h7LHwvzWeqJm+QyvJSPkHdNga1EbjKs2nm3I+2LVcpaYnLXeaE0EpRNUODV
         +3rVIPpkNY0lnnAhqR5aVahb3+UVek7bKxAo2CxJXxmxkgwBuBwzHRaASh85LC5m+s2v
         mF4aWBcL9atJPX3PBPvw/IwE6UD7f+GTLAi9ghZB7gK0VfWRXKW60tu/5rAMqMSpk6q8
         dQm/P9CYJovrAKexIl7jvjy/ClCmhMW6J9qoGbluk4l5e97ogYRugKhN5asRpxoca5CM
         u6wQ==
X-Gm-Message-State: AFuF++m33RnTNn/nNRHB4em5uDI71yupZ1YvKfuPXrLgM6RbE4WSFwRU
	lBn31g4KFPyMOkpjT56Qr57TpeloJIjfO0BApmSMyU4yOEFMj0NTVS9t1b7wkpHpJjQt4TPtlqk
	igLkZfg==
X-Received: from iobr11.prod.google.com ([2002:a05:6602:a18b:b0:9c7:32fe:9e50])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:6903:b0:4b3:7baa:f944
 with SMTP id 5614622812f47-4edd2756f15mr2883096b6e.2.1790724384916; Tue, 29
 Sep 2026 16:26:24 -0700 (PDT)
Date: Tue, 29 Sep 2026 23:26:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929232621.3745312-1-avagin@google.com>
Subject: [PATCH 0/2] x86/fpu: Allow restoring signal frames with larger xstate_size
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

When a process is checkpointed on one machine and restored on another
(e.g., via CRIU during container/process migration), any signal frame on
its stack carries the xstate layout of the source CPU.

Commit fd14edd82077 ("x86/fpu: Pre-fault only required size of xstate
buffer") enabled restoring signal frames created on CPUs with a smaller
xstate_size than the destination host's default. However,
check_xstate_in_sigframe() still enforces that a signal frame's
xstate_size must not exceed the current task's fpstate->user_size.

This restriction prevents migrating a process from a CPU with more
enabled xstate features to a CPU with fewer features, even when the
process has not actively used any of the unsupported features. Because
the actual set of active features is recorded in the XSAVE header
(XSTATE_BV) and validated during restoration, a larger xstate_size is
safe to restore as long as all active features are present in the
intersection of frame and task features and the buffer is large enough
for them.

Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>

Andrei Vagin (2):
  x86/fpu: Allow restoring signal frames with larger xstate_size
  selftests/x86: Check restoring FPU state with larger xstate_size

 Documentation/arch/x86/xstate.rst                  |  10 +-
 arch/x86/kernel/fpu/signal.c                       |  31 +++++-
 .../selftests/x86/sigframe_fpu_portability.c       | 118 +++++++++++++++++++--
 3 files changed, 143 insertions(+), 16 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog

