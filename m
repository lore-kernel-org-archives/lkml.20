Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745513;
	b=BEEweSX+caNKKMkSAVR4RTPfanpVCYuTzAjzp+Zz0t2j0wPqvlNUvGEo+5ZNNJVPDO5c
	 uAIWbExEiFNipnB8OfwlL0zzluVlg8xo/LtvbDMDEUjALX27t2bSXkYhT5H87DljDZpKr
	 dTLxa7ja+sNRXWE9kCj6XERKXvHO5N3OG40qwB/r4DRlNw4CopT8Cg2y/S2mXmnHvT6fa
	 ZFwSzectTMvM2TVVPq+/CnEMQMpmb9WtkEEJysx2r0WT3nz32wopiFXqSfiJGAbWO0z1I
	 sToVi8XRBIskYH7VYttVbg0qgz/ZIyHUvVp4F+YQ+X65d/mfopxV2nIMNo4cn1j5+HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745513;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=9HeskdcG7Un6yCiHUzi7BHY3MFpWmuc9oiKlAOeseIc=;
	b=Mx+G8XkEX+0wIYyh/FMuXr4cRur0DGtqjpM9oTbRGXTjGqmY0ubvYkMLJfDlLIz8qudx
	 llmBktlf4hO4iG+3Egui9vDeBt7PHL/zxvXkAya5hrCOXnRV6SUVf5hvHOjlseTlAVqdC
	 e9Gr1BAwcSCA10wpEDQVPHaLq2xYX/N6CNX0pEJjrffsgAN6Z7D1LjAzqngD8UFk2QDW8
	 6CKRAHRdfW8Pib+5cQVFPvsxrkOEpbvKI+TcKG0Cd5T6jOBtYyYZF4AU0GKrE/J+12Uo3
	 gUZvViGzkuH5nBMIT/TWJYT2A+c8Xwv7pDARscE7DORxmXevUQ9HEz0955/twH2DJhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSklVWFf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919F606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSklVWFf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100671F000C4;
	Sun, 15 Nov 2026 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794745512;
	bh=9HeskdcG7Un6yCiHUzi7BHY3MFpWmuc9oiKlAOeseIc=;
	h=Date:From:To:Cc:Subject;
	b=XSklVWFfH8AZnfYvsieergye5ig8PhXUto2+jH0Cgo5c8uPzfvOC1oXWsOauLP7Z6
	 cGGRUiCqbGNlG8TVFhNs0vOaFBaYMi4g9SfogduCTCama6qjr8hgMdE316h1iC4hHp
	 jZ7eau6iHRdThkCI7CuEk8luAcl5vkzBi+KpJsagRgDr93AAj5eM2mYJlLGDR6i76H
	 /iJAna2idEBubdG1nmnU9QXyN3f6hKtIz53CBSpgI1ay2KZD9pU/C0kIuAYZ5EyOCI
	 A3AqJ3F/Y+gnVn0fdQaJ1iOnhIJRg28RkjxLquFhVTlh1hLAsgCB1AQgypStLLkMxA
	 2+cSjuMCeUoHQ==
Date: Sun, 15 Nov 2026 13:25:08 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [GIT PULL] timer subsystem fixes
Message-ID: <avmkpJ0D0IiQEFqP@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-11-15

for you to fetch changes up to c1b96ba87e3caaa701d6dba254e58db7cc3c99be:

Timer fixes:

 - Add VDSO_UNALIGNED_PACKED config option for targets without efficient
   unaligned memory accesses (such as ARMv5), and turn it on for
   !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS platforms. Propagate these
   changes into tooling headers as well. (Ian Rogers)

 - Read getboottime64() offsets under the tk_core.seq sequence counter
   (Hungyu Lin)

 - Keep tsacct task begin times stable across suspend (Hungyu Lin)

 - Reject cross timestamps for invalid AUX clocks (Avi Weiss)

 - Refresh auxiliary timekeeper base before offset validation
   (Avi Weiss)

 Thanks,

	Ingo

------------------>
Avi Weiss (2):
      timekeeping: Reject cross timestamps for invalid AUX clocks
      timekeeping: Refresh auxiliary base before offset validation

Hungyu Lin (2):
      timekeeping: Read getboottime64() offsets under the sequence counter
      tsacct: Keep task begin times stable across suspend

Ian Rogers (2):
      vdso: Add VDSO_UNALIGNED_PACKED config option
      tools headers: Update the vdso/unaligned.h copy with the kernel sources


 include/vdso/unaligned.h       | 16 ++++++++++++++++
 kernel/time/timekeeping.c      | 12 +++++++++++-
 kernel/tsacct.c                | 10 ++++++----
 lib/vdso/Kconfig               | 10 ++++++++++
 tools/include/vdso/unaligned.h | 16 ++++++++++++++++
 5 files changed, 59 insertions(+), 5 deletions(-)
