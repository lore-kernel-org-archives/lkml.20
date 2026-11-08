Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128614;
	b=ueh4EacZmDgvCLZ/qBLEghJ6rwuzxRaMPXE/kb+GWZmtYdRExem0YibYAXHYWk0+Hvzb
	 oNbClMCVhGb8QG8+9qR/16sSFutMMyS9xEjxLv54C/RDIDSMUEYJT6mJofFIm7s4jpF8F
	 aC7IDqBm265gN1TgEQn//bmz2v+/rCY6ZpD30wY40IxnAEJg+0WyCZTCEGkYpN0KJVV6W
	 Sd0JsZLxNCzLGToTcDkr2baVVe3XntImSQESlwYu5pmpAm7N9r/qqd2rnbddmwJqiynwb
	 ywsvEBdw6Sqhgd136JarrtgviuwvcQ7sKceJlhCpalCZdMgj6gxVSUo0I07Txgde5FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128614;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=SlT2n7szEhKvbma7DJBIqVoTN8aiLcil/8Sd5gnRgHM=;
	b=jtUiy0uglhiFzW0UH/A5EwkMVIGwtjZ/2PYdIIMoS91o/pOo1BiAaw62AD/DxPNWs73E
	 c/eC5AXqqfrd1LnBLLS6Bd009GFzYdklVx6Ya91L7ascCaxcL9QuZyjeUO5AhhwrQ/Vsp
	 uf87MeJDN/QTBTJZIZvUGIwYCVcDIO4ui4iumiIr550mAHveYURW4z4xQMuu31tJVwgWX
	 3ka2JlNz9TejOCrdEkrRyvt3M/eIAF53CbBEjFi88p5DCosx/FHJ6AmsYLo9xb95eruSg
	 xFQ8gAY3xIhEzWelD6OHKJnAfV68rpVy2oObWgu1cr/sb45DdgdwuMb6p+KUrUvC26A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmy9Wbvi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EFF606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmy9Wbvi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB7E1F0089F;
	Sun,  8 Nov 2026 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128614;
	bh=SlT2n7szEhKvbma7DJBIqVoTN8aiLcil/8Sd5gnRgHM=;
	h=Date:From:To:Cc:Subject;
	b=bmy9Wbvi86OEMhnnYTeUhhBY5CK86tmXRStuc2X/jvB/WB7TznaWISkB9KmeeUYno
	 Z1HWXS7lM44FPHkmKhfJIoXFhXVVGWemjIi6lcN9QQJrEaTK6KwoZrbEUDmW/u+lur
	 p6pyb+wBez+Q9+nZSqpceBWzmC9H4Qd5X2fvkUi8zrZBDXOztPhG4GehrUnz6YLLuX
	 FNnrFc4FTZJoSeEh788/wfUsj2diPBgnlZrZZ6w+RXvBLYVMRiL4/kKdqSFjn/oKJl
	 uwYQfJ7zCg31TQHmFZhFIrk/e3Yc1dcGvhHkO8ioI4uLHKHh2S5Tmzm4TQm01CNn7e
	 skjPR9RIyvGXA==
Date: Sun, 8 Nov 2026 10:03:29 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] locking fixes
Message-ID: <avA64Rq3KFJw2g5L@gmail.com>
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

Please pull the latest locking/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-11-08

for you to fetch changes up to 408b129aac48b574c0c9d11137a89eefba825d5d:

Locking fixes:

 - Fix lockdep message output (Zhuangzhuang Wang)

 - Fix OSQ memory ordering bugs, one of which can cause
   unlink queue corruption (Peter Zijlstra)

 Thanks,

	Ingo

------------------>
Peter Zijlstra (2):
      locking/osq: Switch osq_wait_next()/atomic_cmpxchg() ordering
      locking/osq: Fix unlink queue corruption

Zhuangzhuang Wang (1):
      locking/lockdep: Fix inverted "on"/"last" CPU label in lockdep_print_held_locks()


 kernel/locking/lockdep.c  |  2 +-
 kernel/locking/osq_lock.c | 62 +++++++++++++++++++++++++++++++++++------------
 2 files changed, 47 insertions(+), 17 deletions(-)
