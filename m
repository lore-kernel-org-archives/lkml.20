Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50544AEBFE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441635; cv=none; b=t+DZN0WheC9SAb3k41ViaXs2wQjyGjawUYvcouzbTLWi5rQdWRiaP67L8saJJTfH6k6L64x8Pu91099o2MOc1kU1dbXV7ZPhs4HVeMyTieLU6w5NlP/nZxgQ7KNOW820O1EtIKZ8F50LkQDarWHZ8vdD7g/jjSIreMq2uITLW1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441635; c=relaxed/simple;
	bh=QsXLGCKPGHsqeuuksVi+d85aa1e7GXd7VarnEp1TSdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWAgNt3CONFEJ4Mznp6RiFQNRAeumXFZYc9CdaTwZLPiRbWDPAIzzA+JlwhAU+R2Zrypj/xEuJbW69kNC6aoUhgu0SsNzPl/zxqmQ3ARCK3y1aDfkwhqpqITbEgbcxMVPB8+J1ifdKHpY6yuJ9UPTnK5PXYlF2+Jd2gSEwDHLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ2CIFbh; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ2CIFbh"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2974236a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441625; x=1789046425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsXLGCKPGHsqeuuksVi+d85aa1e7GXd7VarnEp1TSdk=;
        b=CZ2CIFbhR50yg6dwaPIuUAQjIhs04P1O3IOQKqgIFjKXHmt0JBPZWwqvXoPONtlYcC
         YlM4R83ZJ1/m+itGIG++82I2cXUaXI+OekmPXXTdQnSLBWg+GztVzPqMWx/NqecsvfEg
         Q1cep53BqWnQJTYf15wU9rf3PhHstVivCK0QwV2X2UeCXMl0K4v6hREGsr3jSjJtmlPJ
         fxZM0sDCC8dPvFtoPxHysgEDWV9jOEwzIr/1Sus18AXki58MUuT1mc9KS7S+PqLpanhD
         gN+RDQDjuNZlUn/fvxTwnBYdD6T1QyZCZTKNk95OrL3eVHkxdsSbDUae3ZEJ5GfixP2V
         y4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441625; x=1789046425;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsXLGCKPGHsqeuuksVi+d85aa1e7GXd7VarnEp1TSdk=;
        b=LRhoenlzmHkiP3Cf+zXh3g0PSJncfddlXKBBEsaAsVrMNjAdWBMQRzbz5+6udoQJB8
         CTSsfXaPuM0oMuKuHFwDTchM4i0kErmzpvLuj8wmnEFrGhnjNbOoF/kGDIpNPX7lmsZc
         DzOMn85tTlZagudfCtRKS2AeooiL3nDJbsBqv4Dlib/xUtYRLicDBgdKIXoskRrYaN1N
         gzRcqvN4zsr9jQNgOfPcbE7AhgQvc8Ctj/vaZzz2NA/RXkBsRhTzYnBmTEtS6BEhOZIX
         8rgJces2Xoahx9XM6YB2ccTXcVD09/hReSzR/Yqcrd4/LavZLuuMPWJkzfLKI/ER8AB/
         GTeg==
X-Forwarded-Encrypted: i=1; AKwUvBx/nRdACUiA9Ne1umDZ3ocS26dCJHytZjMCjY0pyQtvWoRvuiRFJIv9ymToV80CA19nxoYSLuNyC+OK+KA=@vger.kernel.org
X-Gm-Message-State: AFuF++ldB2AOQWcFwFnqBVVQMrbX2GWgPmrFHfwWhfOnTBytrmrKI1hc
	7GWVjuSnP18F6p3keKWCwu8sfq3pD5bb+IYTGehTcz7JQIe73EgdLLqDhFYC8A==
X-Gm-Gg: AYBFou1/nGZaEgVhm2d2A1DhLNN5+TNezV457uknoBytQM2ZXI1QEmrnILo/umXG52a
	0ds2wj0/tZFakn6anexkCI/Y3LZsU5k9VpPZ/huFHuD3HL+ABsCFkhDYaGzs2sHfUYBZe7t0Ryt
	8YduoAvYBCktzb63t6PKMwXMzi9NtMb6IWElN3ZYIsnTbHZ0k1kdIa49FLPd5btey9B6xuZCs3a
	YSIj3UXU5Idi5CHl4zFXigbDLQC8/oksJBty0e+IMDRJxe3Nxftm5loF+U95VITO7qFTPBgSMwD
	HLz8mKJilYvoPD0IwYFFIXo56zkvVR8XZ9bp3mrxgotK7CVs8RGkmIU0+CYRK2uXNUy59LVmUFm
	czztTNfdIfOVykeXiHgmt7aFWuF3TBiaJxN43C1D2k6aOryxD7UlEIDkwMlsHK7wG2HxOoKI4Kb
	IAlYunItf25F3wBnLafAiw2wdpzicykx5wNy43CzOF19J50bHIq4xpUa7By5vUKv/EpUYTJ3rfl
	YXGLGjGtpFvkcg=
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr17916381a91.18.1788441624461;
        Thu, 03 Sep 2026 06:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:d43b:6dcd:a4e9:1d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae902354asm2702545a91.2.2026.09.03.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:20:23 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v5 1/3] trace: add lock-free stackmap for stack trace deduplication
Date: Thu,  3 Sep 2026 21:19:46 +0800
Message-Id: <20260903131946.239190-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902065744.DFA1E1F000E9@smtp.kernel.org>
References: <20260902064242.28606-1-lipengfei28@xiaomi.com> <20260902064242.28606-2-lipengfei28@xiaomi.com> <20260902065744.DFA1E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 06:57:44 +0000 sashiko-bot@kernel.org wrote:
> Is there a missing check here? It looks like ftrace_stackmap_reset() omits
> the tracing state verification entirely

> Should tracing_reset_all_cpus() be called before this memset?

Both observations are correct about the mismatch, but the code is the
side that is right. The stale part is the commit message.

The intended semantics, following Steven's feedback on the v4 thread
(https://lore.kernel.org/all/20260821235129.078dd489@fedora/), is
map-only reset: reset may run while tracing is active, and it does not
clear the ring buffer. So neither the tracer_tracing_is_on() check nor
the tracing_reset_all_cpus() call belongs in ftrace_stackmap_reset()
anymore. The v5 commit message still described the older, stricter
design that had already been dropped from the code.

On the resolution question: a trace can indeed still contain
<stack_id N> records after a reset. Such an id either no longer
resolves, or resolves to an unrelated stack once the slot is reused.
That is misleading userspace output rather than kernel corruption -
reset frees nothing and only clears storage the map still owns. The
guidance is to read the trace out before resetting if existing ids
must stay meaningful.

Fixed in v6: the commit message now describes map-only reset, and both
the kernel-doc and Documentation/trace/ftrace-stackmap.rst spell out
the id-reuse consequence.

Pengfei
