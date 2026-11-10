Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349124;
	b=RI7w85FC4Xi6UmMTvZOlr0kT/TUjYOq/tqi1aoh3AjvDYbXigk4N0Fr/Lx/6XT5dq+FK
	 SRrkZzksg9pLq+Sg7cSuuNipWI0NSaimUqL6MbQJBQgJ+mprH3RZjFXAV3PEezWtzsJvS
	 fPxcMtuquN6N+Wo11q00puJ1GDNKKUJ0YVk+z0aK+6GMLOn0NYtQb2AZ2yM79X3q37GZ3
	 5l9ZbAzNJyhGiz4999YyuqqEzlqJPoJcQmXlqoVbgdPq15KMM0K074WqBkdVT8fLKah58
	 1ihBUqyoKrE4PAg10qONBhbiHl+3nPT1bIYWkV6eu0GRjctvON0Ba9cXM+a6lwpWlsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349124;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fDbH24IqyXGeJwrHjekd3y0pkWs6pa3ajDlC4H0B9Rs=;
	b=xm44Kj+e6tEswoj5B6jalyltvyF0EssSoetMICWZ6ZbgYjespQ0o2J4RiI6L23wUW0CT
	 clkQVwogtgIFDfnkoXM39jUBluDIjJZMxx88GPJKp5i+123R97P1uSIErut55ftINcgYf
	 LXGm/VIPUsaTZSxc5rs2AUS68QfNCJ2aXQgRdr1h8ND0FgXovUBctf9aH+zL4rGh3WSyr
	 BcxGXJ0RCuZV/1xfpUivWCzKxRmlFoqQ0GDqwGeB4G6V93PrjPjFM0qV/2CdCbZnsxFaC
	 1ZwGye45CIcOD4Lj0AQNRwPPCp2fKXLoUy1I8lfdp9A+WPMzTFot4v+RQNvtwGHGsbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KATnxScb;
	arc=none smtp.remote-ip=95.215.58.174
Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15EE606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15EE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KATnxScb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ucW0CbkgsYickmF4J+LbDhp0k/VR5j5+Ym5RT6WHGS0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794349121; v=1; x=1794953921;
 b=KATnxScbwb64vWmiiVtuCVXVGjDEVGbtOnd1iqIBXx5KJnfO9Nb2ZxFJWUwTE+Hrs5AEsKsz
 yvZnA0NemMEkt04T/1BB5QczwompSqODfu9lYqlkfYdD18QVO8OuW1fqx+vivQ2Cfce1t8fSzha
 5xT7yCctpxAYjRm1CitCAV7o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 53003b696ba808b5;
	Tue, 10 Nov 2026 22:18:41 +0000
X-Mizu-Trace-ID: 53003b696ba808b5
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bradley.morgan@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 1/2] arm64/fpsimd: signal: Require ZA context when restoring ZT context
Date: Tue, 10 Nov 2026 22:18:35 +0000
Message-ID: <20261110221836.3265929-2-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110221836.3265929-1-bradley.morgan@linux.dev>
References: <20261110221836.3265929-1-bradley.morgan@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When restoring the signal frame, restore_zt_context() checks whether ZA
is enabled via thread_za_enabled(&current->thread). However, if user.za
is omitted from the signal frame, restore_za_context() is skipped entirely.
If the signal handler touched SME prior to rt_sigreturn(), ZA remains
enabled in current->thread.svcr from the handler context, causing
thread_za_enabled() to succeed and restore_zt_context() to write userspace
ZT data without restoring ZA state.

Require user->za to be present in the signal frame before restoring ZT.

Fixes: ee072cf70804 ("arm64/sme: Implement signal handling for ZT")
Cc: stable@vger.kernel.org
Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
 arch/arm64/kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 6a06a4e352b1d..20d5f19921e0d 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -678,7 +678,7 @@ static int restore_zt_context(struct user_ctxs *user)
 	u16 nregs;
 
 	/* ZA must be restored first for this check to be valid */
-	if (!thread_za_enabled(&current->thread))
+	if (!user->za || !thread_za_enabled(&current->thread))
 		return -EINVAL;
 
 	if (user->zt_size != ZT_SIG_CONTEXT_SIZE(1))
-- 
2.53.0

