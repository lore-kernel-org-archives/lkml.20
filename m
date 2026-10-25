Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792925926;
	b=yyIZla6fUR25yCYlCIbgtQNiLPXWT26R0dkjsx6genwi+2FmfFClY/kSDO7T9aBNmfjy
	 OhRJbRSjNC5c6TViHVzfLOrFrnM8/qStakKndgVH6aapSD2osSe+wzP6Y0Kbop3cRm3Z1
	 wUQ2LCWZ74xr/JY+UErAiMDFO9PeW7kh6siDtr6xJ6q+F8F386ML3jWZaHlEOCSDlgJL4
	 7kEKZMTcjenDXgTocEw3tr4PKbnmxIm4z9Iiv73gGaRhct4ZJHo16Jo5NxHS3PBsHBhkG
	 m+b23ghXcNLRLtgfOCASQy+iy+gNC9GsDubx1ZHY1u17eFPvEMRG0wkWZQQznOh6lFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925926;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=db1mmnank3Xym1aGR6v+tjEq8gwm8e0mR+02QRZlme0=;
	b=wmNM16e4gHIE4ITwwIKtdz106ldbSvnPem2UyeODNmR5prmbadXgQZlyGNV6qhR8pFym
	 4QdPZVOqx/fSYGGxmWsF0ArCu6GXJzJlrd8TjmkHOQbikZcLuY4QOivD+ztQ+qzAWq29J
	 OUQ66AbuAQ9x8PC2h3SF49CyY/xlqsAJauiv8WglnF+QYjAv0/+/eJJwHSS8XaUj3scGR
	 4xdi6uyEFuXuFFm51hzCQr6Khrzd2LkqfM0vzVoZsGUuY7TXZMrZ1/1kbRppEzOarjIpr
	 Fh1TQre99QLjDduUNH+FW/Q9fJFRd0ltsINahcIH+KlcGrD6tiqnBl7KPjSH30gqbzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ldvwzRgD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F41606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ldvwzRgD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310011F01825;
	Sun, 25 Oct 2026 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792925926;
	bh=db1mmnank3Xym1aGR6v+tjEq8gwm8e0mR+02QRZlme0=;
	h=Date:From:To:Cc:Subject;
	b=ldvwzRgD/jFrIST4Jmv4BPPlOHZXyVYQ0ofd8SFlaCYZrEcr0WqOxTRWL08+T2Ihj
	 qJC7S1FmaVmDhAH3PGkGOsACU7po+0E69nH7X3EZqpKhSQUIj61WKmhr/vZ3j1aVz7
	 YseVQ4K7LBTVlMGCCLTQMnl3m7Gtp7jMMu9lZ2OvmqSz0pht6D8FVzxoMtGXGZi1WJ
	 pBpumrFeHUqogJ0ujEWj11a2jvqxD6b9stBjJbw7yfqU9KqnQdvOSWuuESIvNI9xEp
	 PI2ylipvETqNHc0aE5lkuDfshBSp1/Xq08wiKqtVKZdKJeLiyh2kVh4BMfGR72cdeN
	 UoeWZPw2MdTFA==
Date: Sun, 25 Oct 2026 11:58:42 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [GIT PULL] IRQ fix
Message-ID: <at3g4uWEWnlXotjx@gmail.com>
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

Please pull the latest irq/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-10-25

for you to fetch changes up to 717862eac6eff0eea8ac30a0c0de0bed84922aab:

 - Fix possible hang in machine_kexec_mask_interrupts(),
   which incorrectly assumes that irq_set_irqchip_state()
   will always be able to complete in a kexec crash path,
   triggered on RK3399 embedded boards (Igor Velkov)

 Thanks,

	Ingo

------------------>
Igor Velkov (1):
      genirq/kexec: Do not take the bus lock of an interrupt chip on the crash path


 kernel/irq/internals.h |  1 +
 kernel/irq/kexec.c     |  2 +-
 kernel/irq/manage.c    | 43 ++++++++++++++++++++++++-------------------
 3 files changed, 26 insertions(+), 20 deletions(-)
