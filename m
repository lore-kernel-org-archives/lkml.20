Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870044;
	b=vSVV0OgM+7PnAIEvKB6AoMMyOWBMdBqe4F0YCZwouXMBhYfIa8/IXE/3YLKpJIGGNClt
	 Onj5ZroPp9YlpG00whUlugVG2YzQIQm6VnKNKtcIVTiXVqnbpipB2S9RCHhu5io5mVMQd
	 vItpLkyt2jc7WG1KXkAp26dGnuI9f+0ztvWijLe8+mb56GrcJyl2ejzMsQSgnt6YvJZQj
	 gdAMH17xp0+teMb6v63T+eFBM9UD55epqTNCRqxBvpgP/UJniPQqfY4k21xHae7QuAobC
	 f740EAbwbDqcCVIRGsPbzU6q+iNugybyE1Qj7cJERYNgYNubfoZ6sIO7TgQKCd8ac4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AGcX38VtmhBxU7pme9mGIrI0HCEeMFgy8ALNyHIS1BQ=;
	b=ENVr2wGlNok9puXuB511euw/1Q5Tq7fFgjyk24SB4Jr9ghB50xejBdD32mCej1p8vXOe
	 GnZp5uagORsYk+Pq5hTBflEUiPCWNPIIsr6PMHgKWU5YmuHXCk2Uaz94HlW/wEJZa157b
	 vqu0rAOYYhgjmYq7yageAY9uQEud+3vxf4N+KPwpEg40OvRed1QrBIC8k6shW4AbR+INL
	 C2+RFWPntAva9Y0Sa5OkkF5g/ODwd1ENURytDGApxOVlqTK2pB4Yfo2EIYiiZyptRRobB
	 q31loCC+PAraIvuS0bwntAQpgficJGmz6/C9ggAdNMwPMOQ1zaaFI2mKbjKt7+6V7hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=jhQ4ehWb;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6A606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=jhQ4ehWb
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jT3HV5MnRz1XLkrk;
	Mon, 16 Nov 2026 23:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1794870035; x=1797462036; bh=AGcX38VtmhBxU7pme9mGIrI0HCEeMFgy8AL
	NyHIS1BQ=; b=jhQ4ehWbfS13aLoD+AX77K7YJX4OJD9lr5ODOzKSosO0GaQ0mXH
	1UPty5P609y8odgjS8d6WEYtI5m1pqa5/6VIAr1OIe0kDaZkaISxEOofNLCFjzeK
	8oLeAYZUR611C15crZht5fuaIULUdEyQD24LefL0MvniEGVKC93A4UER5ij2wtET
	SgpWnz4zhwdNkPkipck5nVvJrPI+wr5KbHz/k3JNDX7RXuYGHi2qb5/59eHak1lA
	cphOkdFxnIjGpx7wXxPmsFMykgxbBt+nNsZOAAapEYnD3i5z/g/7r5oBPKW70l9f
	L8Pp96aJT3fzeiCGoUnKFRE7ZZkA+9xm3Bg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id edidkSGoa5eM; Mon, 16 Nov 2026 23:00:35 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jT3HR1mHGz1XM0nk;
	Mon, 16 Nov 2026 23:00:35 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH 0/3] Fix three Clang context analysis issues
Date: Mon, 16 Nov 2026 14:59:32 -0800
Message-ID: <cover.1794869902.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter and Marco,

This patch series includes three context analysis fixes:
- bit_spinlock: Surround the bitnum argument and macro expansion in
  __bitlock() with parentheses to avoid operator precedence issues.
- cleanup: Mark __free() helper functions generated by DEFINE_FREE() as
  __context_unsafe() because cleanup expressions that unlock trigger
  Clang thread-safety false positives.
- srcu: Move __srcu_read_lock_must_hold() out of
  srcu_dereference_check() and into srcu_dereference() and
  srcu_dereference_notrace() so update-side callers satisfying the
  lockdep condition do not fail context analysis.

Please consider this patch series for the next merge window.

Thanks,

Bart.

Changes compared to v2:
- Split out only the three standalone context analysis fixes (v2 patches
  1, 2, and 4) into this series.
- Dropped the lockdep and RCU assertion behavior changes (v2 patches
  8-14: lockdep_assume_*(), lockdep_assume_in_rcu_*(), and removing
  context assumptions from lockdep_assert_held*() and
  lockdep_assert_in_rcu_*()), as agreed in the review discussion [2].
- Dropped the preparatory __must_hold*() annotation patches (v2 patches
  5-7) and the tracing branch profiling Kconfig patch (v2 patch 3) from
  this series.
- Updated the commit message of "cleanup: Disable context analysis for
  __free() helpers" with concrete examples of __free() unlock helpers
  in response to review feedback.
- Rebased onto current mainline.

Bart Van Assche (3):
  bit_spinlock: Fix the __bitlock() definition
  cleanup: Disable context analysis for __free() helpers
  srcu: Remove check from srcu_dereference_check()

 include/linux/bit_spinlock.h |  2 +-
 include/linux/cleanup.h      |  6 ++++--
 include/linux/srcu.h         | 20 +++++++++++++++-----
 3 files changed, 20 insertions(+), 8 deletions(-)

