Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438426;
	b=jJCIsY7OMMRvbSGEW3X0XgYW3SXXSCpuIXL1M/SImKxlE72HnHG4KPakDUTZ9l+s3jP5
	 N4wjkEkBDe2w1Iz5nFXdbqWfSH9cCohDT2uLZbeUqOHPzzmie/bucTI/czOndxqAt1gAa
	 OswSFcf3giKtZwdg6dg3S+KZbWmpEAyvFBdbjLZQZi/TdI8i+gt5gLA0BM1816V6vZxEq
	 LHuqEjK/iOvCS5vFpoD6o5uwP0zq3gV6Y7MU66nDp9mBgHADTVkOoV3aeJJTtxnZZu7Bc
	 bD+vTZbj6Ds/M5IePOqaADVR6s4aS3fbfnF/TXcNY8Unxq6F1Rcc7jAdGfPoxPVnYfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438426;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject;
	bh=vfT550zNU4A4okyL7vnPMnRd07C2EmpkyAwsgtV7xPE=;
	b=Fd7+wb4j3x1XjEilfHJ3GuKbC0BclVUTjTVth3Vmf+LJ+er3EvaFddixiT8Rqg8BYW8x
	 sTA6Bw+bur0+KaxLq/rkjhz5u6nfOhhFQdzYJ22Wo70t6s94TPrwV2K/00NFj3FlB+vgJ
	 ies9H0zV9nP4kbozPmj3C9G7wxBZ+++ZutL5NHFixaYB9ECOEVOsYjuACYGbAIRe7qc8k
	 +WwGy3E7n4p/JB2Py2N+08SGFX5nRvjVCLcOY21DJc6uzeeffs2+SPPeFM4VesIk1SsFc
	 Zj4M828fGRPaG568Qyfszvgp35cJOdOCw2hj+EB9FyWlmyTY5akNU7igvAb4V4qGtLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ut6Hh2lX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EAA606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ut6Hh2lX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF9B1F000C4;
	Mon, 19 Oct 2026 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792438425;
	bh=vfT550zNU4A4okyL7vnPMnRd07C2EmpkyAwsgtV7xPE=;
	h=Date:From:To:Cc:Subject;
	b=Ut6Hh2lXHGMbKD4ARgTi/oAgvB2fqUJNUIKY9mxzbfyBhSOsRUWIN9BHvev+VhetT
	 2pVpUz/fDCCuVnlu4jXGKZNCrSaYWNUOYqasKDlpQbVx9ouSKTIDUCcX71GgK8vAI6
	 7EzuNc2up+AktDhXX0rsdW/J9UiYe7c11oBqnvkIyHRBd6+WK/jl/S/FFihmeGyD97
	 fPRHPAbiHYRnkqo1ZGUL+VmPMStHWJINGMdXVP23OgCcoZ8ir1EeTk50ULUgKRO8jK
	 QvJWLmUE2DK9l/LO9vwBXrKWfZBEz3hOYtc03PZTWZbBUd1mfDvF4O3XHImmsMFjS0
	 7Dsl+GOw42lOg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIt7B-00000001edy-0AWA;
	Mon, 19 Oct 2026 15:33:45 -0400
Message-ID: <20261019193330.365764549@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:33:30 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 0/5] ring-buffer: Updates for 7.4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
ring-buffer/for-next

Head SHA1: 453d0f47b174cac387af48d303c503b84f82212e


David Carlier (1):
      ring-buffer: Take cpus_read_lock() when changing the subbuf order

Steven Rostedt (1):
      ring-buffer: Add a MAINTAINERS category specific for the tracing ring-buffer

Vincent Donnefort (3):
      ring-buffer: Unify ring buffer minimum page calculations
      ring-buffer: Clean up resize_disabled checks
      ring-buffer: Remove unnecessary cpumask_test_cpu

----
 MAINTAINERS                       |  16 ++++++
 include/linux/ring_buffer.h       |   9 +++-
 kernel/trace/ring_buffer.c        | 102 ++++++++++++++++----------------------
 kernel/trace/simple_ring_buffer.c |   4 +-
 4 files changed, 68 insertions(+), 63 deletions(-)
