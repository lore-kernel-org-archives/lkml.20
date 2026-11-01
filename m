Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515446;
	b=02x+XiwlaRWrkbU3DyrbOvuk3VIQcSMX7oyhEtocWWwpRTGIgxMab5BnRIg3mf37NZ2N
	 ZXppjcCu3/HWFVyVQecHwFWCv+UawOiXZViKKeHLgubtm24YcT7Ji9Sir36YQfKvCirbr
	 S6aG2SFKi4RWbXRpaKduC6p/s76xk+Pkv5RB4xSRkQgfe1riGhJZnLJ8Ilsz13YgCEM75
	 hvgfu7E5mlu1CH+uU4T66UXoqjHd+hJGBGmXHKBXl3i+xghZ9mYaSrk8EIvRbKSrrOKYM
	 wLO7+mSc1f/w3DEROLeW5br0Po1SxOPBKHbkOc6Rz4KCyrEdcfZrxRMwLk76eCiKq6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515446;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=tULtDvsqbQkmIZLnm71HOJUJPE8EY9Pb/xOq+UlPXwg=;
	b=YtGfRjwX22RfeNgDd+FX4GTjoCEsWSuaiLgQLfhGNRVlC6kv4x4PUmvIJr83u+S6IF/T
	 HVn7a4MENENjtb8q1Ys4WAweLpG2EXuZ8B7U3erpXm5dRBwWJDtBu6DJfrsvLKmevyNnj
	 PCZyEKSZFXrCkNQuuJyZIM6NkBPLJRM/8TdqI6ofCvvp+D11K1PpB6vHr5wAOriDr440p
	 F8R2P7m2OBRjOoaNMxEhA+QCLunRmRatBEuKewh5GZCuFpElEe1nSnKY7OXKdUkPD6tGg
	 pTPBxZiF8XSUdDEvArse2/QIZWbGSJ4DXu45yO7pNORT9Dl2d+ia+cWAOqS8tYCZRSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=It2+FhPL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7AD606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=It2+FhPL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C451F000C1;
	Sun,  1 Nov 2026 06:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793515445;
	bh=tULtDvsqbQkmIZLnm71HOJUJPE8EY9Pb/xOq+UlPXwg=;
	h=Date:From:To:Cc:Subject;
	b=It2+FhPL1eNdAH2JtrnVC1E1ZASuIdgIWtSzb8h4VCxcGMxcIJ8EURzOFHDh2Apq1
	 9OubYlzRmpdmnJZQD+pjyVvI/t6nXGjGdsSCHlpWaF2D4LOsjN+7BofRDQsQC6lFL3
	 MVbki/iomBAATfzTsv5TVf886tn/0o+ITavT1/jYb7r87fCZh5qi40vGvsyK/pRzKP
	 Qku+wF0Fnt/yuCsYpt99RXPiGOY/siBQ9kO5fyQ0m6YeUIcHL5ZySEQTi2QQXGzGKw
	 WpL59hFimc2Lpep32okB34d+QBlAKzEV7FqUhGWmvaPdoRS2dumf/yrsXlY7Tq2fzX
	 zZJ22bBAfVsEg==
Date: Sun, 1 Nov 2026 07:43:57 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [GIT PULL] IRQ fixes
Message-ID: <aubfrZ6hk_E4LW9E@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-11-01

for you to fetch changes up to 1c16bc2b1122f78f9d51c5785f7a78b36d44972b:

Misc irqchip fixes:

 - Fix the hardware IRQ-retrigger logic on the riscv-imsic
   irqchip driver (Avi Weiss)

 - Fix MSI descriptor leak in the irq-msi-lib irqchip driver
   (Avi Weiss)

 Thanks,

	Ingo

------------------>
Avi Weiss (2):
      irqchip/riscv-imsic: Report successful hardware retrigger
      irqchip/irq-msi-lib: Free wired MSI descriptors


 drivers/irqchip/irq-msi-lib.c              | 1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
