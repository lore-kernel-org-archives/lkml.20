Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926724;
	b=uPyB7SIaMfURft9zbc2TdqQl+V6JSVMb4r17DCetxGibXPdTBbW2BjGekT+UNFrmdIXB
	 NDceHkHxWT2VUlQsPXn592oXgfhjUYRPUA/5wya7PXC+hzXiO/RAkEFB7hMarkPU0bqeE
	 hNjmNMSy9Sna2euevMiNwZxkesO/OlBy1h8H5dHS7IABTr1OlPSvhz/46gEg99iMYeKmh
	 U/f02LyFUY8lcH8RVJwcAAS7hPSmFOPNP95j8FiGUqetZGdR1aRPp5iEo54Wr1eVtrD9w
	 UGTGgjKlgFcfC5qE1PfJpOvpzRkwVzPMZXBgEyAMvXh3GuCHijbPuesFjTRjil4B7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926724;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=mSw79jUysXOrBwkWCDPz1TFYgyn1Z/M1JS1NsApbVo0=;
	b=H+lCBfrvYF7NysCjlZ9E3flnJdXdDOFaukeIplfD+uivDAZGVRpyxot7Z8F0Tksuds0C
	 OXdGpJjunQe0BaLapp3sLoVnSmF1TPQCwWu+dO1xU73afHEn1eaEhb5uNHJ1gKiERhLBI
	 CR1xbKZ6fu9IVIdDNsPOJSPg5XMzOVXn7GH1r0LnenjpAS2pSSjytPGUArHfdnXQpeTDZ
	 hc9SfVnhV1DSexYWurix+gGXxUgDeI3Sp5HiBgNe1yUhxPaFfUgSmyVIpn9dUsHausjvH
	 rOHt6NkadGzOsDDHhZyZrCZWxSYQBAR37dkXah51hl1Z7IhCgqawAQjO8fFtZrYykBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlV9XmWP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A19606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlV9XmWP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202431F01825;
	Sun, 25 Oct 2026 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792926724;
	bh=mSw79jUysXOrBwkWCDPz1TFYgyn1Z/M1JS1NsApbVo0=;
	h=Date:From:To:Cc:Subject;
	b=SlV9XmWPeKrso5UlaCawanh4CTOmfBquv5XMn2PFODQ8NJ+TjlQcfDSMMH24xFMXq
	 a0xKZz3/ivqebZpq0Q6TSXhfevHze19bSrPr8MXzDPP8YtUOGFNW4GjxKMqnbACKcr
	 uAVUdNYfo0BbagF3o4vvkOezM7dHt4huGTDVAYE7uaxoNNT0POFJX5mH2CxnBZhUrC
	 ovoXA2NcWj+5VcjJb0a+WQWC6nj0Kv/5NJbr+zv5IxE1rGXWC7Ae2vOWY34osO325p
	 9MrlqoHPYYFuDPBrRvmvhSTxKNGPjU/ZjsKKok4YY9FXbzEBeQ/2fsTmuQUmAufjFb
	 imcA9RWUGDZxQ==
Date: Sun, 25 Oct 2026 12:11:59 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <at3j_7MnLGPhhHDJ@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-25

for you to fetch changes up to d095321349222961813333277881b3c74f10b17b:

Perf events fixes:

 - Fix Alpha build failure caused by a semantic conflict
   between perf and arch-alpha changes (Thomas Weiﬂschuh)

 - Fix UAF in attach_task_ctx_data() (Lee Jia Jie)

 - Fix perf_remove_from_context() event scheduling (Peter Zijlstra)

 Thanks,

	Ingo

------------------>
Lee Jia Jie (1):
      perf: Fix UAF in attach_task_ctx_data()

Peter Zijlstra (1):
      perf: Fix perf_remove_from_context() event scheduling

Thomas Weiﬂschuh (1):
      alpha: add simd_enabled argument to perf_reg_validate()


 arch/alpha/kernel/perf_regs.c |  2 +-
 kernel/events/core.c          | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
